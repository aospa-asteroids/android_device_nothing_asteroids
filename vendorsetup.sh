#!/bin/bash

echo "Setting up asteroids environment..."

# Device dependencies
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635 kernel/nothing/sm7635
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635-devicetrees kernel/nothing/sm7635-devicetrees
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635-modules kernel/nothing/sm7635-modules
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/proprietary_vendor_nothing_asteroids vendor/nothing/asteroids

echo "asteroids environment is ready."
