use dnsmsg_parser::dns_message_parser::DnsMessageParser;
use std::str::FromStr;
use std::str;
use std::panic;
use std::process;

fn main() {
   use std::io::{self, BufRead};
     let stdin = io::stdin();
       let mut stdin = stdin.lock();
         let buffer = stdin.fill_buf().unwrap();
         
   if let Ok(s) = std::str::from_utf8(buffer) {
            panic::set_hook(Box::new(|panic_info| {
                if let Some(location) = panic_info.location() {
                    match location.file() {
                        "/opt/fuzz/vector/lib/dnsmsg-parser/src/dns_message_parser.rs" => {
                            if location.line() == 230 {
                                return;
                            } else {
                                process::abort()
                            }
                        }
                        _ => process::abort(),
                    };
                }
            }));
            let raw_query_message = s.as_bytes().to_vec();
            let raw_update_message = s.as_bytes().to_vec();

            let payload = panic::catch_unwind(|| {
                let parse_query = DnsMessageParser::new(raw_query_message).parse_as_query_message();
                let parse_update =
                    DnsMessageParser::new(raw_update_message).parse_as_update_message();
            });
        }
 
}
