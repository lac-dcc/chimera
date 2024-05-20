// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module alu(
    input [31:0]src_a,
    input [31:0]src_b,
    input [2:0]op,

    output reg [31:0]res
);

always @(*) begin
/*
* Problem 1:
* Write operations execution logic here.
*/
end

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module alu(
    input [31:0]src_a,
    input [31:0]src_b,
    input [2:0]op,

    output reg [31:0]res
);

always @(*) begin
    case (op)
        3'b000: res = src_a;
        3'b001: res = src_a + src_b;
        3'b100: res = src_a ^ src_b;
        3'b110: res = src_a | src_b;
        3'b111: res = src_a & src_b;
    endcase
end

endmodule
