// This program was cloned from: https://github.com/RockingSNP/Verilog
// License: MIT License

module mux1b16to1 (
    input res_add,res_sub,res_and,res_or,res_nand,res_xor,res_nor,res_not,res_add_not,res_sub_not,res_and_not,res_or_not,res_nand_not,res_xor_not,res_nor_not,res_not_not,
    input [3:0] opcode,
    output out
);

    wire a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;

	assign a0  = ((~opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]))&(res_add);
	assign a1  = ((~opcode[3])&(~opcode[2])&(~opcode[1])&(opcode[0]))&(res_sub);
	assign a2  = ((~opcode[3])&(~opcode[2])&(opcode[1])&(~opcode[0]))&(res_and);
	assign a3  = ((~opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]))&(res_or);
    assign a4  = ((~opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]))&(res_nand);
	assign a5  = ((~opcode[3])&(opcode[2])&(~opcode[1])&(opcode[0]))&(res_xor);
	assign a6  = ((~opcode[3])&(opcode[2])&(opcode[1])&(~opcode[0]))&(res_nor);
	assign a7  = ((~opcode[3])&(opcode[2])&(opcode[1])&(opcode[0]))&(res_not);
    assign a8  = ((opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]))&(res_add_not);
	assign a9  = ((opcode[3])&(~opcode[2])&(~opcode[1])&(opcode[0]))&(res_sub_not);
	assign a10 = ((opcode[3])&(~opcode[2])&(opcode[1])&(~opcode[0]))&(res_and_not);
	assign a11 = ((opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]))&(res_or_not);
    assign a12 = ((opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]))&(res_nand_not);
	assign a13 = ((opcode[3])&(opcode[2])&(~opcode[1])&(opcode[0]))&(res_xor_not);
	assign a14 = ((opcode[3])&(opcode[2])&(opcode[1])&(~opcode[0]))&(res_nor_not);
	assign a15 = ((opcode[3])&(opcode[2])&(opcode[1])&(opcode[0]))&(res_not_not);

    assign out = a0|a1|a2|a3|a4|a5|a6|a7|a8|a9|a10|a11|a11|a12|a13|a14|a15;

endmodule //1bit16x1Muxfor ALU

module cmux1b2to1(
    input [3:0] opcode,
    input carry_add,carry_sub,carry_add_not,carry_sub_not,
    output carry
);
    wire p,q,r,t;

	assign p = ((~opcode[3])&(~opcode[0]))&carry_add;
	assign q = ((~opcode[3])&opcode[0])&carry_sub;
	assign r = (opcode[3]&(~opcode[0]))&carry_add_not;
	assign t = (opcode[3]&opcode[0])&carry_sub_not;

	assign carry = p|q|r|t;
endmodule //1bit2x1MuxforCarry

