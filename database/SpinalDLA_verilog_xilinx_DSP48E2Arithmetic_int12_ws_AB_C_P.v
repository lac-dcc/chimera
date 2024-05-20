// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : int12_ws_AB_C_P
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module int12_ws_AB_C_P (
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
  input      [7:0]    io_a_0,
  input      [7:0]    io_a_1,
  input      [7:0]    io_a_2,
  input      [7:0]    io_a_3,
  input      [7:0]    io_b_0,
  input      [7:0]    io_b_1,
  input      [7:0]    io_b_2,
  input      [7:0]    io_b_3,
  output     [11:0]   io_ab_0,
  output     [11:0]   io_ab_1,
  output     [11:0]   io_ab_2,
  output     [11:0]   io_ab_3,
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
  wire       [47:0]   dsp48e2s_0_C;
  reg        [4:0]    dsp48e2s_1_INMODE;
  reg        [8:0]    dsp48e2s_1_OPMODE;
  wire       [47:0]   dsp48e2s_1_C;
  reg        [4:0]    dsp48e2s_2_INMODE;
  reg        [8:0]    dsp48e2s_2_OPMODE;
  wire       [47:0]   dsp48e2s_2_C;
  reg        [4:0]    dsp48e2s_3_INMODE;
  reg        [8:0]    dsp48e2s_3_OPMODE;
  wire       [47:0]   dsp48e2s_3_C;
  reg        [4:0]    dsp48e2s_4_INMODE;
  reg        [8:0]    dsp48e2s_4_OPMODE;
  wire       [47:0]   dsp48e2s_4_C;
  reg        [4:0]    dsp48e2s_5_INMODE;
  reg        [8:0]    dsp48e2s_5_OPMODE;
  wire       [47:0]   dsp48e2s_5_C;
  reg        [4:0]    dsp48e2s_6_INMODE;
  reg        [8:0]    dsp48e2s_6_OPMODE;
  wire       [47:0]   dsp48e2s_6_C;
  reg        [4:0]    dsp48e2s_7_INMODE;
  reg        [8:0]    dsp48e2s_7_OPMODE;
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
  wire       [11:0]   tmp_aBits;
  wire       [7:0]    tmp_aBits_1;
  wire       [11:0]   tmp_aBits_2;
  wire       [7:0]    tmp_aBits_3;
  wire       [11:0]   tmp_aBits_4;
  wire       [7:0]    tmp_aBits_5;
  wire       [11:0]   tmp_aBits_6;
  wire       [7:0]    tmp_aBits_7;
  wire       [11:0]   tmp_C;
  wire       [7:0]    tmp_C_1;
  wire       [11:0]   tmp_C_2;
  wire       [7:0]    tmp_C_3;
  wire       [11:0]   tmp_C_4;
  wire       [7:0]    tmp_C_5;
  wire       [11:0]   tmp_C_6;
  wire       [7:0]    tmp_C_7;
  wire       [11:0]   tmp_C_8;
  wire       [7:0]    tmp_C_9;
  wire       [11:0]   tmp_C_10;
  wire       [7:0]    tmp_C_11;
  wire       [11:0]   tmp_C_12;
  wire       [7:0]    tmp_C_13;
  wire       [11:0]   tmp_C_14;
  wire       [7:0]    tmp_C_15;
  wire       [11:0]   tmp_C_16;
  wire       [7:0]    tmp_C_17;
  wire       [11:0]   tmp_C_18;
  wire       [7:0]    tmp_C_19;
  wire       [11:0]   tmp_C_20;
  wire       [7:0]    tmp_C_21;
  wire       [11:0]   tmp_C_22;
  wire       [7:0]    tmp_C_23;
  wire       [11:0]   tmp_C_24;
  wire       [7:0]    tmp_C_25;
  wire       [11:0]   tmp_C_26;
  wire       [7:0]    tmp_C_27;
  wire       [11:0]   tmp_C_28;
  wire       [7:0]    tmp_C_29;
  wire       [11:0]   tmp_C_30;
  wire       [7:0]    tmp_C_31;
  wire       [11:0]   tmp_C_32;
  wire       [7:0]    tmp_C_33;
  wire       [11:0]   tmp_C_34;
  wire       [7:0]    tmp_C_35;
  wire       [11:0]   tmp_C_36;
  wire       [7:0]    tmp_C_37;
  wire       [11:0]   tmp_C_38;
  wire       [7:0]    tmp_C_39;
  wire       [11:0]   tmp_C_40;
  wire       [7:0]    tmp_C_41;
  wire       [11:0]   tmp_C_42;
  wire       [7:0]    tmp_C_43;
  wire       [11:0]   tmp_C_44;
  wire       [7:0]    tmp_C_45;
  wire       [11:0]   tmp_C_46;
  wire       [7:0]    tmp_C_47;
  wire       [11:0]   tmp_C_48;
  wire       [7:0]    tmp_C_49;
  wire       [11:0]   tmp_C_50;
  wire       [7:0]    tmp_C_51;
  wire       [11:0]   tmp_C_52;
  wire       [7:0]    tmp_C_53;
  wire       [11:0]   tmp_C_54;
  wire       [7:0]    tmp_C_55;
  wire       [11:0]   tmp_C_56;
  wire       [7:0]    tmp_C_57;
  wire       [11:0]   tmp_C_58;
  wire       [7:0]    tmp_C_59;
  wire       [11:0]   tmp_C_60;
  wire       [7:0]    tmp_C_61;
  wire       [11:0]   tmp_C_62;
  wire       [7:0]    tmp_C_63;
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
  wire       [47:0]   aBits;
  wire       [31:0]   bBits;
  reg        [31:0]   cPortDataChain_0;
  reg        [31:0]   cPortDataChain_1;
  reg        [31:0]   cPortDataChain_2;
  reg        [31:0]   cPortDataChain_3;
  reg        [31:0]   cPortDataChain_4;
  reg        [31:0]   cPortDataChain_5;
  reg        [31:0]   cPortDataChain_6;
  reg        [31:0]   cPortDataChain_7;
  wire                tmp_OPMODE;
  wire                tmp_OPMODE_1;
  wire                tmp_OPMODE_2;
  wire                tmp_OPMODE_3;
  wire                tmp_OPMODE_4;
  wire                tmp_OPMODE_5;
  wire                tmp_OPMODE_6;
  wire                tmp_OPMODE_7;
  wire                tmp_OPMODE_8;
  wire                tmp_OPMODE_9;
  wire                tmp_OPMODE_10;
  wire                tmp_OPMODE_11;
  wire                tmp_OPMODE_12;
  wire                tmp_OPMODE_13;
  wire                tmp_OPMODE_14;
  wire                tmp_OPMODE_15;
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

  assign tmp_aBits_1 = io_a_3;
  assign tmp_aBits = {{4{tmp_aBits_1[7]}}, tmp_aBits_1};
  assign tmp_aBits_3 = io_a_2;
  assign tmp_aBits_2 = {{4{tmp_aBits_3[7]}}, tmp_aBits_3};
  assign tmp_aBits_5 = io_a_1;
  assign tmp_aBits_4 = {{4{tmp_aBits_5[7]}}, tmp_aBits_5};
  assign tmp_aBits_7 = io_a_0;
  assign tmp_aBits_6 = {{4{tmp_aBits_7[7]}}, tmp_aBits_7};
  assign tmp_C_1 = cPortDataChain_0[31 : 24];
  assign tmp_C = {{4{tmp_C_1[7]}}, tmp_C_1};
  assign tmp_C_3 = cPortDataChain_0[23 : 16];
  assign tmp_C_2 = {{4{tmp_C_3[7]}}, tmp_C_3};
  assign tmp_C_5 = cPortDataChain_0[15 : 8];
  assign tmp_C_4 = {{4{tmp_C_5[7]}}, tmp_C_5};
  assign tmp_C_7 = cPortDataChain_0[7 : 0];
  assign tmp_C_6 = {{4{tmp_C_7[7]}}, tmp_C_7};
  assign tmp_C_9 = cPortDataChain_1[31 : 24];
  assign tmp_C_8 = {{4{tmp_C_9[7]}}, tmp_C_9};
  assign tmp_C_11 = cPortDataChain_1[23 : 16];
  assign tmp_C_10 = {{4{tmp_C_11[7]}}, tmp_C_11};
  assign tmp_C_13 = cPortDataChain_1[15 : 8];
  assign tmp_C_12 = {{4{tmp_C_13[7]}}, tmp_C_13};
  assign tmp_C_15 = cPortDataChain_1[7 : 0];
  assign tmp_C_14 = {{4{tmp_C_15[7]}}, tmp_C_15};
  assign tmp_C_17 = cPortDataChain_2[31 : 24];
  assign tmp_C_16 = {{4{tmp_C_17[7]}}, tmp_C_17};
  assign tmp_C_19 = cPortDataChain_2[23 : 16];
  assign tmp_C_18 = {{4{tmp_C_19[7]}}, tmp_C_19};
  assign tmp_C_21 = cPortDataChain_2[15 : 8];
  assign tmp_C_20 = {{4{tmp_C_21[7]}}, tmp_C_21};
  assign tmp_C_23 = cPortDataChain_2[7 : 0];
  assign tmp_C_22 = {{4{tmp_C_23[7]}}, tmp_C_23};
  assign tmp_C_25 = cPortDataChain_3[31 : 24];
  assign tmp_C_24 = {{4{tmp_C_25[7]}}, tmp_C_25};
  assign tmp_C_27 = cPortDataChain_3[23 : 16];
  assign tmp_C_26 = {{4{tmp_C_27[7]}}, tmp_C_27};
  assign tmp_C_29 = cPortDataChain_3[15 : 8];
  assign tmp_C_28 = {{4{tmp_C_29[7]}}, tmp_C_29};
  assign tmp_C_31 = cPortDataChain_3[7 : 0];
  assign tmp_C_30 = {{4{tmp_C_31[7]}}, tmp_C_31};
  assign tmp_C_33 = cPortDataChain_4[31 : 24];
  assign tmp_C_32 = {{4{tmp_C_33[7]}}, tmp_C_33};
  assign tmp_C_35 = cPortDataChain_4[23 : 16];
  assign tmp_C_34 = {{4{tmp_C_35[7]}}, tmp_C_35};
  assign tmp_C_37 = cPortDataChain_4[15 : 8];
  assign tmp_C_36 = {{4{tmp_C_37[7]}}, tmp_C_37};
  assign tmp_C_39 = cPortDataChain_4[7 : 0];
  assign tmp_C_38 = {{4{tmp_C_39[7]}}, tmp_C_39};
  assign tmp_C_41 = cPortDataChain_5[31 : 24];
  assign tmp_C_40 = {{4{tmp_C_41[7]}}, tmp_C_41};
  assign tmp_C_43 = cPortDataChain_5[23 : 16];
  assign tmp_C_42 = {{4{tmp_C_43[7]}}, tmp_C_43};
  assign tmp_C_45 = cPortDataChain_5[15 : 8];
  assign tmp_C_44 = {{4{tmp_C_45[7]}}, tmp_C_45};
  assign tmp_C_47 = cPortDataChain_5[7 : 0];
  assign tmp_C_46 = {{4{tmp_C_47[7]}}, tmp_C_47};
  assign tmp_C_49 = cPortDataChain_6[31 : 24];
  assign tmp_C_48 = {{4{tmp_C_49[7]}}, tmp_C_49};
  assign tmp_C_51 = cPortDataChain_6[23 : 16];
  assign tmp_C_50 = {{4{tmp_C_51[7]}}, tmp_C_51};
  assign tmp_C_53 = cPortDataChain_6[15 : 8];
  assign tmp_C_52 = {{4{tmp_C_53[7]}}, tmp_C_53};
  assign tmp_C_55 = cPortDataChain_6[7 : 0];
  assign tmp_C_54 = {{4{tmp_C_55[7]}}, tmp_C_55};
  assign tmp_C_57 = cPortDataChain_7[31 : 24];
  assign tmp_C_56 = {{4{tmp_C_57[7]}}, tmp_C_57};
  assign tmp_C_59 = cPortDataChain_7[23 : 16];
  assign tmp_C_58 = {{4{tmp_C_59[7]}}, tmp_C_59};
  assign tmp_C_61 = cPortDataChain_7[15 : 8];
  assign tmp_C_60 = {{4{tmp_C_61[7]}}, tmp_C_61};
  assign tmp_C_63 = cPortDataChain_7[7 : 0];
  assign tmp_C_62 = {{4{tmp_C_63[7]}}, tmp_C_63};
  DSP48E2 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .CEA1           (enPrefetchChain_0        ), //i
    .CEA2           (enFetchChain_0           ), //i
    .CEB1           (enPrefetchChain_0        ), //i
    .CEB2           (enFetchChain_0           ), //i
    .CEC            (enFetchChain_0           ), //i
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
    .D              (27'h0000000              ), //i
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
    .A_INPUT("CASCADE"),
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .ACIN           (dsp48e2s_0_ACOUT[29:0]   ), //i
    .BCIN           (dsp48e2s_0_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_0_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_1_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_1_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_1_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_1_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_1_MULTSIGNOUT   ), //o
    .CEA1           (enPrefetchChain_1        ), //i
    .CEA2           (enFetchChain_1           ), //i
    .CEB1           (enPrefetchChain_1        ), //i
    .CEB2           (enFetchChain_1           ), //i
    .CEC            (enFetchChain_1           ), //i
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
    .A              (30'h00000000             ), //i
    .B              (18'h00000                ), //i
    .C              (dsp48e2s_1_C[47:0]       ), //i
    .D              (27'h0000000              ), //i
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
    .A_INPUT("CASCADE"),
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .ACIN           (dsp48e2s_1_ACOUT[29:0]   ), //i
    .BCIN           (dsp48e2s_1_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_1_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_2_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_2_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_2_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_2_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_2_MULTSIGNOUT   ), //o
    .CEA1           (enPrefetchChain_2        ), //i
    .CEA2           (enFetchChain_2           ), //i
    .CEB1           (enPrefetchChain_2        ), //i
    .CEB2           (enFetchChain_2           ), //i
    .CEC            (enFetchChain_2           ), //i
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
    .A              (30'h00000000             ), //i
    .B              (18'h00000                ), //i
    .C              (dsp48e2s_2_C[47:0]       ), //i
    .D              (27'h0000000              ), //i
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
    .A_INPUT("CASCADE"),
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .ACIN           (dsp48e2s_2_ACOUT[29:0]   ), //i
    .BCIN           (dsp48e2s_2_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_2_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_3_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_3_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_3_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_3_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_3_MULTSIGNOUT   ), //o
    .CEA1           (enPrefetchChain_3        ), //i
    .CEA2           (enFetchChain_3           ), //i
    .CEB1           (enPrefetchChain_3        ), //i
    .CEB2           (enFetchChain_3           ), //i
    .CEC            (enFetchChain_3           ), //i
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
    .A              (30'h00000000             ), //i
    .B              (18'h00000                ), //i
    .C              (dsp48e2s_3_C[47:0]       ), //i
    .D              (27'h0000000              ), //i
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
    .A_INPUT("CASCADE"),
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .ACIN           (dsp48e2s_3_ACOUT[29:0]   ), //i
    .BCIN           (dsp48e2s_3_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_3_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_4_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_4_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_4_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_4_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_4_MULTSIGNOUT   ), //o
    .CEA1           (enPrefetchChain_4        ), //i
    .CEA2           (enFetchChain_4           ), //i
    .CEB1           (enPrefetchChain_4        ), //i
    .CEB2           (enFetchChain_4           ), //i
    .CEC            (enFetchChain_4           ), //i
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
    .A              (30'h00000000             ), //i
    .B              (18'h00000                ), //i
    .C              (dsp48e2s_4_C[47:0]       ), //i
    .D              (27'h0000000              ), //i
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
    .A_INPUT("CASCADE"),
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .ACIN           (dsp48e2s_4_ACOUT[29:0]   ), //i
    .BCIN           (dsp48e2s_4_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_4_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_5_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_5_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_5_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_5_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_5_MULTSIGNOUT   ), //o
    .CEA1           (enPrefetchChain_5        ), //i
    .CEA2           (enFetchChain_5           ), //i
    .CEB1           (enPrefetchChain_5        ), //i
    .CEB2           (enFetchChain_5           ), //i
    .CEC            (enFetchChain_5           ), //i
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
    .A              (30'h00000000             ), //i
    .B              (18'h00000                ), //i
    .C              (dsp48e2s_5_C[47:0]       ), //i
    .D              (27'h0000000              ), //i
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
    .A_INPUT("CASCADE"),
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .ACIN           (dsp48e2s_5_ACOUT[29:0]   ), //i
    .BCIN           (dsp48e2s_5_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_5_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_6_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_6_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_6_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_6_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_6_MULTSIGNOUT   ), //o
    .CEA1           (enPrefetchChain_6        ), //i
    .CEA2           (enFetchChain_6           ), //i
    .CEB1           (enPrefetchChain_6        ), //i
    .CEB2           (enFetchChain_6           ), //i
    .CEC            (enFetchChain_6           ), //i
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
    .A              (30'h00000000             ), //i
    .B              (18'h00000                ), //i
    .C              (dsp48e2s_6_C[47:0]       ), //i
    .D              (27'h0000000              ), //i
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
    .A_INPUT("CASCADE"),
    .B_INPUT("CASCADE"),
    .AMULTSEL("A"),
    .BMULTSEL("B"),
    .PREADDINSEL("A"),
    .USE_MULT("NONE"),
    .USE_SIMD("FOUR12"),
    .AREG(2),
    .BREG(2),
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
    .ACIN           (dsp48e2s_6_ACOUT[29:0]   ), //i
    .BCIN           (dsp48e2s_6_BCOUT[17:0]   ), //i
    .PCIN           (dsp48e2s_6_PCOUT[47:0]   ), //i
    .CARRYCASCIN    (1'b0                     ), //i
    .MULTSIGNIN     (1'b0                     ), //i
    .ACOUT          (dsp48e2s_7_ACOUT[29:0]   ), //o
    .BCOUT          (dsp48e2s_7_BCOUT[17:0]   ), //o
    .PCOUT          (dsp48e2s_7_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp48e2s_7_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp48e2s_7_MULTSIGNOUT   ), //o
    .CEA1           (enPrefetchChain_7        ), //i
    .CEA2           (enFetchChain_7           ), //i
    .CEB1           (enPrefetchChain_7        ), //i
    .CEB2           (enFetchChain_7           ), //i
    .CEC            (enFetchChain_7           ), //i
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
    .A              (30'h00000000             ), //i
    .B              (18'h00000                ), //i
    .C              (dsp48e2s_7_C[47:0]       ), //i
    .D              (27'h0000000              ), //i
    .CARRYIN        (1'b0                     ), //i
    .P              (dsp48e2s_7_P[47:0]       ), //o
    .CARRYOUT       (dsp48e2s_7_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp48e2s_7_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp48e2s_7_OVERFLOW      ), //o
    .UNDERFLOW      (dsp48e2s_7_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp48e2s_7_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp48e2s_7_PATTERNDETECT )  //o
  );
  assign aBits = {tmp_aBits,{tmp_aBits_2,{tmp_aBits_4,tmp_aBits_6}}};
  assign bBits = {io_b_3,{io_b_2,{io_b_1,io_b_0}}};
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
  assign dsp48e2s_0_C = {tmp_C,{tmp_C_2,{tmp_C_4,tmp_C_6}}};
  assign dsp48e2s_0_A = aBits[47 : 18];
  assign dsp48e2s_0_B = aBits[17 : 0];
  assign enPrefetchChain_0 = io_enPrefetch;
  assign enFetchChain_0 = io_enFetch;
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
  assign dsp48e2s_1_C = {tmp_C_8,{tmp_C_10,{tmp_C_12,tmp_C_14}}};
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
  assign dsp48e2s_2_C = {tmp_C_16,{tmp_C_18,{tmp_C_20,tmp_C_22}}};
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
  assign dsp48e2s_3_C = {tmp_C_24,{tmp_C_26,{tmp_C_28,tmp_C_30}}};
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
  assign dsp48e2s_4_C = {tmp_C_32,{tmp_C_34,{tmp_C_36,tmp_C_38}}};
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
  assign dsp48e2s_5_C = {tmp_C_40,{tmp_C_42,{tmp_C_44,tmp_C_46}}};
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
  assign dsp48e2s_6_C = {tmp_C_48,{tmp_C_50,{tmp_C_52,tmp_C_54}}};
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
  assign dsp48e2s_7_C = {tmp_C_56,{tmp_C_58,{tmp_C_60,tmp_C_62}}};
  assign io_ab_0 = dsp48e2s_7_P[11 : 0];
  assign io_ab_1 = dsp48e2s_7_P[23 : 12];
  assign io_ab_2 = dsp48e2s_7_P[35 : 24];
  assign io_ab_3 = dsp48e2s_7_P[47 : 36];
  always @(posedge clk) begin
    if(enPrefetchChain_0) begin
      cPortDataChain_0 <= bBits;
    end
    enPrefetchChain_1 <= enPrefetchChain_0;
    if(io_clrPrefetch_1) begin
      enPrefetchChain_1 <= 1'b0;
    end
    if(enPrefetchChain_1) begin
      cPortDataChain_1 <= cPortDataChain_0;
    end
    enPrefetchChain_2 <= enPrefetchChain_1;
    if(io_clrPrefetch_2) begin
      enPrefetchChain_2 <= 1'b0;
    end
    if(enPrefetchChain_2) begin
      cPortDataChain_2 <= cPortDataChain_1;
    end
    enPrefetchChain_3 <= enPrefetchChain_2;
    if(io_clrPrefetch_3) begin
      enPrefetchChain_3 <= 1'b0;
    end
    if(enPrefetchChain_3) begin
      cPortDataChain_3 <= cPortDataChain_2;
    end
    enPrefetchChain_4 <= enPrefetchChain_3;
    if(io_clrPrefetch_4) begin
      enPrefetchChain_4 <= 1'b0;
    end
    if(enPrefetchChain_4) begin
      cPortDataChain_4 <= cPortDataChain_3;
    end
    enPrefetchChain_5 <= enPrefetchChain_4;
    if(io_clrPrefetch_5) begin
      enPrefetchChain_5 <= 1'b0;
    end
    if(enPrefetchChain_5) begin
      cPortDataChain_5 <= cPortDataChain_4;
    end
    enPrefetchChain_6 <= enPrefetchChain_5;
    if(io_clrPrefetch_6) begin
      enPrefetchChain_6 <= 1'b0;
    end
    if(enPrefetchChain_6) begin
      cPortDataChain_6 <= cPortDataChain_5;
    end
    enPrefetchChain_7 <= enPrefetchChain_6;
    if(io_clrPrefetch_7) begin
      enPrefetchChain_7 <= 1'b0;
    end
    if(enPrefetchChain_7) begin
      cPortDataChain_7 <= cPortDataChain_6;
    end
  end

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


endmodule
