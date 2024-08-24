use chrono::prelude::*;

fn get_current_time() -> String {
    let now = Utc::now();
    now.format("%Y-%m-%d %H:%M:%S UTC").to_string()
}

fn main() {
    let time = get_current_time();
    println!("Current time: {}", time);
}
