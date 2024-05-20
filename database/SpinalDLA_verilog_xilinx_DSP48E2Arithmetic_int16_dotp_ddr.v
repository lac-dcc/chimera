// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : int16_dotp_ddr
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module int16_dotp_ddr (
  input      [15:0]   io_a_0,
  input      [15:0]   io_a_1,
  input      [15:0]   io_a_2,
  input      [15:0]   io_a_3,
  input      [15:0]   io_a_4,
  input      [15:0]   io_a_5,
  input      [15:0]   io_a_6,
  input      [15:0]   io_a_7,
  input      [15:0]   io_b_0,
  input      [15:0]   io_b_1,
  input      [15:0]   io_b_2,
  input      [15:0]   io_b_3,
  input      [15:0]   io_b_4,
  input      [15:0]   io_b_5,
  input      [15:0]   io_b_6,
  input      [15:0]   io_b_7,
  output     [47:0]   io_ab,
  input               clk,
  input               reset
);

  reg        [4:0]    dsp48e2s_0_INMODE;
  reg        [8:0]    dsp48e2s_0_OPMODE;
  wire       [29:0]   dsp48e2s_0_A;
  wire       [17:0]   dsp48e2s_0_B;
  reg        [4:0]    dsp48e2s_1_INMODE;
  reg        [8:0]    dsp48e2s_1_OPMODE;
  wire       [29:0]   dsp48e2s_1_A;
  wire       [17:0]   dsp48e2s_1_B;
  reg        [4:0]    dsp48e2s_2_INMODE;
  reg        [8:0]    dsp48e2s_2_OPMODE;
  wire       [29:0]   dsp48e2s_2_A;
  wire       [17:0]   dsp48e2s_2_B;
  reg        [4:0]    dsp48e2s_3_INMODE;
  reg        [8:0]    dsp48e2s_3_OPMODE;
  wire       [29:0]   dsp48e2s_3_A;
  wire       [17:0]   dsp48e2s_3_B;
  reg        [4:0]    dsp48e2s_4_INMODE;
  reg        [8:0]    dsp48e2s_4_OPMODE;
  wire       [29:0]   dsp48e2s_4_A;
  wire       [17:0]   dsp48e2s_4_B;
  reg        [4:0]    dsp48e2s_5_INMODE;
  reg        [8:0]    dsp48e2s_5_OPMODE;
  wire       [29:0]   dsp48e2s_5_A;
  wire       [17:0]   dsp48e2s_5_B;
  reg        [4:0]    dsp48e2s_6_INMODE;
  reg        [8:0]    dsp48e2s_6_OPMODE;
  wire       [29:0]   dsp48e2s_6_A;
  wire       [17:0]   dsp48e2s_6_B;
  reg        [4:0]    dsp48e2s_7_INMODE;
  reg        [8:0]    dsp48e2s_7_OPMODE;
  wire       [29:0]   dsp48e2s_7_A;
  wire       [17:0]   dsp48e2s_7_B;
  wire       [29:0]   dsp48e2s_0_ACOUT;
  wire       [17:0]   dsp48e2s_0_BCOUT;
  wire       [47:0]   dsp48e2s_0_PCOUT;
  wire       [0:0]    dsp48e2s_0_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_0_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_0_P;
  wire       [3:0]    dsp48e2s_0_CARRYOUT;
  wire       [7:0]    dsp48e2s_0_XOROUT;
  wire                dsp48e2s_0_OVERFLOW;
  wire                dsp48e2s_0_UNDERFLOW;
  wire                dsp48e2s_0_PATTERNBDETECT;
  wire                dsp48e2s_0_PATTERNDETECT;
  wire       [29:0]   dsp48e2s_1_ACOUT;
  wire       [17:0]   dsp48e2s_1_BCOUT;
  wire       [47:0]   dsp48e2s_1_PCOUT;
  wire       [0:0]    dsp48e2s_1_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_1_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_1_P;
  wire       [3:0]    dsp48e2s_1_CARRYOUT;
  wire       [7:0]    dsp48e2s_1_XOROUT;
  wire                dsp48e2s_1_OVERFLOW;
  wire                dsp48e2s_1_UNDERFLOW;
  wire                dsp48e2s_1_PATTERNBDETECT;
  wire                dsp48e2s_1_PATTERNDETECT;
  wire       [29:0]   dsp48e2s_2_ACOUT;
  wire       [17:0]   dsp48e2s_2_BCOUT;
  wire       [47:0]   dsp48e2s_2_PCOUT;
  wire       [0:0]    dsp48e2s_2_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_2_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_2_P;
  wire       [3:0]    dsp48e2s_2_CARRYOUT;
  wire       [7:0]    dsp48e2s_2_XOROUT;
  wire                dsp48e2s_2_OVERFLOW;
  wire                dsp48e2s_2_UNDERFLOW;
  wire                dsp48e2s_2_PATTERNBDETECT;
  wire                dsp48e2s_2_PATTERNDETECT;
  wire       [29:0]   dsp48e2s_3_ACOUT;
  wire       [17:0]   dsp48e2s_3_BCOUT;
  wire       [47:0]   dsp48e2s_3_PCOUT;
  wire       [0:0]    dsp48e2s_3_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_3_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_3_P;
  wire       [3:0]    dsp48e2s_3_CARRYOUT;
  wire       [7:0]    dsp48e2s_3_XOROUT;
  wire                dsp48e2s_3_OVERFLOW;
  wire                dsp48e2s_3_UNDERFLOW;
  wire                dsp48e2s_3_PATTERNBDETECT;
  wire                dsp48e2s_3_PATTERNDETECT;
  wire       [29:0]   dsp48e2s_4_ACOUT;
  wire       [17:0]   dsp48e2s_4_BCOUT;
  wire       [47:0]   dsp48e2s_4_PCOUT;
  wire       [0:0]    dsp48e2s_4_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_4_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_4_P;
  wire       [3:0]    dsp48e2s_4_CARRYOUT;
  wire       [7:0]    dsp48e2s_4_XOROUT;
  wire                dsp48e2s_4_OVERFLOW;
  wire                dsp48e2s_4_UNDERFLOW;
  wire                dsp48e2s_4_PATTERNBDETECT;
  wire                dsp48e2s_4_PATTERNDETECT;
  wire       [29:0]   dsp48e2s_5_ACOUT;
  wire       [17:0]   dsp48e2s_5_BCOUT;
  wire       [47:0]   dsp48e2s_5_PCOUT;
  wire       [0:0]    dsp48e2s_5_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_5_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_5_P;
  wire       [3:0]    dsp48e2s_5_CARRYOUT;
  wire       [7:0]    dsp48e2s_5_XOROUT;
  wire                dsp48e2s_5_OVERFLOW;
  wire                dsp48e2s_5_UNDERFLOW;
  wire                dsp48e2s_5_PATTERNBDETECT;
  wire                dsp48e2s_5_PATTERNDETECT;
  wire       [29:0]   dsp48e2s_6_ACOUT;
  wire       [17:0]   dsp48e2s_6_BCOUT;
  wire       [47:0]   dsp48e2s_6_PCOUT;
  wire       [0:0]    dsp48e2s_6_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_6_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_6_P;
  wire       [3:0]    dsp48e2s_6_CARRYOUT;
  wire       [7:0]    dsp48e2s_6_XOROUT;
  wire                dsp48e2s_6_OVERFLOW;
  wire                dsp48e2s_6_UNDERFLOW;
  wire                dsp48e2s_6_PATTERNBDETECT;
  wire                dsp48e2s_6_PATTERNDETECT;
  wire       [29:0]   dsp48e2s_7_ACOUT;
  wire       [17:0]   dsp48e2s_7_BCOUT;
  wire       [47:0]   dsp48e2s_7_PCOUT;
  wire       [0:0]    dsp48e2s_7_CARRYCASCOUT;
  wire       [0:0]    dsp48e2s_7_MULTSIGNOUT;
  wire       [47:0]   dsp48e2s_7_P;
  wire       [3:0]    dsp48e2s_7_CARRYOUT;
  wire       [7:0]    dsp48e2s_7_XOROUT;
  wire                dsp48e2s_7_OVERFLOW;
  wire                dsp48e2s_7_UNDERFLOW;
  wire                dsp48e2s_7_PATTERNBDETECT;
  wire                dsp48e2s_7_PATTERNDETECT;
  wire       [29:0]   tmp_A;
  wire       [15:0]   tmp_A_1;
  wire       [17:0]   tmp_B;
  wire       [15:0]   tmp_B_1;
  wire       [29:0]   tmp_A_2;
  wire       [15:0]   tmp_A_3;
  wire       [17:0]   tmp_B_2;
  wire       [15:0]   tmp_B_3;
  wire       [29:0]   tmp_A_4;
  wire       [15:0]   tmp_A_5;
  wire       [17:0]   tmp_B_4;
  wire       [15:0]   tmp_B_5;
  wire       [29:0]   tmp_A_6;
  wire       [15:0]   tmp_A_7;
  wire       [17:0]   tmp_B_6;
  wire       [15:0]   tmp_B_7;
  wire       [29:0]   tmp_A_8;
  wire       [15:0]   tmp_A_9;
  wire       [17:0]   tmp_B_8;
  wire       [15:0]   tmp_B_9;
  wire       [29:0]   tmp_A_10;
  wire       [15:0]   tmp_A_11;
  wire       [17:0]   tmp_B_10;
  wire       [15:0]   tmp_B_11;
  wire       [29:0]   tmp_A_12;
  wire       [15:0]   tmp_A_13;
  wire       [17:0]   tmp_B_12;
  wire       [15:0]   tmp_B_13;
  wire       [29:0]   tmp_A_14;
  wire       [15:0]   tmp_A_15;
  wire       [17:0]   tmp_B_14;
  wire       [15:0]   tmp_B_15;
  wire                ce1_0;
  reg                 ce1_1;
  reg                 ce1_2;
  reg                 ce1_3;
  reg                 ce1_4;
  reg                 ce1_5;
  reg                 ce1_6;
  reg                 ce1_7;
  wire                ce2_0;
  reg                 ce2_1;
  reg                 ce2_2;
  reg                 ce2_3;
  reg                 ce2_4;
  reg                 ce2_5;
  reg                 ce2_6;
  reg                 ce2_7;
  reg                 selA_0;
  reg                 selA_1;
  reg                 selA_2;
  reg                 selA_3;
  reg                 selA_4;
  reg                 selA_5;
  reg                 selA_6;
  reg                 selA_7;
  wire                selB_0;
  reg                 selB_1;
  reg                 selB_2;
  reg                 selB_3;
  reg                 selB_4;
  reg                 selB_5;
  reg                 selB_6;
  reg                 selB_7;
  reg        [1:0]    cnt;
  reg                 tmp_ce1_0;
  reg                 tmp_ce2_0;
  wire                when_int16_dotp_ddr_l47;
  function [8:0] zz_dsp48e2s_0_OPMODE(input dummy);
    begin
      zz_dsp48e2s_0_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_0_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_0_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_0_OPMODE[6 : 4] = {2'b00,1'b0};
    end
  endfunction
  wire [8:0] tmp_1;
  function [8:0] zz_dsp48e2s_1_OPMODE(input dummy);
    begin
      zz_dsp48e2s_1_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_1_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_1_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_1_OPMODE[6 : 4] = {2'b00,1'b1};
    end
  endfunction
  wire [8:0] tmp_2;
  function [8:0] zz_dsp48e2s_2_OPMODE(input dummy);
    begin
      zz_dsp48e2s_2_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_2_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_2_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_2_OPMODE[6 : 4] = {2'b00,1'b1};
    end
  endfunction
  wire [8:0] tmp_3;
  function [8:0] zz_dsp48e2s_3_OPMODE(input dummy);
    begin
      zz_dsp48e2s_3_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_3_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_3_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_3_OPMODE[6 : 4] = {2'b00,1'b1};
    end
  endfunction
  wire [8:0] tmp_4;
  function [8:0] zz_dsp48e2s_4_OPMODE(input dummy);
    begin
      zz_dsp48e2s_4_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_4_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_4_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_4_OPMODE[6 : 4] = {2'b00,1'b1};
    end
  endfunction
  wire [8:0] tmp_5;
  function [8:0] zz_dsp48e2s_5_OPMODE(input dummy);
    begin
      zz_dsp48e2s_5_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_5_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_5_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_5_OPMODE[6 : 4] = {2'b00,1'b1};
    end
  endfunction
  wire [8:0] tmp_6;
  function [8:0] zz_dsp48e2s_6_OPMODE(input dummy);
    begin
      zz_dsp48e2s_6_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_6_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_6_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_6_OPMODE[6 : 4] = {2'b00,1'b1};
    end
  endfunction
  wire [8:0] tmp_7;
  function [8:0] zz_dsp48e2s_7_OPMODE(input dummy);
    begin
      zz_dsp48e2s_7_OPMODE[8 : 7] = {1'b0,1'b0};
      zz_dsp48e2s_7_OPMODE[1 : 0] = {1'b0,1'b1};
      zz_dsp48e2s_7_OPMODE[3 : 2] = {1'b0,1'b1};
      zz_dsp48e2s_7_OPMODE[6 : 4] = {2'b00,1'b1};
    end
  endfunction
  wire [8:0] tmp_8;

  assign tmp_A_1 = io_b_0;
  assign tmp_A = {{14{tmp_A_1[15]}}, tmp_A_1};
  assign tmp_B_1 = io_a_0;
  assign tmp_B = {{2{tmp_B_1[15]}}, tmp_B_1};
  assign tmp_A_3 = io_b_1;
  assign tmp_A_2 = {{14{tmp_A_3[15]}}, tmp_A_3};
  assign tmp_B_3 = io_a_1;
  assign tmp_B_2 = {{2{tmp_B_3[15]}}, tmp_B_3};
  assign tmp_A_5 = io_b_2;
  assign tmp_A_4 = {{14{tmp_A_5[15]}}, tmp_A_5};
  assign tmp_B_5 = io_a_2;
  assign tmp_B_4 = {{2{tmp_B_5[15]}}, tmp_B_5};
  assign tmp_A_7 = io_b_3;
  assign tmp_A_6 = {{14{tmp_A_7[15]}}, tmp_A_7};
  assign tmp_B_7 = io_a_3;
  assign tmp_B_6 = {{2{tmp_B_7[15]}}, tmp_B_7};
  assign tmp_A_9 = io_b_4;
  assign tmp_A_8 = {{14{tmp_A_9[15]}}, tmp_A_9};
  assign tmp_B_9 = io_a_4;
  assign tmp_B_8 = {{2{tmp_B_9[15]}}, tmp_B_9};
  assign tmp_A_11 = io_b_5;
  assign tmp_A_10 = {{14{tmp_A_11[15]}}, tmp_A_11};
  assign tmp_B_11 = io_a_5;
  assign tmp_B_10 = {{2{tmp_B_11[15]}}, tmp_B_11};
  assign tmp_A_13 = io_b_6;
  assign tmp_A_12 = {{14{tmp_A_13[15]}}, tmp_A_13};
  assign tmp_B_13 = io_a_6;
  assign tmp_B_12 = {{2{tmp_B_13[15]}}, tmp_B_13};
  assign tmp_A_15 = io_b_7;
  assign tmp_A_14 = {{14{tmp_A_15[15]}}, tmp_A_15};
  assign tmp_B_15 = io_a_7;
  assign tmp_B_14 = {{2{tmp_B_15[15]}}, tmp_B_15};
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_0 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_0_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_0_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (48'h000000000000         ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_0_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_0_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_0_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_0_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_0_MULTSIGNOUT   ), //o
    .CEA1           (ce1_0                    ), //i
    .CEA2           (ce2_0                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_0_A[29:0]       ), //i
    .B              (dsp48e2s_0_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_0_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_0_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_0_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_0_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_0_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_0_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_0_PATTERNDETECT )  //o
  );
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_1 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_1_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_1_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (dsp48e2s_0_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_1_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_1_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_1_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_1_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_1_MULTSIGNOUT   ), //o
    .CEA1           (ce1_1                    ), //i
    .CEA2           (ce2_1                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_1_A[29:0]       ), //i
    .B              (dsp48e2s_1_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_1_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_1_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_1_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_1_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_1_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_1_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_1_PATTERNDETECT )  //o
  );
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_2 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_2_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_2_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (dsp48e2s_1_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_2_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_2_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_2_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_2_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_2_MULTSIGNOUT   ), //o
    .CEA1           (ce1_2                    ), //i
    .CEA2           (ce2_2                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_2_A[29:0]       ), //i
    .B              (dsp48e2s_2_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_2_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_2_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_2_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_2_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_2_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_2_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_2_PATTERNDETECT )  //o
  );
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_3 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_3_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_3_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (dsp48e2s_2_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_3_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_3_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_3_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_3_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_3_MULTSIGNOUT   ), //o
    .CEA1           (ce1_3                    ), //i
    .CEA2           (ce2_3                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_3_A[29:0]       ), //i
    .B              (dsp48e2s_3_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_3_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_3_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_3_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_3_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_3_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_3_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_3_PATTERNDETECT )  //o
  );
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_4 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_4_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_4_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (dsp48e2s_3_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_4_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_4_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_4_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_4_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_4_MULTSIGNOUT   ), //o
    .CEA1           (ce1_4                    ), //i
    .CEA2           (ce2_4                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_4_A[29:0]       ), //i
    .B              (dsp48e2s_4_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_4_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_4_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_4_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_4_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_4_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_4_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_4_PATTERNDETECT )  //o
  );
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_5 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_5_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_5_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (dsp48e2s_4_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_5_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_5_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_5_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_5_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_5_MULTSIGNOUT   ), //o
    .CEA1           (ce1_5                    ), //i
    .CEA2           (ce2_5                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_5_A[29:0]       ), //i
    .B              (dsp48e2s_5_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_5_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_5_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_5_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_5_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_5_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_5_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_5_PATTERNDETECT )  //o
  );
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_6 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_6_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_6_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (dsp48e2s_5_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_6_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_6_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_6_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_6_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_6_MULTSIGNOUT   ), //o
    .CEA1           (ce1_6                    ), //i
    .CEA2           (ce2_6                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_6_A[29:0]       ), //i
    .B              (dsp48e2s_6_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_6_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_6_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_6_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_6_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_6_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_6_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_6_PATTERNDETECT )  //o
  );
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(0),
    .ALUMODEREG(1)
  ) dsp48e2s_7 (
    .CLK            (clk                      ), //i
    .ALUMODE        (4'b0000                  ), //i
    .INMODE         (dsp48e2s_7_INMODE[4:0]   ), //i
    .OPMODE         (dsp48e2s_7_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000                   ), //i
    .ACIN           (30'h00000000             ), //i
    .BCIN           (18'h00000                ), //i
    .PCIN           (dsp48e2s_6_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_7_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_7_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_7_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_7_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_7_MULTSIGNOUT   ), //o
    .CEA1           (ce1_7                    ), //i
    .CEA2           (ce2_7                    ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
    .CEINMODE       (1'b1                     ), //i
    .CEALUMODE      (1'b0                     ), //i
    .RSTA           (1'b0                     ), //i
    .RSTB           (1'b0                     ), //i
    .RSTC           (1'b0                     ), //i
    .RSTD           (1'b0                     ), //i
    .RSTM           (1'b0                     ), //i
    .RSTP           (1'b0                     ), //i
    .RSTALLCARRYIN  (1'b0                     ), //i
    .RSTCTRL        (1'b0                     ), //i
    .RSTINMODE      (1'b0                     ), //i
    .RSTALUMODE     (1'b0                     ), //i
    .A              (dsp48e2s_7_A[29:0]       ), //i
    .B              (dsp48e2s_7_B[17:0]       ), //i
    .C              (48'hffffffffffff         ), //i
    .D              (27'h7ffffff              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_7_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_7_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_7_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_7_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_7_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_7_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_7_PATTERNDETECT )  //o
  );
  assign ce1_0 = tmp_ce1_0;
  assign ce2_0 = tmp_ce2_0;
  assign when_int16_dotp_ddr_l47 = 1'b1;
  always @(*) begin
    dsp48e2s_0_INMODE[1] = 1'b0;
    dsp48e2s_0_INMODE[2] = 1'b1;
    dsp48e2s_0_INMODE[3] = 1'b0;
    dsp48e2s_0_INMODE[0] = selA_0;
    dsp48e2s_0_INMODE[4] = 1'b0;
  end

  assign tmp_1 = zz_dsp48e2s_0_OPMODE(1'b0);
  always @(*) dsp48e2s_0_OPMODE = tmp_1;
  assign dsp48e2s_0_A = tmp_A;
  assign dsp48e2s_0_B = tmp_B;
  always @(*) begin
    dsp48e2s_1_INMODE[1] = 1'b0;
    dsp48e2s_1_INMODE[2] = 1'b1;
    dsp48e2s_1_INMODE[3] = 1'b0;
    dsp48e2s_1_INMODE[0] = selA_1;
    dsp48e2s_1_INMODE[4] = 1'b0;
  end

  assign tmp_2 = zz_dsp48e2s_1_OPMODE(1'b0);
  always @(*) dsp48e2s_1_OPMODE = tmp_2;
  assign dsp48e2s_1_A = tmp_A_2;
  assign dsp48e2s_1_B = tmp_B_2;
  always @(*) begin
    dsp48e2s_2_INMODE[1] = 1'b0;
    dsp48e2s_2_INMODE[2] = 1'b1;
    dsp48e2s_2_INMODE[3] = 1'b0;
    dsp48e2s_2_INMODE[0] = selA_2;
    dsp48e2s_2_INMODE[4] = 1'b0;
  end

  assign tmp_3 = zz_dsp48e2s_2_OPMODE(1'b0);
  always @(*) dsp48e2s_2_OPMODE = tmp_3;
  assign dsp48e2s_2_A = tmp_A_4;
  assign dsp48e2s_2_B = tmp_B_4;
  always @(*) begin
    dsp48e2s_3_INMODE[1] = 1'b0;
    dsp48e2s_3_INMODE[2] = 1'b1;
    dsp48e2s_3_INMODE[3] = 1'b0;
    dsp48e2s_3_INMODE[0] = selA_3;
    dsp48e2s_3_INMODE[4] = 1'b0;
  end

  assign tmp_4 = zz_dsp48e2s_3_OPMODE(1'b0);
  always @(*) dsp48e2s_3_OPMODE = tmp_4;
  assign dsp48e2s_3_A = tmp_A_6;
  assign dsp48e2s_3_B = tmp_B_6;
  always @(*) begin
    dsp48e2s_4_INMODE[1] = 1'b0;
    dsp48e2s_4_INMODE[2] = 1'b1;
    dsp48e2s_4_INMODE[3] = 1'b0;
    dsp48e2s_4_INMODE[0] = selA_4;
    dsp48e2s_4_INMODE[4] = 1'b0;
  end

  assign tmp_5 = zz_dsp48e2s_4_OPMODE(1'b0);
  always @(*) dsp48e2s_4_OPMODE = tmp_5;
  assign dsp48e2s_4_A = tmp_A_8;
  assign dsp48e2s_4_B = tmp_B_8;
  always @(*) begin
    dsp48e2s_5_INMODE[1] = 1'b0;
    dsp48e2s_5_INMODE[2] = 1'b1;
    dsp48e2s_5_INMODE[3] = 1'b0;
    dsp48e2s_5_INMODE[0] = selA_5;
    dsp48e2s_5_INMODE[4] = 1'b0;
  end

  assign tmp_6 = zz_dsp48e2s_5_OPMODE(1'b0);
  always @(*) dsp48e2s_5_OPMODE = tmp_6;
  assign dsp48e2s_5_A = tmp_A_10;
  assign dsp48e2s_5_B = tmp_B_10;
  always @(*) begin
    dsp48e2s_6_INMODE[1] = 1'b0;
    dsp48e2s_6_INMODE[2] = 1'b1;
    dsp48e2s_6_INMODE[3] = 1'b0;
    dsp48e2s_6_INMODE[0] = selA_6;
    dsp48e2s_6_INMODE[4] = 1'b0;
  end

  assign tmp_7 = zz_dsp48e2s_6_OPMODE(1'b0);
  always @(*) dsp48e2s_6_OPMODE = tmp_7;
  assign dsp48e2s_6_A = tmp_A_12;
  assign dsp48e2s_6_B = tmp_B_12;
  always @(*) begin
    dsp48e2s_7_INMODE[1] = 1'b0;
    dsp48e2s_7_INMODE[2] = 1'b1;
    dsp48e2s_7_INMODE[3] = 1'b0;
    dsp48e2s_7_INMODE[0] = selA_7;
    dsp48e2s_7_INMODE[4] = 1'b0;
  end

  assign tmp_8 = zz_dsp48e2s_7_OPMODE(1'b0);
  always @(*) dsp48e2s_7_OPMODE = tmp_8;
  assign dsp48e2s_7_A = tmp_A_14;
  assign dsp48e2s_7_B = tmp_B_14;
  assign io_ab = dsp48e2s_7_P;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      cnt <= 2'b00;
      tmp_ce1_0 <= 1'b0;
      tmp_ce2_0 <= 1'b0;
      selA_0 <= 1'b0;
    end else begin
      cnt <= (cnt + 2'b01);
      tmp_ce1_0 <= (cnt == 2'b11);
      tmp_ce2_0 <= (cnt == 2'b01);
      if(when_int16_dotp_ddr_l47) begin
        selA_0 <= (! selA_0);
      end
    end
  end

  always @(posedge clk) begin
    ce1_1 <= ce1_0;
    ce2_1 <= ce2_0;
    selA_1 <= selA_0;
    selB_1 <= selB_0;
    ce1_2 <= ce1_1;
    ce2_2 <= ce2_1;
    selA_2 <= selA_1;
    selB_2 <= selB_1;
    ce1_3 <= ce1_2;
    ce2_3 <= ce2_2;
    selA_3 <= selA_2;
    selB_3 <= selB_2;
    ce1_4 <= ce1_3;
    ce2_4 <= ce2_3;
    selA_4 <= selA_3;
    selB_4 <= selB_3;
    ce1_5 <= ce1_4;
    ce2_5 <= ce2_4;
    selA_5 <= selA_4;
    selB_5 <= selB_4;
    ce1_6 <= ce1_5;
    ce2_6 <= ce2_5;
    selA_6 <= selA_5;
    selB_6 <= selB_5;
    ce1_7 <= ce1_6;
    ce2_7 <= ce2_6;
    selA_7 <= selA_6;
    selB_7 <= selB_6;
  end


endmodule
