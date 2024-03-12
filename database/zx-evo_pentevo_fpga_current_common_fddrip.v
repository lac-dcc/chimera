
// A note for MFM encoding:
// A zero is encoded as 10 if preceded by a zero, and 00 if preceded by a one; a one is always encoded as 01.

`include "tune.v"

module fddrip
(
  input  wire        clk,
  input  wire        reset,
  input  wire        rdat_n,
  output reg  [7:0]  data,
  output reg  [18:0] data_cnt_l,
  input  wire        cnt_latch,
  input  wire        req,
  output wire        stop,
  output wire        stb
);

  reg reset_r;
  reg data_ready;
  reg [18:0] data_cnt;

  /* Grabbed data counter */
  always @(posedge clk)
  begin
    if (!reset && reset_r)
      data_cnt <= 0;

    else if (stb)
      data_cnt <= data_cnt + 1'b1;

    if (cnt_latch)
      data_cnt_l <= data_cnt;
   end

  /* DMA interface */
  assign stop = reset && !reset_r;
  assign stb = req && data_ready;

  always @(posedge clk)
    reset_r <= reset;

  /* Pulse counting */
  reg [1:0] rdat;
  reg [8:0] rle_cnt;

  wire pulse = rdat[0] && !rdat[1];   // input signal looks like: __-_________-____-____

  always @(posedge clk)
  begin
    // re-sync input data
    rdat <= {rdat[0], rdat_n};

    // RLE counter
    if (pulse)
      rle_cnt <= 2;   // to always have initial 1

    else if (|rle_cnt)    // overrun is indicated with 0 value and the counter stops
      rle_cnt <= rle_cnt + 1'b1;

    // data and data counter
    if (reset)
    begin
      data_ready <= 1'b0;
    end

    else if (pulse)
    begin
      data <= rle_cnt[8:1];   // divide by 2
      data_ready <= 1'b1;
    end

    else if (stb)
      data_ready <= 1'b0;
  end

endmodule
