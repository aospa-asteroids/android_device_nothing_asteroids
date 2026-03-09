#!/bin/bash

echo "Setting up asteroids environment..."

# Device dependencies
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635 kernel/nothing/sm7635
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635-devicetrees kernel/nothing/sm7635-devicetrees
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/android_kernel_nothing_sm7635-modules kernel/nothing/sm7635-modules
git clone --depth 1 -b beryl https://github.com/aospa-asteroids/proprietary_vendor_nothing_asteroids vendor/nothing/asteroids

# Device Hals
git clone --depth 1 -b lineage-23.0-caf-sm8650 https://github.com/aospa-asteroids/android_hardware_qcom_display hardware/qcom/display
git clone --depth 1 -b lineage-23.0-caf-sm8650 https://github.com/aospa-asteroids/android_hardware_qcom_audio-ar vendor/qcom/opensource/audio-hal/primary-hal
git clone --depth 1 -b lineage-23.0-caf-sm8650 https://github.com/aospa-asteroids/android_vendor_qcom_opensource_agm vendor/qcom/opensource/agm
git clone --depth 1 -b lineage-23.0-caf-sm8650 https://github.com/aospa-asteroids/android_vendor_qcom_opensource_audioreach-graphservices vendor/qcom/opensource/audioreach-graphservices
git clone --depth 1 -b lineage-23.0-caf-sm8650 https://github.com/aospa-asteroids/android_vendor_qcom_opensource_arpal-lx vendor/qcom/opensource/pal
git clone --depth 1 -b lineage-23.0-caf-sm8650 https://github.com/aospa-asteroids/android_vendor_qcom_opensource_dataipa vendor/qcom/opensource/dataipa
git clone --depth 1 -b beryl-8650 https://github.com/aospa-asteroids/android_hardware_qcom_gps hardware/qcom/gps
git clone --depth 1 -b vauxite-8650 https://github.com/aospa-asteroids/android_hardware_qcom_media hardware/qcom/media

# Overrides
DATAIPA_CFG_PATH="vendor/qcom/opensource/data-ipa-cfg-mgr"
DATAIPA_CFG_REPO="https://github.com/aospa-asteroids/android_vendor_qcom_opensource_data-ipa-cfg-mgr"
DATAIPA_CFG_BRANCH="lineage-23.0-caf-sm8650"

if [ -d "$DATAIPA_CFG_PATH" ]; then
    REMOTE_URL=$(git -C "$DATAIPA_CFG_PATH" remote get-url origin 2>/dev/null || echo "")
    if [ "$REMOTE_URL" = "$DATAIPA_CFG_REPO" ]; then
        :
    else
        rm -rf "$DATAIPA_CFG_PATH"
        git clone --depth 1 -b "$DATAIPA_CFG_BRANCH" "$DATAIPA_CFG_REPO" "$DATAIPA_CFG_PATH" || exit 1
    fi
else
    git clone --depth 1 -b "$DATAIPA_CFG_BRANCH" "$DATAIPA_CFG_REPO" "$DATAIPA_CFG_PATH" || exit 1
fi

VIBRATOR_PATH="vendor/qcom/opensource/vibrator"
VIBRATOR_REPO="https://github.com/aospa-asteroids/android_vendor_qcom_opensource_vibrator"
VIBRATOR_BRANCH="lineage-23.0"

if [ -d "$VIBRATOR_PATH" ]; then
    REMOTE_URL=$(git -C "$VIBRATOR_PATH" remote get-url origin 2>/dev/null || echo "")
    if [ "$REMOTE_URL" = "$VIBRATOR_REPO" ]; then
        :
    else
        rm -rf "$VIBRATOR_PATH"
        git clone --depth 1 -b "$VIBRATOR_BRANCH" "$VIBRATOR_REPO" "$VIBRATOR_PATH" || exit 1
    fi
else
    git clone --depth 1 -b "$VIBRATOR_BRANCH" "$VIBRATOR_REPO" "$VIBRATOR_PATH" || exit 1
fi

echo "asteroids environment is ready."
