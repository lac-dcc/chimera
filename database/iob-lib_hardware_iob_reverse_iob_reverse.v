// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

// Note: Not tested!

module iob_reverse
  #(
    parameter DATA_W = 32
    )
   (
    input [DATA_W-1:0]      data_in,
    output reg [DATA_W-1:0] data_out
    );

   integer i;

   always @* begin
      for (i=0; i < DATA_W; i=i+1) begin : reverse
         data_out[i] = data_in[DATA_W-1-i];
      end
   end

endmodule
