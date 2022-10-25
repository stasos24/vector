extern crate vrl;
use vrl_stdlib::parse_csv::parse_csv;
use vrl::prelude::value;
use std::str;
#[macro_use]
extern crate afl;
    
fn main() {
            fuzz!(|data: &[u8]| {
             let s = match str::from_utf8(data) {
                         Ok(v) => v,
                                 Err(e) => return,
                                   }; 
    parse_csv(value!(s),value!(","));
            
            })
}
