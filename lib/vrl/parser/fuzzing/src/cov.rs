use std::process;
use std::str::FromStr;
use std::str;
use std::panic;
use std::panic::catch_unwind;

fn main() {
  panic::set_hook(Box::new(|_info| {
        // do nothing
    }));
  use std::io::{self, BufRead};
  let stdin = io::stdin();
  let mut stdin = stdin.lock();
  let buffer = stdin.fill_buf().unwrap();
 if let Ok(s) = std::str::from_utf8(buffer) {
         panic::set_hook(Box::new(|panic_info| {
                     if let Some(location) = panic_info.location() {
                                     match location.file () {
                                                     "/opt/fuzz/vector/lib/vrl/parser/src/lex.rs" => if location.line() == 1266{ return} else {process::abort()},
                                                                 "library/core/src/str/mod.rs" => if location.line() == 111 {return} else {process::abort()},
                                                                             _ => process::abort(),
                                                                                         };
                                                 println!("panic occurred in file '{}' at line {}",location.file(),location.line());
                                                         }
                         }));

         let payload = panic::catch_unwind(|| {
                 vrl_parser::parse(&s);
         });


}
}
