// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end
        else begin
            if(slowena) begin
                if(q == 4'd9) begin 
                    q = 0;
                end
                else begin
                    q = q + 1;
                end
            end
            else begin
                q = q + 0;
            end
        end
    end
endmodule

