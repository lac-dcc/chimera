// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : uint4_mul
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module uint4_mul (
  input      [3:0]    io_w1,
  input      [3:0]    io_w2,
  input      [3:0]    io_a1,
  input      [3:0]    io_a2,
  output     [7:0]    io_a1w1,
  output     [7:0]    io_a1w2,
  output     [7:0]    io_a2w1,
  output     [7:0]    io_a2w2,
  input               clk
);

  reg        [4:0]    dsp_INMODE;
  reg        [8:0]    dsp_OPMODE;
  wire       [29:0]   dsp_A;
  wire       [17:0]   dsp_B;
  wire       [26:0]   dsp_D;
  wire       [29:0]   dsp_ACOUT;
  wire       [17:0]   dsp_BCOUT;
  wire       [47:0]   dsp_PCOUT;
  wire       [0:0]    dsp_CARRYCASCOUT;
  wire       [0:0]    dsp_MULTSIGNOUT;
  wire       [47:0]   dsp_P;
  wire       [3:0]    dsp_CARRYOUT;
  wire       [7:0]    dsp_XOROUT;
  wire                dsp_OVERFLOW;
  wire                dsp_UNDERFLOW;
  wire                dsp_PATTERNBDETECT;
  wire                dsp_PATTERNDETECT;
  wire       [29:0]   tmp_A;
  wire       [3:0]    tmp_A_1;
  wire                tmp_OPMODE;
  wire       [7:0]    sa1w1;
  wire       [7:0]    sa2w1;
  wire       [7:0]    sa1w2;
  wire       [7:0]    sa2w2;
  function [4:0] zz_dsp_INMODE(input dummy);
    begin
      zz_dsp_INMODE[1] = 1'b0;
      zz_dsp_INMODE[2] = 1'b1;
      zz_dsp_INMODE[3] = 1'b0;
      zz_dsp_INMODE[0] = 1'b1;
      zz_dsp_INMODE[4] = 1'b0;
    end
  endfunction
  wire [4:0] tmp_1;

  assign tmp_A_1 = io_w1;
  assign tmp_A = {{26{tmp_A_1[3]}}, tmp_A_1};
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
  ) dsp (
    .CLK            (clk               ), //i
    .ALUMODE        (4'b0000           ), //i
    .INMODE         (dsp_INMODE[4:0]   ), //i
    .OPMODE         (dsp_OPMODE[8:0]   ), //i
    .CARRYINSEL     (3'b000            ), //i
    .ACIN           (30'h00000000      ), //i
    .BCIN           (18'h00000         ), //i
    .PCIN           (48'h000000000000  ), //i
    .CARRYCASCIN    (1'b0              ), //i
    .MULTSIGNIN     (1'b0              ), //i
    .ACOUT          (dsp_ACOUT[29:0]   ), //o
    .BCOUT          (dsp_BCOUT[17:0]   ), //o
    .PCOUT          (dsp_PCOUT[47:0]   ), //o
    .CARRYCASCOUT   (dsp_CARRYCASCOUT  ), //o
    .MULTSIGNOUT    (dsp_MULTSIGNOUT   ), //o
    .CEA1           (1'b1              ), //i
    .CEA2           (1'b0              ), //i
    .CEB1           (1'b1              ), //i
    .CEB2           (1'b1              ), //i
    .CEC            (1'b0              ), //i
    .CED            (1'b1              ), //i
    .CEAD           (1'b1              ), //i
    .CEM            (1'b1              ), //i
    .CEP            (1'b1              ), //i
    .CECARRYIN      (1'b0              ), //i
    .CECTRL         (1'b0              ), //i
    .CEINMODE       (1'b0              ), //i
    .CEALUMODE      (1'b0              ), //i
    .RSTA           (1'b0              ), //i
    .RSTB           (1'b0              ), //i
    .RSTC           (1'b0              ), //i
    .RSTD           (1'b0              ), //i
    .RSTM           (1'b0              ), //i
    .RSTP           (1'b0              ), //i
    .RSTALLCARRYIN  (1'b0              ), //i
    .RSTCTRL        (1'b0              ), //i
    .RSTINMODE      (1'b0              ), //i
    .RSTALUMODE     (1'b0              ), //i
    .A              (dsp_A[29:0]       ), //i
    .B              (dsp_B[17:0]       ), //i
    .C              (48'hffffffffffff  ), //i
    .D              (dsp_D[26:0]       ), //i
    .CARRYIN        (1'b0              ), //i
    .P              (dsp_P[47:0]       ), //o
    .CARRYOUT       (dsp_CARRYOUT[3:0] ), //o
    .XOROUT         (dsp_XOROUT[7:0]   ), //o
    .OVERFLOW       (dsp_OVERFLOW      ), //o
    .UNDERFLOW      (dsp_UNDERFLOW     ), //o
    .PATTERNBDETECT (dsp_PATTERNBDETECT), //o
    .PATTERNDETECT  (dsp_PATTERNDETECT )  //o
  );
  assign tmp_1 = zz_dsp_INMODE(1'b0);
  always @(*) dsp_INMODE = tmp_1;
  assign tmp_OPMODE = 1'b0;
  always @(*) begin
    dsp_OPMODE[8 : 7] = {tmp_OPMODE,tmp_OPMODE};
    dsp_OPMODE[1 : 0] = {1'b0,1'b1};
    dsp_OPMODE[3 : 2] = {1'b0,1'b1};
    dsp_OPMODE[6 : 4] = {{1'b0,1'b0},1'b0};
  end

  assign dsp_A = tmp_A;
  assign dsp_B = {{{3'b000,io_a2},7'h00},io_a1};
  assign dsp_D = {{io_w2[3],io_w2},22'h000000};
  assign sa1w1 = dsp_P[7 : 0];
  assign sa2w1 = dsp_P[18 : 11];
  assign sa1w2 = dsp_P[29 : 22];
  assign sa2w2 = dsp_P[40 : 33];
  assign io_a1w1 = sa1w1;
  assign io_a2w1 = sa2w1;
  assign io_a1w2 = sa1w2;
  assign io_a2w2 = sa2w2;

endmodule
