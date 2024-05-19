// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input reset,
    output [9:0] q);

    always@(posedge clk) begin
        if(reset)
            q <= 10'd0;
        else if(q == 10'd999)
            q <= 10'd0;
        else
            q <= q + 1'b1;
    end
    
endmodule

