pub mod route_types;
use axum::{extract::State, response::IntoResponse, http::StatusCode, Json};
use uuid::Uuid;

use crate::types::{AppState, Car};
use self::route_types::{AuthQuery, AuthResponse, GetCarQuery, RegUserQuery, RegCar, UserResponse, GetUserQuery};

pub async fn auth_user(
  State(state): State<AppState>,
  Json(query): Json<AuthQuery>
) -> Result<Json<AuthResponse>, (StatusCode, String)> {
  let access_token = state.db_pool.auth_user(query.phone, query.password).map_err(|e| {
    eprintln!("{:?}", e);
    (StatusCode::BAD_REQUEST, "INVALID CREDINALS".to_string())
  })?;

  Ok(Json(AuthResponse { access_token }))
}

pub async fn get_user(
  State(state): State<AppState>,
  Json(query): Json<GetUserQuery>
) -> Result<Json<UserResponse>, (StatusCode, String)> {
  let info = state.db_pool.get_user(query.phone.clone()).map_err(|e| {
    eprintln!("{:?}", e);
  }).unwrap();

  Ok(Json(info))
}

pub async fn reg_user(
  State(state): State<AppState>,
  Json(query): Json<RegUserQuery>
) -> Result<Json<AuthResponse>, (StatusCode, String)> {
  let access_token = state.db_pool.create_user(
    query.phone,
    query.name,
    query.fam_name,
    query.patronymic,
    query.email,
    query.passport_number,
    query.driver_license,
    query.password
  ).map_err(|_e| {
    (StatusCode::BAD_REQUEST, "User already exist".to_string())
  })?;

  Ok(Json(AuthResponse { access_token }))
}

pub async fn get_car(
  State(state): State<AppState>,
  Json(query): Json<GetCarQuery>
) -> Result<Json<Car>, (StatusCode, String)> {
  if query.car_number.is_some() {
    let car = state.db_pool.get_car(query.car_number.unwrap()).map_err(|_e| {
      (StatusCode::BAD_REQUEST, "Invalid car number".to_string())
    })?;

    return Ok(Json(car))
  } else if query.car_id.is_some() {
    let car = state.db_pool.get_car_by_id(query.car_id.unwrap()).map_err(|_e| {
      (StatusCode::BAD_REQUEST, "Invalid car id".to_string())
    })?;

    return Ok(Json(car));
  }

  Err((StatusCode::BAD_REQUEST, "Please provide CAR_ID or CAR_NUMBER".to_string()))
}


pub async fn reg_car(
  State(state): State<AppState>,
  Json(query): Json<RegCar>
) -> Result<Json<Uuid>, (StatusCode, String)> {
  let car_id =state.db_pool.create_car(
    query.access_token,
    query.owner_id,
    query.number,
    query.car_brand,
    query.body_type,
    query.engine_power_wt,
    query.engine_power_hp,
    query.battery_capacity,
    query.release_year,
    query.body_color,
    query.weight,
    query.photos
  ).map_err(|_e| {
    (StatusCode::BAD_REQUEST, "TOKEN OR CAR NUMBER INCORRECT".to_string())
  })?;

  Ok(Json(car_id))
}

pub async fn index() -> impl IntoResponse {
  (StatusCode::OK, "INDEX ROUTE OF CAR-D")
}