use cpal::traits::{DeviceTrait, HostTrait};
use env_logger::Env;
use rodio::{OutputStream, Sink};
use std::io::Cursor;
use std::time::Duration;

const ALARME: &[u8; 578801] = include_bytes!("alarme.wav");

fn main() {
    env_logger::Builder::from_env(Env::default()).init();
    let device = cpal::default_host()
        .output_devices()
        .expect("Unable to list output devices of default host")
        .find(|dev| {
            if let Ok(name) = dev.name() {
                &name == "default:CARD=Device" //usb specific device
            } else {
                false
            }
        })
        .or_else(|| cpal::default_host().default_output_device())
        .expect("Unable to initialize sound system");
    println!("Using sound output device: {}", device.name().unwrap());
    let (_output_stream, output_stream_handle) = OutputStream::try_from_device(&device)
        .expect("Unable to open outputstream to sound device!");
    let sink = Sink::try_new(&output_stream_handle).expect("Unable to create sink");
    sink.append(rodio::Decoder::new(Cursor::new(ALARME.to_vec())).unwrap());

    std::thread::sleep(Duration::from_secs(5));
}
