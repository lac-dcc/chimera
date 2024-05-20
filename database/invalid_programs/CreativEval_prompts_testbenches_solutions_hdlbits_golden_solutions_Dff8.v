// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
    
    always @(posedge clk) begin
        q <= d;
    end

endmodule