// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input clk,
    input reset,
    output [3:0] q);

    always @(posedge clk) begin
        if(reset) begin
            q <= 1;
        end
        else begin
            if(q == 10) begin
                q <= 1;
            end
            else begin
                q <= q + 1;
            end
        end
    end
    
endmodule