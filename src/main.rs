// bare metal Rust binary
#![no_std]

// i386 PC emulator target
mod i386;
use crate::i386::hello;

fn main() {
    hello();
}