module alu (
    input [7:0] bin1, bin2,
    input [3:0] opcode,
    output [7:0] out,
    output carry
);

    //Assigning Wires for 16 operations
    wire [7:0] res_add,res_sub,res_and,res_or,res_nand,res_xor,res_nor,res_not,res_add_not,res_sub_not,res_and_not,res_or_not,res_nand_not,res_xor_not,res_nor_not,res_not_not;
    wire carry_add,carry_sub,carry_add_not,carry_sub_not;

    //Arithmetic Operations with A And B
    assign {carry_add,res_add} = bin1 + bin2;
    assign {carry_sub,res_sub} = bin1 - bin2;

    //Arithmetic OPs with A and 2's comp B
    assign {carry_add_not,res_add_not} = bin1 + (8'b00000001 + (~bin2));
    assign {carry_sub_not,res_sub_not} = bin1 - (8'b00000001 + (~bin2));

    //Logical Operations with A and B
    assign res_and = (bin1 & bin2);
    assign res_or = (bin1 + bin2);
    assign res_nand = (~(bin1 & bin2));
    assign res_xor = (bin1 ^ bin2);
    assign res_nor = (~(bin1 + bin2));
    
    //Logical OPs with A and 2's comp B
    assign res_and_not = (bin1 & (8'b00000001 + (~bin2)));
    assign res_or_not = (bin1 + (8'b00000001 + (~bin2)));
    assign res_nand_not = (~(bin1 & (8'b00000001 + (~bin2))));
    assign res_xor_not = (bin1 ^ (8'b00000001 + (~bin2)));
    assign res_nor_not = (~(bin1 + (8'b00000001 + (~bin2))));
    
    //Unary not with A
    assign res_not = (~(bin1)); 
    //Unary not on (~B)
    assign res_not_not = (~((8'b00000001 + (~bin2)))); 
    
    //Assigning Mux for Each bit of the 8bitResult
    mux1b16to1 bit0(res_add[0],res_sub[0],res_and[0],res_or[0],res_nand[0],res_xor[0],res_nor[0],res_not[0],res_add_not[0],res_sub_not[0],res_and_not[0],res_or_not[0],res_nand_not[0],res_xor_not[0],res_nor_not[0],res_not_not[0],opcode,out[0]);
    mux1b16to1 bit1(res_add[1],res_sub[1],res_and[1],res_or[1],res_nand[1],res_xor[1],res_nor[1],res_not[1],res_add_not[1],res_sub_not[1],res_and_not[1],res_or_not[1],res_nand_not[1],res_xor_not[1],res_nor_not[1],res_not_not[1],opcode,out[1]);
    mux1b16to1 bit2(res_add[2],res_sub[2],res_and[2],res_or[2],res_nand[2],res_xor[2],res_nor[2],res_not[2],res_add_not[2],res_sub_not[2],res_and_not[2],res_or_not[2],res_nand_not[2],res_xor_not[2],res_nor_not[2],res_not_not[2],opcode,out[2]);
    mux1b16to1 bit3(res_add[3],res_sub[3],res_and[3],res_or[3],res_nand[3],res_xor[3],res_nor[3],res_not[3],res_add_not[3],res_sub_not[3],res_and_not[3],res_or_not[3],res_nand_not[3],res_xor_not[3],res_nor_not[3],res_not_not[3],opcode,out[3]);
    mux1b16to1 bit4(res_add[4],res_sub[4],res_and[4],res_or[4],res_nand[4],res_xor[4],res_nor[4],res_not[4],res_add_not[4],res_sub_not[4],res_and_not[4],res_or_not[4],res_nand_not[4],res_xor_not[4],res_nor_not[4],res_not_not[4],opcode,out[4]);
    mux1b16to1 bit5(res_add[5],res_sub[5],res_and[5],res_or[5],res_nand[5],res_xor[5],res_nor[5],res_not[5],res_add_not[5],res_sub_not[5],res_and_not[5],res_or_not[5],res_nand_not[5],res_xor_not[5],res_nor_not[5],res_not_not[5],opcode,out[5]);
    mux1b16to1 bit6(res_add[6],res_sub[6],res_and[6],res_or[6],res_nand[6],res_xor[6],res_nor[6],res_not[6],res_add_not[6],res_sub_not[6],res_and_not[6],res_or_not[6],res_nand_not[6],res_xor_not[6],res_nor_not[6],res_not_not[6],opcode,out[6]);
    mux1b16to1 bit7(res_add[7],res_sub[7],res_and[7],res_or[7],res_nand[7],res_xor[7],res_nor[7],res_not[7],res_add_not[7],res_sub_not[7],res_and_not[7],res_or_not[7],res_nand_not[7],res_xor_not[7],res_nor_not[7],res_not_not[7],opcode,out[7]);
    //Initializing Mux for choosing carry among 4 possibilities
    cmux1b2to1 cmux(opcode,carry_add,carry_sub,carry_add_not,carry_sub_not,carry);

endmodule //alu


module tb_alu(
    output reg [7:0] bin1, bin2,
    output reg [3:0] opcode,
    input [7:0] out,
    input carry
);
    initial begin
		$monitor("At time %t, when opA=%b, opB=%b, opcode=%b, Result=%b, Carry(if_exists)= %b",$time,bin1,bin2,opcode,out,carry);
		// Initialize inputs
            {bin1, bin2, opcode} = 20'b00001101111100010000; // ADD
        #10 {bin1, bin2, opcode} = 20'b00001101111100010001; // SUB
        #10 {bin1, bin2, opcode} = 20'b00001101111100010010; // AND
        #10 {bin1, bin2, opcode} = 20'b00001101111100010011; // OR
        #10 {bin1, bin2, opcode} = 20'b00001101111100010100; // NAND
        #10 {bin1, bin2, opcode} = 20'b00001101111100010101; // XOR
        #10 {bin1, bin2, opcode} = 20'b00001101111100010110; // NOR
        #10 {bin1, bin2, opcode} = 20'b00001101111100010111; // NOT A
        #10 {bin1, bin2, opcode} = 20'b00001101111100011000; // ADD with NEGATED B
        #10 {bin1, bin2, opcode} = 20'b00001101111100011001; // SUB with NEGATED B
        #10 {bin1, bin2, opcode} = 20'b00001101111100011010; // AND with NEGATED B
        #10 {bin1, bin2, opcode} = 20'b00001101111100011011; // OR with NEGATED B
        #10 {bin1, bin2, opcode} = 20'b00001101111100011100; // NAND with NEGATED B
        #10 {bin1, bin2, opcode} = 20'b00001101111100011101; // XOR with NEGATED B
        #10 {bin1, bin2, opcode} = 20'b00001101111100011110; // NOR with NEGATED B
        #10 {bin1, bin2, opcode} = 20'b00001101111100011111; // NOT NEGATED B
        #10 $finish;
	end
endmodule //testbench

module wb;
    wire [7:0] bin1, bin2, out ;
    wire [3:0] opcode;
    wire carry;

    initial begin
        $dumpfile("4bit_opcode_8bit_alu.vcd");
        $dumpvars(0, wb);
    end
    alu dut(bin1,bin2,opcode,out,carry);
    tb_alu tb(bin1,bin2,opcode,out,carry);
endmodule
