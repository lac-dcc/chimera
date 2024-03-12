`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:33 11/21/2018 
// Design Name: 
// Module Name:    new_controller 
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
module new_controller(
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
	always@(*) 
	begin
		case (op)
		6'b000000://R 
		begin
			case(func)
				6'b100001: begin  //addu
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
				6'b100011: begin  //subu
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
				6'b001000: begin  //jr
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
					ALUCtrl<=3'b010;	
					Branch2<=0;	
					Branch3<=0;
					ALUCtrl<=3'b111;	
				end
			endcase
		end
		6'b100011://lw
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
		
		6'b101011://sw
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

      6'b000100://beq
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
 
      6'b001111://lui
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

      6'b001101://ori
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

		6'b000011://jal
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
