
`include "tune.v"

module zint
(
  input  wire       clk,
  input  wire       zpos,
  input  wire       res,
  input  wire       wait_n,
  input  wire       int_start_frm,
  input  wire       int_start_lin,
  input  wire       int_start_dma,
  input  wire       int_start_wtp,
  input  wire       vdos,           // pre_vdos
  input  wire       intack,
`ifdef PENT_312
  output wire       boost_start,
`endif

  input  wire [7:0] intmask,
  output wire [7:0] im2vect,

  output wire int_n
);

  // In VDOS INTs are focibly disabled.
  // For Frame, Line INT its generation is blocked, it will be lost.
  // For DMA INT only its output is blocked, so DMA ISR will will be processed as soon as returned from VDOS.

  reg [1:0] int_sel = 0;
  reg int_frm;
  reg int_dma;
  reg int_lin;
  reg int_wtp;
  reg intack_r;
  wire intctr_fin;
  
  localparam INTFRM = 2'b00;
  localparam INTLIN = 2'b01;
  localparam INTDMA = 2'b10;
  localparam INTWTP = 2'b11;

  wire [7:0] vect [0:3];
  assign vect[INTFRM] = 8'hFF;
  assign vect[INTLIN] = 8'hFD;
  assign vect[INTDMA] = 8'hFB;
  assign vect[INTWTP] = 8'hF9;

  assign im2vect = {vect[int_sel]};

  wire int_all = (int_frm || int_lin || int_dma || int_wtp) && !vdos;
  assign int_n = int_all ? 1'b0 : 1'bZ;

  wire dis_int_frm = !intmask[0];
  wire dis_int_lin = !intmask[1];
  wire dis_int_dma = !intmask[2];
  wire dis_int_wtp = !intmask[3];

`ifdef PENT_312
  assign boost_start = intack_s || intctr_fin_s;

  wire intctr_fin_s = !intctr_fin_r && intctr_fin;
  reg intctr_fin_r;
  always @(posedge clk)
    intctr_fin_r <= intctr_fin;
`endif

  wire intack_s = intack && !intack_r;
  always @(posedge clk)
    intack_r <= intack;

// ~INT source latch
  always @(posedge clk)
    if (intack_s)
    begin
      if (int_frm)
        int_sel <= INTFRM;    // priority 0
      else if (int_lin)
        int_sel <= INTLIN;    // priority 1
      else if (int_dma)
        int_sel <= INTDMA;    // priority 2
      else if (int_wtp)
        int_sel <= INTWTP;    // priority 3
    end

// ~INT generating
  always @(posedge clk)
    if (res || dis_int_frm)
      int_frm <= 1'b0;
    else if (int_start_frm)
      int_frm <= 1'b1;
    else if (intack_s || intctr_fin)    // priority 0
      int_frm <= 1'b0;

  always @(posedge clk)
    if (res || dis_int_lin)
      int_lin <= 1'b0;
    else if (int_start_lin)
      int_lin <= 1'b1;
    else if (intack_s && !int_frm)    // priority 1
      int_lin <= 1'b0;

  always @(posedge clk)
    if (res || dis_int_dma)
      int_dma <= 1'b0;
    else if (int_start_dma)
      int_dma <= 1'b1;
    else if (intack_s && !int_frm && !int_lin)    // priority 2
      int_dma <= 1'b0;

  always @(posedge clk)
    if (res || dis_int_wtp)
      int_wtp <= 1'b0;
    else if (int_start_wtp)
      int_wtp <= 1'b1;
    else if (intack_s && !int_frm && !int_lin && !int_dma)    // priority 3
      int_wtp <= 1'b0;

// ~WAIT resync
  reg wait_r;
    always @(posedge clk)
        wait_r <= !wait_n;

// ~INT counter
  reg [5:0] intctr;
  assign intctr_fin = intctr[5];   // 32 clks

  always @(posedge clk, posedge int_start_frm)
  begin
    if (int_start_frm)
      intctr <= 1'b0;
    else if (zpos && !intctr_fin && !wait_r && !vdos)
      intctr <= intctr + 1'b1;
  end

endmodule
