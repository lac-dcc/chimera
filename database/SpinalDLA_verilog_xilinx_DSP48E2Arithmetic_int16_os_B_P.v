// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : int16_os_B_P
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module int16_os_B_P (
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
  input               io_accValid,
  input               io_accLast,
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
  reg                 selOfM_0;
  reg                 selOfM_1;
  reg                 selOfM_2;
  reg                 selOfM_3;
  reg                 selOfM_4;
  reg                 selOfM_5;
  reg                 selOfM_6;
  reg                 selOfM_7;
  reg                 selOfPCIN_0;
  reg                 selOfPCIN_1;
  reg                 selOfPCIN_2;
  reg                 selOfPCIN_3;
  reg                 selOfPCIN_4;
  reg                 selOfPCIN_5;
  reg                 selOfPCIN_6;
  reg                 selOfPCIN_7;
  reg                 selOfP_0;
  reg                 selOfP_1;
  reg                 selOfP_2;
  reg                 selOfP_3;
  reg                 selOfP_4;
  reg                 selOfP_5;
  reg                 selOfP_6;
  reg                 selOfP_7;
  reg                 rst_0;
  reg                 rst_1;
  reg                 rst_2;
  reg                 rst_3;
  reg                 rst_4;
  reg                 rst_5;
  reg                 rst_6;
  reg                 rst_7;
  reg                 rst_8;
  reg                 validDly;
  reg                 io_accLast_delay_1;
  reg                 io_accLast_delay_2;
  reg                 io_accLast_delay_3;
  reg                 io_accLast_delay_4;
  reg                 lastDly;
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
    .CEA1           (1'b1                     ), //i
    .CEA2           (1'b1                     ), //i
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_1                    ), //i
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
    .OPMODEREG(1),
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
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_2                    ), //i
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
    .OPMODEREG(1),
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
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_3                    ), //i
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
    .OPMODEREG(1),
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
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_4                    ), //i
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
    .OPMODEREG(1),
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
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_5                    ), //i
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
    .OPMODEREG(1),
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
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_6                    ), //i
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
    .OPMODEREG(1),
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
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_7                    ), //i
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
    .OPMODEREG(1),
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
    .CEB1           (1'b1                     ), //i
    .CEB2           (1'b1                     ), //i
    .CEC            (1'b0                     ), //i
    .CED            (1'b0                     ), //i
    .CEAD           (1'b0                     ), //i
    .CEM            (1'b1                     ), //i
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
    .RSTP           (rst_8                    ), //i
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
  always @(*) begin
    dsp48e2s_0_OPMODE[8 : 7] = {1'b0,selOfP_0};
    dsp48e2s_0_OPMODE[1 : 0] = {1'b0,selOfM_0};
    dsp48e2s_0_OPMODE[3 : 2] = {1'b0,selOfM_0};
    dsp48e2s_0_OPMODE[6 : 4] = {2'b00,selOfPCIN_0};
  end

  assign dsp48e2s_0_A = tmp_A;
  assign dsp48e2s_0_B = tmp_B;
  assign tmp_2 = zz_dsp48e2s_1_INMODE(1'b0);
  always @(*) dsp48e2s_1_INMODE = tmp_2;
  always @(*) begin
    dsp48e2s_1_OPMODE[8 : 7] = {1'b0,selOfP_1};
    dsp48e2s_1_OPMODE[1 : 0] = {1'b0,selOfM_1};
    dsp48e2s_1_OPMODE[3 : 2] = {1'b0,selOfM_1};
    dsp48e2s_1_OPMODE[6 : 4] = {2'b00,selOfPCIN_1};
  end

  assign dsp48e2s_1_A = tmp_A_2;
  assign tmp_3 = zz_dsp48e2s_2_INMODE(1'b0);
  always @(*) dsp48e2s_2_INMODE = tmp_3;
  always @(*) begin
    dsp48e2s_2_OPMODE[8 : 7] = {1'b0,selOfP_2};
    dsp48e2s_2_OPMODE[1 : 0] = {1'b0,selOfM_2};
    dsp48e2s_2_OPMODE[3 : 2] = {1'b0,selOfM_2};
    dsp48e2s_2_OPMODE[6 : 4] = {2'b00,selOfPCIN_2};
  end

  assign dsp48e2s_2_A = tmp_A_4;
  assign tmp_4 = zz_dsp48e2s_3_INMODE(1'b0);
  always @(*) dsp48e2s_3_INMODE = tmp_4;
  always @(*) begin
    dsp48e2s_3_OPMODE[8 : 7] = {1'b0,selOfP_3};
    dsp48e2s_3_OPMODE[1 : 0] = {1'b0,selOfM_3};
    dsp48e2s_3_OPMODE[3 : 2] = {1'b0,selOfM_3};
    dsp48e2s_3_OPMODE[6 : 4] = {2'b00,selOfPCIN_3};
  end

  assign dsp48e2s_3_A = tmp_A_6;
  assign tmp_5 = zz_dsp48e2s_4_INMODE(1'b0);
  always @(*) dsp48e2s_4_INMODE = tmp_5;
  always @(*) begin
    dsp48e2s_4_OPMODE[8 : 7] = {1'b0,selOfP_4};
    dsp48e2s_4_OPMODE[1 : 0] = {1'b0,selOfM_4};
    dsp48e2s_4_OPMODE[3 : 2] = {1'b0,selOfM_4};
    dsp48e2s_4_OPMODE[6 : 4] = {2'b00,selOfPCIN_4};
  end

  assign dsp48e2s_4_A = tmp_A_8;
  assign tmp_6 = zz_dsp48e2s_5_INMODE(1'b0);
  always @(*) dsp48e2s_5_INMODE = tmp_6;
  always @(*) begin
    dsp48e2s_5_OPMODE[8 : 7] = {1'b0,selOfP_5};
    dsp48e2s_5_OPMODE[1 : 0] = {1'b0,selOfM_5};
    dsp48e2s_5_OPMODE[3 : 2] = {1'b0,selOfM_5};
    dsp48e2s_5_OPMODE[6 : 4] = {2'b00,selOfPCIN_5};
  end

  assign dsp48e2s_5_A = tmp_A_10;
  assign tmp_7 = zz_dsp48e2s_6_INMODE(1'b0);
  always @(*) dsp48e2s_6_INMODE = tmp_7;
  always @(*) begin
    dsp48e2s_6_OPMODE[8 : 7] = {1'b0,selOfP_6};
    dsp48e2s_6_OPMODE[1 : 0] = {1'b0,selOfM_6};
    dsp48e2s_6_OPMODE[3 : 2] = {1'b0,selOfM_6};
    dsp48e2s_6_OPMODE[6 : 4] = {2'b00,selOfPCIN_6};
  end

  assign dsp48e2s_6_A = tmp_A_12;
  assign tmp_8 = zz_dsp48e2s_7_INMODE(1'b0);
  always @(*) dsp48e2s_7_INMODE = tmp_8;
  always @(*) begin
    dsp48e2s_7_OPMODE[8 : 7] = {1'b0,selOfP_7};
    dsp48e2s_7_OPMODE[1 : 0] = {1'b0,selOfM_7};
    dsp48e2s_7_OPMODE[3 : 2] = {1'b0,selOfM_7};
    dsp48e2s_7_OPMODE[6 : 4] = {2'b00,selOfPCIN_7};
  end

  assign dsp48e2s_7_A = tmp_A_14;
  assign io_ab = dsp48e2s_7_P;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      validDly <= 1'b0;
      io_accLast_delay_1 <= 1'b0;
      io_accLast_delay_2 <= 1'b0;
      io_accLast_delay_3 <= 1'b0;
      io_accLast_delay_4 <= 1'b0;
      lastDly <= 1'b0;
      selOfM_0 <= 1'b0;
      rst_0 <= 1'b0;
      selOfPCIN_0 <= 1'b0;
      selOfP_0 <= 1'b0;
      selOfM_1 <= 1'b0;
      rst_1 <= 1'b0;
      selOfPCIN_1 <= 1'b0;
      selOfP_1 <= 1'b0;
      selOfM_2 <= 1'b0;
      rst_2 <= 1'b0;
      selOfPCIN_2 <= 1'b0;
      selOfP_2 <= 1'b0;
      selOfM_3 <= 1'b0;
      rst_3 <= 1'b0;
      selOfPCIN_3 <= 1'b0;
      selOfP_3 <= 1'b0;
      selOfM_4 <= 1'b0;
      rst_4 <= 1'b0;
      selOfPCIN_4 <= 1'b0;
      selOfP_4 <= 1'b0;
      selOfM_5 <= 1'b0;
      rst_5 <= 1'b0;
      selOfPCIN_5 <= 1'b0;
      selOfP_5 <= 1'b0;
      selOfM_6 <= 1'b0;
      rst_6 <= 1'b0;
      selOfPCIN_6 <= 1'b0;
      selOfP_6 <= 1'b0;
      selOfM_7 <= 1'b0;
      rst_7 <= 1'b0;
      selOfPCIN_7 <= 1'b0;
      selOfP_7 <= 1'b0;
      rst_8 <= 1'b0;
    end else begin
      validDly <= io_accValid;
      io_accLast_delay_1 <= io_accLast;
      io_accLast_delay_2 <= io_accLast_delay_1;
      io_accLast_delay_3 <= io_accLast_delay_2;
      io_accLast_delay_4 <= io_accLast_delay_3;
      lastDly <= io_accLast_delay_4;
      selOfM_0 <= validDly;
      rst_0 <= lastDly;
      if(lastDly) begin
        selOfPCIN_0 <= 1'b1;
      end
      if(rst_0) begin
        selOfPCIN_0 <= 1'b0;
      end
      if(selOfM_0) begin
        selOfP_0 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_0 <= 1'b0;
      end
      selOfM_1 <= selOfM_0;
      rst_1 <= rst_0;
      if(lastDly) begin
        selOfPCIN_1 <= 1'b1;
      end
      if(rst_1) begin
        selOfPCIN_1 <= 1'b0;
      end
      if(selOfM_1) begin
        selOfP_1 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_1 <= 1'b0;
      end
      selOfM_2 <= selOfM_1;
      rst_2 <= rst_1;
      if(lastDly) begin
        selOfPCIN_2 <= 1'b1;
      end
      if(rst_2) begin
        selOfPCIN_2 <= 1'b0;
      end
      if(selOfM_2) begin
        selOfP_2 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_2 <= 1'b0;
      end
      selOfM_3 <= selOfM_2;
      rst_3 <= rst_2;
      if(lastDly) begin
        selOfPCIN_3 <= 1'b1;
      end
      if(rst_3) begin
        selOfPCIN_3 <= 1'b0;
      end
      if(selOfM_3) begin
        selOfP_3 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_3 <= 1'b0;
      end
      selOfM_4 <= selOfM_3;
      rst_4 <= rst_3;
      if(lastDly) begin
        selOfPCIN_4 <= 1'b1;
      end
      if(rst_4) begin
        selOfPCIN_4 <= 1'b0;
      end
      if(selOfM_4) begin
        selOfP_4 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_4 <= 1'b0;
      end
      selOfM_5 <= selOfM_4;
      rst_5 <= rst_4;
      if(lastDly) begin
        selOfPCIN_5 <= 1'b1;
      end
      if(rst_5) begin
        selOfPCIN_5 <= 1'b0;
      end
      if(selOfM_5) begin
        selOfP_5 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_5 <= 1'b0;
      end
      selOfM_6 <= selOfM_5;
      rst_6 <= rst_5;
      if(lastDly) begin
        selOfPCIN_6 <= 1'b1;
      end
      if(rst_6) begin
        selOfPCIN_6 <= 1'b0;
      end
      if(selOfM_6) begin
        selOfP_6 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_6 <= 1'b0;
      end
      selOfM_7 <= selOfM_6;
      rst_7 <= rst_6;
      if(lastDly) begin
        selOfPCIN_7 <= 1'b1;
      end
      if(rst_7) begin
        selOfPCIN_7 <= 1'b0;
      end
      if(selOfM_7) begin
        selOfP_7 <= 1'b1;
      end
      if(lastDly) begin
        selOfP_7 <= 1'b0;
      end
      rst_8 <= rst_7;
    end
  end


endmodule
