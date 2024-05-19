// This program was cloned from: https://github.com/AndresNavarro82/vt52-fpga
// License: GNU General Public License v3.0

/**
 * Basic register with synchronous set & reset
 */
module simple_register
  #(parameter SIZE = 8)
   (input wire clk,
    input wire reset,
    input wire [SIZE-1:0] idata,
    input wire wen,
    output reg [SIZE-1:0] odata
    );

   always @(posedge clk) begin
      if (reset) odata <= 0;
      else if (wen) odata = idata;
   end
endmodule
