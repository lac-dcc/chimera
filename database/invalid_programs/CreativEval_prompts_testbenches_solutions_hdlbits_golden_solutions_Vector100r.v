// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input [99:0] in,
    output [99:0] out
);

    always @(*) begin
        for(integer i = 0; i < 100; i++)
            out[i] = in[99 - i];
    end
    
endmodule