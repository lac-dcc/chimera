// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

// N-bit binary up counter with load
module BinUp #(parameter N = 4) (
     input inc, clear, load,
	  input [N-1:0] D,
     output reg [N-1:0] Q								// Q is defined as an N-bit register
);                  			
     always @ (negedge inc, negedge clear, negedge load)
          if (clear==1'b0) Q = 0;       			// Q is loaded with all 0's
               else if (load==1'b0) Q = D;		// Q is loaded with D
						else Q = Q + 1'b1;            // Q is incremented
endmodule 