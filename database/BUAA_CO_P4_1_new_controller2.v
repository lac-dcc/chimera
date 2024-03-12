`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:19 11/21/2018 
// Design Name: 
// Module Name:    new_controller2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module new_controller2(
	 input [5:0] op,
	 input [5:0] func,
    output [2:0] ALUCtrl,
    output [1:0] RegDst,
    output  ALUSrc,
    output  RegWrite,
    output  MemRead,
    output  MemWrite,
    output  [1:0] MemtoReg,
    output  ExtOp,
    output  Branch1,
    output  Branch2,
	 output  Branch3
    );
	wire r,lw,sw,beq,lui,ori,jal,jr,addu,subu;
	assign r = !op[0]&&!op[1]&&!op[2]&&!op[3]&&!op[4]&&!op[5];
	assign lw = op[0]&&op[1]&&!op[2]&&!op[3]&&!op[4]&&op[5];
	assign sw = op[0]&&op[1]&&!op[2]&&op[3]&&!op[4]&&op[5];
	assign beq = !op[0]&&!op[1]&&op[2]&&!op[3]&&!op[4]&&!op[5];
	assign lui = op[0]&&op[1]&&op[2]&&op[3]&&!op[4]&&!op[5];
	assign ori = op[0]&&!op[1]&&op[2]&&op[3]&&!op[4]&&!op[5];
	assign jal = op[0]&&op[1]&&!op[2]&&!op[3]&&!op[4]&&!op[5];
	assign addu = !op[0]&&!op[1]&&!op[2]&&!op[3]&&!op[4]&&!op[5]&&func[5]&&!func[4]&&!func[3]&&!func[2]&&!func[1]&&func[0];
	assign subu = !op[0]&&!op[1]&&!op[2]&&!op[3]&&!op[4]&&!op[5]&&func[5]&&!func[4]&&!func[3]&&!func[2]&&func[1]&&func[0];
	assign jr = !op[0]&&!op[1]&&!op[2]&&!op[3]&&!op[4]&&!op[5]&&!func[5]&&!func[4]&&func[3]&&!func[2]&&!func[1]&&!func[0];
	
	assign RegDst[1] = jal;
	assign RegDst[0] = r;
	assign ALUSrc = lw||sw||ori;
	assign RegWrite = r||lui||ori||lw||jal;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign MemtoReg[1] = lw||jal;
	assign MemtoReg[0] = lui||jal;
	assign ExtOp = ori;
	assign Branch1 = beq;
	assign Branch2 = jal;
	assign Branch3 = jr;
	assign ALUCtrl[2] = jal||lui;
	assign ALUCtrl[1] = lw||sw||beq||lui||addu||subu||jr||jal;
	assign ALUCtrl[0] = beq||lui||ori||subu||jal;

endmodule
