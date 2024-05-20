// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Jun 29 17:49:43 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -file dot-product-verilog-post-synth-post-opt-post-place.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lakeroad_xilinx_ultrascale_plus_add32
   (v0_write_data,
    .v0_write_data_31_sp_1(v0_write_data_31_sn_1),
    add0_left,
    add0_right);
  output [31:0]v0_write_data;
  input [31:0]add0_left;
  input [31:0]add0_right;
  input v0_write_data_31_sn_1;

  wire \<const0> ;
  wire [31:0]add0_left;
  wire [31:0]add0_out;
  wire [31:0]add0_right;
  wire [7:7]co_15;
  wire [7:7]co_19;
  wire [7:7]co_27;
  wire [7:7]co_31;
  wire [7:7]co_35;
  wire [7:7]co_7;
  wire [7:0]luts_O6_1;
  wire [7:0]luts_O6_13;
  wire [7:0]luts_O6_17;
  wire [7:0]luts_O6_21;
  wire [7:0]luts_O6_25;
  wire [7:0]luts_O6_29;
  wire [7:0]luts_O6_33;
  wire [7:0]luts_O6_37;
  wire [7:0]luts_O6_5;
  wire [7:0]luts_O6_9;
  wire [31:0]v0_write_data;
  wire v0_write_data_31_sn_1;
  wire [7:0]\NLW_carry-17_CO_UNCONNECTED ;
  wire [7:0]\NLW_carry-35_CO_UNCONNECTED ;
  wire [7:0]\NLW_carry-44_CO_UNCONNECTED ;
  wire [7:0]\NLW_carry-62_CO_UNCONNECTED ;
  wire [7:0]\NLW_carry-71_CO_UNCONNECTED ;
  wire [7:0]\NLW_carry-80_CO_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-0 
       (.I0(add0_left[0]),
        .I1(add0_right[0]),
        .O(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-18 
       (.I0(add0_left[8]),
        .I1(add0_right[8]),
        .O(luts_O6_9[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-27 
       (.I0(add0_left[0]),
        .I1(add0_right[0]),
        .O(luts_O6_13[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-36 
       (.I0(add0_left[8]),
        .I1(add0_right[8]),
        .O(luts_O6_17[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-45 
       (.I0(add0_left[16]),
        .I1(add0_right[16]),
        .O(luts_O6_21[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-54 
       (.I0(add0_left[0]),
        .I1(add0_right[0]),
        .O(luts_O6_25[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-63 
       (.I0(add0_left[8]),
        .I1(add0_right[8]),
        .O(luts_O6_29[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-72 
       (.I0(add0_left[16]),
        .I1(add0_right[16]),
        .O(luts_O6_33[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-81 
       (.I0(add0_left[24]),
        .I1(add0_right[24]),
        .O(luts_O6_37[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-9 
       (.I0(add0_left[0]),
        .I1(add0_right[0]),
        .O(luts_O6_5[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-1 
       (.I0(add0_left[1]),
        .I1(add0_right[1]),
        .O(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-10 
       (.I0(add0_left[1]),
        .I1(add0_right[1]),
        .O(luts_O6_5[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-19 
       (.I0(add0_left[9]),
        .I1(add0_right[9]),
        .O(luts_O6_9[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-28 
       (.I0(add0_left[1]),
        .I1(add0_right[1]),
        .O(luts_O6_13[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-37 
       (.I0(add0_left[9]),
        .I1(add0_right[9]),
        .O(luts_O6_17[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-46 
       (.I0(add0_left[17]),
        .I1(add0_right[17]),
        .O(luts_O6_21[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-55 
       (.I0(add0_left[1]),
        .I1(add0_right[1]),
        .O(luts_O6_25[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-64 
       (.I0(add0_left[9]),
        .I1(add0_right[9]),
        .O(luts_O6_29[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-73 
       (.I0(add0_left[17]),
        .I1(add0_right[17]),
        .O(luts_O6_33[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \B_LUT-82 
       (.I0(add0_left[25]),
        .I1(add0_right[25]),
        .O(luts_O6_37[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-11 
       (.I0(add0_left[2]),
        .I1(add0_right[2]),
        .O(luts_O6_5[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-2 
       (.I0(add0_left[2]),
        .I1(add0_right[2]),
        .O(luts_O6_1[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-20 
       (.I0(add0_left[10]),
        .I1(add0_right[10]),
        .O(luts_O6_9[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-29 
       (.I0(add0_left[2]),
        .I1(add0_right[2]),
        .O(luts_O6_13[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-38 
       (.I0(add0_left[10]),
        .I1(add0_right[10]),
        .O(luts_O6_17[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-47 
       (.I0(add0_left[18]),
        .I1(add0_right[18]),
        .O(luts_O6_21[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-56 
       (.I0(add0_left[2]),
        .I1(add0_right[2]),
        .O(luts_O6_25[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-65 
       (.I0(add0_left[10]),
        .I1(add0_right[10]),
        .O(luts_O6_29[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-74 
       (.I0(add0_left[18]),
        .I1(add0_right[18]),
        .O(luts_O6_33[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \C_LUT-83 
       (.I0(add0_left[26]),
        .I1(add0_right[26]),
        .O(luts_O6_37[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-12 
       (.I0(add0_left[3]),
        .I1(add0_right[3]),
        .O(luts_O6_5[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-21 
       (.I0(add0_left[11]),
        .I1(add0_right[11]),
        .O(luts_O6_9[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-3 
       (.I0(add0_left[3]),
        .I1(add0_right[3]),
        .O(luts_O6_1[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-30 
       (.I0(add0_left[3]),
        .I1(add0_right[3]),
        .O(luts_O6_13[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-39 
       (.I0(add0_left[11]),
        .I1(add0_right[11]),
        .O(luts_O6_17[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-48 
       (.I0(add0_left[19]),
        .I1(add0_right[19]),
        .O(luts_O6_21[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-57 
       (.I0(add0_left[3]),
        .I1(add0_right[3]),
        .O(luts_O6_25[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-66 
       (.I0(add0_left[11]),
        .I1(add0_right[11]),
        .O(luts_O6_29[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-75 
       (.I0(add0_left[19]),
        .I1(add0_right[19]),
        .O(luts_O6_33[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \D_LUT-84 
       (.I0(add0_left[27]),
        .I1(add0_right[27]),
        .O(luts_O6_37[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-13 
       (.I0(add0_left[4]),
        .I1(add0_right[4]),
        .O(luts_O6_5[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-22 
       (.I0(add0_left[12]),
        .I1(add0_right[12]),
        .O(luts_O6_9[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-31 
       (.I0(add0_left[4]),
        .I1(add0_right[4]),
        .O(luts_O6_13[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-4 
       (.I0(add0_left[4]),
        .I1(add0_right[4]),
        .O(luts_O6_1[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-40 
       (.I0(add0_left[12]),
        .I1(add0_right[12]),
        .O(luts_O6_17[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-49 
       (.I0(add0_left[20]),
        .I1(add0_right[20]),
        .O(luts_O6_21[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-58 
       (.I0(add0_left[4]),
        .I1(add0_right[4]),
        .O(luts_O6_25[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-67 
       (.I0(add0_left[12]),
        .I1(add0_right[12]),
        .O(luts_O6_29[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-76 
       (.I0(add0_left[20]),
        .I1(add0_right[20]),
        .O(luts_O6_33[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \E_LUT-85 
       (.I0(add0_left[28]),
        .I1(add0_right[28]),
        .O(luts_O6_37[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-14 
       (.I0(add0_left[5]),
        .I1(add0_right[5]),
        .O(luts_O6_5[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-23 
       (.I0(add0_left[13]),
        .I1(add0_right[13]),
        .O(luts_O6_9[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-32 
       (.I0(add0_left[5]),
        .I1(add0_right[5]),
        .O(luts_O6_13[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-41 
       (.I0(add0_left[13]),
        .I1(add0_right[13]),
        .O(luts_O6_17[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-5 
       (.I0(add0_left[5]),
        .I1(add0_right[5]),
        .O(luts_O6_1[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-50 
       (.I0(add0_left[21]),
        .I1(add0_right[21]),
        .O(luts_O6_21[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-59 
       (.I0(add0_left[5]),
        .I1(add0_right[5]),
        .O(luts_O6_25[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-68 
       (.I0(add0_left[13]),
        .I1(add0_right[13]),
        .O(luts_O6_29[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-77 
       (.I0(add0_left[21]),
        .I1(add0_right[21]),
        .O(luts_O6_33[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \F_LUT-86 
       (.I0(add0_left[29]),
        .I1(add0_right[29]),
        .O(luts_O6_37[5]));
  GND GND
       (.G(\<const0> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-15 
       (.I0(add0_left[6]),
        .I1(add0_right[6]),
        .O(luts_O6_5[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-24 
       (.I0(add0_left[14]),
        .I1(add0_right[14]),
        .O(luts_O6_9[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-33 
       (.I0(add0_left[6]),
        .I1(add0_right[6]),
        .O(luts_O6_13[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-42 
       (.I0(add0_left[14]),
        .I1(add0_right[14]),
        .O(luts_O6_17[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-51 
       (.I0(add0_left[22]),
        .I1(add0_right[22]),
        .O(luts_O6_21[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-6 
       (.I0(add0_left[6]),
        .I1(add0_right[6]),
        .O(luts_O6_1[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-60 
       (.I0(add0_left[6]),
        .I1(add0_right[6]),
        .O(luts_O6_25[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-69 
       (.I0(add0_left[14]),
        .I1(add0_right[14]),
        .O(luts_O6_29[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-78 
       (.I0(add0_left[22]),
        .I1(add0_right[22]),
        .O(luts_O6_33[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \G_LUT-87 
       (.I0(add0_left[30]),
        .I1(add0_right[30]),
        .O(luts_O6_37[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-16 
       (.I0(add0_left[7]),
        .I1(add0_right[7]),
        .O(luts_O6_5[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-25 
       (.I0(add0_left[15]),
        .I1(add0_right[15]),
        .O(luts_O6_9[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-34 
       (.I0(add0_left[7]),
        .I1(add0_right[7]),
        .O(luts_O6_13[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-43 
       (.I0(add0_left[15]),
        .I1(add0_right[15]),
        .O(luts_O6_17[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-52 
       (.I0(add0_left[23]),
        .I1(add0_right[23]),
        .O(luts_O6_21[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-61 
       (.I0(add0_left[7]),
        .I1(add0_right[7]),
        .O(luts_O6_25[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-7 
       (.I0(add0_left[7]),
        .I1(add0_right[7]),
        .O(luts_O6_1[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-70 
       (.I0(add0_left[15]),
        .I1(add0_right[15]),
        .O(luts_O6_29[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-79 
       (.I0(add0_left[23]),
        .I1(add0_right[23]),
        .O(luts_O6_33[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \H_LUT-88 
       (.I0(add0_left[31]),
        .I1(add0_right[31]),
        .O(luts_O6_37[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-17 
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_7,\NLW_carry-17_CO_UNCONNECTED [6:0]}),
        .DI(add0_left[7:0]),
        .S(luts_O6_5));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-26 
       (.CI(co_7),
        .CI_TOP(\<const0> ),
        .DI(add0_left[15:8]),
        .O(add0_out[15:8]),
        .S(luts_O6_9));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-35 
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_15,\NLW_carry-35_CO_UNCONNECTED [6:0]}),
        .DI(add0_left[7:0]),
        .S(luts_O6_13));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-44 
       (.CI(co_15),
        .CI_TOP(\<const0> ),
        .CO({co_19,\NLW_carry-44_CO_UNCONNECTED [6:0]}),
        .DI(add0_left[15:8]),
        .S(luts_O6_17));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-53 
       (.CI(co_19),
        .CI_TOP(\<const0> ),
        .DI(add0_left[23:16]),
        .O(add0_out[23:16]),
        .S(luts_O6_21));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-62 
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({co_27,\NLW_carry-62_CO_UNCONNECTED [6:0]}),
        .DI(add0_left[7:0]),
        .S(luts_O6_25));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-71 
       (.CI(co_27),
        .CI_TOP(\<const0> ),
        .CO({co_31,\NLW_carry-71_CO_UNCONNECTED [6:0]}),
        .DI(add0_left[15:8]),
        .S(luts_O6_29));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-8 
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI(add0_left[7:0]),
        .O(add0_out[7:0]),
        .S(luts_O6_1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-80 
       (.CI(co_31),
        .CI_TOP(\<const0> ),
        .CO({co_35,\NLW_carry-80_CO_UNCONNECTED [6:0]}),
        .DI(add0_left[23:16]),
        .S(luts_O6_33));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-89 
       (.CI(co_35),
        .CI_TOP(\<const0> ),
        .DI(add0_left[31:24]),
        .O(add0_out[31:24]),
        .S(luts_O6_37));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[0]_INST_0 
       (.I0(add0_out[0]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[10]_INST_0 
       (.I0(add0_out[10]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[11]_INST_0 
       (.I0(add0_out[11]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[11]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[12]_INST_0 
       (.I0(add0_out[12]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[12]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[13]_INST_0 
       (.I0(add0_out[13]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[13]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[14]_INST_0 
       (.I0(add0_out[14]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[14]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[15]_INST_0 
       (.I0(add0_out[15]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[15]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[16]_INST_0 
       (.I0(add0_out[16]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[16]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[17]_INST_0 
       (.I0(add0_out[17]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[17]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[18]_INST_0 
       (.I0(add0_out[18]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[18]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[19]_INST_0 
       (.I0(add0_out[19]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[19]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[1]_INST_0 
       (.I0(add0_out[1]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[20]_INST_0 
       (.I0(add0_out[20]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[20]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[21]_INST_0 
       (.I0(add0_out[21]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[21]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[22]_INST_0 
       (.I0(add0_out[22]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[22]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[23]_INST_0 
       (.I0(add0_out[23]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[23]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[24]_INST_0 
       (.I0(add0_out[24]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[24]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[25]_INST_0 
       (.I0(add0_out[25]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[25]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[26]_INST_0 
       (.I0(add0_out[26]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[26]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[27]_INST_0 
       (.I0(add0_out[27]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[27]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[28]_INST_0 
       (.I0(add0_out[28]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[28]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[29]_INST_0 
       (.I0(add0_out[29]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[29]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[2]_INST_0 
       (.I0(add0_out[2]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[30]_INST_0 
       (.I0(add0_out[30]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[30]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[31]_INST_0 
       (.I0(add0_out[31]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[31]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[3]_INST_0 
       (.I0(add0_out[3]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[4]_INST_0 
       (.I0(add0_out[4]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[4]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[5]_INST_0 
       (.I0(add0_out[5]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[6]_INST_0 
       (.I0(add0_out[6]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[7]_INST_0 
       (.I0(add0_out[7]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[8]_INST_0 
       (.I0(add0_out[8]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[8]));
  LUT2 #(
    .INIT(4'h2)) 
    \v0_write_data[9]_INST_0 
       (.I0(add0_out[9]),
        .I1(v0_write_data_31_sn_1),
        .O(v0_write_data[9]));
endmodule

module lakeroad_xilinx_ultrascale_plus_add4
   (D,
    upd3_go_in,
    a);
  output [3:0]D;
  input upd3_go_in;
  input [3:0]a;

  wire \<const0> ;
  wire [3:0]D;
  wire ZERO;
  wire [3:0]a;
  wire [3:0]add1_out;
  wire [7:0]luts_O6_1;
  wire upd3_go_in;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \A_LUT-0 
       (.I0(a[0]),
        .I1(upd3_go_in),
        .O(luts_O6_1[0]));
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \carry-8 
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI({ZERO,ZERO,ZERO,ZERO,a}),
        .O(add1_out),
        .S({ZERO,ZERO,ZERO,ZERO,a[3:1],luts_O6_1[0]}));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out[0]_i_1 
       (.I0(add1_out[0]),
        .I1(upd3_go_in),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out[1]_i_1__0 
       (.I0(add1_out[1]),
        .I1(upd3_go_in),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out[2]_i_1 
       (.I0(add1_out[2]),
        .I1(upd3_go_in),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \out[3]_i_2__0 
       (.I0(add1_out[3]),
        .I1(upd3_go_in),
        .O(D[3]));
endmodule

(* ECO_CHECKSUM = "ccc32fcd" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    A0_addr0,
    A0_write_data,
    A0_write_en,
    A0_clk,
    A0_read_data,
    A0_done,
    B0_addr0,
    B0_write_data,
    B0_write_en,
    B0_clk,
    B0_read_data,
    B0_done,
    v0_addr0,
    v0_write_data,
    v0_write_en,
    v0_clk,
    v0_read_data,
    v0_done);
  input go;
  input clk;
  input reset;
  output done;
  output [3:0]A0_addr0;
  output [31:0]A0_write_data;
  output A0_write_en;
  output A0_clk;
  input [31:0]A0_read_data;
  input A0_done;
  output [3:0]B0_addr0;
  output [31:0]B0_write_data;
  output B0_write_en;
  output B0_clk;
  input [31:0]B0_read_data;
  input B0_done;
  output v0_addr0;
  output [31:0]v0_write_data;
  output v0_write_en;
  output v0_clk;
  input [31:0]v0_read_data;
  input v0_done;

  wire \<const0> ;
  wire [3:0]A0_addr0;
  wire [31:0]A0_read_data;
  wire A_read0_0_n_1;
  wire A_read0_0_n_10;
  wire A_read0_0_n_11;
  wire A_read0_0_n_12;
  wire A_read0_0_n_13;
  wire A_read0_0_n_14;
  wire A_read0_0_n_15;
  wire A_read0_0_n_16;
  wire A_read0_0_n_17;
  wire A_read0_0_n_18;
  wire A_read0_0_n_19;
  wire A_read0_0_n_2;
  wire A_read0_0_n_20;
  wire A_read0_0_n_21;
  wire A_read0_0_n_22;
  wire A_read0_0_n_23;
  wire A_read0_0_n_24;
  wire A_read0_0_n_25;
  wire A_read0_0_n_26;
  wire A_read0_0_n_27;
  wire A_read0_0_n_28;
  wire A_read0_0_n_29;
  wire A_read0_0_n_3;
  wire A_read0_0_n_30;
  wire A_read0_0_n_31;
  wire A_read0_0_n_32;
  wire A_read0_0_n_4;
  wire A_read0_0_n_5;
  wire A_read0_0_n_6;
  wire A_read0_0_n_7;
  wire A_read0_0_n_8;
  wire A_read0_0_n_9;
  wire [31:0]B0_read_data;
  wire B_read0_0_done;
  wire B_read0_0_n_0;
  wire B_read0_0_n_1;
  wire B_read0_0_n_10;
  wire B_read0_0_n_11;
  wire B_read0_0_n_12;
  wire B_read0_0_n_13;
  wire B_read0_0_n_14;
  wire B_read0_0_n_15;
  wire B_read0_0_n_16;
  wire B_read0_0_n_17;
  wire B_read0_0_n_18;
  wire B_read0_0_n_19;
  wire B_read0_0_n_2;
  wire B_read0_0_n_20;
  wire B_read0_0_n_21;
  wire B_read0_0_n_22;
  wire B_read0_0_n_23;
  wire B_read0_0_n_24;
  wire B_read0_0_n_25;
  wire B_read0_0_n_26;
  wire B_read0_0_n_27;
  wire B_read0_0_n_28;
  wire B_read0_0_n_29;
  wire B_read0_0_n_3;
  wire B_read0_0_n_30;
  wire B_read0_0_n_31;
  wire B_read0_0_n_4;
  wire B_read0_0_n_5;
  wire B_read0_0_n_6;
  wire B_read0_0_n_7;
  wire B_read0_0_n_8;
  wire B_read0_0_n_9;
  wire [31:0]add0_left;
  wire [31:0]add0_right;
  wire [3:0]add1_left;
  wire bin_read0_0_done;
  wire bin_read0_0_write_en;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond00_go_in;
  wire done;
  wire dot_0_done;
  wire [31:0]dot_0_in;
  wire fsm_n_2;
  wire fsm_n_36;
  wire fsm_n_39;
  wire fsm_n_40;
  wire fsm_n_42;
  wire go;
  wire i0_done;
  wire [3:0]i0_in;
  wire [3:3]i0_out;
  wire i0_write_en;
  wire let2_go_in;
  wire mult_pipe0_n_1;
  wire mult_pipe0_n_10;
  wire mult_pipe0_n_11;
  wire mult_pipe0_n_12;
  wire mult_pipe0_n_13;
  wire mult_pipe0_n_14;
  wire mult_pipe0_n_15;
  wire mult_pipe0_n_16;
  wire mult_pipe0_n_17;
  wire mult_pipe0_n_18;
  wire mult_pipe0_n_19;
  wire mult_pipe0_n_2;
  wire mult_pipe0_n_20;
  wire mult_pipe0_n_21;
  wire mult_pipe0_n_22;
  wire mult_pipe0_n_23;
  wire mult_pipe0_n_24;
  wire mult_pipe0_n_25;
  wire mult_pipe0_n_26;
  wire mult_pipe0_n_27;
  wire mult_pipe0_n_28;
  wire mult_pipe0_n_29;
  wire mult_pipe0_n_3;
  wire mult_pipe0_n_30;
  wire mult_pipe0_n_31;
  wire mult_pipe0_n_32;
  wire mult_pipe0_n_4;
  wire mult_pipe0_n_5;
  wire mult_pipe0_n_6;
  wire mult_pipe0_n_7;
  wire mult_pipe0_n_8;
  wire mult_pipe0_n_9;
  wire reset;
  wire upd3_go_in;
  wire v0_done;
  wire [31:0]v0_read_data;
  wire [31:0]v0_write_data;
  wire v0_write_en;

  assign A0_clk = clk;
  assign A0_write_data[31] = \<const0> ;
  assign A0_write_data[30] = \<const0> ;
  assign A0_write_data[29] = \<const0> ;
  assign A0_write_data[28] = \<const0> ;
  assign A0_write_data[27] = \<const0> ;
  assign A0_write_data[26] = \<const0> ;
  assign A0_write_data[25] = \<const0> ;
  assign A0_write_data[24] = \<const0> ;
  assign A0_write_data[23] = \<const0> ;
  assign A0_write_data[22] = \<const0> ;
  assign A0_write_data[21] = \<const0> ;
  assign A0_write_data[20] = \<const0> ;
  assign A0_write_data[19] = \<const0> ;
  assign A0_write_data[18] = \<const0> ;
  assign A0_write_data[17] = \<const0> ;
  assign A0_write_data[16] = \<const0> ;
  assign A0_write_data[15] = \<const0> ;
  assign A0_write_data[14] = \<const0> ;
  assign A0_write_data[13] = \<const0> ;
  assign A0_write_data[12] = \<const0> ;
  assign A0_write_data[11] = \<const0> ;
  assign A0_write_data[10] = \<const0> ;
  assign A0_write_data[9] = \<const0> ;
  assign A0_write_data[8] = \<const0> ;
  assign A0_write_data[7] = \<const0> ;
  assign A0_write_data[6] = \<const0> ;
  assign A0_write_data[5] = \<const0> ;
  assign A0_write_data[4] = \<const0> ;
  assign A0_write_data[3] = \<const0> ;
  assign A0_write_data[2] = \<const0> ;
  assign A0_write_data[1] = \<const0> ;
  assign A0_write_data[0] = \<const0> ;
  assign A0_write_en = \<const0> ;
  assign B0_addr0[3:0] = A0_addr0;
  assign B0_clk = clk;
  assign B0_write_data[31] = \<const0> ;
  assign B0_write_data[30] = \<const0> ;
  assign B0_write_data[29] = \<const0> ;
  assign B0_write_data[28] = \<const0> ;
  assign B0_write_data[27] = \<const0> ;
  assign B0_write_data[26] = \<const0> ;
  assign B0_write_data[25] = \<const0> ;
  assign B0_write_data[24] = \<const0> ;
  assign B0_write_data[23] = \<const0> ;
  assign B0_write_data[22] = \<const0> ;
  assign B0_write_data[21] = \<const0> ;
  assign B0_write_data[20] = \<const0> ;
  assign B0_write_data[19] = \<const0> ;
  assign B0_write_data[18] = \<const0> ;
  assign B0_write_data[17] = \<const0> ;
  assign B0_write_data[16] = \<const0> ;
  assign B0_write_data[15] = \<const0> ;
  assign B0_write_data[14] = \<const0> ;
  assign B0_write_data[13] = \<const0> ;
  assign B0_write_data[12] = \<const0> ;
  assign B0_write_data[11] = \<const0> ;
  assign B0_write_data[10] = \<const0> ;
  assign B0_write_data[9] = \<const0> ;
  assign B0_write_data[8] = \<const0> ;
  assign B0_write_data[7] = \<const0> ;
  assign B0_write_data[6] = \<const0> ;
  assign B0_write_data[5] = \<const0> ;
  assign B0_write_data[4] = \<const0> ;
  assign B0_write_data[3] = \<const0> ;
  assign B0_write_data[2] = \<const0> ;
  assign B0_write_data[1] = \<const0> ;
  assign B0_write_data[0] = \<const0> ;
  assign B0_write_en = \<const0> ;
  assign v0_addr0 = \<const0> ;
  assign v0_clk = clk;
  std_reg A_read0_0
       (.A0_read_data(A0_read_data),
        .B_read0_0_done(B_read0_0_done),
        .Q({A_read0_0_n_1,A_read0_0_n_2,A_read0_0_n_3,A_read0_0_n_4,A_read0_0_n_5,A_read0_0_n_6,A_read0_0_n_7,A_read0_0_n_8,A_read0_0_n_9,A_read0_0_n_10,A_read0_0_n_11,A_read0_0_n_12,A_read0_0_n_13,A_read0_0_n_14,A_read0_0_n_15,A_read0_0_n_16,A_read0_0_n_17,A_read0_0_n_18,A_read0_0_n_19,A_read0_0_n_20,A_read0_0_n_21,A_read0_0_n_22,A_read0_0_n_23,A_read0_0_n_24,A_read0_0_n_25,A_read0_0_n_26,A_read0_0_n_27,A_read0_0_n_28,A_read0_0_n_29,A_read0_0_n_30,A_read0_0_n_31,A_read0_0_n_32}),
        .clk(clk),
        .done_reg_0(fsm_n_42),
        .reset(reset));
  std_reg_0 B_read0_0
       (.B0_read_data(B0_read_data),
        .Q({B_read0_0_n_0,B_read0_0_n_1,B_read0_0_n_2,B_read0_0_n_3,B_read0_0_n_4,B_read0_0_n_5,B_read0_0_n_6,B_read0_0_n_7,B_read0_0_n_8,B_read0_0_n_9,B_read0_0_n_10,B_read0_0_n_11,B_read0_0_n_12,B_read0_0_n_13,B_read0_0_n_14,B_read0_0_n_15,B_read0_0_n_16,B_read0_0_n_17,B_read0_0_n_18,B_read0_0_n_19,B_read0_0_n_20,B_read0_0_n_21,B_read0_0_n_22,B_read0_0_n_23,B_read0_0_n_24,B_read0_0_n_25,B_read0_0_n_26,B_read0_0_n_27,B_read0_0_n_28,B_read0_0_n_29,B_read0_0_n_30,B_read0_0_n_31}),
        .clk(clk),
        .\out_reg[0]_0 (fsm_n_42),
        .reset(reset));
  GND GND
       (.G(\<const0> ));
  std_add add0
       (.add0_left(add0_left),
        .add0_right(add0_right),
        .v0_write_data(v0_write_data),
        .v0_write_data_31_sp_1(fsm_n_36));
  std_add__parameterized0 add1
       (.D(i0_in),
        .a(add1_left),
        .upd3_go_in(upd3_go_in));
  std_reg_1 bin_read0_0
       (.D(dot_0_in),
        .E(bin_read0_0_write_en),
        .bin_read0_0_done(bin_read0_0_done),
        .clk(clk),
        .\out_reg[0]_0 (fsm_n_39),
        .\out_reg[31]_0 ({mult_pipe0_n_1,mult_pipe0_n_2,mult_pipe0_n_3,mult_pipe0_n_4,mult_pipe0_n_5,mult_pipe0_n_6,mult_pipe0_n_7,mult_pipe0_n_8,mult_pipe0_n_9,mult_pipe0_n_10,mult_pipe0_n_11,mult_pipe0_n_12,mult_pipe0_n_13,mult_pipe0_n_14,mult_pipe0_n_15,mult_pipe0_n_16,mult_pipe0_n_17,mult_pipe0_n_18,mult_pipe0_n_19,mult_pipe0_n_20,mult_pipe0_n_21,mult_pipe0_n_22,mult_pipe0_n_23,mult_pipe0_n_24,mult_pipe0_n_25,mult_pipe0_n_26,mult_pipe0_n_27,mult_pipe0_n_28,mult_pipe0_n_29,mult_pipe0_n_30,mult_pipe0_n_31,mult_pipe0_n_32}),
        .reset(reset));
  std_reg__parameterized1 comb_reg
       (.Q(i0_out),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond00_go_in(cond00_go_in),
        .\out_reg[0]_0 (fsm_n_2),
        .reset(reset));
  std_reg_2 dot_0
       (.\A_LUT-0 (fsm_n_36),
        .D(dot_0_in),
        .E(let2_go_in),
        .add0_right(add0_right),
        .clk(clk),
        .dot_0_done(dot_0_done),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.B_read0_0_done(B_read0_0_done),
        .E(i0_write_en),
        .add0_left(add0_left),
        .bin_read0_0_done(bin_read0_0_done),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .cond00_go_in(cond00_go_in),
        .done(done),
        .done_reg(fsm_n_42),
        .dot_0_done(dot_0_done),
        .go(go),
        .go_0(fsm_n_2),
        .go_1(fsm_n_36),
        .i0_done(i0_done),
        .\out_reg[1]_0 (fsm_n_40),
        .\out_reg[2]_0 (fsm_n_39),
        .\out_reg[3]_0 (let2_go_in),
        .reset(reset),
        .upd3_go_in(upd3_go_in),
        .v0_done(v0_done),
        .v0_read_data(v0_read_data),
        .v0_write_en(v0_write_en));
  std_reg__parameterized0_3 i0
       (.A0_addr0(A0_addr0),
        .A0_addr0_0_sp_1(fsm_n_42),
        .D(i0_in),
        .E(i0_write_en),
        .Q(i0_out),
        .a(add1_left),
        .clk(clk),
        .i0_done(i0_done),
        .reset(reset),
        .upd3_go_in(upd3_go_in));
  std_mult_pipe mult_pipe0
       (.DSP_A_B_DATA_INST({A_read0_0_n_1,A_read0_0_n_2,A_read0_0_n_3,A_read0_0_n_4,A_read0_0_n_5,A_read0_0_n_6,A_read0_0_n_7,A_read0_0_n_8,A_read0_0_n_9,A_read0_0_n_10,A_read0_0_n_11,A_read0_0_n_12,A_read0_0_n_13,A_read0_0_n_14,A_read0_0_n_15,A_read0_0_n_16,A_read0_0_n_17,A_read0_0_n_18,A_read0_0_n_19,A_read0_0_n_20,A_read0_0_n_21,A_read0_0_n_22,A_read0_0_n_23,A_read0_0_n_24,A_read0_0_n_25,A_read0_0_n_26,A_read0_0_n_27,A_read0_0_n_28,A_read0_0_n_29,A_read0_0_n_30,A_read0_0_n_31,A_read0_0_n_32}),
        .E(bin_read0_0_write_en),
        .Q({B_read0_0_n_0,B_read0_0_n_1,B_read0_0_n_2,B_read0_0_n_3,B_read0_0_n_4,B_read0_0_n_5,B_read0_0_n_6,B_read0_0_n_7,B_read0_0_n_8,B_read0_0_n_9,B_read0_0_n_10,B_read0_0_n_11,B_read0_0_n_12,B_read0_0_n_13,B_read0_0_n_14,B_read0_0_n_15,B_read0_0_n_16,B_read0_0_n_17,B_read0_0_n_18,B_read0_0_n_19,B_read0_0_n_20,B_read0_0_n_21,B_read0_0_n_22,B_read0_0_n_23,B_read0_0_n_24,B_read0_0_n_25,B_read0_0_n_26,B_read0_0_n_27,B_read0_0_n_28,B_read0_0_n_29,B_read0_0_n_30,B_read0_0_n_31}),
        .clk(clk),
        .\done_buf_reg[2] (fsm_n_40),
        .\out[31]_i_17 ({mult_pipe0_n_1,mult_pipe0_n_2,mult_pipe0_n_3,mult_pipe0_n_4,mult_pipe0_n_5,mult_pipe0_n_6,mult_pipe0_n_7,mult_pipe0_n_8,mult_pipe0_n_9,mult_pipe0_n_10,mult_pipe0_n_11,mult_pipe0_n_12,mult_pipe0_n_13,mult_pipe0_n_14,mult_pipe0_n_15,mult_pipe0_n_16,mult_pipe0_n_17,mult_pipe0_n_18,mult_pipe0_n_19,mult_pipe0_n_20,mult_pipe0_n_21,mult_pipe0_n_22,mult_pipe0_n_23,mult_pipe0_n_24,mult_pipe0_n_25,mult_pipe0_n_26,mult_pipe0_n_27,mult_pipe0_n_28,mult_pipe0_n_29,mult_pipe0_n_30,mult_pipe0_n_31,mult_pipe0_n_32}),
        .reset(reset));
endmodule

module std_add
   (v0_write_data,
    .v0_write_data_31_sp_1(v0_write_data_31_sn_1),
    add0_left,
    add0_right);
  output [31:0]v0_write_data;
  input [31:0]add0_left;
  input [31:0]add0_right;
  input v0_write_data_31_sn_1;

  wire [31:0]add0_left;
  wire [31:0]add0_right;
  wire [31:0]v0_write_data;
  wire v0_write_data_31_sn_1;

  lakeroad_xilinx_ultrascale_plus_add32 _impl
       (.add0_left(add0_left),
        .add0_right(add0_right),
        .v0_write_data(v0_write_data),
        .v0_write_data_31_sp_1(v0_write_data_31_sn_1));
endmodule

(* ORIG_REF_NAME = "std_add" *) 
module std_add__parameterized0
   (D,
    upd3_go_in,
    a);
  output [3:0]D;
  input upd3_go_in;
  input [3:0]a;

  wire [3:0]D;
  wire [3:0]a;
  wire upd3_go_in;

  lakeroad_xilinx_ultrascale_plus_add4 _impl
       (.D(D),
        .a(a),
        .upd3_go_in(upd3_go_in));
endmodule

module std_fp_mult_pipe
   (E,
    \out[31]_i_17_0 ,
    clk,
    reset,
    \done_buf_reg[2]_0 ,
    Q,
    DSP_A_B_DATA_INST);
  output [0:0]E;
  output [31:0]\out[31]_i_17_0 ;
  input clk;
  input reset;
  input \done_buf_reg[2]_0 ;
  input [31:0]Q;
  input [31:0]DSP_A_B_DATA_INST;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]DSP_A_B_DATA_INST;
  wire [0:0]E;
  wire GND_2;
  wire [31:0]Q;
  wire clk;
  wire \done_buf[1]_i_1_n_0 ;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire mult_pipe0_done;
  wire mult_pipe0_go;
  wire \out[23]_i_10_n_0 ;
  wire \out[23]_i_11_n_0 ;
  wire \out[23]_i_12_n_0 ;
  wire \out[23]_i_13_n_0 ;
  wire \out[23]_i_14_n_0 ;
  wire \out[23]_i_15_n_0 ;
  wire \out[23]_i_16_n_0 ;
  wire \out[23]_i_2_n_0 ;
  wire \out[23]_i_3_n_0 ;
  wire \out[23]_i_4_n_0 ;
  wire \out[23]_i_5_n_0 ;
  wire \out[23]_i_6_n_0 ;
  wire \out[23]_i_7_n_0 ;
  wire \out[23]_i_8_n_0 ;
  wire \out[23]_i_9_n_0 ;
  wire \out[31]_i_10_n_0 ;
  wire \out[31]_i_11_n_0 ;
  wire \out[31]_i_12_n_0 ;
  wire \out[31]_i_13_n_0 ;
  wire \out[31]_i_14_n_0 ;
  wire \out[31]_i_15_n_0 ;
  wire \out[31]_i_16_n_0 ;
  wire [31:0]\out[31]_i_17_0 ;
  wire \out[31]_i_17_n_0 ;
  wire \out[31]_i_3__0_n_0 ;
  wire \out[31]_i_4_n_0 ;
  wire \out[31]_i_5_n_0 ;
  wire \out[31]_i_6_n_0 ;
  wire \out[31]_i_7_n_0 ;
  wire \out[31]_i_8_n_0 ;
  wire \out[31]_i_9_n_0 ;
  wire \out_reg[23]_i_1_n_0 ;
  wire out_tmp0__0_n_100;
  wire out_tmp0__0_n_101;
  wire out_tmp0__0_n_102;
  wire out_tmp0__0_n_103;
  wire out_tmp0__0_n_104;
  wire out_tmp0__0_n_105;
  wire out_tmp0__0_n_91;
  wire out_tmp0__0_n_92;
  wire out_tmp0__0_n_93;
  wire out_tmp0__0_n_94;
  wire out_tmp0__0_n_95;
  wire out_tmp0__0_n_96;
  wire out_tmp0__0_n_97;
  wire out_tmp0__0_n_98;
  wire out_tmp0__0_n_99;
  wire out_tmp0_i_10_n_0;
  wire out_tmp0_i_11_n_0;
  wire out_tmp0_i_12_n_0;
  wire out_tmp0_i_13_n_0;
  wire out_tmp0_i_14_n_0;
  wire out_tmp0_i_15_n_0;
  wire out_tmp0_i_16_n_0;
  wire out_tmp0_i_17_n_0;
  wire out_tmp0_i_1_n_0;
  wire out_tmp0_i_2_n_0;
  wire out_tmp0_i_3_n_0;
  wire out_tmp0_i_4_n_0;
  wire out_tmp0_i_5_n_0;
  wire out_tmp0_i_6_n_0;
  wire out_tmp0_i_7_n_0;
  wire out_tmp0_i_8_n_0;
  wire out_tmp0_i_9_n_0;
  wire out_tmp0_n_100;
  wire out_tmp0_n_101;
  wire out_tmp0_n_102;
  wire out_tmp0_n_103;
  wire out_tmp0_n_104;
  wire out_tmp0_n_105;
  wire out_tmp0_n_106;
  wire out_tmp0_n_107;
  wire out_tmp0_n_108;
  wire out_tmp0_n_109;
  wire out_tmp0_n_110;
  wire out_tmp0_n_111;
  wire out_tmp0_n_112;
  wire out_tmp0_n_113;
  wire out_tmp0_n_114;
  wire out_tmp0_n_115;
  wire out_tmp0_n_116;
  wire out_tmp0_n_117;
  wire out_tmp0_n_118;
  wire out_tmp0_n_119;
  wire out_tmp0_n_120;
  wire out_tmp0_n_121;
  wire out_tmp0_n_122;
  wire out_tmp0_n_123;
  wire out_tmp0_n_124;
  wire out_tmp0_n_125;
  wire out_tmp0_n_126;
  wire out_tmp0_n_127;
  wire out_tmp0_n_128;
  wire out_tmp0_n_129;
  wire out_tmp0_n_130;
  wire out_tmp0_n_131;
  wire out_tmp0_n_132;
  wire out_tmp0_n_133;
  wire out_tmp0_n_134;
  wire out_tmp0_n_135;
  wire out_tmp0_n_136;
  wire out_tmp0_n_137;
  wire out_tmp0_n_138;
  wire out_tmp0_n_139;
  wire out_tmp0_n_140;
  wire out_tmp0_n_141;
  wire out_tmp0_n_142;
  wire out_tmp0_n_143;
  wire out_tmp0_n_144;
  wire out_tmp0_n_145;
  wire out_tmp0_n_146;
  wire out_tmp0_n_147;
  wire out_tmp0_n_148;
  wire out_tmp0_n_149;
  wire out_tmp0_n_150;
  wire out_tmp0_n_151;
  wire out_tmp0_n_152;
  wire out_tmp0_n_153;
  wire out_tmp0_n_24;
  wire out_tmp0_n_25;
  wire out_tmp0_n_26;
  wire out_tmp0_n_27;
  wire out_tmp0_n_28;
  wire out_tmp0_n_29;
  wire out_tmp0_n_30;
  wire out_tmp0_n_31;
  wire out_tmp0_n_32;
  wire out_tmp0_n_33;
  wire out_tmp0_n_34;
  wire out_tmp0_n_35;
  wire out_tmp0_n_36;
  wire out_tmp0_n_37;
  wire out_tmp0_n_38;
  wire out_tmp0_n_39;
  wire out_tmp0_n_40;
  wire out_tmp0_n_41;
  wire out_tmp0_n_42;
  wire out_tmp0_n_43;
  wire out_tmp0_n_44;
  wire out_tmp0_n_45;
  wire out_tmp0_n_46;
  wire out_tmp0_n_47;
  wire out_tmp0_n_48;
  wire out_tmp0_n_49;
  wire out_tmp0_n_50;
  wire out_tmp0_n_51;
  wire out_tmp0_n_52;
  wire out_tmp0_n_53;
  wire out_tmp0_n_89;
  wire out_tmp0_n_90;
  wire out_tmp0_n_91;
  wire out_tmp0_n_92;
  wire out_tmp0_n_93;
  wire out_tmp0_n_94;
  wire out_tmp0_n_95;
  wire out_tmp0_n_96;
  wire out_tmp0_n_97;
  wire out_tmp0_n_98;
  wire out_tmp0_n_99;
  wire out_tmp_reg_i_10_n_0;
  wire out_tmp_reg_i_11_n_0;
  wire out_tmp_reg_i_12_n_0;
  wire out_tmp_reg_i_13_n_0;
  wire out_tmp_reg_i_14_n_0;
  wire out_tmp_reg_i_15_n_0;
  wire out_tmp_reg_i_1_n_0;
  wire out_tmp_reg_i_2_n_0;
  wire out_tmp_reg_i_3_n_0;
  wire out_tmp_reg_i_4_n_0;
  wire out_tmp_reg_i_5_n_0;
  wire out_tmp_reg_i_6_n_0;
  wire out_tmp_reg_i_7_n_0;
  wire out_tmp_reg_i_8_n_0;
  wire out_tmp_reg_i_9_n_0;
  wire \out_tmp_reg_n_0_[16] ;
  wire out_tmp_reg_n_100;
  wire out_tmp_reg_n_101;
  wire out_tmp_reg_n_102;
  wire out_tmp_reg_n_103;
  wire out_tmp_reg_n_104;
  wire out_tmp_reg_n_105;
  wire out_tmp_reg_n_91;
  wire out_tmp_reg_n_92;
  wire out_tmp_reg_n_93;
  wire out_tmp_reg_n_94;
  wire out_tmp_reg_n_95;
  wire out_tmp_reg_n_96;
  wire out_tmp_reg_n_97;
  wire out_tmp_reg_n_98;
  wire out_tmp_reg_n_99;
  wire [31:0]p_0_in;
  wire reset;
  wire start;
  wire [7:0]\NLW_out_reg[23]_i_1_CO_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'h0001)) 
    \done_buf[0]_i_1 
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(\done_buf_reg_n_0_[0] ),
        .I3(\done_buf_reg_n_0_[1] ),
        .O(start));
  LUT2 #(
    .INIT(4'hE)) 
    \done_buf[1]_i_1 
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .O(\done_buf[1]_i_1_n_0 ));
  FDRE \done_buf_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(start),
        .Q(\done_buf_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE \done_buf_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[0] ),
        .Q(\done_buf_reg_n_0_[1] ),
        .R(\done_buf[1]_i_1_n_0 ));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(mult_pipe0_done),
        .R(\done_buf[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_10 
       (.I0(out_tmp0__0_n_100),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_100),
        .O(\out[23]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_11 
       (.I0(out_tmp0__0_n_101),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_101),
        .O(\out[23]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_12 
       (.I0(out_tmp0__0_n_102),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_102),
        .O(\out[23]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_13 
       (.I0(out_tmp0__0_n_103),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_103),
        .O(\out[23]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_14 
       (.I0(out_tmp0__0_n_104),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_104),
        .O(\out[23]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_15 
       (.I0(out_tmp0__0_n_105),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_105),
        .O(\out[23]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_16 
       (.I0(\out_tmp_reg_n_0_[16] ),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_2 
       (.I0(out_tmp0__0_n_99),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_3 
       (.I0(out_tmp0__0_n_100),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_4 
       (.I0(out_tmp0__0_n_101),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_5 
       (.I0(out_tmp0__0_n_102),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_6 
       (.I0(out_tmp0__0_n_103),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_7 
       (.I0(out_tmp0__0_n_104),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_8 
       (.I0(out_tmp0__0_n_105),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[23]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[23]_i_9 
       (.I0(out_tmp0__0_n_99),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_99),
        .O(\out[23]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_10 
       (.I0(out_tmp0__0_n_91),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_91),
        .O(\out[31]_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_11 
       (.I0(out_tmp0__0_n_92),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_92),
        .O(\out[31]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_12 
       (.I0(out_tmp0__0_n_93),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_93),
        .O(\out[31]_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_13 
       (.I0(out_tmp0__0_n_94),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_94),
        .O(\out[31]_i_13_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_14 
       (.I0(out_tmp0__0_n_95),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_95),
        .O(\out[31]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_15 
       (.I0(out_tmp0__0_n_96),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_96),
        .O(\out[31]_i_15_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_16 
       (.I0(out_tmp0__0_n_97),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_97),
        .O(\out[31]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'h12)) 
    \out[31]_i_17 
       (.I0(out_tmp0__0_n_98),
        .I1(\done_buf_reg[2]_0 ),
        .I2(out_tmp_reg_n_98),
        .O(\out[31]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_1__0 
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .O(E));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_3__0 
       (.I0(out_tmp0__0_n_92),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[31]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_4 
       (.I0(out_tmp0__0_n_93),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_5 
       (.I0(out_tmp0__0_n_94),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_6 
       (.I0(out_tmp0__0_n_95),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[31]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_7 
       (.I0(out_tmp0__0_n_96),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[31]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_8 
       (.I0(out_tmp0__0_n_97),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_9 
       (.I0(out_tmp0__0_n_98),
        .I1(\done_buf_reg[2]_0 ),
        .O(\out[31]_i_9_n_0 ));
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY8 \out_reg[23]_i_1 
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({\out_reg[23]_i_1_n_0 ,\NLW_out_reg[23]_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\out[23]_i_2_n_0 ,\out[23]_i_3_n_0 ,\out[23]_i_4_n_0 ,\out[23]_i_5_n_0 ,\out[23]_i_6_n_0 ,\out[23]_i_7_n_0 ,\out[23]_i_8_n_0 ,\<const0> }),
        .O(\out[31]_i_17_0 [23:16]),
        .S({\out[23]_i_9_n_0 ,\out[23]_i_10_n_0 ,\out[23]_i_11_n_0 ,\out[23]_i_12_n_0 ,\out[23]_i_13_n_0 ,\out[23]_i_14_n_0 ,\out[23]_i_15_n_0 ,\out[23]_i_16_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_reg[31]_i_2 
       (.CI(\out_reg[23]_i_1_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\out[31]_i_3__0_n_0 ,\out[31]_i_4_n_0 ,\out[31]_i_5_n_0 ,\out[31]_i_6_n_0 ,\out[31]_i_7_n_0 ,\out[31]_i_8_n_0 ,\out[31]_i_9_n_0 }),
        .O(\out[31]_i_17_0 [31:24]),
        .S({\out[31]_i_10_n_0 ,\out[31]_i_11_n_0 ,\out[31]_i_12_n_0 ,\out[31]_i_13_n_0 ,\out[31]_i_14_n_0 ,\out[31]_i_15_n_0 ,\out[31]_i_16_n_0 ,\out[31]_i_17_n_0 }));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    out_tmp0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,p_0_in[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACOUT({out_tmp0_n_24,out_tmp0_n_25,out_tmp0_n_26,out_tmp0_n_27,out_tmp0_n_28,out_tmp0_n_29,out_tmp0_n_30,out_tmp0_n_31,out_tmp0_n_32,out_tmp0_n_33,out_tmp0_n_34,out_tmp0_n_35,out_tmp0_n_36,out_tmp0_n_37,out_tmp0_n_38,out_tmp0_n_39,out_tmp0_n_40,out_tmp0_n_41,out_tmp0_n_42,out_tmp0_n_43,out_tmp0_n_44,out_tmp0_n_45,out_tmp0_n_46,out_tmp0_n_47,out_tmp0_n_48,out_tmp0_n_49,out_tmp0_n_50,out_tmp0_n_51,out_tmp0_n_52,out_tmp0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,out_tmp0_i_1_n_0,out_tmp0_i_2_n_0,out_tmp0_i_3_n_0,out_tmp0_i_4_n_0,out_tmp0_i_5_n_0,out_tmp0_i_6_n_0,out_tmp0_i_7_n_0,out_tmp0_i_8_n_0,out_tmp0_i_9_n_0,out_tmp0_i_10_n_0,out_tmp0_i_11_n_0,out_tmp0_i_12_n_0,out_tmp0_i_13_n_0,out_tmp0_i_14_n_0,out_tmp0_i_15_n_0,out_tmp0_i_16_n_0,out_tmp0_i_17_n_0}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const1> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const1> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk),
        .D({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out_tmp0_n_89,out_tmp0_n_90,out_tmp0_n_91,out_tmp0_n_92,out_tmp0_n_93,out_tmp0_n_94,out_tmp0_n_95,out_tmp0_n_96,out_tmp0_n_97,out_tmp0_n_98,out_tmp0_n_99,out_tmp0_n_100,out_tmp0_n_101,out_tmp0_n_102,out_tmp0_n_103,out_tmp0_n_104,out_tmp0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({out_tmp0_n_106,out_tmp0_n_107,out_tmp0_n_108,out_tmp0_n_109,out_tmp0_n_110,out_tmp0_n_111,out_tmp0_n_112,out_tmp0_n_113,out_tmp0_n_114,out_tmp0_n_115,out_tmp0_n_116,out_tmp0_n_117,out_tmp0_n_118,out_tmp0_n_119,out_tmp0_n_120,out_tmp0_n_121,out_tmp0_n_122,out_tmp0_n_123,out_tmp0_n_124,out_tmp0_n_125,out_tmp0_n_126,out_tmp0_n_127,out_tmp0_n_128,out_tmp0_n_129,out_tmp0_n_130,out_tmp0_n_131,out_tmp0_n_132,out_tmp0_n_133,out_tmp0_n_134,out_tmp0_n_135,out_tmp0_n_136,out_tmp0_n_137,out_tmp0_n_138,out_tmp0_n_139,out_tmp0_n_140,out_tmp0_n_141,out_tmp0_n_142,out_tmp0_n_143,out_tmp0_n_144,out_tmp0_n_145,out_tmp0_n_146,out_tmp0_n_147,out_tmp0_n_148,out_tmp0_n_149,out_tmp0_n_150,out_tmp0_n_151,out_tmp0_n_152,out_tmp0_n_153}),
        .RSTA(reset),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    out_tmp0__0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,out_tmp0_i_1_n_0,out_tmp0_i_2_n_0,out_tmp0_i_3_n_0,out_tmp0_i_4_n_0,out_tmp0_i_5_n_0,out_tmp0_i_6_n_0,out_tmp0_i_7_n_0,out_tmp0_i_8_n_0,out_tmp0_i_9_n_0,out_tmp0_i_10_n_0,out_tmp0_i_11_n_0,out_tmp0_i_12_n_0,out_tmp0_i_13_n_0,out_tmp0_i_14_n_0,out_tmp0_i_15_n_0,out_tmp0_i_16_n_0,out_tmp0_i_17_n_0}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,p_0_in[31:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const1> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const1> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(mult_pipe0_go),
        .CLK(clk),
        .D({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out_tmp0__0_n_91,out_tmp0__0_n_92,out_tmp0__0_n_93,out_tmp0__0_n_94,out_tmp0__0_n_95,out_tmp0__0_n_96,out_tmp0__0_n_97,out_tmp0__0_n_98,out_tmp0__0_n_99,out_tmp0__0_n_100,out_tmp0__0_n_101,out_tmp0__0_n_102,out_tmp0__0_n_103,out_tmp0__0_n_104,out_tmp0__0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .RSTA(reset),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(reset));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_1
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[31]),
        .O(p_0_in[31]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_10
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[22]),
        .O(p_0_in[22]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_11
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[21]),
        .O(p_0_in[21]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_12
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[20]),
        .O(p_0_in[20]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_13
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[19]),
        .O(p_0_in[19]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_14
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[18]),
        .O(p_0_in[18]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_15
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[17]),
        .O(p_0_in[17]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_2
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[30]),
        .O(p_0_in[30]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_3
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[29]),
        .O(p_0_in[29]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_4
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[28]),
        .O(p_0_in[28]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_5
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[27]),
        .O(p_0_in[27]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_6
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[26]),
        .O(p_0_in[26]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_7
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[25]),
        .O(p_0_in[25]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_8
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[24]),
        .O(p_0_in[24]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0__0_i_9
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[23]),
        .O(p_0_in[23]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_1
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[16]),
        .O(out_tmp0_i_1_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_10
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[7]),
        .O(out_tmp0_i_10_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_11
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[6]),
        .O(out_tmp0_i_11_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_12
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[5]),
        .O(out_tmp0_i_12_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_13
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[4]),
        .O(out_tmp0_i_13_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_14
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[3]),
        .O(out_tmp0_i_14_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_15
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[2]),
        .O(out_tmp0_i_15_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_16
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[1]),
        .O(out_tmp0_i_16_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_17
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[0]),
        .O(out_tmp0_i_17_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_18
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[16]),
        .O(p_0_in[16]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_19
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[15]),
        .O(p_0_in[15]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_2
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[15]),
        .O(out_tmp0_i_2_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_20
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[14]),
        .O(p_0_in[14]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_21
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[13]),
        .O(p_0_in[13]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_22
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[12]),
        .O(p_0_in[12]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_23
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[11]),
        .O(p_0_in[11]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_24
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[10]),
        .O(p_0_in[10]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_25
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[9]),
        .O(p_0_in[9]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_26
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[8]),
        .O(p_0_in[8]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_27
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[7]),
        .O(p_0_in[7]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_28
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[6]),
        .O(p_0_in[6]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_29
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[5]),
        .O(p_0_in[5]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_3
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[14]),
        .O(out_tmp0_i_3_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_30
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[4]),
        .O(p_0_in[4]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_31
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[3]),
        .O(p_0_in[3]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_32
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[2]),
        .O(p_0_in[2]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_33
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[1]),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_34
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(DSP_A_B_DATA_INST[0]),
        .O(p_0_in[0]));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_4
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[13]),
        .O(out_tmp0_i_4_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_5
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[12]),
        .O(out_tmp0_i_5_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_6
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[11]),
        .O(out_tmp0_i_6_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_7
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[10]),
        .O(out_tmp0_i_7_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_8
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[9]),
        .O(out_tmp0_i_8_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp0_i_9
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[8]),
        .O(out_tmp0_i_9_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    \out_tmp[16]_i_1 
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .O(mult_pipe0_go));
  (* KEEP_HIERARCHY = "yes" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E2 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    out_tmp_reg
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACIN({out_tmp0_n_24,out_tmp0_n_25,out_tmp0_n_26,out_tmp0_n_27,out_tmp0_n_28,out_tmp0_n_29,out_tmp0_n_30,out_tmp0_n_31,out_tmp0_n_32,out_tmp0_n_33,out_tmp0_n_34,out_tmp0_n_35,out_tmp0_n_36,out_tmp0_n_37,out_tmp0_n_38,out_tmp0_n_39,out_tmp0_n_40,out_tmp0_n_41,out_tmp0_n_42,out_tmp0_n_43,out_tmp0_n_44,out_tmp0_n_45,out_tmp0_n_46,out_tmp0_n_47,out_tmp0_n_48,out_tmp0_n_49,out_tmp0_n_50,out_tmp0_n_51,out_tmp0_n_52,out_tmp0_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,out_tmp_reg_i_1_n_0,out_tmp_reg_i_2_n_0,out_tmp_reg_i_3_n_0,out_tmp_reg_i_4_n_0,out_tmp_reg_i_5_n_0,out_tmp_reg_i_6_n_0,out_tmp_reg_i_7_n_0,out_tmp_reg_i_8_n_0,out_tmp_reg_i_9_n_0,out_tmp_reg_i_10_n_0,out_tmp_reg_i_11_n_0,out_tmp_reg_i_12_n_0,out_tmp_reg_i_13_n_0,out_tmp_reg_i_14_n_0,out_tmp_reg_i_15_n_0}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(\<const1> ),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(mult_pipe0_go),
        .CLK(clk),
        .D({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out_tmp_reg_n_91,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98,out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105}),
        .PCIN({out_tmp0_n_106,out_tmp0_n_107,out_tmp0_n_108,out_tmp0_n_109,out_tmp0_n_110,out_tmp0_n_111,out_tmp0_n_112,out_tmp0_n_113,out_tmp0_n_114,out_tmp0_n_115,out_tmp0_n_116,out_tmp0_n_117,out_tmp0_n_118,out_tmp0_n_119,out_tmp0_n_120,out_tmp0_n_121,out_tmp0_n_122,out_tmp0_n_123,out_tmp0_n_124,out_tmp0_n_125,out_tmp0_n_126,out_tmp0_n_127,out_tmp0_n_128,out_tmp0_n_129,out_tmp0_n_130,out_tmp0_n_131,out_tmp0_n_132,out_tmp0_n_133,out_tmp0_n_134,out_tmp0_n_135,out_tmp0_n_136,out_tmp0_n_137,out_tmp0_n_138,out_tmp0_n_139,out_tmp0_n_140,out_tmp0_n_141,out_tmp0_n_142,out_tmp0_n_143,out_tmp0_n_144,out_tmp0_n_145,out_tmp0_n_146,out_tmp0_n_147,out_tmp0_n_148,out_tmp0_n_149,out_tmp0_n_150,out_tmp0_n_151,out_tmp0_n_152,out_tmp0_n_153}),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(reset),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(reset));
  FDRE \out_tmp_reg[0] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_105),
        .Q(\out[31]_i_17_0 [0]),
        .R(reset));
  FDRE \out_tmp_reg[10] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_95),
        .Q(\out[31]_i_17_0 [10]),
        .R(reset));
  FDRE \out_tmp_reg[11] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_94),
        .Q(\out[31]_i_17_0 [11]),
        .R(reset));
  FDRE \out_tmp_reg[12] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_93),
        .Q(\out[31]_i_17_0 [12]),
        .R(reset));
  FDRE \out_tmp_reg[13] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_92),
        .Q(\out[31]_i_17_0 [13]),
        .R(reset));
  FDRE \out_tmp_reg[14] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_91),
        .Q(\out[31]_i_17_0 [14]),
        .R(reset));
  FDRE \out_tmp_reg[15] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_90),
        .Q(\out[31]_i_17_0 [15]),
        .R(reset));
  FDRE \out_tmp_reg[16] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_89),
        .Q(\out_tmp_reg_n_0_[16] ),
        .R(reset));
  FDRE \out_tmp_reg[1] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_104),
        .Q(\out[31]_i_17_0 [1]),
        .R(reset));
  FDRE \out_tmp_reg[2] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_103),
        .Q(\out[31]_i_17_0 [2]),
        .R(reset));
  FDRE \out_tmp_reg[3] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_102),
        .Q(\out[31]_i_17_0 [3]),
        .R(reset));
  FDRE \out_tmp_reg[4] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_101),
        .Q(\out[31]_i_17_0 [4]),
        .R(reset));
  FDRE \out_tmp_reg[5] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_100),
        .Q(\out[31]_i_17_0 [5]),
        .R(reset));
  FDRE \out_tmp_reg[6] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_99),
        .Q(\out[31]_i_17_0 [6]),
        .R(reset));
  FDRE \out_tmp_reg[7] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_98),
        .Q(\out[31]_i_17_0 [7]),
        .R(reset));
  FDRE \out_tmp_reg[8] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_97),
        .Q(\out[31]_i_17_0 [8]),
        .R(reset));
  FDRE \out_tmp_reg[9] 
       (.C(clk),
        .CE(mult_pipe0_go),
        .D(out_tmp0_n_96),
        .Q(\out[31]_i_17_0 [9]),
        .R(reset));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_1
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[31]),
        .O(out_tmp_reg_i_1_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_10
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[22]),
        .O(out_tmp_reg_i_10_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_11
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[21]),
        .O(out_tmp_reg_i_11_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_12
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[20]),
        .O(out_tmp_reg_i_12_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_13
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[19]),
        .O(out_tmp_reg_i_13_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_14
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[18]),
        .O(out_tmp_reg_i_14_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_15
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[17]),
        .O(out_tmp_reg_i_15_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_2
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[30]),
        .O(out_tmp_reg_i_2_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_3
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[29]),
        .O(out_tmp_reg_i_3_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_4
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[28]),
        .O(out_tmp_reg_i_4_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_5
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[27]),
        .O(out_tmp_reg_i_5_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_6
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[26]),
        .O(out_tmp_reg_i_6_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_7
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[25]),
        .O(out_tmp_reg_i_7_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_8
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[24]),
        .O(out_tmp_reg_i_8_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    out_tmp_reg_i_9
       (.I0(mult_pipe0_done),
        .I1(\done_buf_reg[2]_0 ),
        .I2(Q[23]),
        .O(out_tmp_reg_i_9_n_0));
endmodule

module std_mult_pipe
   (E,
    \out[31]_i_17 ,
    clk,
    reset,
    \done_buf_reg[2] ,
    Q,
    DSP_A_B_DATA_INST);
  output [0:0]E;
  output [31:0]\out[31]_i_17 ;
  input clk;
  input reset;
  input \done_buf_reg[2] ;
  input [31:0]Q;
  input [31:0]DSP_A_B_DATA_INST;

  wire [31:0]DSP_A_B_DATA_INST;
  wire [0:0]E;
  wire [31:0]Q;
  wire clk;
  wire \done_buf_reg[2] ;
  wire [31:0]\out[31]_i_17 ;
  wire reset;

  std_fp_mult_pipe comp
       (.DSP_A_B_DATA_INST(DSP_A_B_DATA_INST),
        .E(E),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[2]_0 (\done_buf_reg[2] ),
        .\out[31]_i_17_0 (\out[31]_i_17 ),
        .reset(reset));
endmodule

module std_reg
   (B_read0_0_done,
    Q,
    reset,
    done_reg_0,
    clk,
    A0_read_data);
  output B_read0_0_done;
  output [31:0]Q;
  input reset;
  input done_reg_0;
  input clk;
  input [31:0]A0_read_data;

  wire \<const1> ;
  wire [31:0]A0_read_data;
  wire B_read0_0_done;
  wire [31:0]Q;
  wire clk;
  wire done_reg_0;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done_reg_0),
        .Q(B_read0_0_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(done_reg_0),
        .D(A0_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_0
   (Q,
    reset,
    \out_reg[0]_0 ,
    B0_read_data,
    clk);
  output [31:0]Q;
  input reset;
  input \out_reg[0]_0 ;
  input [31:0]B0_read_data;
  input clk;

  wire [31:0]B0_read_data;
  wire [31:0]Q;
  wire clk;
  wire \out_reg[0]_0 ;
  wire reset;

  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(\out_reg[0]_0 ),
        .D(B0_read_data[9]),
        .Q(Q[9]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_1
   (bin_read0_0_done,
    D,
    reset,
    E,
    clk,
    \out_reg[0]_0 ,
    \out_reg[31]_0 );
  output bin_read0_0_done;
  output [31:0]D;
  input reset;
  input [0:0]E;
  input clk;
  input \out_reg[0]_0 ;
  input [31:0]\out_reg[31]_0 ;

  wire \<const1> ;
  wire [31:0]D;
  wire [0:0]E;
  wire bin_read0_0_done;
  wire clk;
  wire \out_reg[0]_0 ;
  wire [31:0]\out_reg[31]_0 ;
  wire \out_reg_n_0_[0] ;
  wire \out_reg_n_0_[10] ;
  wire \out_reg_n_0_[11] ;
  wire \out_reg_n_0_[12] ;
  wire \out_reg_n_0_[13] ;
  wire \out_reg_n_0_[14] ;
  wire \out_reg_n_0_[15] ;
  wire \out_reg_n_0_[16] ;
  wire \out_reg_n_0_[17] ;
  wire \out_reg_n_0_[18] ;
  wire \out_reg_n_0_[19] ;
  wire \out_reg_n_0_[1] ;
  wire \out_reg_n_0_[20] ;
  wire \out_reg_n_0_[21] ;
  wire \out_reg_n_0_[22] ;
  wire \out_reg_n_0_[23] ;
  wire \out_reg_n_0_[24] ;
  wire \out_reg_n_0_[25] ;
  wire \out_reg_n_0_[26] ;
  wire \out_reg_n_0_[27] ;
  wire \out_reg_n_0_[28] ;
  wire \out_reg_n_0_[29] ;
  wire \out_reg_n_0_[2] ;
  wire \out_reg_n_0_[30] ;
  wire \out_reg_n_0_[31] ;
  wire \out_reg_n_0_[3] ;
  wire \out_reg_n_0_[4] ;
  wire \out_reg_n_0_[5] ;
  wire \out_reg_n_0_[6] ;
  wire \out_reg_n_0_[7] ;
  wire \out_reg_n_0_[8] ;
  wire \out_reg_n_0_[9] ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(bin_read0_0_done),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[0]_i_1__1 
       (.I0(\out_reg_n_0_[0] ),
        .I1(\out_reg[0]_0 ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[10]_i_1 
       (.I0(\out_reg_n_0_[10] ),
        .I1(\out_reg[0]_0 ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[11]_i_1 
       (.I0(\out_reg_n_0_[11] ),
        .I1(\out_reg[0]_0 ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[12]_i_1 
       (.I0(\out_reg_n_0_[12] ),
        .I1(\out_reg[0]_0 ),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[13]_i_1 
       (.I0(\out_reg_n_0_[13] ),
        .I1(\out_reg[0]_0 ),
        .O(D[13]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[14]_i_1 
       (.I0(\out_reg_n_0_[14] ),
        .I1(\out_reg[0]_0 ),
        .O(D[14]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[15]_i_1 
       (.I0(\out_reg_n_0_[15] ),
        .I1(\out_reg[0]_0 ),
        .O(D[15]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[16]_i_1 
       (.I0(\out_reg_n_0_[16] ),
        .I1(\out_reg[0]_0 ),
        .O(D[16]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[17]_i_1 
       (.I0(\out_reg_n_0_[17] ),
        .I1(\out_reg[0]_0 ),
        .O(D[17]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[18]_i_1 
       (.I0(\out_reg_n_0_[18] ),
        .I1(\out_reg[0]_0 ),
        .O(D[18]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[19]_i_1 
       (.I0(\out_reg_n_0_[19] ),
        .I1(\out_reg[0]_0 ),
        .O(D[19]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[1]_i_1__1 
       (.I0(\out_reg_n_0_[1] ),
        .I1(\out_reg[0]_0 ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[20]_i_1 
       (.I0(\out_reg_n_0_[20] ),
        .I1(\out_reg[0]_0 ),
        .O(D[20]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[21]_i_1 
       (.I0(\out_reg_n_0_[21] ),
        .I1(\out_reg[0]_0 ),
        .O(D[21]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[22]_i_1 
       (.I0(\out_reg_n_0_[22] ),
        .I1(\out_reg[0]_0 ),
        .O(D[22]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[23]_i_1 
       (.I0(\out_reg_n_0_[23] ),
        .I1(\out_reg[0]_0 ),
        .O(D[23]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[24]_i_1 
       (.I0(\out_reg_n_0_[24] ),
        .I1(\out_reg[0]_0 ),
        .O(D[24]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[25]_i_1 
       (.I0(\out_reg_n_0_[25] ),
        .I1(\out_reg[0]_0 ),
        .O(D[25]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[26]_i_1 
       (.I0(\out_reg_n_0_[26] ),
        .I1(\out_reg[0]_0 ),
        .O(D[26]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[27]_i_1 
       (.I0(\out_reg_n_0_[27] ),
        .I1(\out_reg[0]_0 ),
        .O(D[27]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[28]_i_1 
       (.I0(\out_reg_n_0_[28] ),
        .I1(\out_reg[0]_0 ),
        .O(D[28]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[29]_i_1 
       (.I0(\out_reg_n_0_[29] ),
        .I1(\out_reg[0]_0 ),
        .O(D[29]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[2]_i_1__1 
       (.I0(\out_reg_n_0_[2] ),
        .I1(\out_reg[0]_0 ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[30]_i_1 
       (.I0(\out_reg_n_0_[30] ),
        .I1(\out_reg[0]_0 ),
        .O(D[30]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[31]_i_2 
       (.I0(\out_reg_n_0_[31] ),
        .I1(\out_reg[0]_0 ),
        .O(D[31]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[3]_i_1__0 
       (.I0(\out_reg_n_0_[3] ),
        .I1(\out_reg[0]_0 ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[4]_i_1 
       (.I0(\out_reg_n_0_[4] ),
        .I1(\out_reg[0]_0 ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[5]_i_1 
       (.I0(\out_reg_n_0_[5] ),
        .I1(\out_reg[0]_0 ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[6]_i_1 
       (.I0(\out_reg_n_0_[6] ),
        .I1(\out_reg[0]_0 ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[7]_i_1 
       (.I0(\out_reg_n_0_[7] ),
        .I1(\out_reg[0]_0 ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[8]_i_1 
       (.I0(\out_reg_n_0_[8] ),
        .I1(\out_reg[0]_0 ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \out[9]_i_1 
       (.I0(\out_reg_n_0_[9] ),
        .I1(\out_reg[0]_0 ),
        .O(D[9]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [0]),
        .Q(\out_reg_n_0_[0] ),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [10]),
        .Q(\out_reg_n_0_[10] ),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [11]),
        .Q(\out_reg_n_0_[11] ),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [12]),
        .Q(\out_reg_n_0_[12] ),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [13]),
        .Q(\out_reg_n_0_[13] ),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [14]),
        .Q(\out_reg_n_0_[14] ),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [15]),
        .Q(\out_reg_n_0_[15] ),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [16]),
        .Q(\out_reg_n_0_[16] ),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [17]),
        .Q(\out_reg_n_0_[17] ),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [18]),
        .Q(\out_reg_n_0_[18] ),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [19]),
        .Q(\out_reg_n_0_[19] ),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [1]),
        .Q(\out_reg_n_0_[1] ),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [20]),
        .Q(\out_reg_n_0_[20] ),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [21]),
        .Q(\out_reg_n_0_[21] ),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [22]),
        .Q(\out_reg_n_0_[22] ),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [23]),
        .Q(\out_reg_n_0_[23] ),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [24]),
        .Q(\out_reg_n_0_[24] ),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [25]),
        .Q(\out_reg_n_0_[25] ),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [26]),
        .Q(\out_reg_n_0_[26] ),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [27]),
        .Q(\out_reg_n_0_[27] ),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [28]),
        .Q(\out_reg_n_0_[28] ),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [29]),
        .Q(\out_reg_n_0_[29] ),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [2]),
        .Q(\out_reg_n_0_[2] ),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [30]),
        .Q(\out_reg_n_0_[30] ),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [31]),
        .Q(\out_reg_n_0_[31] ),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [3]),
        .Q(\out_reg_n_0_[3] ),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [4]),
        .Q(\out_reg_n_0_[4] ),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [5]),
        .Q(\out_reg_n_0_[5] ),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [6]),
        .Q(\out_reg_n_0_[6] ),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [7]),
        .Q(\out_reg_n_0_[7] ),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [8]),
        .Q(\out_reg_n_0_[8] ),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(\out_reg[31]_0 [9]),
        .Q(\out_reg_n_0_[9] ),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_2
   (dot_0_done,
    add0_right,
    reset,
    E,
    clk,
    \A_LUT-0 ,
    D);
  output dot_0_done;
  output [31:0]add0_right;
  input reset;
  input [0:0]E;
  input clk;
  input \A_LUT-0 ;
  input [31:0]D;

  wire \<const1> ;
  wire \A_LUT-0 ;
  wire [31:0]D;
  wire [0:0]E;
  wire [31:0]add0_right;
  wire clk;
  wire dot_0_done;
  wire \out_reg_n_0_[0] ;
  wire \out_reg_n_0_[10] ;
  wire \out_reg_n_0_[11] ;
  wire \out_reg_n_0_[12] ;
  wire \out_reg_n_0_[13] ;
  wire \out_reg_n_0_[14] ;
  wire \out_reg_n_0_[15] ;
  wire \out_reg_n_0_[16] ;
  wire \out_reg_n_0_[17] ;
  wire \out_reg_n_0_[18] ;
  wire \out_reg_n_0_[19] ;
  wire \out_reg_n_0_[1] ;
  wire \out_reg_n_0_[20] ;
  wire \out_reg_n_0_[21] ;
  wire \out_reg_n_0_[22] ;
  wire \out_reg_n_0_[23] ;
  wire \out_reg_n_0_[24] ;
  wire \out_reg_n_0_[25] ;
  wire \out_reg_n_0_[26] ;
  wire \out_reg_n_0_[27] ;
  wire \out_reg_n_0_[28] ;
  wire \out_reg_n_0_[29] ;
  wire \out_reg_n_0_[2] ;
  wire \out_reg_n_0_[30] ;
  wire \out_reg_n_0_[31] ;
  wire \out_reg_n_0_[3] ;
  wire \out_reg_n_0_[4] ;
  wire \out_reg_n_0_[5] ;
  wire \out_reg_n_0_[6] ;
  wire \out_reg_n_0_[7] ;
  wire \out_reg_n_0_[8] ;
  wire \out_reg_n_0_[9] ;
  wire reset;

  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-0_i_2__0 
       (.I0(\out_reg_n_0_[0] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[0]));
  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-18_i_2 
       (.I0(\out_reg_n_0_[8] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[8]));
  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-45_i_2 
       (.I0(\out_reg_n_0_[16] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[16]));
  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-81_i_2 
       (.I0(\out_reg_n_0_[24] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[24]));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-19_i_2 
       (.I0(\out_reg_n_0_[9] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-1_i_2 
       (.I0(\out_reg_n_0_[1] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-46_i_2 
       (.I0(\out_reg_n_0_[17] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[17]));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-82_i_2 
       (.I0(\out_reg_n_0_[25] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[25]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-11_i_2 
       (.I0(\out_reg_n_0_[2] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-20_i_2 
       (.I0(\out_reg_n_0_[10] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-47_i_2 
       (.I0(\out_reg_n_0_[18] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[18]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-83_i_2 
       (.I0(\out_reg_n_0_[26] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[26]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-12_i_2 
       (.I0(\out_reg_n_0_[3] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-21_i_2 
       (.I0(\out_reg_n_0_[11] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[11]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-48_i_2 
       (.I0(\out_reg_n_0_[19] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[19]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-84_i_2 
       (.I0(\out_reg_n_0_[27] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[27]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-13_i_2 
       (.I0(\out_reg_n_0_[4] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[4]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-22_i_2 
       (.I0(\out_reg_n_0_[12] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[12]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-49_i_2 
       (.I0(\out_reg_n_0_[20] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[20]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-85_i_2 
       (.I0(\out_reg_n_0_[28] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[28]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-14_i_2 
       (.I0(\out_reg_n_0_[5] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-23_i_2 
       (.I0(\out_reg_n_0_[13] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[13]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-50_i_2 
       (.I0(\out_reg_n_0_[21] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[21]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-86_i_2 
       (.I0(\out_reg_n_0_[29] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[29]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-15_i_2 
       (.I0(\out_reg_n_0_[6] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-24_i_2 
       (.I0(\out_reg_n_0_[14] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[14]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-51_i_2 
       (.I0(\out_reg_n_0_[22] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[22]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-87_i_2 
       (.I0(\out_reg_n_0_[30] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[30]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-16_i_2 
       (.I0(\out_reg_n_0_[7] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-25_i_2 
       (.I0(\out_reg_n_0_[15] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[15]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-52_i_2 
       (.I0(\out_reg_n_0_[23] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[23]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-88_i_2 
       (.I0(\out_reg_n_0_[31] ),
        .I1(\A_LUT-0 ),
        .O(add0_right[31]));
  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(dot_0_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(\out_reg_n_0_[0] ),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(\out_reg_n_0_[10] ),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(\out_reg_n_0_[11] ),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[12]),
        .Q(\out_reg_n_0_[12] ),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[13]),
        .Q(\out_reg_n_0_[13] ),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[14]),
        .Q(\out_reg_n_0_[14] ),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(D[15]),
        .Q(\out_reg_n_0_[15] ),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(D[16]),
        .Q(\out_reg_n_0_[16] ),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(D[17]),
        .Q(\out_reg_n_0_[17] ),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(D[18]),
        .Q(\out_reg_n_0_[18] ),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(D[19]),
        .Q(\out_reg_n_0_[19] ),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(\out_reg_n_0_[1] ),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(D[20]),
        .Q(\out_reg_n_0_[20] ),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(D[21]),
        .Q(\out_reg_n_0_[21] ),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(D[22]),
        .Q(\out_reg_n_0_[22] ),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(D[23]),
        .Q(\out_reg_n_0_[23] ),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(D[24]),
        .Q(\out_reg_n_0_[24] ),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(D[25]),
        .Q(\out_reg_n_0_[25] ),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(D[26]),
        .Q(\out_reg_n_0_[26] ),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(D[27]),
        .Q(\out_reg_n_0_[27] ),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(D[28]),
        .Q(\out_reg_n_0_[28] ),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(D[29]),
        .Q(\out_reg_n_0_[29] ),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(\out_reg_n_0_[2] ),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(D[30]),
        .Q(\out_reg_n_0_[30] ),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(D[31]),
        .Q(\out_reg_n_0_[31] ),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(\out_reg_n_0_[3] ),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(\out_reg_n_0_[4] ),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(\out_reg_n_0_[5] ),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(\out_reg_n_0_[6] ),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(\out_reg_n_0_[7] ),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(\out_reg_n_0_[8] ),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(\out_reg_n_0_[9] ),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (E,
    cond00_go_in,
    go_0,
    upd3_go_in,
    add0_left,
    go_1,
    v0_write_en,
    \out_reg[3]_0 ,
    \out_reg[2]_0 ,
    \out_reg[1]_0 ,
    done,
    done_reg,
    i0_done,
    go,
    comb_reg_done,
    bin_read0_0_done,
    v0_done,
    comb_reg_out,
    B_read0_0_done,
    v0_read_data,
    dot_0_done,
    reset,
    clk);
  output [0:0]E;
  output cond00_go_in;
  output go_0;
  output upd3_go_in;
  output [31:0]add0_left;
  output go_1;
  output v0_write_en;
  output [0:0]\out_reg[3]_0 ;
  output \out_reg[2]_0 ;
  output \out_reg[1]_0 ;
  output done;
  output done_reg;
  input i0_done;
  input go;
  input comb_reg_done;
  input bin_read0_0_done;
  input v0_done;
  input comb_reg_out;
  input B_read0_0_done;
  input [31:0]v0_read_data;
  input dot_0_done;
  input reset;
  input clk;

  wire B_read0_0_done;
  wire [0:0]E;
  wire [31:0]add0_left;
  wire bin_read0_0_done;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond00_go_in;
  wire done;
  wire done_reg;
  wire dot_0_done;
  wire [3:0]fsm_in;
  wire [3:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire go_0;
  wire go_1;
  wire i0_done;
  wire \out[0]_i_2__0_n_0 ;
  wire \out[1]_i_2_n_0 ;
  wire \out[1]_i_3_n_0 ;
  wire \out[2]_i_2_n_0 ;
  wire \out[2]_i_3_n_0 ;
  wire \out[2]_i_4_n_0 ;
  wire \out[3]_i_3_n_0 ;
  wire \out[3]_i_4_n_0 ;
  wire \out[3]_i_5_n_0 ;
  wire \out[3]_i_6_n_0 ;
  wire \out_reg[1]_0 ;
  wire \out_reg[2]_0 ;
  wire [0:0]\out_reg[3]_0 ;
  wire reset;
  wire upd3_go_in;
  wire v0_done;
  wire [31:0]v0_read_data;
  wire v0_write_en;

  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-0_i_1__0 
       (.I0(v0_read_data[0]),
        .I1(go_1),
        .O(add0_left[0]));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \A_LUT-0_i_2 
       (.I0(fsm_out[0]),
        .I1(i0_done),
        .I2(fsm_out[2]),
        .I3(fsm_out[3]),
        .I4(go),
        .I5(fsm_out[1]),
        .O(upd3_go_in));
  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-18_i_1 
       (.I0(v0_read_data[8]),
        .I1(go_1),
        .O(add0_left[8]));
  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-45_i_1 
       (.I0(v0_read_data[16]),
        .I1(go_1),
        .O(add0_left[16]));
  LUT2 #(
    .INIT(4'h2)) 
    \A_LUT-81_i_1 
       (.I0(v0_read_data[24]),
        .I1(go_1),
        .O(add0_left[24]));
  LUT6 #(
    .INIT(64'h0000000000100000)) 
    \B0_addr0[3]_INST_0_i_1 
       (.I0(B_read0_0_done),
        .I1(fsm_out[3]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(fsm_out[0]),
        .O(done_reg));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-19_i_1 
       (.I0(v0_read_data[9]),
        .I1(go_1),
        .O(add0_left[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-1_i_1__0 
       (.I0(v0_read_data[1]),
        .I1(go_1),
        .O(add0_left[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-46_i_1 
       (.I0(v0_read_data[17]),
        .I1(go_1),
        .O(add0_left[17]));
  LUT2 #(
    .INIT(4'h2)) 
    \B_LUT-82_i_1 
       (.I0(v0_read_data[25]),
        .I1(go_1),
        .O(add0_left[25]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-11_i_1 
       (.I0(v0_read_data[2]),
        .I1(go_1),
        .O(add0_left[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-20_i_1 
       (.I0(v0_read_data[10]),
        .I1(go_1),
        .O(add0_left[10]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-47_i_1 
       (.I0(v0_read_data[18]),
        .I1(go_1),
        .O(add0_left[18]));
  LUT2 #(
    .INIT(4'h2)) 
    \C_LUT-83_i_1 
       (.I0(v0_read_data[26]),
        .I1(go_1),
        .O(add0_left[26]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-12_i_1 
       (.I0(v0_read_data[3]),
        .I1(go_1),
        .O(add0_left[3]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-21_i_1 
       (.I0(v0_read_data[11]),
        .I1(go_1),
        .O(add0_left[11]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-48_i_1 
       (.I0(v0_read_data[19]),
        .I1(go_1),
        .O(add0_left[19]));
  LUT2 #(
    .INIT(4'h2)) 
    \D_LUT-84_i_1 
       (.I0(v0_read_data[27]),
        .I1(go_1),
        .O(add0_left[27]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-13_i_1 
       (.I0(v0_read_data[4]),
        .I1(go_1),
        .O(add0_left[4]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-22_i_1 
       (.I0(v0_read_data[12]),
        .I1(go_1),
        .O(add0_left[12]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-49_i_1 
       (.I0(v0_read_data[20]),
        .I1(go_1),
        .O(add0_left[20]));
  LUT2 #(
    .INIT(4'h2)) 
    \E_LUT-85_i_1 
       (.I0(v0_read_data[28]),
        .I1(go_1),
        .O(add0_left[28]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-14_i_1 
       (.I0(v0_read_data[5]),
        .I1(go_1),
        .O(add0_left[5]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-23_i_1 
       (.I0(v0_read_data[13]),
        .I1(go_1),
        .O(add0_left[13]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-50_i_1 
       (.I0(v0_read_data[21]),
        .I1(go_1),
        .O(add0_left[21]));
  LUT2 #(
    .INIT(4'h2)) 
    \F_LUT-86_i_1 
       (.I0(v0_read_data[29]),
        .I1(go_1),
        .O(add0_left[29]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-15_i_1 
       (.I0(v0_read_data[6]),
        .I1(go_1),
        .O(add0_left[6]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-24_i_1 
       (.I0(v0_read_data[14]),
        .I1(go_1),
        .O(add0_left[14]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-51_i_1 
       (.I0(v0_read_data[22]),
        .I1(go_1),
        .O(add0_left[22]));
  LUT2 #(
    .INIT(4'h2)) 
    \G_LUT-87_i_1 
       (.I0(v0_read_data[30]),
        .I1(go_1),
        .O(add0_left[30]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-16_i_1 
       (.I0(v0_read_data[7]),
        .I1(go_1),
        .O(add0_left[7]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-25_i_1 
       (.I0(v0_read_data[15]),
        .I1(go_1),
        .O(add0_left[15]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-52_i_1 
       (.I0(v0_read_data[23]),
        .I1(go_1),
        .O(add0_left[23]));
  LUT2 #(
    .INIT(4'h2)) 
    \H_LUT-88_i_1 
       (.I0(v0_read_data[31]),
        .I1(go_1),
        .O(add0_left[31]));
  LUT4 #(
    .INIT(16'h0004)) 
    done_INST_0
       (.I0(fsm_out[2]),
        .I1(fsm_out[3]),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .O(done));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFDFFFFF)) 
    \done_buf[0]_i_2 
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[3]),
        .I4(fsm_out[0]),
        .I5(bin_read0_0_done),
        .O(\out_reg[1]_0 ));
  LUT6 #(
    .INIT(64'h0000400400000000)) 
    done_i_1
       (.I0(comb_reg_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(fsm_out[2]),
        .I4(fsm_out[3]),
        .I5(go),
        .O(cond00_go_in));
  LUT3 #(
    .INIT(8'hF4)) 
    \out[0]_i_1__0 
       (.I0(fsm_out[0]),
        .I1(\out[2]_i_4_n_0 ),
        .I2(\out[0]_i_2__0_n_0 ),
        .O(fsm_in[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFDFFDFFFF)) 
    \out[0]_i_2 
       (.I0(go),
        .I1(fsm_out[3]),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(comb_reg_done),
        .O(go_0));
  LUT6 #(
    .INIT(64'h0000220000003000)) 
    \out[0]_i_2__0 
       (.I0(B_read0_0_done),
        .I1(fsm_out[2]),
        .I2(i0_done),
        .I3(\out[3]_i_5_n_0 ),
        .I4(fsm_out[0]),
        .I5(fsm_out[1]),
        .O(\out[0]_i_2__0_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000)) 
    \out[1]_i_1 
       (.I0(\out[1]_i_2_n_0 ),
        .I1(comb_reg_out),
        .I2(v0_done),
        .I3(\out[2]_i_2_n_0 ),
        .I4(fsm_out[0]),
        .I5(\out[1]_i_3_n_0 ),
        .O(fsm_in[1]));
  LUT6 #(
    .INIT(64'h0000B90000002000)) 
    \out[1]_i_2 
       (.I0(fsm_out[2]),
        .I1(fsm_out[1]),
        .I2(v0_done),
        .I3(go),
        .I4(fsm_out[3]),
        .I5(comb_reg_done),
        .O(\out[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h080C080000000000)) 
    \out[1]_i_3 
       (.I0(i0_done),
        .I1(go),
        .I2(fsm_out[3]),
        .I3(fsm_out[2]),
        .I4(B_read0_0_done),
        .I5(fsm_out[1]),
        .O(\out[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4F44FFFF4F440000)) 
    \out[2]_i_1__0 
       (.I0(\out[2]_i_2_n_0 ),
        .I1(v0_done),
        .I2(\out[2]_i_3_n_0 ),
        .I3(bin_read0_0_done),
        .I4(fsm_out[0]),
        .I5(\out[2]_i_4_n_0 ),
        .O(fsm_in[2]));
  LUT4 #(
    .INIT(16'hFDFF)) 
    \out[2]_i_2 
       (.I0(fsm_out[2]),
        .I1(fsm_out[1]),
        .I2(fsm_out[3]),
        .I3(go),
        .O(\out[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFBFF)) 
    \out[2]_i_3 
       (.I0(fsm_out[3]),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .O(\out[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0C00000008000800)) 
    \out[2]_i_4 
       (.I0(dot_0_done),
        .I1(go),
        .I2(fsm_out[3]),
        .I3(fsm_out[2]),
        .I4(i0_done),
        .I5(fsm_out[1]),
        .O(\out[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000400000000)) 
    \out[31]_i_1 
       (.I0(fsm_out[3]),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[1]),
        .I4(dot_0_done),
        .I5(fsm_out[2]),
        .O(\out_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFDFFFF)) 
    \out[31]_i_3 
       (.I0(fsm_out[2]),
        .I1(dot_0_done),
        .I2(fsm_out[1]),
        .I3(fsm_out[0]),
        .I4(go),
        .I5(fsm_out[3]),
        .O(\out_reg[2]_0 ));
  LUT6 #(
    .INIT(64'h0010000000000010)) 
    \out[3]_i_1 
       (.I0(fsm_out[0]),
        .I1(i0_done),
        .I2(go),
        .I3(fsm_out[3]),
        .I4(fsm_out[2]),
        .I5(fsm_out[1]),
        .O(E));
  LUT6 #(
    .INIT(64'h4000004000000000)) 
    \out[3]_i_2 
       (.I0(comb_reg_out),
        .I1(fsm_out[0]),
        .I2(comb_reg_done),
        .I3(fsm_out[1]),
        .I4(fsm_out[2]),
        .I5(\out[3]_i_5_n_0 ),
        .O(fsm_in[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFFA8000800)) 
    \out[3]_i_3 
       (.I0(fsm_out[1]),
        .I1(B_read0_0_done),
        .I2(fsm_out[2]),
        .I3(\out[3]_i_5_n_0 ),
        .I4(i0_done),
        .I5(\out[3]_i_6_n_0 ),
        .O(\out[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFE300002C200000)) 
    \out[3]_i_4 
       (.I0(bin_read0_0_done),
        .I1(fsm_out[2]),
        .I2(fsm_out[1]),
        .I3(v0_done),
        .I4(\out[3]_i_5_n_0 ),
        .I5(comb_reg_done),
        .O(\out[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \out[3]_i_5 
       (.I0(go),
        .I1(fsm_out[3]),
        .O(\out[3]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h1010544400005444)) 
    \out[3]_i_6 
       (.I0(fsm_out[1]),
        .I1(fsm_out[3]),
        .I2(go),
        .I3(i0_done),
        .I4(fsm_out[2]),
        .I5(dot_0_done),
        .O(\out[3]_i_6_n_0 ));
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
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[2]),
        .Q(fsm_out[2]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(fsm_write_en),
        .D(fsm_in[3]),
        .Q(fsm_out[3]),
        .R(reset));
  MUXF7 \out_reg[3]_i_1 
       (.I0(\out[3]_i_3_n_0 ),
        .I1(\out[3]_i_4_n_0 ),
        .O(fsm_write_en),
        .S(fsm_out[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFDFFFFFF)) 
    \v0_write_data[31]_INST_0_i_1 
       (.I0(go),
        .I1(fsm_out[3]),
        .I2(fsm_out[1]),
        .I3(fsm_out[2]),
        .I4(fsm_out[0]),
        .I5(v0_done),
        .O(go_1));
  LUT6 #(
    .INIT(64'h0000004000000000)) 
    v0_write_en_INST_0
       (.I0(v0_done),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(fsm_out[3]),
        .I5(go),
        .O(v0_write_en));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0_3
   (i0_done,
    a,
    Q,
    A0_addr0,
    reset,
    E,
    clk,
    upd3_go_in,
    .A0_addr0_0_sp_1(A0_addr0_0_sn_1),
    D);
  output i0_done;
  output [3:0]a;
  output [0:0]Q;
  output [3:0]A0_addr0;
  input reset;
  input [0:0]E;
  input clk;
  input upd3_go_in;
  input [3:0]D;
  input A0_addr0_0_sn_1;

  wire \<const1> ;
  wire [3:0]A0_addr0;
  wire A0_addr0_0_sn_1;
  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [3:0]a;
  wire clk;
  wire i0_done;
  wire [2:0]i0_out;
  wire reset;
  wire upd3_go_in;

  LUT2 #(
    .INIT(4'h8)) 
    \A_LUT-0_i_1 
       (.I0(i0_out[0]),
        .I1(upd3_go_in),
        .O(a[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \B0_addr0[0]_INST_0 
       (.I0(i0_out[0]),
        .I1(A0_addr0_0_sn_1),
        .O(A0_addr0[0]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \B0_addr0[1]_INST_0 
       (.I0(i0_out[1]),
        .I1(A0_addr0_0_sn_1),
        .O(A0_addr0[1]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \B0_addr0[2]_INST_0 
       (.I0(i0_out[2]),
        .I1(A0_addr0_0_sn_1),
        .O(A0_addr0[2]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \B0_addr0[3]_INST_0 
       (.I0(Q),
        .I1(A0_addr0_0_sn_1),
        .O(A0_addr0[3]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \B_LUT-1_i_1 
       (.I0(i0_out[1]),
        .I1(upd3_go_in),
        .O(a[1]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \C_LUT-2_i_1 
       (.I0(i0_out[2]),
        .I1(upd3_go_in),
        .O(a[2]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \D_LUT-3_i_1 
       (.I0(Q),
        .I1(upd3_go_in),
        .O(a[3]));
  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(i0_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(i0_out[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(i0_out[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(i0_out[2]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(Q),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (comb_reg_done,
    comb_reg_out,
    reset,
    cond00_go_in,
    clk,
    \out_reg[0]_0 ,
    Q);
  output comb_reg_done;
  output comb_reg_out;
  input reset;
  input cond00_go_in;
  input clk;
  input \out_reg[0]_0 ;
  input [0:0]Q;

  wire \<const1> ;
  wire [0:0]Q;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire cond00_go_in;
  wire \out[0]_i_1__2_n_0 ;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(cond00_go_in),
        .Q(comb_reg_done),
        .R(reset));
  LUT3 #(
    .INIT(8'h8B)) 
    \out[0]_i_1__2 
       (.I0(comb_reg_out),
        .I1(\out_reg[0]_0 ),
        .I2(Q),
        .O(\out[0]_i_1__2_n_0 ));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out[0]_i_1__2_n_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule
