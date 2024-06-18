// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:33:26 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//seq-component-chain.futil-vanilla-place.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "78f3d31b" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    x_addr0,
    x_write_data,
    x_write_en,
    x_clk,
    x_read_data,
    x_done,
    y_addr0,
    y_write_data,
    y_write_en,
    y_clk,
    y_read_data,
    y_done,
    z_addr0,
    z_write_data,
    z_write_en,
    z_clk,
    z_read_data,
    z_done);
  input go;
  input clk;
  input reset;
  output done;
  output x_addr0;
  output [31:0]x_write_data;
  output x_write_en;
  output x_clk;
  input [31:0]x_read_data;
  input x_done;
  output y_addr0;
  output [31:0]y_write_data;
  output y_write_en;
  output y_clk;
  input [31:0]y_read_data;
  input y_done;
  output z_addr0;
  output [31:0]z_write_data;
  output z_write_en;
  output z_clk;
  input [31:0]z_read_data;
  input z_done;

  wire \<const0> ;
  wire clk;
  wire [31:16]\comp/out_tmp_reg ;
  wire done;
  wire fsm_n_0;
  wire fsm_n_1;
  wire fsm_n_2;
  wire fsm_n_3;
  wire fsm_n_4;
  wire fsm_n_5;
  wire fsm_n_7;
  wire go;
  wire mult_pipe0_done;
  wire mult_pipe0_go;
  wire mult_pipe0_n_17;
  wire mult_pipe0_n_18;
  wire mult_pipe0_n_19;
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
  wire mult_pipe0_n_30;
  wire mult_pipe0_n_31;
  wire mult_pipe0_n_32;
  wire reset;
  wire x_done;
  wire [31:0]x_write_data;
  wire x_write_en;
  wire y_done;
  wire [31:0]y_write_data;
  wire y_write_en;
  wire z_done;
  wire [31:0]z_write_data;
  wire z_write_en;

  assign x_addr0 = \<const0> ;
  assign x_clk = clk;
  assign y_addr0 = \<const0> ;
  assign y_clk = clk;
  assign z_addr0 = \<const0> ;
  assign z_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_reg fsm
       (.A({fsm_n_3,fsm_n_4,fsm_n_5,mult_pipe0_go}),
        .B({fsm_n_1,fsm_n_2}),
        .Q({mult_pipe0_n_17,mult_pipe0_n_18,mult_pipe0_n_19,mult_pipe0_n_20,mult_pipe0_n_21,mult_pipe0_n_22,mult_pipe0_n_23,mult_pipe0_n_24,mult_pipe0_n_25,mult_pipe0_n_26,mult_pipe0_n_27,mult_pipe0_n_28,mult_pipe0_n_29,mult_pipe0_n_30,mult_pipe0_n_31,mult_pipe0_n_32}),
        .clk(clk),
        .done(done),
        .go(go),
        .go_0(fsm_n_0),
        .mult_pipe0_done(mult_pipe0_done),
        .\out_reg[0]_0 (fsm_n_7),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .reset(reset),
        .x_done(x_done),
        .x_write_data(x_write_data),
        .x_write_en(x_write_en),
        .y_done(y_done),
        .y_write_data(y_write_data),
        .y_write_en(y_write_en),
        .z_done(z_done),
        .z_write_data(z_write_data),
        .z_write_en(z_write_en));
  std_mult_pipe mult_pipe0
       (.A({fsm_n_3,fsm_n_1,fsm_n_4,fsm_n_5,mult_pipe0_go}),
        .B(fsm_n_2),
        .Q({mult_pipe0_n_17,mult_pipe0_n_18,mult_pipe0_n_19,mult_pipe0_n_20,mult_pipe0_n_21,mult_pipe0_n_22,mult_pipe0_n_23,mult_pipe0_n_24,mult_pipe0_n_25,mult_pipe0_n_26,mult_pipe0_n_27,mult_pipe0_n_28,mult_pipe0_n_29,mult_pipe0_n_30,mult_pipe0_n_31,mult_pipe0_n_32}),
        .clk(clk),
        .\done_buf_reg[0] (fsm_n_7),
        .\done_buf_reg[2] (fsm_n_0),
        .mult_pipe0_done(mult_pipe0_done),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .reset(reset));
