`include "mainController.v"
module tb_mc();

	reg [5:0] opcode;
	reg [3:0] state;
	wire PCWrite ;
	wire PCWriteCond;
	wire IorD;
	wire MemRead;
	wire MemWrite;
	wire IRWrite;
	wire MemToReg;
	wire PCSource1;
	wire PCSource0;
	wire ALUOp1;
	wire ALUOp0;
	wire ALUSrcB1;
	wire ALUSrcB0;
	wire ALUSrcA;
	wire RegWrite;
	wire RegDst;
	wire [3:0] NS;

	mainController mc(opcode, state, PCWrite , PCWriteCond, IorD, MemRead, MemWrite, IRWrite, MemToReg, PCSource1, PCSource0, ALUOp1, ALUOp0, ALUSrcB1, ALUSrcB0, ALUSrcA, RegWrite, RegDst, NS );
	
	initial 
		$monitor("opcode: %b ",opcode,"state: %b ",state," PCWrite: %b ", PCWrite ,"PCWriteCond : %b ", PCWriteCond,"IorD: %b ", IorD," MemRead: %b ", MemRead," MemWrite: %b ", MemWrite," IRWrite: %b ", IRWrite," MemToReg: %b ", MemToReg," PCSource1: %b ", PCSource1," PCSource0: %b ", PCSource0," ALUOp1: %b ", ALUOp1," ALUOp0: %b", ALUOp0, " ALUSrcB1: %b ", ALUSrcB1," ALUSrcB0 : %b ", ALUSrcB0," ALUSrcA: %b ", ALUSrcA," RegWrite: %b ", RegWrite," RegDst: %b ", RegDst," NS: %b", NS );
	
	initial begin
		state = 4'b0000;
		#5 state = 4'b0001;
		#10 opcode = 6'h23;
		#15 state = 4'b0010;
	end
endmodule