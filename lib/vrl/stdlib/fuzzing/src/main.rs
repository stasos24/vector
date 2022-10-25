extern crate vrl;
use vrl_stdlib::parse_syslog::parse_syslog; 
use vrl::prelude::value;
use std::str;
//use chrono::{Local, DateTime, TimeZone};
use vector_common::TimeZone;

fn main() {
     use std::io::{self, BufRead};
       let stdin = io::stdin();
         let mut stdin = stdin.lock();
           let buffer = stdin.fill_buf().unwrap();
             let s = match str::from_utf8(buffer) {
                         Ok(v) => v,
                                 Err(e) => return,
                                   };  

    let dt= vector_common::TimeZone::default();
    println!("{:?}",parse_syslog(value!(s),&dt));
}
