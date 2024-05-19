// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    always @ (posedge clk) begin
    	q <= d;
    end
endmodule
