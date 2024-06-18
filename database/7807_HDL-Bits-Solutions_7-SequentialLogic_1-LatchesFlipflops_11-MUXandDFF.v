// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
    
    always @ (posedge clk) begin
        case (L)
            1'b0 : Q <= q_in;
            1'b1 : Q <= r_in;
        endcase    
    end

endmodule
