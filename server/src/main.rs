use db::DataBase;

pub mod types;
pub mod db;
pub mod prelude;
pub mod errors;

#[tokio::main]
async fn main() {
    let db = DataBase::new("./cars.db").unwrap();

    let res = db.create_user("name".to_owned(), "fam_name".to_owned(), "patronymic".to_owned(), "email".to_owned(), "passport_number".to_owned(), "driver_license".to_owned(), "password".to_owned()).unwrap();

    println!("{}", res.to_string());
}
