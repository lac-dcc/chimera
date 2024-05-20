// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0]q;
    SubModule ins0(in, clk, resetn, q[0]);
    SubModule ins1(q[0], clk, resetn, q[1]);
    SubModule ins2(q[1], clk, resetn, q[2]);
    SubModule ins3(q[2], clk, resetn, out);

endmodule

module SubModule(input in, input clk, input resetn, output out);
    always @(posedge clk) begin
        if(!resetn) begin
            out <= 0;
        end
        else begin
            out <= in;
        end
    end
endmodule
