// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input [254:0] in,
    output [7:0] out );

    always @(*) begin
        out = 0;
        for(int i = 0; i < 255; i++) begin
            if(in[i])
                out = out + 1;
            else
                out = out + 0;
        end
    end
    
endmodule