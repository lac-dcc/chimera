// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input x,
    output z
); 
    reg out1=0, out2, out3;
    initial z = 1;
    always @(posedge clk) begin
        out1 = x ^ out1;
        out2 = x & ~out2;
        out3 = x | ~out3;
        z = ~(out1 | out2 | out3);
    end
endmodule

