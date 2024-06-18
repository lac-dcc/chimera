// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q
);

    always@(posedge clk) begin
        if(reset)
            Q <= 4'd0;
        else if(enable) begin
            if(Q==9)
                Q <= 4'd0;
            else
                Q <= Q + 1'b1;
        end
    end
    
endmodule

