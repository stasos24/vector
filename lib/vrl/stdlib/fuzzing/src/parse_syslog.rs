use std::panic;
use std::panic::catch_unwind;
use std::process;
use std::str;
use syslog_loose::parse_message;
#[macro_use]
extern crate afl;

fn main() {
        fuzz!(|data: &[u8]| {
                    if let Ok(s) = std::str::from_utf8(data) {
                                    panic::set_hook(Box::new(|panic_info| {
                                                        if let Some(location) = panic_info.location() {
                                                                                match location.file() {
                                                                                                            "/usr/local/cargo/registry/src/github.com-1ecc6299db9ec823/chrono-0.4.19/src/date.rs" => {
                                                                                                                                            if location.line() == 84 {
                                                                                                                                                                                return;
                                                                                                                                                                                                            }             
                                                                                                                                                                        else {
                                                                                                                                                                                                            process::abort()
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                }
                                                                                                                                    "/usr/local/cargo/registry/src/github.com-1ecc6299db9ec823/chrono-0.4.19/src/naive/date.rs" => {
                                                                                                                                                                    if location.line() == 569 {
                                                                                                                                                                                                        return;
                                                                                                                                                                                                                                    }   
                                                                                                                                                                                                else if location.line() == 173 {
                                                                                                                                                                                                                                    return;
                                                                                                                                                                                                                                                                }             
                                                                                                                                                                                                                            else {
                                                                                                                                                                                                                                                                process::abort()
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                    }
                                                                                                                                                            "/usr/local/cargo/registry/src/github.com-1ecc6299db9ec823/chrono-0.4.19/src/date.rs" => {
                                                                                                                                                                                            if location.line() == 83 {
                                                                                                                                                                                                                                return;
                                                                                                                                                                                                                                                            }             
                                                                                                                                                                                                                        else {
                                                                                                                                                                                                                                                            process::abort()
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                    "/usr/local/cargo/registry/src/github.com-1ecc6299db9ec823/chrono-0.4.19/src/offset/mod.rs" => {
                                                                                                                                                                                                                    if location.line() == 173 {
                                                                                                                                                                                                                                                        return;
                                                                                                                                                                                                                                                                                    }             
                                                                                                                                                                                                                                                else {
                                                                                                                                                                                                                                                                                    process::abort()
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                            _ => process::abort(),
                                                                                                                                                                                                                                };
                                                                                                }
                                                                    }));

                                                let payload = panic::catch_unwind(|| {
                                                                    parse_message(&s);
                                                                                });
                                                        }
                        });
}

