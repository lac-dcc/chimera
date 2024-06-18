// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q);
    always @ (posedge clk) begin
        if (r) q <= 1'b0;
        else   q <= d;
    end
endmodule