#!/bin/bash

echo "Setting up asteroids environment..."

# Device dependencies
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635 kernel/nothing/sm7635
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635-devicetrees kernel/nothing/sm7635-devicetrees
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635-modules kernel/nothing/sm7635-modules
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/proprietary_vendor_nothing_asteroids vendor/nothing/asteroids

# Device Hals
git clone --depth 1 -b vauxite-8650 https://github.com/aospa-asteroids/android_hardware_qcom_audio vendor/qcom/opensource/audio-hal/primary-hal
git clone --depth 1 -b vauxite-8650 https://github.com/aospa-asteroids/android_hardware_qcom_display.git hardware/qcom/display
git clone --depth 1 -b vauxite-8650 https://github.com/aospa-asteroids/android_hardware_qcom_gps.git hardware/qcom/gps
git clone --depth 1 -b vauxite-8650 https://github.com/aospa-asteroids/android_hardware_qcom_media.git hardware/qcom/media
git clone --depth 1 -b vauxite-8650 https://github.com/aospa-asteroids/android_vendor_qcom_opensource_agm vendor/qcom/opensource/agm
git clone --depth 1 -b vauxite-8650 https://github.com/aospa-asteroids/android_vendor_qcom_opensource_arpal-lx vendor/qcom/opensource/pal

# Overrides
VIBRATOR_PATH="vendor/qcom/opensource/vibrator"
VIBRATOR_REPO="https://github.com/aospa-asteroids/android_vendor_qcom_opensource_vibrator"

if [ -d "$VIBRATOR_PATH" ]; then
    REMOTE_URL=$(git -C "$VIBRATOR_PATH" remote get-url origin 2>/dev/null || echo "")
    if [ "$REMOTE_URL" = "$VIBRATOR_REPO" ]; then
        :
    else
        rm -rf "$VIBRATOR_PATH"
        git clone --depth 1 "$VIBRATOR_REPO" "$VIBRATOR_PATH" || exit 1
    fi
else
    # Path doesn’t exist, clone fresh
    git clone --depth 1 "$VIBRATOR_REPO" "$VIBRATOR_PATH" || exit 1
fi

echo "asteroids environment is ready."
