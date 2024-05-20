// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:01:11 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//sqrt.futil-ultrascale-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module fp_sqrt
   (s_done,
    running_reg_0,
    \out_reg[31]_0 ,
    \out_reg[30]_0 ,
    \out_reg[29]_0 ,
    \out_reg[28]_0 ,
    \out_reg[27]_0 ,
    \out_reg[26]_0 ,
    \out_reg[25]_0 ,
    \out_reg[24]_0 ,
    \out_reg[23]_0 ,
    \out_reg[22]_0 ,
    \out_reg[21]_0 ,
    \out_reg[20]_0 ,
    \out_reg[19]_0 ,
    \out_reg[18]_0 ,
    \out_reg[17]_0 ,
    \out_reg[16]_0 ,
    \out_reg[15]_0 ,
    \out_reg[14]_0 ,
    \out_reg[13]_0 ,
    \out_reg[12]_0 ,
    \out_reg[11]_0 ,
    \out_reg[10]_0 ,
    \out_reg[9]_0 ,
    \out_reg[8]_0 ,
    \out_reg[7]_0 ,
    \out_reg[6]_0 ,
    \out_reg[5]_0 ,
    \out_reg[4]_0 ,
    \out_reg[3]_0 ,
    \out_reg[2]_0 ,
    \out_reg[1]_0 ,
    \out_reg[0]_0 ,
    clk,
    reset,
    Q,
    \x_reg[31]_0 ,
    go,
    SR,
    D);
  output s_done;
  output running_reg_0;
  output \out_reg[31]_0 ;
  output \out_reg[30]_0 ;
  output \out_reg[29]_0 ;
  output \out_reg[28]_0 ;
  output \out_reg[27]_0 ;
  output \out_reg[26]_0 ;
  output \out_reg[25]_0 ;
  output \out_reg[24]_0 ;
  output \out_reg[23]_0 ;
  output \out_reg[22]_0 ;
  output \out_reg[21]_0 ;
  output \out_reg[20]_0 ;
  output \out_reg[19]_0 ;
  output \out_reg[18]_0 ;
  output \out_reg[17]_0 ;
  output \out_reg[16]_0 ;
  output \out_reg[15]_0 ;
  output \out_reg[14]_0 ;
  output \out_reg[13]_0 ;
  output \out_reg[12]_0 ;
  output \out_reg[11]_0 ;
  output \out_reg[10]_0 ;
  output \out_reg[9]_0 ;
  output \out_reg[8]_0 ;
  output \out_reg[7]_0 ;
  output \out_reg[6]_0 ;
  output \out_reg[5]_0 ;
  output \out_reg[4]_0 ;
  output \out_reg[3]_0 ;
  output \out_reg[2]_0 ;
  output \out_reg[1]_0 ;
  output \out_reg[0]_0 ;
  input clk;
  input reset;
  input [29:0]Q;
  input [1:0]\x_reg[31]_0 ;
  input go;
  input [0:0]SR;
  input [1:0]D;

  wire \<const0> ;
  wire \<const1> ;
  wire [1:0]D;
  wire GND_2;
  wire [29:0]Q;
  wire [0:0]SR;
  wire [33:0]acc;
  wire \acc[0]_i_1_n_0 ;
  wire \acc[10]_i_1_n_0 ;
  wire \acc[11]_i_1_n_0 ;
  wire \acc[12]_i_1_n_0 ;
  wire \acc[13]_i_1_n_0 ;
  wire \acc[14]_i_1_n_0 ;
  wire \acc[15]_i_1_n_0 ;
  wire \acc[16]_i_1_n_0 ;
  wire \acc[17]_i_1_n_0 ;
  wire \acc[18]_i_1_n_0 ;
  wire \acc[19]_i_1_n_0 ;
  wire \acc[1]_i_1_n_0 ;
  wire \acc[20]_i_1_n_0 ;
  wire \acc[21]_i_1_n_0 ;
  wire \acc[22]_i_1_n_0 ;
  wire \acc[23]_i_1_n_0 ;
  wire \acc[24]_i_1_n_0 ;
  wire \acc[25]_i_1_n_0 ;
  wire \acc[26]_i_1_n_0 ;
  wire \acc[27]_i_1_n_0 ;
  wire \acc[28]_i_1_n_0 ;
  wire \acc[29]_i_1_n_0 ;
  wire \acc[2]_i_1_n_0 ;
  wire \acc[30]_i_1_n_0 ;
  wire \acc[31]_i_1_n_0 ;
  wire \acc[32]_i_1_n_0 ;
  wire \acc[33]_i_1_n_0 ;
  wire \acc[3]_i_1_n_0 ;
  wire \acc[4]_i_1_n_0 ;
  wire \acc[5]_i_1_n_0 ;
  wire \acc[6]_i_1_n_0 ;
  wire \acc[7]_i_1_n_0 ;
  wire \acc[8]_i_1_n_0 ;
  wire \acc[9]_i_1_n_0 ;
  wire clk;
  wire finished;
  wire go;
  wire [3:0]idx_reg;
  wire \out[31]_i_1_n_0 ;
  wire \out[31]_i_2_n_0 ;
  wire \out_reg[0]_0 ;
  wire \out_reg[10]_0 ;
  wire \out_reg[11]_0 ;
  wire \out_reg[12]_0 ;
  wire \out_reg[13]_0 ;
  wire \out_reg[14]_0 ;
  wire \out_reg[15]_0 ;
  wire \out_reg[16]_0 ;
  wire \out_reg[17]_0 ;
  wire \out_reg[18]_0 ;
  wire \out_reg[19]_0 ;
  wire \out_reg[1]_0 ;
  wire \out_reg[20]_0 ;
  wire \out_reg[21]_0 ;
  wire \out_reg[22]_0 ;
  wire \out_reg[23]_0 ;
  wire \out_reg[24]_0 ;
  wire \out_reg[25]_0 ;
  wire \out_reg[26]_0 ;
  wire \out_reg[27]_0 ;
  wire \out_reg[28]_0 ;
  wire \out_reg[29]_0 ;
  wire \out_reg[2]_0 ;
  wire \out_reg[30]_0 ;
  wire \out_reg[31]_0 ;
  wire \out_reg[3]_0 ;
  wire \out_reg[4]_0 ;
  wire \out_reg[5]_0 ;
  wire \out_reg[6]_0 ;
  wire \out_reg[7]_0 ;
  wire \out_reg[8]_0 ;
  wire \out_reg[9]_0 ;
  wire p_0_in;
  wire [3:0]p_0_in__0;
  wire [31:4]p_2_in;
  wire [31:0]quotient;
  wire [0:0]quotient_next;
  wire quotient_next1_carry__0_n_0;
  wire quotient_next1_carry__0_n_10;
  wire quotient_next1_carry__0_n_11;
  wire quotient_next1_carry__0_n_12;
  wire quotient_next1_carry__0_n_13;
  wire quotient_next1_carry__0_n_14;
  wire quotient_next1_carry__0_n_15;
  wire quotient_next1_carry__0_n_8;
  wire quotient_next1_carry__0_n_9;
  wire quotient_next1_carry__1_n_0;
  wire quotient_next1_carry__1_n_10;
  wire quotient_next1_carry__1_n_11;
  wire quotient_next1_carry__1_n_12;
  wire quotient_next1_carry__1_n_13;
  wire quotient_next1_carry__1_n_14;
  wire quotient_next1_carry__1_n_15;
  wire quotient_next1_carry__1_n_8;
  wire quotient_next1_carry__1_n_9;
  wire quotient_next1_carry__2_n_0;
  wire quotient_next1_carry__2_n_10;
  wire quotient_next1_carry__2_n_11;
  wire quotient_next1_carry__2_n_12;
  wire quotient_next1_carry__2_n_13;
  wire quotient_next1_carry__2_n_14;
  wire quotient_next1_carry__2_n_15;
  wire quotient_next1_carry__2_n_9;
  wire quotient_next1_carry_i_1__0_n_0;
  wire quotient_next1_carry_i_1__1_n_0;
  wire quotient_next1_carry_i_1__2_n_0;
  wire quotient_next1_carry_i_1__3_n_0;
  wire quotient_next1_carry_i_1_n_0;
  wire quotient_next1_carry_i_2__0_n_0;
  wire quotient_next1_carry_i_2__1_n_0;
  wire quotient_next1_carry_i_2__2_n_0;
  wire quotient_next1_carry_i_2_n_0;
  wire quotient_next1_carry_i_3__0_n_0;
  wire quotient_next1_carry_i_3__1_n_0;
  wire quotient_next1_carry_i_3__2_n_0;
  wire quotient_next1_carry_i_3_n_0;
  wire quotient_next1_carry_i_4__0_n_0;
  wire quotient_next1_carry_i_4__1_n_0;
  wire quotient_next1_carry_i_4__2_n_0;
  wire quotient_next1_carry_i_4_n_0;
  wire quotient_next1_carry_i_5__0_n_0;
  wire quotient_next1_carry_i_5__1_n_0;
  wire quotient_next1_carry_i_5__2_n_0;
  wire quotient_next1_carry_i_5_n_0;
  wire quotient_next1_carry_i_6__0_n_0;
  wire quotient_next1_carry_i_6__1_n_0;
  wire quotient_next1_carry_i_6__2_n_0;
  wire quotient_next1_carry_i_6_n_0;
  wire quotient_next1_carry_i_7__0_n_0;
  wire quotient_next1_carry_i_7__1_n_0;
  wire quotient_next1_carry_i_7__2_n_0;
  wire quotient_next1_carry_i_7_n_0;
  wire quotient_next1_carry_i_8__0_n_0;
  wire quotient_next1_carry_i_8__1_n_0;
  wire quotient_next1_carry_i_8__2_n_0;
  wire quotient_next1_carry_i_8_n_0;
  wire quotient_next1_carry_n_0;
  wire quotient_next1_carry_n_10;
  wire quotient_next1_carry_n_11;
  wire quotient_next1_carry_n_12;
  wire quotient_next1_carry_n_13;
  wire quotient_next1_carry_n_14;
  wire quotient_next1_carry_n_15;
  wire quotient_next1_carry_n_8;
  wire quotient_next1_carry_n_9;
  wire reset;
  wire running_i_1_n_0;
  wire running_i_2_n_0;
  wire running_reg_0;
  wire s_done;
  wire \x[10]_i_1_n_0 ;
  wire \x[11]_i_1_n_0 ;
  wire \x[12]_i_1_n_0 ;
  wire \x[13]_i_1_n_0 ;
  wire \x[14]_i_1_n_0 ;
  wire \x[15]_i_1_n_0 ;
  wire \x[16]_i_1_n_0 ;
  wire \x[17]_i_1_n_0 ;
  wire \x[18]_i_1_n_0 ;
  wire \x[19]_i_1_n_0 ;
  wire \x[20]_i_1_n_0 ;
  wire \x[21]_i_1_n_0 ;
  wire \x[22]_i_1_n_0 ;
  wire \x[23]_i_1_n_0 ;
  wire \x[24]_i_1_n_0 ;
  wire \x[25]_i_1_n_0 ;
  wire \x[26]_i_1_n_0 ;
  wire \x[27]_i_1_n_0 ;
  wire \x[28]_i_1_n_0 ;
  wire \x[29]_i_1_n_0 ;
  wire \x[30]_i_1_n_0 ;
  wire \x[31]_i_1_n_0 ;
  wire \x[31]_i_2_n_0 ;
  wire \x[4]_i_1_n_0 ;
  wire \x[5]_i_1_n_0 ;
  wire \x[6]_i_1_n_0 ;
  wire \x[7]_i_1_n_0 ;
  wire \x[8]_i_1_n_0 ;
  wire \x[9]_i_1_n_0 ;
  wire [1:0]\x_reg[31]_0 ;
  wire \x_reg_n_0_[30] ;
  wire \x_reg_n_0_[31] ;
  wire [7:0]NLW_quotient_next1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_quotient_next1_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_quotient_next1_carry__1_CO_UNCONNECTED;
  wire [7:0]NLW_quotient_next1_carry__2_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \acc[0]_i_1 
       (.I0(\x_reg_n_0_[30] ),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[28]),
        .O(\acc[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[10]_i_1 
       (.I0(quotient_next1_carry_n_8),
        .I1(acc[8]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[11]_i_1 
       (.I0(quotient_next1_carry__0_n_15),
        .I1(acc[9]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[12]_i_1 
       (.I0(quotient_next1_carry__0_n_14),
        .I1(acc[10]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[13]_i_1 
       (.I0(quotient_next1_carry__0_n_13),
        .I1(acc[11]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[14]_i_1 
       (.I0(quotient_next1_carry__0_n_12),
        .I1(acc[12]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[15]_i_1 
       (.I0(quotient_next1_carry__0_n_11),
        .I1(acc[13]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[16]_i_1 
       (.I0(quotient_next1_carry__0_n_10),
        .I1(acc[14]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[17]_i_1 
       (.I0(quotient_next1_carry__0_n_9),
        .I1(acc[15]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[18]_i_1 
       (.I0(quotient_next1_carry__0_n_8),
        .I1(acc[16]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[19]_i_1 
       (.I0(quotient_next1_carry__1_n_15),
        .I1(acc[17]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \acc[1]_i_1 
       (.I0(\x_reg_n_0_[31] ),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[29]),
        .O(\acc[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[20]_i_1 
       (.I0(quotient_next1_carry__1_n_14),
        .I1(acc[18]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[20]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[21]_i_1 
       (.I0(quotient_next1_carry__1_n_13),
        .I1(acc[19]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[22]_i_1 
       (.I0(quotient_next1_carry__1_n_12),
        .I1(acc[20]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[23]_i_1 
       (.I0(quotient_next1_carry__1_n_11),
        .I1(acc[21]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[24]_i_1 
       (.I0(quotient_next1_carry__1_n_10),
        .I1(acc[22]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[25]_i_1 
       (.I0(quotient_next1_carry__1_n_9),
        .I1(acc[23]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[25]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[26]_i_1 
       (.I0(quotient_next1_carry__1_n_8),
        .I1(acc[24]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[27]_i_1 
       (.I0(quotient_next1_carry__2_n_15),
        .I1(acc[25]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[28]_i_1 
       (.I0(quotient_next1_carry__2_n_14),
        .I1(acc[26]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[28]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[29]_i_1 
       (.I0(quotient_next1_carry__2_n_13),
        .I1(acc[27]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \acc[2]_i_1 
       (.I0(acc[0]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(p_0_in),
        .O(\acc[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[30]_i_1 
       (.I0(quotient_next1_carry__2_n_12),
        .I1(acc[28]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[31]_i_1 
       (.I0(quotient_next1_carry__2_n_11),
        .I1(acc[29]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[32]_i_1 
       (.I0(quotient_next1_carry__2_n_10),
        .I1(acc[30]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[32]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[33]_i_1 
       (.I0(quotient_next1_carry__2_n_9),
        .I1(acc[31]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[3]_i_1 
       (.I0(quotient_next1_carry_n_15),
        .I1(acc[1]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[4]_i_1 
       (.I0(quotient_next1_carry_n_14),
        .I1(acc[2]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[5]_i_1 
       (.I0(quotient_next1_carry_n_13),
        .I1(acc[3]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[6]_i_1 
       (.I0(quotient_next1_carry_n_12),
        .I1(acc[4]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[7]_i_1 
       (.I0(quotient_next1_carry_n_11),
        .I1(acc[5]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[8]_i_1 
       (.I0(quotient_next1_carry_n_10),
        .I1(acc[6]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC0A0)) 
    \acc[9]_i_1 
       (.I0(quotient_next1_carry_n_9),
        .I1(acc[7]),
        .I2(\x[31]_i_2_n_0 ),
        .I3(p_0_in),
        .O(\acc[9]_i_1_n_0 ));
  FDRE \acc_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[0]_i_1_n_0 ),
        .Q(acc[0]),
        .R(\<const0> ));
  FDRE \acc_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[10]_i_1_n_0 ),
        .Q(acc[10]),
        .R(\<const0> ));
  FDRE \acc_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[11]_i_1_n_0 ),
        .Q(acc[11]),
        .R(\<const0> ));
  FDRE \acc_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[12]_i_1_n_0 ),
        .Q(acc[12]),
        .R(\<const0> ));
  FDRE \acc_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[13]_i_1_n_0 ),
        .Q(acc[13]),
        .R(\<const0> ));
  FDRE \acc_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[14]_i_1_n_0 ),
        .Q(acc[14]),
        .R(\<const0> ));
  FDRE \acc_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[15]_i_1_n_0 ),
        .Q(acc[15]),
        .R(\<const0> ));
  FDRE \acc_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[16]_i_1_n_0 ),
        .Q(acc[16]),
        .R(\<const0> ));
  FDRE \acc_reg[17] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[17]_i_1_n_0 ),
        .Q(acc[17]),
        .R(\<const0> ));
  FDRE \acc_reg[18] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[18]_i_1_n_0 ),
        .Q(acc[18]),
        .R(\<const0> ));
  FDRE \acc_reg[19] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[19]_i_1_n_0 ),
        .Q(acc[19]),
        .R(\<const0> ));
  FDRE \acc_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[1]_i_1_n_0 ),
        .Q(acc[1]),
        .R(\<const0> ));
  FDRE \acc_reg[20] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[20]_i_1_n_0 ),
        .Q(acc[20]),
        .R(\<const0> ));
  FDRE \acc_reg[21] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[21]_i_1_n_0 ),
        .Q(acc[21]),
        .R(\<const0> ));
  FDRE \acc_reg[22] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[22]_i_1_n_0 ),
        .Q(acc[22]),
        .R(\<const0> ));
  FDRE \acc_reg[23] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[23]_i_1_n_0 ),
        .Q(acc[23]),
        .R(\<const0> ));
  FDRE \acc_reg[24] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[24]_i_1_n_0 ),
        .Q(acc[24]),
        .R(\<const0> ));
  FDRE \acc_reg[25] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[25]_i_1_n_0 ),
        .Q(acc[25]),
        .R(\<const0> ));
  FDRE \acc_reg[26] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[26]_i_1_n_0 ),
        .Q(acc[26]),
        .R(\<const0> ));
  FDRE \acc_reg[27] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[27]_i_1_n_0 ),
        .Q(acc[27]),
        .R(\<const0> ));
  FDRE \acc_reg[28] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[28]_i_1_n_0 ),
        .Q(acc[28]),
        .R(\<const0> ));
  FDRE \acc_reg[29] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[29]_i_1_n_0 ),
        .Q(acc[29]),
        .R(\<const0> ));
  FDRE \acc_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[2]_i_1_n_0 ),
        .Q(acc[2]),
        .R(\<const0> ));
  FDRE \acc_reg[30] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[30]_i_1_n_0 ),
        .Q(acc[30]),
        .R(\<const0> ));
  FDRE \acc_reg[31] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[31]_i_1_n_0 ),
        .Q(acc[31]),
        .R(\<const0> ));
  FDRE \acc_reg[32] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[32]_i_1_n_0 ),
        .Q(acc[32]),
        .R(\<const0> ));
  FDRE \acc_reg[33] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[33]_i_1_n_0 ),
        .Q(acc[33]),
        .R(\<const0> ));
  FDRE \acc_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[3]_i_1_n_0 ),
        .Q(acc[3]),
        .R(\<const0> ));
  FDRE \acc_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[4]_i_1_n_0 ),
        .Q(acc[4]),
        .R(\<const0> ));
  FDRE \acc_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[5]_i_1_n_0 ),
        .Q(acc[5]),
        .R(\<const0> ));
  FDRE \acc_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[6]_i_1_n_0 ),
        .Q(acc[6]),
        .R(\<const0> ));
  FDRE \acc_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[7]_i_1_n_0 ),
        .Q(acc[7]),
        .R(\<const0> ));
  FDRE \acc_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[8]_i_1_n_0 ),
        .Q(acc[8]),
        .R(\<const0> ));
  FDRE \acc_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[9]_i_1_n_0 ),
        .Q(acc[9]),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h80000000)) 
    done_i_1
       (.I0(idx_reg[1]),
        .I1(idx_reg[0]),
        .I2(idx_reg[2]),
        .I3(idx_reg[3]),
        .I4(running_reg_0),
        .O(finished));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(finished),
        .Q(s_done),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \idx[0]_i_1 
       (.I0(idx_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \idx[1]_i_1 
       (.I0(idx_reg[0]),
        .I1(idx_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \idx[2]_i_1 
       (.I0(idx_reg[1]),
        .I1(idx_reg[0]),
        .I2(idx_reg[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \idx[3]_i_2 
       (.I0(idx_reg[2]),
        .I1(idx_reg[0]),
        .I2(idx_reg[1]),
        .I3(idx_reg[3]),
        .O(p_0_in__0[3]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[0]),
        .Q(idx_reg[0]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[1]),
        .Q(idx_reg[1]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[2]),
        .Q(idx_reg[2]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in__0[3]),
        .Q(idx_reg[3]),
        .R(running_reg_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF00000000)) 
    \out[31]_i_1 
       (.I0(running_reg_0),
        .I1(idx_reg[3]),
        .I2(idx_reg[2]),
        .I3(idx_reg[0]),
        .I4(idx_reg[1]),
        .I5(reset),
        .O(\out[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \out[31]_i_2 
       (.I0(reset),
        .I1(idx_reg[1]),
        .I2(idx_reg[0]),
        .I3(idx_reg[2]),
        .I4(idx_reg[3]),
        .I5(running_reg_0),
        .O(\out[31]_i_2_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient_next),
        .Q(\out_reg[0]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[9]),
        .Q(\out_reg[10]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[10]),
        .Q(\out_reg[11]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[11]),
        .Q(\out_reg[12]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[12]),
        .Q(\out_reg[13]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[13]),
        .Q(\out_reg[14]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[14]),
        .Q(\out_reg[15]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[15]),
        .Q(\out_reg[16]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[16]),
        .Q(\out_reg[17]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[17]),
        .Q(\out_reg[18]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[18]),
        .Q(\out_reg[19]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[0]),
        .Q(\out_reg[1]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[19]),
        .Q(\out_reg[20]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[20]),
        .Q(\out_reg[21]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[21]),
        .Q(\out_reg[22]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[22]),
        .Q(\out_reg[23]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[23]),
        .Q(\out_reg[24]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[24]),
        .Q(\out_reg[25]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[25]),
        .Q(\out_reg[26]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[26]),
        .Q(\out_reg[27]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[27]),
        .Q(\out_reg[28]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[28]),
        .Q(\out_reg[29]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[1]),
        .Q(\out_reg[2]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[29]),
        .Q(\out_reg[30]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[30]),
        .Q(\out_reg[31]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[2]),
        .Q(\out_reg[3]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[3]),
        .Q(\out_reg[4]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[4]),
        .Q(\out_reg[5]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[5]),
        .Q(\out_reg[6]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[6]),
        .Q(\out_reg[7]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[7]),
        .Q(\out_reg[8]_0 ),
        .R(\out[31]_i_1_n_0 ));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(\out[31]_i_2_n_0 ),
        .D(quotient[8]),
        .Q(\out_reg[9]_0 ),
        .R(\out[31]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \quotient[0]_i_1 
       (.I0(p_0_in),
        .O(quotient_next));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next1_carry
       (.CI(acc[0]),
        .CI_TOP(GND_2),
        .CO({quotient_next1_carry_n_0,NLW_quotient_next1_carry_CO_UNCONNECTED[6:0]}),
        .DI(acc[8:1]),
        .O({quotient_next1_carry_n_8,quotient_next1_carry_n_9,quotient_next1_carry_n_10,quotient_next1_carry_n_11,quotient_next1_carry_n_12,quotient_next1_carry_n_13,quotient_next1_carry_n_14,quotient_next1_carry_n_15}),
        .S({quotient_next1_carry_i_1__3_n_0,quotient_next1_carry_i_2__2_n_0,quotient_next1_carry_i_3__2_n_0,quotient_next1_carry_i_4__2_n_0,quotient_next1_carry_i_5__2_n_0,quotient_next1_carry_i_6__2_n_0,quotient_next1_carry_i_7__2_n_0,quotient_next1_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next1_carry__0
       (.CI(quotient_next1_carry_n_0),
        .CI_TOP(GND_2),
        .CO({quotient_next1_carry__0_n_0,NLW_quotient_next1_carry__0_CO_UNCONNECTED[6:0]}),
        .DI(acc[16:9]),
        .O({quotient_next1_carry__0_n_8,quotient_next1_carry__0_n_9,quotient_next1_carry__0_n_10,quotient_next1_carry__0_n_11,quotient_next1_carry__0_n_12,quotient_next1_carry__0_n_13,quotient_next1_carry__0_n_14,quotient_next1_carry__0_n_15}),
        .S({quotient_next1_carry_i_1__2_n_0,quotient_next1_carry_i_2__1_n_0,quotient_next1_carry_i_3__1_n_0,quotient_next1_carry_i_4__1_n_0,quotient_next1_carry_i_5__1_n_0,quotient_next1_carry_i_6__1_n_0,quotient_next1_carry_i_7__1_n_0,quotient_next1_carry_i_8__2_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next1_carry__1
       (.CI(quotient_next1_carry__0_n_0),
        .CI_TOP(GND_2),
        .CO({quotient_next1_carry__1_n_0,NLW_quotient_next1_carry__1_CO_UNCONNECTED[6:0]}),
        .DI(acc[24:17]),
        .O({quotient_next1_carry__1_n_8,quotient_next1_carry__1_n_9,quotient_next1_carry__1_n_10,quotient_next1_carry__1_n_11,quotient_next1_carry__1_n_12,quotient_next1_carry__1_n_13,quotient_next1_carry__1_n_14,quotient_next1_carry__1_n_15}),
        .S({quotient_next1_carry_i_1__1_n_0,quotient_next1_carry_i_2__0_n_0,quotient_next1_carry_i_3__0_n_0,quotient_next1_carry_i_4__0_n_0,quotient_next1_carry_i_5__0_n_0,quotient_next1_carry_i_6__0_n_0,quotient_next1_carry_i_7__0_n_0,quotient_next1_carry_i_8__1_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next1_carry__2
       (.CI(quotient_next1_carry__1_n_0),
        .CI_TOP(GND_2),
        .CO({quotient_next1_carry__2_n_0,NLW_quotient_next1_carry__2_CO_UNCONNECTED[6:0]}),
        .DI(acc[32:25]),
        .O({quotient_next1_carry__2_n_9,quotient_next1_carry__2_n_10,quotient_next1_carry__2_n_11,quotient_next1_carry__2_n_12,quotient_next1_carry__2_n_13,quotient_next1_carry__2_n_14,quotient_next1_carry__2_n_15}),
        .S({quotient_next1_carry_i_1__0_n_0,quotient_next1_carry_i_2_n_0,quotient_next1_carry_i_3_n_0,quotient_next1_carry_i_4_n_0,quotient_next1_carry_i_5_n_0,quotient_next1_carry_i_6_n_0,quotient_next1_carry_i_7_n_0,quotient_next1_carry_i_8__0_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY8 quotient_next1_carry__3
       (.CI(quotient_next1_carry__2_n_0),
        .CI_TOP(GND_2),
        .DI(\<const0> ),
        .O(p_0_in),
        .S(quotient_next1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_1
       (.I0(acc[33]),
        .I1(quotient[31]),
        .O(quotient_next1_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_1__0
       (.I0(acc[32]),
        .I1(quotient[30]),
        .O(quotient_next1_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_1__1
       (.I0(acc[24]),
        .I1(quotient[22]),
        .O(quotient_next1_carry_i_1__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_1__2
       (.I0(acc[16]),
        .I1(quotient[14]),
        .O(quotient_next1_carry_i_1__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_1__3
       (.I0(acc[8]),
        .I1(quotient[6]),
        .O(quotient_next1_carry_i_1__3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_2
       (.I0(acc[31]),
        .I1(quotient[29]),
        .O(quotient_next1_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_2__0
       (.I0(acc[23]),
        .I1(quotient[21]),
        .O(quotient_next1_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_2__1
       (.I0(acc[15]),
        .I1(quotient[13]),
        .O(quotient_next1_carry_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_2__2
       (.I0(acc[7]),
        .I1(quotient[5]),
        .O(quotient_next1_carry_i_2__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_3
       (.I0(acc[30]),
        .I1(quotient[28]),
        .O(quotient_next1_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_3__0
       (.I0(acc[22]),
        .I1(quotient[20]),
        .O(quotient_next1_carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_3__1
       (.I0(acc[14]),
        .I1(quotient[12]),
        .O(quotient_next1_carry_i_3__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_3__2
       (.I0(acc[6]),
        .I1(quotient[4]),
        .O(quotient_next1_carry_i_3__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_4
       (.I0(acc[29]),
        .I1(quotient[27]),
        .O(quotient_next1_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_4__0
       (.I0(acc[21]),
        .I1(quotient[19]),
        .O(quotient_next1_carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_4__1
       (.I0(acc[13]),
        .I1(quotient[11]),
        .O(quotient_next1_carry_i_4__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_4__2
       (.I0(acc[5]),
        .I1(quotient[3]),
        .O(quotient_next1_carry_i_4__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_5
       (.I0(acc[28]),
        .I1(quotient[26]),
        .O(quotient_next1_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_5__0
       (.I0(acc[20]),
        .I1(quotient[18]),
        .O(quotient_next1_carry_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_5__1
       (.I0(acc[12]),
        .I1(quotient[10]),
        .O(quotient_next1_carry_i_5__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_5__2
       (.I0(acc[4]),
        .I1(quotient[2]),
        .O(quotient_next1_carry_i_5__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_6
       (.I0(acc[27]),
        .I1(quotient[25]),
        .O(quotient_next1_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_6__0
       (.I0(acc[19]),
        .I1(quotient[17]),
        .O(quotient_next1_carry_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_6__1
       (.I0(acc[11]),
        .I1(quotient[9]),
        .O(quotient_next1_carry_i_6__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_6__2
       (.I0(acc[3]),
        .I1(quotient[1]),
        .O(quotient_next1_carry_i_6__2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_7
       (.I0(acc[26]),
        .I1(quotient[24]),
        .O(quotient_next1_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_7__0
       (.I0(acc[18]),
        .I1(quotient[16]),
        .O(quotient_next1_carry_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_7__1
       (.I0(acc[10]),
        .I1(quotient[8]),
        .O(quotient_next1_carry_i_7__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_7__2
       (.I0(acc[2]),
        .I1(quotient[0]),
        .O(quotient_next1_carry_i_7__2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    quotient_next1_carry_i_8
       (.I0(acc[1]),
        .O(quotient_next1_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_8__0
       (.I0(acc[25]),
        .I1(quotient[23]),
        .O(quotient_next1_carry_i_8__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_8__1
       (.I0(acc[17]),
        .I1(quotient[15]),
        .O(quotient_next1_carry_i_8__1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    quotient_next1_carry_i_8__2
       (.I0(acc[9]),
        .I1(quotient[7]),
        .O(quotient_next1_carry_i_8__2_n_0));
  FDRE \quotient_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient_next),
        .Q(quotient[0]),
        .R(SR));
  FDRE \quotient_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[9]),
        .Q(quotient[10]),
        .R(SR));
  FDRE \quotient_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[10]),
        .Q(quotient[11]),
        .R(SR));
  FDRE \quotient_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[11]),
        .Q(quotient[12]),
        .R(SR));
  FDRE \quotient_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[12]),
        .Q(quotient[13]),
        .R(SR));
  FDRE \quotient_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[13]),
        .Q(quotient[14]),
        .R(SR));
  FDRE \quotient_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[14]),
        .Q(quotient[15]),
        .R(SR));
  FDRE \quotient_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[15]),
        .Q(quotient[16]),
        .R(SR));
  FDRE \quotient_reg[17] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[16]),
        .Q(quotient[17]),
        .R(SR));
  FDRE \quotient_reg[18] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[17]),
        .Q(quotient[18]),
        .R(SR));
  FDRE \quotient_reg[19] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[18]),
        .Q(quotient[19]),
        .R(SR));
  FDRE \quotient_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[0]),
        .Q(quotient[1]),
        .R(SR));
  FDRE \quotient_reg[20] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[19]),
        .Q(quotient[20]),
        .R(SR));
  FDRE \quotient_reg[21] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[20]),
        .Q(quotient[21]),
        .R(SR));
  FDRE \quotient_reg[22] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[21]),
        .Q(quotient[22]),
        .R(SR));
  FDRE \quotient_reg[23] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[22]),
        .Q(quotient[23]),
        .R(SR));
  FDRE \quotient_reg[24] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[23]),
        .Q(quotient[24]),
        .R(SR));
  FDRE \quotient_reg[25] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[24]),
        .Q(quotient[25]),
        .R(SR));
  FDRE \quotient_reg[26] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[25]),
        .Q(quotient[26]),
        .R(SR));
  FDRE \quotient_reg[27] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[26]),
        .Q(quotient[27]),
        .R(SR));
  FDRE \quotient_reg[28] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[27]),
        .Q(quotient[28]),
        .R(SR));
  FDRE \quotient_reg[29] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[28]),
        .Q(quotient[29]),
        .R(SR));
  FDRE \quotient_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[1]),
        .Q(quotient[2]),
        .R(SR));
  FDRE \quotient_reg[30] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[29]),
        .Q(quotient[30]),
        .R(SR));
  FDRE \quotient_reg[31] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[30]),
        .Q(quotient[31]),
        .R(SR));
  FDRE \quotient_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[2]),
        .Q(quotient[3]),
        .R(SR));
  FDRE \quotient_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[3]),
        .Q(quotient[4]),
        .R(SR));
  FDRE \quotient_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[4]),
        .Q(quotient[5]),
        .R(SR));
  FDRE \quotient_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[5]),
        .Q(quotient[6]),
        .R(SR));
  FDRE \quotient_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[6]),
        .Q(quotient[7]),
        .R(SR));
  FDRE \quotient_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[7]),
        .Q(quotient[8]),
        .R(SR));
  FDRE \quotient_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient[8]),
        .Q(quotient[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h4500)) 
    running_i_1
       (.I0(reset),
        .I1(running_reg_0),
        .I2(\x[31]_i_2_n_0 ),
        .I3(running_i_2_n_0),
        .O(running_i_1_n_0));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    running_i_2
       (.I0(running_reg_0),
        .I1(idx_reg[3]),
        .I2(idx_reg[2]),
        .I3(idx_reg[0]),
        .I4(idx_reg[1]),
        .O(running_i_2_n_0));
  FDRE running_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(running_i_1_n_0),
        .Q(running_reg_0),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[10]_i_1 
       (.I0(p_2_in[10]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[6]),
        .O(\x[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[11]_i_1 
       (.I0(p_2_in[11]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[7]),
        .O(\x[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[12]_i_1 
       (.I0(p_2_in[12]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[8]),
        .O(\x[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[13]_i_1 
       (.I0(p_2_in[13]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[9]),
        .O(\x[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[14]_i_1 
       (.I0(p_2_in[14]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[10]),
        .O(\x[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[15]_i_1 
       (.I0(p_2_in[15]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[11]),
        .O(\x[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[16]_i_1 
       (.I0(p_2_in[16]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[12]),
        .O(\x[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[17]_i_1 
       (.I0(p_2_in[17]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[13]),
        .O(\x[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[18]_i_1 
       (.I0(p_2_in[18]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[14]),
        .O(\x[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[19]_i_1 
       (.I0(p_2_in[19]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[15]),
        .O(\x[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[20]_i_1 
       (.I0(p_2_in[20]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[16]),
        .O(\x[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[21]_i_1 
       (.I0(p_2_in[21]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[17]),
        .O(\x[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[22]_i_1 
       (.I0(p_2_in[22]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[18]),
        .O(\x[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[23]_i_1 
       (.I0(p_2_in[23]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[19]),
        .O(\x[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[24]_i_1 
       (.I0(p_2_in[24]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[20]),
        .O(\x[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[25]_i_1 
       (.I0(p_2_in[25]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[21]),
        .O(\x[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[26]_i_1 
       (.I0(p_2_in[26]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[22]),
        .O(\x[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[27]_i_1 
       (.I0(p_2_in[27]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[23]),
        .O(\x[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[28]_i_1 
       (.I0(p_2_in[28]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[24]),
        .O(\x[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[29]_i_1 
       (.I0(p_2_in[29]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[25]),
        .O(\x[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[30]_i_1 
       (.I0(p_2_in[30]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[26]),
        .O(\x[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[31]_i_1 
       (.I0(p_2_in[31]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[27]),
        .O(\x[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEFFFFF)) 
    \x[31]_i_2 
       (.I0(running_reg_0),
        .I1(s_done),
        .I2(\x_reg[31]_0 [0]),
        .I3(\x_reg[31]_0 [1]),
        .I4(go),
        .O(\x[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[4]_i_1 
       (.I0(p_2_in[4]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[0]),
        .O(\x[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[5]_i_1 
       (.I0(p_2_in[5]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[1]),
        .O(\x[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[6]_i_1 
       (.I0(p_2_in[6]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[2]),
        .O(\x[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[7]_i_1 
       (.I0(p_2_in[7]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[3]),
        .O(\x[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[8]_i_1 
       (.I0(p_2_in[8]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[4]),
        .O(\x[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \x[9]_i_1 
       (.I0(p_2_in[9]),
        .I1(\x[31]_i_2_n_0 ),
        .I2(Q[5]),
        .O(\x[9]_i_1_n_0 ));
  FDRE \x_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[10]_i_1_n_0 ),
        .Q(p_2_in[12]),
        .R(\<const0> ));
  FDRE \x_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[11]_i_1_n_0 ),
        .Q(p_2_in[13]),
        .R(\<const0> ));
  FDRE \x_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[12]_i_1_n_0 ),
        .Q(p_2_in[14]),
        .R(\<const0> ));
  FDRE \x_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[13]_i_1_n_0 ),
        .Q(p_2_in[15]),
        .R(\<const0> ));
  FDRE \x_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[14]_i_1_n_0 ),
        .Q(p_2_in[16]),
        .R(\<const0> ));
  FDRE \x_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[15]_i_1_n_0 ),
        .Q(p_2_in[17]),
        .R(\<const0> ));
  FDRE \x_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[16]_i_1_n_0 ),
        .Q(p_2_in[18]),
        .R(\<const0> ));
  FDRE \x_reg[17] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[17]_i_1_n_0 ),
        .Q(p_2_in[19]),
        .R(\<const0> ));
  FDRE \x_reg[18] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[18]_i_1_n_0 ),
        .Q(p_2_in[20]),
        .R(\<const0> ));
  FDRE \x_reg[19] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[19]_i_1_n_0 ),
        .Q(p_2_in[21]),
        .R(\<const0> ));
  FDRE \x_reg[20] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[20]_i_1_n_0 ),
        .Q(p_2_in[22]),
        .R(\<const0> ));
  FDRE \x_reg[21] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[21]_i_1_n_0 ),
        .Q(p_2_in[23]),
        .R(\<const0> ));
  FDRE \x_reg[22] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[22]_i_1_n_0 ),
        .Q(p_2_in[24]),
        .R(\<const0> ));
  FDRE \x_reg[23] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[23]_i_1_n_0 ),
        .Q(p_2_in[25]),
        .R(\<const0> ));
  FDRE \x_reg[24] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[24]_i_1_n_0 ),
        .Q(p_2_in[26]),
        .R(\<const0> ));
  FDRE \x_reg[25] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[25]_i_1_n_0 ),
        .Q(p_2_in[27]),
        .R(\<const0> ));
  FDRE \x_reg[26] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[26]_i_1_n_0 ),
        .Q(p_2_in[28]),
        .R(\<const0> ));
  FDRE \x_reg[27] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[27]_i_1_n_0 ),
        .Q(p_2_in[29]),
        .R(\<const0> ));
  FDRE \x_reg[28] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[28]_i_1_n_0 ),
        .Q(p_2_in[30]),
        .R(\<const0> ));
  FDRE \x_reg[29] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[29]_i_1_n_0 ),
        .Q(p_2_in[31]),
        .R(\<const0> ));
  FDRE \x_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D[0]),
        .Q(p_2_in[4]),
        .R(\<const0> ));
  FDRE \x_reg[30] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[30]_i_1_n_0 ),
        .Q(\x_reg_n_0_[30] ),
        .R(\<const0> ));
  FDRE \x_reg[31] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[31]_i_1_n_0 ),
        .Q(\x_reg_n_0_[31] ),
        .R(\<const0> ));
  FDRE \x_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(D[1]),
        .Q(p_2_in[5]),
        .R(\<const0> ));
  FDRE \x_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[4]_i_1_n_0 ),
        .Q(p_2_in[6]),
        .R(\<const0> ));
  FDRE \x_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[5]_i_1_n_0 ),
        .Q(p_2_in[7]),
        .R(\<const0> ));
  FDRE \x_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[6]_i_1_n_0 ),
        .Q(p_2_in[8]),
        .R(\<const0> ));
  FDRE \x_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[7]_i_1_n_0 ),
        .Q(p_2_in[9]),
        .R(\<const0> ));
  FDRE \x_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[8]_i_1_n_0 ),
        .Q(p_2_in[10]),
        .R(\<const0> ));
  FDRE \x_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\x[9]_i_1_n_0 ),
        .Q(p_2_in[11]),
        .R(\<const0> ));
endmodule

(* ECO_CHECKSUM = "adfc560e" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    radicand_addr0,
    radicand_write_data,
    radicand_write_en,
    radicand_clk,
    radicand_read_data,
    radicand_done,
    root_addr0,
    root_write_data,
    root_write_en,
    root_clk,
    root_read_data,
    root_done);
  input go;
  input clk;
  input reset;
  output done;
  output radicand_addr0;
  output [31:0]radicand_write_data;
  output radicand_write_en;
  output radicand_clk;
  input [31:0]radicand_read_data;
  input radicand_done;
  output root_addr0;
  output [31:0]root_write_data;
  output root_write_en;
  output root_clk;
  input [31:0]root_read_data;
  input root_done;

  wire \<const0> ;
  wire clk;
  wire \comp/running ;
  wire \comp/start ;
  wire done;
  wire fsm_n_3;
  wire fsm_n_4;
  wire fsm_n_40;
  wire [1:0]fsm_out;
  wire go;
  wire [31:0]radicand_read_data;
  wire reset;
  wire root_done;
  wire [31:0]root_write_data;
  wire root_write_en;
  wire s_done;
  wire s_n_10;
  wire s_n_11;
  wire s_n_12;
  wire s_n_13;
  wire s_n_14;
  wire s_n_15;
  wire s_n_16;
  wire s_n_17;
  wire s_n_18;
  wire s_n_19;
  wire s_n_2;
  wire s_n_20;
  wire s_n_21;
  wire s_n_22;
  wire s_n_23;
  wire s_n_24;
  wire s_n_25;
  wire s_n_26;
  wire s_n_27;
  wire s_n_28;
  wire s_n_29;
  wire s_n_3;
  wire s_n_30;
  wire s_n_31;
  wire s_n_32;
  wire s_n_33;
  wire s_n_4;
  wire s_n_5;
  wire s_n_6;
  wire s_n_7;
  wire s_n_8;
  wire s_n_9;
  wire save_temporary_go_in;
  wire t_done;
  wire t_n_1;
  wire t_n_10;
  wire t_n_11;
  wire t_n_12;
  wire t_n_13;
  wire t_n_14;
  wire t_n_15;
  wire t_n_16;
  wire t_n_17;
  wire t_n_18;
  wire t_n_19;
  wire t_n_2;
  wire t_n_20;
  wire t_n_21;
  wire t_n_22;
  wire t_n_23;
  wire t_n_24;
  wire t_n_25;
  wire t_n_26;
  wire t_n_27;
  wire t_n_28;
  wire t_n_29;
  wire t_n_3;
  wire t_n_30;
  wire t_n_31;
  wire t_n_32;
  wire t_n_4;
  wire t_n_5;
  wire t_n_6;
  wire t_n_7;
  wire t_n_8;
  wire t_n_9;

  assign radicand_addr0 = \<const0> ;
  assign radicand_clk = clk;
  assign radicand_write_data[31] = \<const0> ;
  assign radicand_write_data[30] = \<const0> ;
  assign radicand_write_data[29] = \<const0> ;
  assign radicand_write_data[28] = \<const0> ;
  assign radicand_write_data[27] = \<const0> ;
  assign radicand_write_data[26] = \<const0> ;
  assign radicand_write_data[25] = \<const0> ;
  assign radicand_write_data[24] = \<const0> ;
  assign radicand_write_data[23] = \<const0> ;
  assign radicand_write_data[22] = \<const0> ;
  assign radicand_write_data[21] = \<const0> ;
  assign radicand_write_data[20] = \<const0> ;
  assign radicand_write_data[19] = \<const0> ;
  assign radicand_write_data[18] = \<const0> ;
  assign radicand_write_data[17] = \<const0> ;
  assign radicand_write_data[16] = \<const0> ;
  assign radicand_write_data[15] = \<const0> ;
  assign radicand_write_data[14] = \<const0> ;
  assign radicand_write_data[13] = \<const0> ;
  assign radicand_write_data[12] = \<const0> ;
  assign radicand_write_data[11] = \<const0> ;
  assign radicand_write_data[10] = \<const0> ;
  assign radicand_write_data[9] = \<const0> ;
  assign radicand_write_data[8] = \<const0> ;
  assign radicand_write_data[7] = \<const0> ;
  assign radicand_write_data[6] = \<const0> ;
  assign radicand_write_data[5] = \<const0> ;
  assign radicand_write_data[4] = \<const0> ;
  assign radicand_write_data[3] = \<const0> ;
  assign radicand_write_data[2] = \<const0> ;
  assign radicand_write_data[1] = \<const0> ;
  assign radicand_write_data[0] = \<const0> ;
  assign radicand_write_en = \<const0> ;
  assign root_addr0 = \<const0> ;
  assign root_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_reg__parameterized0 fsm
       (.D({fsm_n_3,fsm_n_4}),
        .E(save_temporary_go_in),
        .Q(fsm_out),
        .SR(\comp/start ),
        .clk(clk),
        .done(done),
        .done_reg(fsm_n_40),
        .go(go),
        .reset(reset),
        .root_done(root_done),
        .root_write_data(root_write_data),
        .root_write_data_0_sp_1(s_n_33),
        .root_write_data_10_sp_1(s_n_23),
        .root_write_data_11_sp_1(s_n_22),
        .root_write_data_12_sp_1(s_n_21),
        .root_write_data_13_sp_1(s_n_20),
        .root_write_data_14_sp_1(s_n_19),
        .root_write_data_15_sp_1(s_n_18),
        .root_write_data_16_sp_1(s_n_17),
        .root_write_data_17_sp_1(s_n_16),
        .root_write_data_18_sp_1(s_n_15),
        .root_write_data_19_sp_1(s_n_14),
        .root_write_data_1_sp_1(s_n_32),
        .root_write_data_20_sp_1(s_n_13),
        .root_write_data_21_sp_1(s_n_12),
        .root_write_data_22_sp_1(s_n_11),
        .root_write_data_23_sp_1(s_n_10),
        .root_write_data_24_sp_1(s_n_9),
        .root_write_data_25_sp_1(s_n_8),
        .root_write_data_26_sp_1(s_n_7),
        .root_write_data_27_sp_1(s_n_6),
        .root_write_data_28_sp_1(s_n_5),
        .root_write_data_29_sp_1(s_n_4),
        .root_write_data_2_sp_1(s_n_31),
        .root_write_data_30_sp_1(s_n_3),
        .root_write_data_31_sp_1(s_n_2),
        .root_write_data_3_sp_1(s_n_30),
        .root_write_data_4_sp_1(s_n_29),
        .root_write_data_5_sp_1(s_n_28),
        .root_write_data_6_sp_1(s_n_27),
        .root_write_data_7_sp_1(s_n_26),
        .root_write_data_8_sp_1(s_n_25),
        .root_write_data_9_sp_1(s_n_24),
        .root_write_en(root_write_en),
        .running(\comp/running ),
        .s_done(s_done),
        .t_done(t_done),
        .\x_reg[3] ({t_n_31,t_n_32}));
  sqrt s
       (.D({fsm_n_3,fsm_n_4}),
        .Q({t_n_1,t_n_2,t_n_3,t_n_4,t_n_5,t_n_6,t_n_7,t_n_8,t_n_9,t_n_10,t_n_11,t_n_12,t_n_13,t_n_14,t_n_15,t_n_16,t_n_17,t_n_18,t_n_19,t_n_20,t_n_21,t_n_22,t_n_23,t_n_24,t_n_25,t_n_26,t_n_27,t_n_28,t_n_29,t_n_30}),
        .SR(\comp/start ),
        .clk(clk),
        .go(go),
        .\out_reg[0] (s_n_33),
        .\out_reg[10] (s_n_23),
        .\out_reg[11] (s_n_22),
        .\out_reg[12] (s_n_21),
        .\out_reg[13] (s_n_20),
        .\out_reg[14] (s_n_19),
        .\out_reg[15] (s_n_18),
        .\out_reg[16] (s_n_17),
        .\out_reg[17] (s_n_16),
        .\out_reg[18] (s_n_15),
        .\out_reg[19] (s_n_14),
        .\out_reg[1] (s_n_32),
        .\out_reg[20] (s_n_13),
        .\out_reg[21] (s_n_12),
        .\out_reg[22] (s_n_11),
        .\out_reg[23] (s_n_10),
        .\out_reg[24] (s_n_9),
        .\out_reg[25] (s_n_8),
        .\out_reg[26] (s_n_7),
        .\out_reg[27] (s_n_6),
        .\out_reg[28] (s_n_5),
        .\out_reg[29] (s_n_4),
        .\out_reg[2] (s_n_31),
        .\out_reg[30] (s_n_3),
        .\out_reg[31] (s_n_2),
        .\out_reg[3] (s_n_30),
        .\out_reg[4] (s_n_29),
        .\out_reg[5] (s_n_28),
        .\out_reg[6] (s_n_27),
        .\out_reg[7] (s_n_26),
        .\out_reg[8] (s_n_25),
        .\out_reg[9] (s_n_24),
        .reset(reset),
        .running(\comp/running ),
        .s_done(s_done),
        .\x_reg[31] (fsm_out));
  std_reg t
       (.E(save_temporary_go_in),
        .Q({t_n_1,t_n_2,t_n_3,t_n_4,t_n_5,t_n_6,t_n_7,t_n_8,t_n_9,t_n_10,t_n_11,t_n_12,t_n_13,t_n_14,t_n_15,t_n_16,t_n_17,t_n_18,t_n_19,t_n_20,t_n_21,t_n_22,t_n_23,t_n_24,t_n_25,t_n_26,t_n_27,t_n_28,t_n_29,t_n_30,t_n_31,t_n_32}),
        .clk(clk),
        .done_reg_0(fsm_n_40),
        .radicand_read_data(radicand_read_data),
        .reset(reset),
        .t_done(t_done));
endmodule

module sqrt
   (s_done,
    running,
    \out_reg[31] ,
    \out_reg[30] ,
    \out_reg[29] ,
    \out_reg[28] ,
    \out_reg[27] ,
    \out_reg[26] ,
    \out_reg[25] ,
    \out_reg[24] ,
    \out_reg[23] ,
    \out_reg[22] ,
    \out_reg[21] ,
    \out_reg[20] ,
    \out_reg[19] ,
    \out_reg[18] ,
    \out_reg[17] ,
    \out_reg[16] ,
    \out_reg[15] ,
    \out_reg[14] ,
    \out_reg[13] ,
    \out_reg[12] ,
    \out_reg[11] ,
    \out_reg[10] ,
    \out_reg[9] ,
    \out_reg[8] ,
    \out_reg[7] ,
    \out_reg[6] ,
    \out_reg[5] ,
    \out_reg[4] ,
    \out_reg[3] ,
    \out_reg[2] ,
    \out_reg[1] ,
    \out_reg[0] ,
    clk,
    reset,
    Q,
    \x_reg[31] ,
    go,
    SR,
    D);
  output s_done;
  output running;
  output \out_reg[31] ;
  output \out_reg[30] ;
  output \out_reg[29] ;
  output \out_reg[28] ;
  output \out_reg[27] ;
  output \out_reg[26] ;
  output \out_reg[25] ;
  output \out_reg[24] ;
  output \out_reg[23] ;
  output \out_reg[22] ;
  output \out_reg[21] ;
  output \out_reg[20] ;
  output \out_reg[19] ;
  output \out_reg[18] ;
  output \out_reg[17] ;
  output \out_reg[16] ;
  output \out_reg[15] ;
  output \out_reg[14] ;
  output \out_reg[13] ;
  output \out_reg[12] ;
  output \out_reg[11] ;
  output \out_reg[10] ;
  output \out_reg[9] ;
  output \out_reg[8] ;
  output \out_reg[7] ;
  output \out_reg[6] ;
  output \out_reg[5] ;
  output \out_reg[4] ;
  output \out_reg[3] ;
  output \out_reg[2] ;
  output \out_reg[1] ;
  output \out_reg[0] ;
  input clk;
  input reset;
  input [29:0]Q;
  input [1:0]\x_reg[31] ;
  input go;
  input [0:0]SR;
  input [1:0]D;

  wire [1:0]D;
  wire [29:0]Q;
  wire [0:0]SR;
  wire clk;
  wire go;
  wire \out_reg[0] ;
  wire \out_reg[10] ;
  wire \out_reg[11] ;
  wire \out_reg[12] ;
  wire \out_reg[13] ;
  wire \out_reg[14] ;
  wire \out_reg[15] ;
  wire \out_reg[16] ;
  wire \out_reg[17] ;
  wire \out_reg[18] ;
  wire \out_reg[19] ;
  wire \out_reg[1] ;
  wire \out_reg[20] ;
  wire \out_reg[21] ;
  wire \out_reg[22] ;
  wire \out_reg[23] ;
  wire \out_reg[24] ;
  wire \out_reg[25] ;
  wire \out_reg[26] ;
  wire \out_reg[27] ;
  wire \out_reg[28] ;
  wire \out_reg[29] ;
  wire \out_reg[2] ;
  wire \out_reg[30] ;
  wire \out_reg[31] ;
  wire \out_reg[3] ;
  wire \out_reg[4] ;
  wire \out_reg[5] ;
  wire \out_reg[6] ;
  wire \out_reg[7] ;
  wire \out_reg[8] ;
  wire \out_reg[9] ;
  wire reset;
  wire running;
  wire s_done;
  wire [1:0]\x_reg[31] ;

  fp_sqrt comp
       (.D(D),
        .Q(Q),
        .SR(SR),
        .clk(clk),
        .go(go),
        .\out_reg[0]_0 (\out_reg[0] ),
        .\out_reg[10]_0 (\out_reg[10] ),
        .\out_reg[11]_0 (\out_reg[11] ),
        .\out_reg[12]_0 (\out_reg[12] ),
        .\out_reg[13]_0 (\out_reg[13] ),
        .\out_reg[14]_0 (\out_reg[14] ),
        .\out_reg[15]_0 (\out_reg[15] ),
        .\out_reg[16]_0 (\out_reg[16] ),
        .\out_reg[17]_0 (\out_reg[17] ),
        .\out_reg[18]_0 (\out_reg[18] ),
        .\out_reg[19]_0 (\out_reg[19] ),
        .\out_reg[1]_0 (\out_reg[1] ),
        .\out_reg[20]_0 (\out_reg[20] ),
        .\out_reg[21]_0 (\out_reg[21] ),
        .\out_reg[22]_0 (\out_reg[22] ),
        .\out_reg[23]_0 (\out_reg[23] ),
        .\out_reg[24]_0 (\out_reg[24] ),
        .\out_reg[25]_0 (\out_reg[25] ),
        .\out_reg[26]_0 (\out_reg[26] ),
        .\out_reg[27]_0 (\out_reg[27] ),
        .\out_reg[28]_0 (\out_reg[28] ),
        .\out_reg[29]_0 (\out_reg[29] ),
        .\out_reg[2]_0 (\out_reg[2] ),
        .\out_reg[30]_0 (\out_reg[30] ),
        .\out_reg[31]_0 (\out_reg[31] ),
        .\out_reg[3]_0 (\out_reg[3] ),
        .\out_reg[4]_0 (\out_reg[4] ),
        .\out_reg[5]_0 (\out_reg[5] ),
        .\out_reg[6]_0 (\out_reg[6] ),
        .\out_reg[7]_0 (\out_reg[7] ),
        .\out_reg[8]_0 (\out_reg[8] ),
        .\out_reg[9]_0 (\out_reg[9] ),
        .reset(reset),
        .running_reg_0(running),
        .s_done(s_done),
        .\x_reg[31]_0 (\x_reg[31] ));
endmodule

module std_reg
   (t_done,
    Q,
    done_reg_0,
    clk,
    reset,
    E,
    radicand_read_data);
  output t_done;
  output [31:0]Q;
  input done_reg_0;
  input clk;
  input reset;
  input [0:0]E;
  input [31:0]radicand_read_data;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire [31:0]Q;
  wire clk;
  wire done_reg_0;
  wire [31:0]radicand_read_data;
  wire reset;
  wire t_done;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done_reg_0),
        .Q(t_done),
        .R(\<const0> ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(radicand_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (Q,
    E,
    D,
    SR,
    root_write_data,
    root_write_en,
    done,
    done_reg,
    t_done,
    root_done,
    go,
    s_done,
    \x_reg[3] ,
    running,
    .root_write_data_31_sp_1(root_write_data_31_sn_1),
    .root_write_data_30_sp_1(root_write_data_30_sn_1),
    .root_write_data_29_sp_1(root_write_data_29_sn_1),
    .root_write_data_28_sp_1(root_write_data_28_sn_1),
    .root_write_data_27_sp_1(root_write_data_27_sn_1),
    .root_write_data_26_sp_1(root_write_data_26_sn_1),
    .root_write_data_25_sp_1(root_write_data_25_sn_1),
    .root_write_data_24_sp_1(root_write_data_24_sn_1),
    .root_write_data_23_sp_1(root_write_data_23_sn_1),
    .root_write_data_22_sp_1(root_write_data_22_sn_1),
    .root_write_data_21_sp_1(root_write_data_21_sn_1),
    .root_write_data_20_sp_1(root_write_data_20_sn_1),
    .root_write_data_19_sp_1(root_write_data_19_sn_1),
    .root_write_data_18_sp_1(root_write_data_18_sn_1),
    .root_write_data_17_sp_1(root_write_data_17_sn_1),
    .root_write_data_16_sp_1(root_write_data_16_sn_1),
    .root_write_data_15_sp_1(root_write_data_15_sn_1),
    .root_write_data_14_sp_1(root_write_data_14_sn_1),
    .root_write_data_13_sp_1(root_write_data_13_sn_1),
    .root_write_data_12_sp_1(root_write_data_12_sn_1),
    .root_write_data_11_sp_1(root_write_data_11_sn_1),
    .root_write_data_10_sp_1(root_write_data_10_sn_1),
    .root_write_data_9_sp_1(root_write_data_9_sn_1),
    .root_write_data_8_sp_1(root_write_data_8_sn_1),
    .root_write_data_7_sp_1(root_write_data_7_sn_1),
    .root_write_data_6_sp_1(root_write_data_6_sn_1),
    .root_write_data_5_sp_1(root_write_data_5_sn_1),
    .root_write_data_4_sp_1(root_write_data_4_sn_1),
    .root_write_data_3_sp_1(root_write_data_3_sn_1),
    .root_write_data_2_sp_1(root_write_data_2_sn_1),
    .root_write_data_1_sp_1(root_write_data_1_sn_1),
    .root_write_data_0_sp_1(root_write_data_0_sn_1),
    reset,
    clk);
  output [1:0]Q;
  output [0:0]E;
  output [1:0]D;
  output [0:0]SR;
  output [31:0]root_write_data;
  output root_write_en;
  output done;
  output done_reg;
  input t_done;
  input root_done;
  input go;
  input s_done;
  input [1:0]\x_reg[3] ;
  input running;
  input reset;
  input clk;
  input root_write_data_31_sn_1;
  input root_write_data_30_sn_1;
  input root_write_data_29_sn_1;
  input root_write_data_28_sn_1;
  input root_write_data_27_sn_1;
  input root_write_data_26_sn_1;
  input root_write_data_25_sn_1;
  input root_write_data_24_sn_1;
  input root_write_data_23_sn_1;
  input root_write_data_22_sn_1;
  input root_write_data_21_sn_1;
  input root_write_data_20_sn_1;
  input root_write_data_19_sn_1;
  input root_write_data_18_sn_1;
  input root_write_data_17_sn_1;
  input root_write_data_16_sn_1;
  input root_write_data_15_sn_1;
  input root_write_data_14_sn_1;
  input root_write_data_13_sn_1;
  input root_write_data_12_sn_1;
  input root_write_data_11_sn_1;
  input root_write_data_10_sn_1;
  input root_write_data_9_sn_1;
  input root_write_data_8_sn_1;
  input root_write_data_7_sn_1;
  input root_write_data_6_sn_1;
  input root_write_data_5_sn_1;
  input root_write_data_4_sn_1;
  input root_write_data_3_sn_1;
  input root_write_data_2_sn_1;
  input root_write_data_1_sn_1;
  input root_write_data_0_sn_1;

  wire [1:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire [0:0]SR;
  wire clk;
  wire done;
  wire done_reg;
  wire [1:0]fsm_in;
  wire fsm_write_en;
  wire go;
  wire reset;
  wire root_done;
  wire [31:0]root_write_data;
  wire root_write_data_0_sn_1;
  wire root_write_data_10_sn_1;
  wire root_write_data_11_sn_1;
  wire root_write_data_12_sn_1;
  wire root_write_data_13_sn_1;
  wire root_write_data_14_sn_1;
  wire root_write_data_15_sn_1;
  wire root_write_data_16_sn_1;
  wire root_write_data_17_sn_1;
  wire root_write_data_18_sn_1;
  wire root_write_data_19_sn_1;
  wire root_write_data_1_sn_1;
  wire root_write_data_20_sn_1;
  wire root_write_data_21_sn_1;
  wire root_write_data_22_sn_1;
  wire root_write_data_23_sn_1;
  wire root_write_data_24_sn_1;
  wire root_write_data_25_sn_1;
  wire root_write_data_26_sn_1;
  wire root_write_data_27_sn_1;
  wire root_write_data_28_sn_1;
  wire root_write_data_29_sn_1;
  wire root_write_data_2_sn_1;
  wire root_write_data_30_sn_1;
  wire root_write_data_31_sn_1;
  wire root_write_data_3_sn_1;
  wire root_write_data_4_sn_1;
  wire root_write_data_5_sn_1;
  wire root_write_data_6_sn_1;
  wire root_write_data_7_sn_1;
  wire root_write_data_8_sn_1;
  wire root_write_data_9_sn_1;
  wire root_write_en;
  wire running;
  wire s_done;
  wire t_done;
  wire [1:0]\x_reg[3] ;

  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(done));
  LUT5 #(
    .INIT(32'h00000004)) 
    done_i_1__0
       (.I0(t_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(reset),
        .O(done_reg));
  LUT5 #(
    .INIT(32'h0000C0A0)) 
    \out[0]_i_1 
       (.I0(t_done),
        .I1(root_done),
        .I2(go),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(fsm_in[0]));
  LUT6 #(
    .INIT(64'hFEF2CEC2C0C0C0C0)) 
    \out[1]_i_1 
       (.I0(t_done),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(root_done),
        .I4(s_done),
        .I5(go),
        .O(fsm_write_en));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00A0C000)) 
    \out[1]_i_2 
       (.I0(s_done),
        .I1(root_done),
        .I2(go),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(fsm_in[1]));
  LUT4 #(
    .INIT(16'h0010)) 
    \out[31]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(go),
        .I3(t_done),
        .O(E));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[1]),
        .Q(Q[1]),
        .R(reset));
  LUT5 #(
    .INIT(32'h00000020)) 
    \quotient[31]_i_1 
       (.I0(go),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(s_done),
        .I4(running),
        .O(SR));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[0]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_0_sn_1),
        .O(root_write_data[0]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[10]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_10_sn_1),
        .O(root_write_data[10]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[11]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_11_sn_1),
        .O(root_write_data[11]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[12]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_12_sn_1),
        .O(root_write_data[12]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[13]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_13_sn_1),
        .O(root_write_data[13]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[14]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_14_sn_1),
        .O(root_write_data[14]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[15]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_15_sn_1),
        .O(root_write_data[15]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[16]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_16_sn_1),
        .O(root_write_data[16]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[17]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_17_sn_1),
        .O(root_write_data[17]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[18]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_18_sn_1),
        .O(root_write_data[18]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[19]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_19_sn_1),
        .O(root_write_data[19]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[1]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_1_sn_1),
        .O(root_write_data[1]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[20]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_20_sn_1),
        .O(root_write_data[20]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[21]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_21_sn_1),
        .O(root_write_data[21]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[22]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_22_sn_1),
        .O(root_write_data[22]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[23]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_23_sn_1),
        .O(root_write_data[23]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[24]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_24_sn_1),
        .O(root_write_data[24]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[25]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_25_sn_1),
        .O(root_write_data[25]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[26]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_26_sn_1),
        .O(root_write_data[26]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[27]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_27_sn_1),
        .O(root_write_data[27]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[28]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_28_sn_1),
        .O(root_write_data[28]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[29]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_29_sn_1),
        .O(root_write_data[29]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[2]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_2_sn_1),
        .O(root_write_data[2]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[30]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_30_sn_1),
        .O(root_write_data[30]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[31]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_31_sn_1),
        .O(root_write_data[31]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[3]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_3_sn_1),
        .O(root_write_data[3]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[4]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_4_sn_1),
        .O(root_write_data[4]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[5]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_5_sn_1),
        .O(root_write_data[5]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[6]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_6_sn_1),
        .O(root_write_data[6]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[7]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_7_sn_1),
        .O(root_write_data[7]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[8]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_8_sn_1),
        .O(root_write_data[8]));
  LUT5 #(
    .INIT(32'h00400000)) 
    \root_write_data[9]_INST_0 
       (.I0(root_done),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(root_write_data_9_sn_1),
        .O(root_write_data[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    root_write_en_INST_0
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(go),
        .I3(root_done),
        .O(root_write_en));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \x[2]_i_1 
       (.I0(\x_reg[3] [0]),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(s_done),
        .I5(running),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000000000000800)) 
    \x[3]_i_1 
       (.I0(\x_reg[3] [1]),
        .I1(go),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(s_done),
        .I5(running),
        .O(D[1]));
endmodule
