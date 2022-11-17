extern crate vrl;
use std::str;
use vrl::prelude::*;
use vrl_stdlib::parse_apache_log::parse_apache_log;
#[macro_use]
extern crate afl;

fn main() {
    fuzz!(|data: &[u8]| {
        let s = match str::from_utf8(data) {
            Ok(v) => v,
            Err(e) => return,
        };
        parse_apache_log(value!(s), None, value!("common"), None);
    })
}
