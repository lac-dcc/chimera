// This program was cloned from: https://github.com/IObundle/iob-ila
// License: MIT License

`timescale 1ns / 1ps

module ila_sig_clk #(
   parameter W = 0
) (
   input clk_i,
   input arst_i,
   input [W-1:0] data_i,
   output reg [W-1:0] data_o
);
   reg [W-1:0] data_sync_0, data_sync_1;
   always @(posedge clk_i, posedge arst_i)
     if(arst_i) begin
       data_sync_0 <= 0;
       data_sync_1 <= 0;
     end else begin
       data_sync_0 <= data_i;
       data_sync_1 <= data_sync_0;
     end
     always @* data_o = data_sync_1;
endmodule

