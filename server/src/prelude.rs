use sha2::{Sha256, Digest};

pub fn hash_string(s: String) -> String {
  let mut password_hasher = Sha256::new();
  password_hasher.update(s);
  
  format!("{:X}", password_hasher.finalize())
}