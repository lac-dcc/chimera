// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Jul  6 23:31:51 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog
//               runs/2022-07-06-vector-add//vivado-vector-add-motivating-example//behavioral-in-reg.v-netlist.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* N = "4" *) (* W = "8" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (clock,
    reset,
    \a[3] ,
    \a[2] ,
    \a[1] ,
    \a[0] ,
    \b[3] ,
    \b[2] ,
    \b[1] ,
    \b[0] ,
    \y[3] ,
    \y[2] ,
    \y[1] ,
    \y[0] );
  input clock;
  input reset;
  input [7:0]\a[3] ;
  input [7:0]\a[2] ;
  input [7:0]\a[1] ;
  input [7:0]\a[0] ;
  input [7:0]\b[3] ;
  input [7:0]\b[2] ;
  input [7:0]\b[1] ;
  input [7:0]\b[0] ;
  output [7:0]\y[3] ;
  output [7:0]\y[2] ;
  output [7:0]\y[1] ;
  output [7:0]\y[0] ;

  wire \<const1> ;
  wire [7:0]\a[0] ;
  wire [7:0]\a[1] ;
  wire [7:0]\a[2] ;
  wire [7:0]\a[3] ;
  wire [7:0]\b[0] ;
  wire [7:0]\b[1] ;
  wire [7:0]\b[2] ;
  wire [7:0]\b[3] ;
  wire clock;
  wire [7:0]\genblk1[0].a_r_reg[0] ;
  wire [7:0]\genblk1[0].b_r_reg[0] ;
  wire [7:0]\genblk1[1].a_r_reg[1] ;
  wire [7:0]\genblk1[1].b_r_reg[1] ;
  wire [7:0]\genblk1[2].a_r_reg[2] ;
  wire [7:0]\genblk1[2].b_r_reg[2] ;
  wire [7:0]\genblk1[3].a_r_reg[3] ;
  wire [7:0]\genblk1[3].b_r_reg[3] ;
  wire reset;
  wire [7:0]\y[0] ;
  wire \y[0][4]_INST_0_i_1_n_0 ;
  wire \y[0][7]_INST_0_i_1_n_0 ;
  wire \y[0][7]_INST_0_i_2_n_0 ;
  wire [7:0]\y[1] ;
  wire \y[1][4]_INST_0_i_1_n_0 ;
  wire \y[1][7]_INST_0_i_1_n_0 ;
  wire \y[1][7]_INST_0_i_2_n_0 ;
  wire [7:0]\y[2] ;
  wire \y[2][4]_INST_0_i_1_n_0 ;
  wire \y[2][7]_INST_0_i_1_n_0 ;
  wire \y[2][7]_INST_0_i_2_n_0 ;
  wire [7:0]\y[3] ;
  wire \y[3][4]_INST_0_i_1_n_0 ;
  wire \y[3][7]_INST_0_i_1_n_0 ;
  wire \y[3][7]_INST_0_i_2_n_0 ;

  VCC VCC
       (.P(\<const1> ));
  FDRE \genblk1[0].a_r_reg[0][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [0]),
        .Q(\genblk1[0].a_r_reg[0] [0]),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [1]),
        .Q(\genblk1[0].a_r_reg[0] [1]),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [2]),
        .Q(\genblk1[0].a_r_reg[0] [2]),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [3]),
        .Q(\genblk1[0].a_r_reg[0] [3]),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [4]),
        .Q(\genblk1[0].a_r_reg[0] [4]),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [5]),
        .Q(\genblk1[0].a_r_reg[0] [5]),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [6]),
        .Q(\genblk1[0].a_r_reg[0] [6]),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [7]),
        .Q(\genblk1[0].a_r_reg[0] [7]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [0]),
        .Q(\genblk1[0].b_r_reg[0] [0]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [1]),
        .Q(\genblk1[0].b_r_reg[0] [1]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [2]),
        .Q(\genblk1[0].b_r_reg[0] [2]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [3]),
        .Q(\genblk1[0].b_r_reg[0] [3]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [4]),
        .Q(\genblk1[0].b_r_reg[0] [4]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [5]),
        .Q(\genblk1[0].b_r_reg[0] [5]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [6]),
        .Q(\genblk1[0].b_r_reg[0] [6]),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [7]),
        .Q(\genblk1[0].b_r_reg[0] [7]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [0]),
        .Q(\genblk1[1].a_r_reg[1] [0]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [1]),
        .Q(\genblk1[1].a_r_reg[1] [1]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [2]),
        .Q(\genblk1[1].a_r_reg[1] [2]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [3]),
        .Q(\genblk1[1].a_r_reg[1] [3]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [4]),
        .Q(\genblk1[1].a_r_reg[1] [4]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [5]),
        .Q(\genblk1[1].a_r_reg[1] [5]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [6]),
        .Q(\genblk1[1].a_r_reg[1] [6]),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [7]),
        .Q(\genblk1[1].a_r_reg[1] [7]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [0]),
        .Q(\genblk1[1].b_r_reg[1] [0]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [1]),
        .Q(\genblk1[1].b_r_reg[1] [1]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [2]),
        .Q(\genblk1[1].b_r_reg[1] [2]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [3]),
        .Q(\genblk1[1].b_r_reg[1] [3]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [4]),
        .Q(\genblk1[1].b_r_reg[1] [4]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [5]),
        .Q(\genblk1[1].b_r_reg[1] [5]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [6]),
        .Q(\genblk1[1].b_r_reg[1] [6]),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [7]),
        .Q(\genblk1[1].b_r_reg[1] [7]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [0]),
        .Q(\genblk1[2].a_r_reg[2] [0]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [1]),
        .Q(\genblk1[2].a_r_reg[2] [1]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [2]),
        .Q(\genblk1[2].a_r_reg[2] [2]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [3]),
        .Q(\genblk1[2].a_r_reg[2] [3]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [4]),
        .Q(\genblk1[2].a_r_reg[2] [4]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [5]),
        .Q(\genblk1[2].a_r_reg[2] [5]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [6]),
        .Q(\genblk1[2].a_r_reg[2] [6]),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [7]),
        .Q(\genblk1[2].a_r_reg[2] [7]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [0]),
        .Q(\genblk1[2].b_r_reg[2] [0]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [1]),
        .Q(\genblk1[2].b_r_reg[2] [1]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [2]),
        .Q(\genblk1[2].b_r_reg[2] [2]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [3]),
        .Q(\genblk1[2].b_r_reg[2] [3]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [4]),
        .Q(\genblk1[2].b_r_reg[2] [4]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [5]),
        .Q(\genblk1[2].b_r_reg[2] [5]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [6]),
        .Q(\genblk1[2].b_r_reg[2] [6]),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [7]),
        .Q(\genblk1[2].b_r_reg[2] [7]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [0]),
        .Q(\genblk1[3].a_r_reg[3] [0]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [1]),
        .Q(\genblk1[3].a_r_reg[3] [1]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [2]),
        .Q(\genblk1[3].a_r_reg[3] [2]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [3]),
        .Q(\genblk1[3].a_r_reg[3] [3]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [4]),
        .Q(\genblk1[3].a_r_reg[3] [4]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [5]),
        .Q(\genblk1[3].a_r_reg[3] [5]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [6]),
        .Q(\genblk1[3].a_r_reg[3] [6]),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [7]),
        .Q(\genblk1[3].a_r_reg[3] [7]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [0]),
        .Q(\genblk1[3].b_r_reg[3] [0]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [1]),
        .Q(\genblk1[3].b_r_reg[3] [1]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [2]),
        .Q(\genblk1[3].b_r_reg[3] [2]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [3]),
        .Q(\genblk1[3].b_r_reg[3] [3]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [4]),
        .Q(\genblk1[3].b_r_reg[3] [4]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [5]),
        .Q(\genblk1[3].b_r_reg[3] [5]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [6]),
        .Q(\genblk1[3].b_r_reg[3] [6]),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [7]),
        .Q(\genblk1[3].b_r_reg[3] [7]),
        .R(reset));
  LUT2 #(
    .INIT(4'h6)) 
    \y[0][0]_INST_0 
       (.I0(\genblk1[0].a_r_reg[0] [0]),
        .I1(\genblk1[0].b_r_reg[0] [0]),
        .O(\y[0] [0]));
  LUT4 #(
    .INIT(16'h8778)) 
    \y[0][1]_INST_0 
       (.I0(\genblk1[0].a_r_reg[0] [0]),
        .I1(\genblk1[0].b_r_reg[0] [0]),
        .I2(\genblk1[0].b_r_reg[0] [1]),
        .I3(\genblk1[0].a_r_reg[0] [1]),
        .O(\y[0] [1]));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \y[0][2]_INST_0 
       (.I0(\genblk1[0].b_r_reg[0] [0]),
        .I1(\genblk1[0].a_r_reg[0] [0]),
        .I2(\genblk1[0].a_r_reg[0] [1]),
        .I3(\genblk1[0].b_r_reg[0] [1]),
        .I4(\genblk1[0].b_r_reg[0] [2]),
        .I5(\genblk1[0].a_r_reg[0] [2]),
        .O(\y[0] [2]));
  LUT3 #(
    .INIT(8'h96)) 
    \y[0][3]_INST_0 
       (.I0(\y[0][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[0].b_r_reg[0] [3]),
        .I2(\genblk1[0].a_r_reg[0] [3]),
        .O(\y[0] [3]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[0][4]_INST_0 
       (.I0(\y[0][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[0].a_r_reg[0] [3]),
        .I2(\genblk1[0].b_r_reg[0] [3]),
        .I3(\genblk1[0].b_r_reg[0] [4]),
        .I4(\genblk1[0].a_r_reg[0] [4]),
        .O(\y[0] [4]));
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    \y[0][4]_INST_0_i_1 
       (.I0(\genblk1[0].b_r_reg[0] [2]),
        .I1(\genblk1[0].a_r_reg[0] [2]),
        .I2(\genblk1[0].b_r_reg[0] [0]),
        .I3(\genblk1[0].a_r_reg[0] [0]),
        .I4(\genblk1[0].a_r_reg[0] [1]),
        .I5(\genblk1[0].b_r_reg[0] [1]),
        .O(\y[0][4]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \y[0][5]_INST_0 
       (.I0(\y[0][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[0].b_r_reg[0] [5]),
        .I2(\genblk1[0].a_r_reg[0] [5]),
        .O(\y[0] [5]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[0][6]_INST_0 
       (.I0(\y[0][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[0].a_r_reg[0] [5]),
        .I2(\genblk1[0].b_r_reg[0] [5]),
        .I3(\genblk1[0].b_r_reg[0] [6]),
        .I4(\genblk1[0].a_r_reg[0] [6]),
        .O(\y[0] [6]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    \y[0][7]_INST_0 
       (.I0(\genblk1[0].b_r_reg[0] [5]),
        .I1(\genblk1[0].a_r_reg[0] [5]),
        .I2(\y[0][7]_INST_0_i_1_n_0 ),
        .I3(\genblk1[0].a_r_reg[0] [6]),
        .I4(\genblk1[0].b_r_reg[0] [6]),
        .I5(\y[0][7]_INST_0_i_2_n_0 ),
        .O(\y[0] [7]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \y[0][7]_INST_0_i_1 
       (.I0(\genblk1[0].b_r_reg[0] [4]),
        .I1(\genblk1[0].a_r_reg[0] [4]),
        .I2(\y[0][4]_INST_0_i_1_n_0 ),
        .I3(\genblk1[0].a_r_reg[0] [3]),
        .I4(\genblk1[0].b_r_reg[0] [3]),
        .O(\y[0][7]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[0][7]_INST_0_i_2 
       (.I0(\genblk1[0].a_r_reg[0] [7]),
        .I1(\genblk1[0].b_r_reg[0] [7]),
        .O(\y[0][7]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[1][0]_INST_0 
       (.I0(\genblk1[1].a_r_reg[1] [0]),
        .I1(\genblk1[1].b_r_reg[1] [0]),
        .O(\y[1] [0]));
  LUT4 #(
    .INIT(16'h8778)) 
    \y[1][1]_INST_0 
       (.I0(\genblk1[1].a_r_reg[1] [0]),
        .I1(\genblk1[1].b_r_reg[1] [0]),
        .I2(\genblk1[1].b_r_reg[1] [1]),
        .I3(\genblk1[1].a_r_reg[1] [1]),
        .O(\y[1] [1]));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \y[1][2]_INST_0 
       (.I0(\genblk1[1].b_r_reg[1] [0]),
        .I1(\genblk1[1].a_r_reg[1] [0]),
        .I2(\genblk1[1].a_r_reg[1] [1]),
        .I3(\genblk1[1].b_r_reg[1] [1]),
        .I4(\genblk1[1].b_r_reg[1] [2]),
        .I5(\genblk1[1].a_r_reg[1] [2]),
        .O(\y[1] [2]));
  LUT3 #(
    .INIT(8'h96)) 
    \y[1][3]_INST_0 
       (.I0(\y[1][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[1].b_r_reg[1] [3]),
        .I2(\genblk1[1].a_r_reg[1] [3]),
        .O(\y[1] [3]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[1][4]_INST_0 
       (.I0(\y[1][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[1].a_r_reg[1] [3]),
        .I2(\genblk1[1].b_r_reg[1] [3]),
        .I3(\genblk1[1].b_r_reg[1] [4]),
        .I4(\genblk1[1].a_r_reg[1] [4]),
        .O(\y[1] [4]));
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    \y[1][4]_INST_0_i_1 
       (.I0(\genblk1[1].b_r_reg[1] [2]),
        .I1(\genblk1[1].a_r_reg[1] [2]),
        .I2(\genblk1[1].b_r_reg[1] [0]),
        .I3(\genblk1[1].a_r_reg[1] [0]),
        .I4(\genblk1[1].a_r_reg[1] [1]),
        .I5(\genblk1[1].b_r_reg[1] [1]),
        .O(\y[1][4]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \y[1][5]_INST_0 
       (.I0(\y[1][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[1].b_r_reg[1] [5]),
        .I2(\genblk1[1].a_r_reg[1] [5]),
        .O(\y[1] [5]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[1][6]_INST_0 
       (.I0(\y[1][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[1].a_r_reg[1] [5]),
        .I2(\genblk1[1].b_r_reg[1] [5]),
        .I3(\genblk1[1].b_r_reg[1] [6]),
        .I4(\genblk1[1].a_r_reg[1] [6]),
        .O(\y[1] [6]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    \y[1][7]_INST_0 
       (.I0(\genblk1[1].b_r_reg[1] [5]),
        .I1(\genblk1[1].a_r_reg[1] [5]),
        .I2(\y[1][7]_INST_0_i_1_n_0 ),
        .I3(\genblk1[1].a_r_reg[1] [6]),
        .I4(\genblk1[1].b_r_reg[1] [6]),
        .I5(\y[1][7]_INST_0_i_2_n_0 ),
        .O(\y[1] [7]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \y[1][7]_INST_0_i_1 
       (.I0(\genblk1[1].b_r_reg[1] [4]),
        .I1(\genblk1[1].a_r_reg[1] [4]),
        .I2(\y[1][4]_INST_0_i_1_n_0 ),
        .I3(\genblk1[1].a_r_reg[1] [3]),
        .I4(\genblk1[1].b_r_reg[1] [3]),
        .O(\y[1][7]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[1][7]_INST_0_i_2 
       (.I0(\genblk1[1].a_r_reg[1] [7]),
        .I1(\genblk1[1].b_r_reg[1] [7]),
        .O(\y[1][7]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[2][0]_INST_0 
       (.I0(\genblk1[2].a_r_reg[2] [0]),
        .I1(\genblk1[2].b_r_reg[2] [0]),
        .O(\y[2] [0]));
  LUT4 #(
    .INIT(16'h8778)) 
    \y[2][1]_INST_0 
       (.I0(\genblk1[2].a_r_reg[2] [0]),
        .I1(\genblk1[2].b_r_reg[2] [0]),
        .I2(\genblk1[2].b_r_reg[2] [1]),
        .I3(\genblk1[2].a_r_reg[2] [1]),
        .O(\y[2] [1]));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \y[2][2]_INST_0 
       (.I0(\genblk1[2].b_r_reg[2] [0]),
        .I1(\genblk1[2].a_r_reg[2] [0]),
        .I2(\genblk1[2].a_r_reg[2] [1]),
        .I3(\genblk1[2].b_r_reg[2] [1]),
        .I4(\genblk1[2].b_r_reg[2] [2]),
        .I5(\genblk1[2].a_r_reg[2] [2]),
        .O(\y[2] [2]));
  LUT3 #(
    .INIT(8'h96)) 
    \y[2][3]_INST_0 
       (.I0(\y[2][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[2].b_r_reg[2] [3]),
        .I2(\genblk1[2].a_r_reg[2] [3]),
        .O(\y[2] [3]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[2][4]_INST_0 
       (.I0(\y[2][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[2].a_r_reg[2] [3]),
        .I2(\genblk1[2].b_r_reg[2] [3]),
        .I3(\genblk1[2].b_r_reg[2] [4]),
        .I4(\genblk1[2].a_r_reg[2] [4]),
        .O(\y[2] [4]));
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    \y[2][4]_INST_0_i_1 
       (.I0(\genblk1[2].b_r_reg[2] [2]),
        .I1(\genblk1[2].a_r_reg[2] [2]),
        .I2(\genblk1[2].b_r_reg[2] [0]),
        .I3(\genblk1[2].a_r_reg[2] [0]),
        .I4(\genblk1[2].a_r_reg[2] [1]),
        .I5(\genblk1[2].b_r_reg[2] [1]),
        .O(\y[2][4]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \y[2][5]_INST_0 
       (.I0(\y[2][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[2].b_r_reg[2] [5]),
        .I2(\genblk1[2].a_r_reg[2] [5]),
        .O(\y[2] [5]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[2][6]_INST_0 
       (.I0(\y[2][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[2].a_r_reg[2] [5]),
        .I2(\genblk1[2].b_r_reg[2] [5]),
        .I3(\genblk1[2].b_r_reg[2] [6]),
        .I4(\genblk1[2].a_r_reg[2] [6]),
        .O(\y[2] [6]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    \y[2][7]_INST_0 
       (.I0(\genblk1[2].b_r_reg[2] [5]),
        .I1(\genblk1[2].a_r_reg[2] [5]),
        .I2(\y[2][7]_INST_0_i_1_n_0 ),
        .I3(\genblk1[2].a_r_reg[2] [6]),
        .I4(\genblk1[2].b_r_reg[2] [6]),
        .I5(\y[2][7]_INST_0_i_2_n_0 ),
        .O(\y[2] [7]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \y[2][7]_INST_0_i_1 
       (.I0(\genblk1[2].b_r_reg[2] [4]),
        .I1(\genblk1[2].a_r_reg[2] [4]),
        .I2(\y[2][4]_INST_0_i_1_n_0 ),
        .I3(\genblk1[2].a_r_reg[2] [3]),
        .I4(\genblk1[2].b_r_reg[2] [3]),
        .O(\y[2][7]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[2][7]_INST_0_i_2 
       (.I0(\genblk1[2].a_r_reg[2] [7]),
        .I1(\genblk1[2].b_r_reg[2] [7]),
        .O(\y[2][7]_INST_0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[3][0]_INST_0 
       (.I0(\genblk1[3].a_r_reg[3] [0]),
        .I1(\genblk1[3].b_r_reg[3] [0]),
        .O(\y[3] [0]));
  LUT4 #(
    .INIT(16'h8778)) 
    \y[3][1]_INST_0 
       (.I0(\genblk1[3].a_r_reg[3] [0]),
        .I1(\genblk1[3].b_r_reg[3] [0]),
        .I2(\genblk1[3].b_r_reg[3] [1]),
        .I3(\genblk1[3].a_r_reg[3] [1]),
        .O(\y[3] [1]));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \y[3][2]_INST_0 
       (.I0(\genblk1[3].b_r_reg[3] [0]),
        .I1(\genblk1[3].a_r_reg[3] [0]),
        .I2(\genblk1[3].a_r_reg[3] [1]),
        .I3(\genblk1[3].b_r_reg[3] [1]),
        .I4(\genblk1[3].b_r_reg[3] [2]),
        .I5(\genblk1[3].a_r_reg[3] [2]),
        .O(\y[3] [2]));
  LUT3 #(
    .INIT(8'h96)) 
    \y[3][3]_INST_0 
       (.I0(\y[3][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[3].b_r_reg[3] [3]),
        .I2(\genblk1[3].a_r_reg[3] [3]),
        .O(\y[3] [3]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[3][4]_INST_0 
       (.I0(\y[3][4]_INST_0_i_1_n_0 ),
        .I1(\genblk1[3].a_r_reg[3] [3]),
        .I2(\genblk1[3].b_r_reg[3] [3]),
        .I3(\genblk1[3].b_r_reg[3] [4]),
        .I4(\genblk1[3].a_r_reg[3] [4]),
        .O(\y[3] [4]));
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    \y[3][4]_INST_0_i_1 
       (.I0(\genblk1[3].b_r_reg[3] [2]),
        .I1(\genblk1[3].a_r_reg[3] [2]),
        .I2(\genblk1[3].b_r_reg[3] [0]),
        .I3(\genblk1[3].a_r_reg[3] [0]),
        .I4(\genblk1[3].a_r_reg[3] [1]),
        .I5(\genblk1[3].b_r_reg[3] [1]),
        .O(\y[3][4]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \y[3][5]_INST_0 
       (.I0(\y[3][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[3].b_r_reg[3] [5]),
        .I2(\genblk1[3].a_r_reg[3] [5]),
        .O(\y[3] [5]));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \y[3][6]_INST_0 
       (.I0(\y[3][7]_INST_0_i_1_n_0 ),
        .I1(\genblk1[3].a_r_reg[3] [5]),
        .I2(\genblk1[3].b_r_reg[3] [5]),
        .I3(\genblk1[3].b_r_reg[3] [6]),
        .I4(\genblk1[3].a_r_reg[3] [6]),
        .O(\y[3] [6]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800)) 
    \y[3][7]_INST_0 
       (.I0(\genblk1[3].b_r_reg[3] [5]),
        .I1(\genblk1[3].a_r_reg[3] [5]),
        .I2(\y[3][7]_INST_0_i_1_n_0 ),
        .I3(\genblk1[3].a_r_reg[3] [6]),
        .I4(\genblk1[3].b_r_reg[3] [6]),
        .I5(\y[3][7]_INST_0_i_2_n_0 ),
        .O(\y[3] [7]));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \y[3][7]_INST_0_i_1 
       (.I0(\genblk1[3].b_r_reg[3] [4]),
        .I1(\genblk1[3].a_r_reg[3] [4]),
        .I2(\y[3][4]_INST_0_i_1_n_0 ),
        .I3(\genblk1[3].a_r_reg[3] [3]),
        .I4(\genblk1[3].b_r_reg[3] [3]),
        .O(\y[3][7]_INST_0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \y[3][7]_INST_0_i_2 
       (.I0(\genblk1[3].a_r_reg[3] [7]),
        .I1(\genblk1[3].b_r_reg[3] [7]),
        .O(\y[3][7]_INST_0_i_2_n_0 ));
endmodule
