// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 02:51:35 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//unsigned-bitnum.futil-vanilla-opt.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NETLIST_CHECKSUM = "e6b10f27" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    .mem0_addr0(\<const0> ),
    mem0_write_data,
    mem0_write_en,
    mem0_clk,
    mem0_read_data,
    mem0_done);
  input go;
  input clk;
  input reset;
  output done;
  output [31:0]mem0_write_data;
  output mem0_write_en;
  output mem0_clk;
  input [31:0]mem0_read_data;
  input mem0_done;
  output \<const0> ;

  wire \<const0> ;
  wire clk;
  wire go;
  wire mem0_done;
  wire [31:0]mem0_read_data;
  wire [31:0]mem0_write_data;

  assign done = mem0_done;
  assign mem0_clk = clk;
  assign mem0_write_en = go;
  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[0]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[0]),
        .O(mem0_write_data[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[10]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[10]),
        .O(mem0_write_data[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[11]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[11]),
        .O(mem0_write_data[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[12]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[12]),
        .O(mem0_write_data[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[13]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[13]),
        .O(mem0_write_data[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[14]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[14]),
        .O(mem0_write_data[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[15]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[15]),
        .O(mem0_write_data[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[16]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[16]),
        .O(mem0_write_data[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[17]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[17]),
        .O(mem0_write_data[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[18]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[18]),
        .O(mem0_write_data[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[19]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[19]),
        .O(mem0_write_data[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[1]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[1]),
        .O(mem0_write_data[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[20]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[20]),
        .O(mem0_write_data[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[21]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[21]),
        .O(mem0_write_data[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[22]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[22]),
        .O(mem0_write_data[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[23]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[23]),
        .O(mem0_write_data[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[24]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[24]),
        .O(mem0_write_data[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[25]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[25]),
        .O(mem0_write_data[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[26]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[26]),
        .O(mem0_write_data[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[27]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[27]),
        .O(mem0_write_data[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[28]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[28]),
        .O(mem0_write_data[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[29]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[29]),
        .O(mem0_write_data[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[2]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[2]),
        .O(mem0_write_data[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[30]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[30]),
        .O(mem0_write_data[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[31]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[31]),
        .O(mem0_write_data[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[3]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[3]),
        .O(mem0_write_data[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[4]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[4]),
        .O(mem0_write_data[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[5]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[5]),
        .O(mem0_write_data[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[6]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[6]),
        .O(mem0_write_data[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[7]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[7]),
        .O(mem0_write_data[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[8]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[8]),
        .O(mem0_write_data[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \mem0_write_data[9]_INST_0 
       (.I0(go),
        .I1(mem0_read_data[9]),
        .O(mem0_write_data[9]));
endmodule
