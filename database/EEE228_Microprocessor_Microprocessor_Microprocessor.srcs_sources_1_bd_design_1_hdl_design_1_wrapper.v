// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Sat Feb 24 02:31:07 2024
//Host        : Micheal running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (A0_0,
    A1_0,
    A2_0,
    A3_0,
    ALU_Sel_0,
    B0_0,
    B1_0,
    B2_0,
    B3_0,
    instruction_0,
    regA_0,
    regB_0);
  input A0_0;
  input A1_0;
  input A2_0;
  input A3_0;
  output [3:0]ALU_Sel_0;
  input B0_0;
  input B1_0;
  input B2_0;
  input B3_0;
  input [3:0]instruction_0;
  output [3:0]regA_0;
  output [3:0]regB_0;

  wire A0_0;
  wire A1_0;
  wire A2_0;
  wire A3_0;
  wire [3:0]ALU_Sel_0;
  wire B0_0;
  wire B1_0;
  wire B2_0;
  wire B3_0;
  wire [3:0]instruction_0;
  wire [3:0]regA_0;
  wire [3:0]regB_0;

  design_1 design_1_i
       (.A0_0(A0_0),
        .A1_0(A1_0),
        .A2_0(A2_0),
        .A3_0(A3_0),
        .ALU_Sel_0(ALU_Sel_0),
        .B0_0(B0_0),
        .B1_0(B1_0),
        .B2_0(B2_0),
        .B3_0(B3_0),
        .instruction_0(instruction_0),
        .regA_0(regA_0),
        .regB_0(regB_0));
endmodule
