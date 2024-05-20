// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 02:38:02 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//std-fp-sdiv.futil-ultrascale-route.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lakeroad_xilinx_ultrascale_plus_add3_2
   (out0,
    a,
    b);
  output [2:0]out0;
  input [2:0]a;
  input [0:0]b;

  wire \<const0> ;
  wire \<const1> ;
  wire ZERO;
  wire [2:0]a;
  wire [0:0]b;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [2:0]out0;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h6000000080000000)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(b),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  GND GND
       (.G(\<const0> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  GND GND_1
       (.G(ZERO));
  VCC VCC
       (.P(\<const1> ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .DI({ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,ZERO,luts_O5_0[0]}),
        .O(out0),
        .S({ZERO,ZERO,ZERO,ZERO,ZERO,a[2:1],luts_O6_1[0]}));
endmodule

module lakeroad_xilinx_ultrascale_plus_ult3_2
   (carry_8_0,
    b,
    comb_reg_out,
    a);
  output carry_8_0;
  input [0:0]b;
  input comb_reg_out;
  input [2:0]a;

  wire \<const0> ;
  wire \<const1> ;
  wire ONE;
  wire [2:0]a;
  wire [0:0]b;
  wire carry_8_0;
  wire comb_reg_out;
  wire lt_out;
  wire [7:0]luts_O5_0;
  wire [7:0]luts_O6_1;
  wire [7:0]NLW_carry_8_CO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    A_LUT_0
       (.I0(a[0]),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[0]),
        .O6(luts_O6_1[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    B_LUT_1
       (.I0(a[1]),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[1]),
        .O6(luts_O6_1[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  LUT6_2 #(
    .INIT(64'h9FFFFFFFDFFFFFFF)) 
    C_LUT_2
       (.I0(a[2]),
        .I1(b),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .O5(luts_O5_0[2]),
        .O6(luts_O6_1[2]));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* OPT_MODIFIED = "PROPCONST" *) 
  VCC VCC_1
       (.P(ONE));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    carry_8
       (.CI(\<const0> ),
        .CI_TOP(\<const0> ),
        .CO({lt_out,NLW_carry_8_CO_UNCONNECTED[6:0]}),
        .DI({ONE,ONE,ONE,ONE,ONE,luts_O5_0[2:0]}),
        .S({ONE,ONE,ONE,ONE,ONE,luts_O6_1[2:0]}));
  LUT3 #(
    .INIT(8'hB8)) 
    \out[0]_i_1__1 
       (.I0(lt_out),
        .I1(b),
        .I2(comb_reg_out),
        .O(carry_8_0));
endmodule

(* ECO_CHECKSUM = "70ecee32" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    left_addr0,
    left_write_data,
    left_write_en,
    left_clk,
    left_read_data,
    left_done,
    right_addr0,
    right_write_data,
    right_write_en,
    right_clk,
    right_read_data,
    right_done,
    out_rem_addr0,
    out_rem_write_data,
    out_rem_write_en,
    out_rem_clk,
    out_rem_read_data,
    out_rem_done,
    out_quot_addr0,
    out_quot_write_data,
    out_quot_write_en,
    out_quot_clk,
    out_quot_read_data,
    out_quot_done);
  input go;
  input clk;
  input reset;
  output done;
  output [2:0]left_addr0;
  output [31:0]left_write_data;
  output left_write_en;
  output left_clk;
  input [31:0]left_read_data;
  input left_done;
  output [2:0]right_addr0;
  output [31:0]right_write_data;
  output right_write_en;
  output right_clk;
  input [31:0]right_read_data;
  input right_done;
  output [2:0]out_rem_addr0;
  output [31:0]out_rem_write_data;
  output out_rem_write_en;
  output out_rem_clk;
  input [31:0]out_rem_read_data;
  input out_rem_done;
  output [2:0]out_quot_addr0;
  output [31:0]out_quot_write_data;
  output out_quot_write_en;
  output out_quot_clk;
  input [31:0]out_quot_read_data;
  input out_quot_done;

  wire \<const0> ;
  wire [32:32]acc;
  wire [2:0]add_left;
  wire [2:0]add_out;
  wire clk;
  wire comb_reg0_n_1;
  wire comb_reg0_n_10;
  wire comb_reg0_n_11;
  wire comb_reg0_n_12;
  wire comb_reg0_n_13;
  wire comb_reg0_n_14;
  wire comb_reg0_n_15;
  wire comb_reg0_n_16;
  wire comb_reg0_n_17;
  wire comb_reg0_n_18;
  wire comb_reg0_n_19;
  wire comb_reg0_n_20;
  wire comb_reg0_n_21;
  wire comb_reg0_n_22;
  wire comb_reg0_n_23;
  wire comb_reg0_n_24;
  wire comb_reg0_n_25;
  wire comb_reg0_n_26;
  wire comb_reg0_n_27;
  wire comb_reg0_n_28;
  wire comb_reg0_n_29;
  wire comb_reg0_n_3;
  wire comb_reg0_n_30;
  wire comb_reg0_n_31;
  wire comb_reg0_n_32;
  wire comb_reg0_n_33;
  wire comb_reg0_n_34;
  wire comb_reg0_n_4;
  wire comb_reg0_n_5;
  wire comb_reg0_n_6;
  wire comb_reg0_n_7;
  wire comb_reg0_n_8;
  wire comb_reg0_n_9;
  wire comb_reg1_done;
  wire comb_reg1_n_0;
  wire comb_reg1_n_100;
  wire comb_reg1_n_101;
  wire comb_reg1_n_102;
  wire comb_reg1_n_103;
  wire comb_reg1_n_104;
  wire comb_reg1_n_105;
  wire comb_reg1_n_106;
  wire comb_reg1_n_107;
  wire comb_reg1_n_108;
  wire comb_reg1_n_109;
  wire comb_reg1_n_110;
  wire comb_reg1_n_111;
  wire comb_reg1_n_112;
  wire comb_reg1_n_113;
  wire comb_reg1_n_114;
  wire comb_reg1_n_115;
  wire comb_reg1_n_116;
  wire comb_reg1_n_117;
  wire comb_reg1_n_118;
  wire comb_reg1_n_119;
  wire comb_reg1_n_120;
  wire comb_reg1_n_121;
  wire comb_reg1_n_122;
  wire comb_reg1_n_123;
  wire comb_reg1_n_124;
  wire comb_reg1_n_125;
  wire comb_reg1_n_126;
  wire comb_reg1_n_127;
  wire comb_reg1_n_128;
  wire comb_reg1_n_129;
  wire comb_reg1_n_130;
  wire comb_reg1_n_131;
  wire comb_reg1_n_132;
  wire comb_reg1_n_133;
  wire comb_reg1_n_134;
  wire comb_reg1_n_135;
  wire comb_reg1_n_136;
  wire comb_reg1_n_137;
  wire comb_reg1_n_138;
  wire comb_reg1_n_139;
  wire comb_reg1_n_140;
  wire comb_reg1_n_141;
  wire comb_reg1_n_142;
  wire comb_reg1_n_143;
  wire comb_reg1_n_144;
  wire comb_reg1_n_145;
  wire comb_reg1_n_146;
  wire comb_reg1_n_147;
  wire comb_reg1_n_148;
  wire comb_reg1_n_149;
  wire comb_reg1_n_150;
  wire comb_reg1_n_151;
  wire comb_reg1_n_152;
  wire comb_reg1_n_153;
  wire comb_reg1_n_154;
  wire comb_reg1_n_155;
  wire comb_reg1_n_156;
  wire comb_reg1_n_157;
  wire comb_reg1_n_158;
  wire comb_reg1_n_159;
  wire comb_reg1_n_160;
  wire comb_reg1_n_161;
  wire comb_reg1_n_162;
  wire comb_reg1_n_163;
  wire comb_reg1_n_164;
  wire comb_reg1_n_32;
  wire comb_reg1_n_33;
  wire comb_reg1_n_34;
  wire comb_reg1_n_35;
  wire comb_reg1_n_36;
  wire comb_reg1_n_37;
  wire comb_reg1_n_38;
  wire comb_reg1_n_39;
  wire comb_reg1_n_40;
  wire comb_reg1_n_41;
  wire comb_reg1_n_42;
  wire comb_reg1_n_43;
  wire comb_reg1_n_44;
  wire comb_reg1_n_45;
  wire comb_reg1_n_46;
  wire comb_reg1_n_47;
  wire comb_reg1_n_48;
  wire comb_reg1_n_49;
  wire comb_reg1_n_50;
  wire comb_reg1_n_51;
  wire comb_reg1_n_52;
  wire comb_reg1_n_53;
  wire comb_reg1_n_54;
  wire comb_reg1_n_55;
  wire comb_reg1_n_56;
  wire comb_reg1_n_57;
  wire comb_reg1_n_58;
  wire comb_reg1_n_59;
  wire comb_reg1_n_60;
  wire comb_reg1_n_61;
  wire comb_reg1_n_62;
  wire comb_reg1_n_63;
  wire comb_reg1_n_64;
  wire comb_reg1_n_65;
  wire comb_reg1_n_66;
  wire comb_reg1_n_67;
  wire comb_reg1_n_68;
  wire comb_reg1_n_69;
  wire comb_reg1_n_70;
  wire comb_reg1_n_71;
  wire comb_reg1_n_72;
  wire comb_reg1_n_73;
  wire comb_reg1_n_74;
  wire comb_reg1_n_75;
  wire comb_reg1_n_76;
  wire comb_reg1_n_77;
  wire comb_reg1_n_78;
  wire comb_reg1_n_79;
  wire comb_reg1_n_80;
  wire comb_reg1_n_81;
  wire comb_reg1_n_82;
  wire comb_reg1_n_83;
  wire comb_reg1_n_84;
  wire comb_reg1_n_85;
  wire comb_reg1_n_86;
  wire comb_reg1_n_87;
  wire comb_reg1_n_88;
  wire comb_reg1_n_89;
  wire comb_reg1_n_90;
  wire comb_reg1_n_91;
  wire comb_reg1_n_92;
  wire comb_reg1_n_93;
  wire comb_reg1_n_94;
  wire comb_reg1_n_95;
  wire comb_reg1_n_96;
  wire comb_reg1_n_97;
  wire comb_reg1_n_98;
  wire comb_reg1_n_99;
  wire comb_reg_done;
  wire comb_reg_out;
  wire \comp/done0 ;
  wire \comp/running ;
  wire div_done;
  wire [31:31]div_left;
  wire div_n_33;
  wire div_n_34;
  wire div_n_35;
  wire div_n_36;
  wire div_n_37;
  wire div_n_38;
  wire div_n_39;
  wire div_n_40;
  wire div_n_41;
  wire div_n_42;
  wire div_n_43;
  wire div_n_44;
  wire div_n_45;
  wire div_n_46;
  wire div_n_47;
  wire div_n_48;
  wire div_n_49;
  wire div_n_50;
  wire div_n_51;
  wire div_n_52;
  wire div_n_53;
  wire div_n_54;
  wire div_n_55;
  wire div_n_56;
  wire div_n_57;
  wire div_n_58;
  wire div_n_59;
  wire div_n_60;
  wire div_n_61;
  wire div_n_62;
  wire div_n_63;
  wire div_n_64;
  wire div_n_66;
  wire done;
  wire fsm_n_39;
  wire fsm_n_41;
  wire fsm_n_73;
  wire fsm_n_75;
  wire fsm_n_83;
  wire fsm_n_84;
  wire fsm_n_85;
  wire go;
  wire idx_done;
  wire [2:0]idx_in;
  wire [2:0]idx_out;
  wire idx_write_en;
  wire invoke_go_in;
  wire [31:1]left_abs0;
  wire [2:0]left_addr0;
  wire [31:0]left_read_data;
  wire [2:0]lt_left;
  wire lt_n_0;
  wire out_quot_done;
  wire [31:0]out_quot_write_data;
  wire [0:0]out_quotient;
  wire [2:0]out_rem_addr0;
  wire out_rem_done;
  wire [31:0]out_rem_write_data;
  wire out_rem_write_en;
  wire [31:0]out_remainder;
  wire p_0_in__0;
  wire read_mem_idx0_go_in;
  wire reset;
  wire [31:1]right_abs;
  wire [31:1]right_abs0;
  wire [31:0]right_read_data;

  assign left_clk = clk;
  assign left_write_data[31] = \<const0> ;
  assign left_write_data[30] = \<const0> ;
  assign left_write_data[29] = \<const0> ;
  assign left_write_data[28] = \<const0> ;
  assign left_write_data[27] = \<const0> ;
  assign left_write_data[26] = \<const0> ;
  assign left_write_data[25] = \<const0> ;
  assign left_write_data[24] = \<const0> ;
  assign left_write_data[23] = \<const0> ;
  assign left_write_data[22] = \<const0> ;
  assign left_write_data[21] = \<const0> ;
  assign left_write_data[20] = \<const0> ;
  assign left_write_data[19] = \<const0> ;
  assign left_write_data[18] = \<const0> ;
  assign left_write_data[17] = \<const0> ;
  assign left_write_data[16] = \<const0> ;
  assign left_write_data[15] = \<const0> ;
  assign left_write_data[14] = \<const0> ;
  assign left_write_data[13] = \<const0> ;
  assign left_write_data[12] = \<const0> ;
  assign left_write_data[11] = \<const0> ;
  assign left_write_data[10] = \<const0> ;
  assign left_write_data[9] = \<const0> ;
  assign left_write_data[8] = \<const0> ;
  assign left_write_data[7] = \<const0> ;
  assign left_write_data[6] = \<const0> ;
  assign left_write_data[5] = \<const0> ;
  assign left_write_data[4] = \<const0> ;
  assign left_write_data[3] = \<const0> ;
  assign left_write_data[2] = \<const0> ;
  assign left_write_data[1] = \<const0> ;
  assign left_write_data[0] = \<const0> ;
  assign left_write_en = \<const0> ;
  assign out_quot_addr0[2:0] = out_rem_addr0;
  assign out_quot_clk = clk;
  assign out_quot_write_en = out_rem_write_en;
  assign out_rem_clk = clk;
  assign right_addr0[2:0] = left_addr0;
  assign right_clk = clk;
  assign right_write_data[31] = \<const0> ;
  assign right_write_data[30] = \<const0> ;
  assign right_write_data[29] = \<const0> ;
  assign right_write_data[28] = \<const0> ;
  assign right_write_data[27] = \<const0> ;
  assign right_write_data[26] = \<const0> ;
  assign right_write_data[25] = \<const0> ;
  assign right_write_data[24] = \<const0> ;
  assign right_write_data[23] = \<const0> ;
  assign right_write_data[22] = \<const0> ;
  assign right_write_data[21] = \<const0> ;
  assign right_write_data[20] = \<const0> ;
  assign right_write_data[19] = \<const0> ;
  assign right_write_data[18] = \<const0> ;
  assign right_write_data[17] = \<const0> ;
  assign right_write_data[16] = \<const0> ;
  assign right_write_data[15] = \<const0> ;
  assign right_write_data[14] = \<const0> ;
  assign right_write_data[13] = \<const0> ;
  assign right_write_data[12] = \<const0> ;
  assign right_write_data[11] = \<const0> ;
  assign right_write_data[10] = \<const0> ;
  assign right_write_data[9] = \<const0> ;
  assign right_write_data[8] = \<const0> ;
  assign right_write_data[7] = \<const0> ;
  assign right_write_data[6] = \<const0> ;
  assign right_write_data[5] = \<const0> ;
  assign right_write_data[4] = \<const0> ;
  assign right_write_data[3] = \<const0> ;
  assign right_write_data[2] = \<const0> ;
  assign right_write_data[1] = \<const0> ;
  assign right_write_data[0] = \<const0> ;
  assign right_write_en = \<const0> ;
  GND GND
       (.G(\<const0> ));
  std_add add
       (.a(add_left),
        .b(fsm_n_84),
        .out0(add_out));
  std_reg__parameterized0 comb_reg
       (.b(fsm_n_83),
        .clk(clk),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .\out_reg[0]_0 (lt_n_0),
        .reset(reset));
  std_reg__parameterized1 comb_reg0
       (.E(read_mem_idx0_go_in),
        .Q({comb_reg0_n_3,comb_reg0_n_4,comb_reg0_n_5,comb_reg0_n_6,comb_reg0_n_7,comb_reg0_n_8,comb_reg0_n_9,comb_reg0_n_10,comb_reg0_n_11,comb_reg0_n_12,comb_reg0_n_13,comb_reg0_n_14,comb_reg0_n_15,comb_reg0_n_16,comb_reg0_n_17,comb_reg0_n_18,comb_reg0_n_19,comb_reg0_n_20,comb_reg0_n_21,comb_reg0_n_22,comb_reg0_n_23,comb_reg0_n_24,comb_reg0_n_25,comb_reg0_n_26,comb_reg0_n_27,comb_reg0_n_28,comb_reg0_n_29,comb_reg0_n_30,comb_reg0_n_31,comb_reg0_n_32,comb_reg0_n_33,comb_reg0_n_34}),
        .clk(clk),
        .comb_reg1_done(comb_reg1_done),
        .done0(\comp/done0 ),
        .done_i_4_0(fsm_n_39),
        .done_reg_0(fsm_n_85),
        .done_reg_1(fsm_n_73),
        .left_abs0(left_abs0[30:1]),
        .left_read_data(left_read_data),
        .reset(reset),
        .running_reg(comb_reg0_n_1),
        .running_reg_0(fsm_n_75),
        .running_reg_1(div_n_66),
        .running_reg_2(fsm_n_41));
  std_reg__parameterized1_0 comb_reg1
       (.DI(comb_reg1_n_0),
        .E(read_mem_idx0_go_in),
        .Q(out_remainder),
        .S({comb_reg1_n_63,comb_reg1_n_64,comb_reg1_n_65,comb_reg1_n_66,comb_reg1_n_67,comb_reg1_n_68,comb_reg1_n_69,comb_reg1_n_70}),
        .\acc_reg[15] ({comb_reg1_n_142,comb_reg1_n_143,comb_reg1_n_144,comb_reg1_n_145,comb_reg1_n_146,comb_reg1_n_147,comb_reg1_n_148,comb_reg1_n_149}),
        .\acc_reg[23] ({comb_reg1_n_112,comb_reg1_n_113,comb_reg1_n_114,comb_reg1_n_115,comb_reg1_n_116,comb_reg1_n_117,comb_reg1_n_118,comb_reg1_n_119}),
        .\acc_reg[30] (comb_reg1_n_71),
        .\acc_reg[7] ({comb_reg1_n_157,comb_reg1_n_158,comb_reg1_n_159,comb_reg1_n_160,comb_reg1_n_161,comb_reg1_n_162,comb_reg1_n_163,comb_reg1_n_164}),
        .clk(clk),
        .\out_reg[31]_0 ({p_0_in__0,comb_reg1_n_32,comb_reg1_n_33,comb_reg1_n_34,comb_reg1_n_35,comb_reg1_n_36,comb_reg1_n_37,comb_reg1_n_38,comb_reg1_n_39,comb_reg1_n_40,comb_reg1_n_41,comb_reg1_n_42,comb_reg1_n_43,comb_reg1_n_44,comb_reg1_n_45,comb_reg1_n_46,comb_reg1_n_47,comb_reg1_n_48,comb_reg1_n_49,comb_reg1_n_50,comb_reg1_n_51,comb_reg1_n_52,comb_reg1_n_53,comb_reg1_n_54,comb_reg1_n_55,comb_reg1_n_56,comb_reg1_n_57,comb_reg1_n_58,comb_reg1_n_59,comb_reg1_n_60,comb_reg1_n_61,comb_reg1_n_62}),
        .\out_reg[31]_1 ({comb_reg1_n_72,comb_reg1_n_73,comb_reg1_n_74,comb_reg1_n_75,comb_reg1_n_76,comb_reg1_n_77,comb_reg1_n_78,comb_reg1_n_79}),
        .\out_reg[31]_2 (comb_reg1_n_80),
        .\out_reg[31]_3 ({comb_reg1_n_96,comb_reg1_n_97,comb_reg1_n_98,comb_reg1_n_99,comb_reg1_n_100,comb_reg1_n_101,comb_reg1_n_102,comb_reg1_n_103}),
        .\out_reg[31]_4 ({comb_reg1_n_104,comb_reg1_n_105,comb_reg1_n_106,comb_reg1_n_107,comb_reg1_n_108,comb_reg1_n_109,comb_reg1_n_110,comb_reg1_n_111}),
        .\out_reg[31]_5 ({comb_reg1_n_120,comb_reg1_n_121,comb_reg1_n_122,comb_reg1_n_123,comb_reg1_n_124,comb_reg1_n_125,comb_reg1_n_126}),
        .\out_reg[31]_6 ({comb_reg1_n_127,comb_reg1_n_128,comb_reg1_n_129,comb_reg1_n_130,comb_reg1_n_131,comb_reg1_n_132,comb_reg1_n_133}),
        .\out_remainder_reg[14] ({comb_reg1_n_88,comb_reg1_n_89,comb_reg1_n_90,comb_reg1_n_91,comb_reg1_n_92,comb_reg1_n_93,comb_reg1_n_94,comb_reg1_n_95}),
        .\out_remainder_reg[15] ({comb_reg1_n_81,comb_reg1_n_82,comb_reg1_n_83,comb_reg1_n_84,comb_reg1_n_85,comb_reg1_n_86,comb_reg1_n_87}),
        .\out_remainder_reg[15]_0 ({comb_reg1_n_134,comb_reg1_n_135,comb_reg1_n_136,comb_reg1_n_137,comb_reg1_n_138,comb_reg1_n_139,comb_reg1_n_140,comb_reg1_n_141}),
        .\out_remainder_reg[7] ({comb_reg1_n_150,comb_reg1_n_151,comb_reg1_n_152,comb_reg1_n_153,comb_reg1_n_154,comb_reg1_n_155,comb_reg1_n_156}),
        .quotient_next1_carry__0({div_n_33,div_n_34,div_n_35,div_n_36,div_n_37,div_n_38,div_n_39,div_n_40,div_n_41,div_n_42,div_n_43,div_n_44,div_n_45,div_n_46,div_n_47,div_n_48,div_n_49,div_n_50,div_n_51,div_n_52,div_n_53,div_n_54,div_n_55,div_n_56,div_n_57,div_n_58,div_n_59,div_n_60,div_n_61,div_n_62,div_n_63,div_n_64}),
        .reset(reset),
        .right_abs(right_abs[30:1]),
        .right_abs0(right_abs0),
        .right_read_data(right_read_data),
        .\right_save_reg[30] (fsm_n_39));
  std_fp_sdiv_pipe div
       (.D(right_abs),
        .DI(comb_reg1_n_0),
        .E(invoke_go_in),
        .Q(out_remainder),
        .S({comb_reg1_n_63,comb_reg1_n_64,comb_reg1_n_65,comb_reg1_n_66,comb_reg1_n_67,comb_reg1_n_68,comb_reg1_n_69,comb_reg1_n_70}),
        .SR(acc),
        .\acc_reg[16] ({comb_reg1_n_142,comb_reg1_n_143,comb_reg1_n_144,comb_reg1_n_145,comb_reg1_n_146,comb_reg1_n_147,comb_reg1_n_148,comb_reg1_n_149}),
        .\acc_reg[24] ({comb_reg1_n_112,comb_reg1_n_113,comb_reg1_n_114,comb_reg1_n_115,comb_reg1_n_116,comb_reg1_n_117,comb_reg1_n_118,comb_reg1_n_119}),
        .\acc_reg[31] ({div_n_33,div_n_34,div_n_35,div_n_36,div_n_37,div_n_38,div_n_39,div_n_40,div_n_41,div_n_42,div_n_43,div_n_44,div_n_45,div_n_46,div_n_47,div_n_48,div_n_49,div_n_50,div_n_51,div_n_52,div_n_53,div_n_54,div_n_55,div_n_56,div_n_57,div_n_58,div_n_59,div_n_60,div_n_61,div_n_62,div_n_63,div_n_64}),
        .\acc_reg[32] ({comb_reg1_n_127,comb_reg1_n_128,comb_reg1_n_129,comb_reg1_n_130,comb_reg1_n_131,comb_reg1_n_132,comb_reg1_n_133}),
        .\acc_reg[8] ({comb_reg1_n_157,comb_reg1_n_158,comb_reg1_n_159,comb_reg1_n_160,comb_reg1_n_161,comb_reg1_n_162,comb_reg1_n_163,comb_reg1_n_164}),
        .clk(clk),
        .div_done(div_done),
        .div_left(div_left),
        .done0(\comp/done0 ),
        .\idx_reg[3] (div_n_66),
        .left_abs0(left_abs0),
        .out_quot_write_data(out_quot_write_data[31:1]),
        .out_quot_write_data_1_sp_1(out_rem_write_en),
        .\out_quotient_reg[0] (out_quotient),
        .out_rem_write_data(out_rem_write_data),
        .\out_remainder0_inferred__0/i__carry__0 ({comb_reg1_n_81,comb_reg1_n_82,comb_reg1_n_83,comb_reg1_n_84,comb_reg1_n_85,comb_reg1_n_86,comb_reg1_n_87}),
        .\out_remainder0_inferred__0/i__carry__0_0 ({comb_reg1_n_88,comb_reg1_n_89,comb_reg1_n_90,comb_reg1_n_91,comb_reg1_n_92,comb_reg1_n_93,comb_reg1_n_94,comb_reg1_n_95}),
        .\out_remainder_reg[0] (fsm_n_73),
        .\out_remainder_reg[15] ({comb_reg1_n_134,comb_reg1_n_135,comb_reg1_n_136,comb_reg1_n_137,comb_reg1_n_138,comb_reg1_n_139,comb_reg1_n_140,comb_reg1_n_141}),
        .\out_remainder_reg[1] ({comb_reg0_n_3,comb_reg0_n_4,comb_reg0_n_5,comb_reg0_n_6,comb_reg0_n_7,comb_reg0_n_8,comb_reg0_n_9,comb_reg0_n_10,comb_reg0_n_11,comb_reg0_n_12,comb_reg0_n_13,comb_reg0_n_14,comb_reg0_n_15,comb_reg0_n_16,comb_reg0_n_17,comb_reg0_n_18,comb_reg0_n_19,comb_reg0_n_20,comb_reg0_n_21,comb_reg0_n_22,comb_reg0_n_23,comb_reg0_n_24,comb_reg0_n_25,comb_reg0_n_26,comb_reg0_n_27,comb_reg0_n_28,comb_reg0_n_29,comb_reg0_n_30,comb_reg0_n_31,comb_reg0_n_32,comb_reg0_n_33,comb_reg0_n_34}),
        .\out_remainder_reg[23] ({comb_reg1_n_104,comb_reg1_n_105,comb_reg1_n_106,comb_reg1_n_107,comb_reg1_n_108,comb_reg1_n_109,comb_reg1_n_110,comb_reg1_n_111}),
        .\out_remainder_reg[31] ({comb_reg1_n_120,comb_reg1_n_121,comb_reg1_n_122,comb_reg1_n_123,comb_reg1_n_124,comb_reg1_n_125,comb_reg1_n_126}),
        .\out_remainder_reg[7] ({comb_reg1_n_150,comb_reg1_n_151,comb_reg1_n_152,comb_reg1_n_153,comb_reg1_n_154,comb_reg1_n_155,comb_reg1_n_156}),
        .quotient_next1_carry__0({comb_reg1_n_96,comb_reg1_n_97,comb_reg1_n_98,comb_reg1_n_99,comb_reg1_n_100,comb_reg1_n_101,comb_reg1_n_102,comb_reg1_n_103}),
        .quotient_next1_carry__0_0(comb_reg1_n_80),
        .\quotient_reg[0] (comb_reg1_n_71),
        .\quotient_reg[0]_0 ({comb_reg1_n_72,comb_reg1_n_73,comb_reg1_n_74,comb_reg1_n_75,comb_reg1_n_76,comb_reg1_n_77,comb_reg1_n_78,comb_reg1_n_79}),
        .\quotient_reg[31] (fsm_n_39),
        .reset(reset),
        .right_abs0(right_abs0[31]),
        .right_sign_reg_0({p_0_in__0,comb_reg1_n_62}),
        .running(\comp/running ),
        .running_reg(comb_reg0_n_1));
  std_reg fsm
       (.D(right_abs[31]),
        .E(idx_write_en),
        .Q(idx_out),
        .SR(acc),
        .a(lt_left),
        .b(fsm_n_83),
        .carry_8(idx_in),
        .clk(clk),
        .comb_reg1_done(comb_reg1_done),
        .comb_reg_done(comb_reg_done),
        .comb_reg_out(comb_reg_out),
        .div_done(div_done),
        .div_left(div_left),
        .done(done),
        .done_reg(fsm_n_39),
        .done_reg_0(read_mem_idx0_go_in),
        .done_reg_1(fsm_n_84),
        .go(go),
        .idx_done(idx_done),
        .left_abs0(left_abs0),
        .left_addr0(left_addr0),
        .left_sign_reg({comb_reg0_n_3,comb_reg0_n_4,comb_reg0_n_5,comb_reg0_n_6,comb_reg0_n_7,comb_reg0_n_8,comb_reg0_n_9,comb_reg0_n_10,comb_reg0_n_11,comb_reg0_n_12,comb_reg0_n_13,comb_reg0_n_14,comb_reg0_n_15,comb_reg0_n_16,comb_reg0_n_17,comb_reg0_n_18,comb_reg0_n_19,comb_reg0_n_20,comb_reg0_n_21,comb_reg0_n_22,comb_reg0_n_23,comb_reg0_n_24,comb_reg0_n_25,comb_reg0_n_26,comb_reg0_n_27,comb_reg0_n_28,comb_reg0_n_29,comb_reg0_n_30,comb_reg0_n_31,comb_reg0_n_32,comb_reg0_n_33,comb_reg0_n_34}),
        .out0(add_out),
        .out_quot_done(out_quot_done),
        .out_quot_write_data(out_quot_write_data[0]),
        .\out_quot_write_data[0] (out_quotient),
        .\out_reg[0]_0 (fsm_n_41),
        .\out_reg[1]_0 (invoke_go_in),
        .\out_reg[2]_0 (add_left),
        .\out_reg[31] (fsm_n_85),
        .out_rem_done(out_rem_done),
        .out_rem_done_0(out_rem_write_en),
        .reset(reset),
        .right_abs0(right_abs0),
        .\right_save_reg[31] ({p_0_in__0,comb_reg1_n_32,comb_reg1_n_33,comb_reg1_n_34,comb_reg1_n_35,comb_reg1_n_36,comb_reg1_n_37,comb_reg1_n_38,comb_reg1_n_39,comb_reg1_n_40,comb_reg1_n_41,comb_reg1_n_42,comb_reg1_n_43,comb_reg1_n_44,comb_reg1_n_45,comb_reg1_n_46,comb_reg1_n_47,comb_reg1_n_48,comb_reg1_n_49,comb_reg1_n_50,comb_reg1_n_51,comb_reg1_n_52,comb_reg1_n_53,comb_reg1_n_54,comb_reg1_n_55,comb_reg1_n_56,comb_reg1_n_57,comb_reg1_n_58,comb_reg1_n_59,comb_reg1_n_60,comb_reg1_n_61,comb_reg1_n_62}),
        .running(\comp/running ),
        .running_reg(fsm_n_73),
        .running_reg_0(fsm_n_75));
  std_reg_1 idx
       (.D(idx_in),
        .E(idx_write_en),
        .Q(idx_out),
        .clk(clk),
        .idx_done(idx_done),
        .out_rem_addr0(out_rem_addr0),
        .out_rem_addr0_2_sp_1(out_rem_write_en),
        .reset(reset));
  std_lt lt
       (.a(lt_left),
        .b(fsm_n_83),
        .carry_8(lt_n_0),
        .comb_reg_out(comb_reg_out));
endmodule

module std_add
   (out0,
    a,
    b);
  output [2:0]out0;
  input [2:0]a;
  input [0:0]b;

  wire [2:0]a;
  wire [0:0]b;
  wire [2:0]out0;

  lakeroad_xilinx_ultrascale_plus_add3_2 _impl
       (.a(a),
        .b(b),
        .out0(out0));
endmodule

module std_fp_div_pipe
   (div_done,
    Q,
    \acc_reg[31]_0 ,
    running_reg_0,
    \idx_reg[3]_0 ,
    out_rem_write_data,
    out_quot_write_data,
    \out_quotient_reg[0]_0 ,
    \out_remainder_reg[31]_0 ,
    \right_save_reg[7] ,
    \right_save_reg[15] ,
    \right_save_reg[23] ,
    done0,
    clk,
    SR,
    \out_remainder_reg[7]_0 ,
    \out_remainder_reg[15]_0 ,
    \out_remainder_reg[23]_0 ,
    \out_remainder_reg[31]_1 ,
    \out_remainder0_inferred__0/i__carry__0_0 ,
    \out_remainder0_inferred__0/i__carry__0_1 ,
    DI,
    S,
    \acc_reg[8]_0 ,
    \acc_reg[16]_0 ,
    \acc_reg[24]_0 ,
    \acc_reg[32]_0 ,
    quotient_next1_carry__0_0,
    \quotient_reg[0]_0 ,
    \quotient_reg[0]_1 ,
    running_reg_1,
    D,
    quotient_next1_carry__0_1,
    \quotient_reg[31]_0 ,
    right_abs0,
    quotient_next0_carry__2_0,
    left_abs0,
    \out_remainder_reg[1]_0 ,
    \out_remainder_reg[0]_0 ,
    .out_quot_write_data_1_sp_1(out_quot_write_data_1_sn_1),
    out_rem_intermediate0,
    right_sign,
    left_sign,
    out_rem_intermediate0_carry__2);
  output div_done;
  output [31:0]Q;
  output [31:0]\acc_reg[31]_0 ;
  output running_reg_0;
  output \idx_reg[3]_0 ;
  output [31:0]out_rem_write_data;
  output [30:0]out_quot_write_data;
  output [0:0]\out_quotient_reg[0]_0 ;
  output [7:0]\out_remainder_reg[31]_0 ;
  output [7:0]\right_save_reg[7] ;
  output [7:0]\right_save_reg[15] ;
  output [7:0]\right_save_reg[23] ;
  input done0;
  input clk;
  input [1:0]SR;
  input [6:0]\out_remainder_reg[7]_0 ;
  input [7:0]\out_remainder_reg[15]_0 ;
  input [7:0]\out_remainder_reg[23]_0 ;
  input [6:0]\out_remainder_reg[31]_1 ;
  input [6:0]\out_remainder0_inferred__0/i__carry__0_0 ;
  input [7:0]\out_remainder0_inferred__0/i__carry__0_1 ;
  input [0:0]DI;
  input [7:0]S;
  input [7:0]\acc_reg[8]_0 ;
  input [7:0]\acc_reg[16]_0 ;
  input [7:0]\acc_reg[24]_0 ;
  input [6:0]\acc_reg[32]_0 ;
  input [7:0]quotient_next1_carry__0_0;
  input [0:0]\quotient_reg[0]_0 ;
  input [7:0]\quotient_reg[0]_1 ;
  input running_reg_1;
  input [28:0]D;
  input quotient_next1_carry__0_1;
  input \quotient_reg[31]_0 ;
  input [0:0]right_abs0;
  input [0:0]quotient_next0_carry__2_0;
  input [30:0]left_abs0;
  input [31:0]\out_remainder_reg[1]_0 ;
  input \out_remainder_reg[0]_0 ;
  input [31:0]out_rem_intermediate0;
  input right_sign;
  input left_sign;
  input [31:0]out_rem_intermediate0_carry__2;
  input out_quot_write_data_1_sn_1;

  wire \<const0> ;
  wire \<const1> ;
  wire [28:0]D;
  wire [0:0]DI;
  wire GND_2;
  wire [31:0]Q;
  wire [7:0]S;
  wire [1:0]SR;
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
  wire \acc[32]_i_2_n_0 ;
  wire \acc[3]_i_1_n_0 ;
  wire \acc[4]_i_1_n_0 ;
  wire \acc[5]_i_1_n_0 ;
  wire \acc[6]_i_1_n_0 ;
  wire \acc[7]_i_1_n_0 ;
  wire \acc[8]_i_1_n_0 ;
  wire \acc[9]_i_1_n_0 ;
  wire [7:0]\acc_reg[16]_0 ;
  wire [7:0]\acc_reg[24]_0 ;
  wire [31:0]\acc_reg[31]_0 ;
  wire [6:0]\acc_reg[32]_0 ;
  wire [7:0]\acc_reg[8]_0 ;
  wire \acc_reg_n_0_[32] ;
  wire clk;
  wire div_done;
  wire done0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry_i_8_n_0;
  wire [5:0]idx_reg;
  wire \idx_reg[3]_0 ;
  wire [30:0]left_abs0;
  wire left_sign;
  wire [30:0]out_quot_write_data;
  wire \out_quot_write_data[16]_INST_0_i_1_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_2_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_3_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_4_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_5_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_6_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_7_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_8_n_0 ;
  wire \out_quot_write_data[16]_INST_0_i_9_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_1_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_2_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_3_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_4_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_5_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_6_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_7_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_8_n_0 ;
  wire \out_quot_write_data[24]_INST_0_i_9_n_0 ;
  wire \out_quot_write_data[31]_INST_0_i_2_n_0 ;
  wire \out_quot_write_data[31]_INST_0_i_3_n_0 ;
  wire \out_quot_write_data[31]_INST_0_i_4_n_0 ;
  wire \out_quot_write_data[31]_INST_0_i_5_n_0 ;
  wire \out_quot_write_data[31]_INST_0_i_6_n_0 ;
  wire \out_quot_write_data[31]_INST_0_i_7_n_0 ;
  wire \out_quot_write_data[31]_INST_0_i_8_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_10_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_1_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_2_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_3_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_4_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_5_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_6_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_7_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_8_n_0 ;
  wire \out_quot_write_data[8]_INST_0_i_9_n_0 ;
  wire out_quot_write_data_1_sn_1;
  wire [31:1]out_quotient;
  wire [31:1]out_quotient0;
  wire \out_quotient[31]_i_1_n_0 ;
  wire \out_quotient[31]_i_2_n_0 ;
  wire [0:0]\out_quotient_reg[0]_0 ;
  wire [31:0]out_rem_intermediate0;
  wire [31:0]out_rem_intermediate0_carry__2;
  wire [31:0]out_rem_write_data;
  wire \out_rem_write_data[16]_INST_0_i_1_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_2_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_3_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_4_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_5_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_6_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_7_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_8_n_0 ;
  wire \out_rem_write_data[16]_INST_0_i_9_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_1_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_2_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_3_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_4_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_5_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_6_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_7_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_8_n_0 ;
  wire \out_rem_write_data[24]_INST_0_i_9_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_10_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_11_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_12_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_13_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_14_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_15_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_16_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_17_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_1_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_3_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_4_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_5_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_6_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_7_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_8_n_0 ;
  wire \out_rem_write_data[31]_INST_0_i_9_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_10_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_1_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_2_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_3_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_4_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_5_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_6_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_7_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_8_n_0 ;
  wire \out_rem_write_data[8]_INST_0_i_9_n_0 ;
  wire [31:1]out_remainder0;
  wire out_remainder0_carry__0_n_0;
  wire out_remainder0_carry__0_n_10;
  wire out_remainder0_carry__0_n_11;
  wire out_remainder0_carry__0_n_12;
  wire out_remainder0_carry__0_n_13;
  wire out_remainder0_carry__0_n_14;
  wire out_remainder0_carry__0_n_15;
  wire out_remainder0_carry__0_n_8;
  wire out_remainder0_carry__0_n_9;
  wire out_remainder0_carry__1_n_0;
  wire out_remainder0_carry__1_n_10;
  wire out_remainder0_carry__1_n_11;
  wire out_remainder0_carry__1_n_12;
  wire out_remainder0_carry__1_n_13;
  wire out_remainder0_carry__1_n_14;
  wire out_remainder0_carry__1_n_15;
  wire out_remainder0_carry__1_n_8;
  wire out_remainder0_carry__1_n_9;
  wire out_remainder0_carry__2_i_1_n_0;
  wire out_remainder0_carry__2_n_10;
  wire out_remainder0_carry__2_n_11;
  wire out_remainder0_carry__2_n_12;
  wire out_remainder0_carry__2_n_13;
  wire out_remainder0_carry__2_n_14;
  wire out_remainder0_carry__2_n_15;
  wire out_remainder0_carry__2_n_8;
  wire out_remainder0_carry__2_n_9;
  wire out_remainder0_carry_i_8_n_0;
  wire out_remainder0_carry_n_0;
  wire out_remainder0_carry_n_10;
  wire out_remainder0_carry_n_11;
  wire out_remainder0_carry_n_12;
  wire out_remainder0_carry_n_13;
  wire out_remainder0_carry_n_14;
  wire out_remainder0_carry_n_15;
  wire out_remainder0_carry_n_8;
  wire out_remainder0_carry_n_9;
  wire [6:0]\out_remainder0_inferred__0/i__carry__0_0 ;
  wire [7:0]\out_remainder0_inferred__0/i__carry__0_1 ;
  wire \out_remainder0_inferred__0/i__carry__0_n_0 ;
  wire \out_remainder0_inferred__0/i__carry_n_0 ;
  wire \out_remainder[31]_i_1_n_0 ;
  wire \out_remainder_reg[0]_0 ;
  wire [7:0]\out_remainder_reg[15]_0 ;
  wire [31:0]\out_remainder_reg[1]_0 ;
  wire [7:0]\out_remainder_reg[23]_0 ;
  wire [7:0]\out_remainder_reg[31]_0 ;
  wire [6:0]\out_remainder_reg[31]_1 ;
  wire [6:0]\out_remainder_reg[7]_0 ;
  wire [5:0]p_0_in;
  wire [31:0]p_1_in;
  wire p_2_in0;
  wire \quotient[10]_i_1_n_0 ;
  wire \quotient[11]_i_1_n_0 ;
  wire \quotient[12]_i_1_n_0 ;
  wire \quotient[13]_i_1_n_0 ;
  wire \quotient[14]_i_1_n_0 ;
  wire \quotient[15]_i_1_n_0 ;
  wire \quotient[16]_i_1_n_0 ;
  wire \quotient[17]_i_1_n_0 ;
  wire \quotient[18]_i_1_n_0 ;
  wire \quotient[19]_i_1_n_0 ;
  wire \quotient[1]_i_1_n_0 ;
  wire \quotient[20]_i_1_n_0 ;
  wire \quotient[21]_i_1_n_0 ;
  wire \quotient[22]_i_1_n_0 ;
  wire \quotient[23]_i_1_n_0 ;
  wire \quotient[24]_i_1_n_0 ;
  wire \quotient[25]_i_1_n_0 ;
  wire \quotient[26]_i_1_n_0 ;
  wire \quotient[27]_i_1_n_0 ;
  wire \quotient[28]_i_1_n_0 ;
  wire \quotient[29]_i_1_n_0 ;
  wire \quotient[2]_i_1_n_0 ;
  wire \quotient[30]_i_1_n_0 ;
  wire \quotient[31]_i_1_n_0 ;
  wire \quotient[3]_i_1_n_0 ;
  wire \quotient[4]_i_1_n_0 ;
  wire \quotient[5]_i_1_n_0 ;
  wire \quotient[6]_i_1_n_0 ;
  wire \quotient[7]_i_1_n_0 ;
  wire \quotient[8]_i_1_n_0 ;
  wire \quotient[9]_i_1_n_0 ;
  wire [31:1]quotient_next;
  wire [31:0]quotient_next0;
  wire quotient_next0_carry__0_n_0;
  wire quotient_next0_carry__1_n_0;
  wire [0:0]quotient_next0_carry__2_0;
  wire quotient_next0_carry__2_i_1_n_0;
  wire quotient_next0_carry_n_0;
  wire quotient_next1;
  wire [7:0]quotient_next1_carry__0_0;
  wire quotient_next1_carry__0_1;
  wire quotient_next1_carry__0_i_2_n_0;
  wire quotient_next1_carry__0_i_3_n_0;
  wire quotient_next1_carry__0_i_4_n_0;
  wire quotient_next1_carry__0_i_5_n_0;
  wire quotient_next1_carry__0_i_6_n_0;
  wire quotient_next1_carry__0_i_7_n_0;
  wire quotient_next1_carry__0_i_8_n_0;
  wire quotient_next1_carry__0_n_0;
  wire quotient_next1_carry__1_i_1_n_0;
  wire quotient_next1_carry_i_1_n_0;
  wire quotient_next1_carry_i_2_n_0;
  wire quotient_next1_carry_i_3_n_0;
  wire quotient_next1_carry_i_4_n_0;
  wire quotient_next1_carry_i_5_n_0;
  wire quotient_next1_carry_i_6_n_0;
  wire quotient_next1_carry_i_7_n_0;
  wire quotient_next1_carry_i_8_n_0;
  wire quotient_next1_carry_n_0;
  wire [0:0]\quotient_reg[0]_0 ;
  wire [7:0]\quotient_reg[0]_1 ;
  wire \quotient_reg[31]_0 ;
  wire [0:0]right_abs0;
  wire [7:0]\right_save_reg[15] ;
  wire [7:0]\right_save_reg[23] ;
  wire [7:0]\right_save_reg[7] ;
  wire right_sign;
  wire running_reg_0;
  wire running_reg_1;
  wire [7:0]\NLW_out_quot_write_data[16]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_quot_write_data[24]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_quot_write_data[8]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_rem_write_data[16]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_rem_write_data[24]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_rem_write_data[8]_INST_0_i_1_CO_UNCONNECTED ;
  wire [7:0]NLW_out_remainder0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_out_remainder0_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_out_remainder0_carry__1_CO_UNCONNECTED;
  wire [7:0]\NLW_out_remainder0_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_remainder0_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [7:0]NLW_quotient_next0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_quotient_next0_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_quotient_next0_carry__1_CO_UNCONNECTED;
  wire [7:0]NLW_quotient_next1_carry_CO_UNCONNECTED;
  wire [7:0]NLW_quotient_next1_carry__0_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  LUT5 #(
    .INIT(32'hABA8A8A8)) 
    \acc[0]_i_1 
       (.I0(p_2_in0),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[30]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .O(\acc[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[10]_i_1 
       (.I0(\acc_reg[31]_0 [9]),
        .I1(quotient_next1),
        .I2(quotient_next0[9]),
        .O(\acc[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[11]_i_1 
       (.I0(\acc_reg[31]_0 [10]),
        .I1(quotient_next1),
        .I2(quotient_next0[10]),
        .O(\acc[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[12]_i_1 
       (.I0(\acc_reg[31]_0 [11]),
        .I1(quotient_next1),
        .I2(quotient_next0[11]),
        .O(\acc[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[13]_i_1 
       (.I0(\acc_reg[31]_0 [12]),
        .I1(quotient_next1),
        .I2(quotient_next0[12]),
        .O(\acc[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[14]_i_1 
       (.I0(\acc_reg[31]_0 [13]),
        .I1(quotient_next1),
        .I2(quotient_next0[13]),
        .O(\acc[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[15]_i_1 
       (.I0(\acc_reg[31]_0 [14]),
        .I1(quotient_next1),
        .I2(quotient_next0[14]),
        .O(\acc[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[16]_i_1 
       (.I0(\acc_reg[31]_0 [15]),
        .I1(quotient_next1),
        .I2(quotient_next0[15]),
        .O(\acc[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[17]_i_1 
       (.I0(\acc_reg[31]_0 [16]),
        .I1(quotient_next1),
        .I2(quotient_next0[16]),
        .O(\acc[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[18]_i_1 
       (.I0(\acc_reg[31]_0 [17]),
        .I1(quotient_next1),
        .I2(quotient_next0[17]),
        .O(\acc[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[19]_i_1 
       (.I0(\acc_reg[31]_0 [18]),
        .I1(quotient_next1),
        .I2(quotient_next0[18]),
        .O(\acc[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[1]_i_1 
       (.I0(\acc_reg[31]_0 [0]),
        .I1(quotient_next1),
        .I2(quotient_next0[0]),
        .O(\acc[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[20]_i_1 
       (.I0(\acc_reg[31]_0 [19]),
        .I1(quotient_next1),
        .I2(quotient_next0[19]),
        .O(\acc[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[21]_i_1 
       (.I0(\acc_reg[31]_0 [20]),
        .I1(quotient_next1),
        .I2(quotient_next0[20]),
        .O(\acc[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[22]_i_1 
       (.I0(\acc_reg[31]_0 [21]),
        .I1(quotient_next1),
        .I2(quotient_next0[21]),
        .O(\acc[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[23]_i_1 
       (.I0(\acc_reg[31]_0 [22]),
        .I1(quotient_next1),
        .I2(quotient_next0[22]),
        .O(\acc[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[24]_i_1 
       (.I0(\acc_reg[31]_0 [23]),
        .I1(quotient_next1),
        .I2(quotient_next0[23]),
        .O(\acc[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[25]_i_1 
       (.I0(\acc_reg[31]_0 [24]),
        .I1(quotient_next1),
        .I2(quotient_next0[24]),
        .O(\acc[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[26]_i_1 
       (.I0(\acc_reg[31]_0 [25]),
        .I1(quotient_next1),
        .I2(quotient_next0[25]),
        .O(\acc[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[27]_i_1 
       (.I0(\acc_reg[31]_0 [26]),
        .I1(quotient_next1),
        .I2(quotient_next0[26]),
        .O(\acc[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[28]_i_1 
       (.I0(\acc_reg[31]_0 [27]),
        .I1(quotient_next1),
        .I2(quotient_next0[27]),
        .O(\acc[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[29]_i_1 
       (.I0(\acc_reg[31]_0 [28]),
        .I1(quotient_next1),
        .I2(quotient_next0[28]),
        .O(\acc[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[2]_i_1 
       (.I0(\acc_reg[31]_0 [1]),
        .I1(quotient_next1),
        .I2(quotient_next0[1]),
        .O(\acc[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[30]_i_1 
       (.I0(\acc_reg[31]_0 [29]),
        .I1(quotient_next1),
        .I2(quotient_next0[29]),
        .O(\acc[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[31]_i_1 
       (.I0(\acc_reg[31]_0 [30]),
        .I1(quotient_next1),
        .I2(quotient_next0[30]),
        .O(\acc[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[32]_i_2 
       (.I0(\acc_reg[31]_0 [31]),
        .I1(quotient_next1),
        .I2(quotient_next0[31]),
        .O(\acc[32]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[3]_i_1 
       (.I0(\acc_reg[31]_0 [2]),
        .I1(quotient_next1),
        .I2(quotient_next0[2]),
        .O(\acc[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[4]_i_1 
       (.I0(\acc_reg[31]_0 [3]),
        .I1(quotient_next1),
        .I2(quotient_next0[3]),
        .O(\acc[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[5]_i_1 
       (.I0(\acc_reg[31]_0 [4]),
        .I1(quotient_next1),
        .I2(quotient_next0[4]),
        .O(\acc[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[6]_i_1 
       (.I0(\acc_reg[31]_0 [5]),
        .I1(quotient_next1),
        .I2(quotient_next0[5]),
        .O(\acc[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[7]_i_1 
       (.I0(\acc_reg[31]_0 [6]),
        .I1(quotient_next1),
        .I2(quotient_next0[6]),
        .O(\acc[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[8]_i_1 
       (.I0(\acc_reg[31]_0 [7]),
        .I1(quotient_next1),
        .I2(quotient_next0[7]),
        .O(\acc[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \acc[9]_i_1 
       (.I0(\acc_reg[31]_0 [8]),
        .I1(quotient_next1),
        .I2(quotient_next0[8]),
        .O(\acc[9]_i_1_n_0 ));
  FDRE \acc_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[0]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [0]),
        .R(SR[0]));
  FDRE \acc_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[10]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [10]),
        .R(SR[1]));
  FDRE \acc_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[11]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [11]),
        .R(SR[1]));
  FDRE \acc_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[12]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [12]),
        .R(SR[1]));
  FDRE \acc_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[13]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [13]),
        .R(SR[1]));
  FDRE \acc_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[14]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [14]),
        .R(SR[1]));
  FDRE \acc_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[15]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [15]),
        .R(SR[1]));
  FDRE \acc_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[16]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [16]),
        .R(SR[1]));
  FDRE \acc_reg[17] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[17]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [17]),
        .R(SR[1]));
  FDRE \acc_reg[18] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[18]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [18]),
        .R(SR[1]));
  FDRE \acc_reg[19] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[19]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [19]),
        .R(SR[1]));
  FDRE \acc_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[1]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [1]),
        .R(SR[1]));
  FDRE \acc_reg[20] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[20]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [20]),
        .R(SR[1]));
  FDRE \acc_reg[21] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[21]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [21]),
        .R(SR[1]));
  FDRE \acc_reg[22] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[22]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [22]),
        .R(SR[1]));
  FDRE \acc_reg[23] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[23]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [23]),
        .R(SR[1]));
  FDRE \acc_reg[24] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[24]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [24]),
        .R(SR[1]));
  FDRE \acc_reg[25] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[25]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [25]),
        .R(SR[1]));
  FDRE \acc_reg[26] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[26]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [26]),
        .R(SR[1]));
  FDRE \acc_reg[27] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[27]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [27]),
        .R(SR[1]));
  FDRE \acc_reg[28] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[28]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [28]),
        .R(SR[1]));
  FDRE \acc_reg[29] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[29]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [29]),
        .R(SR[1]));
  FDRE \acc_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[2]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [2]),
        .R(SR[1]));
  FDRE \acc_reg[30] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[30]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [30]),
        .R(SR[1]));
  FDRE \acc_reg[31] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[31]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [31]),
        .R(SR[1]));
  FDRE \acc_reg[32] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[32]_i_2_n_0 ),
        .Q(\acc_reg_n_0_[32] ),
        .R(SR[1]));
  FDRE \acc_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[3]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [3]),
        .R(SR[1]));
  FDRE \acc_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[4]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [4]),
        .R(SR[1]));
  FDRE \acc_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[5]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [5]),
        .R(SR[1]));
  FDRE \acc_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[6]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [6]),
        .R(SR[1]));
  FDRE \acc_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[7]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [7]),
        .R(SR[1]));
  FDRE \acc_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[8]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [8]),
        .R(SR[1]));
  FDRE \acc_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\acc[9]_i_1_n_0 ),
        .Q(\acc_reg[31]_0 [9]),
        .R(SR[1]));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done0),
        .Q(div_done),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry__0_i_2
       (.I0(Q[29]),
        .I1(D[28]),
        .I2(Q[28]),
        .I3(D[27]),
        .O(i__carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry__0_i_3
       (.I0(Q[27]),
        .I1(D[26]),
        .I2(Q[26]),
        .I3(D[25]),
        .O(i__carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry__0_i_4
       (.I0(Q[25]),
        .I1(D[24]),
        .I2(Q[24]),
        .I3(D[23]),
        .O(i__carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry__0_i_5
       (.I0(Q[23]),
        .I1(D[22]),
        .I2(Q[22]),
        .I3(D[21]),
        .O(i__carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry__0_i_6
       (.I0(Q[21]),
        .I1(D[20]),
        .I2(Q[20]),
        .I3(quotient_next1_carry__0_1),
        .O(i__carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry__0_i_7
       (.I0(Q[19]),
        .I1(D[19]),
        .I2(Q[18]),
        .I3(D[18]),
        .O(i__carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry__0_i_8
       (.I0(Q[17]),
        .I1(D[17]),
        .I2(Q[16]),
        .I3(D[16]),
        .O(i__carry__0_i_8_n_0));
  LUT5 #(
    .INIT(32'hB222B2B2)) 
    i__carry_i_8
       (.I0(Q[1]),
        .I1(D[1]),
        .I2(Q[0]),
        .I3(\quotient_reg[31]_0 ),
        .I4(D[0]),
        .O(i__carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \idx[0]_i_1 
       (.I0(idx_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \idx[1]_i_1 
       (.I0(idx_reg[0]),
        .I1(idx_reg[1]),
        .O(p_0_in[1]));
  LUT3 #(
    .INIT(8'h6A)) 
    \idx[2]_i_1 
       (.I0(idx_reg[2]),
        .I1(idx_reg[1]),
        .I2(idx_reg[0]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \idx[3]_i_1 
       (.I0(idx_reg[3]),
        .I1(idx_reg[0]),
        .I2(idx_reg[1]),
        .I3(idx_reg[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \idx[4]_i_1 
       (.I0(idx_reg[4]),
        .I1(idx_reg[2]),
        .I2(idx_reg[1]),
        .I3(idx_reg[0]),
        .I4(idx_reg[3]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \idx[5]_i_2 
       (.I0(idx_reg[5]),
        .I1(idx_reg[3]),
        .I2(idx_reg[0]),
        .I3(idx_reg[1]),
        .I4(idx_reg[2]),
        .I5(idx_reg[4]),
        .O(p_0_in[5]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in[0]),
        .Q(idx_reg[0]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in[1]),
        .Q(idx_reg[1]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in[2]),
        .Q(idx_reg[2]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in[3]),
        .Q(idx_reg[3]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in[4]),
        .Q(idx_reg[4]),
        .R(running_reg_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .IS_R_INVERTED(1'b1)) 
    \idx_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(p_0_in[5]),
        .Q(idx_reg[5]),
        .R(running_reg_0));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[10]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[10]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[10]),
        .O(out_quot_write_data[9]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[11]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[11]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[11]),
        .O(out_quot_write_data[10]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[12]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[12]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[12]),
        .O(out_quot_write_data[11]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[13]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[13]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[13]),
        .O(out_quot_write_data[12]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[14]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[14]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[14]),
        .O(out_quot_write_data[13]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[15]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[15]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[15]),
        .O(out_quot_write_data[14]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[16]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[16]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[16]),
        .O(out_quot_write_data[15]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_quot_write_data[16]_INST_0_i_1 
       (.CI(\out_quot_write_data[8]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_quot_write_data[16]_INST_0_i_1_n_0 ,\NLW_out_quot_write_data[16]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_quotient0[16:9]),
        .S({\out_quot_write_data[16]_INST_0_i_2_n_0 ,\out_quot_write_data[16]_INST_0_i_3_n_0 ,\out_quot_write_data[16]_INST_0_i_4_n_0 ,\out_quot_write_data[16]_INST_0_i_5_n_0 ,\out_quot_write_data[16]_INST_0_i_6_n_0 ,\out_quot_write_data[16]_INST_0_i_7_n_0 ,\out_quot_write_data[16]_INST_0_i_8_n_0 ,\out_quot_write_data[16]_INST_0_i_9_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_2 
       (.I0(out_quotient[16]),
        .O(\out_quot_write_data[16]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_3 
       (.I0(out_quotient[15]),
        .O(\out_quot_write_data[16]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_4 
       (.I0(out_quotient[14]),
        .O(\out_quot_write_data[16]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_5 
       (.I0(out_quotient[13]),
        .O(\out_quot_write_data[16]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_6 
       (.I0(out_quotient[12]),
        .O(\out_quot_write_data[16]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_7 
       (.I0(out_quotient[11]),
        .O(\out_quot_write_data[16]_INST_0_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_8 
       (.I0(out_quotient[10]),
        .O(\out_quot_write_data[16]_INST_0_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[16]_INST_0_i_9 
       (.I0(out_quotient[9]),
        .O(\out_quot_write_data[16]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[17]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[17]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[17]),
        .O(out_quot_write_data[16]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[18]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[18]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[18]),
        .O(out_quot_write_data[17]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[19]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[19]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[19]),
        .O(out_quot_write_data[18]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[1]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[1]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[1]),
        .O(out_quot_write_data[0]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[20]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[20]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[20]),
        .O(out_quot_write_data[19]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[21]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[21]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[21]),
        .O(out_quot_write_data[20]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[22]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[22]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[22]),
        .O(out_quot_write_data[21]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[23]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[23]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[23]),
        .O(out_quot_write_data[22]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[24]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[24]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[24]),
        .O(out_quot_write_data[23]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_quot_write_data[24]_INST_0_i_1 
       (.CI(\out_quot_write_data[16]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_quot_write_data[24]_INST_0_i_1_n_0 ,\NLW_out_quot_write_data[24]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_quotient0[24:17]),
        .S({\out_quot_write_data[24]_INST_0_i_2_n_0 ,\out_quot_write_data[24]_INST_0_i_3_n_0 ,\out_quot_write_data[24]_INST_0_i_4_n_0 ,\out_quot_write_data[24]_INST_0_i_5_n_0 ,\out_quot_write_data[24]_INST_0_i_6_n_0 ,\out_quot_write_data[24]_INST_0_i_7_n_0 ,\out_quot_write_data[24]_INST_0_i_8_n_0 ,\out_quot_write_data[24]_INST_0_i_9_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_2 
       (.I0(out_quotient[24]),
        .O(\out_quot_write_data[24]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_3 
       (.I0(out_quotient[23]),
        .O(\out_quot_write_data[24]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_4 
       (.I0(out_quotient[22]),
        .O(\out_quot_write_data[24]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_5 
       (.I0(out_quotient[21]),
        .O(\out_quot_write_data[24]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_6 
       (.I0(out_quotient[20]),
        .O(\out_quot_write_data[24]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_7 
       (.I0(out_quotient[19]),
        .O(\out_quot_write_data[24]_INST_0_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_8 
       (.I0(out_quotient[18]),
        .O(\out_quot_write_data[24]_INST_0_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[24]_INST_0_i_9 
       (.I0(out_quotient[17]),
        .O(\out_quot_write_data[24]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[25]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[25]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[25]),
        .O(out_quot_write_data[24]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[26]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[26]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[26]),
        .O(out_quot_write_data[25]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[27]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[27]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[27]),
        .O(out_quot_write_data[26]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[28]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[28]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[28]),
        .O(out_quot_write_data[27]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[29]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[29]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[29]),
        .O(out_quot_write_data[28]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[2]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[2]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[2]),
        .O(out_quot_write_data[1]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[30]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[30]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[30]),
        .O(out_quot_write_data[29]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[31]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[31]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[31]),
        .O(out_quot_write_data[30]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "RETARGET SWEEP" *) 
  CARRY8 \out_quot_write_data[31]_INST_0_i_1 
       (.CI(\out_quot_write_data[24]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_quotient0[31:25]),
        .S({\out_quot_write_data[31]_INST_0_i_2_n_0 ,\out_quot_write_data[31]_INST_0_i_3_n_0 ,\out_quot_write_data[31]_INST_0_i_4_n_0 ,\out_quot_write_data[31]_INST_0_i_5_n_0 ,\out_quot_write_data[31]_INST_0_i_6_n_0 ,\out_quot_write_data[31]_INST_0_i_7_n_0 ,\out_quot_write_data[31]_INST_0_i_8_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[31]_INST_0_i_2 
       (.I0(out_quotient[31]),
        .O(\out_quot_write_data[31]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[31]_INST_0_i_3 
       (.I0(out_quotient[30]),
        .O(\out_quot_write_data[31]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[31]_INST_0_i_4 
       (.I0(out_quotient[29]),
        .O(\out_quot_write_data[31]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[31]_INST_0_i_5 
       (.I0(out_quotient[28]),
        .O(\out_quot_write_data[31]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[31]_INST_0_i_6 
       (.I0(out_quotient[27]),
        .O(\out_quot_write_data[31]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[31]_INST_0_i_7 
       (.I0(out_quotient[26]),
        .O(\out_quot_write_data[31]_INST_0_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[31]_INST_0_i_8 
       (.I0(out_quotient[25]),
        .O(\out_quot_write_data[31]_INST_0_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[3]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[3]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[3]),
        .O(out_quot_write_data[2]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[4]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[4]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[4]),
        .O(out_quot_write_data[3]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[5]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[5]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[5]),
        .O(out_quot_write_data[4]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[6]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[6]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[6]),
        .O(out_quot_write_data[5]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[7]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[7]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[7]),
        .O(out_quot_write_data[6]));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[8]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[8]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[8]),
        .O(out_quot_write_data[7]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_quot_write_data[8]_INST_0_i_1 
       (.CI(\out_quot_write_data[8]_INST_0_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_quot_write_data[8]_INST_0_i_1_n_0 ,\NLW_out_quot_write_data[8]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_quotient0[8:1]),
        .S({\out_quot_write_data[8]_INST_0_i_3_n_0 ,\out_quot_write_data[8]_INST_0_i_4_n_0 ,\out_quot_write_data[8]_INST_0_i_5_n_0 ,\out_quot_write_data[8]_INST_0_i_6_n_0 ,\out_quot_write_data[8]_INST_0_i_7_n_0 ,\out_quot_write_data[8]_INST_0_i_8_n_0 ,\out_quot_write_data[8]_INST_0_i_9_n_0 ,\out_quot_write_data[8]_INST_0_i_10_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_10 
       (.I0(out_quotient[1]),
        .O(\out_quot_write_data[8]_INST_0_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_2 
       (.I0(\out_quotient_reg[0]_0 ),
        .O(\out_quot_write_data[8]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_3 
       (.I0(out_quotient[8]),
        .O(\out_quot_write_data[8]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_4 
       (.I0(out_quotient[7]),
        .O(\out_quot_write_data[8]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_5 
       (.I0(out_quotient[6]),
        .O(\out_quot_write_data[8]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_6 
       (.I0(out_quotient[5]),
        .O(\out_quot_write_data[8]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_7 
       (.I0(out_quotient[4]),
        .O(\out_quot_write_data[8]_INST_0_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_8 
       (.I0(out_quotient[3]),
        .O(\out_quot_write_data[8]_INST_0_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \out_quot_write_data[8]_INST_0_i_9 
       (.I0(out_quotient[2]),
        .O(\out_quot_write_data[8]_INST_0_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h8AA88008)) 
    \out_quot_write_data[9]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_quotient[9]),
        .I2(right_sign),
        .I3(left_sign),
        .I4(out_quotient0[9]),
        .O(out_quot_write_data[8]));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \out_quotient[31]_i_1 
       (.I0(idx_reg[5]),
        .I1(idx_reg[4]),
        .I2(running_reg_0),
        .I3(idx_reg[3]),
        .I4(\out_quotient[31]_i_2_n_0 ),
        .I5(\quotient_reg[31]_0 ),
        .O(\out_quotient[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \out_quotient[31]_i_2 
       (.I0(idx_reg[2]),
        .I1(idx_reg[1]),
        .I2(idx_reg[0]),
        .O(\out_quotient[31]_i_2_n_0 ));
  FDRE \out_quotient_reg[0] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next1),
        .Q(\out_quotient_reg[0]_0 ),
        .R(SR[1]));
  FDRE \out_quotient_reg[10] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[10]),
        .Q(out_quotient[10]),
        .R(SR[1]));
  FDRE \out_quotient_reg[11] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[11]),
        .Q(out_quotient[11]),
        .R(SR[1]));
  FDRE \out_quotient_reg[12] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[12]),
        .Q(out_quotient[12]),
        .R(SR[1]));
  FDRE \out_quotient_reg[13] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[13]),
        .Q(out_quotient[13]),
        .R(SR[1]));
  FDRE \out_quotient_reg[14] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[14]),
        .Q(out_quotient[14]),
        .R(SR[1]));
  FDRE \out_quotient_reg[15] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[15]),
        .Q(out_quotient[15]),
        .R(SR[1]));
  FDRE \out_quotient_reg[16] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[16]),
        .Q(out_quotient[16]),
        .R(SR[1]));
  FDRE \out_quotient_reg[17] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[17]),
        .Q(out_quotient[17]),
        .R(SR[1]));
  FDRE \out_quotient_reg[18] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[18]),
        .Q(out_quotient[18]),
        .R(SR[1]));
  FDRE \out_quotient_reg[19] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[19]),
        .Q(out_quotient[19]),
        .R(SR[1]));
  FDRE \out_quotient_reg[1] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[1]),
        .Q(out_quotient[1]),
        .R(SR[1]));
  FDRE \out_quotient_reg[20] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[20]),
        .Q(out_quotient[20]),
        .R(SR[1]));
  FDRE \out_quotient_reg[21] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[21]),
        .Q(out_quotient[21]),
        .R(SR[1]));
  FDRE \out_quotient_reg[22] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[22]),
        .Q(out_quotient[22]),
        .R(SR[1]));
  FDRE \out_quotient_reg[23] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[23]),
        .Q(out_quotient[23]),
        .R(SR[1]));
  FDRE \out_quotient_reg[24] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[24]),
        .Q(out_quotient[24]),
        .R(SR[1]));
  FDRE \out_quotient_reg[25] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[25]),
        .Q(out_quotient[25]),
        .R(SR[1]));
  FDRE \out_quotient_reg[26] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[26]),
        .Q(out_quotient[26]),
        .R(SR[1]));
  FDRE \out_quotient_reg[27] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[27]),
        .Q(out_quotient[27]),
        .R(SR[1]));
  FDRE \out_quotient_reg[28] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[28]),
        .Q(out_quotient[28]),
        .R(SR[1]));
  FDRE \out_quotient_reg[29] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[29]),
        .Q(out_quotient[29]),
        .R(SR[1]));
  FDRE \out_quotient_reg[2] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[2]),
        .Q(out_quotient[2]),
        .R(SR[1]));
  FDRE \out_quotient_reg[30] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[30]),
        .Q(out_quotient[30]),
        .R(SR[1]));
  FDRE \out_quotient_reg[31] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[31]),
        .Q(out_quotient[31]),
        .R(SR[1]));
  FDRE \out_quotient_reg[3] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[3]),
        .Q(out_quotient[3]),
        .R(SR[1]));
  FDRE \out_quotient_reg[4] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[4]),
        .Q(out_quotient[4]),
        .R(SR[1]));
  FDRE \out_quotient_reg[5] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[5]),
        .Q(out_quotient[5]),
        .R(SR[1]));
  FDRE \out_quotient_reg[6] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[6]),
        .Q(out_quotient[6]),
        .R(SR[1]));
  FDRE \out_quotient_reg[7] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[7]),
        .Q(out_quotient[7]),
        .R(SR[1]));
  FDRE \out_quotient_reg[8] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[8]),
        .Q(out_quotient[8]),
        .R(SR[1]));
  FDRE \out_quotient_reg[9] 
       (.C(clk),
        .CE(\out_quotient[31]_i_1_n_0 ),
        .D(quotient_next[9]),
        .Q(out_quotient[9]),
        .R(SR[1]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_1
       (.I0(out_rem_intermediate0_carry__2[15]),
        .I1(Q[15]),
        .O(\right_save_reg[15] [7]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_2
       (.I0(out_rem_intermediate0_carry__2[14]),
        .I1(Q[14]),
        .O(\right_save_reg[15] [6]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_3
       (.I0(out_rem_intermediate0_carry__2[13]),
        .I1(Q[13]),
        .O(\right_save_reg[15] [5]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_4
       (.I0(out_rem_intermediate0_carry__2[12]),
        .I1(Q[12]),
        .O(\right_save_reg[15] [4]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_5
       (.I0(out_rem_intermediate0_carry__2[11]),
        .I1(Q[11]),
        .O(\right_save_reg[15] [3]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_6
       (.I0(out_rem_intermediate0_carry__2[10]),
        .I1(Q[10]),
        .O(\right_save_reg[15] [2]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_7
       (.I0(out_rem_intermediate0_carry__2[9]),
        .I1(Q[9]),
        .O(\right_save_reg[15] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__0_i_8
       (.I0(out_rem_intermediate0_carry__2[8]),
        .I1(Q[8]),
        .O(\right_save_reg[15] [0]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_1
       (.I0(out_rem_intermediate0_carry__2[23]),
        .I1(Q[23]),
        .O(\right_save_reg[23] [7]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_2
       (.I0(out_rem_intermediate0_carry__2[22]),
        .I1(Q[22]),
        .O(\right_save_reg[23] [6]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_3
       (.I0(out_rem_intermediate0_carry__2[21]),
        .I1(Q[21]),
        .O(\right_save_reg[23] [5]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_4
       (.I0(out_rem_intermediate0_carry__2[20]),
        .I1(Q[20]),
        .O(\right_save_reg[23] [4]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_5
       (.I0(out_rem_intermediate0_carry__2[19]),
        .I1(Q[19]),
        .O(\right_save_reg[23] [3]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_6
       (.I0(out_rem_intermediate0_carry__2[18]),
        .I1(Q[18]),
        .O(\right_save_reg[23] [2]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_7
       (.I0(out_rem_intermediate0_carry__2[17]),
        .I1(Q[17]),
        .O(\right_save_reg[23] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__1_i_8
       (.I0(out_rem_intermediate0_carry__2[16]),
        .I1(Q[16]),
        .O(\right_save_reg[23] [0]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_1
       (.I0(Q[31]),
        .I1(out_rem_intermediate0_carry__2[31]),
        .O(\out_remainder_reg[31]_0 [7]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_2
       (.I0(out_rem_intermediate0_carry__2[30]),
        .I1(Q[30]),
        .O(\out_remainder_reg[31]_0 [6]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_3
       (.I0(out_rem_intermediate0_carry__2[29]),
        .I1(Q[29]),
        .O(\out_remainder_reg[31]_0 [5]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_4
       (.I0(out_rem_intermediate0_carry__2[28]),
        .I1(Q[28]),
        .O(\out_remainder_reg[31]_0 [4]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_5
       (.I0(out_rem_intermediate0_carry__2[27]),
        .I1(Q[27]),
        .O(\out_remainder_reg[31]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_6
       (.I0(out_rem_intermediate0_carry__2[26]),
        .I1(Q[26]),
        .O(\out_remainder_reg[31]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_7
       (.I0(out_rem_intermediate0_carry__2[25]),
        .I1(Q[25]),
        .O(\out_remainder_reg[31]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry__2_i_8
       (.I0(out_rem_intermediate0_carry__2[24]),
        .I1(Q[24]),
        .O(\out_remainder_reg[31]_0 [0]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_1
       (.I0(out_rem_intermediate0_carry__2[7]),
        .I1(Q[7]),
        .O(\right_save_reg[7] [7]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_2
       (.I0(out_rem_intermediate0_carry__2[6]),
        .I1(Q[6]),
        .O(\right_save_reg[7] [6]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_3
       (.I0(out_rem_intermediate0_carry__2[5]),
        .I1(Q[5]),
        .O(\right_save_reg[7] [5]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_4
       (.I0(out_rem_intermediate0_carry__2[4]),
        .I1(Q[4]),
        .O(\right_save_reg[7] [4]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_5
       (.I0(out_rem_intermediate0_carry__2[3]),
        .I1(Q[3]),
        .O(\right_save_reg[7] [3]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_6
       (.I0(out_rem_intermediate0_carry__2[2]),
        .I1(Q[2]),
        .O(\right_save_reg[7] [2]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_7
       (.I0(out_rem_intermediate0_carry__2[1]),
        .I1(Q[1]),
        .O(\right_save_reg[7] [1]));
  LUT2 #(
    .INIT(4'h9)) 
    out_rem_intermediate0_carry_i_8
       (.I0(out_rem_intermediate0_carry__2[0]),
        .I1(Q[0]),
        .O(\right_save_reg[7] [0]));
  LUT4 #(
    .INIT(16'hA808)) 
    \out_rem_write_data[0]_INST_0 
       (.I0(out_quot_write_data_1_sn_1),
        .I1(out_rem_intermediate0[0]),
        .I2(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I3(Q[0]),
        .O(out_rem_write_data[0]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[10]_INST_0 
       (.I0(out_rem_intermediate0[10]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[10]),
        .I3(right_sign),
        .I4(out_remainder0[10]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[10]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[11]_INST_0 
       (.I0(out_rem_intermediate0[11]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[11]),
        .I3(right_sign),
        .I4(out_remainder0[11]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[11]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[12]_INST_0 
       (.I0(out_rem_intermediate0[12]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[12]),
        .I3(right_sign),
        .I4(out_remainder0[12]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[12]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[13]_INST_0 
       (.I0(out_rem_intermediate0[13]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[13]),
        .I3(right_sign),
        .I4(out_remainder0[13]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[13]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[14]_INST_0 
       (.I0(out_rem_intermediate0[14]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[14]),
        .I3(right_sign),
        .I4(out_remainder0[14]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[14]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[15]_INST_0 
       (.I0(out_rem_intermediate0[15]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[15]),
        .I3(right_sign),
        .I4(out_remainder0[15]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[15]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[16]_INST_0 
       (.I0(out_rem_intermediate0[16]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[16]),
        .I3(right_sign),
        .I4(out_remainder0[16]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[16]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_rem_write_data[16]_INST_0_i_1 
       (.CI(\out_rem_write_data[8]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_rem_write_data[16]_INST_0_i_1_n_0 ,\NLW_out_rem_write_data[16]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_remainder0[16:9]),
        .S({\out_rem_write_data[16]_INST_0_i_2_n_0 ,\out_rem_write_data[16]_INST_0_i_3_n_0 ,\out_rem_write_data[16]_INST_0_i_4_n_0 ,\out_rem_write_data[16]_INST_0_i_5_n_0 ,\out_rem_write_data[16]_INST_0_i_6_n_0 ,\out_rem_write_data[16]_INST_0_i_7_n_0 ,\out_rem_write_data[16]_INST_0_i_8_n_0 ,\out_rem_write_data[16]_INST_0_i_9_n_0 }));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_2 
       (.I0(out_rem_intermediate0[16]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[16]),
        .O(\out_rem_write_data[16]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_3 
       (.I0(out_rem_intermediate0[15]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[15]),
        .O(\out_rem_write_data[16]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_4 
       (.I0(out_rem_intermediate0[14]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[14]),
        .O(\out_rem_write_data[16]_INST_0_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_5 
       (.I0(out_rem_intermediate0[13]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[13]),
        .O(\out_rem_write_data[16]_INST_0_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_6 
       (.I0(out_rem_intermediate0[12]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[12]),
        .O(\out_rem_write_data[16]_INST_0_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_7 
       (.I0(out_rem_intermediate0[11]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[11]),
        .O(\out_rem_write_data[16]_INST_0_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_8 
       (.I0(out_rem_intermediate0[10]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[10]),
        .O(\out_rem_write_data[16]_INST_0_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[16]_INST_0_i_9 
       (.I0(out_rem_intermediate0[9]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[9]),
        .O(\out_rem_write_data[16]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[17]_INST_0 
       (.I0(out_rem_intermediate0[17]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[17]),
        .I3(right_sign),
        .I4(out_remainder0[17]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[17]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[18]_INST_0 
       (.I0(out_rem_intermediate0[18]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[18]),
        .I3(right_sign),
        .I4(out_remainder0[18]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[18]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[19]_INST_0 
       (.I0(out_rem_intermediate0[19]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[19]),
        .I3(right_sign),
        .I4(out_remainder0[19]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[19]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[1]_INST_0 
       (.I0(out_rem_intermediate0[1]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[1]),
        .I3(right_sign),
        .I4(out_remainder0[1]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[1]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[20]_INST_0 
       (.I0(out_rem_intermediate0[20]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[20]),
        .I3(right_sign),
        .I4(out_remainder0[20]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[20]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[21]_INST_0 
       (.I0(out_rem_intermediate0[21]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[21]),
        .I3(right_sign),
        .I4(out_remainder0[21]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[21]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[22]_INST_0 
       (.I0(out_rem_intermediate0[22]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[22]),
        .I3(right_sign),
        .I4(out_remainder0[22]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[22]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[23]_INST_0 
       (.I0(out_rem_intermediate0[23]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[23]),
        .I3(right_sign),
        .I4(out_remainder0[23]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[23]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[24]_INST_0 
       (.I0(out_rem_intermediate0[24]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[24]),
        .I3(right_sign),
        .I4(out_remainder0[24]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[24]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_rem_write_data[24]_INST_0_i_1 
       (.CI(\out_rem_write_data[16]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_rem_write_data[24]_INST_0_i_1_n_0 ,\NLW_out_rem_write_data[24]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_remainder0[24:17]),
        .S({\out_rem_write_data[24]_INST_0_i_2_n_0 ,\out_rem_write_data[24]_INST_0_i_3_n_0 ,\out_rem_write_data[24]_INST_0_i_4_n_0 ,\out_rem_write_data[24]_INST_0_i_5_n_0 ,\out_rem_write_data[24]_INST_0_i_6_n_0 ,\out_rem_write_data[24]_INST_0_i_7_n_0 ,\out_rem_write_data[24]_INST_0_i_8_n_0 ,\out_rem_write_data[24]_INST_0_i_9_n_0 }));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_2 
       (.I0(out_rem_intermediate0[24]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[24]),
        .O(\out_rem_write_data[24]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_3 
       (.I0(out_rem_intermediate0[23]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[23]),
        .O(\out_rem_write_data[24]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_4 
       (.I0(out_rem_intermediate0[22]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[22]),
        .O(\out_rem_write_data[24]_INST_0_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_5 
       (.I0(out_rem_intermediate0[21]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[21]),
        .O(\out_rem_write_data[24]_INST_0_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_6 
       (.I0(out_rem_intermediate0[20]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[20]),
        .O(\out_rem_write_data[24]_INST_0_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_7 
       (.I0(out_rem_intermediate0[19]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[19]),
        .O(\out_rem_write_data[24]_INST_0_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_8 
       (.I0(out_rem_intermediate0[18]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[18]),
        .O(\out_rem_write_data[24]_INST_0_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[24]_INST_0_i_9 
       (.I0(out_rem_intermediate0[17]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[17]),
        .O(\out_rem_write_data[24]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[25]_INST_0 
       (.I0(out_rem_intermediate0[25]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[25]),
        .I3(right_sign),
        .I4(out_remainder0[25]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[25]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[26]_INST_0 
       (.I0(out_rem_intermediate0[26]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[26]),
        .I3(right_sign),
        .I4(out_remainder0[26]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[26]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[27]_INST_0 
       (.I0(out_rem_intermediate0[27]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[27]),
        .I3(right_sign),
        .I4(out_remainder0[27]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[27]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[28]_INST_0 
       (.I0(out_rem_intermediate0[28]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[28]),
        .I3(right_sign),
        .I4(out_remainder0[28]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[28]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[29]_INST_0 
       (.I0(out_rem_intermediate0[29]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[29]),
        .I3(right_sign),
        .I4(out_remainder0[29]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[29]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[2]_INST_0 
       (.I0(out_rem_intermediate0[2]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[2]),
        .I3(right_sign),
        .I4(out_remainder0[2]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[2]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[30]_INST_0 
       (.I0(out_rem_intermediate0[30]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[30]),
        .I3(right_sign),
        .I4(out_remainder0[30]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[30]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[31]_INST_0 
       (.I0(out_rem_intermediate0[31]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[31]),
        .I3(right_sign),
        .I4(out_remainder0[31]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[31]));
  LUT6 #(
    .INIT(64'h99999999999999F9)) 
    \out_rem_write_data[31]_INST_0_i_1 
       (.I0(right_sign),
        .I1(left_sign),
        .I2(\out_rem_write_data[31]_INST_0_i_3_n_0 ),
        .I3(\out_rem_write_data[31]_INST_0_i_4_n_0 ),
        .I4(\out_rem_write_data[31]_INST_0_i_5_n_0 ),
        .I5(\out_rem_write_data[31]_INST_0_i_6_n_0 ),
        .O(\out_rem_write_data[31]_INST_0_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[31]_INST_0_i_10 
       (.I0(out_rem_intermediate0[28]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[28]),
        .O(\out_rem_write_data[31]_INST_0_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[31]_INST_0_i_11 
       (.I0(out_rem_intermediate0[27]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[27]),
        .O(\out_rem_write_data[31]_INST_0_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[31]_INST_0_i_12 
       (.I0(out_rem_intermediate0[26]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[26]),
        .O(\out_rem_write_data[31]_INST_0_i_12_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[31]_INST_0_i_13 
       (.I0(out_rem_intermediate0[25]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[25]),
        .O(\out_rem_write_data[31]_INST_0_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \out_rem_write_data[31]_INST_0_i_14 
       (.I0(Q[27]),
        .I1(Q[26]),
        .I2(Q[25]),
        .I3(Q[24]),
        .O(\out_rem_write_data[31]_INST_0_i_14_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \out_rem_write_data[31]_INST_0_i_15 
       (.I0(Q[19]),
        .I1(Q[18]),
        .I2(Q[17]),
        .I3(Q[16]),
        .O(\out_rem_write_data[31]_INST_0_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \out_rem_write_data[31]_INST_0_i_16 
       (.I0(Q[11]),
        .I1(Q[10]),
        .I2(Q[9]),
        .I3(Q[8]),
        .O(\out_rem_write_data[31]_INST_0_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \out_rem_write_data[31]_INST_0_i_17 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\out_rem_write_data[31]_INST_0_i_17_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "RETARGET SWEEP" *) 
  CARRY8 \out_rem_write_data[31]_INST_0_i_2 
       (.CI(\out_rem_write_data[24]_INST_0_i_1_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_remainder0[31:25]),
        .S({\out_rem_write_data[31]_INST_0_i_7_n_0 ,\out_rem_write_data[31]_INST_0_i_8_n_0 ,\out_rem_write_data[31]_INST_0_i_9_n_0 ,\out_rem_write_data[31]_INST_0_i_10_n_0 ,\out_rem_write_data[31]_INST_0_i_11_n_0 ,\out_rem_write_data[31]_INST_0_i_12_n_0 ,\out_rem_write_data[31]_INST_0_i_13_n_0 }));
  LUT5 #(
    .INIT(32'h00000001)) 
    \out_rem_write_data[31]_INST_0_i_3 
       (.I0(Q[31]),
        .I1(Q[28]),
        .I2(Q[29]),
        .I3(Q[30]),
        .I4(\out_rem_write_data[31]_INST_0_i_14_n_0 ),
        .O(\out_rem_write_data[31]_INST_0_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out_rem_write_data[31]_INST_0_i_4 
       (.I0(Q[20]),
        .I1(Q[23]),
        .I2(Q[21]),
        .I3(Q[22]),
        .I4(\out_rem_write_data[31]_INST_0_i_15_n_0 ),
        .O(\out_rem_write_data[31]_INST_0_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out_rem_write_data[31]_INST_0_i_5 
       (.I0(Q[12]),
        .I1(Q[15]),
        .I2(Q[13]),
        .I3(Q[14]),
        .I4(\out_rem_write_data[31]_INST_0_i_16_n_0 ),
        .O(\out_rem_write_data[31]_INST_0_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out_rem_write_data[31]_INST_0_i_6 
       (.I0(Q[4]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(Q[6]),
        .I4(\out_rem_write_data[31]_INST_0_i_17_n_0 ),
        .O(\out_rem_write_data[31]_INST_0_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[31]_INST_0_i_7 
       (.I0(out_rem_intermediate0[31]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[31]),
        .O(\out_rem_write_data[31]_INST_0_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[31]_INST_0_i_8 
       (.I0(out_rem_intermediate0[30]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[30]),
        .O(\out_rem_write_data[31]_INST_0_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[31]_INST_0_i_9 
       (.I0(out_rem_intermediate0[29]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[29]),
        .O(\out_rem_write_data[31]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[3]_INST_0 
       (.I0(out_rem_intermediate0[3]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[3]),
        .I3(right_sign),
        .I4(out_remainder0[3]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[3]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[4]_INST_0 
       (.I0(out_rem_intermediate0[4]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[4]),
        .I3(right_sign),
        .I4(out_remainder0[4]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[4]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[5]_INST_0 
       (.I0(out_rem_intermediate0[5]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[5]),
        .I3(right_sign),
        .I4(out_remainder0[5]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[5]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[6]_INST_0 
       (.I0(out_rem_intermediate0[6]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[6]),
        .I3(right_sign),
        .I4(out_remainder0[6]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[6]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[7]_INST_0 
       (.I0(out_rem_intermediate0[7]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[7]),
        .I3(right_sign),
        .I4(out_remainder0[7]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[7]));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[8]_INST_0 
       (.I0(out_rem_intermediate0[8]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[8]),
        .I3(right_sign),
        .I4(out_remainder0[8]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[8]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_rem_write_data[8]_INST_0_i_1 
       (.CI(\out_rem_write_data[8]_INST_0_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_rem_write_data[8]_INST_0_i_1_n_0 ,\NLW_out_rem_write_data[8]_INST_0_i_1_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(out_remainder0[8:1]),
        .S({\out_rem_write_data[8]_INST_0_i_3_n_0 ,\out_rem_write_data[8]_INST_0_i_4_n_0 ,\out_rem_write_data[8]_INST_0_i_5_n_0 ,\out_rem_write_data[8]_INST_0_i_6_n_0 ,\out_rem_write_data[8]_INST_0_i_7_n_0 ,\out_rem_write_data[8]_INST_0_i_8_n_0 ,\out_rem_write_data[8]_INST_0_i_9_n_0 ,\out_rem_write_data[8]_INST_0_i_10_n_0 }));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_10 
       (.I0(out_rem_intermediate0[1]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[1]),
        .O(\out_rem_write_data[8]_INST_0_i_10_n_0 ));
  LUT3 #(
    .INIT(8'h47)) 
    \out_rem_write_data[8]_INST_0_i_2 
       (.I0(Q[0]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(out_rem_intermediate0[0]),
        .O(\out_rem_write_data[8]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_3 
       (.I0(out_rem_intermediate0[8]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[8]),
        .O(\out_rem_write_data[8]_INST_0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_4 
       (.I0(out_rem_intermediate0[7]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[7]),
        .O(\out_rem_write_data[8]_INST_0_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_5 
       (.I0(out_rem_intermediate0[6]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[6]),
        .O(\out_rem_write_data[8]_INST_0_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_6 
       (.I0(out_rem_intermediate0[5]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[5]),
        .O(\out_rem_write_data[8]_INST_0_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_7 
       (.I0(out_rem_intermediate0[4]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[4]),
        .O(\out_rem_write_data[8]_INST_0_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_8 
       (.I0(out_rem_intermediate0[3]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[3]),
        .O(\out_rem_write_data[8]_INST_0_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h1D)) 
    \out_rem_write_data[8]_INST_0_i_9 
       (.I0(out_rem_intermediate0[2]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[2]),
        .O(\out_rem_write_data[8]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFE200E200000000)) 
    \out_rem_write_data[9]_INST_0 
       (.I0(out_rem_intermediate0[9]),
        .I1(\out_rem_write_data[31]_INST_0_i_1_n_0 ),
        .I2(Q[9]),
        .I3(right_sign),
        .I4(out_remainder0[9]),
        .I5(out_quot_write_data_1_sn_1),
        .O(out_rem_write_data[9]));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_remainder0_carry
       (.CI(\<const1> ),
        .CI_TOP(GND_2),
        .CO({out_remainder0_carry_n_0,NLW_out_remainder0_carry_CO_UNCONNECTED[6:0]}),
        .DI(Q[7:0]),
        .O({out_remainder0_carry_n_8,out_remainder0_carry_n_9,out_remainder0_carry_n_10,out_remainder0_carry_n_11,out_remainder0_carry_n_12,out_remainder0_carry_n_13,out_remainder0_carry_n_14,out_remainder0_carry_n_15}),
        .S({\out_remainder_reg[7]_0 ,out_remainder0_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_remainder0_carry__0
       (.CI(out_remainder0_carry_n_0),
        .CI_TOP(GND_2),
        .CO({out_remainder0_carry__0_n_0,NLW_out_remainder0_carry__0_CO_UNCONNECTED[6:0]}),
        .DI(Q[15:8]),
        .O({out_remainder0_carry__0_n_8,out_remainder0_carry__0_n_9,out_remainder0_carry__0_n_10,out_remainder0_carry__0_n_11,out_remainder0_carry__0_n_12,out_remainder0_carry__0_n_13,out_remainder0_carry__0_n_14,out_remainder0_carry__0_n_15}),
        .S(\out_remainder_reg[15]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_remainder0_carry__1
       (.CI(out_remainder0_carry__0_n_0),
        .CI_TOP(GND_2),
        .CO({out_remainder0_carry__1_n_0,NLW_out_remainder0_carry__1_CO_UNCONNECTED[6:0]}),
        .DI(Q[23:16]),
        .O({out_remainder0_carry__1_n_8,out_remainder0_carry__1_n_9,out_remainder0_carry__1_n_10,out_remainder0_carry__1_n_11,out_remainder0_carry__1_n_12,out_remainder0_carry__1_n_13,out_remainder0_carry__1_n_14,out_remainder0_carry__1_n_15}),
        .S(\out_remainder_reg[23]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_remainder0_carry__2
       (.CI(out_remainder0_carry__1_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,Q[30:24]}),
        .O({out_remainder0_carry__2_n_8,out_remainder0_carry__2_n_9,out_remainder0_carry__2_n_10,out_remainder0_carry__2_n_11,out_remainder0_carry__2_n_12,out_remainder0_carry__2_n_13,out_remainder0_carry__2_n_14,out_remainder0_carry__2_n_15}),
        .S({out_remainder0_carry__2_i_1_n_0,\out_remainder_reg[31]_1 }));
  LUT4 #(
    .INIT(16'h5955)) 
    out_remainder0_carry__2_i_1
       (.I0(Q[31]),
        .I1(quotient_next0_carry__2_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(right_abs0),
        .O(out_remainder0_carry__2_i_1_n_0));
  LUT3 #(
    .INIT(8'h65)) 
    out_remainder0_carry_i_8
       (.I0(Q[0]),
        .I1(\quotient_reg[31]_0 ),
        .I2(D[0]),
        .O(out_remainder0_carry_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_remainder0_inferred__0/i__carry 
       (.CI(\<const1> ),
        .CI_TOP(GND_2),
        .CO({\out_remainder0_inferred__0/i__carry_n_0 ,\NLW_out_remainder0_inferred__0/i__carry_CO_UNCONNECTED [6:0]}),
        .DI({\out_remainder0_inferred__0/i__carry__0_0 ,i__carry_i_8_n_0}),
        .S(\out_remainder0_inferred__0/i__carry__0_1 ));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_remainder0_inferred__0/i__carry__0 
       (.CI(\out_remainder0_inferred__0/i__carry_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_remainder0_inferred__0/i__carry__0_n_0 ,\NLW_out_remainder0_inferred__0/i__carry__0_CO_UNCONNECTED [6:0]}),
        .DI({DI,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0,i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0,i__carry__0_i_8_n_0}),
        .S(S));
  LUT3 #(
    .INIT(8'hB8)) 
    \out_remainder[0]_i_1 
       (.I0(out_remainder0_carry_n_15),
        .I1(\out_remainder_reg[0]_0 ),
        .I2(\out_remainder_reg[1]_0 [0]),
        .O(p_1_in[0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[10]_i_1 
       (.I0(out_remainder0_carry__0_n_13),
        .I1(running_reg_0),
        .I2(left_abs0[9]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [10]),
        .O(p_1_in[10]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[11]_i_1 
       (.I0(out_remainder0_carry__0_n_12),
        .I1(running_reg_0),
        .I2(left_abs0[10]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [11]),
        .O(p_1_in[11]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[12]_i_1 
       (.I0(out_remainder0_carry__0_n_11),
        .I1(running_reg_0),
        .I2(left_abs0[11]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [12]),
        .O(p_1_in[12]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[13]_i_1 
       (.I0(out_remainder0_carry__0_n_10),
        .I1(running_reg_0),
        .I2(left_abs0[12]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [13]),
        .O(p_1_in[13]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[14]_i_1 
       (.I0(out_remainder0_carry__0_n_9),
        .I1(running_reg_0),
        .I2(left_abs0[13]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [14]),
        .O(p_1_in[14]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[15]_i_1 
       (.I0(out_remainder0_carry__0_n_8),
        .I1(running_reg_0),
        .I2(left_abs0[14]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [15]),
        .O(p_1_in[15]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[16]_i_1 
       (.I0(out_remainder0_carry__1_n_15),
        .I1(running_reg_0),
        .I2(left_abs0[15]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [16]),
        .O(p_1_in[16]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[17]_i_1 
       (.I0(out_remainder0_carry__1_n_14),
        .I1(running_reg_0),
        .I2(left_abs0[16]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [17]),
        .O(p_1_in[17]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[18]_i_1 
       (.I0(out_remainder0_carry__1_n_13),
        .I1(running_reg_0),
        .I2(left_abs0[17]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [18]),
        .O(p_1_in[18]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[19]_i_1 
       (.I0(out_remainder0_carry__1_n_12),
        .I1(running_reg_0),
        .I2(left_abs0[18]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [19]),
        .O(p_1_in[19]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[1]_i_1 
       (.I0(out_remainder0_carry_n_14),
        .I1(running_reg_0),
        .I2(left_abs0[0]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [1]),
        .O(p_1_in[1]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[20]_i_1 
       (.I0(out_remainder0_carry__1_n_11),
        .I1(running_reg_0),
        .I2(left_abs0[19]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [20]),
        .O(p_1_in[20]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[21]_i_1 
       (.I0(out_remainder0_carry__1_n_10),
        .I1(running_reg_0),
        .I2(left_abs0[20]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [21]),
        .O(p_1_in[21]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[22]_i_1 
       (.I0(out_remainder0_carry__1_n_9),
        .I1(running_reg_0),
        .I2(left_abs0[21]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [22]),
        .O(p_1_in[22]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[23]_i_1 
       (.I0(out_remainder0_carry__1_n_8),
        .I1(running_reg_0),
        .I2(left_abs0[22]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [23]),
        .O(p_1_in[23]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[24]_i_1 
       (.I0(out_remainder0_carry__2_n_15),
        .I1(running_reg_0),
        .I2(left_abs0[23]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [24]),
        .O(p_1_in[24]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[25]_i_1 
       (.I0(out_remainder0_carry__2_n_14),
        .I1(running_reg_0),
        .I2(left_abs0[24]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [25]),
        .O(p_1_in[25]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[26]_i_1 
       (.I0(out_remainder0_carry__2_n_13),
        .I1(running_reg_0),
        .I2(left_abs0[25]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [26]),
        .O(p_1_in[26]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[27]_i_1 
       (.I0(out_remainder0_carry__2_n_12),
        .I1(running_reg_0),
        .I2(left_abs0[26]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [27]),
        .O(p_1_in[27]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[28]_i_1 
       (.I0(out_remainder0_carry__2_n_11),
        .I1(running_reg_0),
        .I2(left_abs0[27]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [28]),
        .O(p_1_in[28]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[29]_i_1 
       (.I0(out_remainder0_carry__2_n_10),
        .I1(running_reg_0),
        .I2(left_abs0[28]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [29]),
        .O(p_1_in[29]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[2]_i_1 
       (.I0(out_remainder0_carry_n_13),
        .I1(running_reg_0),
        .I2(left_abs0[1]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [2]),
        .O(p_1_in[2]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[30]_i_1 
       (.I0(out_remainder0_carry__2_n_9),
        .I1(running_reg_0),
        .I2(left_abs0[29]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [30]),
        .O(p_1_in[30]));
  LUT4 #(
    .INIT(16'h040F)) 
    \out_remainder[31]_i_1 
       (.I0(\idx_reg[3]_0 ),
        .I1(\out_remainder0_inferred__0/i__carry__0_n_0 ),
        .I2(\quotient_reg[31]_0 ),
        .I3(running_reg_0),
        .O(\out_remainder[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \out_remainder[31]_i_2 
       (.I0(out_remainder0_carry__2_n_8),
        .I1(running_reg_0),
        .I2(left_abs0[30]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .O(p_1_in[31]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \out_remainder[31]_i_3 
       (.I0(\out_quotient[31]_i_2_n_0 ),
        .I1(idx_reg[3]),
        .I2(running_reg_0),
        .I3(idx_reg[4]),
        .I4(idx_reg[5]),
        .O(\idx_reg[3]_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[3]_i_1 
       (.I0(out_remainder0_carry_n_12),
        .I1(running_reg_0),
        .I2(left_abs0[2]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [3]),
        .O(p_1_in[3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[4]_i_1 
       (.I0(out_remainder0_carry_n_11),
        .I1(running_reg_0),
        .I2(left_abs0[3]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [4]),
        .O(p_1_in[4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[5]_i_1 
       (.I0(out_remainder0_carry_n_10),
        .I1(running_reg_0),
        .I2(left_abs0[4]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [5]),
        .O(p_1_in[5]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[6]_i_1 
       (.I0(out_remainder0_carry_n_9),
        .I1(running_reg_0),
        .I2(left_abs0[5]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [6]),
        .O(p_1_in[6]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[7]_i_1 
       (.I0(out_remainder0_carry_n_8),
        .I1(running_reg_0),
        .I2(left_abs0[6]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [7]),
        .O(p_1_in[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[8]_i_1 
       (.I0(out_remainder0_carry__0_n_15),
        .I1(running_reg_0),
        .I2(left_abs0[7]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [8]),
        .O(p_1_in[8]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \out_remainder[9]_i_1 
       (.I0(out_remainder0_carry__0_n_14),
        .I1(running_reg_0),
        .I2(left_abs0[8]),
        .I3(\out_remainder_reg[1]_0 [31]),
        .I4(\out_remainder_reg[1]_0 [9]),
        .O(p_1_in[9]));
  FDRE \out_remainder_reg[0] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(Q[0]),
        .R(SR[0]));
  FDRE \out_remainder_reg[10] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[10]),
        .Q(Q[10]),
        .R(SR[0]));
  FDRE \out_remainder_reg[11] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[11]),
        .Q(Q[11]),
        .R(SR[0]));
  FDRE \out_remainder_reg[12] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[12]),
        .Q(Q[12]),
        .R(SR[0]));
  FDRE \out_remainder_reg[13] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[13]),
        .Q(Q[13]),
        .R(SR[0]));
  FDRE \out_remainder_reg[14] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[14]),
        .Q(Q[14]),
        .R(SR[0]));
  FDRE \out_remainder_reg[15] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[15]),
        .Q(Q[15]),
        .R(SR[0]));
  FDRE \out_remainder_reg[16] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[16]),
        .Q(Q[16]),
        .R(SR[0]));
  FDRE \out_remainder_reg[17] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[17]),
        .Q(Q[17]),
        .R(SR[0]));
  FDRE \out_remainder_reg[18] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[18]),
        .Q(Q[18]),
        .R(SR[0]));
  FDRE \out_remainder_reg[19] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[19]),
        .Q(Q[19]),
        .R(SR[0]));
  FDRE \out_remainder_reg[1] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(Q[1]),
        .R(SR[0]));
  FDRE \out_remainder_reg[20] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[20]),
        .Q(Q[20]),
        .R(SR[0]));
  FDRE \out_remainder_reg[21] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[21]),
        .Q(Q[21]),
        .R(SR[0]));
  FDRE \out_remainder_reg[22] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[22]),
        .Q(Q[22]),
        .R(SR[0]));
  FDRE \out_remainder_reg[23] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[23]),
        .Q(Q[23]),
        .R(SR[0]));
  FDRE \out_remainder_reg[24] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[24]),
        .Q(Q[24]),
        .R(SR[0]));
  FDRE \out_remainder_reg[25] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[25]),
        .Q(Q[25]),
        .R(SR[0]));
  FDRE \out_remainder_reg[26] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[26]),
        .Q(Q[26]),
        .R(SR[0]));
  FDRE \out_remainder_reg[27] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[27]),
        .Q(Q[27]),
        .R(SR[0]));
  FDRE \out_remainder_reg[28] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[28]),
        .Q(Q[28]),
        .R(SR[0]));
  FDRE \out_remainder_reg[29] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[29]),
        .Q(Q[29]),
        .R(SR[0]));
  FDRE \out_remainder_reg[2] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(Q[2]),
        .R(SR[0]));
  FDRE \out_remainder_reg[30] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[30]),
        .Q(Q[30]),
        .R(SR[0]));
  FDRE \out_remainder_reg[31] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[31]),
        .Q(Q[31]),
        .R(SR[0]));
  FDRE \out_remainder_reg[3] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(Q[3]),
        .R(SR[0]));
  FDRE \out_remainder_reg[4] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(Q[4]),
        .R(SR[0]));
  FDRE \out_remainder_reg[5] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(Q[5]),
        .R(SR[0]));
  FDRE \out_remainder_reg[6] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(Q[6]),
        .R(SR[0]));
  FDRE \out_remainder_reg[7] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(Q[7]),
        .R(SR[0]));
  FDRE \out_remainder_reg[8] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[8]),
        .Q(Q[8]),
        .R(SR[0]));
  FDRE \out_remainder_reg[9] 
       (.C(clk),
        .CE(\out_remainder[31]_i_1_n_0 ),
        .D(p_1_in[9]),
        .Q(Q[9]),
        .R(SR[0]));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[10]_i_1 
       (.I0(quotient_next[10]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[8]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [9]),
        .O(\quotient[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[11]_i_1 
       (.I0(quotient_next[11]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[9]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [10]),
        .O(\quotient[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[12]_i_1 
       (.I0(quotient_next[12]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[10]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [11]),
        .O(\quotient[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[13]_i_1 
       (.I0(quotient_next[13]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[11]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [12]),
        .O(\quotient[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[14]_i_1 
       (.I0(quotient_next[14]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[12]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [13]),
        .O(\quotient[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[15]_i_1 
       (.I0(quotient_next[15]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[13]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [14]),
        .O(\quotient[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[16]_i_1 
       (.I0(quotient_next[16]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[14]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [15]),
        .O(\quotient[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[17]_i_1 
       (.I0(quotient_next[17]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[15]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [16]),
        .O(\quotient[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[18]_i_1 
       (.I0(quotient_next[18]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[16]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [17]),
        .O(\quotient[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[19]_i_1 
       (.I0(quotient_next[19]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[17]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [18]),
        .O(\quotient[19]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient[1]_i_1 
       (.I0(quotient_next[1]),
        .I1(\out_remainder_reg[0]_0 ),
        .I2(\out_remainder_reg[1]_0 [0]),
        .O(\quotient[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[20]_i_1 
       (.I0(quotient_next[20]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[18]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [19]),
        .O(\quotient[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[21]_i_1 
       (.I0(quotient_next[21]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[19]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [20]),
        .O(\quotient[21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[22]_i_1 
       (.I0(quotient_next[22]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[20]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [21]),
        .O(\quotient[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[23]_i_1 
       (.I0(quotient_next[23]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[21]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [22]),
        .O(\quotient[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[24]_i_1 
       (.I0(quotient_next[24]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[22]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [23]),
        .O(\quotient[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[25]_i_1 
       (.I0(quotient_next[25]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[23]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [24]),
        .O(\quotient[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[26]_i_1 
       (.I0(quotient_next[26]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[24]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [25]),
        .O(\quotient[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[27]_i_1 
       (.I0(quotient_next[27]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[25]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [26]),
        .O(\quotient[27]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[28]_i_1 
       (.I0(quotient_next[28]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[26]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [27]),
        .O(\quotient[28]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[29]_i_1 
       (.I0(quotient_next[29]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[27]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [28]),
        .O(\quotient[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[2]_i_1 
       (.I0(quotient_next[2]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[0]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [1]),
        .O(\quotient[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[30]_i_1 
       (.I0(quotient_next[30]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[28]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [29]),
        .O(\quotient[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[31]_i_1 
       (.I0(quotient_next[31]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[29]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [30]),
        .O(\quotient[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[3]_i_1 
       (.I0(quotient_next[3]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[1]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [2]),
        .O(\quotient[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[4]_i_1 
       (.I0(quotient_next[4]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[2]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [3]),
        .O(\quotient[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[5]_i_1 
       (.I0(quotient_next[5]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[3]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [4]),
        .O(\quotient[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[6]_i_1 
       (.I0(quotient_next[6]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[4]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [5]),
        .O(\quotient[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[7]_i_1 
       (.I0(quotient_next[7]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[5]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [6]),
        .O(\quotient[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[8]_i_1 
       (.I0(quotient_next[8]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[6]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [7]),
        .O(\quotient[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hABA8ABABABA8A8A8)) 
    \quotient[9]_i_1 
       (.I0(quotient_next[9]),
        .I1(running_reg_0),
        .I2(\quotient_reg[31]_0 ),
        .I3(left_abs0[7]),
        .I4(\out_remainder_reg[1]_0 [31]),
        .I5(\out_remainder_reg[1]_0 [8]),
        .O(\quotient[9]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next0_carry
       (.CI(\<const1> ),
        .CI_TOP(GND_2),
        .CO({quotient_next0_carry_n_0,NLW_quotient_next0_carry_CO_UNCONNECTED[6:0]}),
        .DI(\acc_reg[31]_0 [7:0]),
        .O(quotient_next0[7:0]),
        .S(\acc_reg[8]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next0_carry__0
       (.CI(quotient_next0_carry_n_0),
        .CI_TOP(GND_2),
        .CO({quotient_next0_carry__0_n_0,NLW_quotient_next0_carry__0_CO_UNCONNECTED[6:0]}),
        .DI(\acc_reg[31]_0 [15:8]),
        .O(quotient_next0[15:8]),
        .S(\acc_reg[16]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next0_carry__1
       (.CI(quotient_next0_carry__0_n_0),
        .CI_TOP(GND_2),
        .CO({quotient_next0_carry__1_n_0,NLW_quotient_next0_carry__1_CO_UNCONNECTED[6:0]}),
        .DI(\acc_reg[31]_0 [23:16]),
        .O(quotient_next0[23:16]),
        .S(\acc_reg[24]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next0_carry__2
       (.CI(quotient_next0_carry__1_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\acc_reg[31]_0 [30:24]}),
        .O(quotient_next0[31:24]),
        .S({quotient_next0_carry__2_i_1_n_0,\acc_reg[32]_0 }));
  LUT4 #(
    .INIT(16'h5955)) 
    quotient_next0_carry__2_i_1
       (.I0(\acc_reg[31]_0 [31]),
        .I1(right_abs0),
        .I2(\quotient_reg[31]_0 ),
        .I3(quotient_next0_carry__2_0),
        .O(quotient_next0_carry__2_i_1_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next1_carry
       (.CI(\<const1> ),
        .CI_TOP(GND_2),
        .CO({quotient_next1_carry_n_0,NLW_quotient_next1_carry_CO_UNCONNECTED[6:0]}),
        .DI({quotient_next1_carry_i_1_n_0,quotient_next1_carry_i_2_n_0,quotient_next1_carry_i_3_n_0,quotient_next1_carry_i_4_n_0,quotient_next1_carry_i_5_n_0,quotient_next1_carry_i_6_n_0,quotient_next1_carry_i_7_n_0,quotient_next1_carry_i_8_n_0}),
        .S(quotient_next1_carry__0_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 quotient_next1_carry__0
       (.CI(quotient_next1_carry_n_0),
        .CI_TOP(GND_2),
        .CO({quotient_next1_carry__0_n_0,NLW_quotient_next1_carry__0_CO_UNCONNECTED[6:0]}),
        .DI({\quotient_reg[0]_0 ,quotient_next1_carry__0_i_2_n_0,quotient_next1_carry__0_i_3_n_0,quotient_next1_carry__0_i_4_n_0,quotient_next1_carry__0_i_5_n_0,quotient_next1_carry__0_i_6_n_0,quotient_next1_carry__0_i_7_n_0,quotient_next1_carry__0_i_8_n_0}),
        .S(\quotient_reg[0]_1 ));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry__0_i_2
       (.I0(\acc_reg[31]_0 [29]),
        .I1(D[28]),
        .I2(\acc_reg[31]_0 [28]),
        .I3(D[27]),
        .O(quotient_next1_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry__0_i_3
       (.I0(\acc_reg[31]_0 [27]),
        .I1(D[26]),
        .I2(\acc_reg[31]_0 [26]),
        .I3(D[25]),
        .O(quotient_next1_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry__0_i_4
       (.I0(\acc_reg[31]_0 [25]),
        .I1(D[24]),
        .I2(\acc_reg[31]_0 [24]),
        .I3(D[23]),
        .O(quotient_next1_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry__0_i_5
       (.I0(\acc_reg[31]_0 [23]),
        .I1(D[22]),
        .I2(\acc_reg[31]_0 [22]),
        .I3(D[21]),
        .O(quotient_next1_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry__0_i_6
       (.I0(\acc_reg[31]_0 [21]),
        .I1(D[20]),
        .I2(\acc_reg[31]_0 [20]),
        .I3(quotient_next1_carry__0_1),
        .O(quotient_next1_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry__0_i_7
       (.I0(\acc_reg[31]_0 [19]),
        .I1(D[19]),
        .I2(\acc_reg[31]_0 [18]),
        .I3(D[18]),
        .O(quotient_next1_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry__0_i_8
       (.I0(\acc_reg[31]_0 [17]),
        .I1(D[17]),
        .I2(\acc_reg[31]_0 [16]),
        .I3(D[16]),
        .O(quotient_next1_carry__0_i_8_n_0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY8 quotient_next1_carry__1
       (.CI(quotient_next1_carry__0_n_0),
        .CI_TOP(GND_2),
        .CO(quotient_next1),
        .DI(\acc_reg_n_0_[32] ),
        .S(quotient_next1_carry__1_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    quotient_next1_carry__1_i_1
       (.I0(\acc_reg_n_0_[32] ),
        .O(quotient_next1_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry_i_1
       (.I0(\acc_reg[31]_0 [15]),
        .I1(D[15]),
        .I2(\acc_reg[31]_0 [14]),
        .I3(D[14]),
        .O(quotient_next1_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry_i_2
       (.I0(\acc_reg[31]_0 [13]),
        .I1(D[13]),
        .I2(\acc_reg[31]_0 [12]),
        .I3(D[12]),
        .O(quotient_next1_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry_i_3
       (.I0(\acc_reg[31]_0 [11]),
        .I1(D[11]),
        .I2(\acc_reg[31]_0 [10]),
        .I3(D[10]),
        .O(quotient_next1_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry_i_4
       (.I0(\acc_reg[31]_0 [9]),
        .I1(D[9]),
        .I2(\acc_reg[31]_0 [8]),
        .I3(D[8]),
        .O(quotient_next1_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry_i_5
       (.I0(\acc_reg[31]_0 [7]),
        .I1(D[7]),
        .I2(\acc_reg[31]_0 [6]),
        .I3(D[6]),
        .O(quotient_next1_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry_i_6
       (.I0(\acc_reg[31]_0 [5]),
        .I1(D[5]),
        .I2(\acc_reg[31]_0 [4]),
        .I3(D[4]),
        .O(quotient_next1_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    quotient_next1_carry_i_7
       (.I0(\acc_reg[31]_0 [3]),
        .I1(D[3]),
        .I2(\acc_reg[31]_0 [2]),
        .I3(D[2]),
        .O(quotient_next1_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'hB222B2B2)) 
    quotient_next1_carry_i_8
       (.I0(\acc_reg[31]_0 [1]),
        .I1(D[1]),
        .I2(\acc_reg[31]_0 [0]),
        .I3(\quotient_reg[31]_0 ),
        .I4(D[0]),
        .O(quotient_next1_carry_i_8_n_0));
  FDRE \quotient_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(quotient_next1),
        .Q(quotient_next[1]),
        .R(SR[1]));
  FDRE \quotient_reg[10] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[10]_i_1_n_0 ),
        .Q(quotient_next[11]),
        .R(SR[0]));
  FDRE \quotient_reg[11] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[11]_i_1_n_0 ),
        .Q(quotient_next[12]),
        .R(SR[0]));
  FDRE \quotient_reg[12] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[12]_i_1_n_0 ),
        .Q(quotient_next[13]),
        .R(SR[0]));
  FDRE \quotient_reg[13] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[13]_i_1_n_0 ),
        .Q(quotient_next[14]),
        .R(SR[0]));
  FDRE \quotient_reg[14] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[14]_i_1_n_0 ),
        .Q(quotient_next[15]),
        .R(SR[0]));
  FDRE \quotient_reg[15] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[15]_i_1_n_0 ),
        .Q(quotient_next[16]),
        .R(SR[0]));
  FDRE \quotient_reg[16] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[16]_i_1_n_0 ),
        .Q(quotient_next[17]),
        .R(SR[0]));
  FDRE \quotient_reg[17] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[17]_i_1_n_0 ),
        .Q(quotient_next[18]),
        .R(SR[0]));
  FDRE \quotient_reg[18] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[18]_i_1_n_0 ),
        .Q(quotient_next[19]),
        .R(SR[0]));
  FDRE \quotient_reg[19] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[19]_i_1_n_0 ),
        .Q(quotient_next[20]),
        .R(SR[0]));
  FDRE \quotient_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[1]_i_1_n_0 ),
        .Q(quotient_next[2]),
        .R(SR[0]));
  FDRE \quotient_reg[20] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[20]_i_1_n_0 ),
        .Q(quotient_next[21]),
        .R(SR[0]));
  FDRE \quotient_reg[21] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[21]_i_1_n_0 ),
        .Q(quotient_next[22]),
        .R(SR[0]));
  FDRE \quotient_reg[22] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[22]_i_1_n_0 ),
        .Q(quotient_next[23]),
        .R(SR[0]));
  FDRE \quotient_reg[23] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[23]_i_1_n_0 ),
        .Q(quotient_next[24]),
        .R(SR[0]));
  FDRE \quotient_reg[24] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[24]_i_1_n_0 ),
        .Q(quotient_next[25]),
        .R(SR[0]));
  FDRE \quotient_reg[25] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[25]_i_1_n_0 ),
        .Q(quotient_next[26]),
        .R(SR[0]));
  FDRE \quotient_reg[26] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[26]_i_1_n_0 ),
        .Q(quotient_next[27]),
        .R(SR[0]));
  FDRE \quotient_reg[27] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[27]_i_1_n_0 ),
        .Q(quotient_next[28]),
        .R(SR[0]));
  FDRE \quotient_reg[28] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[28]_i_1_n_0 ),
        .Q(quotient_next[29]),
        .R(SR[0]));
  FDRE \quotient_reg[29] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[29]_i_1_n_0 ),
        .Q(quotient_next[30]),
        .R(SR[0]));
  FDRE \quotient_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[2]_i_1_n_0 ),
        .Q(quotient_next[3]),
        .R(SR[0]));
  FDRE \quotient_reg[30] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[30]_i_1_n_0 ),
        .Q(quotient_next[31]),
        .R(SR[0]));
  FDRE \quotient_reg[31] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[31]_i_1_n_0 ),
        .Q(p_2_in0),
        .R(SR[0]));
  FDRE \quotient_reg[3] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[3]_i_1_n_0 ),
        .Q(quotient_next[4]),
        .R(SR[0]));
  FDRE \quotient_reg[4] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[4]_i_1_n_0 ),
        .Q(quotient_next[5]),
        .R(SR[0]));
  FDRE \quotient_reg[5] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[5]_i_1_n_0 ),
        .Q(quotient_next[6]),
        .R(SR[0]));
  FDRE \quotient_reg[6] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[6]_i_1_n_0 ),
        .Q(quotient_next[7]),
        .R(SR[0]));
  FDRE \quotient_reg[7] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[7]_i_1_n_0 ),
        .Q(quotient_next[8]),
        .R(SR[0]));
  FDRE \quotient_reg[8] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[8]_i_1_n_0 ),
        .Q(quotient_next[9]),
        .R(SR[0]));
  FDRE \quotient_reg[9] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\quotient[9]_i_1_n_0 ),
        .Q(quotient_next[10]),
        .R(SR[0]));
  FDRE running_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(running_reg_1),
        .Q(running_reg_0),
        .R(\<const0> ));
endmodule

module std_fp_sdiv_pipe
   (div_done,
    Q,
    \acc_reg[31] ,
    running,
    \idx_reg[3] ,
    out_rem_write_data,
    out_quot_write_data,
    \out_quotient_reg[0] ,
    done0,
    clk,
    E,
    right_sign_reg_0,
    div_left,
    reset,
    \out_remainder_reg[7] ,
    \out_remainder_reg[15] ,
    \out_remainder_reg[23] ,
    \out_remainder_reg[31] ,
    \out_remainder0_inferred__0/i__carry__0 ,
    \out_remainder0_inferred__0/i__carry__0_0 ,
    DI,
    S,
    \acc_reg[8] ,
    \acc_reg[16] ,
    \acc_reg[24] ,
    \acc_reg[32] ,
    quotient_next1_carry__0,
    \quotient_reg[0] ,
    \quotient_reg[0]_0 ,
    SR,
    running_reg,
    D,
    quotient_next1_carry__0_0,
    \quotient_reg[31] ,
    right_abs0,
    left_abs0,
    \out_remainder_reg[1] ,
    \out_remainder_reg[0] ,
    .out_quot_write_data_1_sp_1(out_quot_write_data_1_sn_1));
  output div_done;
  output [31:0]Q;
  output [31:0]\acc_reg[31] ;
  output running;
  output \idx_reg[3] ;
  output [31:0]out_rem_write_data;
  output [30:0]out_quot_write_data;
  output [0:0]\out_quotient_reg[0] ;
  input done0;
  input clk;
  input [0:0]E;
  input [1:0]right_sign_reg_0;
  input [0:0]div_left;
  input reset;
  input [6:0]\out_remainder_reg[7] ;
  input [7:0]\out_remainder_reg[15] ;
  input [7:0]\out_remainder_reg[23] ;
  input [6:0]\out_remainder_reg[31] ;
  input [6:0]\out_remainder0_inferred__0/i__carry__0 ;
  input [7:0]\out_remainder0_inferred__0/i__carry__0_0 ;
  input [0:0]DI;
  input [7:0]S;
  input [7:0]\acc_reg[8] ;
  input [7:0]\acc_reg[16] ;
  input [7:0]\acc_reg[24] ;
  input [6:0]\acc_reg[32] ;
  input [7:0]quotient_next1_carry__0;
  input [0:0]\quotient_reg[0] ;
  input [7:0]\quotient_reg[0]_0 ;
  input [0:0]SR;
  input running_reg;
  input [30:0]D;
  input quotient_next1_carry__0_0;
  input \quotient_reg[31] ;
  input [0:0]right_abs0;
  input [30:0]left_abs0;
  input [31:0]\out_remainder_reg[1] ;
  input \out_remainder_reg[0] ;
  input out_quot_write_data_1_sn_1;

  wire \<const0> ;
  wire \<const1> ;
  wire [30:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire GND_2;
  wire [31:0]Q;
  wire [7:0]S;
  wire [0:0]SR;
  wire [7:0]\acc_reg[16] ;
  wire [7:0]\acc_reg[24] ;
  wire [31:0]\acc_reg[31] ;
  wire [6:0]\acc_reg[32] ;
  wire [7:0]\acc_reg[8] ;
  wire clk;
  wire comp_n_131;
  wire comp_n_132;
  wire comp_n_133;
  wire comp_n_134;
  wire comp_n_135;
  wire comp_n_136;
  wire comp_n_137;
  wire comp_n_138;
  wire comp_n_139;
  wire comp_n_140;
  wire comp_n_141;
  wire comp_n_142;
  wire comp_n_143;
  wire comp_n_144;
  wire comp_n_145;
  wire comp_n_146;
  wire comp_n_147;
  wire comp_n_148;
  wire comp_n_149;
  wire comp_n_150;
  wire comp_n_151;
  wire comp_n_152;
  wire comp_n_153;
  wire comp_n_154;
  wire comp_n_155;
  wire comp_n_156;
  wire comp_n_157;
  wire comp_n_158;
  wire comp_n_159;
  wire comp_n_160;
  wire comp_n_161;
  wire comp_n_162;
  wire div_done;
  wire [0:0]div_left;
  wire done0;
  wire \idx_reg[3] ;
  wire [30:0]left_abs0;
  wire left_sign;
  wire [30:0]out_quot_write_data;
  wire out_quot_write_data_1_sn_1;
  wire [0:0]\out_quotient_reg[0] ;
  wire [31:0]out_rem_intermediate0;
  wire out_rem_intermediate0_carry__0_n_0;
  wire out_rem_intermediate0_carry__1_n_0;
  wire out_rem_intermediate0_carry_n_0;
  wire [31:0]out_rem_write_data;
  wire [6:0]\out_remainder0_inferred__0/i__carry__0 ;
  wire [7:0]\out_remainder0_inferred__0/i__carry__0_0 ;
  wire \out_remainder_reg[0] ;
  wire [7:0]\out_remainder_reg[15] ;
  wire [31:0]\out_remainder_reg[1] ;
  wire [7:0]\out_remainder_reg[23] ;
  wire [6:0]\out_remainder_reg[31] ;
  wire [6:0]\out_remainder_reg[7] ;
  wire [7:0]quotient_next1_carry__0;
  wire quotient_next1_carry__0_0;
  wire [0:0]\quotient_reg[0] ;
  wire [7:0]\quotient_reg[0]_0 ;
  wire \quotient_reg[31] ;
  wire reset;
  wire [0:0]right_abs0;
  wire [31:0]right_save;
  wire right_sign;
  wire [1:0]right_sign_reg_0;
  wire running;
  wire running_reg;
  wire [7:0]NLW_out_rem_intermediate0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_out_rem_intermediate0_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_out_rem_intermediate0_carry__1_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  std_fp_div_pipe comp
       (.D({D[28:20],D[18:0],right_sign_reg_0[0]}),
        .DI(DI),
        .Q(Q),
        .S(S),
        .SR({SR,reset}),
        .\acc_reg[16]_0 (\acc_reg[16] ),
        .\acc_reg[24]_0 (\acc_reg[24] ),
        .\acc_reg[31]_0 (\acc_reg[31] ),
        .\acc_reg[32]_0 (\acc_reg[32] ),
        .\acc_reg[8]_0 (\acc_reg[8] ),
        .clk(clk),
        .div_done(div_done),
        .done0(done0),
        .\idx_reg[3]_0 (\idx_reg[3] ),
        .left_abs0(left_abs0),
        .left_sign(left_sign),
        .out_quot_write_data(out_quot_write_data),
        .out_quot_write_data_1_sp_1(out_quot_write_data_1_sn_1),
        .\out_quotient_reg[0]_0 (\out_quotient_reg[0] ),
        .out_rem_intermediate0(out_rem_intermediate0),
        .out_rem_intermediate0_carry__2(right_save),
        .out_rem_write_data(out_rem_write_data),
        .\out_remainder0_inferred__0/i__carry__0_0 (\out_remainder0_inferred__0/i__carry__0 ),
        .\out_remainder0_inferred__0/i__carry__0_1 (\out_remainder0_inferred__0/i__carry__0_0 ),
        .\out_remainder_reg[0]_0 (\out_remainder_reg[0] ),
        .\out_remainder_reg[15]_0 (\out_remainder_reg[15] ),
        .\out_remainder_reg[1]_0 (\out_remainder_reg[1] ),
        .\out_remainder_reg[23]_0 (\out_remainder_reg[23] ),
        .\out_remainder_reg[31]_0 ({comp_n_131,comp_n_132,comp_n_133,comp_n_134,comp_n_135,comp_n_136,comp_n_137,comp_n_138}),
        .\out_remainder_reg[31]_1 (\out_remainder_reg[31] ),
        .\out_remainder_reg[7]_0 (\out_remainder_reg[7] ),
        .quotient_next0_carry__2_0(right_sign_reg_0[1]),
        .quotient_next1_carry__0_0(quotient_next1_carry__0),
        .quotient_next1_carry__0_1(quotient_next1_carry__0_0),
        .\quotient_reg[0]_0 (\quotient_reg[0] ),
        .\quotient_reg[0]_1 (\quotient_reg[0]_0 ),
        .\quotient_reg[31]_0 (\quotient_reg[31] ),
        .right_abs0(right_abs0),
        .\right_save_reg[15] ({comp_n_147,comp_n_148,comp_n_149,comp_n_150,comp_n_151,comp_n_152,comp_n_153,comp_n_154}),
        .\right_save_reg[23] ({comp_n_155,comp_n_156,comp_n_157,comp_n_158,comp_n_159,comp_n_160,comp_n_161,comp_n_162}),
        .\right_save_reg[7] ({comp_n_139,comp_n_140,comp_n_141,comp_n_142,comp_n_143,comp_n_144,comp_n_145,comp_n_146}),
        .right_sign(right_sign),
        .running_reg_0(running),
        .running_reg_1(running_reg));
  FDRE left_sign_reg
       (.C(clk),
        .CE(E),
        .D(div_left),
        .Q(left_sign),
        .R(\<const0> ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_rem_intermediate0_carry
       (.CI(\<const1> ),
        .CI_TOP(GND_2),
        .CO({out_rem_intermediate0_carry_n_0,NLW_out_rem_intermediate0_carry_CO_UNCONNECTED[6:0]}),
        .DI(right_save[7:0]),
        .O(out_rem_intermediate0[7:0]),
        .S({comp_n_139,comp_n_140,comp_n_141,comp_n_142,comp_n_143,comp_n_144,comp_n_145,comp_n_146}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_rem_intermediate0_carry__0
       (.CI(out_rem_intermediate0_carry_n_0),
        .CI_TOP(GND_2),
        .CO({out_rem_intermediate0_carry__0_n_0,NLW_out_rem_intermediate0_carry__0_CO_UNCONNECTED[6:0]}),
        .DI(right_save[15:8]),
        .O(out_rem_intermediate0[15:8]),
        .S({comp_n_147,comp_n_148,comp_n_149,comp_n_150,comp_n_151,comp_n_152,comp_n_153,comp_n_154}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_rem_intermediate0_carry__1
       (.CI(out_rem_intermediate0_carry__0_n_0),
        .CI_TOP(GND_2),
        .CO({out_rem_intermediate0_carry__1_n_0,NLW_out_rem_intermediate0_carry__1_CO_UNCONNECTED[6:0]}),
        .DI(right_save[23:16]),
        .O(out_rem_intermediate0[23:16]),
        .S({comp_n_155,comp_n_156,comp_n_157,comp_n_158,comp_n_159,comp_n_160,comp_n_161,comp_n_162}));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out_rem_intermediate0_carry__2
       (.CI(out_rem_intermediate0_carry__1_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,right_save[30:24]}),
        .O(out_rem_intermediate0[31:24]),
        .S({comp_n_131,comp_n_132,comp_n_133,comp_n_134,comp_n_135,comp_n_136,comp_n_137,comp_n_138}));
  FDRE \right_save_reg[0] 
       (.C(clk),
        .CE(E),
        .D(right_sign_reg_0[0]),
        .Q(right_save[0]),
        .R(\<const0> ));
  FDRE \right_save_reg[10] 
       (.C(clk),
        .CE(E),
        .D(D[9]),
        .Q(right_save[10]),
        .R(\<const0> ));
  FDRE \right_save_reg[11] 
       (.C(clk),
        .CE(E),
        .D(D[10]),
        .Q(right_save[11]),
        .R(\<const0> ));
  FDRE \right_save_reg[12] 
       (.C(clk),
        .CE(E),
        .D(D[11]),
        .Q(right_save[12]),
        .R(\<const0> ));
  FDRE \right_save_reg[13] 
       (.C(clk),
        .CE(E),
        .D(D[12]),
        .Q(right_save[13]),
        .R(\<const0> ));
  FDRE \right_save_reg[14] 
       (.C(clk),
        .CE(E),
        .D(D[13]),
        .Q(right_save[14]),
        .R(\<const0> ));
  FDRE \right_save_reg[15] 
       (.C(clk),
        .CE(E),
        .D(D[14]),
        .Q(right_save[15]),
        .R(\<const0> ));
  FDRE \right_save_reg[16] 
       (.C(clk),
        .CE(E),
        .D(D[15]),
        .Q(right_save[16]),
        .R(\<const0> ));
  FDRE \right_save_reg[17] 
       (.C(clk),
        .CE(E),
        .D(D[16]),
        .Q(right_save[17]),
        .R(\<const0> ));
  FDRE \right_save_reg[18] 
       (.C(clk),
        .CE(E),
        .D(D[17]),
        .Q(right_save[18]),
        .R(\<const0> ));
  FDRE \right_save_reg[19] 
       (.C(clk),
        .CE(E),
        .D(D[18]),
        .Q(right_save[19]),
        .R(\<const0> ));
  FDRE \right_save_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(right_save[1]),
        .R(\<const0> ));
  FDRE \right_save_reg[20] 
       (.C(clk),
        .CE(E),
        .D(D[19]),
        .Q(right_save[20]),
        .R(\<const0> ));
  FDRE \right_save_reg[21] 
       (.C(clk),
        .CE(E),
        .D(D[20]),
        .Q(right_save[21]),
        .R(\<const0> ));
  FDRE \right_save_reg[22] 
       (.C(clk),
        .CE(E),
        .D(D[21]),
        .Q(right_save[22]),
        .R(\<const0> ));
  FDRE \right_save_reg[23] 
       (.C(clk),
        .CE(E),
        .D(D[22]),
        .Q(right_save[23]),
        .R(\<const0> ));
  FDRE \right_save_reg[24] 
       (.C(clk),
        .CE(E),
        .D(D[23]),
        .Q(right_save[24]),
        .R(\<const0> ));
  FDRE \right_save_reg[25] 
       (.C(clk),
        .CE(E),
        .D(D[24]),
        .Q(right_save[25]),
        .R(\<const0> ));
  FDRE \right_save_reg[26] 
       (.C(clk),
        .CE(E),
        .D(D[25]),
        .Q(right_save[26]),
        .R(\<const0> ));
  FDRE \right_save_reg[27] 
       (.C(clk),
        .CE(E),
        .D(D[26]),
        .Q(right_save[27]),
        .R(\<const0> ));
  FDRE \right_save_reg[28] 
       (.C(clk),
        .CE(E),
        .D(D[27]),
        .Q(right_save[28]),
        .R(\<const0> ));
  FDRE \right_save_reg[29] 
       (.C(clk),
        .CE(E),
        .D(D[28]),
        .Q(right_save[29]),
        .R(\<const0> ));
  FDRE \right_save_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(right_save[2]),
        .R(\<const0> ));
  FDRE \right_save_reg[30] 
       (.C(clk),
        .CE(E),
        .D(D[29]),
        .Q(right_save[30]),
        .R(\<const0> ));
  FDRE \right_save_reg[31] 
       (.C(clk),
        .CE(E),
        .D(D[30]),
        .Q(right_save[31]),
        .R(\<const0> ));
  FDRE \right_save_reg[3] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(right_save[3]),
        .R(\<const0> ));
  FDRE \right_save_reg[4] 
       (.C(clk),
        .CE(E),
        .D(D[3]),
        .Q(right_save[4]),
        .R(\<const0> ));
  FDRE \right_save_reg[5] 
       (.C(clk),
        .CE(E),
        .D(D[4]),
        .Q(right_save[5]),
        .R(\<const0> ));
  FDRE \right_save_reg[6] 
       (.C(clk),
        .CE(E),
        .D(D[5]),
        .Q(right_save[6]),
        .R(\<const0> ));
  FDRE \right_save_reg[7] 
       (.C(clk),
        .CE(E),
        .D(D[6]),
        .Q(right_save[7]),
        .R(\<const0> ));
  FDRE \right_save_reg[8] 
       (.C(clk),
        .CE(E),
        .D(D[7]),
        .Q(right_save[8]),
        .R(\<const0> ));
  FDRE \right_save_reg[9] 
       (.C(clk),
        .CE(E),
        .D(D[8]),
        .Q(right_save[9]),
        .R(\<const0> ));
  FDRE right_sign_reg
       (.C(clk),
        .CE(E),
        .D(right_sign_reg_0[1]),
        .Q(right_sign),
        .R(\<const0> ));
endmodule

module std_lt
   (carry_8,
    b,
    comb_reg_out,
    a);
  output carry_8;
  input [0:0]b;
  input comb_reg_out;
  input [2:0]a;

  wire [2:0]a;
  wire [0:0]b;
  wire carry_8;
  wire comb_reg_out;

  lakeroad_xilinx_ultrascale_plus_ult3_2 _impl
       (.a(a),
        .b(b),
        .carry_8_0(carry_8),
        .comb_reg_out(comb_reg_out));
endmodule

module std_reg
   (a,
    \out_reg[2]_0 ,
    E,
    D,
    right_abs0,
    done_reg,
    \out_reg[1]_0 ,
    \out_reg[0]_0 ,
    left_abs0,
    running_reg,
    div_left,
    running_reg_0,
    SR,
    done_reg_0,
    out_rem_done_0,
    done,
    carry_8,
    b,
    done_reg_1,
    \out_reg[31] ,
    out_quot_write_data,
    left_addr0,
    Q,
    go,
    comb_reg_done,
    comb_reg_out,
    idx_done,
    comb_reg1_done,
    div_done,
    \right_save_reg[31] ,
    left_sign_reg,
    running,
    reset,
    out_rem_done,
    out_quot_done,
    out0,
    \out_quot_write_data[0] ,
    clk);
  output [2:0]a;
  output [2:0]\out_reg[2]_0 ;
  output [0:0]E;
  output [0:0]D;
  output [30:0]right_abs0;
  output done_reg;
  output [0:0]\out_reg[1]_0 ;
  output \out_reg[0]_0 ;
  output [30:0]left_abs0;
  output running_reg;
  output [0:0]div_left;
  output running_reg_0;
  output [0:0]SR;
  output [0:0]done_reg_0;
  output out_rem_done_0;
  output done;
  output [2:0]carry_8;
  output [0:0]b;
  output [0:0]done_reg_1;
  output \out_reg[31] ;
  output [0:0]out_quot_write_data;
  output [2:0]left_addr0;
  input [2:0]Q;
  input go;
  input comb_reg_done;
  input comb_reg_out;
  input idx_done;
  input comb_reg1_done;
  input div_done;
  input [31:0]\right_save_reg[31] ;
  input [31:0]left_sign_reg;
  input running;
  input reset;
  input out_rem_done;
  input out_quot_done;
  input [2:0]out0;
  input [0:0]\out_quot_write_data[0] ;
  input clk;

  wire \<const0> ;
  wire [0:0]D;
  wire [0:0]E;
  wire GND_2;
  wire [2:0]Q;
  wire [0:0]SR;
  wire [2:0]a;
  wire [0:0]b;
  wire [2:0]carry_8;
  wire clk;
  wire comb_reg1_done;
  wire comb_reg_done;
  wire comb_reg_out;
  wire div_done;
  wire [0:0]div_left;
  wire done;
  wire done_reg;
  wire [0:0]done_reg_0;
  wire [0:0]done_reg_1;
  wire [2:0]fsm_in;
  wire [2:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire idx_done;
  wire [30:0]left_abs0;
  wire [2:0]left_addr0;
  wire [31:0]left_sign_reg;
  wire [2:0]out0;
  wire \out[0]_i_2_n_0 ;
  wire \out[0]_i_3_n_0 ;
  wire \out[1]_i_2_n_0 ;
  wire \out[1]_i_3_n_0 ;
  wire \out[2]_i_3_n_0 ;
  wire \out[2]_i_4_n_0 ;
  wire \out[2]_i_5_n_0 ;
  wire \out[2]_i_6_n_0 ;
  wire \out[2]_i_7_n_0 ;
  wire out_quot_done;
  wire [0:0]out_quot_write_data;
  wire [0:0]\out_quot_write_data[0] ;
  wire \out_reg[0]_0 ;
  wire [0:0]\out_reg[1]_0 ;
  wire [2:0]\out_reg[2]_0 ;
  wire \out_reg[31] ;
  wire out_rem_done;
  wire out_rem_done_0;
  wire \out_remainder[16]_i_10_n_0 ;
  wire \out_remainder[16]_i_3_n_0 ;
  wire \out_remainder[16]_i_4_n_0 ;
  wire \out_remainder[16]_i_5_n_0 ;
  wire \out_remainder[16]_i_6_n_0 ;
  wire \out_remainder[16]_i_7_n_0 ;
  wire \out_remainder[16]_i_8_n_0 ;
  wire \out_remainder[16]_i_9_n_0 ;
  wire \out_remainder[24]_i_10_n_0 ;
  wire \out_remainder[24]_i_3_n_0 ;
  wire \out_remainder[24]_i_4_n_0 ;
  wire \out_remainder[24]_i_5_n_0 ;
  wire \out_remainder[24]_i_6_n_0 ;
  wire \out_remainder[24]_i_7_n_0 ;
  wire \out_remainder[24]_i_8_n_0 ;
  wire \out_remainder[24]_i_9_n_0 ;
  wire \out_remainder[31]_i_10_n_0 ;
  wire \out_remainder[31]_i_11_n_0 ;
  wire \out_remainder[31]_i_12_n_0 ;
  wire \out_remainder[31]_i_6_n_0 ;
  wire \out_remainder[31]_i_7_n_0 ;
  wire \out_remainder[31]_i_8_n_0 ;
  wire \out_remainder[31]_i_9_n_0 ;
  wire \out_remainder[8]_i_10_n_0 ;
  wire \out_remainder[8]_i_11_n_0 ;
  wire \out_remainder[8]_i_3_n_0 ;
  wire \out_remainder[8]_i_4_n_0 ;
  wire \out_remainder[8]_i_5_n_0 ;
  wire \out_remainder[8]_i_6_n_0 ;
  wire \out_remainder[8]_i_7_n_0 ;
  wire \out_remainder[8]_i_8_n_0 ;
  wire \out_remainder[8]_i_9_n_0 ;
  wire \out_remainder_reg[16]_i_2_n_0 ;
  wire \out_remainder_reg[24]_i_2_n_0 ;
  wire \out_remainder_reg[8]_i_2_n_0 ;
  wire reset;
  wire [30:0]right_abs0;
  wire \right_save[16]_i_10_n_0 ;
  wire \right_save[16]_i_3_n_0 ;
  wire \right_save[16]_i_4_n_0 ;
  wire \right_save[16]_i_5_n_0 ;
  wire \right_save[16]_i_6_n_0 ;
  wire \right_save[16]_i_7_n_0 ;
  wire \right_save[16]_i_8_n_0 ;
  wire \right_save[16]_i_9_n_0 ;
  wire \right_save[24]_i_10_n_0 ;
  wire \right_save[24]_i_3_n_0 ;
  wire \right_save[24]_i_4_n_0 ;
  wire \right_save[24]_i_5_n_0 ;
  wire \right_save[24]_i_6_n_0 ;
  wire \right_save[24]_i_7_n_0 ;
  wire \right_save[24]_i_8_n_0 ;
  wire \right_save[24]_i_9_n_0 ;
  wire \right_save[31]_i_3_n_0 ;
  wire \right_save[31]_i_4_n_0 ;
  wire \right_save[31]_i_5_n_0 ;
  wire \right_save[31]_i_6_n_0 ;
  wire \right_save[31]_i_7_n_0 ;
  wire \right_save[31]_i_8_n_0 ;
  wire \right_save[31]_i_9_n_0 ;
  wire \right_save[8]_i_10_n_0 ;
  wire \right_save[8]_i_11_n_0 ;
  wire \right_save[8]_i_3_n_0 ;
  wire \right_save[8]_i_4_n_0 ;
  wire \right_save[8]_i_5_n_0 ;
  wire \right_save[8]_i_6_n_0 ;
  wire \right_save[8]_i_7_n_0 ;
  wire \right_save[8]_i_8_n_0 ;
  wire \right_save[8]_i_9_n_0 ;
  wire \right_save_reg[16]_i_2_n_0 ;
  wire \right_save_reg[24]_i_2_n_0 ;
  wire [31:0]\right_save_reg[31] ;
  wire \right_save_reg[8]_i_2_n_0 ;
  wire running;
  wire running_i_6_n_0;
  wire running_reg;
  wire running_reg_0;
  wire [7:0]\NLW_out_remainder_reg[16]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_remainder_reg[24]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_out_remainder_reg[8]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_right_save_reg[16]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_right_save_reg[24]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_right_save_reg[8]_i_2_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'h0000000002008000)) 
    A_LUT_0_i_1
       (.I0(Q[0]),
        .I1(fsm_out[2]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(fsm_out[0]),
        .I5(comb_reg_done),
        .O(a[0]));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    A_LUT_0_i_1__0
       (.I0(Q[0]),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(idx_done),
        .O(\out_reg[2]_0 [0]));
  LUT5 #(
    .INIT(32'h10000000)) 
    A_LUT_0_i_2
       (.I0(idx_done),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[0]),
        .O(done_reg_1));
  LUT6 #(
    .INIT(64'h0000000002008000)) 
    B_LUT_1_i_1
       (.I0(Q[1]),
        .I1(fsm_out[2]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(fsm_out[0]),
        .I5(comb_reg_done),
        .O(a[1]));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    B_LUT_1_i_1__0
       (.I0(Q[1]),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(idx_done),
        .O(\out_reg[2]_0 [1]));
  LUT6 #(
    .INIT(64'h0000000002008000)) 
    C_LUT_2_i_1
       (.I0(Q[2]),
        .I1(fsm_out[2]),
        .I2(fsm_out[1]),
        .I3(go),
        .I4(fsm_out[0]),
        .I5(comb_reg_done),
        .O(a[2]));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    C_LUT_2_i_1__0
       (.I0(Q[2]),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(idx_done),
        .O(\out_reg[2]_0 [2]));
  LUT5 #(
    .INIT(32'h10000040)) 
    C_LUT_2_i_2
       (.I0(comb_reg_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[1]),
        .I4(fsm_out[2]),
        .O(b));
  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  LUT2 #(
    .INIT(4'hB)) 
    \acc[32]_i_1 
       (.I0(reset),
        .I1(running_reg),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h80)) 
    done_INST_0
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .O(done));
  LUT3 #(
    .INIT(8'h20)) 
    done_i_7
       (.I0(left_abs0[30]),
        .I1(done_reg),
        .I2(left_sign_reg[31]),
        .O(\out_reg[31] ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    left_sign_i_1
       (.I0(left_sign_reg[31]),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(fsm_out[0]),
        .I4(go),
        .I5(div_done),
        .O(div_left));
  LUT5 #(
    .INIT(32'hFFFFFFAB)) 
    \out[0]_i_1 
       (.I0(\out[0]_i_2_n_0 ),
        .I1(\out[2]_i_4_n_0 ),
        .I2(comb_reg_out),
        .I3(\out[0]_i_3_n_0 ),
        .I4(\out[1]_i_3_n_0 ),
        .O(fsm_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[0]_i_1__0 
       (.I0(out0[0]),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .O(carry_8[0]));
  LUT5 #(
    .INIT(32'h00000020)) 
    \out[0]_i_2 
       (.I0(idx_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .O(\out[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000080000000000)) 
    \out[0]_i_3 
       (.I0(out_rem_done),
        .I1(out_quot_done),
        .I2(fsm_out[0]),
        .I3(go),
        .I4(fsm_out[1]),
        .I5(fsm_out[2]),
        .O(\out[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[1]_i_1 
       (.I0(out0[1]),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .O(carry_8[1]));
  LUT3 #(
    .INIT(8'hEF)) 
    \out[1]_i_1__0 
       (.I0(\out[1]_i_2_n_0 ),
        .I1(\out[1]_i_3_n_0 ),
        .I2(\out[2]_i_4_n_0 ),
        .O(fsm_in[1]));
  LUT5 #(
    .INIT(32'h20000000)) 
    \out[1]_i_2 
       (.I0(idx_done),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(go),
        .I4(fsm_out[0]),
        .O(\out[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \out[1]_i_3 
       (.I0(comb_reg1_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .O(\out[1]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hFB)) 
    \out[2]_i_1 
       (.I0(\out[2]_i_3_n_0 ),
        .I1(\out[2]_i_4_n_0 ),
        .I2(\out[2]_i_5_n_0 ),
        .O(fsm_write_en));
  LUT5 #(
    .INIT(32'h00004010)) 
    \out[2]_i_1__0 
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(go),
        .I3(fsm_out[0]),
        .I4(idx_done),
        .O(E));
  LUT2 #(
    .INIT(4'hE)) 
    \out[2]_i_2 
       (.I0(\out[2]_i_6_n_0 ),
        .I1(\out[2]_i_5_n_0 ),
        .O(fsm_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \out[2]_i_2__0 
       (.I0(out0[2]),
        .I1(fsm_out[0]),
        .I2(fsm_out[2]),
        .O(carry_8[2]));
  LUT6 #(
    .INIT(64'hCC20C030CC200000)) 
    \out[2]_i_3 
       (.I0(comb_reg1_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(idx_done),
        .O(\out[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hBFF7FFFF)) 
    \out[2]_i_4 
       (.I0(fsm_out[0]),
        .I1(go),
        .I2(fsm_out[1]),
        .I3(fsm_out[2]),
        .I4(comb_reg_done),
        .O(\out[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF20000000)) 
    \out[2]_i_5 
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(fsm_out[0]),
        .I3(go),
        .I4(div_done),
        .I5(\out[0]_i_3_n_0 ),
        .O(\out[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00800000)) 
    \out[2]_i_6 
       (.I0(fsm_out[0]),
        .I1(go),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(idx_done),
        .I5(\out[2]_i_7_n_0 ),
        .O(\out[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0004000040000000)) 
    \out[2]_i_7 
       (.I0(comb_reg_out),
        .I1(comb_reg_done),
        .I2(fsm_out[2]),
        .I3(fsm_out[1]),
        .I4(go),
        .I5(fsm_out[0]),
        .O(\out[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h00100000)) 
    \out[31]_i_1 
       (.I0(comb_reg1_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .O(done_reg_0));
  LUT2 #(
    .INIT(4'h8)) 
    \out_quot_write_data[0]_INST_0 
       (.I0(out_rem_done_0),
        .I1(\out_quot_write_data[0] ),
        .O(out_quot_write_data));
  LUT6 #(
    .INIT(64'h0000070000000000)) 
    out_quot_write_en_INST_0
       (.I0(out_rem_done),
        .I1(out_quot_done),
        .I2(fsm_out[0]),
        .I3(go),
        .I4(fsm_out[1]),
        .I5(fsm_out[2]),
        .O(out_rem_done_0));
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
  LUT6 #(
    .INIT(64'hFFFFFFFFFBFFFFFF)) 
    \out_remainder[0]_i_2 
       (.I0(running),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(fsm_out[0]),
        .I4(go),
        .I5(div_done),
        .O(running_reg));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_10 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[9]),
        .O(\out_remainder[16]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_3 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[16]),
        .O(\out_remainder[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[15]),
        .O(\out_remainder[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_5 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[14]),
        .O(\out_remainder[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[13]),
        .O(\out_remainder[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[12]),
        .O(\out_remainder[16]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[11]),
        .O(\out_remainder[16]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[16]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[10]),
        .O(\out_remainder[16]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_10 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[17]),
        .O(\out_remainder[24]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_3 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[24]),
        .O(\out_remainder[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[23]),
        .O(\out_remainder[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_5 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[22]),
        .O(\out_remainder[24]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[21]),
        .O(\out_remainder[24]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[20]),
        .O(\out_remainder[24]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[19]),
        .O(\out_remainder[24]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[24]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[18]),
        .O(\out_remainder[24]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[31]_i_10 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[27]),
        .O(\out_remainder[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[31]_i_11 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[26]),
        .O(\out_remainder[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[31]_i_12 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[25]),
        .O(\out_remainder[31]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hFFBFFFFF)) 
    \out_remainder[31]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .O(done_reg));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[31]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[31]),
        .O(\out_remainder[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[31]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[30]),
        .O(\out_remainder[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[31]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[29]),
        .O(\out_remainder[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[31]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[28]),
        .O(\out_remainder[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_10 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[2]),
        .O(\out_remainder[8]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_11 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[1]),
        .O(\out_remainder[8]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDFFFFFFFFFFF)) 
    \out_remainder[8]_i_3 
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(fsm_out[0]),
        .I3(go),
        .I4(div_done),
        .I5(left_sign_reg[0]),
        .O(\out_remainder[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[8]),
        .O(\out_remainder[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_5 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[7]),
        .O(\out_remainder[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[6]),
        .O(\out_remainder[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[5]),
        .O(\out_remainder[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[4]),
        .O(\out_remainder[8]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \out_remainder[8]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(left_sign_reg[3]),
        .O(\out_remainder[8]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_remainder_reg[16]_i_2 
       (.CI(\out_remainder_reg[8]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_remainder_reg[16]_i_2_n_0 ,\NLW_out_remainder_reg[16]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(left_abs0[15:8]),
        .S({\out_remainder[16]_i_3_n_0 ,\out_remainder[16]_i_4_n_0 ,\out_remainder[16]_i_5_n_0 ,\out_remainder[16]_i_6_n_0 ,\out_remainder[16]_i_7_n_0 ,\out_remainder[16]_i_8_n_0 ,\out_remainder[16]_i_9_n_0 ,\out_remainder[16]_i_10_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_remainder_reg[24]_i_2 
       (.CI(\out_remainder_reg[16]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_remainder_reg[24]_i_2_n_0 ,\NLW_out_remainder_reg[24]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(left_abs0[23:16]),
        .S({\out_remainder[24]_i_3_n_0 ,\out_remainder[24]_i_4_n_0 ,\out_remainder[24]_i_5_n_0 ,\out_remainder[24]_i_6_n_0 ,\out_remainder[24]_i_7_n_0 ,\out_remainder[24]_i_8_n_0 ,\out_remainder[24]_i_9_n_0 ,\out_remainder[24]_i_10_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "RETARGET SWEEP" *) 
  CARRY8 \out_remainder_reg[31]_i_5 
       (.CI(\out_remainder_reg[24]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(left_abs0[30:24]),
        .S({\out_remainder[31]_i_6_n_0 ,\out_remainder[31]_i_7_n_0 ,\out_remainder[31]_i_8_n_0 ,\out_remainder[31]_i_9_n_0 ,\out_remainder[31]_i_10_n_0 ,\out_remainder[31]_i_11_n_0 ,\out_remainder[31]_i_12_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \out_remainder_reg[8]_i_2 
       (.CI(\out_remainder[8]_i_3_n_0 ),
        .CI_TOP(GND_2),
        .CO({\out_remainder_reg[8]_i_2_n_0 ,\NLW_out_remainder_reg[8]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(left_abs0[7:0]),
        .S({\out_remainder[8]_i_4_n_0 ,\out_remainder[8]_i_5_n_0 ,\out_remainder[8]_i_6_n_0 ,\out_remainder[8]_i_7_n_0 ,\out_remainder[8]_i_8_n_0 ,\out_remainder[8]_i_9_n_0 ,\out_remainder[8]_i_10_n_0 ,\out_remainder[8]_i_11_n_0 }));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \right_addr0[0]_INST_0 
       (.I0(comb_reg1_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(Q[0]),
        .O(left_addr0[0]));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \right_addr0[1]_INST_0 
       (.I0(comb_reg1_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(Q[1]),
        .O(left_addr0[1]));
  LUT6 #(
    .INIT(64'h0010000000000000)) 
    \right_addr0[2]_INST_0 
       (.I0(comb_reg1_done),
        .I1(fsm_out[0]),
        .I2(go),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(Q[2]),
        .O(left_addr0[2]));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_10 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [9]),
        .O(\right_save[16]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_3 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [16]),
        .O(\right_save[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [15]),
        .O(\right_save[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_5 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [14]),
        .O(\right_save[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [13]),
        .O(\right_save[16]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [12]),
        .O(\right_save[16]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [11]),
        .O(\right_save[16]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[16]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [10]),
        .O(\right_save[16]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_10 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [17]),
        .O(\right_save[24]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_3 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [24]),
        .O(\right_save[24]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [23]),
        .O(\right_save[24]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_5 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [22]),
        .O(\right_save[24]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [21]),
        .O(\right_save[24]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [20]),
        .O(\right_save[24]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [19]),
        .O(\right_save[24]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[24]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [18]),
        .O(\right_save[24]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \right_save[31]_i_1 
       (.I0(right_abs0[30]),
        .I1(done_reg),
        .I2(\right_save_reg[31] [31]),
        .O(D));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[31]_i_3 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [31]),
        .O(\right_save[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[31]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [30]),
        .O(\right_save[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[31]_i_5 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [29]),
        .O(\right_save[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[31]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [28]),
        .O(\right_save[31]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[31]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [27]),
        .O(\right_save[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[31]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [26]),
        .O(\right_save[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[31]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [25]),
        .O(\right_save[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_10 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [2]),
        .O(\right_save[8]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_11 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [1]),
        .O(\right_save[8]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_3 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [0]),
        .O(\right_save[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_4 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [8]),
        .O(\right_save[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_5 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [7]),
        .O(\right_save[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_6 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [6]),
        .O(\right_save[8]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_7 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [5]),
        .O(\right_save[8]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_8 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [4]),
        .O(\right_save[8]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFBFFFFFFFFFFFFF)) 
    \right_save[8]_i_9 
       (.I0(div_done),
        .I1(go),
        .I2(fsm_out[0]),
        .I3(fsm_out[2]),
        .I4(fsm_out[1]),
        .I5(\right_save_reg[31] [3]),
        .O(\right_save[8]_i_9_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \right_save_reg[16]_i_2 
       (.CI(\right_save_reg[8]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\right_save_reg[16]_i_2_n_0 ,\NLW_right_save_reg[16]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(right_abs0[15:8]),
        .S({\right_save[16]_i_3_n_0 ,\right_save[16]_i_4_n_0 ,\right_save[16]_i_5_n_0 ,\right_save[16]_i_6_n_0 ,\right_save[16]_i_7_n_0 ,\right_save[16]_i_8_n_0 ,\right_save[16]_i_9_n_0 ,\right_save[16]_i_10_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \right_save_reg[24]_i_2 
       (.CI(\right_save_reg[16]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .CO({\right_save_reg[24]_i_2_n_0 ,\NLW_right_save_reg[24]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(right_abs0[23:16]),
        .S({\right_save[24]_i_3_n_0 ,\right_save[24]_i_4_n_0 ,\right_save[24]_i_5_n_0 ,\right_save[24]_i_6_n_0 ,\right_save[24]_i_7_n_0 ,\right_save[24]_i_8_n_0 ,\right_save[24]_i_9_n_0 ,\right_save[24]_i_10_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "RETARGET SWEEP" *) 
  CARRY8 \right_save_reg[31]_i_2 
       (.CI(\right_save_reg[24]_i_2_n_0 ),
        .CI_TOP(GND_2),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(right_abs0[30:24]),
        .S({\right_save[31]_i_3_n_0 ,\right_save[31]_i_4_n_0 ,\right_save[31]_i_5_n_0 ,\right_save[31]_i_6_n_0 ,\right_save[31]_i_7_n_0 ,\right_save[31]_i_8_n_0 ,\right_save[31]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 \right_save_reg[8]_i_2 
       (.CI(\right_save[8]_i_3_n_0 ),
        .CI_TOP(GND_2),
        .CO({\right_save_reg[8]_i_2_n_0 ,\NLW_right_save_reg[8]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(right_abs0[7:0]),
        .S({\right_save[8]_i_4_n_0 ,\right_save[8]_i_5_n_0 ,\right_save[8]_i_6_n_0 ,\right_save[8]_i_7_n_0 ,\right_save[8]_i_8_n_0 ,\right_save[8]_i_9_n_0 ,\right_save[8]_i_10_n_0 ,\right_save[8]_i_11_n_0 }));
  LUT5 #(
    .INIT(32'h00002000)) 
    right_sign_i_1
       (.I0(fsm_out[1]),
        .I1(fsm_out[2]),
        .I2(fsm_out[0]),
        .I3(go),
        .I4(div_done),
        .O(\out_reg[1]_0 ));
  LUT3 #(
    .INIT(8'h0D)) 
    running_i_2
       (.I0(running_reg),
        .I1(running),
        .I2(reset),
        .O(running_reg_0));
  LUT6 #(
    .INIT(64'hFFFFFFFCFFFAFFFA)) 
    running_i_5
       (.I0(running_i_6_n_0),
        .I1(left_abs0[5]),
        .I2(left_sign_reg[0]),
        .I3(running_reg),
        .I4(left_abs0[30]),
        .I5(div_left),
        .O(\out_reg[0]_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    running_i_6
       (.I0(left_sign_reg[6]),
        .I1(fsm_out[1]),
        .I2(fsm_out[2]),
        .I3(fsm_out[0]),
        .I4(go),
        .I5(div_done),
        .O(running_i_6_n_0));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg_1
   (idx_done,
    out_rem_addr0,
    Q,
    reset,
    E,
    clk,
    .out_rem_addr0_2_sp_1(out_rem_addr0_2_sn_1),
    D);
  output idx_done;
  output [2:0]out_rem_addr0;
  output [2:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input [2:0]D;
  input out_rem_addr0_2_sn_1;

  wire \<const1> ;
  wire [2:0]D;
  wire [0:0]E;
  wire [2:0]Q;
  wire clk;
  wire idx_done;
  wire [2:0]out_rem_addr0;
  wire out_rem_addr0_2_sn_1;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(idx_done),
        .R(reset));
  LUT2 #(
    .INIT(4'h8)) 
    \out_quot_addr0[0]_INST_0 
       (.I0(Q[0]),
        .I1(out_rem_addr0_2_sn_1),
        .O(out_rem_addr0[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_quot_addr0[1]_INST_0 
       (.I0(Q[1]),
        .I1(out_rem_addr0_2_sn_1),
        .O(out_rem_addr0[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \out_quot_addr0[2]_INST_0 
       (.I0(Q[2]),
        .I1(out_rem_addr0_2_sn_1),
        .O(out_rem_addr0[2]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(D[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(D[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(D[2]),
        .Q(Q[2]),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (comb_reg_done,
    comb_reg_out,
    reset,
    b,
    clk,
    \out_reg[0]_0 );
  output comb_reg_done;
  output comb_reg_out;
  input reset;
  input [0:0]b;
  input clk;
  input \out_reg[0]_0 ;

  wire \<const1> ;
  wire [0:0]b;
  wire clk;
  wire comb_reg_done;
  wire comb_reg_out;
  wire \out_reg[0]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(b),
        .Q(comb_reg_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out_reg[0]_0 ),
        .Q(comb_reg_out),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1
   (comb_reg1_done,
    running_reg,
    done0,
    Q,
    reset,
    E,
    clk,
    running_reg_0,
    running_reg_1,
    left_abs0,
    done_i_4_0,
    running_reg_2,
    done_reg_0,
    done_reg_1,
    left_read_data);
  output comb_reg1_done;
  output running_reg;
  output done0;
  output [31:0]Q;
  input reset;
  input [0:0]E;
  input clk;
  input running_reg_0;
  input running_reg_1;
  input [29:0]left_abs0;
  input done_i_4_0;
  input running_reg_2;
  input done_reg_0;
  input done_reg_1;
  input [31:0]left_read_data;

  wire \<const1> ;
  wire [0:0]E;
  wire [31:0]Q;
  wire clk;
  wire comb_reg1_done;
  wire done0;
  wire done_i_10_n_0;
  wire done_i_11_n_0;
  wire done_i_12_n_0;
  wire done_i_13_n_0;
  wire done_i_14_n_0;
  wire done_i_15_n_0;
  wire done_i_16_n_0;
  wire done_i_17_n_0;
  wire done_i_18_n_0;
  wire done_i_19_n_0;
  wire done_i_20_n_0;
  wire done_i_21_n_0;
  wire done_i_22_n_0;
  wire done_i_23_n_0;
  wire done_i_24_n_0;
  wire done_i_25_n_0;
  wire done_i_26_n_0;
  wire done_i_27_n_0;
  wire done_i_28_n_0;
  wire done_i_29_n_0;
  wire done_i_2_n_0;
  wire done_i_30_n_0;
  wire done_i_31_n_0;
  wire done_i_32_n_0;
  wire done_i_3_n_0;
  wire done_i_4_0;
  wire done_i_4_n_0;
  wire done_i_5_n_0;
  wire done_i_6_n_0;
  wire done_i_8_n_0;
  wire done_i_9_n_0;
  wire done_reg_0;
  wire done_reg_1;
  wire [29:0]left_abs0;
  wire [31:0]left_read_data;
  wire reset;
  wire running_i_3_n_0;
  wire running_i_4_n_0;
  wire running_reg;
  wire running_reg_0;
  wire running_reg_1;
  wire running_reg_2;

  VCC VCC
       (.P(\<const1> ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAABAAAA)) 
    done_i_1
       (.I0(running_reg_1),
        .I1(done_i_2_n_0),
        .I2(done_i_3_n_0),
        .I3(done_i_4_n_0),
        .I4(done_i_5_n_0),
        .I5(done_i_6_n_0),
        .O(done0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_10
       (.I0(left_abs0[11]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[12]),
        .O(done_i_10_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_11
       (.I0(left_abs0[15]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[16]),
        .O(done_i_11_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_12
       (.I0(left_abs0[7]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[8]),
        .O(done_i_12_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_13
       (.I0(left_abs0[17]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[18]),
        .O(done_i_13_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_14
       (.I0(left_abs0[10]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[11]),
        .O(done_i_14_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_15
       (.I0(left_abs0[27]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[28]),
        .O(done_i_15_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_16
       (.I0(left_abs0[18]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[19]),
        .O(done_i_16_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_17
       (.I0(left_abs0[3]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[4]),
        .O(done_i_17_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_18
       (.I0(left_abs0[28]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[29]),
        .O(done_i_18_n_0));
  LUT6 #(
    .INIT(64'h00FF00FA00CC00FA)) 
    done_i_19
       (.I0(Q[10]),
        .I1(left_abs0[9]),
        .I2(Q[2]),
        .I3(done_i_4_0),
        .I4(Q[31]),
        .I5(left_abs0[1]),
        .O(done_i_19_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    done_i_2
       (.I0(done_reg_0),
        .I1(done_reg_1),
        .I2(Q[0]),
        .I3(done_i_8_n_0),
        .I4(done_i_9_n_0),
        .I5(done_i_10_n_0),
        .O(done_i_2_n_0));
  LUT6 #(
    .INIT(64'h00FF00FA00CC00FA)) 
    done_i_20
       (.I0(Q[3]),
        .I1(left_abs0[2]),
        .I2(Q[27]),
        .I3(done_i_4_0),
        .I4(Q[31]),
        .I5(left_abs0[26]),
        .O(done_i_20_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_21
       (.I0(left_abs0[20]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[21]),
        .O(done_i_21_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_22
       (.I0(left_abs0[25]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[26]),
        .O(done_i_22_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_23
       (.I0(left_abs0[0]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[1]),
        .O(done_i_23_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_24
       (.I0(left_abs0[22]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[23]),
        .O(done_i_24_n_0));
  LUT6 #(
    .INIT(64'h00FF00FA00CC00FA)) 
    done_i_25
       (.I0(Q[24]),
        .I1(left_abs0[23]),
        .I2(Q[17]),
        .I3(done_i_4_0),
        .I4(Q[31]),
        .I5(left_abs0[16]),
        .O(done_i_25_n_0));
  LUT6 #(
    .INIT(64'h00FF00FA00CC00FA)) 
    done_i_26
       (.I0(Q[7]),
        .I1(left_abs0[6]),
        .I2(Q[13]),
        .I3(done_i_4_0),
        .I4(Q[31]),
        .I5(left_abs0[12]),
        .O(done_i_26_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_27
       (.I0(left_abs0[13]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[14]),
        .O(done_i_27_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_28
       (.I0(left_abs0[4]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[5]),
        .O(done_i_28_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_29
       (.I0(left_abs0[21]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[22]),
        .O(done_i_29_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    done_i_3
       (.I0(done_i_11_n_0),
        .I1(done_i_12_n_0),
        .I2(done_i_13_n_0),
        .I3(done_i_14_n_0),
        .O(done_i_3_n_0));
  LUT6 #(
    .INIT(64'h00FF00FA00CC00FA)) 
    done_i_30
       (.I0(Q[15]),
        .I1(left_abs0[14]),
        .I2(Q[9]),
        .I3(done_i_4_0),
        .I4(Q[31]),
        .I5(left_abs0[8]),
        .O(done_i_30_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_31
       (.I0(left_abs0[24]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[25]),
        .O(done_i_31_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_32
       (.I0(left_abs0[19]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[20]),
        .O(done_i_32_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    done_i_4
       (.I0(done_i_15_n_0),
        .I1(done_i_16_n_0),
        .I2(done_i_17_n_0),
        .I3(done_i_18_n_0),
        .I4(done_i_19_n_0),
        .I5(done_i_20_n_0),
        .O(done_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    done_i_5
       (.I0(done_i_21_n_0),
        .I1(done_i_22_n_0),
        .I2(done_i_23_n_0),
        .I3(done_i_24_n_0),
        .I4(done_i_25_n_0),
        .I5(done_i_26_n_0),
        .O(done_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    done_i_6
       (.I0(done_i_27_n_0),
        .I1(done_i_28_n_0),
        .I2(done_i_29_n_0),
        .I3(done_i_30_n_0),
        .I4(done_i_31_n_0),
        .I5(done_i_32_n_0),
        .O(done_i_6_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_8
       (.I0(left_abs0[5]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[6]),
        .O(done_i_8_n_0));
  LUT4 #(
    .INIT(16'h0B08)) 
    done_i_9
       (.I0(left_abs0[29]),
        .I1(Q[31]),
        .I2(done_i_4_0),
        .I3(Q[30]),
        .O(done_i_9_n_0));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(E),
        .Q(comb_reg1_done),
        .R(reset));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[0]),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[10]),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[11]),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[12]),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[13]),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[14]),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[15]),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[16]),
        .Q(Q[16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[17]),
        .Q(Q[17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[18]),
        .Q(Q[18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[19]),
        .Q(Q[19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[1]),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[20]),
        .Q(Q[20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[21]),
        .Q(Q[21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[22]),
        .Q(Q[22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[23]),
        .Q(Q[23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[24]),
        .Q(Q[24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[25]),
        .Q(Q[25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[26]),
        .Q(Q[26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[27]),
        .Q(Q[27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[28]),
        .Q(Q[28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[29]),
        .Q(Q[29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[2]),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[30]),
        .Q(Q[30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[31]),
        .Q(Q[31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[3]),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[4]),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[5]),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[6]),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[7]),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[8]),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(left_read_data[9]),
        .Q(Q[9]),
        .R(reset));
  LUT6 #(
    .INIT(64'h00000000AAAAAA8A)) 
    running_i_1
       (.I0(running_reg_0),
        .I1(done_i_6_n_0),
        .I2(done_i_5_n_0),
        .I3(done_i_4_n_0),
        .I4(running_i_3_n_0),
        .I5(running_reg_1),
        .O(running_reg));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    running_i_3
       (.I0(done_i_14_n_0),
        .I1(done_i_13_n_0),
        .I2(done_i_12_n_0),
        .I3(done_i_11_n_0),
        .I4(running_i_4_n_0),
        .I5(running_reg_2),
        .O(running_i_3_n_0));
  LUT6 #(
    .INIT(64'h00FF00FA00CC00FA)) 
    running_i_4
       (.I0(Q[12]),
        .I1(left_abs0[11]),
        .I2(Q[30]),
        .I3(done_i_4_0),
        .I4(Q[31]),
        .I5(left_abs0[29]),
        .O(running_i_4_n_0));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized1_0
   (DI,
    right_abs,
    \out_reg[31]_0 ,
    S,
    \acc_reg[30] ,
    \out_reg[31]_1 ,
    \out_reg[31]_2 ,
    \out_remainder_reg[15] ,
    \out_remainder_reg[14] ,
    \out_reg[31]_3 ,
    \out_reg[31]_4 ,
    \acc_reg[23] ,
    \out_reg[31]_5 ,
    \out_reg[31]_6 ,
    \out_remainder_reg[15]_0 ,
    \acc_reg[15] ,
    \out_remainder_reg[7] ,
    \acc_reg[7] ,
    Q,
    \right_save_reg[30] ,
    right_abs0,
    quotient_next1_carry__0,
    reset,
    E,
    right_read_data,
    clk);
  output [0:0]DI;
  output [29:0]right_abs;
  output [31:0]\out_reg[31]_0 ;
  output [7:0]S;
  output [0:0]\acc_reg[30] ;
  output [7:0]\out_reg[31]_1 ;
  output \out_reg[31]_2 ;
  output [6:0]\out_remainder_reg[15] ;
  output [7:0]\out_remainder_reg[14] ;
  output [7:0]\out_reg[31]_3 ;
  output [7:0]\out_reg[31]_4 ;
  output [7:0]\acc_reg[23] ;
  output [6:0]\out_reg[31]_5 ;
  output [6:0]\out_reg[31]_6 ;
  output [7:0]\out_remainder_reg[15]_0 ;
  output [7:0]\acc_reg[15] ;
  output [6:0]\out_remainder_reg[7] ;
  output [7:0]\acc_reg[7] ;
  input [31:0]Q;
  input \right_save_reg[30] ;
  input [30:0]right_abs0;
  input [31:0]quotient_next1_carry__0;
  input reset;
  input [0:0]E;
  input [31:0]right_read_data;
  input clk;

  wire [0:0]DI;
  wire [0:0]E;
  wire [31:0]Q;
  wire [7:0]S;
  wire [7:0]\acc_reg[15] ;
  wire [7:0]\acc_reg[23] ;
  wire [0:0]\acc_reg[30] ;
  wire [7:0]\acc_reg[7] ;
  wire clk;
  wire i__carry__0_i_18_n_0;
  wire i__carry__0_i_19_n_0;
  wire i__carry__0_i_20_n_0;
  wire i__carry__0_i_21_n_0;
  wire i__carry__0_i_22_n_0;
  wire i__carry__0_i_23_n_0;
  wire i__carry__0_i_24_n_0;
  wire [31:0]\out_reg[31]_0 ;
  wire [7:0]\out_reg[31]_1 ;
  wire \out_reg[31]_2 ;
  wire [7:0]\out_reg[31]_3 ;
  wire [7:0]\out_reg[31]_4 ;
  wire [6:0]\out_reg[31]_5 ;
  wire [6:0]\out_reg[31]_6 ;
  wire [7:0]\out_remainder_reg[14] ;
  wire [6:0]\out_remainder_reg[15] ;
  wire [7:0]\out_remainder_reg[15]_0 ;
  wire [6:0]\out_remainder_reg[7] ;
  wire [31:0]quotient_next1_carry__0;
  wire quotient_next1_carry__0_i_17_n_0;
  wire quotient_next1_carry__0_i_18_n_0;
  wire quotient_next1_carry__0_i_19_n_0;
  wire quotient_next1_carry__0_i_20_n_0;
  wire quotient_next1_carry__0_i_21_n_0;
  wire quotient_next1_carry__0_i_22_n_0;
  wire quotient_next1_carry__0_i_23_n_0;
  wire quotient_next1_carry_i_17_n_0;
  wire quotient_next1_carry_i_18_n_0;
  wire quotient_next1_carry_i_19_n_0;
  wire quotient_next1_carry_i_20_n_0;
  wire quotient_next1_carry_i_21_n_0;
  wire quotient_next1_carry_i_22_n_0;
  wire quotient_next1_carry_i_23_n_0;
  wire reset;
  wire [29:0]right_abs;
  wire [30:0]right_abs0;
  wire [31:0]right_read_data;
  wire \right_save_reg[30] ;

  LUT6 #(
    .INIT(64'hF4F440F4F4F4F4F4)) 
    i__carry__0_i_1
       (.I0(right_abs[29]),
        .I1(Q[30]),
        .I2(Q[31]),
        .I3(\out_reg[31]_0 [31]),
        .I4(\right_save_reg[30] ),
        .I5(right_abs0[30]),
        .O(DI));
  LUT6 #(
    .INIT(64'h000000000B08F4F7)) 
    i__carry__0_i_10
       (.I0(right_abs0[27]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [28]),
        .I4(Q[28]),
        .I5(i__carry__0_i_18_n_0),
        .O(S[6]));
  LUT6 #(
    .INIT(64'h000000000B08F4F7)) 
    i__carry__0_i_11
       (.I0(right_abs0[25]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [26]),
        .I4(Q[26]),
        .I5(i__carry__0_i_19_n_0),
        .O(S[5]));
  LUT6 #(
    .INIT(64'h000000000B08F4F7)) 
    i__carry__0_i_12
       (.I0(right_abs0[23]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [24]),
        .I4(Q[24]),
        .I5(i__carry__0_i_20_n_0),
        .O(S[4]));
  LUT6 #(
    .INIT(64'h000000000B08F4F7)) 
    i__carry__0_i_13
       (.I0(right_abs0[21]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [22]),
        .I4(Q[22]),
        .I5(i__carry__0_i_21_n_0),
        .O(S[3]));
  LUT6 #(
    .INIT(64'h000000000B08F4F7)) 
    i__carry__0_i_14
       (.I0(right_abs0[19]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [20]),
        .I4(Q[20]),
        .I5(i__carry__0_i_22_n_0),
        .O(S[2]));
  LUT6 #(
    .INIT(64'h000000000B08F4F7)) 
    i__carry__0_i_15
       (.I0(right_abs0[17]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [18]),
        .I4(Q[18]),
        .I5(i__carry__0_i_23_n_0),
        .O(S[1]));
  LUT6 #(
    .INIT(64'h000000000B08F4F7)) 
    i__carry__0_i_16
       (.I0(right_abs0[15]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [16]),
        .I4(Q[16]),
        .I5(i__carry__0_i_24_n_0),
        .O(S[0]));
  LUT4 #(
    .INIT(16'h0B08)) 
    i__carry__0_i_17
       (.I0(right_abs0[19]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [20]),
        .O(\out_reg[31]_2 ));
  LUT5 #(
    .INIT(32'hA5A6AAA6)) 
    i__carry__0_i_18
       (.I0(Q[29]),
        .I1(\out_reg[31]_0 [29]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[28]),
        .O(i__carry__0_i_18_n_0));
  LUT5 #(
    .INIT(32'hA5A6AAA6)) 
    i__carry__0_i_19
       (.I0(Q[27]),
        .I1(\out_reg[31]_0 [27]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[26]),
        .O(i__carry__0_i_19_n_0));
  LUT5 #(
    .INIT(32'hA5A6AAA6)) 
    i__carry__0_i_20
       (.I0(Q[25]),
        .I1(\out_reg[31]_0 [25]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[24]),
        .O(i__carry__0_i_20_n_0));
  LUT5 #(
    .INIT(32'hA5A6AAA6)) 
    i__carry__0_i_21
       (.I0(Q[23]),
        .I1(\out_reg[31]_0 [23]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[22]),
        .O(i__carry__0_i_21_n_0));
  LUT5 #(
    .INIT(32'hA5A6AAA6)) 
    i__carry__0_i_22
       (.I0(Q[21]),
        .I1(\out_reg[31]_0 [21]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[20]),
        .O(i__carry__0_i_22_n_0));
  LUT5 #(
    .INIT(32'hA5A6AAA6)) 
    i__carry__0_i_23
       (.I0(Q[19]),
        .I1(\out_reg[31]_0 [19]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[18]),
        .O(i__carry__0_i_23_n_0));
  LUT5 #(
    .INIT(32'hA5A6AAA6)) 
    i__carry__0_i_24
       (.I0(Q[17]),
        .I1(\out_reg[31]_0 [17]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[16]),
        .O(i__carry__0_i_24_n_0));
  LUT6 #(
    .INIT(64'h20DF0000000020DF)) 
    i__carry__0_i_9
       (.I0(right_abs0[30]),
        .I1(\right_save_reg[30] ),
        .I2(\out_reg[31]_0 [31]),
        .I3(Q[31]),
        .I4(right_abs[29]),
        .I5(Q[30]),
        .O(S[7]));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_1
       (.I0(right_abs[14]),
        .I1(Q[15]),
        .I2(Q[14]),
        .I3(right_abs[13]),
        .O(\out_remainder_reg[15] [6]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_10
       (.I0(right_abs[11]),
        .I1(Q[12]),
        .I2(Q[13]),
        .I3(right_abs[12]),
        .O(\out_remainder_reg[14] [6]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_11
       (.I0(right_abs[9]),
        .I1(Q[10]),
        .I2(Q[11]),
        .I3(right_abs[10]),
        .O(\out_remainder_reg[14] [5]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_12
       (.I0(right_abs[7]),
        .I1(Q[8]),
        .I2(Q[9]),
        .I3(right_abs[8]),
        .O(\out_remainder_reg[14] [4]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_13
       (.I0(right_abs[5]),
        .I1(Q[6]),
        .I2(Q[7]),
        .I3(right_abs[6]),
        .O(\out_remainder_reg[14] [3]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_14
       (.I0(right_abs[3]),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(right_abs[4]),
        .O(\out_remainder_reg[14] [2]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_15
       (.I0(right_abs[1]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(right_abs[2]),
        .O(\out_remainder_reg[14] [1]));
  LUT5 #(
    .INIT(32'h09900909)) 
    i__carry_i_16
       (.I0(right_abs[0]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [0]),
        .O(\out_remainder_reg[14] [0]));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_2
       (.I0(right_abs[12]),
        .I1(Q[13]),
        .I2(Q[12]),
        .I3(right_abs[11]),
        .O(\out_remainder_reg[15] [5]));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_3
       (.I0(right_abs[10]),
        .I1(Q[11]),
        .I2(Q[10]),
        .I3(right_abs[9]),
        .O(\out_remainder_reg[15] [4]));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_4
       (.I0(right_abs[8]),
        .I1(Q[9]),
        .I2(Q[8]),
        .I3(right_abs[7]),
        .O(\out_remainder_reg[15] [3]));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_5
       (.I0(right_abs[6]),
        .I1(Q[7]),
        .I2(Q[6]),
        .I3(right_abs[5]),
        .O(\out_remainder_reg[15] [2]));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_6
       (.I0(right_abs[4]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(right_abs[3]),
        .O(\out_remainder_reg[15] [1]));
  LUT4 #(
    .INIT(16'h44D4)) 
    i__carry_i_7
       (.I0(right_abs[2]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(right_abs[1]),
        .O(\out_remainder_reg[15] [0]));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_9
       (.I0(right_abs[13]),
        .I1(Q[14]),
        .I2(Q[15]),
        .I3(right_abs[14]),
        .O(\out_remainder_reg[14] [7]));
  FDRE \out_reg[0] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[0]),
        .Q(\out_reg[31]_0 [0]),
        .R(reset));
  FDRE \out_reg[10] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[10]),
        .Q(\out_reg[31]_0 [10]),
        .R(reset));
  FDRE \out_reg[11] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[11]),
        .Q(\out_reg[31]_0 [11]),
        .R(reset));
  FDRE \out_reg[12] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[12]),
        .Q(\out_reg[31]_0 [12]),
        .R(reset));
  FDRE \out_reg[13] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[13]),
        .Q(\out_reg[31]_0 [13]),
        .R(reset));
  FDRE \out_reg[14] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[14]),
        .Q(\out_reg[31]_0 [14]),
        .R(reset));
  FDRE \out_reg[15] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[15]),
        .Q(\out_reg[31]_0 [15]),
        .R(reset));
  FDRE \out_reg[16] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[16]),
        .Q(\out_reg[31]_0 [16]),
        .R(reset));
  FDRE \out_reg[17] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[17]),
        .Q(\out_reg[31]_0 [17]),
        .R(reset));
  FDRE \out_reg[18] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[18]),
        .Q(\out_reg[31]_0 [18]),
        .R(reset));
  FDRE \out_reg[19] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[19]),
        .Q(\out_reg[31]_0 [19]),
        .R(reset));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[1]),
        .Q(\out_reg[31]_0 [1]),
        .R(reset));
  FDRE \out_reg[20] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[20]),
        .Q(\out_reg[31]_0 [20]),
        .R(reset));
  FDRE \out_reg[21] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[21]),
        .Q(\out_reg[31]_0 [21]),
        .R(reset));
  FDRE \out_reg[22] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[22]),
        .Q(\out_reg[31]_0 [22]),
        .R(reset));
  FDRE \out_reg[23] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[23]),
        .Q(\out_reg[31]_0 [23]),
        .R(reset));
  FDRE \out_reg[24] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[24]),
        .Q(\out_reg[31]_0 [24]),
        .R(reset));
  FDRE \out_reg[25] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[25]),
        .Q(\out_reg[31]_0 [25]),
        .R(reset));
  FDRE \out_reg[26] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[26]),
        .Q(\out_reg[31]_0 [26]),
        .R(reset));
  FDRE \out_reg[27] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[27]),
        .Q(\out_reg[31]_0 [27]),
        .R(reset));
  FDRE \out_reg[28] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[28]),
        .Q(\out_reg[31]_0 [28]),
        .R(reset));
  FDRE \out_reg[29] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[29]),
        .Q(\out_reg[31]_0 [29]),
        .R(reset));
  FDRE \out_reg[2] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[2]),
        .Q(\out_reg[31]_0 [2]),
        .R(reset));
  FDRE \out_reg[30] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[30]),
        .Q(\out_reg[31]_0 [30]),
        .R(reset));
  FDRE \out_reg[31] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[31]),
        .Q(\out_reg[31]_0 [31]),
        .R(reset));
  FDRE \out_reg[3] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[3]),
        .Q(\out_reg[31]_0 [3]),
        .R(reset));
  FDRE \out_reg[4] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[4]),
        .Q(\out_reg[31]_0 [4]),
        .R(reset));
  FDRE \out_reg[5] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[5]),
        .Q(\out_reg[31]_0 [5]),
        .R(reset));
  FDRE \out_reg[6] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[6]),
        .Q(\out_reg[31]_0 [6]),
        .R(reset));
  FDRE \out_reg[7] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[7]),
        .Q(\out_reg[31]_0 [7]),
        .R(reset));
  FDRE \out_reg[8] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[8]),
        .Q(\out_reg[31]_0 [8]),
        .R(reset));
  FDRE \out_reg[9] 
       (.C(clk),
        .CE(E),
        .D(right_read_data[9]),
        .Q(\out_reg[31]_0 [9]),
        .R(reset));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_1
       (.I0(Q[15]),
        .I1(\out_reg[31]_0 [15]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[14]),
        .O(\out_remainder_reg[15]_0 [7]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_2
       (.I0(Q[14]),
        .I1(\out_reg[31]_0 [14]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[13]),
        .O(\out_remainder_reg[15]_0 [6]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_3
       (.I0(Q[13]),
        .I1(\out_reg[31]_0 [13]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[12]),
        .O(\out_remainder_reg[15]_0 [5]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_4
       (.I0(Q[12]),
        .I1(\out_reg[31]_0 [12]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[11]),
        .O(\out_remainder_reg[15]_0 [4]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_5
       (.I0(Q[11]),
        .I1(\out_reg[31]_0 [11]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[10]),
        .O(\out_remainder_reg[15]_0 [3]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_6
       (.I0(Q[10]),
        .I1(\out_reg[31]_0 [10]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[9]),
        .O(\out_remainder_reg[15]_0 [2]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_7
       (.I0(Q[9]),
        .I1(\out_reg[31]_0 [9]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[8]),
        .O(\out_remainder_reg[15]_0 [1]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__0_i_8
       (.I0(Q[8]),
        .I1(\out_reg[31]_0 [8]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[7]),
        .O(\out_remainder_reg[15]_0 [0]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__1_i_1
       (.I0(right_abs0[22]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [23]),
        .I4(Q[23]),
        .O(\out_reg[31]_4 [7]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__1_i_2
       (.I0(Q[22]),
        .I1(\out_reg[31]_0 [22]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[21]),
        .O(\out_reg[31]_4 [6]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__1_i_3
       (.I0(right_abs0[20]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [21]),
        .I4(Q[21]),
        .O(\out_reg[31]_4 [5]));
  LUT5 #(
    .INIT(32'h595A5955)) 
    out_remainder0_carry__1_i_4
       (.I0(Q[20]),
        .I1(right_abs0[19]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(\out_reg[31]_0 [20]),
        .O(\out_reg[31]_4 [4]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__1_i_5
       (.I0(right_abs0[18]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [19]),
        .I4(Q[19]),
        .O(\out_reg[31]_4 [3]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__1_i_6
       (.I0(Q[18]),
        .I1(\out_reg[31]_0 [18]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[17]),
        .O(\out_reg[31]_4 [2]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__1_i_7
       (.I0(right_abs0[16]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [17]),
        .I4(Q[17]),
        .O(\out_reg[31]_4 [1]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__1_i_8
       (.I0(Q[16]),
        .I1(\out_reg[31]_0 [16]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[15]),
        .O(\out_reg[31]_4 [0]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__2_i_2
       (.I0(right_abs0[29]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [30]),
        .I4(Q[30]),
        .O(\out_reg[31]_5 [6]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__2_i_3
       (.I0(right_abs0[28]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [29]),
        .I4(Q[29]),
        .O(\out_reg[31]_5 [5]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__2_i_4
       (.I0(Q[28]),
        .I1(\out_reg[31]_0 [28]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[27]),
        .O(\out_reg[31]_5 [4]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__2_i_5
       (.I0(right_abs0[26]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [27]),
        .I4(Q[27]),
        .O(\out_reg[31]_5 [3]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__2_i_6
       (.I0(Q[26]),
        .I1(\out_reg[31]_0 [26]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[25]),
        .O(\out_reg[31]_5 [2]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    out_remainder0_carry__2_i_7
       (.I0(right_abs0[24]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [25]),
        .I4(Q[25]),
        .O(\out_reg[31]_5 [1]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry__2_i_8
       (.I0(Q[24]),
        .I1(\out_reg[31]_0 [24]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[23]),
        .O(\out_reg[31]_5 [0]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry_i_1
       (.I0(Q[7]),
        .I1(\out_reg[31]_0 [7]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[6]),
        .O(\out_remainder_reg[7] [6]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry_i_2
       (.I0(Q[6]),
        .I1(\out_reg[31]_0 [6]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[5]),
        .O(\out_remainder_reg[7] [5]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry_i_3
       (.I0(Q[5]),
        .I1(\out_reg[31]_0 [5]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[4]),
        .O(\out_remainder_reg[7] [4]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry_i_4
       (.I0(Q[4]),
        .I1(\out_reg[31]_0 [4]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[3]),
        .O(\out_remainder_reg[7] [3]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry_i_5
       (.I0(Q[3]),
        .I1(\out_reg[31]_0 [3]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[2]),
        .O(\out_remainder_reg[7] [2]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry_i_6
       (.I0(Q[2]),
        .I1(\out_reg[31]_0 [2]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[1]),
        .O(\out_remainder_reg[7] [1]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    out_remainder0_carry_i_7
       (.I0(Q[1]),
        .I1(\out_reg[31]_0 [1]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[0]),
        .O(\out_remainder_reg[7] [0]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__0_i_1
       (.I0(quotient_next1_carry__0[15]),
        .I1(\out_reg[31]_0 [15]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[14]),
        .O(\acc_reg[15] [7]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__0_i_2
       (.I0(right_abs0[13]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [14]),
        .I4(quotient_next1_carry__0[14]),
        .O(\acc_reg[15] [6]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__0_i_3
       (.I0(quotient_next1_carry__0[13]),
        .I1(\out_reg[31]_0 [13]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[12]),
        .O(\acc_reg[15] [5]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__0_i_4
       (.I0(right_abs0[11]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [12]),
        .I4(quotient_next1_carry__0[12]),
        .O(\acc_reg[15] [4]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__0_i_5
       (.I0(quotient_next1_carry__0[11]),
        .I1(\out_reg[31]_0 [11]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[10]),
        .O(\acc_reg[15] [3]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__0_i_6
       (.I0(right_abs0[9]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [10]),
        .I4(quotient_next1_carry__0[10]),
        .O(\acc_reg[15] [2]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__0_i_7
       (.I0(quotient_next1_carry__0[9]),
        .I1(\out_reg[31]_0 [9]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[8]),
        .O(\acc_reg[15] [1]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__0_i_8
       (.I0(right_abs0[7]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [8]),
        .I4(quotient_next1_carry__0[8]),
        .O(\acc_reg[15] [0]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__1_i_1
       (.I0(quotient_next1_carry__0[23]),
        .I1(\out_reg[31]_0 [23]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[22]),
        .O(\acc_reg[23] [7]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__1_i_2
       (.I0(right_abs0[21]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [22]),
        .I4(quotient_next1_carry__0[22]),
        .O(\acc_reg[23] [6]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__1_i_3
       (.I0(quotient_next1_carry__0[21]),
        .I1(\out_reg[31]_0 [21]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[20]),
        .O(\acc_reg[23] [5]));
  LUT5 #(
    .INIT(32'h595A5955)) 
    quotient_next0_carry__1_i_4
       (.I0(quotient_next1_carry__0[20]),
        .I1(right_abs0[19]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(\out_reg[31]_0 [20]),
        .O(\acc_reg[23] [4]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__1_i_5
       (.I0(quotient_next1_carry__0[19]),
        .I1(\out_reg[31]_0 [19]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[18]),
        .O(\acc_reg[23] [3]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__1_i_6
       (.I0(right_abs0[17]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [18]),
        .I4(quotient_next1_carry__0[18]),
        .O(\acc_reg[23] [2]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__1_i_7
       (.I0(quotient_next1_carry__0[17]),
        .I1(\out_reg[31]_0 [17]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[16]),
        .O(\acc_reg[23] [1]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__1_i_8
       (.I0(right_abs0[15]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [16]),
        .I4(quotient_next1_carry__0[16]),
        .O(\acc_reg[23] [0]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__2_i_2
       (.I0(right_abs0[29]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [30]),
        .I4(quotient_next1_carry__0[30]),
        .O(\out_reg[31]_6 [6]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__2_i_3
       (.I0(quotient_next1_carry__0[29]),
        .I1(\out_reg[31]_0 [29]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[28]),
        .O(\out_reg[31]_6 [5]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__2_i_4
       (.I0(right_abs0[27]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [28]),
        .I4(quotient_next1_carry__0[28]),
        .O(\out_reg[31]_6 [4]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__2_i_5
       (.I0(quotient_next1_carry__0[27]),
        .I1(\out_reg[31]_0 [27]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[26]),
        .O(\out_reg[31]_6 [3]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__2_i_6
       (.I0(right_abs0[25]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [26]),
        .I4(quotient_next1_carry__0[26]),
        .O(\out_reg[31]_6 [2]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry__2_i_7
       (.I0(quotient_next1_carry__0[25]),
        .I1(\out_reg[31]_0 [25]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[24]),
        .O(\out_reg[31]_6 [1]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry__2_i_8
       (.I0(right_abs0[23]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [24]),
        .I4(quotient_next1_carry__0[24]),
        .O(\out_reg[31]_6 [0]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry_i_1
       (.I0(quotient_next1_carry__0[7]),
        .I1(\out_reg[31]_0 [7]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[6]),
        .O(\acc_reg[7] [7]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry_i_2
       (.I0(right_abs0[5]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [6]),
        .I4(quotient_next1_carry__0[6]),
        .O(\acc_reg[7] [6]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry_i_3
       (.I0(quotient_next1_carry__0[5]),
        .I1(\out_reg[31]_0 [5]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[4]),
        .O(\acc_reg[7] [5]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry_i_4
       (.I0(right_abs0[3]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [4]),
        .I4(quotient_next1_carry__0[4]),
        .O(\acc_reg[7] [4]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry_i_5
       (.I0(quotient_next1_carry__0[3]),
        .I1(\out_reg[31]_0 [3]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[2]),
        .O(\acc_reg[7] [3]));
  LUT5 #(
    .INIT(32'h0B08F4F7)) 
    quotient_next0_carry_i_6
       (.I0(right_abs0[1]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [2]),
        .I4(quotient_next1_carry__0[2]),
        .O(\acc_reg[7] [2]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next0_carry_i_7
       (.I0(quotient_next1_carry__0[1]),
        .I1(\out_reg[31]_0 [1]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[0]),
        .O(\acc_reg[7] [1]));
  LUT3 #(
    .INIT(8'h2D)) 
    quotient_next0_carry_i_8
       (.I0(\out_reg[31]_0 [0]),
        .I1(\right_save_reg[30] ),
        .I2(quotient_next1_carry__0[0]),
        .O(\acc_reg[7] [0]));
  LUT6 #(
    .INIT(64'hF4F440F4F4F4F4F4)) 
    quotient_next1_carry__0_i_1
       (.I0(right_abs[29]),
        .I1(quotient_next1_carry__0[30]),
        .I2(quotient_next1_carry__0[31]),
        .I3(right_abs0[30]),
        .I4(\right_save_reg[30] ),
        .I5(\out_reg[31]_0 [31]),
        .O(\acc_reg[30] ));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry__0_i_10
       (.I0(quotient_next1_carry__0_i_17_n_0),
        .I1(right_abs0[27]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [28]),
        .I5(quotient_next1_carry__0[28]),
        .O(\out_reg[31]_1 [6]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry__0_i_11
       (.I0(quotient_next1_carry__0_i_18_n_0),
        .I1(right_abs0[25]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [26]),
        .I5(quotient_next1_carry__0[26]),
        .O(\out_reg[31]_1 [5]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry__0_i_12
       (.I0(quotient_next1_carry__0_i_19_n_0),
        .I1(right_abs0[23]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [24]),
        .I5(quotient_next1_carry__0[24]),
        .O(\out_reg[31]_1 [4]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry__0_i_13
       (.I0(quotient_next1_carry__0_i_20_n_0),
        .I1(right_abs0[21]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [22]),
        .I5(quotient_next1_carry__0[22]),
        .O(\out_reg[31]_1 [3]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry__0_i_14
       (.I0(quotient_next1_carry__0_i_21_n_0),
        .I1(right_abs0[19]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [20]),
        .I5(quotient_next1_carry__0[20]),
        .O(\out_reg[31]_1 [2]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry__0_i_15
       (.I0(quotient_next1_carry__0_i_22_n_0),
        .I1(right_abs0[17]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [18]),
        .I5(quotient_next1_carry__0[18]),
        .O(\out_reg[31]_1 [1]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry__0_i_16
       (.I0(quotient_next1_carry__0_i_23_n_0),
        .I1(right_abs0[15]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [16]),
        .I5(quotient_next1_carry__0[16]),
        .O(\out_reg[31]_1 [0]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry__0_i_17
       (.I0(quotient_next1_carry__0[29]),
        .I1(\out_reg[31]_0 [29]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[28]),
        .O(quotient_next1_carry__0_i_17_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry__0_i_18
       (.I0(quotient_next1_carry__0[27]),
        .I1(\out_reg[31]_0 [27]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[26]),
        .O(quotient_next1_carry__0_i_18_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry__0_i_19
       (.I0(quotient_next1_carry__0[25]),
        .I1(\out_reg[31]_0 [25]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[24]),
        .O(quotient_next1_carry__0_i_19_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry__0_i_20
       (.I0(quotient_next1_carry__0[23]),
        .I1(\out_reg[31]_0 [23]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[22]),
        .O(quotient_next1_carry__0_i_20_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry__0_i_21
       (.I0(quotient_next1_carry__0[21]),
        .I1(\out_reg[31]_0 [21]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[20]),
        .O(quotient_next1_carry__0_i_21_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry__0_i_22
       (.I0(quotient_next1_carry__0[19]),
        .I1(\out_reg[31]_0 [19]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[18]),
        .O(quotient_next1_carry__0_i_22_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry__0_i_23
       (.I0(quotient_next1_carry__0[17]),
        .I1(\out_reg[31]_0 [17]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[16]),
        .O(quotient_next1_carry__0_i_23_n_0));
  LUT6 #(
    .INIT(64'h20DF0000000020DF)) 
    quotient_next1_carry__0_i_9
       (.I0(\out_reg[31]_0 [31]),
        .I1(\right_save_reg[30] ),
        .I2(right_abs0[30]),
        .I3(quotient_next1_carry__0[31]),
        .I4(right_abs[29]),
        .I5(quotient_next1_carry__0[30]),
        .O(\out_reg[31]_1 [7]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry_i_10
       (.I0(quotient_next1_carry_i_18_n_0),
        .I1(right_abs0[11]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [12]),
        .I5(quotient_next1_carry__0[12]),
        .O(\out_reg[31]_3 [6]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry_i_11
       (.I0(quotient_next1_carry_i_19_n_0),
        .I1(right_abs0[9]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [10]),
        .I5(quotient_next1_carry__0[10]),
        .O(\out_reg[31]_3 [5]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry_i_12
       (.I0(quotient_next1_carry_i_20_n_0),
        .I1(right_abs0[7]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [8]),
        .I5(quotient_next1_carry__0[8]),
        .O(\out_reg[31]_3 [4]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry_i_13
       (.I0(quotient_next1_carry_i_21_n_0),
        .I1(right_abs0[5]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [6]),
        .I5(quotient_next1_carry__0[6]),
        .O(\out_reg[31]_3 [3]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry_i_14
       (.I0(quotient_next1_carry_i_22_n_0),
        .I1(right_abs0[3]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [4]),
        .I5(quotient_next1_carry__0[4]),
        .O(\out_reg[31]_3 [2]));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry_i_15
       (.I0(quotient_next1_carry_i_23_n_0),
        .I1(right_abs0[1]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [2]),
        .I5(quotient_next1_carry__0[2]),
        .O(\out_reg[31]_3 [1]));
  LUT5 #(
    .INIT(32'h00909909)) 
    quotient_next1_carry_i_16
       (.I0(right_abs[0]),
        .I1(quotient_next1_carry__0[1]),
        .I2(\out_reg[31]_0 [0]),
        .I3(\right_save_reg[30] ),
        .I4(quotient_next1_carry__0[0]),
        .O(\out_reg[31]_3 [0]));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry_i_17
       (.I0(quotient_next1_carry__0[15]),
        .I1(\out_reg[31]_0 [15]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[14]),
        .O(quotient_next1_carry_i_17_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry_i_18
       (.I0(quotient_next1_carry__0[13]),
        .I1(\out_reg[31]_0 [13]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[12]),
        .O(quotient_next1_carry_i_18_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry_i_19
       (.I0(quotient_next1_carry__0[11]),
        .I1(\out_reg[31]_0 [11]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[10]),
        .O(quotient_next1_carry_i_19_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry_i_20
       (.I0(quotient_next1_carry__0[9]),
        .I1(\out_reg[31]_0 [9]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[8]),
        .O(quotient_next1_carry_i_20_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry_i_21
       (.I0(quotient_next1_carry__0[7]),
        .I1(\out_reg[31]_0 [7]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[6]),
        .O(quotient_next1_carry_i_21_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry_i_22
       (.I0(quotient_next1_carry__0[5]),
        .I1(\out_reg[31]_0 [5]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[4]),
        .O(quotient_next1_carry_i_22_n_0));
  LUT5 #(
    .INIT(32'h5A595559)) 
    quotient_next1_carry_i_23
       (.I0(quotient_next1_carry__0[3]),
        .I1(\out_reg[31]_0 [3]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [31]),
        .I4(right_abs0[2]),
        .O(quotient_next1_carry_i_23_n_0));
  LUT6 #(
    .INIT(64'h008A0080AA20AA2A)) 
    quotient_next1_carry_i_9
       (.I0(quotient_next1_carry_i_17_n_0),
        .I1(right_abs0[13]),
        .I2(\out_reg[31]_0 [31]),
        .I3(\right_save_reg[30] ),
        .I4(\out_reg[31]_0 [14]),
        .I5(quotient_next1_carry__0[14]),
        .O(\out_reg[31]_3 [7]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[10]_i_1 
       (.I0(right_abs0[9]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [10]),
        .O(right_abs[9]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[11]_i_1 
       (.I0(right_abs0[10]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [11]),
        .O(right_abs[10]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[12]_i_1 
       (.I0(right_abs0[11]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [12]),
        .O(right_abs[11]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[13]_i_1 
       (.I0(right_abs0[12]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [13]),
        .O(right_abs[12]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[14]_i_1 
       (.I0(right_abs0[13]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [14]),
        .O(right_abs[13]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[15]_i_1 
       (.I0(right_abs0[14]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [15]),
        .O(right_abs[14]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[16]_i_1 
       (.I0(right_abs0[15]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [16]),
        .O(right_abs[15]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[17]_i_1 
       (.I0(right_abs0[16]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [17]),
        .O(right_abs[16]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[18]_i_1 
       (.I0(right_abs0[17]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [18]),
        .O(right_abs[17]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[19]_i_1 
       (.I0(right_abs0[18]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [19]),
        .O(right_abs[18]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[1]_i_1 
       (.I0(right_abs0[0]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [1]),
        .O(right_abs[0]));
  LUT4 #(
    .INIT(16'h2320)) 
    \right_save[20]_i_1 
       (.I0(right_abs0[19]),
        .I1(\right_save_reg[30] ),
        .I2(\out_reg[31]_0 [31]),
        .I3(\out_reg[31]_0 [20]),
        .O(right_abs[19]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[21]_i_1 
       (.I0(right_abs0[20]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [21]),
        .O(right_abs[20]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[22]_i_1 
       (.I0(right_abs0[21]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [22]),
        .O(right_abs[21]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[23]_i_1 
       (.I0(right_abs0[22]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [23]),
        .O(right_abs[22]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[24]_i_1 
       (.I0(right_abs0[23]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [24]),
        .O(right_abs[23]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[25]_i_1 
       (.I0(right_abs0[24]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [25]),
        .O(right_abs[24]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[26]_i_1 
       (.I0(right_abs0[25]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [26]),
        .O(right_abs[25]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[27]_i_1 
       (.I0(right_abs0[26]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [27]),
        .O(right_abs[26]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[28]_i_1 
       (.I0(right_abs0[27]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [28]),
        .O(right_abs[27]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[29]_i_1 
       (.I0(right_abs0[28]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [29]),
        .O(right_abs[28]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[2]_i_1 
       (.I0(right_abs0[1]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [2]),
        .O(right_abs[1]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[30]_i_1 
       (.I0(right_abs0[29]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [30]),
        .O(right_abs[29]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[3]_i_1 
       (.I0(right_abs0[2]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [3]),
        .O(right_abs[2]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[4]_i_1 
       (.I0(right_abs0[3]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [4]),
        .O(right_abs[3]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[5]_i_1 
       (.I0(right_abs0[4]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [5]),
        .O(right_abs[4]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[6]_i_1 
       (.I0(right_abs0[5]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [6]),
        .O(right_abs[5]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[7]_i_1 
       (.I0(right_abs0[6]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [7]),
        .O(right_abs[6]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[8]_i_1 
       (.I0(right_abs0[7]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [8]),
        .O(right_abs[7]));
  LUT4 #(
    .INIT(16'h0B08)) 
    \right_save[9]_i_1 
       (.I0(right_abs0[8]),
        .I1(\out_reg[31]_0 [31]),
        .I2(\right_save_reg[30] ),
        .I3(\out_reg[31]_0 [9]),
        .O(right_abs[8]));
endmodule
