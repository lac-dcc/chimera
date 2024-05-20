// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Jul  7 03:04:42 2022
// Host        : boba running 64-bit Ubuntu 20.04.3 LTS
// Command     : write_verilog -force -file
//               runs/2022-07-06-1704-full/vivado-eval/xilinx-ultrascale-plus-vivado-eval//vivado-synth-opt-place-route//invoke-with.futil-vanilla-opt.v
// Design      : main
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xczu3eg-sbva484-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NETLIST_CHECKSUM = "6fc153af" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module main
   (go,
    clk,
    reset,
    done,
    .out_addr0(\<const0> ),
    out_write_data,
    out_write_en,
    out_clk,
    out_read_data,
    out_done);
  input go;
  input clk;
  input reset;
  output done;
  output [31:0]out_write_data;
  output out_write_en;
  output out_clk;
  input [31:0]out_read_data;
  input out_done;
  output \<const0> ;

  wire \<const0> ;
  wire clk;
  wire comb_reg0_done;
  wire comb_reg_n_1;
  wire [31:16]\comp/out_tmp_reg ;
  wire do_adds0_go_in;
  wire done;
  wire fsm_n_3;
  wire [1:0]fsm_out;
  wire go;
  wire invoke_go_in;
  wire m_done;
  wire m_n_17;
  wire m_n_18;
  wire m_n_19;
  wire m_n_20;
  wire m_n_21;
  wire m_n_22;
  wire m_n_23;
  wire m_n_24;
  wire m_n_25;
  wire m_n_26;
  wire m_n_27;
  wire m_n_28;
  wire m_n_29;
  wire m_n_30;
  wire m_n_31;
  wire m_n_32;
  wire out_done;
  wire [31:0]out_write_data;
  wire out_write_en;
  wire [1:1]p_0_in;
  wire reset;

  assign out_clk = clk;
  GND GND
       (.G(\<const0> ));
  std_reg comb_reg
       (.Q(fsm_out),
        .clk(clk),
        .comb_reg0_done(comb_reg0_done),
        .do_adds0_go_in(do_adds0_go_in),
        .go(go),
        .\out_reg[1]_0 (comb_reg_n_1),
        .reset(reset));
  std_reg__parameterized0 fsm
       (.A(p_0_in),
        .E(invoke_go_in),
        .Q(fsm_out),
        .clk(clk),
        .comb_reg0_done(comb_reg0_done),
        .do_adds0_go_in(do_adds0_go_in),
        .done(done),
        .\done_buf_reg[2] (fsm_n_3),
        .go(go),
        .m_done(m_done),
        .out_done(out_done),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .out_tmp_reg_0(comb_reg_n_1),
        .out_write_data(out_write_data),
        .\out_write_data[15] ({m_n_17,m_n_18,m_n_19,m_n_20,m_n_21,m_n_22,m_n_23,m_n_24,m_n_25,m_n_26,m_n_27,m_n_28,m_n_29,m_n_30,m_n_31,m_n_32}),
        .out_write_en(out_write_en),
        .reset(reset));
  std_mult_pipe m
       (.A(p_0_in),
        .E(invoke_go_in),
        .Q(fsm_out),
        .clk(clk),
        .\done_buf_reg[2] (fsm_n_3),
        .go(go),
        .m_done(m_done),
        .out_tmp_reg(\comp/out_tmp_reg ),
        .\out_tmp_reg[15]__0 ({m_n_17,m_n_18,m_n_19,m_n_20,m_n_21,m_n_22,m_n_23,m_n_24,m_n_25,m_n_26,m_n_27,m_n_28,m_n_29,m_n_30,m_n_31,m_n_32}),
        .reset(reset));
endmodule

