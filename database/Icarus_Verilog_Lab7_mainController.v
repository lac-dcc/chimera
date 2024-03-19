`ifndef MC
`define MC
	module mainController(
		input [5:0] opcode ,
		input [3:0] state,
		output PCWrite ,
		output PCWriteCond,
		output IorD,
		output MemRead,
		output MemWrite,
		output IRWrite,
		output MemToReg,
		output PCSource1,
		output PCSource0,
		output ALUOp1,
		output ALUOp0,
		output ALUSrcB1,
		output ALUSrcB0,
		output ALUSrcA,
		output RegWrite,
		output RegDst,
		output [3:0] NS);
		
		wire [16:0] ands;
		
		assign ands[0] = ((~state[0]) & (~state[1]) & (~state[2]) & (~state[3]) );
		assign ands[1] = ((state[0]) & (~state[1]) & (~state[2]) & (~state[3]) );
		assign ands[2] = ((~state[0]) & (state[1]) & (~state[2]) & (~state[3]) );
		assign ands[3] = ((state[0]) & (state[1]) & (~state[2]) & (~state[3]) );
		assign ands[4] = ((~state[0]) & (~state[1]) & (state[2]) & (~state[3]) );
		assign ands[5] = ((state[0]) & (~state[1]) & (state[2]) & (~state[3]) );
		assign ands[6] = ((~state[0]) & (state[1]) & (state[2]) & (~state[3]) );
		assign ands[7] = ((state[0]) & (state[1]) & (state[2]) & (~state[3]) );
		assign ands[8] = ((~state[0]) & (~state[1]) & (~state[2]) & (state[3]) );
		assign ands[9] = ((state[0]) & (~state[1]) & (~state[2]) & (state[3]) );
		assign ands[10] = ((state[0]) & (~state[1]) & (~state[2]) & (~state[3]) & (~opcode[0]) & (opcode[1]) & (~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]) );
		assign ands[11] = ((state[0]) & (~state[1]) & (~state[2]) & (~state[3]) & (~opcode[0]) & (~opcode[1]) & (opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]) );
		assign ands[12] = ((state[0]) & (~state[1]) & (~state[2]) & (~state[3]) & (~opcode[0]) & (~opcode[1]) & (~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (~opcode[5]) );
		assign ands[13] = ((~state[0]) & (state[1]) & (~state[2]) & (~state[3]) & (opcode[0]) & (opcode[1]) & (~opcode[2]) & (opcode[3]) & (~opcode[4]) & (opcode[5]) );
		assign ands[14] = ((state[0]) & (~state[1]) & (~state[2]) & (~state[3]) & (opcode[0]) & (opcode[1]) & (~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (opcode[5]) );
		assign ands[15] = ((state[0]) & (~state[1]) & (~state[2]) & (~state[3]) & (opcode[0]) & (opcode[1]) & (~opcode[2]) & (opcode[3]) & (~opcode[4]) & (opcode[5]) );
		assign ands[16] = ((~state[0]) & (state[1]) & (~state[2]) & (~state[3]) & (opcode[0]) & (opcode[1]) & (~opcode[2]) & (~opcode[3]) & (~opcode[4]) & (opcode[5]) );
		
		
		assign PCWrite = ands[0] | ands[9];
		assign PCWriteCond = ands[8];
		assign IorD = ands[3] | ands[5];
		assign MemRead = ands[0] | ands[3];
		assign MemWrite = ands[5];
		assign IRWrite = ands[0];
		assign MemToReg = ands[4];
		assign PCSource1 = ands[9] ;
		assign PCSource0 = ands[8];
		assign ALUOp1 = ands[6];
		assign ALUOp0 = ands[8];
		assign ALUSrcB1 = ands[1] | ands[2];
		assign ALUSrcB0 = ands[0] | ands[1]; 
		assign ALUSrcA = ands[2] | ands[6] | ands[8] ;
		assign RegWrite = ands[4] | ands[7] ;
		assign RegDst = ands[7] ;
		
		assign NS[3] = ands[10] | ands[11] ;
		assign NS[2] = ands[12] | ands[13] | ands[3] | ands[6] ;
		assign NS[1] = ands[12] | ands[14] | ands[15] | ands[16] | ands[6] ;
		assign NS[0] = ands[16] | ands[13] | ands[10] | ands[6] | ands[0] ;
		
		
	endmodule
`endif