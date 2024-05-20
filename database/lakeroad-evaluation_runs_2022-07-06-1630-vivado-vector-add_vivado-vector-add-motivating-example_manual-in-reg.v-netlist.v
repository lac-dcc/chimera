// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Jul  6 23:26:34 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog runs/2022-07-06-vector-add//vivado-vector-add-motivating-example//manual-in-reg.v-netlist.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module baseline
   (\y[0] ,
    O5,
    O6);
  output [7:0]\y[0] ;
  input [7:0]O5;
  input [7:0]O6;

  wire \<const0> ;
  wire [7:0]O5;
  wire [7:0]O6;
  wire [7:0]p;
  wire [7:0]\y[0] ;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry0
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI(O5),
        .O(\y[0] ),
        .S(p));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l0
       (.I0(O5[0]),
        .I1(O6[0]),
        .O(p[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l1
       (.I0(O5[1]),
        .I1(O6[1]),
        .O(p[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l2
       (.I0(O5[2]),
        .I1(O6[2]),
        .O(p[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l3
       (.I0(O5[3]),
        .I1(O6[3]),
        .O(p[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l4
       (.I0(O5[4]),
        .I1(O6[4]),
        .O(p[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l5
       (.I0(O5[5]),
        .I1(O6[5]),
        .O(p[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l6
       (.I0(O5[6]),
        .I1(O6[6]),
        .O(p[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l7
       (.I0(O5[7]),
        .I1(O6[7]),
        .O(p[7]));
endmodule

(* ORIG_REF_NAME = "baseline" *) 
module baseline_0
   (\y[1] ,
    O3,
    O4);
  output [7:0]\y[1] ;
  input [7:0]O3;
  input [7:0]O4;

  wire \<const0> ;
  wire [7:0]O3;
  wire [7:0]O4;
  wire [7:0]p;
  wire [7:0]\y[1] ;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry0
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI(O3),
        .O(\y[1] ),
        .S(p));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l0
       (.I0(O3[0]),
        .I1(O4[0]),
        .O(p[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l1
       (.I0(O3[1]),
        .I1(O4[1]),
        .O(p[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l2
       (.I0(O3[2]),
        .I1(O4[2]),
        .O(p[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l3
       (.I0(O3[3]),
        .I1(O4[3]),
        .O(p[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l4
       (.I0(O3[4]),
        .I1(O4[4]),
        .O(p[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l5
       (.I0(O3[5]),
        .I1(O4[5]),
        .O(p[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l6
       (.I0(O3[6]),
        .I1(O4[6]),
        .O(p[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l7
       (.I0(O3[7]),
        .I1(O4[7]),
        .O(p[7]));
endmodule

(* ORIG_REF_NAME = "baseline" *) 
module baseline_1
   (\y[2] ,
    O1,
    O2);
  output [7:0]\y[2] ;
  input [7:0]O1;
  input [7:0]O2;

  wire \<const0> ;
  wire [7:0]O1;
  wire [7:0]O2;
  wire [7:0]p;
  wire [7:0]\y[2] ;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry0
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI(O1),
        .O(\y[2] ),
        .S(p));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l0
       (.I0(O1[0]),
        .I1(O2[0]),
        .O(p[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l1
       (.I0(O1[1]),
        .I1(O2[1]),
        .O(p[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l2
       (.I0(O1[2]),
        .I1(O2[2]),
        .O(p[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l3
       (.I0(O1[3]),
        .I1(O2[3]),
        .O(p[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l4
       (.I0(O1[4]),
        .I1(O2[4]),
        .O(p[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l5
       (.I0(O1[5]),
        .I1(O2[5]),
        .O(p[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l6
       (.I0(O1[6]),
        .I1(O2[6]),
        .O(p[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l7
       (.I0(O1[7]),
        .I1(O2[7]),
        .O(p[7]));
endmodule

(* ORIG_REF_NAME = "baseline" *) 
module baseline_2
   (\y[3] ,
    a,
    b);
  output [7:0]\y[3] ;
  input [7:0]a;
  input [7:0]b;

  wire \<const0> ;
  wire [7:0]a;
  wire [7:0]b;
  wire [7:0]p;
  wire [7:0]\y[3] ;

  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry0
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI(a),
        .O(\y[3] ),
        .S(p));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l0
       (.I0(a[0]),
        .I1(b[0]),
        .O(p[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l1
       (.I0(a[1]),
        .I1(b[1]),
        .O(p[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l2
       (.I0(a[2]),
        .I1(b[2]),
        .O(p[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l3
       (.I0(a[3]),
        .I1(b[3]),
        .O(p[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l4
       (.I0(a[4]),
        .I1(b[4]),
        .O(p[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l5
       (.I0(a[5]),
        .I1(b[5]),
        .O(p[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l6
       (.I0(a[6]),
        .I1(b[6]),
        .O(p[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT2 #(
    .INIT(4'h6)) 
    l7
       (.I0(a[7]),
        .I1(b[7]),
        .O(p[7]));
endmodule

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
  wire \genblk1[0].a_r_reg_n_0_[0][0] ;
  wire \genblk1[0].a_r_reg_n_0_[0][1] ;
  wire \genblk1[0].a_r_reg_n_0_[0][2] ;
  wire \genblk1[0].a_r_reg_n_0_[0][3] ;
  wire \genblk1[0].a_r_reg_n_0_[0][4] ;
  wire \genblk1[0].a_r_reg_n_0_[0][5] ;
  wire \genblk1[0].a_r_reg_n_0_[0][6] ;
  wire \genblk1[0].a_r_reg_n_0_[0][7] ;
  wire \genblk1[0].b_r_reg_n_0_[0][0] ;
  wire \genblk1[0].b_r_reg_n_0_[0][1] ;
  wire \genblk1[0].b_r_reg_n_0_[0][2] ;
  wire \genblk1[0].b_r_reg_n_0_[0][3] ;
  wire \genblk1[0].b_r_reg_n_0_[0][4] ;
  wire \genblk1[0].b_r_reg_n_0_[0][5] ;
  wire \genblk1[0].b_r_reg_n_0_[0][6] ;
  wire \genblk1[0].b_r_reg_n_0_[0][7] ;
  wire \genblk1[1].a_r_reg_n_0_[1][0] ;
  wire \genblk1[1].a_r_reg_n_0_[1][1] ;
  wire \genblk1[1].a_r_reg_n_0_[1][2] ;
  wire \genblk1[1].a_r_reg_n_0_[1][3] ;
  wire \genblk1[1].a_r_reg_n_0_[1][4] ;
  wire \genblk1[1].a_r_reg_n_0_[1][5] ;
  wire \genblk1[1].a_r_reg_n_0_[1][6] ;
  wire \genblk1[1].a_r_reg_n_0_[1][7] ;
  wire \genblk1[1].b_r_reg_n_0_[1][0] ;
  wire \genblk1[1].b_r_reg_n_0_[1][1] ;
  wire \genblk1[1].b_r_reg_n_0_[1][2] ;
  wire \genblk1[1].b_r_reg_n_0_[1][3] ;
  wire \genblk1[1].b_r_reg_n_0_[1][4] ;
  wire \genblk1[1].b_r_reg_n_0_[1][5] ;
  wire \genblk1[1].b_r_reg_n_0_[1][6] ;
  wire \genblk1[1].b_r_reg_n_0_[1][7] ;
  wire \genblk1[2].a_r_reg_n_0_[2][0] ;
  wire \genblk1[2].a_r_reg_n_0_[2][1] ;
  wire \genblk1[2].a_r_reg_n_0_[2][2] ;
  wire \genblk1[2].a_r_reg_n_0_[2][3] ;
  wire \genblk1[2].a_r_reg_n_0_[2][4] ;
  wire \genblk1[2].a_r_reg_n_0_[2][5] ;
  wire \genblk1[2].a_r_reg_n_0_[2][6] ;
  wire \genblk1[2].a_r_reg_n_0_[2][7] ;
  wire \genblk1[2].b_r_reg_n_0_[2][0] ;
  wire \genblk1[2].b_r_reg_n_0_[2][1] ;
  wire \genblk1[2].b_r_reg_n_0_[2][2] ;
  wire \genblk1[2].b_r_reg_n_0_[2][3] ;
  wire \genblk1[2].b_r_reg_n_0_[2][4] ;
  wire \genblk1[2].b_r_reg_n_0_[2][5] ;
  wire \genblk1[2].b_r_reg_n_0_[2][6] ;
  wire \genblk1[2].b_r_reg_n_0_[2][7] ;
  wire \genblk1[3].a_r_reg_n_0_[3][0] ;
  wire \genblk1[3].a_r_reg_n_0_[3][1] ;
  wire \genblk1[3].a_r_reg_n_0_[3][2] ;
  wire \genblk1[3].a_r_reg_n_0_[3][3] ;
  wire \genblk1[3].a_r_reg_n_0_[3][4] ;
  wire \genblk1[3].a_r_reg_n_0_[3][5] ;
  wire \genblk1[3].a_r_reg_n_0_[3][6] ;
  wire \genblk1[3].a_r_reg_n_0_[3][7] ;
  wire \genblk1[3].b_r_reg_n_0_[3][0] ;
  wire \genblk1[3].b_r_reg_n_0_[3][1] ;
  wire \genblk1[3].b_r_reg_n_0_[3][2] ;
  wire \genblk1[3].b_r_reg_n_0_[3][3] ;
  wire \genblk1[3].b_r_reg_n_0_[3][4] ;
  wire \genblk1[3].b_r_reg_n_0_[3][5] ;
  wire \genblk1[3].b_r_reg_n_0_[3][6] ;
  wire \genblk1[3].b_r_reg_n_0_[3][7] ;
  wire reset;
  wire [7:0]\y[0] ;
  wire [7:0]\y[1] ;
  wire [7:0]\y[2] ;
  wire [7:0]\y[3] ;

  VCC VCC
       (.P(\<const1> ));
  FDRE \genblk1[0].a_r_reg[0][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [0]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][0] ),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [1]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][1] ),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [2]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][2] ),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [3]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][3] ),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [4]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][4] ),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [5]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][5] ),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [6]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][6] ),
        .R(reset));
  FDRE \genblk1[0].a_r_reg[0][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[0] [7]),
        .Q(\genblk1[0].a_r_reg_n_0_[0][7] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [0]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][0] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [1]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][1] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [2]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][2] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [3]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][3] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [4]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][4] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [5]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][5] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [6]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][6] ),
        .R(reset));
  FDRE \genblk1[0].b_r_reg[0][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[0] [7]),
        .Q(\genblk1[0].b_r_reg_n_0_[0][7] ),
        .R(reset));
  baseline \genblk1[0].inst 
       (.O5({\genblk1[0].a_r_reg_n_0_[0][7] ,\genblk1[0].a_r_reg_n_0_[0][6] ,\genblk1[0].a_r_reg_n_0_[0][5] ,\genblk1[0].a_r_reg_n_0_[0][4] ,\genblk1[0].a_r_reg_n_0_[0][3] ,\genblk1[0].a_r_reg_n_0_[0][2] ,\genblk1[0].a_r_reg_n_0_[0][1] ,\genblk1[0].a_r_reg_n_0_[0][0] }),
        .O6({\genblk1[0].b_r_reg_n_0_[0][7] ,\genblk1[0].b_r_reg_n_0_[0][6] ,\genblk1[0].b_r_reg_n_0_[0][5] ,\genblk1[0].b_r_reg_n_0_[0][4] ,\genblk1[0].b_r_reg_n_0_[0][3] ,\genblk1[0].b_r_reg_n_0_[0][2] ,\genblk1[0].b_r_reg_n_0_[0][1] ,\genblk1[0].b_r_reg_n_0_[0][0] }),
        .\y[0] (\y[0] ));
  FDRE \genblk1[1].a_r_reg[1][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [0]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][0] ),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [1]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][1] ),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [2]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][2] ),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [3]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][3] ),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [4]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][4] ),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [5]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][5] ),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [6]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][6] ),
        .R(reset));
  FDRE \genblk1[1].a_r_reg[1][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[1] [7]),
        .Q(\genblk1[1].a_r_reg_n_0_[1][7] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [0]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][0] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [1]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][1] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [2]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][2] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [3]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][3] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [4]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][4] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [5]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][5] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [6]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][6] ),
        .R(reset));
  FDRE \genblk1[1].b_r_reg[1][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[1] [7]),
        .Q(\genblk1[1].b_r_reg_n_0_[1][7] ),
        .R(reset));
  baseline_0 \genblk1[1].inst 
       (.O3({\genblk1[1].a_r_reg_n_0_[1][7] ,\genblk1[1].a_r_reg_n_0_[1][6] ,\genblk1[1].a_r_reg_n_0_[1][5] ,\genblk1[1].a_r_reg_n_0_[1][4] ,\genblk1[1].a_r_reg_n_0_[1][3] ,\genblk1[1].a_r_reg_n_0_[1][2] ,\genblk1[1].a_r_reg_n_0_[1][1] ,\genblk1[1].a_r_reg_n_0_[1][0] }),
        .O4({\genblk1[1].b_r_reg_n_0_[1][7] ,\genblk1[1].b_r_reg_n_0_[1][6] ,\genblk1[1].b_r_reg_n_0_[1][5] ,\genblk1[1].b_r_reg_n_0_[1][4] ,\genblk1[1].b_r_reg_n_0_[1][3] ,\genblk1[1].b_r_reg_n_0_[1][2] ,\genblk1[1].b_r_reg_n_0_[1][1] ,\genblk1[1].b_r_reg_n_0_[1][0] }),
        .\y[1] (\y[1] ));
  FDRE \genblk1[2].a_r_reg[2][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [0]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][0] ),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [1]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][1] ),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [2]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][2] ),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [3]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][3] ),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [4]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][4] ),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [5]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][5] ),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [6]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][6] ),
        .R(reset));
  FDRE \genblk1[2].a_r_reg[2][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[2] [7]),
        .Q(\genblk1[2].a_r_reg_n_0_[2][7] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [0]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][0] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [1]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][1] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [2]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][2] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [3]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][3] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [4]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][4] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [5]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][5] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [6]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][6] ),
        .R(reset));
  FDRE \genblk1[2].b_r_reg[2][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[2] [7]),
        .Q(\genblk1[2].b_r_reg_n_0_[2][7] ),
        .R(reset));
  baseline_1 \genblk1[2].inst 
       (.O1({\genblk1[2].a_r_reg_n_0_[2][7] ,\genblk1[2].a_r_reg_n_0_[2][6] ,\genblk1[2].a_r_reg_n_0_[2][5] ,\genblk1[2].a_r_reg_n_0_[2][4] ,\genblk1[2].a_r_reg_n_0_[2][3] ,\genblk1[2].a_r_reg_n_0_[2][2] ,\genblk1[2].a_r_reg_n_0_[2][1] ,\genblk1[2].a_r_reg_n_0_[2][0] }),
        .O2({\genblk1[2].b_r_reg_n_0_[2][7] ,\genblk1[2].b_r_reg_n_0_[2][6] ,\genblk1[2].b_r_reg_n_0_[2][5] ,\genblk1[2].b_r_reg_n_0_[2][4] ,\genblk1[2].b_r_reg_n_0_[2][3] ,\genblk1[2].b_r_reg_n_0_[2][2] ,\genblk1[2].b_r_reg_n_0_[2][1] ,\genblk1[2].b_r_reg_n_0_[2][0] }),
        .\y[2] (\y[2] ));
  FDRE \genblk1[3].a_r_reg[3][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [0]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][0] ),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [1]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][1] ),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [2]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][2] ),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [3]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][3] ),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [4]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][4] ),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [5]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][5] ),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [6]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][6] ),
        .R(reset));
  FDRE \genblk1[3].a_r_reg[3][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\a[3] [7]),
        .Q(\genblk1[3].a_r_reg_n_0_[3][7] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][0] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [0]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][0] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][1] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [1]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][1] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][2] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [2]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][2] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][3] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [3]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][3] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][4] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [4]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][4] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][5] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [5]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][5] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][6] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [6]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][6] ),
        .R(reset));
  FDRE \genblk1[3].b_r_reg[3][7] 
       (.C(clock),
        .CE(\<const1> ),
        .D(\b[3] [7]),
        .Q(\genblk1[3].b_r_reg_n_0_[3][7] ),
        .R(reset));
  baseline_2 \genblk1[3].inst 
       (.a({\genblk1[3].a_r_reg_n_0_[3][7] ,\genblk1[3].a_r_reg_n_0_[3][6] ,\genblk1[3].a_r_reg_n_0_[3][5] ,\genblk1[3].a_r_reg_n_0_[3][4] ,\genblk1[3].a_r_reg_n_0_[3][3] ,\genblk1[3].a_r_reg_n_0_[3][2] ,\genblk1[3].a_r_reg_n_0_[3][1] ,\genblk1[3].a_r_reg_n_0_[3][0] }),
        .b({\genblk1[3].b_r_reg_n_0_[3][7] ,\genblk1[3].b_r_reg_n_0_[3][6] ,\genblk1[3].b_r_reg_n_0_[3][5] ,\genblk1[3].b_r_reg_n_0_[3][4] ,\genblk1[3].b_r_reg_n_0_[3][3] ,\genblk1[3].b_r_reg_n_0_[3][2] ,\genblk1[3].b_r_reg_n_0_[3][1] ,\genblk1[3].b_r_reg_n_0_[3][0] }),
        .\y[3] (\y[3] ));
endmodule