module std_fp_mult_pipe
   (m_done,
    out_tmp_reg_0,
    \out_tmp_reg[15]__0_0 ,
    clk,
    \done_buf_reg[2]_0 ,
    E,
    reset,
    A,
    Q,
    go);
  output m_done;
  output [15:0]out_tmp_reg_0;
  output [15:0]\out_tmp_reg[15]__0_0 ;
  input clk;
  input \done_buf_reg[2]_0 ;
  input [0:0]E;
  input reset;
  input [0:0]A;
  input [1:0]Q;
  input go;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]A;
  wire [0:0]E;
  wire GND_2;
  wire [1:0]Q;
  wire VCC_2;
  wire clk;
  wire \done_buf_reg[2]_0 ;
  wire \done_buf_reg_n_0_[0] ;
  wire \done_buf_reg_n_0_[1] ;
  wire go;
  wire m_done;
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
  wire [15:0]\out_tmp_reg[15]__0_0 ;
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
  wire start__0;
  wire [7:0]NLW_out0_carry_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  FDRE \done_buf_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(start__0),
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
        .Q(m_done),
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
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A,A,A}),
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
        .CEP(E),
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
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A,A}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A,A,A}),
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
        .S({out0_carry_i_1_n_0,out0_carry_i_2_n_0,out0_carry_i_3_n_0,out0_carry_i_4_n_0,out0_carry_i_5_n_0,out0_carry_i_6_n_0,out0_carry_i_7_n_0,\out_tmp_reg[16]__0_n_0 }));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY8 out0_carry__0
       (.CI(out0_carry_n_0),
        .CI_TOP(GND_2),
        .DI({\<const0> ,out_tmp_reg_n_92,out_tmp_reg_n_93,out_tmp_reg_n_94,out_tmp_reg_n_95,out_tmp_reg_n_96,out_tmp_reg_n_97,out_tmp_reg_n_98}),
        .O(out_tmp_reg_0[15:8]),
        .S({out0_carry_i_1__0_n_0,out0_carry_i_2__0_n_0,out0_carry_i_3__0_n_0,out0_carry_i_4__0_n_0,out0_carry_i_5__0_n_0,out0_carry_i_6__0_n_0,out0_carry_i_7__0_n_0,out0_carry_i_8_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1
       (.I0(out_tmp_reg_n_99),
        .I1(out0_n_99),
        .O(out0_carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    out0_carry_i_1__0
       (.I0(out_tmp_reg_n_91),
        .I1(out0_n_91),
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
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,A,A}),
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
        .CEP(E),
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
        .CE(E),
        .D(out0__0_n_105),
        .Q(\out_tmp_reg[15]__0_0 [0]),
        .R(reset));
  FDRE \out_tmp_reg[10]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_95),
        .Q(\out_tmp_reg[15]__0_0 [10]),
        .R(reset));
  FDRE \out_tmp_reg[11]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_94),
        .Q(\out_tmp_reg[15]__0_0 [11]),
        .R(reset));
  FDRE \out_tmp_reg[12]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_93),
        .Q(\out_tmp_reg[15]__0_0 [12]),
        .R(reset));
  FDRE \out_tmp_reg[13]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_92),
        .Q(\out_tmp_reg[15]__0_0 [13]),
        .R(reset));
  FDRE \out_tmp_reg[14]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_91),
        .Q(\out_tmp_reg[15]__0_0 [14]),
        .R(reset));
  FDRE \out_tmp_reg[15]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_90),
        .Q(\out_tmp_reg[15]__0_0 [15]),
        .R(reset));
  FDRE \out_tmp_reg[16]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_89),
        .Q(\out_tmp_reg[16]__0_n_0 ),
        .R(reset));
  FDRE \out_tmp_reg[1]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_104),
        .Q(\out_tmp_reg[15]__0_0 [1]),
        .R(reset));
  FDRE \out_tmp_reg[2]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_103),
        .Q(\out_tmp_reg[15]__0_0 [2]),
        .R(reset));
  FDRE \out_tmp_reg[3]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_102),
        .Q(\out_tmp_reg[15]__0_0 [3]),
        .R(reset));
  FDRE \out_tmp_reg[4]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_101),
        .Q(\out_tmp_reg[15]__0_0 [4]),
        .R(reset));
  FDRE \out_tmp_reg[5]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_100),
        .Q(\out_tmp_reg[15]__0_0 [5]),
        .R(reset));
  FDRE \out_tmp_reg[6]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_99),
        .Q(\out_tmp_reg[15]__0_0 [6]),
        .R(reset));
  FDRE \out_tmp_reg[7]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_98),
        .Q(\out_tmp_reg[15]__0_0 [7]),
        .R(reset));
  FDRE \out_tmp_reg[8]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_97),
        .Q(\out_tmp_reg[15]__0_0 [8]),
        .R(reset));
  FDRE \out_tmp_reg[9]__0 
       (.C(clk),
        .CE(E),
        .D(out0__0_n_96),
        .Q(\out_tmp_reg[15]__0_0 [9]),
        .R(reset));
  LUT6 #(
    .INIT(64'h0000000000001000)) 
    start
       (.I0(m_done),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(go),
        .I4(\done_buf_reg_n_0_[0] ),
        .I5(\done_buf_reg_n_0_[1] ),
        .O(start__0));
endmodule

module std_mult_pipe
   (m_done,
    out_tmp_reg,
    \out_tmp_reg[15]__0 ,
    clk,
    \done_buf_reg[2] ,
    E,
    reset,
    A,
    Q,
    go);
  output m_done;
  output [15:0]out_tmp_reg;
  output [15:0]\out_tmp_reg[15]__0 ;
  input clk;
  input \done_buf_reg[2] ;
  input [0:0]E;
  input reset;
  input [0:0]A;
  input [1:0]Q;
  input go;

  wire [0:0]A;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire \done_buf_reg[2] ;
  wire go;
  wire m_done;
  wire [15:0]out_tmp_reg;
  wire [15:0]\out_tmp_reg[15]__0 ;
  wire reset;

  std_fp_mult_pipe comp
       (.A(A),
        .E(E),
        .Q(Q),
        .clk(clk),
        .\done_buf_reg[2]_0 (\done_buf_reg[2] ),
        .go(go),
        .m_done(m_done),
        .\out_tmp_reg[15]__0_0 (\out_tmp_reg[15]__0 ),
        .out_tmp_reg_0(out_tmp_reg),
        .reset(reset));
endmodule

module std_reg
   (comb_reg0_done,
    \out_reg[1]_0 ,
    reset,
    do_adds0_go_in,
    clk,
    go,
    Q);
  output comb_reg0_done;
  output \out_reg[1]_0 ;
  input reset;
  input do_adds0_go_in;
  input clk;
  input go;
  input [1:0]Q;

  wire \<const1> ;
  wire [1:0]Q;
  wire clk;
  wire comb_reg0_done;
  wire do_adds0_go_in;
  wire go;
  wire \out[1]_i_1__0_n_0 ;
  wire \out_reg[1]_0 ;
  wire reset;

  VCC VCC
       (.P(\<const1> ));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(do_adds0_go_in),
        .Q(comb_reg0_done),
        .R(reset));
  LUT5 #(
    .INIT(32'hFFFF0004)) 
    \out[1]_i_1__0 
       (.I0(comb_reg0_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_reg[1]_0 ),
        .O(\out[1]_i_1__0_n_0 ));
  FDRE \out_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\out[1]_i_1__0_n_0 ),
        .Q(\out_reg[1]_0 ),
        .R(reset));
