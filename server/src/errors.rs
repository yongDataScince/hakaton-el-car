#[derive(Debug)]
pub enum DBError {
  ConnectionError,
  TableCreation,
  GetUsers,
  UserCreation,
  AuthUser,
  IncorrectPassword
}