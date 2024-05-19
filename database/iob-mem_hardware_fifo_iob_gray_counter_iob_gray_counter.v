// This program was cloned from: https://github.com/IObundle/iob-mem
// License: MIT License

`timescale 1ns/1ps

module iob_gray_counter 
  #(
    parameter   W = 1
    )
   (
    input wire     rst,
    input wire     clk,
    input wire     en,
    output [W-1:0] data_out
    );
   
   reg [W-1:0]     bin_counter;
   reg [W-1:0]     gray_counter;

   assign data_out = gray_counter;
       
   always @ (posedge clk, posedge rst)
     if (rst) begin
        bin_counter   <= 1; 
        gray_counter <= 0; 
     end else if (en) begin
        bin_counter   <= bin_counter + 1'b1;
        gray_counter <= W > 1? {bin_counter[W-1], bin_counter[W-2:0] ^ bin_counter[W-1:1]} : bin_counter;
     end
   
endmodule
