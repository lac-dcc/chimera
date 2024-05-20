// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input d, 
    input ena,
    output q);
    
    always @(*) begin
        if (ena) begin
            q <= d;
        end
    end

endmodule