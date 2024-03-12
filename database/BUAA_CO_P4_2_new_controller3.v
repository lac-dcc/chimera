`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:33:37 11/21/2018 
// Design Name: 
// Module Name:    new_controller3 
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
module new_controller3(
	 input [5:0] op,
	 input [5:0] func,
    output reg[2:0] ALUCtrl,
    output reg[1:0] RegDst,
    output reg ALUSrc,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemtoReg,
    output reg ExtOp,
    output reg Branch1,
    output reg Branch2,
	 output reg Branch3
    );
	`define R 6'b000000
	`define lw 6'b100011
	`define sw 6'b101011
	`define lui 6'b001111
	`define ori 6'b001101
	`define beq 6'b000100
	`define jal 6'b000011
	`define addu 6'b100001
	`define subu 6'b100011
	`define jr 6'b001000
	
	always@(*) 
	begin
		case (op)
		`R:
		begin
			case(func)
				`addu: begin  
					RegDst[1]<=0;
					RegDst[0]<=1;
					ALUSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg[1]<=0;
					MemtoReg[0]<=0;
					ExtOp<=0;
					Branch1<=0;
					ALUCtrl<=3'b010;
					Branch2<=0;	
					Branch3<=0;	
				end
				`subu: begin  
					RegDst[1]<=0;
					RegDst[0]<=1;
					ALUSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg[1]<=0;
					MemtoReg[0]<=0;
					ExtOp<=0;
					Branch1<=0;
					ALUCtrl<=3'b011;	
					Branch2<=0;	
					Branch3<=0;	
				end
				`jr: begin  
					RegDst[1]<=0;
					RegDst[0]<=1;
					ALUSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg[1]<=0;
					MemtoReg[0]<=0;
					ExtOp<=0;
					Branch1<=0;
					ALUCtrl<=3'b010;	
					Branch2<=0;	
					Branch3<=1;	
				end
				default:  begin
					RegDst[1]<=0;
					RegDst[0]<=1;
					ALUSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg[1]<=0;
					MemtoReg[0]<=0;
					ExtOp<=0;
					Branch1<=0;
					Branch2<=0;	
					Branch3<=0;
					ALUCtrl<=3'b111;	
				end
			endcase
		end
		`lw:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=1;
			RegWrite<=1;
			MemRead<=1;
			MemWrite<=0;
			MemtoReg[1]<=1;
			MemtoReg[0]<=0;
			ExtOp<=0;
			Branch1<=0;
			ALUCtrl<=3'b010;	
			Branch2<=0;		
			Branch3<=0;	
		end
		
		`sw:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=1;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=1;
			MemtoReg[1]<=0;
			MemtoReg[0]<=0;
			ExtOp<=0;
			Branch1<=0;
			ALUCtrl<=3'b010;	
			Branch2<=0;	
			Branch3<=0;	
		end

      `beq:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=0;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=0;
			MemtoReg[0]<=0;
			ExtOp<=0;
			Branch1<=1;
			ALUCtrl<=3'b011;	
			Branch2<=0;	
			Branch3<=0;	
		end
 
     `lui:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=0;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=0;
			MemtoReg[0]<=1;
			ExtOp<=0;
			Branch1<=0;
			ALUCtrl<=3'b111;
			Branch2<=0;	
			Branch3<=0;	
		end

      `ori:
		begin
			RegDst[1]<=0;
			RegDst[0]<=0;
			ALUSrc<=1;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=0;
			MemtoReg[0]<=0;
			ExtOp<=1;
			Branch1<=0;
			ALUCtrl<=3'b001;	
			Branch2<=0;	
			Branch3<=0;	
		end

		`jal:
		begin
			RegDst[1]<=1;
			RegDst[0]<=0;
			ALUSrc<=0;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg[1]<=1;
			MemtoReg[0]<=1;
			ExtOp<=0;
			Branch1<=0;
			ALUCtrl<=3'b111;
			Branch2<=1;	
			Branch3<=0;	
		end
		endcase
	end	

endmodule

