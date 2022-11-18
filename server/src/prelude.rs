use sha2::{Sha256, Digest};

pub fn hash_string(s: String) -> String {
  let mut password_hasher = Sha256::new();
  password_hasher.update(s);
  let v: &[u8] = &password_hasher.finalize().to_vec();
  let result = String::from_utf8_lossy(v);
  
  result.to_string()
}