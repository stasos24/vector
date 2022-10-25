extern crate vrl;
use vrl_stdlib::parse_klog::parse_klog;
use vrl::prelude::value;
use std::str;

    
fn main() {
     use std::io::{self, BufRead};
       let stdin = io::stdin();
         let mut stdin = stdin.lock();
           let buffer = stdin.fill_buf().unwrap();
             let s = match str::from_utf8(buffer) {
                         Ok(v) => v,
                                 Err(e) => return,
                                   }; 
    println!("{:?}",vrl_stdlib::parse_klog::parse_klog(value!(s)));
}
