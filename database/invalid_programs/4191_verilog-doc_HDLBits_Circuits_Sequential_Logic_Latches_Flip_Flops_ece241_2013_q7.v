// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    wire old = Q;
    always @(posedge clk) begin
        if(j^k) begin
            Q = j;
        end
        else begin
            Q = j?~old:old;
        end
    end
endmodule

