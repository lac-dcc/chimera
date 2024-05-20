// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : int16_ws_B_P
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module int16_ws_B_P (
  input      [15:0]   io_a,
  input      [15:0]   io_b_0,
  input      [15:0]   io_b_1,
  input      [15:0]   io_b_2,
  input      [15:0]   io_b_3,
  input      [15:0]   io_b_4,
  input      [15:0]   io_b_5,
  input      [15:0]   io_b_6,
  input      [15:0]   io_b_7,
  output     [47:0]   io_ab,
  input               io_enPrefetch,
  input               io_enFetch,
  input               io_clrPrefetch_0,
  input               io_clrPrefetch_1,
  input               io_clrPrefetch_2,
  input               io_clrPrefetch_3,
  input               io_clrPrefetch_4,
  input               io_clrPrefetch_5,
  input               io_clrPrefetch_6,
  input               io_clrPrefetch_7,
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
  reg        [4:0]    dsp48e2s_2_INMODE;
  reg        [8:0]    dsp48e2s_2_OPMODE;
  wire       [29:0]   dsp48e2s_2_A;
  reg        [4:0]    dsp48e2s_3_INMODE;
  reg        [8:0]    dsp48e2s_3_OPMODE;
  wire       [29:0]   dsp48e2s_3_A;
  reg        [4:0]    dsp48e2s_4_INMODE;
  reg        [8:0]    dsp48e2s_4_OPMODE;
  wire       [29:0]   dsp48e2s_4_A;
  reg        [4:0]    dsp48e2s_5_INMODE;
  reg        [8:0]    dsp48e2s_5_OPMODE;
  wire       [29:0]   dsp48e2s_5_A;
  reg        [4:0]    dsp48e2s_6_INMODE;
  reg        [8:0]    dsp48e2s_6_OPMODE;
  wire       [29:0]   dsp48e2s_6_A;
  reg        [4:0]    dsp48e2s_7_INMODE;
  reg        [8:0]    dsp48e2s_7_OPMODE;
  wire       [29:0]   dsp48e2s_7_A;
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
  wire       [29:0]   tmp_A_4;
  wire       [15:0]   tmp_A_5;
  wire       [29:0]   tmp_A_6;
  wire       [15:0]   tmp_A_7;
  wire       [29:0]   tmp_A_8;
  wire       [15:0]   tmp_A_9;
  wire       [29:0]   tmp_A_10;
  wire       [15:0]   tmp_A_11;
  wire       [29:0]   tmp_A_12;
  wire       [15:0]   tmp_A_13;
  wire       [29:0]   tmp_A_14;
  wire       [15:0]   tmp_A_15;
  wire                enPrefetchChain_0;
  reg                 enPrefetchChain_1;
  reg                 enPrefetchChain_2;
  reg                 enPrefetchChain_3;
  reg                 enPrefetchChain_4;
  reg                 enPrefetchChain_5;
  reg                 enPrefetchChain_6;
  reg                 enPrefetchChain_7;
  wire                enFetchChain_0;
  reg                 enFetchChain_1;
  reg                 enFetchChain_2;
  reg                 enFetchChain_3;
  reg                 enFetchChain_4;
  reg                 enFetchChain_5;
  reg                 enFetchChain_6;
  reg                 enFetchChain_7;
  wire                tmp_OPMODE;
  wire                tmp_OPMODE_1;
  wire                tmp_OPMODE_2;
  wire                tmp_OPMODE_3;
  wire                tmp_OPMODE_4;
  wire                tmp_OPMODE_5;
  wire                tmp_OPMODE_6;
  wire                tmp_OPMODE_7;
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

  assign tmp_A_1 = io_b_0;
  assign tmp_A = {{14{tmp_A_1[15]}}, tmp_A_1};
  assign tmp_B_1 = io_a;
  assign tmp_B = {{2{tmp_B_1[15]}}, tmp_B_1};
  assign tmp_A_3 = io_b_1;
  assign tmp_A_2 = {{14{tmp_A_3[15]}}, tmp_A_3};
  assign tmp_A_5 = io_b_2;
  assign tmp_A_4 = {{14{tmp_A_5[15]}}, tmp_A_5};
  assign tmp_A_7 = io_b_3;
  assign tmp_A_6 = {{14{tmp_A_7[15]}}, tmp_A_7};
  assign tmp_A_9 = io_b_4;
  assign tmp_A_8 = {{14{tmp_A_9[15]}}, tmp_A_9};
  assign tmp_A_11 = io_b_5;
  assign tmp_A_10 = {{14{tmp_A_11[15]}}, tmp_A_11};
  assign tmp_A_13 = io_b_6;
  assign tmp_A_12 = {{14{tmp_A_13[15]}}, tmp_A_13};
  assign tmp_A_15 = io_b_7;
  assign tmp_A_14 = {{14{tmp_A_15[15]}}, tmp_A_15};
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_0        ), //i
    .CEB2           (enFetchChain_0           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .BCIN           (dsp48e2s_0_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_0_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_1_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_1_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_1_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_1_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_1_MULTSIGNOUT   ), //o
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_1        ), //i
    .CEB2           (enFetchChain_1           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B              (18'h00000                ), //i
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
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .BCIN           (dsp48e2s_1_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_1_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_2_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_2_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_2_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_2_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_2_MULTSIGNOUT   ), //o
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_2        ), //i
    .CEB2           (enFetchChain_2           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B              (18'h00000                ), //i
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
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .BCIN           (dsp48e2s_2_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_2_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_3_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_3_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_3_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_3_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_3_MULTSIGNOUT   ), //o
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_3        ), //i
    .CEB2           (enFetchChain_3           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B              (18'h00000                ), //i
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
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .BCIN           (dsp48e2s_3_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_3_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_4_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_4_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_4_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_4_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_4_MULTSIGNOUT   ), //o
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_4        ), //i
    .CEB2           (enFetchChain_4           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B              (18'h00000                ), //i
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
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .BCIN           (dsp48e2s_4_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_4_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_5_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_5_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_5_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_5_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_5_MULTSIGNOUT   ), //o
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_5        ), //i
    .CEB2           (enFetchChain_5           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B              (18'h00000                ), //i
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
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .BCIN           (dsp48e2s_5_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_5_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_6_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_6_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_6_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_6_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_6_MULTSIGNOUT   ), //o
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_6        ), //i
    .CEB2           (enFetchChain_6           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B              (18'h00000                ), //i
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
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
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
    .BCIN           (dsp48e2s_6_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_6_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_7_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_7_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_7_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_7_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_7_MULTSIGNOUT   ), //o
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (enPrefetchChain_7        ), //i
    .CEB2           (enFetchChain_7           ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
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
    .B              (18'h00000                ), //i
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
  assign enPrefetchChain_0 = io_enPrefetch;
  assign enFetchChain_0 = io_enFetch;
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
  assign io_ab = dsp48e2s_7_P;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      enFetchChain_1 <= 1'b0;
      enFetchChain_2 <= 1'b0;
      enFetchChain_3 <= 1'b0;
      enFetchChain_4 <= 1'b0;
      enFetchChain_5 <= 1'b0;
      enFetchChain_6 <= 1'b0;
      enFetchChain_7 <= 1'b0;
    end else begin
      enFetchChain_1 <= enFetchChain_0;
      enFetchChain_2 <= enFetchChain_1;
      enFetchChain_3 <= enFetchChain_2;
      enFetchChain_4 <= enFetchChain_3;
      enFetchChain_5 <= enFetchChain_4;
      enFetchChain_6 <= enFetchChain_5;
      enFetchChain_7 <= enFetchChain_6;
    end
  end

  always @(posedge clk) begin
    enPrefetchChain_1 <= enPrefetchChain_0;
    if(io_clrPrefetch_1) begin
      enPrefetchChain_1 <= 1'b0;
    end
    enPrefetchChain_2 <= enPrefetchChain_1;
    if(io_clrPrefetch_2) begin
      enPrefetchChain_2 <= 1'b0;
    end
    enPrefetchChain_3 <= enPrefetchChain_2;
    if(io_clrPrefetch_3) begin
      enPrefetchChain_3 <= 1'b0;
    end
    enPrefetchChain_4 <= enPrefetchChain_3;
    if(io_clrPrefetch_4) begin
      enPrefetchChain_4 <= 1'b0;
    end
    enPrefetchChain_5 <= enPrefetchChain_4;
    if(io_clrPrefetch_5) begin
      enPrefetchChain_5 <= 1'b0;
    end
    enPrefetchChain_6 <= enPrefetchChain_5;
    if(io_clrPrefetch_6) begin
      enPrefetchChain_6 <= 1'b0;
    end
    enPrefetchChain_7 <= enPrefetchChain_6;
    if(io_clrPrefetch_7) begin
      enPrefetchChain_7 <= 1'b0;
    end
  end


endmodule
