extern crate chrono;
use chrono::{DateTime, Duration, Utc};

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    let d = Duration::seconds(10i64.pow(9));
    start
        .checked_add_signed(d)
        .expect("could not add a gigasecond")
}
