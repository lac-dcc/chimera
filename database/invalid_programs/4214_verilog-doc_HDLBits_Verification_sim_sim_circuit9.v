// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input a,
    output [3:0] q );
    always @(posedge clk) begin
        if(a) begin
            q <= 4'd4;
        end
        else begin
            if(q == 4'd6) begin
                q <= 0;
            end
            else begin
                q <= q + 4'd1;
            end
        end
    end
endmodule

