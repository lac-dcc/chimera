// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:20:34 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//seq.futil-vanilla-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "1927420a" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    in_addr0,
    in_write_data,
    in_write_en,
    in_clk,
    in_read_data,
    in_done,
    out_addr0,
    out_write_data,
    out_write_en,
    out_clk,
    out_read_data,
    out_done);
  input go;
  input clk;
  input reset;
  output done;
  output in_addr0;
  output [31:0]in_write_data;
  output in_write_en;
  output in_clk;
  input [31:0]in_read_data;
  input in_done;
  output out_addr0;
  output [31:0]out_write_data;
  output out_write_en;
  output out_clk;
  input [31:0]out_read_data;
  input out_done;

  wire \<const0> ;
  wire B_go_in;
  wire C_go_in;
  wire b_done;
  wire b_n_1;
  wire b_n_10;
  wire b_n_11;
  wire b_n_12;
  wire b_n_13;
  wire b_n_14;
  wire b_n_15;
  wire b_n_16;
  wire b_n_17;
  wire b_n_18;
  wire b_n_19;
  wire b_n_2;
  wire b_n_20;
  wire b_n_21;
  wire b_n_22;
  wire b_n_23;
  wire b_n_24;
  wire b_n_25;
  wire b_n_26;
  wire b_n_27;
  wire b_n_28;
  wire b_n_29;
  wire b_n_3;
  wire b_n_30;
  wire b_n_31;
  wire b_n_32;
  wire b_n_4;
  wire b_n_5;
  wire b_n_6;
  wire b_n_7;
  wire b_n_8;
  wire b_n_9;
  wire c_done;
  wire c_n_1;
  wire c_n_10;
  wire c_n_11;
  wire c_n_12;
  wire c_n_13;
  wire c_n_14;
  wire c_n_15;
  wire c_n_16;
  wire c_n_17;
  wire c_n_18;
  wire c_n_19;
  wire c_n_2;
  wire c_n_20;
  wire c_n_21;
  wire c_n_22;
  wire c_n_23;
  wire c_n_24;
  wire c_n_25;
  wire c_n_26;
  wire c_n_27;
  wire c_n_28;
  wire c_n_29;
  wire c_n_3;
  wire c_n_30;
  wire c_n_31;
  wire c_n_32;
  wire c_n_4;
  wire c_n_5;
  wire c_n_6;
  wire c_n_7;
  wire c_n_8;
  wire c_n_9;
  wire clk;
  wire done;
  wire go;
  wire [31:0]in_read_data;
  wire out_done;
  wire [31:0]out_write_data;
  wire out_write_en;
  wire reset;

  assign in_addr0 = \<const0> ;
  assign in_clk = clk;
  assign in_write_data[31] = \<const0> ;
  assign in_write_data[30] = \<const0> ;
  assign in_write_data[29] = \<const0> ;
  assign in_write_data[28] = \<const0> ;
  assign in_write_data[27] = \<const0> ;
  assign in_write_data[26] = \<const0> ;
  assign in_write_data[25] = \<const0> ;
  assign in_write_data[24] = \<const0> ;
  assign in_write_data[23] = \<const0> ;
  assign in_write_data[22] = \<const0> ;
  assign in_write_data[21] = \<const0> ;
  assign in_write_data[20] = \<const0> ;
  assign in_write_data[19] = \<const0> ;
  assign in_write_data[18] = \<const0> ;
  assign in_write_data[17] = \<const0> ;
  assign in_write_data[16] = \<const0> ;
  assign in_write_data[15] = \<const0> ;
  assign in_write_data[14] = \<const0> ;
  assign in_write_data[13] = \<const0> ;
  assign in_write_data[12] = \<const0> ;
  assign in_write_data[11] = \<const0> ;
  assign in_write_data[10] = \<const0> ;
  assign in_write_data[9] = \<const0> ;
  assign in_write_data[8] = \<const0> ;
  assign in_write_data[7] = \<const0> ;
  assign in_write_data[6] = \<const0> ;
  assign in_write_data[5] = \<const0> ;
  assign in_write_data[4] = \<const0> ;
  assign in_write_data[3] = \<const0> ;
  assign in_write_data[2] = \<const0> ;
  assign in_write_data[1] = \<const0> ;
  assign in_write_data[0] = \<const0> ;
  assign in_write_en = \<const0> ;
  assign out_addr0 = \<const0> ;
  assign out_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_reg b
       (.E(B_go_in),
        .Q({b_n_1,b_n_2,b_n_3,b_n_4,b_n_5,b_n_6,b_n_7,b_n_8,b_n_9,b_n_10,b_n_11,b_n_12,b_n_13,b_n_14,b_n_15,b_n_16,b_n_17,b_n_18,b_n_19,b_n_20,b_n_21,b_n_22,b_n_23,b_n_24,b_n_25,b_n_26,b_n_27,b_n_28,b_n_29,b_n_30,b_n_31,b_n_32}),
        .b_done(b_done),
        .clk(clk),
        .in_read_data(in_read_data),
        .reset(reset));
  std_reg_0 c
       (.D({b_n_1,b_n_2,b_n_3,b_n_4,b_n_5,b_n_6,b_n_7,b_n_8,b_n_9,b_n_10,b_n_11,b_n_12,b_n_13,b_n_14,b_n_15,b_n_16,b_n_17,b_n_18,b_n_19,b_n_20,b_n_21,b_n_22,b_n_23,b_n_24,b_n_25,b_n_26,b_n_27,b_n_28,b_n_29,b_n_30,b_n_31,b_n_32}),
        .E(C_go_in),
        .Q({c_n_1,c_n_2,c_n_3,c_n_4,c_n_5,c_n_6,c_n_7,c_n_8,c_n_9,c_n_10,c_n_11,c_n_12,c_n_13,c_n_14,c_n_15,c_n_16,c_n_17,c_n_18,c_n_19,c_n_20,c_n_21,c_n_22,c_n_23,c_n_24,c_n_25,c_n_26,c_n_27,c_n_28,c_n_29,c_n_30,c_n_31,c_n_32}),
        .c_done(c_done),
        .clk(clk),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.E(C_go_in),
        .Q({c_n_1,c_n_2,c_n_3,c_n_4,c_n_5,c_n_6,c_n_7,c_n_8,c_n_9,c_n_10,c_n_11,c_n_12,c_n_13,c_n_14,c_n_15,c_n_16,c_n_17,c_n_18,c_n_19,c_n_20,c_n_21,c_n_22,c_n_23,c_n_24,c_n_25,c_n_26,c_n_27,c_n_28,c_n_29,c_n_30,c_n_31,c_n_32}),
        .b_done(b_done),
        .c_done(c_done),
        .clk(clk),
        .done(done),
        .go(go),
        .out_done(out_done),
        .\out_reg[1]_0 (B_go_in),
        .out_write_data(out_write_data),
        .out_write_en(out_write_en),
        .reset(reset));
