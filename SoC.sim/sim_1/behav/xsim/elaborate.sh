#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2023.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Jan 30 01:07:24 PST 2024
# SW Build 4029153 on Fri Oct 13 20:13:54 MDT 2023
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab --incr --debug typical --relax --mt 8 -d "BENCH=1" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot SoC_tb_behav xil_defaultlib.SoC_tb xil_defaultlib.glbl -log elaborate.log"
xelab --incr --debug typical --relax --mt 8 -d "BENCH=1" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot SoC_tb_behav xil_defaultlib.SoC_tb xil_defaultlib.glbl -log elaborate.log

