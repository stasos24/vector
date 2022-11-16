extern crate vrl;
use std::panic;
use std::panic::catch_unwind;
use std::process;
use std::str;
use vrl::prelude::value;
use vrl_stdlib::parse_xml::parse_xml;
use vrl_stdlib::parse_xml::ParseOptions;
#[macro_use]
extern crate afl;

fn main() {
    fuzz!(|data: &[u8]| {
        if let Ok(s) = std::str::from_utf8(data) {
            panic::set_hook(Box::new(|panic_info| {
                if let Some(location) = panic_info.location() {
                    match location.file() {
                        "/opt/app/vector/lib/vrl/stdlib/src/parse_xml.rs" => {
                            if location.line() == 301 {
                                return;
                            } else if location.line() == 373 {
                                return;
                            } else {
                                process::abort()
                            }
                        }
                        _ => process::abort(),
                    };
                }
            }));

            let options = ParseOptions {
                trim: None,
                include_attr: None,
                attr_prefix: None,
                text_key: None,
                always_use_text_key: None,
                parse_bool: None,
                parse_null: None,
                parse_number: None,
            };
            let payload = panic::catch_unwind(|| {
                parse_xml(value!(s), options);
            });
        }
    });
}
