// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always @(posedge clk) begin
        if(resetn == 1) begin
            if(byteena[0] == 1) begin
                q[7:0] <= d[7:0];
            end
            if(byteena[1] == 1) begin
                q[15:8] <= d[15:8];
            end
        end
        else if(resetn == 0) begin
            q <= 0;
        end
    end
endmodule

