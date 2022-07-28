use std::process;
use std::str::FromStr;
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
  vrl::compile(s, &vrl_stdlib::all());
}

