// This program was cloned from: https://github.com/chsasank/ARM7
// License: MIT License

module bshift_test;
	parameter n=32;
	reg instr_bit_25;
	wire [11:0] imm_value={5'd0,3'd6,4'd0};
	//reg [n-1:0] in;
	//reg [n-1:0] out;
	//reg [7:0] shiftby; // no. bits to be shifted
	//reg [n-1:0] junk;
	reg [n-1:0] Rm;
	reg [n-1:0] Rs;
	wire cin=1;
	wire c_to_alu;
	wire [n-1:0] operand2;
	
bshift #(32) bshift1(instr_bit_25,imm_value, Rm, Rs, operand2, cin, c_to_alu);

initial begin
	instr_bit_25 = 1;
	//imm_value =5 ;
	Rm= {3'd3,29'd1};
	Rs = 32'd100;
	//cin = 1;
	#2 $display("%b,%b",operand2, c_to_alu);
	#5;
	end
	endmodule
	