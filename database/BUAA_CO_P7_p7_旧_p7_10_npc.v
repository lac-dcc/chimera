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
	 input [31:0] EPC,
	 input Zero,
	 input more,
	 input less,
	 input if_beq,
	 input if_bne,
	 input if_bgtz,
	 input if_blez,
	 input if_bgez,
	 input if_bltz,
	 input if_j,//j»òjal
	 input[1:0] PC_sel,
	 input Interrupt,
    output reg[31:0] next_pc
    );
	reg[31:0] NPC;
	always@(*) begin
		if((if_beq&&Zero)||(if_bne&&!Zero)||(if_bgtz&&more)||(if_blez&&!more)||(if_bgez&&!less)||(if_bltz&&less)) begin
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
			2'b11: next_pc<=EPC;
		endcase
		if(Interrupt) begin
			next_pc<=32'h00004180;
		end
	end

endmodule
