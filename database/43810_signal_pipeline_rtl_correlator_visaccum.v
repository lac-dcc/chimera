// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

//
// Read-Modify-Write pipelined accumulator, for the partial-sums from each of
// the first-stage correlators.
//
`timescale 1ns / 100ps
module visaccum #(
    // Input bit-width
    parameter  integer IBITS = 4,
    localparam integer ISB   = IBITS - 1,

    // Output bit-width
    parameter  integer OBITS = 7,
    localparam integer OSB   = OBITS - 1,

    // Number of partial-sums to loop over
    parameter  integer PSUMS = 3,
    localparam integer PBITS = $clog2(PSUMS),
    localparam integer PSB   = PBITS - 1,

    // Number of times to accumulate each partial sum
    parameter  integer COUNT = 5,
    localparam integer CBITS = $clog2(COUNT),
    localparam integer CSB   = CBITS - 1
) (
    input clock,
    input reset,

    input frame_i,
    input valid_i,
    input [ISB:0] rdata_i,
    input [ISB:0] idata_i,

    // AX4-Stream like interface, but with no backpressure
    output frame_o,
    output valid_o,
    output first_o,
    output last_o,
    output [OSB:0] rdata_o,
    output [OSB:0] idata_o
);

  reg [OSB:0] rsram[PSUMS];
  reg [OSB:0] isram[PSUMS];

  reg [CSB:0] count;
  reg czero;
  wire [CSB:0] cnext = count + 1;
  wire cwrap = cnext == COUNT;


  // -- Read cycle -- //

  localparam [PSB:0] PZERO = {PBITS{1'b0}};

  reg rd_cyc, rd_vld;
  reg pwrap;
  reg [ISB:0] rr_src, ri_src;
  reg [OSB:0] rr_sum, ri_sum;
  reg  [PSB:0] rd_adr;
  wire [PSB:0] rd_nxt = rd_adr + 1;

  always @(posedge clock) begin
    if (reset) begin
      rd_cyc <= 1'b0;
      rd_vld <= 1'b0;
      rd_adr <= PZERO;
      pwrap  <= 1'b0;
    end else begin
      if (frame_i) begin
        rd_cyc <= 1'b1;
      end else if (rd_cyc && !frame_i && rd_nxt == PSUMS) begin
        rd_cyc <= 1'b0;
      end
      rd_vld <= valid_i;

      rr_src <= rdata_i;
      ri_src <= idata_i;

      rr_sum <= rsram[rd_adr];
      ri_sum <= isram[rd_adr];

      if (frame_i || rd_cyc) begin
        if (rd_nxt == PSUMS) begin
          rd_adr <= PZERO;
          pwrap  <= 1'b1;
        end else begin
          rd_adr <= rd_nxt;
          pwrap  <= 1'b0;
        end
      end else if (!rd_cyc) begin
        rd_adr <= PZERO;
        pwrap  <= 1'b0;
      end
    end
  end


  // -- Accumulator -- //

  localparam [CSB:0] CZERO = {CBITS{1'b0}};
  localparam [CSB:0] OZERO = {OBITS{1'b0}};

  reg ac_cyc, ac_vld, ac_fst, ac_lst, wr_en;
  reg [OSB:0] ar_sum, ai_sum;
  reg  [PSB:0] ac_adr;

  wire [OSB:0] ar_src = czero ? OZERO : rr_sum;
  wire [OSB:0] ai_src = czero ? OZERO : ri_sum;

  always @(posedge clock) begin
    if (reset) begin
      ac_cyc <= 1'b0;
    end else if (rd_cyc) begin
      ac_cyc <= 1'b1;
    end else if (!rd_cyc && ac_vld && ac_lst) begin
      ac_cyc <= 1'b0;
    end
  end

  always @(posedge clock) begin
    if (reset) begin
      ac_vld <= 1'b0;
      ac_fst <= 1'b0;
      ac_lst <= 1'b0;

      count  <= CZERO;
      czero  <= 1'b1;
      wr_en  <= 1'b0;
    end else begin
      wr_en  <= rd_vld;
      ar_sum <= rr_src + ar_src;
      ai_sum <= ri_src + ai_src;

      ac_vld <= cwrap;
      ac_fst <= cwrap & ~ac_vld;
      ac_adr <= rd_adr;

      czero  <= count == CZERO;

      if (pwrap) begin
        if (cwrap) begin
          count  <= CZERO;
          ac_lst <= 1'b1;
        end else begin
          count  <= cnext;
          ac_lst <= 1'b0;
        end
      end else begin
        ac_lst <= 1'b0;
      end
    end
  end


  // -- Write cycle -- //

  reg wr_cyc, wr_vld, wr_fst, wr_lst;
  reg [OSB:0] wr_dat, wi_dat;
  reg [PSB:0] wr_adr;

  assign frame_o = wr_cyc;
  assign valid_o = wr_vld;
  assign first_o = wr_fst;
  assign last_o  = wr_lst;
  assign rdata_o = wr_dat;
  assign idata_o = wi_dat;

  always @(posedge clock) begin
    if (reset) begin
      wr_cyc <= 1'b0;
    end else if (ac_cyc) begin
      wr_cyc <= 1'b1;
    end else if (wr_vld && wr_lst && !ac_cyc) begin
      wr_cyc <= 1'b0;
    end
  end

  always @(posedge clock) begin
    if (reset) begin
      wr_vld <= 1'b0;
      wr_fst <= 1'b0;
      wr_lst <= 1'b0;
    end else begin
      wr_adr <= ac_adr;

      if (wr_en) begin
        rsram[wr_adr] <= ar_sum;
        isram[wr_adr] <= ai_sum;
      end

      // Output the partial visibilities
      wr_vld <= ac_vld;
      wr_fst <= ac_fst;
      wr_lst <= ac_lst;

      wr_dat <= ar_sum;
      wi_dat <= ai_sum;
    end
  end

endmodule  // visaccum
