use serde::{Deserialize, Serialize};
use uuid::Uuid;

pub struct AppState {
  
}

#[derive(Serialize, Deserialize)]
pub enum BodyType {
  Hatchback,
  Sedan,
  MUVSUV,
  Coupe,
  Convertible,
  Jeep,
  Van,
}

#[derive(Serialize, Deserialize)]
pub struct SelfData {
  pub email: String,
  pub name: String,
  #[serde(rename="family_name")]
  pub fam_name: String,
  pub patronymic: String,
  pub passport_number: String, // Hash of passport number
  pub driver_license: String,  // Hash of license number
  pub password: String,
}

#[derive(Serialize, Deserialize)]
pub struct User {
  pub user_id: Uuid,
  pub cars: Vec<Car>,
  pub user_self_data: SelfData
}

#[derive(Serialize, Deserialize)]
pub struct Car {
  pub number: String,
  pub car_brand: String,
  pub body_type: BodyType,
  pub engine_power: u32, // IN WT
  pub battery_capacity: u32,
  pub release_year: u16,
  pub photos: (String, String, String, String) // Front, Back, Left, Rigth
}