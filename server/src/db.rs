use std::str::FromStr;

use sqlite::State;
use uuid::Uuid;

use crate::{
  prelude::*,
  types::{Car, BodyType, Role},
  errors::DBError, routes::route_types::UserResponse
};

#[derive(Clone)]
pub struct DataBase {
  pub db_path: String
}

impl DataBase {
  pub fn new(file_path: &str) -> Result<DataBase, DBError> {
    let connection = sqlite::open(file_path.clone()).map_err(|e| {
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
          phone TEXT NOT NULL UNIQUE,
          role TEXT NOT NULL,
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

    Ok(DataBase { db_path: file_path.to_string() })
  }

  pub fn create_user(&self, phone: String, role: Role, name: String, fam_name: String, patronymic: String, email: String, passport_number: String, driver_license: String, password: String) -> Result<String, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let user_id = Uuid::new_v4();

    let password = hash_string(password);

    let passport_number = hash_string(passport_number);
    let driver_license = hash_string(driver_license);
    let access_token = hash_string(format!("{password}{}", user_id.to_string()));

    let mut query = connection.prepare("
      INSERT INTO users (
        id, phone, role, car_ids, email, name, family_name, patronymic, passport_number, driver_license, password, access_token
      ) VALUES (
        ?1, ?2, ?3, '[]', ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11
      );
    ").map_err(|e| {
      eprintln!("DB ERROR CREATE USER: {e}");
      DBError::UserCreation
    })?;

    query.bind(1, user_id.to_string().as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(2, phone.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(3, role.to_string().as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(4, email.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(5, name.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(6, fam_name.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(7, patronymic.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(8, passport_number.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(9, driver_license.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(10, password.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;
    query.bind(11, access_token.as_str()).map_err(|e| {
      eprintln!("DB ERROR CREATE USER BIND: {e}");
      DBError::UserCreation
    })?;

    query.next().map_err(|e| {
      eprintln!("DB ERROR NEXT: {e}");
      DBError::UserCreation
    })?;
    

    Ok(access_token.clone())
  }

  pub fn auth_user(&self, phone: String, password: String) -> Result<String, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;
    let hashed_password = hash_string(password);


    let mut query = connection.prepare("
      SELECT password, access_token FROM users WHERE phone = ?;
    ").map_err(|e| {
      eprintln!("DB ERROR AUTH USER: {e}");
      DBError::AuthUser
    })?;

    
    query.bind(1, phone.as_str()).map_err(|e| {
      eprintln!("DB ERROR AUTH BIND: {e}");
      DBError::AuthUser
    })?;

    if let State::Row = query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA AUTH: {e}");
      DBError::AuthUser
    })? {
      let password = query.read::<String>(0).map_err(|e| {
        eprintln!("DB ERROR GET DATA ROW AUTH: {e}");
        DBError::AuthUser
      })?;

      let access_token = query.read::<String>(1).map_err(|e| {
        eprintln!("DB ERROR GET DATA ROW AUTH: {e}");
        DBError::AuthUser
      })?;

      if password != hashed_password {
        return Err(DBError::IncorrectPassword);
      }
  

      return Ok(access_token);
    } else {
      return Err(DBError::AuthUser);
    }
  }

  pub fn get_car(&self, car_number: String) -> Result<Car, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let mut query = connection.prepare(
      "
        SELECT * FROM cars WHERE car_number = ?;
      "
    ).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;

    query.bind(1, car_number.as_str()).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;
    
    if let State::Row = query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })? {
      let id =  query.read::<String>(0).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_owner_id =  query.read::<String>(1).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_number =  query.read::<String>(2).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_brand =  query.read::<String>(3).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let body_type: BodyType =  query.read::<String>(4).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.into();

      let engine_power_wt = query.read::<String>(5).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let engine_power_hp = query.read::<String>(6).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let battery_capacity = query.read::<String>(7).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let release_year = query.read::<String>(8).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u16>().unwrap();

      let body_color = query.read::<String>(9).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let weight = query.read::<String>(10).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u16>().unwrap();

      let front_photo = query.read::<String>(11).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let back_photo = query.read::<String>(12).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let left_photo = query.read::<String>(13).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let right_photo = query.read::<String>(14).map_err(|e| {
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

  pub fn get_user(&self, phone: String) -> Result<UserResponse, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let mut query = connection.prepare(
      "
        SELECT id, car_ids FROM users WHERE phone = ?;
      "
    ).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;

    query.bind(1, phone.as_str()).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;
    
    if let State::Row = query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })? {
      let id = query.read::<String>(0).map_err(|e| {
        eprintln!("ERROR IN GET USER ID: {e}");
        DBError::GetUsers
      })?;

      let cars_ids = query.read::<String>(1).map_err(|e| {
        eprintln!("ERROR IN GET USER ID: {e}");
        DBError::GetUsers
      })?;

      let mut cars_ids_vec: Vec<Uuid> = Vec::new();
  
      if cars_ids != "[]" {
        cars_ids_vec = cars_ids
          .replace("[", "")
          .replace("]", "")
          .split(", ").map(|s| {
            let id = Uuid::from_str(s).unwrap();
            id
          }).collect();
      } else {
        cars_ids_vec = Vec::new();
      }

      return Ok(UserResponse { id: Uuid::from_str(id.as_str()).unwrap(), phone: phone, cars_ids: cars_ids_vec });
    } else {
      return Err(DBError::GetUsers)
    }
  }

  pub fn create_car(
    &self,
    access_token: String,
    owner_id: Uuid,
    number: String,
    car_brand: String,
    body_type: BodyType,
    engine_power_wt: u32,
    engine_power_hp: u32,
    battery_capacity: u32,
    release_year: u16,
    body_color: String,
    weight: u16,
    photos: (String, String, String, String)
  ) -> Result<Uuid, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let mut get_user_query = connection.prepare(
      "
        SELECT (access_token) FROM users WHERE id = ?;
      "
    ).map_err(|e| {
      eprintln!("ERROR IN GET USER: {e}");
      DBError::GetUsers
    })?;

    get_user_query.bind(1, owner_id.to_string().as_str()).map_err(|e| {
      eprintln!("ERROR IN GET USER(BIND): {e}");
      DBError::GetUsers
    })?;

    if let State::Row = get_user_query.next().map_err(|e| {
      eprintln!("ERROR IN NEXT GET USER: {e}");
      DBError::GetUsers
    })? {
      let db_access_token = get_user_query.read::<String>(0).map_err(|e| {
        eprintln!("ERROR IN GET ACCESS TOKEN: {e}");
        DBError::AuthUser
      })?;

      if db_access_token != access_token {
        return Err(DBError::AuthUser);
      } else {
        let mut insert_car_query = connection.prepare(
          "
            INSERT INTO cars (
              id,
              owner_id,
              car_number,
              car_brand,
              body_type,
              engine_power_wt,
              engine_power_hp,
              battery_capacity,
              release_year,
              body_color,
              weight,
              front_photo,
              back_photo,
              left_photo,
              right_photo
            ) VALUES (
              ?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13, ?14, ?15
            );
          "
        ).map_err(|e| {
          eprintln!("ERROR IN INSERT CAR: {e}");
          DBError::CarCreation
        })?;

        let car_id = Uuid::new_v4();

        insert_car_query.bind(1, car_id.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(2, owner_id.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(3, number.as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(4, car_brand.as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(5, body_type.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(6, engine_power_wt.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(7, engine_power_hp.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(8, battery_capacity.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(9, release_year.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(10, body_color.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(11, weight.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(12, photos.0.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(13, photos.1.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(14, photos.2.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.bind(15, photos.3.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN SET VALUE ID: {e}");
          DBError::CarCreation
        })?;

        insert_car_query.next().map_err(|e| {
          eprintln!("ERROR IN INSERT CAR(NEXT): {e}");
          DBError::CarCreation
        })?;


        let mut car_ids_query = connection.prepare("SELECT (car_ids) FROM users WHERE id = ?").map_err(|e| {
          eprintln!("ERROR IN GET CARS IDS: {e}");
          DBError::CarCreation
        })?;

        car_ids_query.bind(1, owner_id.to_string().as_str()).map_err(|e| {
          eprintln!("ERROR IN BIND GET CARS IDS: {e}");
          DBError::CarCreation 
        })?;


        if let State::Row = car_ids_query.next().map_err(|e| {
          eprintln!("ERROR IN NEXT GET USER: {e}");
          DBError::GetUsers
        })? {
          let car_ids = car_ids_query.read::<String>(0).map_err(|e| {
            eprintln!("ERROR IN GET CAR_IDS: {e}");
            DBError::GetUsers
          })?;

          let mut new_car_ids: String = String::new();

          if car_ids == "[]" {
            let new_value = format!("{}]", car_id.to_string());
            new_car_ids = car_ids.replace("]", new_value.as_str());
          } else {
            let new_value = format!(", {}]", car_id.to_string());
            new_car_ids = car_ids.replace("]", new_value.as_str());
          }
          let mut ins_query = connection.prepare("UPDATE users SET car_ids = ?1 WHERE id = ?2;").map_err(|e| {
              eprintln!("ERROR IN INSERT NEW_IDS: {e}");
              DBError::IdsInsertion
          })?;

          ins_query.bind(1, new_car_ids.as_str()).map_err(|e| {
            eprintln!("ERROR IN INSERTION NEW_IDS: {e}");
            DBError::IdsInsertion
          })?;

          ins_query.bind(2, owner_id.to_string().as_str()).map_err(|e| {
            eprintln!("ERROR IN INSERTION NEW_IDS: {e}");
            DBError::IdsInsertion
          })?;

          ins_query.next().map_err(|e| {
            eprintln!("ERROR IN INSERTION NEW_IDS(NEXT): {e}");
            DBError::IdsInsertion
          })?;

          return Ok(car_id);
        } else {
          return Err(DBError::AuthUser);
        }
      }
    } else {
      Err(DBError::GetUsers)
    }
  }

  pub fn get_car_by_id(&self, car_id: Uuid) -> Result<Car, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let mut query = connection.prepare(
      "
        SELECT * FROM cars WHERE id = ?;
      "
    ).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;

    query.bind(1, car_id.to_string().as_str()).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;
    
    if let State::Row = query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })? {
      let id =  query.read::<String>(0).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_owner_id =  query.read::<String>(1).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_number =  query.read::<String>(2).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let car_brand =  query.read::<String>(3).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let body_type: BodyType =  query.read::<String>(4).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.into();

      let engine_power_wt = query.read::<String>(5).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let engine_power_hp = query.read::<String>(6).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let battery_capacity = query.read::<String>(7).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u32>().unwrap();

      let release_year = query.read::<String>(8).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u16>().unwrap();

      let body_color = query.read::<String>(9).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let weight = query.read::<String>(10).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?.parse::<u16>().unwrap();

      let front_photo = query.read::<String>(11).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let back_photo = query.read::<String>(12).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let left_photo = query.read::<String>(13).map_err(|e| {
        eprintln!("DB ERROR GET DATA: {e}");
        DBError::GetUsers
      })?;

      let right_photo = query.read::<String>(14).map_err(|e| {
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

  pub fn check_access_token(&self, phone: String, access_token: String) -> Result<bool, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let mut query = connection.prepare("SELECT access_token FROM users WHERE phone = ?;").map_err(|e| {
      eprintln!("ERROR IN GET USER: {e}");
      DBError::AuthUser
    })?;

    query.bind(1, phone.as_str()).map_err(|e| {
      eprintln!("ERROR IN BIND: {e}");
      DBError::GetUsers
    })?;

    if let State::Row = query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })? {
      let db_access_token = query.read::<String>(0).map_err(|e| {
        eprintln!("ERROR IN GET ACC_TOKEN: {e}");
        DBError::GetUsers
      })?;

      return Ok(db_access_token == access_token);
    } else {
      return Err(DBError::AuthUser);
    }
  }

  pub fn remove_car_by_id(&self, car_id: Uuid, access_token: String) -> Result<bool, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let mut owner_id_query = connection.prepare("SELECT id FROM users WHERE access_token = ?;").unwrap();

    owner_id_query.bind(1, access_token.as_str()).unwrap();

    let mut owner_id: String = String::new();

    if let State::Row = owner_id_query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })? {
      owner_id = owner_id_query.read::<String>(0).unwrap();
    }

    let car = self.get_car_by_id(car_id.clone())?;
    if car.owner_id.to_string() != owner_id {
      return Err(DBError::AuthUser);
    }

    let mut query = connection.prepare(
      "
        DELETE FROM cars WHERE id = ?;
      "
    ).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;

    query.bind(1, car_id.to_string().as_str()).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;
    
    match  query.next() {
      Ok(_) => {
        let mut get_user_cars_query = connection.prepare(
          "SELECT car_ids FROM users WHERE id = ?;"
        ).map_err(|e| {
          eprintln!("ERROR IN GET USER CARS: {e}");
          DBError::GetUsers
        })?;
  
        get_user_cars_query.bind(1, owner_id.as_str()).unwrap();
  
        let mut car_ids: String = String::new();
  
        match  get_user_cars_query.next() {
            Ok(_) => {
              car_ids = get_user_cars_query.read::<String>(0).unwrap();

              if car_ids == "[]" {
                let format_id = format!("{car_id}");
                car_ids = car_ids.clone().replace(format_id.as_str(), "");
              } else {
                let format_id = format!(", {car_id}");
                car_ids = car_ids.clone().replace(format_id.as_str(), "");
              }
        
              let mut ins_query = connection.prepare("UPDATE users SET car_ids = ?1 WHERE id = ?2;").map_err(|e| {
                eprintln!("ERROR IN INSERT NEW_IDS: {e}");
                DBError::IdsInsertion
              })?;

              println!("{car_ids}");

              ins_query.bind(1, car_ids.as_str()).unwrap();
              ins_query.bind(2, owner_id.as_str()).unwrap();
        
              ins_query.next().unwrap();
        
              Ok(true)
            },
            Err(e) => {
              eprintln!("ERROR: {e}");
              return Err(DBError::GetUsers);
            }
          }
      }
      Err(e) => {
        println!("ERROR HERE: {e}");
        return Err(DBError::GetUsers);
      }
    }
  }

  pub fn remove_car_by_number(&self, car_number: String, access_token: String) -> Result<bool, DBError> {
    let connection = sqlite::open(self.db_path.clone()).map_err(|e| {
      eprintln!("DB ERROR CONNECTION: {e}");
      DBError::ConnectionError
    })?;

    let mut owner_id_query = connection.prepare("SELECT id FROM users WHERE access_token = ?;").unwrap();

    owner_id_query.bind(1, access_token.as_str()).unwrap();

    let mut owner_id: String = String::new();

    if let State::Row = owner_id_query.next().map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })? {
      owner_id = owner_id_query.read::<String>(0).unwrap();
    }

    let car = self.get_car(car_number.clone())?;
    if car.owner_id.to_string() != owner_id {
      return Err(DBError::AuthUser);
    }

    let car_id = self.get_car(car_number.clone())?.id;

    let mut query = connection.prepare(
      "
        DELETE FROM cars WHERE car_number = ?;
      "
    ).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;

    query.bind(1, car_number.as_str()).map_err(|e| {
      eprintln!("DB ERROR GET DATA: {e}");
      DBError::GetUsers
    })?;
    
    match  query.next() {
      Ok(_) => {
        let mut get_user_cars_query = connection.prepare(
          "SELECT car_ids FROM users WHERE id = ?;"
        ).map_err(|e| {
          eprintln!("ERROR IN GET USER CARS: {e}");
          DBError::GetUsers
        })?;
  
        get_user_cars_query.bind(1, owner_id.as_str()).unwrap();
    
        match  get_user_cars_query.next() {
            Ok(_) => {
              let mut car_ids = get_user_cars_query.read::<String>(0).unwrap();
          
              if car_ids == format!("[{car_id}]") {
                let format_id = format!("[{car_id}]");
                car_ids = car_ids.clone().replace(format_id.as_str(), "[]");
              } else {
                let format_id = format!(", {car_id}");
                car_ids = car_ids.clone().replace(format_id.as_str(), "");
              }
        
              let mut ins_query = connection.prepare("UPDATE users SET car_ids = ?1 WHERE id = ?2;").map_err(|e| {
                eprintln!("ERROR IN INSERT NEW_IDS: {e}");
                DBError::IdsInsertion
              })?;

              println!("{car_ids}");
        
              ins_query.bind(1, car_ids.as_str()).unwrap();
              ins_query.bind(2, owner_id.as_str()).unwrap();
        
              ins_query.next().unwrap();
        
              Ok(true)
            },
            Err(e) => {
              eprintln!("ERROR: {e}");
              return Err(DBError::GetUsers);
            }
          }
      }
      Err(e) => {
        println!("ERROR HERE: {e}");
        return Err(DBError::GetUsers);
      }
    }
  }

}
