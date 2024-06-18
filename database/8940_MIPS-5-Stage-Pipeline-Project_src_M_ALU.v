// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

//`include "M_ADDER.v"
//`include "M_MULT.v"

module M_ALU(
    input[31:0] a, b,
    input[2:0]  alucontrol,
    output reg[31:0] result);

    wire [31:0] condinvb, sum;
    wire [31:0] product;

    assign condinvb = alucontrol[2] ? ~b : b;
    // assign sum = a + condinvb + alucontrol[2];
    M_ADDER #(.N(32)) adder(a, condinvb, alucontrol[2], sum, _);
    M_MULT #(.N(32)) multiplier(a, b, product);

    // assign zero = (result == 32'b0);

    always@(*)
    case (alucontrol[1:0])
        2'b00: result = a & b;
        2'b01: result = a | b;
        2'b10: result = sum;
        2'b11: result = alucontrol[2]?sum[31]:product[31:0];
    endcase

endmodule