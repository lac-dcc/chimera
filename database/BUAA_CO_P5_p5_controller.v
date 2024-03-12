`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:53:56 11/24/2018 
// Design Name: 
// Module Name:    controller 
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
module controller(
	 input [5:0] op,
	 input [5:0] func,
    output reg[2:0] ALUCtrl,
    output reg[1:0] RegDst,
    output reg ALUASrc,
	 output reg ALUBSrc,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] MemtoReg,
    output reg [1:0]ExtOp,
    output reg Branch,
    output reg if_j,
	 output reg [1:0]PCsel
    );
	 initial  begin
		PCsel <= 2'b00;
	 end
	always@(*) 
	begin
		case (op)
		6'b000000://R 
		begin
			case(func)
				6'b100001: begin  //addu
					RegDst<=2'b01;
					ALUASrc<=0;
					ALUBSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg<=2'b00;
					ExtOp<=2'b00;
					Branch<=0;
					ALUCtrl<=3'b010;
					if_j<=0;
					PCsel<=2'b00;
				end
				6'b100011: begin  //subu
					RegDst<=2'b01;
					ALUASrc<=0;
					ALUBSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg<=2'b00;
					ExtOp<=2'b00;
					Branch<=0;
					ALUCtrl<=3'b011;
					if_j<=0;
					PCsel<=2'b00;
				end
				6'b001000: begin  //jr
					RegDst<=2'b01;
					ALUASrc<=0;
					ALUBSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg<=2'b00;
					ExtOp<=2'b00;
					Branch<=0;
					ALUCtrl<=3'b111;
					if_j<=0;
					PCsel<=2'b01;
				end
				6'b001001: begin  //jalr
					RegDst<=2'b01;
					ALUASrc<=0;
					ALUBSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg<=2'b10;
					ExtOp<=2'b00;
					Branch<=0;
					ALUCtrl<=3'b111;
					if_j<=0;
					PCsel<=2'b01;
				end
				6'b000000: begin  //sll nop
					RegDst<=2'b01;
					ALUASrc<=1;
					ALUBSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg<=2'b00;
					ExtOp<=2'b00;
					Branch<=0;
					ALUCtrl<=3'b100;
					if_j<=0;
					PCsel<=2'b00;
				end
				default:  begin
					RegDst<=2'b01;
					ALUASrc<=0;
					ALUBSrc<=0;
					RegWrite<=1;
					MemRead<=0;
					MemWrite<=0;
					MemtoReg<=2'b00;
					ExtOp<=2'b00;
					Branch<=0;
					ALUCtrl<=3'b010;
					if_j<=0;
					PCsel<=2'b00;				
					end
			endcase
		end
		6'b100011://lw
		begin
			RegDst<=2'b00;
			ALUASrc<=0;
			ALUBSrc<=1;
			RegWrite<=1;
			MemRead<=1;
			MemWrite<=0;
			MemtoReg<=2'b01;
			ExtOp<=2'b00;
			Branch<=0;
			ALUCtrl<=3'b010;
			if_j<=0;
			PCsel<=2'b00;
		end
		
		6'b101011://sw
		begin
			RegDst<=2'b00;
			ALUASrc<=0;
			ALUBSrc<=1;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=1;
			MemtoReg<=2'b00;
			ExtOp<=2'b00;
			Branch<=0;
			ALUCtrl<=3'b010;
			if_j<=0;
			PCsel<=2'b00;
		end

      6'b000100://beq
		begin
			RegDst<=2'b00;
			ALUASrc<=0;
			ALUBSrc<=0;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg<=2'b00;
			ExtOp<=2'b00;
			Branch<=1;
			ALUCtrl<=3'b011;
			if_j<=0;
			PCsel<=2'b10;
		end
 
      6'b001111://lui
		begin
			RegDst<=2'b00;
			ALUASrc<=0;
			ALUBSrc<=1;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg<=2'b00;
			ExtOp<=2'b10;
			Branch<=0;
			ALUCtrl<=3'b010;
			if_j<=0;
			PCsel<=2'b00;
		end

      6'b001101://ori
		begin
			RegDst<=2'b00;
			ALUASrc<=0;
			ALUBSrc<=1;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg<=2'b00;
			ExtOp<=2'b01;
			Branch<=0;
			ALUCtrl<=3'b001;
			if_j<=0;
			PCsel<=2'b00;
		end

		6'b000011://jal
		begin
			RegDst<=2'b10;
			ALUASrc<=0;
			ALUBSrc<=0;
			RegWrite<=1;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg<=2'b10;
			ExtOp<=2'b00;
			Branch<=0;
			ALUCtrl<=3'b000;
			if_j<=1;
			PCsel<=2'b10;	
		end
		
		6'b000010://j
		begin
			RegDst<=2'b00;
			ALUASrc<=0;
			ALUBSrc<=0;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg<=2'b00;
			ExtOp<=2'b00;
			Branch<=0;
			ALUCtrl<=3'b000;
			if_j<=1;
			PCsel<=2'b10;	
		end
		
		default: 
		begin
			RegDst<=2'b00;
			ALUASrc<=0;
			ALUBSrc<=0;
			RegWrite<=0;
			MemRead<=0;
			MemWrite<=0;
			MemtoReg<=2'b00;
			ExtOp<=2'b00;
			Branch<=0;
			ALUCtrl<=3'b000;
			if_j<=0;
			PCsel<=2'b00;	
		end
		endcase
	end	

endmodule
