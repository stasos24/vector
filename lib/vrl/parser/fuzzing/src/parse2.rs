#[macro_use]
extern crate afl;
use std::panic;
use std::panic::catch_unwind;
use std::process;

fn main() {

 fuzz!(|data: &[u8]| {
        if let Ok(s) = std::str::from_utf8(data) {
        std::panic::set_hook(Box::new(|pi| {
    
}));
let payload=panic::catch_unwind(|| {
    vrl_parser::parse(&s);
});
println!("{:?}" , payload);
let msg = panic_message::panic_message(&payload);
let x = Some("not implemented: invalid escape");
assert_ne!("not implemented: invalid escape",x);
        }
    });
}
