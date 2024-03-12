`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:22 11/23/2018 
// Design Name: 
// Module Name:    npc 
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
module npc(
    input [31:0] PC4,
	 input [31:0] PC4D,
    input [25:0] I26,
	 input [31:0] MFRSD,
	 input Zero,
	 input Branch,
	 input if_j,//j»òjal
	 input[1:0] PC_sel,
    output reg[31:0] next_pc
    );
	reg[31:0] NPC;
	always@(*) begin
		if(Branch&&Zero) begin
			NPC<=PC4D+{{14{I26[15]}},I26[15:0],2'b00};
		end
		else if(if_j) begin
			NPC<={PC4D[31:28],I26[25:0],2'b00};
		end
		else begin
			NPC<=PC4D+4;
		end
		case(PC_sel) 
			2'b00: next_pc<=PC4;
			2'b01: next_pc<=MFRSD;
			2'b10: next_pc<=NPC;
			default: next_pc<=0;
		endcase
	end

endmodule
