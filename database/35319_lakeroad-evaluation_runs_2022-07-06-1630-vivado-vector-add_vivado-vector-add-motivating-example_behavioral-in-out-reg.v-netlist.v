// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Jul  6 23:30:31 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog
//               runs/2022-07-06-vector-add//vivado-vector-add-motivating-example//behavioral-in-out-reg.v-netlist.v
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

  wire \<const0> ;
  wire \<const1> ;
  wire GND_2;
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
  wire \genblk1[0].r[0][7]_i_2_n_0 ;
  wire \genblk1[0].r[0][7]_i_3_n_0 ;
  wire \genblk1[0].r[0][7]_i_4_n_0 ;
  wire \genblk1[0].r[0][7]_i_5_n_0 ;
  wire \genblk1[0].r[0][7]_i_6_n_0 ;
  wire \genblk1[0].r[0][7]_i_7_n_0 ;
  wire \genblk1[0].r[0][7]_i_8_n_0 ;
  wire \genblk1[0].r[0][7]_i_9_n_0 ;
  wire \genblk1[0].r_reg[0][7]_i_1_n_1 ;
  wire \genblk1[0].r_reg[0][7]_i_1_n_2 ;
  wire \genblk1[0].r_reg[0][7]_i_1_n_3 ;
  wire \genblk1[0].r_reg[0][7]_i_1_n_4 ;
  wire \genblk1[0].r_reg[0][7]_i_1_n_5 ;
  wire \genblk1[0].r_reg[0][7]_i_1_n_6 ;
  wire \genblk1[0].r_reg[0][7]_i_1_n_7 ;
  wire [7:0]\genblk1[1].a_r_reg[1] ;
  wire [7:0]\genblk1[1].b_r_reg[1] ;
  wire \genblk1[1].r[1][7]_i_2_n_0 ;
  wire \genblk1[1].r[1][7]_i_3_n_0 ;
  wire \genblk1[1].r[1][7]_i_4_n_0 ;
  wire \genblk1[1].r[1][7]_i_5_n_0 ;
  wire \genblk1[1].r[1][7]_i_6_n_0 ;
  wire \genblk1[1].r[1][7]_i_7_n_0 ;
  wire \genblk1[1].r[1][7]_i_8_n_0 ;
  wire \genblk1[1].r[1][7]_i_9_n_0 ;
  wire \genblk1[1].r_reg[1][7]_i_1_n_1 ;
  wire \genblk1[1].r_reg[1][7]_i_1_n_2 ;
  wire \genblk1[1].r_reg[1][7]_i_1_n_3 ;
  wire \genblk1[1].r_reg[1][7]_i_1_n_4 ;
  wire \genblk1[1].r_reg[1][7]_i_1_n_5 ;
  wire \genblk1[1].r_reg[1][7]_i_1_n_6 ;
  wire \genblk1[1].r_reg[1][7]_i_1_n_7 ;
  wire [7:0]\genblk1[2].a_r_reg[2] ;
  wire [7:0]\genblk1[2].b_r_reg[2] ;
  wire \genblk1[2].r[2][7]_i_2_n_0 ;
  wire \genblk1[2].r[2][7]_i_3_n_0 ;
  wire \genblk1[2].r[2][7]_i_4_n_0 ;
  wire \genblk1[2].r[2][7]_i_5_n_0 ;
  wire \genblk1[2].r[2][7]_i_6_n_0 ;
  wire \genblk1[2].r[2][7]_i_7_n_0 ;
  wire \genblk1[2].r[2][7]_i_8_n_0 ;
  wire \genblk1[2].r[2][7]_i_9_n_0 ;
  wire \genblk1[2].r_reg[2][7]_i_1_n_1 ;
  wire \genblk1[2].r_reg[2][7]_i_1_n_2 ;
  wire \genblk1[2].r_reg[2][7]_i_1_n_3 ;
  wire \genblk1[2].r_reg[2][7]_i_1_n_4 ;
  wire \genblk1[2].r_reg[2][7]_i_1_n_5 ;
  wire \genblk1[2].r_reg[2][7]_i_1_n_6 ;
  wire \genblk1[2].r_reg[2][7]_i_1_n_7 ;
  wire [7:0]\genblk1[3].a_r_reg[3] ;
  wire [7:0]\genblk1[3].b_r_reg[3] ;
  wire \genblk1[3].r[3][7]_i_2_n_0 ;
  wire \genblk1[3].r[3][7]_i_3_n_0 ;
  wire \genblk1[3].r[3][7]_i_4_n_0 ;
  wire \genblk1[3].r[3][7]_i_5_n_0 ;
  wire \genblk1[3].r[3][7]_i_6_n_0 ;
  wire \genblk1[3].r[3][7]_i_7_n_0 ;
  wire \genblk1[3].r[3][7]_i_8_n_0 ;
  wire \genblk1[3].r[3][7]_i_9_n_0 ;
  wire \genblk1[3].r_reg[3][7]_i_1_n_1 ;
  wire \genblk1[3].r_reg[3][7]_i_1_n_2 ;
  wire \genblk1[3].r_reg[3][7]_i_1_n_3 ;
  wire \genblk1[3].r_reg[3][7]_i_1_n_4 ;
  wire \genblk1[3].r_reg[3][7]_i_1_n_5 ;
  wire \genblk1[3].r_reg[3][7]_i_1_n_6 ;
  wire \genblk1[3].r_reg[3][7]_i_1_n_7 ;
  wire reset;
  wire [7:0]\s[0] ;
  wire [7:0]\s[1] ;
  wire [7:0]\s[2] ;
  wire [7:0]\s[3] ;
  wire [7:0]\y[0] ;
  wire [7:0]\y[1] ;
  wire [7:0]\y[2] ;
  wire [7:0]\y[3] ;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
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
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_2 
       (.I0(\genblk1[0].a_r_reg[0] [7]),
        .I1(\genblk1[0].b_r_reg[0] [7]),
        .O(\genblk1[0].r[0][7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_3 
       (.I0(\genblk1[0].a_r_reg[0] [6]),
        .I1(\genblk1[0].b_r_reg[0] [6]),
        .O(\genblk1[0].r[0][7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_4 
       (.I0(\genblk1[0].a_r_reg[0] [5]),
        .I1(\genblk1[0].b_r_reg[0] [5]),
        .O(\genblk1[0].r[0][7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_5 
       (.I0(\genblk1[0].a_r_reg[0] [4]),
        .I1(\genblk1[0].b_r_reg[0] [4]),
        .O(\genblk1[0].r[0][7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_6 
       (.I0(\genblk1[0].a_r_reg[0] [3]),
        .I1(\genblk1[0].b_r_reg[0] [3]),
        .O(\genblk1[0].r[0][7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_7 
       (.I0(\genblk1[0].a_r_reg[0] [2]),
        .I1(\genblk1[0].b_r_reg[0] [2]),
        .O(\genblk1[0].r[0][7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_8 
       (.I0(\genblk1[0].a_r_reg[0] [1]),
        .I1(\genblk1[0].b_r_reg[0] [1]),
        .O(\genblk1[0].r[0][7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[0].r[0][7]_i_9 
       (.I0(\genblk1[0].a_r_reg[0] [0]),
        .I1(\genblk1[0].b_r_reg[0] [0]),
        .O(\genblk1[0].r[0][7]_i_9_n_0 ));
  FDRE \genblk1[0].r_reg[0][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [0]),
        .Q(\y[0] [0]),
        .R(reset));
  FDRE \genblk1[0].r_reg[0][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [1]),
        .Q(\y[0] [1]),
        .R(reset));
  FDRE \genblk1[0].r_reg[0][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [2]),
        .Q(\y[0] [2]),
        .R(reset));
  FDRE \genblk1[0].r_reg[0][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [3]),
        .Q(\y[0] [3]),
        .R(reset));
  FDRE \genblk1[0].r_reg[0][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [4]),
        .Q(\y[0] [4]),
        .R(reset));
  FDRE \genblk1[0].r_reg[0][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [5]),
        .Q(\y[0] [5]),
        .R(reset));
  FDRE \genblk1[0].r_reg[0][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [6]),
        .Q(\y[0] [6]),
        .R(reset));
  FDRE \genblk1[0].r_reg[0][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[0] [7]),
        .Q(\y[0] [7]),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \genblk1[0].r_reg[0][7]_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\genblk1[0].r_reg[0][7]_i_1_n_1 ,\genblk1[0].r_reg[0][7]_i_1_n_2 ,\genblk1[0].r_reg[0][7]_i_1_n_3 ,\genblk1[0].r_reg[0][7]_i_1_n_4 ,\genblk1[0].r_reg[0][7]_i_1_n_5 ,\genblk1[0].r_reg[0][7]_i_1_n_6 ,\genblk1[0].r_reg[0][7]_i_1_n_7 }),
        .DI({\<const0> ,\genblk1[0].a_r_reg[0] [6:0]}),
        .O(\s[0] ),
        .S({\genblk1[0].r[0][7]_i_2_n_0 ,\genblk1[0].r[0][7]_i_3_n_0 ,\genblk1[0].r[0][7]_i_4_n_0 ,\genblk1[0].r[0][7]_i_5_n_0 ,\genblk1[0].r[0][7]_i_6_n_0 ,\genblk1[0].r[0][7]_i_7_n_0 ,\genblk1[0].r[0][7]_i_8_n_0 ,\genblk1[0].r[0][7]_i_9_n_0 }));
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
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_2 
       (.I0(\genblk1[1].a_r_reg[1] [7]),
        .I1(\genblk1[1].b_r_reg[1] [7]),
        .O(\genblk1[1].r[1][7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_3 
       (.I0(\genblk1[1].a_r_reg[1] [6]),
        .I1(\genblk1[1].b_r_reg[1] [6]),
        .O(\genblk1[1].r[1][7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_4 
       (.I0(\genblk1[1].a_r_reg[1] [5]),
        .I1(\genblk1[1].b_r_reg[1] [5]),
        .O(\genblk1[1].r[1][7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_5 
       (.I0(\genblk1[1].a_r_reg[1] [4]),
        .I1(\genblk1[1].b_r_reg[1] [4]),
        .O(\genblk1[1].r[1][7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_6 
       (.I0(\genblk1[1].a_r_reg[1] [3]),
        .I1(\genblk1[1].b_r_reg[1] [3]),
        .O(\genblk1[1].r[1][7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_7 
       (.I0(\genblk1[1].a_r_reg[1] [2]),
        .I1(\genblk1[1].b_r_reg[1] [2]),
        .O(\genblk1[1].r[1][7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_8 
       (.I0(\genblk1[1].a_r_reg[1] [1]),
        .I1(\genblk1[1].b_r_reg[1] [1]),
        .O(\genblk1[1].r[1][7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[1].r[1][7]_i_9 
       (.I0(\genblk1[1].a_r_reg[1] [0]),
        .I1(\genblk1[1].b_r_reg[1] [0]),
        .O(\genblk1[1].r[1][7]_i_9_n_0 ));
  FDRE \genblk1[1].r_reg[1][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [0]),
        .Q(\y[1] [0]),
        .R(reset));
  FDRE \genblk1[1].r_reg[1][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [1]),
        .Q(\y[1] [1]),
        .R(reset));
  FDRE \genblk1[1].r_reg[1][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [2]),
        .Q(\y[1] [2]),
        .R(reset));
  FDRE \genblk1[1].r_reg[1][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [3]),
        .Q(\y[1] [3]),
        .R(reset));
  FDRE \genblk1[1].r_reg[1][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [4]),
        .Q(\y[1] [4]),
        .R(reset));
  FDRE \genblk1[1].r_reg[1][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [5]),
        .Q(\y[1] [5]),
        .R(reset));
  FDRE \genblk1[1].r_reg[1][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [6]),
        .Q(\y[1] [6]),
        .R(reset));
  FDRE \genblk1[1].r_reg[1][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[1] [7]),
        .Q(\y[1] [7]),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \genblk1[1].r_reg[1][7]_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\genblk1[1].r_reg[1][7]_i_1_n_1 ,\genblk1[1].r_reg[1][7]_i_1_n_2 ,\genblk1[1].r_reg[1][7]_i_1_n_3 ,\genblk1[1].r_reg[1][7]_i_1_n_4 ,\genblk1[1].r_reg[1][7]_i_1_n_5 ,\genblk1[1].r_reg[1][7]_i_1_n_6 ,\genblk1[1].r_reg[1][7]_i_1_n_7 }),
        .DI({\<const0> ,\genblk1[1].a_r_reg[1] [6:0]}),
        .O(\s[1] ),
        .S({\genblk1[1].r[1][7]_i_2_n_0 ,\genblk1[1].r[1][7]_i_3_n_0 ,\genblk1[1].r[1][7]_i_4_n_0 ,\genblk1[1].r[1][7]_i_5_n_0 ,\genblk1[1].r[1][7]_i_6_n_0 ,\genblk1[1].r[1][7]_i_7_n_0 ,\genblk1[1].r[1][7]_i_8_n_0 ,\genblk1[1].r[1][7]_i_9_n_0 }));
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
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_2 
       (.I0(\genblk1[2].a_r_reg[2] [7]),
        .I1(\genblk1[2].b_r_reg[2] [7]),
        .O(\genblk1[2].r[2][7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_3 
       (.I0(\genblk1[2].a_r_reg[2] [6]),
        .I1(\genblk1[2].b_r_reg[2] [6]),
        .O(\genblk1[2].r[2][7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_4 
       (.I0(\genblk1[2].a_r_reg[2] [5]),
        .I1(\genblk1[2].b_r_reg[2] [5]),
        .O(\genblk1[2].r[2][7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_5 
       (.I0(\genblk1[2].a_r_reg[2] [4]),
        .I1(\genblk1[2].b_r_reg[2] [4]),
        .O(\genblk1[2].r[2][7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_6 
       (.I0(\genblk1[2].a_r_reg[2] [3]),
        .I1(\genblk1[2].b_r_reg[2] [3]),
        .O(\genblk1[2].r[2][7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_7 
       (.I0(\genblk1[2].a_r_reg[2] [2]),
        .I1(\genblk1[2].b_r_reg[2] [2]),
        .O(\genblk1[2].r[2][7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_8 
       (.I0(\genblk1[2].a_r_reg[2] [1]),
        .I1(\genblk1[2].b_r_reg[2] [1]),
        .O(\genblk1[2].r[2][7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[2].r[2][7]_i_9 
       (.I0(\genblk1[2].a_r_reg[2] [0]),
        .I1(\genblk1[2].b_r_reg[2] [0]),
        .O(\genblk1[2].r[2][7]_i_9_n_0 ));
  FDRE \genblk1[2].r_reg[2][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [0]),
        .Q(\y[2] [0]),
        .R(reset));
  FDRE \genblk1[2].r_reg[2][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [1]),
        .Q(\y[2] [1]),
        .R(reset));
  FDRE \genblk1[2].r_reg[2][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [2]),
        .Q(\y[2] [2]),
        .R(reset));
  FDRE \genblk1[2].r_reg[2][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [3]),
        .Q(\y[2] [3]),
        .R(reset));
  FDRE \genblk1[2].r_reg[2][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [4]),
        .Q(\y[2] [4]),
        .R(reset));
  FDRE \genblk1[2].r_reg[2][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [5]),
        .Q(\y[2] [5]),
        .R(reset));
  FDRE \genblk1[2].r_reg[2][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [6]),
        .Q(\y[2] [6]),
        .R(reset));
  FDRE \genblk1[2].r_reg[2][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[2] [7]),
        .Q(\y[2] [7]),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \genblk1[2].r_reg[2][7]_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\genblk1[2].r_reg[2][7]_i_1_n_1 ,\genblk1[2].r_reg[2][7]_i_1_n_2 ,\genblk1[2].r_reg[2][7]_i_1_n_3 ,\genblk1[2].r_reg[2][7]_i_1_n_4 ,\genblk1[2].r_reg[2][7]_i_1_n_5 ,\genblk1[2].r_reg[2][7]_i_1_n_6 ,\genblk1[2].r_reg[2][7]_i_1_n_7 }),
        .DI({\<const0> ,\genblk1[2].a_r_reg[2] [6:0]}),
        .O(\s[2] ),
        .S({\genblk1[2].r[2][7]_i_2_n_0 ,\genblk1[2].r[2][7]_i_3_n_0 ,\genblk1[2].r[2][7]_i_4_n_0 ,\genblk1[2].r[2][7]_i_5_n_0 ,\genblk1[2].r[2][7]_i_6_n_0 ,\genblk1[2].r[2][7]_i_7_n_0 ,\genblk1[2].r[2][7]_i_8_n_0 ,\genblk1[2].r[2][7]_i_9_n_0 }));
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
    \genblk1[3].r[3][7]_i_2 
       (.I0(\genblk1[3].a_r_reg[3] [7]),
        .I1(\genblk1[3].b_r_reg[3] [7]),
        .O(\genblk1[3].r[3][7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[3].r[3][7]_i_3 
       (.I0(\genblk1[3].a_r_reg[3] [6]),
        .I1(\genblk1[3].b_r_reg[3] [6]),
        .O(\genblk1[3].r[3][7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[3].r[3][7]_i_4 
       (.I0(\genblk1[3].a_r_reg[3] [5]),
        .I1(\genblk1[3].b_r_reg[3] [5]),
        .O(\genblk1[3].r[3][7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[3].r[3][7]_i_5 
       (.I0(\genblk1[3].a_r_reg[3] [4]),
        .I1(\genblk1[3].b_r_reg[3] [4]),
        .O(\genblk1[3].r[3][7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[3].r[3][7]_i_6 
       (.I0(\genblk1[3].a_r_reg[3] [3]),
        .I1(\genblk1[3].b_r_reg[3] [3]),
        .O(\genblk1[3].r[3][7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[3].r[3][7]_i_7 
       (.I0(\genblk1[3].a_r_reg[3] [2]),
        .I1(\genblk1[3].b_r_reg[3] [2]),
        .O(\genblk1[3].r[3][7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[3].r[3][7]_i_8 
       (.I0(\genblk1[3].a_r_reg[3] [1]),
        .I1(\genblk1[3].b_r_reg[3] [1]),
        .O(\genblk1[3].r[3][7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \genblk1[3].r[3][7]_i_9 
       (.I0(\genblk1[3].a_r_reg[3] [0]),
        .I1(\genblk1[3].b_r_reg[3] [0]),
        .O(\genblk1[3].r[3][7]_i_9_n_0 ));
  FDRE \genblk1[3].r_reg[3][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [0]),
        .Q(\y[3] [0]),
        .R(reset));
  FDRE \genblk1[3].r_reg[3][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [1]),
        .Q(\y[3] [1]),
        .R(reset));
  FDRE \genblk1[3].r_reg[3][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [2]),
        .Q(\y[3] [2]),
        .R(reset));
  FDRE \genblk1[3].r_reg[3][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [3]),
        .Q(\y[3] [3]),
        .R(reset));
  FDRE \genblk1[3].r_reg[3][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [4]),
        .Q(\y[3] [4]),
        .R(reset));
  FDRE \genblk1[3].r_reg[3][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [5]),
        .Q(\y[3] [5]),
        .R(reset));
  FDRE \genblk1[3].r_reg[3][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [6]),
        .Q(\y[3] [6]),
        .R(reset));
  FDRE \genblk1[3].r_reg[3][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\s[3] [7]),
        .Q(\y[3] [7]),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \genblk1[3].r_reg[3][7]_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\genblk1[3].r_reg[3][7]_i_1_n_1 ,\genblk1[3].r_reg[3][7]_i_1_n_2 ,\genblk1[3].r_reg[3][7]_i_1_n_3 ,\genblk1[3].r_reg[3][7]_i_1_n_4 ,\genblk1[3].r_reg[3][7]_i_1_n_5 ,\genblk1[3].r_reg[3][7]_i_1_n_6 ,\genblk1[3].r_reg[3][7]_i_1_n_7 }),
        .DI({\<const0> ,\genblk1[3].a_r_reg[3] [6:0]}),
        .O(\s[3] ),
        .S({\genblk1[3].r[3][7]_i_2_n_0 ,\genblk1[3].r[3][7]_i_3_n_0 ,\genblk1[3].r[3][7]_i_4_n_0 ,\genblk1[3].r[3][7]_i_5_n_0 ,\genblk1[3].r[3][7]_i_6_n_0 ,\genblk1[3].r[3][7]_i_7_n_0 ,\genblk1[3].r[3][7]_i_8_n_0 ,\genblk1[3].r[3][7]_i_9_n_0 }));
endmodule
