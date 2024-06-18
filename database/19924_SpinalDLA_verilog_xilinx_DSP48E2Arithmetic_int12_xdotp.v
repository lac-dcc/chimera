// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : int12_xdotp
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module int12_xdotp (
  input      [0:0]    io_aSel_0,
  input      [0:0]    io_aSel_1,
  input      [0:0]    io_aSel_2,
  input      [0:0]    io_aSel_3,
  input      [0:0]    io_aSel_4,
  input      [0:0]    io_aSel_5,
  input      [0:0]    io_aSel_6,
  input      [0:0]    io_aSel_7,
  input      [0:0]    io_bSel_0,
  input      [0:0]    io_bSel_1,
  input      [0:0]    io_bSel_2,
  input      [0:0]    io_bSel_3,
  input      [0:0]    io_bSel_4,
  input      [0:0]    io_bSel_5,
  input      [0:0]    io_bSel_6,
  input      [0:0]    io_bSel_7,
  input      [11:0]   io_a_0_0,
  input      [11:0]   io_a_0_1,
  input      [11:0]   io_a_0_2,
  input      [11:0]   io_a_0_3,
  input      [11:0]   io_a_1_0,
  input      [11:0]   io_a_1_1,
  input      [11:0]   io_a_1_2,
  input      [11:0]   io_a_1_3,
  input      [11:0]   io_a_2_0,
  input      [11:0]   io_a_2_1,
  input      [11:0]   io_a_2_2,
  input      [11:0]   io_a_2_3,
  input      [11:0]   io_a_3_0,
  input      [11:0]   io_a_3_1,
  input      [11:0]   io_a_3_2,
  input      [11:0]   io_a_3_3,
  input      [11:0]   io_a_4_0,
  input      [11:0]   io_a_4_1,
  input      [11:0]   io_a_4_2,
  input      [11:0]   io_a_4_3,
  input      [11:0]   io_a_5_0,
  input      [11:0]   io_a_5_1,
  input      [11:0]   io_a_5_2,
  input      [11:0]   io_a_5_3,
  input      [11:0]   io_a_6_0,
  input      [11:0]   io_a_6_1,
  input      [11:0]   io_a_6_2,
  input      [11:0]   io_a_6_3,
  input      [11:0]   io_a_7_0,
  input      [11:0]   io_a_7_1,
  input      [11:0]   io_a_7_2,
  input      [11:0]   io_a_7_3,
  input      [11:0]   io_b_0_0,
  input      [11:0]   io_b_0_1,
  input      [11:0]   io_b_0_2,
  input      [11:0]   io_b_0_3,
  input      [11:0]   io_b_1_0,
  input      [11:0]   io_b_1_1,
  input      [11:0]   io_b_1_2,
  input      [11:0]   io_b_1_3,
  input      [11:0]   io_b_2_0,
  input      [11:0]   io_b_2_1,
  input      [11:0]   io_b_2_2,
  input      [11:0]   io_b_2_3,
  input      [11:0]   io_b_3_0,
  input      [11:0]   io_b_3_1,
  input      [11:0]   io_b_3_2,
  input      [11:0]   io_b_3_3,
  input      [11:0]   io_b_4_0,
  input      [11:0]   io_b_4_1,
  input      [11:0]   io_b_4_2,
  input      [11:0]   io_b_4_3,
  input      [11:0]   io_b_5_0,
  input      [11:0]   io_b_5_1,
  input      [11:0]   io_b_5_2,
  input      [11:0]   io_b_5_3,
  input      [11:0]   io_b_6_0,
  input      [11:0]   io_b_6_1,
  input      [11:0]   io_b_6_2,
  input      [11:0]   io_b_6_3,
  input      [11:0]   io_b_7_0,
  input      [11:0]   io_b_7_1,
  input      [11:0]   io_b_7_2,
  input      [11:0]   io_b_7_3,
  output     [11:0]   io_ab_0,
  output     [11:0]   io_ab_1,
  output     [11:0]   io_ab_2,
  output     [11:0]   io_ab_3,
  input               clk
);

  reg        [4:0]    dsp48e2s_0_INMODE;
  reg        [8:0]    dsp48e2s_0_OPMODE;
  wire       [29:0]   dsp48e2s_0_A;
  wire       [17:0]   dsp48e2s_0_B;
  wire       [47:0]   dsp48e2s_0_C;
  reg        [4:0]    dsp48e2s_1_INMODE;
  reg        [8:0]    dsp48e2s_1_OPMODE;
  wire       [29:0]   dsp48e2s_1_A;
  wire       [17:0]   dsp48e2s_1_B;
  wire       [47:0]   dsp48e2s_1_C;
  reg        [4:0]    dsp48e2s_2_INMODE;
  reg        [8:0]    dsp48e2s_2_OPMODE;
  wire       [29:0]   dsp48e2s_2_A;
  wire       [17:0]   dsp48e2s_2_B;
  wire       [47:0]   dsp48e2s_2_C;
  reg        [4:0]    dsp48e2s_3_INMODE;
  reg        [8:0]    dsp48e2s_3_OPMODE;
  wire       [29:0]   dsp48e2s_3_A;
  wire       [17:0]   dsp48e2s_3_B;
  wire       [47:0]   dsp48e2s_3_C;
  reg        [4:0]    dsp48e2s_4_INMODE;
  reg        [8:0]    dsp48e2s_4_OPMODE;
  wire       [29:0]   dsp48e2s_4_A;
  wire       [17:0]   dsp48e2s_4_B;
  wire       [47:0]   dsp48e2s_4_C;
  reg        [4:0]    dsp48e2s_5_INMODE;
  reg        [8:0]    dsp48e2s_5_OPMODE;
  wire       [29:0]   dsp48e2s_5_A;
  wire       [17:0]   dsp48e2s_5_B;
  wire       [47:0]   dsp48e2s_5_C;
  reg        [4:0]    dsp48e2s_6_INMODE;
  reg        [8:0]    dsp48e2s_6_OPMODE;
  wire       [29:0]   dsp48e2s_6_A;
  wire       [17:0]   dsp48e2s_6_B;
  wire       [47:0]   dsp48e2s_6_C;
  reg        [4:0]    dsp48e2s_7_INMODE;
  reg        [8:0]    dsp48e2s_7_OPMODE;
  wire       [29:0]   dsp48e2s_7_A;
  wire       [17:0]   dsp48e2s_7_B;
  wire       [47:0]   dsp48e2s_7_C;
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
  wire                tmp_OPMODE;
  wire                tmp_OPMODE_1;
  wire       [47:0]   tmp_A;
  wire                tmp_OPMODE_2;
  wire                tmp_OPMODE_3;
  wire       [47:0]   tmp_A_1;
  wire                tmp_OPMODE_4;
  wire                tmp_OPMODE_5;
  wire       [47:0]   tmp_A_2;
  wire                tmp_OPMODE_6;
  wire                tmp_OPMODE_7;
  wire       [47:0]   tmp_A_3;
  wire                tmp_OPMODE_8;
  wire                tmp_OPMODE_9;
  wire       [47:0]   tmp_A_4;
  wire                tmp_OPMODE_10;
  wire                tmp_OPMODE_11;
  wire       [47:0]   tmp_A_5;
  wire                tmp_OPMODE_12;
  wire                tmp_OPMODE_13;
  wire       [47:0]   tmp_A_6;
  wire                tmp_OPMODE_14;
  wire                tmp_OPMODE_15;
  wire       [47:0]   tmp_A_7;
  function [4:0] zz_dsp48e2s_0_INMODE(input dummy);
    begin
      zz_dsp48e2s_0_INMODE[1] = 1'b0;
      zz_dsp48e2s_0_INMODE[2] = 1'b1;
      zz_dsp48e2s_0_INMODE[3] = 1'b0;
      zz_dsp48e2s_0_INMODE[0] = 1'b0;
      zz_dsp48e2s_0_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_1;
  function [4:0] zz_dsp48e2s_1_INMODE(input dummy);
    begin
      zz_dsp48e2s_1_INMODE[1] = 1'b0;
      zz_dsp48e2s_1_INMODE[2] = 1'b1;
      zz_dsp48e2s_1_INMODE[3] = 1'b0;
      zz_dsp48e2s_1_INMODE[0] = 1'b0;
      zz_dsp48e2s_1_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_2;
  function [4:0] zz_dsp48e2s_2_INMODE(input dummy);
    begin
      zz_dsp48e2s_2_INMODE[1] = 1'b0;
      zz_dsp48e2s_2_INMODE[2] = 1'b1;
      zz_dsp48e2s_2_INMODE[3] = 1'b0;
      zz_dsp48e2s_2_INMODE[0] = 1'b0;
      zz_dsp48e2s_2_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_3;
  function [4:0] zz_dsp48e2s_3_INMODE(input dummy);
    begin
      zz_dsp48e2s_3_INMODE[1] = 1'b0;
      zz_dsp48e2s_3_INMODE[2] = 1'b1;
      zz_dsp48e2s_3_INMODE[3] = 1'b0;
      zz_dsp48e2s_3_INMODE[0] = 1'b0;
      zz_dsp48e2s_3_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_4;
  function [4:0] zz_dsp48e2s_4_INMODE(input dummy);
    begin
      zz_dsp48e2s_4_INMODE[1] = 1'b0;
      zz_dsp48e2s_4_INMODE[2] = 1'b1;
      zz_dsp48e2s_4_INMODE[3] = 1'b0;
      zz_dsp48e2s_4_INMODE[0] = 1'b0;
      zz_dsp48e2s_4_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_5;
  function [4:0] zz_dsp48e2s_5_INMODE(input dummy);
    begin
      zz_dsp48e2s_5_INMODE[1] = 1'b0;
      zz_dsp48e2s_5_INMODE[2] = 1'b1;
      zz_dsp48e2s_5_INMODE[3] = 1'b0;
      zz_dsp48e2s_5_INMODE[0] = 1'b0;
      zz_dsp48e2s_5_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_6;
  function [4:0] zz_dsp48e2s_6_INMODE(input dummy);
    begin
      zz_dsp48e2s_6_INMODE[1] = 1'b0;
      zz_dsp48e2s_6_INMODE[2] = 1'b1;
      zz_dsp48e2s_6_INMODE[3] = 1'b0;
      zz_dsp48e2s_6_INMODE[0] = 1'b0;
      zz_dsp48e2s_6_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_7;
  function [4:0] zz_dsp48e2s_7_INMODE(input dummy);
    begin
      zz_dsp48e2s_7_INMODE[1] = 1'b0;
      zz_dsp48e2s_7_INMODE[2] = 1'b1;
      zz_dsp48e2s_7_INMODE[3] = 1'b0;
      zz_dsp48e2s_7_INMODE[0] = 1'b0;
      zz_dsp48e2s_7_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_8;

  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_0_C[47:0]       ), //i
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
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_1_C[47:0]       ), //i
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
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_2_C[47:0]       ), //i
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
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_3_C[47:0]       ), //i
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
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_4_C[47:0]       ), //i
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
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_5_C[47:0]       ), //i
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
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_6_C[47:0]       ), //i
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
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(1),
    .BREG(1),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(0),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(0),
    .OPMODEREG(1),
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
    .CEA1           (1'b0                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b0                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b1                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b0                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b1                     ), //i
    .CEINMODE       (1'b0                     ), //i
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
    .C              (dsp48e2s_7_C[47:0]       ), //i
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
  assign tmp_1 = zz_dsp48e2s_0_INMODE(1'b0);
  always @(*) dsp48e2s_0_INMODE = tmp_1;
  always @(*) begin
    dsp48e2s_0_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_0_OPMODE[1 : 0] = {tmp_OPMODE,tmp_OPMODE};
    dsp48e2s_0_OPMODE[3 : 2] = {tmp_OPMODE_1,tmp_OPMODE_1};
    dsp48e2s_0_OPMODE[6 : 4] = {2'b00,1'b0};
  end

  assign tmp_OPMODE = io_aSel_0[0];
  assign tmp_OPMODE_1 = io_bSel_0[0];
  assign tmp_A = {io_a_0_3,{io_a_0_2,{io_a_0_1,io_a_0_0}}};
  assign dsp48e2s_0_A = tmp_A[47 : 18];
  assign dsp48e2s_0_B = tmp_A[17 : 0];
  assign dsp48e2s_0_C = {io_b_0_3,{io_b_0_2,{io_b_0_1,io_b_0_0}}};
  assign tmp_2 = zz_dsp48e2s_1_INMODE(1'b0);
  always @(*) dsp48e2s_1_INMODE = tmp_2;
  always @(*) begin
    dsp48e2s_1_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_1_OPMODE[1 : 0] = {tmp_OPMODE_2,tmp_OPMODE_2};
    dsp48e2s_1_OPMODE[3 : 2] = {tmp_OPMODE_3,tmp_OPMODE_3};
    dsp48e2s_1_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign tmp_OPMODE_2 = io_aSel_1[0];
  assign tmp_OPMODE_3 = io_bSel_1[0];
  assign tmp_A_1 = {io_a_1_3,{io_a_1_2,{io_a_1_1,io_a_1_0}}};
  assign dsp48e2s_1_A = tmp_A_1[47 : 18];
  assign dsp48e2s_1_B = tmp_A_1[17 : 0];
  assign dsp48e2s_1_C = {io_b_1_3,{io_b_1_2,{io_b_1_1,io_b_1_0}}};
  assign tmp_3 = zz_dsp48e2s_2_INMODE(1'b0);
  always @(*) dsp48e2s_2_INMODE = tmp_3;
  always @(*) begin
    dsp48e2s_2_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_2_OPMODE[1 : 0] = {tmp_OPMODE_4,tmp_OPMODE_4};
    dsp48e2s_2_OPMODE[3 : 2] = {tmp_OPMODE_5,tmp_OPMODE_5};
    dsp48e2s_2_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign tmp_OPMODE_4 = io_aSel_2[0];
  assign tmp_OPMODE_5 = io_bSel_2[0];
  assign tmp_A_2 = {io_a_2_3,{io_a_2_2,{io_a_2_1,io_a_2_0}}};
  assign dsp48e2s_2_A = tmp_A_2[47 : 18];
  assign dsp48e2s_2_B = tmp_A_2[17 : 0];
  assign dsp48e2s_2_C = {io_b_2_3,{io_b_2_2,{io_b_2_1,io_b_2_0}}};
  assign tmp_4 = zz_dsp48e2s_3_INMODE(1'b0);
  always @(*) dsp48e2s_3_INMODE = tmp_4;
  always @(*) begin
    dsp48e2s_3_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_3_OPMODE[1 : 0] = {tmp_OPMODE_6,tmp_OPMODE_6};
    dsp48e2s_3_OPMODE[3 : 2] = {tmp_OPMODE_7,tmp_OPMODE_7};
    dsp48e2s_3_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign tmp_OPMODE_6 = io_aSel_3[0];
  assign tmp_OPMODE_7 = io_bSel_3[0];
  assign tmp_A_3 = {io_a_3_3,{io_a_3_2,{io_a_3_1,io_a_3_0}}};
  assign dsp48e2s_3_A = tmp_A_3[47 : 18];
  assign dsp48e2s_3_B = tmp_A_3[17 : 0];
  assign dsp48e2s_3_C = {io_b_3_3,{io_b_3_2,{io_b_3_1,io_b_3_0}}};
  assign tmp_5 = zz_dsp48e2s_4_INMODE(1'b0);
  always @(*) dsp48e2s_4_INMODE = tmp_5;
  always @(*) begin
    dsp48e2s_4_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_4_OPMODE[1 : 0] = {tmp_OPMODE_8,tmp_OPMODE_8};
    dsp48e2s_4_OPMODE[3 : 2] = {tmp_OPMODE_9,tmp_OPMODE_9};
    dsp48e2s_4_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign tmp_OPMODE_8 = io_aSel_4[0];
  assign tmp_OPMODE_9 = io_bSel_4[0];
  assign tmp_A_4 = {io_a_4_3,{io_a_4_2,{io_a_4_1,io_a_4_0}}};
  assign dsp48e2s_4_A = tmp_A_4[47 : 18];
  assign dsp48e2s_4_B = tmp_A_4[17 : 0];
  assign dsp48e2s_4_C = {io_b_4_3,{io_b_4_2,{io_b_4_1,io_b_4_0}}};
  assign tmp_6 = zz_dsp48e2s_5_INMODE(1'b0);
  always @(*) dsp48e2s_5_INMODE = tmp_6;
  always @(*) begin
    dsp48e2s_5_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_5_OPMODE[1 : 0] = {tmp_OPMODE_10,tmp_OPMODE_10};
    dsp48e2s_5_OPMODE[3 : 2] = {tmp_OPMODE_11,tmp_OPMODE_11};
    dsp48e2s_5_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign tmp_OPMODE_10 = io_aSel_5[0];
  assign tmp_OPMODE_11 = io_bSel_5[0];
  assign tmp_A_5 = {io_a_5_3,{io_a_5_2,{io_a_5_1,io_a_5_0}}};
  assign dsp48e2s_5_A = tmp_A_5[47 : 18];
  assign dsp48e2s_5_B = tmp_A_5[17 : 0];
  assign dsp48e2s_5_C = {io_b_5_3,{io_b_5_2,{io_b_5_1,io_b_5_0}}};
  assign tmp_7 = zz_dsp48e2s_6_INMODE(1'b0);
  always @(*) dsp48e2s_6_INMODE = tmp_7;
  always @(*) begin
    dsp48e2s_6_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_6_OPMODE[1 : 0] = {tmp_OPMODE_12,tmp_OPMODE_12};
    dsp48e2s_6_OPMODE[3 : 2] = {tmp_OPMODE_13,tmp_OPMODE_13};
    dsp48e2s_6_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign tmp_OPMODE_12 = io_aSel_6[0];
  assign tmp_OPMODE_13 = io_bSel_6[0];
  assign tmp_A_6 = {io_a_6_3,{io_a_6_2,{io_a_6_1,io_a_6_0}}};
  assign dsp48e2s_6_A = tmp_A_6[47 : 18];
  assign dsp48e2s_6_B = tmp_A_6[17 : 0];
  assign dsp48e2s_6_C = {io_b_6_3,{io_b_6_2,{io_b_6_1,io_b_6_0}}};
  assign tmp_8 = zz_dsp48e2s_7_INMODE(1'b0);
  always @(*) dsp48e2s_7_INMODE = tmp_8;
  always @(*) begin
    dsp48e2s_7_OPMODE[8 : 7] = {1'b0,1'b0};
    dsp48e2s_7_OPMODE[1 : 0] = {tmp_OPMODE_14,tmp_OPMODE_14};
    dsp48e2s_7_OPMODE[3 : 2] = {tmp_OPMODE_15,tmp_OPMODE_15};
    dsp48e2s_7_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign tmp_OPMODE_14 = io_aSel_7[0];
  assign tmp_OPMODE_15 = io_bSel_7[0];
  assign tmp_A_7 = {io_a_7_3,{io_a_7_2,{io_a_7_1,io_a_7_0}}};
  assign dsp48e2s_7_A = tmp_A_7[47 : 18];
  assign dsp48e2s_7_B = tmp_A_7[17 : 0];
  assign dsp48e2s_7_C = {io_b_7_3,{io_b_7_2,{io_b_7_1,io_b_7_0}}};
  assign io_ab_0 = dsp48e2s_7_P[11 : 0];
  assign io_ab_1 = dsp48e2s_7_P[23 : 12];
  assign io_ab_2 = dsp48e2s_7_P[35 : 24];
  assign io_ab_3 = dsp48e2s_7_P[47 : 36];

endmodule
