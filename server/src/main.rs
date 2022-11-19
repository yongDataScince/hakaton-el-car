pub mod types;
pub mod routes;
pub mod db;
pub mod prelude;
pub mod errors;

use std::time::Duration;

use axum::{Router, routing::{post, get}, Server, middleware::{self, Next}, http::{Request, Response, StatusCode}, body::{Body, Bytes}, response::IntoResponse};
use db::DataBase;
use tower_http::trace::TraceLayer;
use tracing::Span;
use types::AppState;
use routes::*;


#[tokio::main]
async fn main() {
    let db_pool = DataBase::new("./cars.db").unwrap();
    let addr  = std::net::SocketAddr::from(([10, 1, 1, 200], 3000));
    let state = AppState {
        db_pool,
    };

    let router: Router<AppState> = Router::new();

    let app = router
        .route("/", get(index))
        .route("/v1/auth-user", post(auth_user))
        .route("/v1/get-user", get(get_user))
        .route("/v1/reg-user", post(reg_user))
        .route("/v1/get-car", get(get_car))
        .route("/v1/reg-car", post(reg_car))
        .route("/v1/admin/remove-car", post(remove_car))
        .route("/v1/check-pts", post(check_pts))
        .layer(middleware::from_fn(print_request_response))
        .layer(TraceLayer::new_for_http() 
            .make_span_with(|_request: &Request<Body>| {
                tracing::debug_span!("http-request")
            })    
            .on_request(|_request: &Request<Body>, _span: &tracing::Span| {
                println!("\nREQUEST:\n  URI: {:#?}\n  HEADERS: {:?}", _request.uri(), _request.headers());
            })
            .on_response(|response: &Response<_>, _latency: Duration, _span: &Span| {
                println!("RESPONSE {:#?}", response)
            })
        )
        .with_state(state);
    
    println!("LISTEN ON: http://{addr}");
    
    let _ = Server::bind(&addr).serve(app.into_make_service()).await.map_err(|e| eprintln!("{e}"));
}

async fn print_request_response(
    req: Request<Body>,
    next: Next<Body>,
) -> Result<impl IntoResponse, (StatusCode, String)> {
    let (parts, body) = req.into_parts();
    let bytes = buffer_and_print("request", body).await?;
    let req = Request::from_parts(parts, Body::from(bytes));

    let res = next.run(req).await;

    let (parts, body) = res.into_parts();
    let bytes = buffer_and_print("response", body).await?;
    let res = Response::from_parts(parts, Body::from(bytes));

    Ok(res)
}

async fn buffer_and_print<B>(direction: &str, body: B) -> Result<Bytes, (StatusCode, String)>
where
    B: axum::body::HttpBody<Data = Bytes>,
    B::Error: std::fmt::Display,
{
    let bytes = match hyper::body::to_bytes(body).await {
        Ok(bytes) => bytes,
        Err(err) => {
            eprintln!("FAILED TO READ {direction} BODY: {err}");
            return Err((
                StatusCode::BAD_REQUEST,
                format!("failed to read {} body: {}", direction, err),
            ));
        }
    };

    match std::str::from_utf8(&bytes) {
        Ok(body) => {
            if body != "" {
                let body = body.replace('{', "{\n").replace('}', "\n}").replace(',', ",\n");
                print!("\nDIRECTION = {direction}");
                println!("\nBODY = {body}");
            }
        },
        Err(e) => {
            print!("\nDIRECTION = {direction}");
            eprintln!("\nERROR ={e}");
        }
    }

    Ok(bytes)
}
