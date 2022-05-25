use std::sync::Mutex;

use once_cell::sync::Lazy;

use sysinfo::{ProcessorExt, System, SystemExt};

pub struct MyProcessor {
    pub name: String,
    pub brand: String,
    pub vendor_id: String,
    pub frequency: u64,
    pub cpu_usage: f32,
}

impl MyProcessor {
    pub fn new(
        name: String,
        brand: String,
        vendor_id: String,
        frequency: u64,
        cpu_usage: f32,
    ) -> Self {
        Self {
            name,
            brand,
            vendor_id,
            frequency,
            cpu_usage,
        }
    }
}

pub struct MyLoadAverage {
    pub one: f64,
    pub five: f64,
    pub fifteen: f64,
}

impl MyLoadAverage {
    pub fn new(one: f64, five: f64, fifteen: f64) -> Self {
        Self { one, five, fifteen }
    }
}

static SYSTEM: Lazy<Mutex<System>> = Lazy::new(|| Mutex::new(System::new_all()));

// system
pub fn system_name() -> String {
    SYSTEM.lock().unwrap().name().unwrap_or(String::from(""))
}

pub fn kernel_version() -> String {
    SYSTEM
        .lock()
        .unwrap()
        .kernel_version()
        .unwrap_or(String::from(""))
}

pub fn os_version() -> String {
    SYSTEM
        .lock()
        .unwrap()
        .os_version()
        .unwrap_or(String::from(""))
}

pub fn long_os_version() -> String {
    SYSTEM
        .lock()
        .unwrap()
        .long_os_version()
        .unwrap_or(String::from(""))
}

pub fn hostname() -> String {
    SYSTEM
        .lock()
        .unwrap()
        .host_name()
        .unwrap_or(String::from(""))
}

pub fn uptime() -> u64 {
    SYSTEM.lock().unwrap().uptime()
}

pub fn boot_time() -> u64 {
    SYSTEM.lock().unwrap().boot_time()
}

pub fn load_average() -> MyLoadAverage {
    let load = SYSTEM.lock().unwrap().load_average();

    MyLoadAverage::new(load.one, load.five, load.fifteen)
}

// system end

// memory
pub fn total_memory() -> u64 {
    SYSTEM.lock().unwrap().refresh_memory();

    SYSTEM.lock().unwrap().total_memory()
}

pub fn used_memory() -> u64 {
    SYSTEM.lock().unwrap().refresh_memory();

    SYSTEM.lock().unwrap().used_memory()
}

pub fn free_memory() -> u64 {
    SYSTEM.lock().unwrap().refresh_memory();

    SYSTEM.lock().unwrap().free_memory()
}

pub fn available_memory() -> u64 {
    SYSTEM.lock().unwrap().refresh_memory();

    SYSTEM.lock().unwrap().available_memory()
}
// memory end

// cpu
pub fn cpu_used() -> f32 {
    SYSTEM.lock().unwrap().refresh_cpu();

    SYSTEM.lock().unwrap().global_processor_info().cpu_usage()
}

pub fn cpu_frequency() -> u64 {
    SYSTEM.lock().unwrap().refresh_cpu();

    SYSTEM.lock().unwrap().global_processor_info().frequency()
}

pub fn cpu_name() -> String {
    SYSTEM.lock().unwrap().refresh_cpu();

    String::from(SYSTEM.lock().unwrap().global_processor_info().name())
}

pub fn cpu_brand() -> String {
    SYSTEM.lock().unwrap().refresh_cpu();

    String::from(SYSTEM.lock().unwrap().global_processor_info().brand())
}

pub fn cpu_vendor_id() -> String {
    SYSTEM.lock().unwrap().refresh_cpu();

    String::from(SYSTEM.lock().unwrap().global_processor_info().vendor_id())
}

pub fn cpu_physical_core_count() -> i32 {
    SYSTEM.lock().unwrap().refresh_cpu();

    SYSTEM.lock().unwrap().physical_core_count().unwrap_or(0) as i32
}

pub fn cpu_core_count() -> i32 {
    SYSTEM.lock().unwrap().refresh_cpu();

    SYSTEM.lock().unwrap().processors().len() as i32
}

pub fn cpu_cores() -> Vec<MyProcessor> {
    SYSTEM.lock().unwrap().refresh_cpu();

    let mut processors: Vec<MyProcessor> = Vec::new();

    for processor in SYSTEM.lock().unwrap().processors() {
        let processor: MyProcessor = MyProcessor::new(
            String::from(processor.name()),
            String::from(processor.brand()),
            String::from(processor.vendor_id()),
            processor.frequency(),
            processor.cpu_usage(),
        );

        processors.push(processor);
    }

    processors
}
// cpu end
