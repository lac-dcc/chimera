// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module( 
    input [99:0] in,
    output [99:0] out
);

	integer i;
    always @ (in) begin 
    for(i = 0; i <= 99; i = i + 1) begin
        out[i] = in[99 - i];
    end
    end
    
endmodule