// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input clk,
    input in, 
    output out);
	
    always @ (posedge clk) begin
    	out <= out ^ in;
    end
endmodule
