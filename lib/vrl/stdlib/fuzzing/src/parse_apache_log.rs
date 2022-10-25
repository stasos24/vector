extern crate vrl;
use vrl_stdlib::parse_apache_log::parse_apache_log;
use vrl::prelude::*;
use std::str;
#[macro_use]
extern crate afl;
    
fn main() {
            fuzz!(|data: &[u8]| {
             let s = match str::from_utf8(data) {
                         Ok(v) => v,
                                 Err(e) => return,
                                   }; 
    parse_apache_log(value!(s),None, "common", None);
            
            })
}