endmodule

module std_fp_mult_pipe
   (mult_pipe0_done,
    out_tmp_reg_0,
    Q,
    clk,
    \done_buf_reg[2]_0 ,
    A,
    reset,
    B,
    \done_buf_reg[0]_0 );
  output mult_pipe0_done;
  output [15:0]out_tmp_reg_0;
  output [15:0]Q;
  input clk;
  input \done_buf_reg[2]_0 ;
  input [4:0]A;
  input reset;
  input [0:0]B;
  input \done_buf_reg[0]_0 ;

  wire \<const0> ;
  wire \<const1> ;
  wire [4:0]A;
  wire [0:0]B;
  wire GND_2;
  wire [15:0]Q;
  wire VCC_2;
  wire clk;
  wire \done_buf_reg[0]_0 ;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire mult_pipe0_done;
  wire out0__0_n_100;
  wire out0__0_n_101;
  wire out0__0_n_102;
  wire out0__0_n_103;
  wire out0__0_n_104;
  wire out0__0_n_105;
  wire out0__0_n_106;
  wire out0__0_n_107;
  wire out0__0_n_108;
  wire out0__0_n_109;
  wire out0__0_n_110;
  wire out0__0_n_111;
  wire out0__0_n_112;
  wire out0__0_n_113;
  wire out0__0_n_114;
  wire out0__0_n_115;
  wire out0__0_n_116;
  wire out0__0_n_117;
  wire out0__0_n_118;
  wire out0__0_n_119;
  wire out0__0_n_120;
  wire out0__0_n_121;
  wire out0__0_n_122;
  wire out0__0_n_123;
  wire out0__0_n_124;
  wire out0__0_n_125;
  wire out0__0_n_126;
  wire out0__0_n_127;
  wire out0__0_n_128;
  wire out0__0_n_129;
  wire out0__0_n_130;
  wire out0__0_n_131;
  wire out0__0_n_132;
  wire out0__0_n_133;
  wire out0__0_n_134;
  wire out0__0_n_135;
  wire out0__0_n_136;
  wire out0__0_n_137;
  wire out0__0_n_138;
  wire out0__0_n_139;
  wire out0__0_n_140;
  wire out0__0_n_141;
  wire out0__0_n_142;
  wire out0__0_n_143;
  wire out0__0_n_144;
  wire out0__0_n_145;
  wire out0__0_n_146;
  wire out0__0_n_147;
  wire out0__0_n_148;
  wire out0__0_n_149;
  wire out0__0_n_150;
  wire out0__0_n_151;
  wire out0__0_n_152;
  wire out0__0_n_153;
  wire out0__0_n_89;
  wire out0__0_n_90;
  wire out0__0_n_91;
  wire out0__0_n_92;
  wire out0__0_n_93;
  wire out0__0_n_94;
  wire out0__0_n_95;
  wire out0__0_n_96;
  wire out0__0_n_97;
  wire out0__0_n_98;
  wire out0__0_n_99;
  wire out0_carry_i_1__0_n_0;
  wire out0_carry_i_1_n_0;
  wire out0_carry_i_2__0_n_0;
  wire out0_carry_i_2_n_0;
  wire out0_carry_i_3__0_n_0;
  wire out0_carry_i_3_n_0;
  wire out0_carry_i_4__0_n_0;
  wire out0_carry_i_4_n_0;
  wire out0_carry_i_5__0_n_0;
  wire out0_carry_i_5_n_0;
  wire out0_carry_i_6__0_n_0;
  wire out0_carry_i_6_n_0;
  wire out0_carry_i_7__0_n_0;
  wire out0_carry_i_7_n_0;
  wire out0_carry_i_8_n_0;
  wire out0_carry_n_0;
  wire out0_n_100;
  wire out0_n_101;
  wire out0_n_102;
  wire out0_n_103;
  wire out0_n_104;
  wire out0_n_105;
  wire out0_n_91;
  wire out0_n_92;
  wire out0_n_93;
  wire out0_n_94;
  wire out0_n_95;
  wire out0_n_96;
  wire out0_n_97;
  wire out0_n_98;
  wire out0_n_99;
  wire \out_tmp_reg[16]__0_n_0 ;
  wire [15:0]out_tmp_reg_0;
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
  wire reset;
  wire start;
  wire [7:0]NLW_out0_carry_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  LUT4 #(
    .INIT(16'h0002)) 
    \done_buf[0]_i_1 
       (.I0(\done_buf_reg[0]_0 ),
        .I1(mult_pipe0_done),
        .I2(\done_buf_reg_n_0_[1] ),
        .I3(\done_buf_reg_n_0_[0] ),
        .O(start));
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
        .R(\done_buf_reg[2]_0 ));
  FDRE \done_buf_reg[2] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\done_buf_reg_n_0_[1] ),
        .Q(mult_pipe0_done),
        .R(\done_buf_reg[2]_0 ));
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
    out0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A[3],B,A[3],B,\<const0> ,\<const0> }),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
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
        .CEP(A[0]),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out0_n_91,out0_n_92,out0_n_93,out0_n_94,out0_n_95,out0_n_96,out0_n_97,out0_n_98,out0_n_99,out0_n_100,out0_n_101,out0_n_102,out0_n_103,out0_n_104,out0_n_105}),
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
    out0__0
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A,\<const0> }),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A[3],B,A[3],B,\<const0> ,\<const0> }),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
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
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out0__0_n_89,out0__0_n_90,out0__0_n_91,out0__0_n_92,out0__0_n_93,out0__0_n_94,out0__0_n_95,out0__0_n_96,out0__0_n_97,out0__0_n_98,out0__0_n_99,out0__0_n_100,out0__0_n_101,out0__0_n_102,out0__0_n_103,out0__0_n_104,out0__0_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({out0__0_n_106,out0__0_n_107,out0__0_n_108,out0__0_n_109,out0__0_n_110,out0__0_n_111,out0__0_n_112,out0__0_n_113,out0__0_n_114,out0__0_n_115,out0__0_n_116,out0__0_n_117,out0__0_n_118,out0__0_n_119,out0__0_n_120,out0__0_n_121,out0__0_n_122,out0__0_n_123,out0__0_n_124,out0__0_n_125,out0__0_n_126,out0__0_n_127,out0__0_n_128,out0__0_n_129,out0__0_n_130,out0__0_n_131,out0__0_n_132,out0__0_n_133,out0__0_n_134,out0__0_n_135,out0__0_n_136,out0__0_n_137,out0__0_n_138,out0__0_n_139,out0__0_n_140,out0__0_n_141,out0__0_n_142,out0__0_n_143,out0__0_n_144,out0__0_n_145,out0__0_n_146,out0__0_n_147,out0__0_n_148,out0__0_n_149,out0__0_n_150,out0__0_n_151,out0__0_n_152,out0__0_n_153}),
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
  (* OPT_MODIFIED = "PROPCONST SWEEP" *) 
  CARRY8 out0_carry
       (.CI(\<const0> ),
        .CI_TOP(GND_2),
        .CO({out0_carry_n_0,NLW_out0_carry_CO_UNCONNECTED[6:0]}),
        .DI({out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105,\<const0> }),
        .O(out_tmp_reg_0[7:0]),
        .S({out0_carry_i_1__0_n_0,out0_carry_i_2_n_0,out0_carry_i_3_n_0,out0_carry_i_4_n_0,out0_carry_i_5_n_0,out0_carry_i_6_n_0,out0_carry_i_7_n_0,\out_tmp_reg[16]__0_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out0_carry__0
       (.CI(out0_carry_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98}),
        .O(out_tmp_reg_0[15:8]),
        .S({out0_carry_i_1_n_0,out0_carry_i_2__0_n_0,out0_carry_i_3__0_n_0,out0_carry_i_4__0_n_0,out0_carry_i_5__0_n_0,out0_carry_i_6__0_n_0,out0_carry_i_7__0_n_0,out0_carry_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1
       (.I0(out0_n_91),
        .I1(out_tmp_reg_n_91),
        .O(out0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1__0
       (.I0(out_tmp_reg_n_99),
        .I1(out0_n_99),
        .O(out0_carry_i_1__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_2
       (.I0(out_tmp_reg_n_100),
        .I1(out0_n_100),
        .O(out0_carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_2__0
       (.I0(out_tmp_reg_n_92),
        .I1(out0_n_92),
        .O(out0_carry_i_2__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_3
       (.I0(out_tmp_reg_n_101),
        .I1(out0_n_101),
        .O(out0_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_3__0
       (.I0(out_tmp_reg_n_93),
        .I1(out0_n_93),
        .O(out0_carry_i_3__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_4
       (.I0(out_tmp_reg_n_102),
        .I1(out0_n_102),
        .O(out0_carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_4__0
       (.I0(out_tmp_reg_n_94),
        .I1(out0_n_94),
        .O(out0_carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_5
       (.I0(out_tmp_reg_n_103),
        .I1(out0_n_103),
        .O(out0_carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_5__0
       (.I0(out_tmp_reg_n_95),
        .I1(out0_n_95),
        .O(out0_carry_i_5__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_6
       (.I0(out_tmp_reg_n_104),
        .I1(out0_n_104),
        .O(out0_carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_6__0
       (.I0(out_tmp_reg_n_96),
        .I1(out0_n_96),
        .O(out0_carry_i_6__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_7
       (.I0(out_tmp_reg_n_105),
        .I1(out0_n_105),
        .O(out0_carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_7__0
       (.I0(out_tmp_reg_n_97),
        .I1(out0_n_97),
        .O(out0_carry_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_8
       (.I0(out_tmp_reg_n_98),
        .I1(out0_n_98),
        .O(out0_carry_i_8_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
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
    out_tmp_reg
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A,\<const0> }),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
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
        .CEP(A[0]),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({out_tmp_reg_n_91,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98,out_tmp_reg_n_99,out_tmp_reg_n_100,out_tmp_reg_n_101,out_tmp_reg_n_102,out_tmp_reg_n_103,out_tmp_reg_n_104,out_tmp_reg_n_105}),
        .PCIN({out0__0_n_106,out0__0_n_107,out0__0_n_108,out0__0_n_109,out0__0_n_110,out0__0_n_111,out0__0_n_112,out0__0_n_113,out0__0_n_114,out0__0_n_115,out0__0_n_116,out0__0_n_117,out0__0_n_118,out0__0_n_119,out0__0_n_120,out0__0_n_121,out0__0_n_122,out0__0_n_123,out0__0_n_124,out0__0_n_125,out0__0_n_126,out0__0_n_127,out0__0_n_128,out0__0_n_129,out0__0_n_130,out0__0_n_131,out0__0_n_132,out0__0_n_133,out0__0_n_134,out0__0_n_135,out0__0_n_136,out0__0_n_137,out0__0_n_138,out0__0_n_139,out0__0_n_140,out0__0_n_141,out0__0_n_142,out0__0_n_143,out0__0_n_144,out0__0_n_145,out0__0_n_146,out0__0_n_147,out0__0_n_148,out0__0_n_149,out0__0_n_150,out0__0_n_151,out0__0_n_152,out0__0_n_153}),
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
  FDRE \out_tmp_reg[0]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_105),
        .Q(Q[0]),
        .R(reset));
  FDRE \out_tmp_reg[10]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_95),
        .Q(Q[10]),
        .R(reset));
  FDRE \out_tmp_reg[11]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_94),
        .Q(Q[11]),
        .R(reset));
  FDRE \out_tmp_reg[12]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_93),
        .Q(Q[12]),
        .R(reset));
  FDRE \out_tmp_reg[13]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_92),
        .Q(Q[13]),
        .R(reset));
  FDRE \out_tmp_reg[14]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_91),
        .Q(Q[14]),
        .R(reset));
  FDRE \out_tmp_reg[15]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_90),
        .Q(Q[15]),
        .R(reset));
  FDRE \out_tmp_reg[16]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_89),
        .Q(\out_tmp_reg[16]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[1]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_104),
        .Q(Q[1]),
        .R(reset));
  FDRE \out_tmp_reg[2]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_103),
        .Q(Q[2]),
        .R(reset));
  FDRE \out_tmp_reg[3]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_102),
        .Q(Q[3]),
        .R(reset));
  FDRE \out_tmp_reg[4]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_101),
        .Q(Q[4]),
        .R(reset));
  FDRE \out_tmp_reg[5]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_100),
        .Q(Q[5]),
        .R(reset));
  FDRE \out_tmp_reg[6]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_99),
        .Q(Q[6]),
        .R(reset));
  FDRE \out_tmp_reg[7]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_98),
        .Q(Q[7]),
        .R(reset));
  FDRE \out_tmp_reg[8]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_97),
        .Q(Q[8]),
        .R(reset));
  FDRE \out_tmp_reg[9]__0 
       (.C(clk),
        .CE(A[0]),
        .D(out0__0_n_96),
        .Q(Q[9]),
        .R(reset));
endmodule

module std_mult_pipe
   (mult_pipe0_done,
    out_tmp_reg,
    Q,
    clk,
    \done_buf_reg[2] ,
    A,
    reset,
    B,
    \done_buf_reg[0] );
  output mult_pipe0_done;
  output [15:0]out_tmp_reg;
  output [15:0]Q;
  input clk;
  input \done_buf_reg[2] ;
  input [4:0]A;
  input reset;
  input [0:0]B;
  input \done_buf_reg[0] ;

  wire [4:0]A;
  wire [0:0]B;
  wire [15:0]Q;
  wire clk;
  wire \done_buf_reg[0] ;
  wire \done_buf_reg[2] ;
  wire mult_pipe0_done;
  wire [15:0]out_tmp_reg;
  wire reset;

  std_fp_mult_pipe comp
       (.A(A),
        .B(B),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[0]_0 (\done_buf_reg[0] ),
        .\done_buf_reg[2]_0 (\done_buf_reg[2] ),
        .mult_pipe0_done(mult_pipe0_done),
        .out_tmp_reg_0(out_tmp_reg),
        .reset(reset));
endmodule

module std_reg
   (go_0,
    B,
    A,
    \out_reg[0]_0 ,
    x_write_data,
    x_write_en,
    y_write_data,
    y_write_en,
    z_write_data,
    z_write_en,
    done,
    y_done,
    x_done,
    z_done,
    go,
    mult_pipe0_done,
    Q,
    out_tmp_reg,
    reset,
    clk);
  output go_0;
  output [1:0]B;
  output [3:0]A;
  output \out_reg[0]_0 ;
  output [31:0]x_write_data;
  output x_write_en;
  output [31:0]y_write_data;
  output y_write_en;
  output [31:0]z_write_data;
  output z_write_en;
  output done;
  input y_done;
  input x_done;
  input z_done;
  input go;
  input mult_pipe0_done;
  input [15:0]Q;
  input [15:0]out_tmp_reg;
  input reset;
  input clk;

  wire [3:0]A;
  wire [1:0]B;
  wire [15:0]Q;
  wire clk;
  wire done;
  wire \done_buf[1]_i_2_n_0 ;
  wire [1:0]fsm_in;
  wire [1:0]fsm_out;
  wire fsm_write_en;
  wire go;
  wire go_0;
  wire mult_pipe0_done;
  wire \out_reg[0]_0 ;
  wire [15:0]out_tmp_reg;
  wire reset;
  wire x_done;
  wire [31:0]x_write_data;
  wire x_write_en;
  wire y_done;
  wire [31:0]y_write_data;
  wire y_write_en;
  wire z_done;
  wire [31:0]z_write_data;
  wire z_write_en;

  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .O(done));
  LUT6 #(
    .INIT(64'h0415263700000000)) 
    \done_buf[0]_i_2 
       (.I0(fsm_out[0]),
        .I1(fsm_out[1]),
        .I2(z_done),
        .I3(x_done),
        .I4(y_done),
        .I5(go),
        .O(\out_reg[0]_0 ));
  LUT3 #(
    .INIT(8'hFD)) 
    \done_buf[1]_i_1 
       (.I0(go),
        .I1(\done_buf[1]_i_2_n_0 ),
        .I2(mult_pipe0_done),
        .O(go_0));
  LUT5 #(
    .INIT(32'hFFF0AACC)) 
    \done_buf[1]_i_2 
       (.I0(y_done),
        .I1(x_done),
        .I2(z_done),
        .I3(fsm_out[0]),
        .I4(fsm_out[1]),
        .O(\done_buf[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    out0_i_1
       (.I0(\out_reg[0]_0 ),
        .I1(mult_pipe0_done),
        .O(A[0]));
  LUT5 #(
    .INIT(32'h00000020)) 
    out0_i_1__0
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(mult_pipe0_done),
        .O(A[3]));
  LUT6 #(
    .INIT(64'h000000000000202A)) 
    out0_i_2
       (.I0(go),
        .I1(y_done),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(fsm_out[1]),
        .I5(mult_pipe0_done),
        .O(A[2]));
  LUT6 #(
    .INIT(64'h0000000000220A00)) 
    out0_i_2__0
       (.I0(go),
        .I1(y_done),
        .I2(z_done),
        .I3(fsm_out[1]),
        .I4(fsm_out[0]),
        .I5(mult_pipe0_done),
        .O(B[1]));
  LUT6 #(
    .INIT(64'h00000000000002A2)) 
    out0_i_3
       (.I0(go),
        .I1(x_done),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(fsm_out[0]),
        .I5(mult_pipe0_done),
        .O(B[0]));
  LUT5 #(
    .INIT(32'h00000020)) 
    out0_i_3__0
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(mult_pipe0_done),
        .O(A[1]));
  LUT5 #(
    .INIT(32'h0B080000)) 
    \out[0]_i_1 
       (.I0(z_done),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(go),
        .O(fsm_in[0]));
  LUT6 #(
    .INIT(64'hFFFFF000AA00CC00)) 
    \out[1]_i_1 
       (.I0(y_done),
        .I1(x_done),
        .I2(z_done),
        .I3(go),
        .I4(fsm_out[0]),
        .I5(fsm_out[1]),
        .O(fsm_write_en));
  LUT5 #(
    .INIT(32'h38080000)) 
    \out[1]_i_2 
       (.I0(z_done),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(go),
        .O(fsm_in[1]));
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
    .INIT(32'h00020000)) 
    \x_write_data[0]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[0]),
        .O(x_write_data[0]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[10]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[10]),
        .O(x_write_data[10]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[11]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[11]),
        .O(x_write_data[11]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[12]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[12]),
        .O(x_write_data[12]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[13]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[13]),
        .O(x_write_data[13]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[14]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[14]),
        .O(x_write_data[14]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[15]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[15]),
        .O(x_write_data[15]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[16]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[0]),
        .O(x_write_data[16]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[17]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[1]),
        .O(x_write_data[17]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[18]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[2]),
        .O(x_write_data[18]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[19]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[3]),
        .O(x_write_data[19]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[1]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[1]),
        .O(x_write_data[1]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[20]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[4]),
        .O(x_write_data[20]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[21]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[5]),
        .O(x_write_data[21]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[22]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[6]),
        .O(x_write_data[22]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[23]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[7]),
        .O(x_write_data[23]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[24]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[8]),
        .O(x_write_data[24]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[25]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[9]),
        .O(x_write_data[25]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[26]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[10]),
        .O(x_write_data[26]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[27]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[11]),
        .O(x_write_data[27]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[28]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[12]),
        .O(x_write_data[28]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[29]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[13]),
        .O(x_write_data[29]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[2]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[2]),
        .O(x_write_data[2]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[30]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[14]),
        .O(x_write_data[30]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[31]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(out_tmp_reg[15]),
        .O(x_write_data[31]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[3]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[3]),
        .O(x_write_data[3]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[4]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[4]),
        .O(x_write_data[4]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[5]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[5]),
        .O(x_write_data[5]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[6]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[6]),
        .O(x_write_data[6]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[7]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[7]),
        .O(x_write_data[7]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[8]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[8]),
        .O(x_write_data[8]));
  LUT5 #(
    .INIT(32'h00020000)) 
    \x_write_data[9]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(Q[9]),
        .O(x_write_data[9]));
  LUT5 #(
    .INIT(32'h00020000)) 
    x_write_en_INST_0
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(x_done),
        .I4(mult_pipe0_done),
        .O(x_write_en));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[0]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[0]),
        .O(y_write_data[0]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[10]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[10]),
        .O(y_write_data[10]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[11]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[11]),
        .O(y_write_data[11]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[12]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[12]),
        .O(y_write_data[12]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[13]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[13]),
        .O(y_write_data[13]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[14]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[14]),
        .O(y_write_data[14]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[15]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[15]),
        .O(y_write_data[15]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[16]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[0]),
        .O(y_write_data[16]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[17]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[1]),
        .O(y_write_data[17]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[18]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[2]),
        .O(y_write_data[18]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[19]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[3]),
        .O(y_write_data[19]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[1]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[1]),
        .O(y_write_data[1]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[20]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[4]),
        .O(y_write_data[20]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[21]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[5]),
        .O(y_write_data[21]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[22]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[6]),
        .O(y_write_data[22]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[23]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[7]),
        .O(y_write_data[23]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[24]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[8]),
        .O(y_write_data[24]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[25]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[9]),
        .O(y_write_data[25]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[26]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[10]),
        .O(y_write_data[26]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[27]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[11]),
        .O(y_write_data[27]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[28]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[12]),
        .O(y_write_data[28]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[29]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[13]),
        .O(y_write_data[29]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[2]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[2]),
        .O(y_write_data[2]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[30]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[14]),
        .O(y_write_data[30]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[31]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(out_tmp_reg[15]),
        .O(y_write_data[31]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[3]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[3]),
        .O(y_write_data[3]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[4]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[4]),
        .O(y_write_data[4]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[5]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[5]),
        .O(y_write_data[5]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[6]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[6]),
        .O(y_write_data[6]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[7]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[7]),
        .O(y_write_data[7]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[8]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[8]),
        .O(y_write_data[8]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \y_write_data[9]_INST_0 
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(Q[9]),
        .O(y_write_data[9]));
  LUT5 #(
    .INIT(32'h00200000)) 
    y_write_en_INST_0
       (.I0(go),
        .I1(fsm_out[1]),
        .I2(fsm_out[0]),
        .I3(y_done),
        .I4(mult_pipe0_done),
        .O(y_write_en));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[0]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[0]),
        .O(z_write_data[0]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[10]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[10]),
        .O(z_write_data[10]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[11]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[11]),
        .O(z_write_data[11]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[12]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[12]),
        .O(z_write_data[12]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[13]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[13]),
        .O(z_write_data[13]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[14]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[14]),
        .O(z_write_data[14]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[15]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[15]),
        .O(z_write_data[15]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[16]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[0]),
        .O(z_write_data[16]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[17]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[1]),
        .O(z_write_data[17]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[18]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[2]),
        .O(z_write_data[18]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[19]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[3]),
        .O(z_write_data[19]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[1]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[1]),
        .O(z_write_data[1]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[20]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[4]),
        .O(z_write_data[20]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[21]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[5]),
        .O(z_write_data[21]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[22]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[6]),
        .O(z_write_data[22]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[23]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[7]),
        .O(z_write_data[23]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[24]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[8]),
        .O(z_write_data[24]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[25]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[9]),
        .O(z_write_data[25]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[26]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[10]),
        .O(z_write_data[26]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[27]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[11]),
        .O(z_write_data[27]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[28]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[12]),
        .O(z_write_data[28]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[29]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[13]),
        .O(z_write_data[29]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[2]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[2]),
        .O(z_write_data[2]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[30]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[14]),
        .O(z_write_data[30]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[31]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(out_tmp_reg[15]),
        .O(z_write_data[31]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[3]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[3]),
        .O(z_write_data[3]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[4]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[4]),
        .O(z_write_data[4]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[5]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[5]),
        .O(z_write_data[5]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[6]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[6]),
        .O(z_write_data[6]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[7]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[7]),
        .O(z_write_data[7]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[8]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[8]),
        .O(z_write_data[8]));
  LUT5 #(
    .INIT(32'h00200000)) 
    \z_write_data[9]_INST_0 
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(Q[9]),
        .O(z_write_data[9]));
  LUT5 #(
    .INIT(32'h00200000)) 
    z_write_en_INST_0
       (.I0(go),
        .I1(fsm_out[0]),
        .I2(fsm_out[1]),
        .I3(z_done),
        .I4(mult_pipe0_done),
        .O(z_write_en));
endmodule
