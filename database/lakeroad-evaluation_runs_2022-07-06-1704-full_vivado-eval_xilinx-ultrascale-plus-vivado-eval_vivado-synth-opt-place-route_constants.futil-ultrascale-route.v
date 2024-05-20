// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 02:35:12 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//constants.futil-ultrascale-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "c4d3d8d6" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    mem0_addr0,
    mem0_write_data,
    mem0_write_en,
    mem0_clk,
    mem0_read_data,
    mem0_done);
  input go;
  input clk;
  input reset;
  output done;
  output mem0_addr0;
  output [3:0]mem0_write_data;
  output mem0_write_en;
  output mem0_clk;
  input [3:0]mem0_read_data;
  input mem0_done;

  wire \<const0> ;
  wire clk;
  wire go;
  wire mem0_done;

  assign done = mem0_done;
  assign mem0_addr0 = \<const0> ;
  assign mem0_clk = clk;
  assign mem0_write_data[3] = \<const0> ;
  assign mem0_write_data[2] = go;
  assign mem0_write_data[1] = go;
  assign mem0_write_data[0] = \<const0> ;
  assign mem0_write_en = go;
  GND GND
       (.G(\<const0> ));
endmodule
