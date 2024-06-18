// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    always @ (posedge clk) begin
    	q <= d;
    
    end

endmodule
