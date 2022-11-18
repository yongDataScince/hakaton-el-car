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
  pub id: Uuid,
  pub owner_id: Uuid,
  pub number: String,
  pub car_brand: String,
  pub body_type: BodyType,
  pub engine_power_wt: u32, // IN WT
  pub engine_power_hp: u32, // IN HP
  pub battery_capacity: u32,
  pub release_year: u16,
  pub body_color: String,
  pub weight: u16,
  pub photos: (String, String, String, String) // Front, Back, Left, Rigth
}

impl From<String> for BodyType {
    fn from(s: String) -> BodyType {
      use BodyType::*;
      match s.as_str() {
        "Hatchback"  => Hatchback,
        "Sedan" => Sedan,
        "MUVSUV" => MUVSUV,
        "Coupe" => Coupe,
        "Convertible" => Convertible,
        "Jeep" => Jeep,
        "Van" => Van,
        _ => panic!("Unexpected body type")
      }
    }
}