// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    reg i;
    always @(posedge clk) begin
        if(load) begin
            q <= data;
        end
        else begin
            if(ena[0]^ena[1]) begin
                case (ena)
                    /*right*/
                    2'b01: begin
                        q <= {q[0], q[99:1]};
                    end
                    /*left*/
                    2'b10: begin
                        q <= {q[98:0], q[99]};
                    end
                endcase
            end
         end
    end
endmodule

