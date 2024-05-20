// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );//

    always @(posedge clk) begin
        q <= d;
    end

endmodule