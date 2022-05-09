use std::sync::Mutex;

use once_cell::sync::Lazy;

use sysinfo::{ProcessorExt, System, SystemExt};

static SYSTEM: Lazy<Mutex<System>> = Lazy::new(|| Mutex::new(System::new_all()));

pub fn get_total_memory() -> u64 {
    SYSTEM.lock().unwrap().refresh_memory();

    SYSTEM.lock().unwrap().total_memory()
}

pub fn get_used_memory() -> u64 {
    SYSTEM.lock().unwrap().refresh_memory();

    SYSTEM.lock().unwrap().used_memory()
}

pub fn get_cpu_used() -> f32 {
    SYSTEM.lock().unwrap().refresh_cpu();

    SYSTEM.lock().unwrap().global_processor_info().cpu_usage()
}

pub fn get_cpu_frequency() -> u64 {
    SYSTEM.lock().unwrap().refresh_cpu();

    SYSTEM.lock().unwrap().global_processor_info().frequency()
}
