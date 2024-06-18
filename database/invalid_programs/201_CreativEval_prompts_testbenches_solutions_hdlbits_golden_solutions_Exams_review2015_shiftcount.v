// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    always @(posedge clk) begin
        if (shift_ena) begin
            q <= {q[2:0], data};  // an useful skill
        end
        else if (count_ena) begin
            q <= q - 1;
        end
        else begin
            q <= q;
        end
    end

endmodule