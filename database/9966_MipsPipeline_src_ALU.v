// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module ALU (
    ALUCtrl,
    Sign,
    in1,
    in2,
    out
);

parameter ADD = 0;
parameter SUB = 1;
parameter AND = 2;
parameter OR = 3;
parameter XOR = 4;
parameter NOR = 5;
parameter SLL = 6;
parameter SRL = 7;
parameter SRA = 8;
parameter SLT = 9;

input [4:0] ALUCtrl;
input Sign;
input [31:0] in1;
input [31:0] in2;
output [31:0] out;

reg [31:0] out;

wire lt_low31;
wire lt_sign;
assign lt_low31 = (in1[30:0] < in2[30:0]);
assign lt_sign = (
    (in1[31] ^ in2[31]) ? 
    (in1[31] > in2[31] ? 1 : 0)
    : lt_low31
);

always @(*) begin
    case(ALUCtrl)
    ADD: out <= in1 + in2;
    SUB: out <= in1 - in2;
    AND: out <= in1 & in2;
    OR: out <= in1 | in2;
    XOR: out <= in1 ^ in2;
    NOR: out <= ~(in1 | in2);
    SLL: out <= in2 << in1[4:0];
    SRL: out <= in2 >> in1[4:0];
    SRA: out <= {{32{in2[31]}}, in2} >> in1[4:0];
    SLT: out <= {31'h00000000, Sign ? lt_sign : in1 < in2};
    default: out <= 0;
    endcase
end

endmodule