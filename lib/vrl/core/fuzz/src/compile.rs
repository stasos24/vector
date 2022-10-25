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
                    match location.file() {
                        "/opt/app/vector/lib/vrl/parser/src/lex.rs" => {
                            if location.line() == 1266 {
                                return;
                            } else {
                                process::abort()
                            }
                        }
                        "/opt/app/vector/lib/vrl/compiler/src/expression/assignment.rs" => {
                            if location.line() == 250 {
                                return;
                            } else if location.line() == 253 {
                                return;
                            } else if location.line() == 259 {
                                return;
                            } else {
                                process::abort()
                            }
                        }
                        "library/core/src/str/mod.rs" => {
                            if location.line() == 111 {
                                return;
                            } else {
                                process::abort()
                            }
                        } 
                        _ => process::abort(),
                    };
                }
            }));
            
            if s.contains("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            {
                return;
            }
            let payload = panic::catch_unwind(|| {
                vrl::compile(s, &vrl_stdlib::all());
            });
        }
    });
}
