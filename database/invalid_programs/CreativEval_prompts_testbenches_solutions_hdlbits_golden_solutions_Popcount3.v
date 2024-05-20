// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input [2:0] in,
    output [1:0] out );
    
    integer i;
    
    always @(*) begin
        out = 0;
        for(i = 0; i < 3; i ++) begin
            if(in[i])
                out = out + 1;
        end
    end

endmodule