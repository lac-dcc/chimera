// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : int8_dotp
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module int8_dotp (
  input      [7:0]    io_a_0,
  input      [7:0]    io_a_1,
  input      [7:0]    io_a_2,
  input      [7:0]    io_a_3,
  input      [7:0]    io_a_4,
  input      [7:0]    io_a_5,
  input      [7:0]    io_a_6,
  input      [7:0]    io_a_7,
  input      [7:0]    io_b_0,
  input      [7:0]    io_b_1,
  input      [7:0]    io_b_2,
  input      [7:0]    io_b_3,
  input      [7:0]    io_b_4,
  input      [7:0]    io_b_5,
  input      [7:0]    io_b_6,
  input      [7:0]    io_b_7,
  input      [7:0]    io_c_0,
  input      [7:0]    io_c_1,
  input      [7:0]    io_c_2,
  input      [7:0]    io_c_3,
  input      [7:0]    io_c_4,
  input      [7:0]    io_c_5,
  input      [7:0]    io_c_6,
  input      [7:0]    io_c_7,
  output     [17:0]   io_ab,
  output     [17:0]   io_ac,
  input               clk
);

  reg        [4:0]    dsp48e2s_0_INMODE;
  reg        [8:0]    dsp48e2s_0_OPMODE;
  wire       [29:0]   dsp48e2s_0_A;
  wire       [17:0]   dsp48e2s_0_B;
  wire       [26:0]   dsp48e2s_0_D;
  reg        [4:0]    dsp48e2s_1_INMODE;
  reg        [8:0]    dsp48e2s_1_OPMODE;
  wire       [29:0]   dsp48e2s_1_A;
  wire       [17:0]   dsp48e2s_1_B;
  wire       [26:0]   dsp48e2s_1_D;
  reg        [4:0]    dsp48e2s_2_INMODE;
  reg        [8:0]    dsp48e2s_2_OPMODE;
  wire       [29:0]   dsp48e2s_2_A;
  wire       [17:0]   dsp48e2s_2_B;
  wire       [26:0]   dsp48e2s_2_D;
  reg        [4:0]    dsp48e2s_3_INMODE;
  reg        [8:0]    dsp48e2s_3_OPMODE;
  wire       [29:0]   dsp48e2s_3_A;
  wire       [17:0]   dsp48e2s_3_B;
  wire       [26:0]   dsp48e2s_3_D;
  reg        [4:0]    dsp48e2s_4_INMODE;
  reg        [8:0]    dsp48e2s_4_OPMODE;
  wire       [29:0]   dsp48e2s_4_A;
  wire       [17:0]   dsp48e2s_4_B;
  wire       [26:0]   dsp48e2s_4_D;
  reg        [4:0]    dsp48e2s_5_INMODE;
  reg        [8:0]    dsp48e2s_5_OPMODE;
  wire       [29:0]   dsp48e2s_5_A;
  wire       [17:0]   dsp48e2s_5_B;
  wire       [26:0]   dsp48e2s_5_D;
  reg        [4:0]    dsp48e2s_6_INMODE;
  reg        [8:0]    dsp48e2s_6_OPMODE;
  wire       [29:0]   dsp48e2s_6_A;
  wire       [17:0]   dsp48e2s_6_B;
  wire       [26:0]   dsp48e2s_6_D;
  reg        [4:0]    dsp48e2s_7_INMODE;
  reg        [8:0]    dsp48e2s_7_OPMODE;
  wire       [29:0]   dsp48e2s_7_A;
  wire       [17:0]   dsp48e2s_7_B;
  wire       [26:0]   dsp48e2s_7_D;
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
  wire       [7:0]    tmp_A_1;
  wire       [17:0]   tmp_B;
  wire       [7:0]    tmp_B_1;
  wire       [8:0]    tmp_D_8;
  wire       [29:0]   tmp_A_2;
  wire       [7:0]    tmp_A_3;
  wire       [17:0]   tmp_B_2;
  wire       [7:0]    tmp_B_3;
  wire       [8:0]    tmp_D_9;
  wire       [29:0]   tmp_A_4;
  wire       [7:0]    tmp_A_5;
  wire       [17:0]   tmp_B_4;
  wire       [7:0]    tmp_B_5;
  wire       [8:0]    tmp_D_10;
  wire       [29:0]   tmp_A_6;
  wire       [7:0]    tmp_A_7;
  wire       [17:0]   tmp_B_6;
  wire       [7:0]    tmp_B_7;
  wire       [8:0]    tmp_D_11;
  wire       [29:0]   tmp_A_8;
  wire       [7:0]    tmp_A_9;
  wire       [17:0]   tmp_B_8;
  wire       [7:0]    tmp_B_9;
  wire       [8:0]    tmp_D_12;
  wire       [29:0]   tmp_A_10;
  wire       [7:0]    tmp_A_11;
  wire       [17:0]   tmp_B_10;
  wire       [7:0]    tmp_B_11;
  wire       [8:0]    tmp_D_13;
  wire       [29:0]   tmp_A_12;
  wire       [7:0]    tmp_A_13;
  wire       [17:0]   tmp_B_12;
  wire       [7:0]    tmp_B_13;
  wire       [8:0]    tmp_D_14;
  wire       [29:0]   tmp_A_14;
  wire       [7:0]    tmp_A_15;
  wire       [17:0]   tmp_B_14;
  wire       [7:0]    tmp_B_15;
  wire       [8:0]    tmp_D_15;
  wire       [17:0]   tmp_acRes;
  wire       [17:0]   tmp_acRes_1;
  wire       [1:0]    tmp_acRes_2;
  wire                tmp_OPMODE;
  wire       [7:0]    tmp_D;
  wire                tmp_OPMODE_1;
  wire       [7:0]    tmp_D_1;
  wire                tmp_OPMODE_2;
  wire       [7:0]    tmp_D_2;
  wire                tmp_OPMODE_3;
  wire       [7:0]    tmp_D_3;
  wire                tmp_OPMODE_4;
  wire       [7:0]    tmp_D_4;
  wire                tmp_OPMODE_5;
  wire       [7:0]    tmp_D_5;
  wire                tmp_OPMODE_6;
  wire       [7:0]    tmp_D_6;
  wire                tmp_OPMODE_7;
  wire       [7:0]    tmp_D_7;
  wire       [17:0]   abRes;
  wire       [1:0]    abNeg;
  wire       [17:0]   acRes;
  function [4:0] zz_dsp48e2s_0_INMODE(input dummy);
    begin
      zz_dsp48e2s_0_INMODE[1] = 1'b0;
      zz_dsp48e2s_0_INMODE[2] = 1'b1;
      zz_dsp48e2s_0_INMODE[3] = 1'b0;
      zz_dsp48e2s_0_INMODE[0] = 1'b1;
      zz_dsp48e2s_0_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_1;
  function [4:0] zz_dsp48e2s_1_INMODE(input dummy);
    begin
      zz_dsp48e2s_1_INMODE[1] = 1'b0;
      zz_dsp48e2s_1_INMODE[2] = 1'b1;
      zz_dsp48e2s_1_INMODE[3] = 1'b0;
      zz_dsp48e2s_1_INMODE[0] = 1'b1;
      zz_dsp48e2s_1_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_2;
  function [4:0] zz_dsp48e2s_2_INMODE(input dummy);
    begin
      zz_dsp48e2s_2_INMODE[1] = 1'b0;
      zz_dsp48e2s_2_INMODE[2] = 1'b1;
      zz_dsp48e2s_2_INMODE[3] = 1'b0;
      zz_dsp48e2s_2_INMODE[0] = 1'b1;
      zz_dsp48e2s_2_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_3;
  function [4:0] zz_dsp48e2s_3_INMODE(input dummy);
    begin
      zz_dsp48e2s_3_INMODE[1] = 1'b0;
      zz_dsp48e2s_3_INMODE[2] = 1'b1;
      zz_dsp48e2s_3_INMODE[3] = 1'b0;
      zz_dsp48e2s_3_INMODE[0] = 1'b1;
      zz_dsp48e2s_3_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_4;
  function [4:0] zz_dsp48e2s_4_INMODE(input dummy);
    begin
      zz_dsp48e2s_4_INMODE[1] = 1'b0;
      zz_dsp48e2s_4_INMODE[2] = 1'b1;
      zz_dsp48e2s_4_INMODE[3] = 1'b0;
      zz_dsp48e2s_4_INMODE[0] = 1'b1;
      zz_dsp48e2s_4_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_5;
  function [4:0] zz_dsp48e2s_5_INMODE(input dummy);
    begin
      zz_dsp48e2s_5_INMODE[1] = 1'b0;
      zz_dsp48e2s_5_INMODE[2] = 1'b1;
      zz_dsp48e2s_5_INMODE[3] = 1'b0;
      zz_dsp48e2s_5_INMODE[0] = 1'b1;
      zz_dsp48e2s_5_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_6;
  function [4:0] zz_dsp48e2s_6_INMODE(input dummy);
    begin
      zz_dsp48e2s_6_INMODE[1] = 1'b0;
      zz_dsp48e2s_6_INMODE[2] = 1'b1;
      zz_dsp48e2s_6_INMODE[3] = 1'b0;
      zz_dsp48e2s_6_INMODE[0] = 1'b1;
      zz_dsp48e2s_6_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_7;
  function [4:0] zz_dsp48e2s_7_INMODE(input dummy);
    begin
      zz_dsp48e2s_7_INMODE[1] = 1'b0;
      zz_dsp48e2s_7_INMODE[2] = 1'b1;
      zz_dsp48e2s_7_INMODE[3] = 1'b0;
      zz_dsp48e2s_7_INMODE[0] = 1'b1;
      zz_dsp48e2s_7_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_8;

  assign tmp_A_1 = io_b_0;
  assign tmp_A = {{22{tmp_A_1[7]}}, tmp_A_1};
  assign tmp_B_1 = io_a_0;
  assign tmp_B = {{10{tmp_B_1[7]}}, tmp_B_1};
  assign tmp_D_8 = {tmp_D[7],tmp_D};
  assign tmp_A_3 = io_b_1;
  assign tmp_A_2 = {{22{tmp_A_3[7]}}, tmp_A_3};
  assign tmp_B_3 = io_a_1;
  assign tmp_B_2 = {{10{tmp_B_3[7]}}, tmp_B_3};
  assign tmp_D_9 = {tmp_D_1[7],tmp_D_1};
  assign tmp_A_5 = io_b_2;
  assign tmp_A_4 = {{22{tmp_A_5[7]}}, tmp_A_5};
  assign tmp_B_5 = io_a_2;
  assign tmp_B_4 = {{10{tmp_B_5[7]}}, tmp_B_5};
  assign tmp_D_10 = {tmp_D_2[7],tmp_D_2};
  assign tmp_A_7 = io_b_3;
  assign tmp_A_6 = {{22{tmp_A_7[7]}}, tmp_A_7};
  assign tmp_B_7 = io_a_3;
  assign tmp_B_6 = {{10{tmp_B_7[7]}}, tmp_B_7};
  assign tmp_D_11 = {tmp_D_3[7],tmp_D_3};
  assign tmp_A_9 = io_b_4;
  assign tmp_A_8 = {{22{tmp_A_9[7]}}, tmp_A_9};
  assign tmp_B_9 = io_a_4;
  assign tmp_B_8 = {{10{tmp_B_9[7]}}, tmp_B_9};
  assign tmp_D_12 = {tmp_D_4[7],tmp_D_4};
  assign tmp_A_11 = io_b_5;
  assign tmp_A_10 = {{22{tmp_A_11[7]}}, tmp_A_11};
  assign tmp_B_11 = io_a_5;
  assign tmp_B_10 = {{10{tmp_B_11[7]}}, tmp_B_11};
  assign tmp_D_13 = {tmp_D_5[7],tmp_D_5};
  assign tmp_A_13 = io_b_6;
  assign tmp_A_12 = {{22{tmp_A_13[7]}}, tmp_A_13};
  assign tmp_B_13 = io_a_6;
  assign tmp_B_12 = {{10{tmp_B_13[7]}}, tmp_B_13};
  assign tmp_D_14 = {tmp_D_6[7],tmp_D_6};
  assign tmp_A_15 = io_b_7;
  assign tmp_A_14 = {{22{tmp_A_15[7]}}, tmp_A_15};
  assign tmp_B_15 = io_a_7;
  assign tmp_B_14 = {{10{tmp_B_15[7]}}, tmp_B_15};
  assign tmp_D_15 = {tmp_D_7[7],tmp_D_7};
  assign tmp_acRes = dsp48e2s_7_P[35 : 18];
  assign tmp_acRes_2 = abNeg;
  assign tmp_acRes_1 = {{16{tmp_acRes_2[1]}}, tmp_acRes_2};
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_0_D[26:0]       ), //i
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
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_1_D[26:0]       ), //i
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
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_2_D[26:0]       ), //i
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
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_3_D[26:0]       ), //i
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
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_4_D[26:0]       ), //i
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
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_5_D[26:0]       ), //i
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
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_6_D[26:0]       ), //i
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
    .AMULTSEL("AD"),
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
    .INMODEREG(0),
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b0                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b1                     ), //i
    .CEAD           (1'b1                     ), //i
    .CEM            (1'b1                     ), //i
    .CEP            (1'b1                     ), //i
    .CECARRYIN      (1'b0                     ), //i
    .CECTRL         (1'b0                     ), //i
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
    .C              (48'hffffffffffff         ), //i
    .D              (dsp48e2s_7_D[26:0]       ), //i
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
  assign tmp_OPMODE = 1'b0;
  always @(*) begin
    dsp48e2s_0_OPMODE[8 : 7] = {tmp_OPMODE,tmp_OPMODE};
    dsp48e2s_0_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_0_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_0_OPMODE[6 : 4] = {2'b00,1'b0};
  end

  assign dsp48e2s_0_A = tmp_A;
  assign dsp48e2s_0_B = tmp_B;
  assign tmp_D = io_c_0;
  assign dsp48e2s_0_D = {tmp_D_8,18'h00000};
  assign tmp_2 = zz_dsp48e2s_1_INMODE(1'b0);
  always @(*) dsp48e2s_1_INMODE = tmp_2;
  assign tmp_OPMODE_1 = 1'b0;
  always @(*) begin
    dsp48e2s_1_OPMODE[8 : 7] = {tmp_OPMODE_1,tmp_OPMODE_1};
    dsp48e2s_1_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_1_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_1_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign dsp48e2s_1_A = tmp_A_2;
  assign dsp48e2s_1_B = tmp_B_2;
  assign tmp_D_1 = io_c_1;
  assign dsp48e2s_1_D = {tmp_D_9,18'h00000};
  assign tmp_3 = zz_dsp48e2s_2_INMODE(1'b0);
  always @(*) dsp48e2s_2_INMODE = tmp_3;
  assign tmp_OPMODE_2 = 1'b0;
  always @(*) begin
    dsp48e2s_2_OPMODE[8 : 7] = {tmp_OPMODE_2,tmp_OPMODE_2};
    dsp48e2s_2_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_2_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_2_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign dsp48e2s_2_A = tmp_A_4;
  assign dsp48e2s_2_B = tmp_B_4;
  assign tmp_D_2 = io_c_2;
  assign dsp48e2s_2_D = {tmp_D_10,18'h00000};
  assign tmp_4 = zz_dsp48e2s_3_INMODE(1'b0);
  always @(*) dsp48e2s_3_INMODE = tmp_4;
  assign tmp_OPMODE_3 = 1'b0;
  always @(*) begin
    dsp48e2s_3_OPMODE[8 : 7] = {tmp_OPMODE_3,tmp_OPMODE_3};
    dsp48e2s_3_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_3_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_3_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign dsp48e2s_3_A = tmp_A_6;
  assign dsp48e2s_3_B = tmp_B_6;
  assign tmp_D_3 = io_c_3;
  assign dsp48e2s_3_D = {tmp_D_11,18'h00000};
  assign tmp_5 = zz_dsp48e2s_4_INMODE(1'b0);
  always @(*) dsp48e2s_4_INMODE = tmp_5;
  assign tmp_OPMODE_4 = 1'b0;
  always @(*) begin
    dsp48e2s_4_OPMODE[8 : 7] = {tmp_OPMODE_4,tmp_OPMODE_4};
    dsp48e2s_4_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_4_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_4_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign dsp48e2s_4_A = tmp_A_8;
  assign dsp48e2s_4_B = tmp_B_8;
  assign tmp_D_4 = io_c_4;
  assign dsp48e2s_4_D = {tmp_D_12,18'h00000};
  assign tmp_6 = zz_dsp48e2s_5_INMODE(1'b0);
  always @(*) dsp48e2s_5_INMODE = tmp_6;
  assign tmp_OPMODE_5 = 1'b0;
  always @(*) begin
    dsp48e2s_5_OPMODE[8 : 7] = {tmp_OPMODE_5,tmp_OPMODE_5};
    dsp48e2s_5_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_5_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_5_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign dsp48e2s_5_A = tmp_A_10;
  assign dsp48e2s_5_B = tmp_B_10;
  assign tmp_D_5 = io_c_5;
  assign dsp48e2s_5_D = {tmp_D_13,18'h00000};
  assign tmp_7 = zz_dsp48e2s_6_INMODE(1'b0);
  always @(*) dsp48e2s_6_INMODE = tmp_7;
  assign tmp_OPMODE_6 = 1'b0;
  always @(*) begin
    dsp48e2s_6_OPMODE[8 : 7] = {tmp_OPMODE_6,tmp_OPMODE_6};
    dsp48e2s_6_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_6_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_6_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign dsp48e2s_6_A = tmp_A_12;
  assign dsp48e2s_6_B = tmp_B_12;
  assign tmp_D_6 = io_c_6;
  assign dsp48e2s_6_D = {tmp_D_14,18'h00000};
  assign tmp_8 = zz_dsp48e2s_7_INMODE(1'b0);
  always @(*) dsp48e2s_7_INMODE = tmp_8;
  assign tmp_OPMODE_7 = 1'b0;
  always @(*) begin
    dsp48e2s_7_OPMODE[8 : 7] = {tmp_OPMODE_7,tmp_OPMODE_7};
    dsp48e2s_7_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp48e2s_7_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp48e2s_7_OPMODE[6 : 4] = {2'b00,1'b1};
  end

  assign dsp48e2s_7_A = tmp_A_14;
  assign dsp48e2s_7_B = tmp_B_14;
  assign tmp_D_7 = io_c_7;
  assign dsp48e2s_7_D = {tmp_D_15,18'h00000};
  assign abRes = dsp48e2s_7_P[17 : 0];
  assign abNeg = {1'b0,abRes[17]};
  assign acRes = ($signed(tmp_acRes) + $signed(tmp_acRes_1));
  assign io_ab = abRes;
  assign io_ac = acRes;

endmodule
