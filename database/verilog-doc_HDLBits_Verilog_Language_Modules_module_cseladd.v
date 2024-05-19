// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1,sum2,sum3;
    wire cout,cout1;
    add16 ins1(a[15:0], b[15:0], 0, sum1, cout);
    add16 ins2(a[31:16], b[31:16], 0, sum2, cout1);
    add16 ins3(a[31:16], b[31:16], 1, sum3, cout1);
    always @(*) begin
        case (cout)
            1'b0:begin 
                sum[31:0] = {sum2[15:0],sum1[15:0]};
            end
            1'b1:begin
                sum = {sum3,sum1};
            end
        endcase
    end
endmodule


