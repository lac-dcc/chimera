// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

module iob_s2f_sync
  #(
    parameter DATA_W = 32
    )
   (
    input                   clk,

    input                   rst,
    input [DATA_W-1:0]      rst_val,

    input [DATA_W-1:0]      data_in,
    output reg [DATA_W-1:0] data_out
    );

   reg [DATA_W-1:0]         sync;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         sync <= rst_val;
         data_out <= rst_val;
      end else begin
         sync <= data_in;
         data_out <= sync;
      end
   end

endmodule
