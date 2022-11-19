use serde::{Serialize, Deserialize};
use uuid::Uuid;

use crate::types::BodyType;

#[derive(Serialize, Deserialize, Debug)]
pub struct GetUserQuery {
  pub phone: String
}

#[derive(Serialize, Deserialize, Debug)]
pub struct UserResponse {
  pub id: Uuid,
  pub phone: String,
  pub cars_ids: Vec<Uuid>
}

#[derive(Serialize, Deserialize, Debug)]
pub struct AuthResponse {
  pub access_token: String
}

#[derive(Serialize, Deserialize, Debug)]
pub struct AuthQuery {
  pub phone: String,
  pub password: String,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct RegCar {
  pub access_token: String,
  pub owner_id: Uuid,
  pub number: String,
  pub car_brand: String,
  pub body_type: BodyType,
  pub engine_power_wt: u32,
  pub engine_power_hp: u32,
  pub battery_capacity: u32,
  pub release_year: u16,
  pub body_color: String,
  pub weight: u16,
  pub photos: (String, String, String, String)
}

#[derive(Serialize, Deserialize, Debug)]
pub struct GetCarQuery {
  #[serde(skip_serializing_if="Option::is_none")]
  pub car_number: Option<String>,
  #[serde(skip_serializing_if="Option::is_none")]
  pub car_id: Option<Uuid>,
}

#[derive(Serialize, Deserialize, Debug)]
pub struct RegUserQuery {
  pub name: String,
  pub fam_name: String,
  pub email: String,
  pub patronymic: String,
  pub passport_number: String,
  pub phone: String,
  pub driver_license: String,
  pub password: String
}