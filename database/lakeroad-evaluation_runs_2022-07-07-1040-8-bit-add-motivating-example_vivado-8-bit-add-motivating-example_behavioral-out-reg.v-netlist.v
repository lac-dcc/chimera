// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 17:42:43 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog
//               runs/2022-07-07-1040-8-bit-add-motivating-example/vivado-8-bit-add-motivating-example//behavioral-out-reg.v-netlist.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* STRUCTURAL_NETLIST = "yes" *)
module main
   (clock,
    reset,
    a,
    b,
    y);
  input clock;
  input reset;
  input [7:0]a;
  input [7:0]b;
  output [7:0]y;

  wire \<const0> ;
  wire \<const1> ;
  wire GND_2;
  wire [7:0]a;
  wire [7:0]b;
  wire clock;
  wire \r[7]_i_2_n_0 ;
  wire \r[7]_i_3_n_0 ;
  wire \r[7]_i_4_n_0 ;
  wire \r[7]_i_5_n_0 ;
  wire \r[7]_i_6_n_0 ;
  wire \r[7]_i_7_n_0 ;
  wire \r[7]_i_8_n_0 ;
  wire \r[7]_i_9_n_0 ;
  wire \r_reg[7]_i_1_n_1 ;
  wire \r_reg[7]_i_1_n_2 ;
  wire \r_reg[7]_i_1_n_3 ;
  wire \r_reg[7]_i_1_n_4 ;
  wire \r_reg[7]_i_1_n_5 ;
  wire \r_reg[7]_i_1_n_6 ;
  wire \r_reg[7]_i_1_n_7 ;
  wire reset;
  wire [7:0]s;
  wire [7:0]y;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_2 
       (.I0(a[7]),
        .I1(b[7]),
        .O(\r[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_3 
       (.I0(a[6]),
        .I1(b[6]),
        .O(\r[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_4 
       (.I0(a[5]),
        .I1(b[5]),
        .O(\r[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_5 
       (.I0(a[4]),
        .I1(b[4]),
        .O(\r[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_6 
       (.I0(a[3]),
        .I1(b[3]),
        .O(\r[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_7 
       (.I0(a[2]),
        .I1(b[2]),
        .O(\r[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_8 
       (.I0(a[1]),
        .I1(b[1]),
        .O(\r[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \r[7]_i_9 
       (.I0(a[0]),
        .I1(b[0]),
        .O(\r[7]_i_9_n_0 ));
  FDRE \r_reg[0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[0]),
        .Q(y[0]),
        .R(reset));
  FDRE \r_reg[1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[1]),
        .Q(y[1]),
        .R(reset));
  FDRE \r_reg[2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[2]),
        .Q(y[2]),
        .R(reset));
  FDRE \r_reg[3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[3]),
        .Q(y[3]),
        .R(reset));
  FDRE \r_reg[4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[4]),
        .Q(y[4]),
        .R(reset));
  FDRE \r_reg[5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[5]),
        .Q(y[5]),
        .R(reset));
  FDRE \r_reg[6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[6]),
        .Q(y[6]),
        .R(reset));
  FDRE \r_reg[7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(s[7]),
        .Q(y[7]),
        .R(reset));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \r_reg[7]_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\r_reg[7]_i_1_n_1 ,\r_reg[7]_i_1_n_2 ,\r_reg[7]_i_1_n_3 ,\r_reg[7]_i_1_n_4 ,\r_reg[7]_i_1_n_5 ,\r_reg[7]_i_1_n_6 ,\r_reg[7]_i_1_n_7 }),
        .DI({\<const0> ,a[6:0]}),
        .O(s),
        .S({\r[7]_i_2_n_0 ,\r[7]_i_3_n_0 ,\r[7]_i_4_n_0 ,\r[7]_i_5_n_0 ,\r[7]_i_6_n_0 ,\r[7]_i_7_n_0 ,\r[7]_i_8_n_0 ,\r[7]_i_9_n_0 }));
endmodule
