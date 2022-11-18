pub mod types;
pub mod routes;
pub mod db;
pub mod prelude;
pub mod errors;

use axum::{Router, routing::{post, get}, Server};
use db::DataBase;
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
        .with_state(state);
    
    println!("LISTEN ON: http://{addr}");
    
    let _ = Server::bind(&addr).serve(app.into_make_service()).await.map_err(|e| eprintln!("{e}"));
}
