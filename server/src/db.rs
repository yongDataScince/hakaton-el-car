use std::str::FromStr;

use sqlite::{Connection, State};
use uuid::Uuid;

use crate::{
  prelude::*,
  types::{Car, BodyType},
  errors::DBError
};

pub struct DataBase {
  pub connection: Connection
}

impl DataBase {
  pub fn new(file_path: &str) -> Result<DataBase, DBError> {
    let connection = sqlite::open(file_path).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    connection.execute(
      "
        CREATE TABLE IF NOT EXISTS cars (
          id TEXT NOT NULL UNIQUE,
          owner_id TEXT NOT NULL,
          car_number TEXT NOT NULL UNIQUE,
          car_brand TEXT NOT NULL,
          body_type TEXT NOT NULL,
          engine_power_wt INTEGER NOT NULL,
          engine_power_hp INTEGER NOT NULL,
          battery_capacity INTEGER NOT NULL,
          release_year INTEGER NOT NULL,
          body_color TEXT NOT NULL,
          weight INTEGER NOT NULL,
          front_photo TEXT NOT NULL,
          back_photo TEXT NOT NULL,
          left_photo TEXT NOT NULL,
          right_photo TEXT NOT NULL
        );
      "
    ).map_err(|e| {
      eprintln!("DB ERROR CREATE TABLE `car`: {e}");
      DBError::TableCreation
    })?;

    connection.execute(
      "
        CREATE TABLE IF NOT EXISTS users (
          id TEXT NOT NULL UNIQUE,
          car_ids TEXT,
          email TEXT,
          name TEXT,
          family_name TEXT,
          patronymic TEXT,
          passport_number TEXT,
          driver_license TEXT,
          password TEXT,
          access_token TEXT
        );
      "
    ).map_err(|e| {
      eprintln!("DB ERROR CREATE TABLE `users`: {e}");
      DBError::TableCreation
    })?;

    Ok(DataBase { connection })
  }

  pub fn create_user(&self, name: String, fam_name: String, patronymic: String, email: String, passport_number: String, driver_license: String, password: String) -> Result<Uuid, DBError> {

    let user_id = Uuid::new_v4();

    let password = hash_string(password);
    let passport_number = hash_string(passport_number);
    let driver_license = hash_string(driver_license);
    let access_token = hash_string(format!("{password}{}", user_id.to_string()));

    let mut query = self.connection.prepare("
      INSERT INTO users (
        id, car_ids, email, name, family_name, patronymic, passport_number, driver_license, password, access_token
      ) VALUES (
        ?1, '[]', ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9
      );
    ").map_err(|e| {
      eprintln!("DB ERROR CREATE USER: {e}");
      DBError::UserCreation
    })?;

    query.bind(1, user_id.to_string().as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(2, email.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(3, name.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(4, fam_name.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(5, patronymic.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(6, passport_number.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(7, driver_license.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(8, password.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(9, access_token.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;

    query.next().map_err(|e| {
      eprintln!("DB ERROR NEXT: {e}");
      DBError::UserCreation
    })?;
    

    Ok(user_id.clone())
  }

  pub fn auth_user(&self, passport_number: String, password: String) -> Result<String, DBError> {
    let hashed_passport_number = hash_string(passport_number.clone());
    let hashed_password = hash_string(password);


    let mut query = self.connection.prepare("
      SELECT (password, access_token) FROM FROM users WHERE passport_number = ?;
    ").map_err(|e| {
      eprintln!("DB ERROR AUTH USER: {e}");
      DBError::AuthUser
    })?;

    
    query.bind(1, hashed_passport_number.as_str()).map_err(|e| {
      eprintln!("DB ERROR AUTH BIND: {e}");
      DBError::AuthUser
    })?;

    if let State::Row = query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA AUTH: {e}");
      DBError::AuthUser
    })? {
      let password = query.read::<String>(1).map_err(|e| {
        eprintln!("DB ERROR GET DATA ROW AUTH: {e}");
        DBError::AuthUser
      })?;

      if password != hashed_password {
        return Err(DBError::IncorrectPassword);
      }
  
      let access_token = query.read::<String>(2).map_err(|e| {
        eprintln!("DB ERROR GET DATA ROW AUTH: {e}");
        DBError::AuthUser
      })?;

      return Ok(access_token);
    } else {
      return Err(DBError::AuthUser);
    }
  }

  pub fn get_car(&self, car_id: Uuid) -> Result<Car, DBError> {

    let mut query = self.connection.prepare(
      "
        SELECT * FROM FROM cars WHERE id = ?;
      "
    ).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;

    let s_id: &str = &car_id.to_string();
    query.bind(1, s_id).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;
    
    if let State::Row = query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })? {
      let id =  query.read::<String>(1).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_owner_id =  query.read::<String>(2).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_number =  query.read::<String>(3).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_brand =  query.read::<String>(4).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let body_type: BodyType =  query.read::<String>(5).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.into();

      let engine_power_wt = query.read::<String>(6).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let engine_power_hp = query.read::<String>(7).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let battery_capacity = query.read::<String>(8).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let release_year = query.read::<String>(9).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u16>().unwrap();

      let body_color = query.read::<String>(10).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let weight = query.read::<String>(11).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u16>().unwrap();

      let front_photo = query.read::<String>(12).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let back_photo = query.read::<String>(12).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let left_photo = query.read::<String>(12).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let right_photo = query.read::<String>(12).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      return Ok(Car {
        id: Uuid::from_str(&id).unwrap(),
        owner_id: Uuid::from_str(&car_owner_id).unwrap(),
        number: car_number,
        car_brand,
        body_type,
        engine_power_wt,
        engine_power_hp,
        battery_capacity,
        release_year,
        body_color,
        weight,
        photos: (front_photo, back_photo, left_photo, right_photo),
      });
    } else {
      return Err(DBError::GetUsers);
    }
  }
}