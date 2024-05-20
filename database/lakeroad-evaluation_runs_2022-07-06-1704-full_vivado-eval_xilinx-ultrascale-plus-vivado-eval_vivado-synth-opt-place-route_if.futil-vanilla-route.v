// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:30:56 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//if.futil-vanilla-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "a9885d1a" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    mem_addr0,
    mem_write_data,
    mem_write_en,
    mem_clk,
    mem_read_data,
    mem_done);
  input go;
  input clk;
  input reset;
  output done;
  output mem_addr0;
  output [31:0]mem_write_data;
  output mem_write_en;
  output mem_clk;
  input [31:0]mem_read_data;
  input mem_done;

  wire \<const0> ;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_n_1;
  wire comb_reg_n_2;
  wire cond0_go_in;
  wire done;
  wire [1:0]fsm_out;
  wire go;
  wire mem_done;
  wire [3:2]\^mem_write_data ;
  wire mem_write_en;
  wire reset;

  assign mem_addr0 = \<const0> ;
  assign mem_clk = clk;
  assign mem_write_data[31] = \<const0> ;
  assign mem_write_data[30] = \<const0> ;
  assign mem_write_data[29] = \<const0> ;
  assign mem_write_data[28] = \<const0> ;
  assign mem_write_data[27] = \<const0> ;
  assign mem_write_data[26] = \<const0> ;
  assign mem_write_data[25] = \<const0> ;
  assign mem_write_data[24] = \<const0> ;
  assign mem_write_data[23] = \<const0> ;
  assign mem_write_data[22] = \<const0> ;
  assign mem_write_data[21] = \<const0> ;
  assign mem_write_data[20] = \<const0> ;
  assign mem_write_data[19] = \<const0> ;
  assign mem_write_data[18] = \<const0> ;
  assign mem_write_data[17] = \<const0> ;
  assign mem_write_data[16] = \<const0> ;
  assign mem_write_data[15] = \<const0> ;
  assign mem_write_data[14] = \<const0> ;
  assign mem_write_data[13] = \<const0> ;
  assign mem_write_data[12] = \<const0> ;
  assign mem_write_data[11] = \<const0> ;
  assign mem_write_data[10] = \<const0> ;
  assign mem_write_data[9] = \<const0> ;
  assign mem_write_data[8] = \<const0> ;
  assign mem_write_data[7] = \<const0> ;
  assign mem_write_data[6] = \<const0> ;
  assign mem_write_data[5] = \<const0> ;
  assign mem_write_data[4] = \<const0> ;
  assign mem_write_data[3:2] = \^mem_write_data [3:2];
  assign mem_write_data[1] = \^mem_write_data [3];
  assign mem_write_data[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  std_reg comb_reg
       (.D({comb_reg_n_1,comb_reg_n_2}),
        .Q(fsm_out),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .cond0_go_in(cond0_go_in),
        .go(go),
        .mem_done(mem_done),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.D({comb_reg_n_1,comb_reg_n_2}),
        .Q(fsm_out),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .cond0_go_in(cond0_go_in),
        .done(done),
        .go(go),
        .mem_done(mem_done),
        .mem_write_data(\^mem_write_data ),
        .mem_write_en(mem_write_en),
        .reset(reset));
endmodule

module std_reg
   (comb_reg_done,
    D,
    reset,
    cond0_go_in,
    clk,
    go,
    Q,
    mem_done);
  output comb_reg_done;
  output [1:0]D;
  input reset;
  input cond0_go_in;
  input clk;
  input go;
  input [1:0]Q;
  input mem_done;

  wire \<const1> ;
  wire [1:0]D;
  wire [1:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond0_go_in;
  wire go;
  wire mem_done;
  wire \out[0]_i_1_n_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond0_go_in),
        .Q(comb_reg_done),
        .R(reset));
  LUT5 #(
    .INIT(32'hFFFF0002)) 
    \out[0]_i_1 
       (.I0(go),
        .I1(comb_reg_done),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(comb_reg_out),
        .O(\out[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000088888888C000)) 
    \out[0]_i_1__0 
       (.I0(mem_done),
        .I1(go),
        .I2(comb_reg_out),
        .I3(comb_reg_done),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000CC00CC004040)) 
    \out[1]_i_2 
       (.I0(comb_reg_out),
        .I1(go),
        .I2(comb_reg_done),
        .I3(mem_done),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(D[1]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out[0]_i_1_n_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (Q,
    done,
    cond0_go_in,
    mem_write_data,
    mem_write_en,
    reset,
    D,
    clk,
    mem_done,
    go,
    comb_reg_done);
  output [1:0]Q;
  output done;
  output cond0_go_in;
  output [1:0]mem_write_data;
  output mem_write_en;
  input reset;
  input [1:0]D;
  input clk;
  input mem_done;
  input go;
  input comb_reg_done;

  wire [1:0]D;
  wire [1:0]Q;
  wire clk;
  wire comb_reg_done;
  wire cond0_go_in;
  wire done;
  wire fsm_write_en;
  wire go;
  wire mem_done;
  wire [1:0]mem_write_data;
  wire mem_write_en;
  wire reset;

  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    done_i_1
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(comb_reg_done),
        .I3(go),
        .O(cond0_go_in));
  LUT4 #(
    .INIT(16'h0020)) 
    \mem_write_data[1]_INST_0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(go),
        .I3(mem_done),
        .O(mem_write_data[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \mem_write_data[2]_INST_0 
       (.I0(mem_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(mem_write_data[0]));
  LUT4 #(
    .INIT(16'h0440)) 
    mem_write_en_INST_0
       (.I0(mem_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(mem_write_en));
  LUT5 #(
    .INIT(32'hEBC0E8C0)) 
    \out[1]_i_1 
       (.I0(mem_done),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(go),
        .I4(comb_reg_done),
        .O(fsm_write_en));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
endmodule
