// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clock,
    input a,
    output p,
    output q );
    always @(*) begin
        if(clock) begin
            p <= a;
        end
    end
    always @(negedge clock) begin
        q <= a;
    end
endmodule

