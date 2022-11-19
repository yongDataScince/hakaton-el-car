use futures::{Stream, TryStreamExt};
use tokio_util::io::StreamReader;
use tokio::{fs::File, io::BufWriter};
use axum::{
  BoxError,
  body::Bytes,
  http::StatusCode
};
use sha2::{Sha256, Digest};

const UPLOADS_DIRECTORY: &str = "uploads";

pub fn hash_string(s: String) -> String {
  let mut password_hasher = Sha256::new();
  password_hasher.update(s);
  
  format!("{:X}", password_hasher.finalize())
}

async fn stream_to_file<S, E>(path: &str, stream: S) -> Result<(), (StatusCode, String)>
where
    S: Stream<Item = Result<Bytes, E>>,
    E: Into<BoxError>,
{
    if !path_is_valid(path) {
        return Err((StatusCode::BAD_REQUEST, "Invalid path".to_owned()));
    }

    async {
        // Convert the stream into an `AsyncRead`.
        let body_with_io_error = stream.map_err(|err| std::io::Error::new(std::io::ErrorKind::Other, err));
        let body_reader = StreamReader::new(body_with_io_error);
        futures::pin_mut!(body_reader);

        // Create the file. `File` implements `AsyncWrite`.
        let path = std::path::Path::new(UPLOADS_DIRECTORY).join(path);
        let mut file = BufWriter::new(File::create(path).await?);

        // Copy the body into the file.
        tokio::io::copy(&mut body_reader, &mut file).await?;

        Ok::<_, std::io::Error>(())
    }
    .await
    .map_err(|err| (StatusCode::INTERNAL_SERVER_ERROR, err.to_string()))
}

fn path_is_valid(path: &str) -> bool {
  let path = std::path::Path::new(path);
  let mut components = path.components().peekable();

  if let Some(first) = components.peek() {
      if !matches!(first, std::path::Component::Normal(_)) {
          return false;
      }
  }

  components.count() == 1
}
