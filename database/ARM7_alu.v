//ALU block

`define AND 4'd0
`define EOR 4'd1
`define SUB 4'd2
`define RSB 4'd3
`define ADD 4'd4
`define ADC 4'd5
`define SBC 4'd6
`define RSC 4'd7
`define TST 4'd8
`define TEQ 4'd9
`define CMP 4'd10
`define CMN 4'd11
`define ORR 4'd12
`define MOV 4'd13
`define BIC 4'd14
`define MVN 4'd15
//reference: http://www.cc.gatech.edu/~hyesoon/spr10/lec_arm2.pdf , page 6
module alu(opcode, operand_1, operand_2, result, nzcv_old, nzcv, c_from_shifter, isWriteback);

parameter N = 32; 

input[3:0] opcode;	//opcode of operation
input wire [N-1:0] operand_1; //operands:
input wire [N-1:0] operand_2;
input wire[3:0] nzcv_old; //old nzcv
input wire c_from_shifter;//this is carry flag from shifter. so that we can update carry flag for logical instructions

output reg isWriteback; //specifies if result is to be written back
output reg[N-1:0] result; //output
output reg [3:0] nzcv; 	//update nzcv register
/*condition code register.  i.e, both read and write,  nzcv[3] = n
nzcv[0] = v
nzcv[1] = c
nzcv[2] = z
nzcv[3] = n  */

reg cin;
reg cout;
reg[N-1:0] neg;

always @(*) begin
	nzcv= nzcv_old;

	case(opcode)
		//logical and
		`AND: begin
			result = operand_1 & operand_2;
			nzcv[1] = c_from_shifter;
			isWriteback = 1;
		end
		//xor
		`EOR: begin
			result = operand_1 ^ operand_2;
			isWriteback = 1;
			nzcv[1] = c_from_shifter;
		end
		//result = op1-op2
		`SUB: begin
			neg = -operand_2;
			{cin, result[N-2:0]} = operand_1[N-2:0]+neg[N-2:0]; 
			{cout, result[N-1]} = cin+ operand_1[N-1]+neg[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag
			isWriteback = 1;
		end
		
		//result = op2-op1
		`RSB: begin
			neg = -operand_1;
			{cin, result[N-2:0]} = operand_2[N-2:0]+neg[N-2:0]; 
			{cout, result[N-1]} = cin+ operand_2[N-1]+neg[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag
			isWriteback = 1;
		end
		
		//result = op1+op2
		`ADD: begin
			{cin, result[N-2:0]} = operand_1[N-2:0]+operand_2[N-2:0]; 
			{cout, result[N-1]} = cin+ operand_1[N-1]+operand_2[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag
			isWriteback = 1;
		end
		
		//result = op1+op2+c
		`ADC: begin
			{cin, result[N-2:0]} = operand_1[N-2:0]+operand_2[N-2:0]+nzcv_old[1]; 
			{cout, result[N-1]} = cin+ operand_1[N-1]+operand_2[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag
			isWriteback = 1;
		end
		
		//result = op1 – Op2 + C-1
		`SBC: begin
			neg = -operand_2;
			{cin, result[N-2:0]} = operand_1[N-2:0]+neg[N-2:0]+nzcv_old[1]-1; 
			{cout, result[N-1]} = cin+ operand_1[N-1]+neg[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag	
			isWriteback = 1;
		end
		
		//result = op2-op1+c-1
		`RSC: begin
			neg = -operand_1;
			{cin, result[N-2:0]} = operand_2[N-2:0]+neg[N-2:0]+nzcv_old[1]-1; 
			{cout, result[N-1]} = cin+ operand_2[N-1]+neg[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag
			isWriteback = 1;
		end
		
		//same as AND  but you don't write back
		`TST: begin
			result = operand_1 & operand_2;
			isWriteback = 0;
			nzcv[1] = c_from_shifter;
		end
		
		//same as EOR but you don't write back
		`TEQ: begin
			result = operand_1 ^ operand_2;
			isWriteback = 0;
			nzcv[1] = c_from_shifter;
		end
		
		//same as SUB but you don't write back
		`CMP: begin
			neg = -operand_2;
			{cin, result[N-2:0]} = operand_1[N-2:0]+neg[N-2:0]; 
			{cout, result[N-1]} = cin+ operand_1[N-1]+neg[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag
			isWriteback = 0;
		end
		
		//same as ADD but you don't write back
		`CMN: begin
			{cin, result[N-2:0]} = operand_1[N-2:0]+operand_2[N-2:0]; 
			{cout, result[N-1]} = cin+ operand_1[N-1]+operand_2[N-1];
			nzcv[1]  = cout;	//carry flag
			nzcv[0] = cin^cout; //overflow flag
			isWriteback = 0;
		end
		
		//bitwise or
		`ORR: begin
			result = operand_1 | operand_2;
			isWriteback = 1;
			nzcv[1] = c_from_shifter;
		end
		
		//move. op1 ignored
		`MOV: begin
			result = operand_2;
			isWriteback = 1;
			nzcv[1] =c_from_shifter;
		end
		
		//res = op1 & ~op2
		`BIC: begin
			result = operand_1 & (~operand_2);
			isWriteback = 1;
			nzcv[1] =c_from_shifter;
		end
		
		//move negated op2
		`MVN: begin
			result = ~operand_2;
			isWriteback = 1;
			nzcv[1] = c_from_shifter;
		end
		
	endcase

	nzcv[3] = result[N-1]; 	//n flag	
	nzcv[2] = (result == 0); // z flag
			
end

endmodule