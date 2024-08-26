use chrono::prelude::*;

use lambda_runtime::{service_fn, LambdaEvent, Error};
use serde_json::{json, Value};
use chrono::prelude::*;

fn get_current_time() -> String {
    let now = Utc::now();
    now.format("%Y-%m-%d %H:%M:%S UTC").to_string()
}

async fn function_handler(event: LambdaEvent<Value>) -> Result<Value, Error> {
    let time = get_current_time();
    let message = format!("Current time: {}", time);
    
    // Log the message
    println!("{}", message);
    
    // Return a response
    Ok(json!({ "message": message }))
}

#[tokio::main]
async fn main() -> Result<(), Error> {
    lambda_runtime::run(service_fn(function_handler)).await
}
