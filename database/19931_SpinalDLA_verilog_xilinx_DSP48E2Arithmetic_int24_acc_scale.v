// This program was cloned from: https://github.com/adamgallas/SpinalDLA
// License: Apache License 2.0

// Generator : SpinalHDL v1.9.0    git head : 7d30dbacbd3aa1be42fb2a3d4da5675703aae2ae
// Component : int24_acc_scale
// Git hash  : 58987f7f234d2f22202f16d8122fac665f2828cb

`timescale 1ns/1ps

module int24_acc_scale (
  input      [23:0]   io_a,
  input      [23:0]   io_b,
  input      [17:0]   io_scale,
  input               io_valid,
  input               io_last,
  output     [23:0]   io_aAcc,
  output     [23:0]   io_bAcc,
  output     [47:0]   io_scaleRes,
  input               clk,
  input               reset
);

  reg        [4:0]    dsp_INMODE;
  reg        [8:0]    dsp_OPMODE;
  wire       [29:0]   dsp_A;
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
  wire       [23:0]   tmp_A_1;
  wire       [26:0]   tmp_D;
  wire       [23:0]   tmp_D_1;
  reg                 accValid;
  reg                 io_last_delay_1;
  reg                 ADCe;
  reg                 ADCe_delay_1;
  reg                 multEnable;
  reg                 muteD;
  wire       [47:0]   ab;
  wire       [23:0]   aAccBits;
  wire       [23:0]   bAccBits;

  assign tmp_A_1 = aAccBits;
  assign tmp_A = {{6{tmp_A_1[23]}}, tmp_A_1};
  assign tmp_D_1 = bAccBits;
  assign tmp_D = {{3{tmp_D_1[23]}}, tmp_D_1};
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
    .INMODEREG(1),
    .OPMODEREG(1),
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
    .CEA1           (ADCe              ), //i
    .CEA2           (1'b0              ), //i
    .CEB1           (1'b1              ), //i
    .CEB2           (1'b1              ), //i
    .CEC            (1'b1              ), //i
    .CED            (ADCe              ), //i
    .CEAD           (1'b0              ), //i
    .CEM            (1'b1              ), //i
    .CEP            (1'b1              ), //i
    .CECARRYIN      (1'b0              ), //i
    .CECTRL         (1'b1              ), //i
    .CEINMODE       (1'b1              ), //i
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
    .B              (io_scale[17:0]    ), //i
    .C              (ab[47:0]          ), //i
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
  always @(*) begin
    dsp_INMODE[1] = ADCe;
    dsp_INMODE[2] = muteD;
    dsp_INMODE[3] = 1'b0;
    dsp_INMODE[0] = 1'b1;
    dsp_INMODE[4] = 1'b0;
  end

  always @(*) begin
    dsp_OPMODE[8 : 7] = {(io_b[23] && io_valid),1'b0};
    dsp_OPMODE[1 : 0] = {multEnable,multEnable};
    dsp_OPMODE[3 : 2] = {io_valid,1'b1};
    dsp_OPMODE[6 : 4] = {{1'b0,accValid},1'b0};
  end

  assign ab = {io_a,io_b};
  assign aAccBits = dsp_P[47 : 24];
  assign bAccBits = dsp_P[23 : 0];
  assign dsp_A = tmp_A;
  assign dsp_D = tmp_D;
  assign io_scaleRes = dsp_P;
  assign io_aAcc = aAccBits;
  assign io_bAcc = bAccBits;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      accValid <= 1'b0;
      io_last_delay_1 <= 1'b0;
      ADCe <= 1'b0;
      ADCe_delay_1 <= 1'b0;
      multEnable <= 1'b0;
      muteD <= 1'b1;
    end else begin
      if(io_valid) begin
        accValid <= 1'b1;
      end
      if(io_last) begin
        accValid <= 1'b0;
      end
      io_last_delay_1 <= io_last;
      ADCe <= io_last_delay_1;
      ADCe_delay_1 <= ADCe;
      multEnable <= (ADCe || ADCe_delay_1);
      muteD <= (! ADCe);
    end
  end


endmodule