endmodule

module std_reg
   (b_done,
    Q,
    reset,
    E,
    clk,
    in_read_data);
  output b_done;
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input [31:0]in_read_data;

  wire \<const1> ;
  wire [0:0]E;
  wire [31:0]Q;
  wire b_done;
  wire clk;
  wire [31:0]in_read_data;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(b_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(in_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_0
   (c_done,
    Q,
    reset,
    E,
    clk,
    D);
  output c_done;
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input [31:0]D;

  wire \<const1> ;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]Q;
  wire c_done;
  wire clk;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(c_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(D[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(D[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(D[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(D[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(D[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(D[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(D[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(D[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(D[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(D[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(D[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(D[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(D[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(D[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(D[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(D[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(D[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (out_write_data,
    done,
    out_write_en,
    E,
    \out_reg[1]_0 ,
    out_done,
    go,
    Q,
    reset,
    clk,
    c_done,
    b_done);
  output [31:0]out_write_data;
  output done;
  output out_write_en;
  output [0:0]E;
  output [0:0]\out_reg[1]_0 ;
  input out_done;
  input go;
  input [31:0]Q;
  input reset;
  input clk;
  input c_done;
  input b_done;

  wire [0:0]E;
  wire [31:0]Q;
  wire b_done;
  wire c_done;
  wire clk;
  wire done;
  wire [1:0]fsm_in;
  wire [1:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire out_done;
  wire [0:0]\out_reg[1]_0 ;
  wire [31:0]out_write_data;
  wire out_write_en;
  wire reset;

  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(fsm_out[1]),
        .I1(fsm_out[0]),
        .O(done));
  LUT5 #(
    .INIT(32'h000088C0)) 
    \out[0]_i_1 
       (.I0(out_done),
        .I1(go),
        .I2(b_done),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(fsm_in[0]));
  LUT6 #(
    .INIT(64'hFBC0F8C0CBC0C8C0)) 
    \out[1]_i_1 
       (.I0(out_done),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(go),
        .I4(b_done),
        .I5(c_done),
        .O(fsm_write_en));
  LUT5 #(
    .INIT(32'h0088A000)) 
    \out[1]_i_2 
       (.I0(go),
        .I1(c_done),
        .I2(out_done),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .O(fsm_in[1]));
  LUT4 #(
    .INIT(16'h0008)) 
    \out[31]_i_1 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(c_done),
        .O(E));
  LUT4 #(
    .INIT(16'h0010)) 
    \out[31]_i_1__0 
       (.I0(fsm_out[1]),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(b_done),
        .O(\out_reg[1]_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(fsm_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[1]),
        .Q(fsm_out[1]),
        .R(reset));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[0]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[0]),
        .O(out_write_data[0]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[10]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[10]),
        .O(out_write_data[10]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[11]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[11]),
        .O(out_write_data[11]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[12]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[12]),
        .O(out_write_data[12]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[13]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[13]),
        .O(out_write_data[13]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[14]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[14]),
        .O(out_write_data[14]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[15]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[15]),
        .O(out_write_data[15]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[16]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[16]),
        .O(out_write_data[16]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[17]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[17]),
        .O(out_write_data[17]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[18]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[18]),
        .O(out_write_data[18]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[19]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[19]),
        .O(out_write_data[19]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[1]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[1]),
        .O(out_write_data[1]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[20]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[20]),
        .O(out_write_data[20]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[21]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[21]),
        .O(out_write_data[21]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[22]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[22]),
        .O(out_write_data[22]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[23]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[23]),
        .O(out_write_data[23]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[24]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[24]),
        .O(out_write_data[24]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[25]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[25]),
        .O(out_write_data[25]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[26]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[26]),
        .O(out_write_data[26]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[27]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[27]),
        .O(out_write_data[27]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[28]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[28]),
        .O(out_write_data[28]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[29]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[29]),
        .O(out_write_data[29]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[2]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[2]),
        .O(out_write_data[2]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[30]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[30]),
        .O(out_write_data[30]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[31]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[31]),
        .O(out_write_data[31]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[3]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[3]),
        .O(out_write_data[3]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[4]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[4]),
        .O(out_write_data[4]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[5]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[5]),
        .O(out_write_data[5]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[6]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[6]),
        .O(out_write_data[6]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[7]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[7]),
        .O(out_write_data[7]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[8]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[8]),
        .O(out_write_data[8]));
  LUT5 #(
    .INIT(32'h10000000)) 
    \out_write_data[9]_INST_0 
       (.I0(out_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(Q[9]),
        .O(out_write_data[9]));
  LUT4 #(
    .INIT(16'h0008)) 
    out_write_en_INST_0
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(out_done),
        .O(out_write_en));
endmodule
