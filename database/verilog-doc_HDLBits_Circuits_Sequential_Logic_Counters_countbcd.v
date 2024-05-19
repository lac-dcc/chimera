// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    initial begin
        q = 0; 
    end
    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end
        else begin
            if(q[3:0] == 4'd9) begin
                q[3:0] <= 0;
                
                if(q[7:4] == 4'd9) begin
                    q[7:4] <= 0;
 
                    if(q[11:8] == 4'd9) begin
                        q[11:8] <= 0;
 
                        if(q[15:12] == 4'd9) begin
                            q <= 0;
                        end
                        else begin
                            q[15:12] <= q[15:12] + 1'b1;
                        end
                    end
                    else begin
                        q[11:8] = q[11:8] + 4'b1;
                    end
                end
                else begin
                    q[7:4] = q[7:4] + 4'b1;
                end
            end
            else begin
                q[3:0] <= q[3:0] + 1'b1;
            end
        end
    end
    assign ena[3:1] = {(q[11:8]==4'd9&&q[7:4]==4'd9&&q[3:0]==4'd9),(q[7:4]==4'd9&&q[3:0]==4'd9),(q[3:0]==4'd9)};
endmodule

