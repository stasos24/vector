use vrl_stdlib::parse_json::parse_json;
extern crate vrl;
use vrl_compiler::value;
fn main() {
   let bytes:vrl::value::value::Value = true; 
    vrl_stdlib::parse_json::parse_json(bytes);
}
