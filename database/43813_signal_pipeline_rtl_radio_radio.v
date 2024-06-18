// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License


`timescale 1ns / 100ps

// Basic input module from a Max2769 set up for TART3 with single bit I and Q
// This will need a bit of tweaking in real life in order to get the sampling to happen when the external data is valid. 
// As the data is clocked at 8 MHz on the output, I suspect we can just use negedge to get something reasonable (after checking with an oscilloscope).
module radio #(
    parameter ANT_NUM = 0
) (
    input clk16,
    input rst_n,
    input i1,
    input q1,
    output reg data_i,
    output reg data_q
);

  initial begin
    data_i <= 0;
    data_q <= 0;
  end

  always @(posedge clk16 or negedge rst_n) begin
    if (!rst_n) begin
      data_i <= 0;
      data_q <= 0;
    end else begin
      data_i <= i1;
      data_q <= q1;
    end
  end

endmodule


module radio_dummy #(
    parameter ANT_NUM = 0
) (
    input clk16,
    input rst_n,
    input i1,
    input q1,
    output reg data_i,
    output reg data_q
);

  // Set up an LFSR to produce a PRN sequence and use the ANT_NUM as a starting value

  reg [10:1] i_LFSR = ANT_NUM + 1;
  reg [10:1] q_LFSR = ANT_NUM + 3;

  wire i_XNOR, q_XNOR;

  assign i_XNOR = i_LFSR[10] ^~ i_LFSR[7];
  assign q_XNOR = q_LFSR[10] ^~ q_LFSR[7];

  initial begin
    data_i <= 0;
    data_q <= 0;
  end

  always @(posedge clk16 or negedge rst_n) begin
    if (!rst_n) begin
      i_LFSR <= ANT_NUM + 1;
      q_LFSR <= ANT_NUM + 3;
    end else begin
      i_LFSR <= {i_LFSR[9:1], i_XNOR};
      q_LFSR <= {q_LFSR[9:1], q_XNOR};
    end
    data_i <= i_LFSR[2];
    data_q <= q_LFSR[2];
  end

endmodule
