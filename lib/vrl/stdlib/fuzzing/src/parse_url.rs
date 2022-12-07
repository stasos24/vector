use std::str;
extern crate url;
use vrl::prelude::value;
#[macro_use]
extern crate afl;

fn main() {
    fuzz!(|data: &[u8]| {
        let s = match str::from_utf8(data) {
            Ok(v) => v,
            Err(e) => return,
        };
         url::Url::parse(&s);
    })
}
