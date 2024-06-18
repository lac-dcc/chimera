// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    integer i;
    always @ (in) begin 
        out = 0;
        for(i = 0; i < 255; i = i + 1) begin
            if (in[i] == 1'b1) 
    			out = out + 1;
        end                
    end

endmodule