#!/bin/bash
# badprog.com

set -e

BUILDROOT_DIR=/opt/buildroot
WORKSPACE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEFCONFIG=${WORKSPACE_DIR}/buildroot-config/rpi1b_minimal_defconfig
OUTPUT_DIR=${WORKSPACE_DIR}/output
DL_DIR=${WORKSPACE_DIR}/dl
OVERLAY_DIR=${WORKSPACE_DIR}/buildroot-config/overlay

echo "[badprog] Copying defconfig to Buildroot..."
cp "${DEFCONFIG}" "${BUILDROOT_DIR}/configs/rpi1b_minimal_defconfig"

echo "[badprog] Loading defconfig..."
make -C "${BUILDROOT_DIR}" O="${OUTPUT_DIR}" BR2_DL_DIR="${DL_DIR}" rpi1b_minimal_defconfig

echo "[badprog] Starting build (this takes 30-60 min on first run)..."
make -C "${BUILDROOT_DIR}" O="${OUTPUT_DIR}" BR2_DL_DIR="${DL_DIR}" BR2_ROOTFS_OVERLAY="${OVERLAY_DIR}"

echo "[badprog] Build complete."
echo "[badprog] Output images: ${OUTPUT_DIR}/images/"
ls -lh "${OUTPUT_DIR}/images/"
