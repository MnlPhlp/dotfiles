#! /bin/sh
echo ###################
echo # installing rust #
echo ###################
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo #####################
echo # installing crates #
echo #####################
cargo install cargo-binstall
cargo binstall bat wspick
