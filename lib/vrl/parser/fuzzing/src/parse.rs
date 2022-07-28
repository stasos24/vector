#[macro_use]
extern crate afl;
use std::panic;
use std::panic::catch_unwind;
use std::process;
fn main() {
 fuzz!(|data: &[u8]| {
        if let Ok(s) = std::str::from_utf8(data) {
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
     

        }});
}