endmodule

(* ORIG_REF_NAME = "std_reg" *) 
module std_reg__parameterized0
   (Q,
    out_write_en,
    \done_buf_reg[2] ,
    A,
    E,
    do_adds0_go_in,
    out_write_data,
    done,
    out_done,
    go,
    comb_reg0_done,
    m_done,
    out_tmp_reg_0,
    out_tmp_reg,
    \out_write_data[15] ,
    reset,
    clk);
  output [1:0]Q;
  output out_write_en;
  output \done_buf_reg[2] ;
  output [0:0]A;
  output [0:0]E;
  output do_adds0_go_in;
  output [31:0]out_write_data;
  output done;
  input out_done;
  input go;
  input comb_reg0_done;
  input m_done;
  input out_tmp_reg_0;
  input [15:0]out_tmp_reg;
  input [15:0]\out_write_data[15] ;
  input reset;
  input clk;

  wire [0:0]A;
  wire [0:0]E;
  wire [1:0]Q;
  wire clk;
  wire comb_reg0_done;
  wire do_adds0_go_in;
  wire done;
  wire \done_buf_reg[2] ;
  wire [1:0]fsm_in;
  wire fsm_write_en;
  wire go;
  wire m_done;
  wire out_done;
  wire [15:0]out_tmp_reg;
  wire out_tmp_reg_0;
  wire [31:0]out_write_data;
  wire [15:0]\out_write_data[15] ;
  wire out_write_en;
  wire reset;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    done_INST_0
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(done));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hEFFF)) 
    \done_buf[1]_i_1 
       (.I0(m_done),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(go),
        .O(\done_buf_reg[2] ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    done_i_1
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(go),
        .I3(comb_reg0_done),
        .O(do_adds0_go_in));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    out0_i_1
       (.I0(go),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(m_done),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    out0_i_2
       (.I0(out_tmp_reg_0),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(m_done),
        .O(A));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h000088C0)) 
    \out[0]_i_1 
       (.I0(out_done),
        .I1(go),
        .I2(comb_reg0_done),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(fsm_in[0]));
  LUT6 #(
    .INIT(64'hFBC0F8C0CBC0C8C0)) 
    \out[1]_i_1 
       (.I0(out_done),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(go),
        .I4(comb_reg0_done),
        .I5(m_done),
        .O(fsm_write_en));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0088A000)) 
    \out[1]_i_2 
       (.I0(go),
        .I1(m_done),
        .I2(out_done),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(fsm_in[1]));
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
    .INIT(32'h04000000)) 
    \out_write_data[0]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [0]),
        .O(out_write_data[0]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[10]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [10]),
        .O(out_write_data[10]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[11]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [11]),
        .O(out_write_data[11]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[12]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [12]),
        .O(out_write_data[12]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[13]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [13]),
        .O(out_write_data[13]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[14]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [14]),
        .O(out_write_data[14]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[15]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [15]),
        .O(out_write_data[15]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[16]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[0]),
        .O(out_write_data[16]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[17]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[1]),
        .O(out_write_data[17]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[18]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[2]),
        .O(out_write_data[18]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[19]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[3]),
        .O(out_write_data[19]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[1]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [1]),
        .O(out_write_data[1]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[20]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[4]),
        .O(out_write_data[20]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[21]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[5]),
        .O(out_write_data[21]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[22]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[6]),
        .O(out_write_data[22]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[23]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[7]),
        .O(out_write_data[23]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[24]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[8]),
        .O(out_write_data[24]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[25]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[9]),
        .O(out_write_data[25]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[26]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[10]),
        .O(out_write_data[26]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[27]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[11]),
        .O(out_write_data[27]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[28]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[12]),
        .O(out_write_data[28]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[29]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[13]),
        .O(out_write_data[29]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[2]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [2]),
        .O(out_write_data[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[30]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[14]),
        .O(out_write_data[30]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[31]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(out_tmp_reg[15]),
        .O(out_write_data[31]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[3]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [3]),
        .O(out_write_data[3]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[4]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [4]),
        .O(out_write_data[4]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[5]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [5]),
        .O(out_write_data[5]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[6]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [6]),
        .O(out_write_data[6]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[7]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [7]),
        .O(out_write_data[7]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[8]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [8]),
        .O(out_write_data[8]));
  LUT5 #(
    .INIT(32'h04000000)) 
    \out_write_data[9]_INST_0 
       (.I0(out_done),
        .I1(go),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(\out_write_data[15] [9]),
        .O(out_write_data[9]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    out_write_en_INST_0
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(go),
        .I3(out_done),
        .O(out_write_en));
endmodule
