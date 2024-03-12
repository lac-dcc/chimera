`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:55:59 11/24/2018 
// Design Name: 
// Module Name:    hazardUnit 
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
module hazardUnit(
	 input [31:0] IR_D,
	 input [31:0] IR_E,
	 input [31:0] IR_M,
	 input [31:0] IR_W,
	 output IR_D_en,
	 output IR_E_clr,
	 output PC_en,
	 output [2:0]ForwardRSD,	
	 output [2:0]ForwardRTD,
	 output [2:0]ForwardRSE,	
	 output [2:0]ForwardRTE,	
	 output [2:0]ForwardRTM
    );

	`define op 31:26
	`define rs 25:21
	`define rt 20:16
	`define rd 15:11
	`define shamt 10:6
	`define func 5:0
	`define imm16 15:0
	
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
	`define jalr 6'b001001
	
	`define cal_r_D (IR_D[`op]==`R&&IR_D[`func]!=`jalr&&IR_D[`func]!=`jr&&IR_D!=0)
	`define cal_r_E (IR_E[`op]==`R&&IR_E[`func]!=`jalr&&IR_E[`func]!=`jr&&IR_E!=0)
	`define cal_r_M (IR_M[`op]==`R&&IR_M[`func]!=`jalr&&IR_M[`func]!=`jr&&IR_M!=0)
	`define cal_r_W (IR_W[`op]==`R&&IR_W[`func]!=`jalr&&IR_W[`func]!=`jr&&IR_W!=0)
	
	`define cal_i_D (IR_D[`op]==`lui||IR_D[`op]==`ori)
	`define cal_i_E (IR_E[`op]==`lui||IR_E[`op]==`ori)
	`define cal_i_M (IR_M[`op]==`lui||IR_M[`op]==`ori)
	`define cal_i_W (IR_W[`op]==`lui||IR_W[`op]==`ori)
	
	`define load_D (IR_D[`op]==`lw)
	`define load_E (IR_E[`op]==`lw)
	`define load_M (IR_M[`op]==`lw)
	`define load_W (IR_W[`op]==`lw)
	
	`define store_D (IR_D[`op]==`sw)
	`define store_E (IR_E[`op]==`sw)
	`define store_M (IR_M[`op]==`sw)
	`define store_W (IR_W[`op]==`sw)
	
	`define beq_D (IR_D[`op]==`beq)
	`define beq_E (IR_E[`op]==`beq)
	`define beq_M (IR_M[`op]==`beq)
	`define beq_W (IR_W[`op]==`beq)
	
	reg stall=0;
	wire stall_b,stall_cal_r,stall_cal_i,stall_load,stall_store,stall_jr,stall_jalr;
	
	assign stall_b = (`beq_D & `cal_r_E &(IR_D[`rs]==IR_E[`rd]||IR_D[`rt]==IR_E[`rd]))||
						  (`beq_D & `cal_i_E &(IR_D[`rs]==IR_E[`rt]||IR_D[`rt]==IR_E[`rt]))||
						  (`beq_D & `load_E &(IR_D[`rs]==IR_E[`rt]||IR_D[`rt]==IR_E[`rt]))||
						  (`beq_D & `load_M &(IR_D[`rs]==IR_M[`rt]||IR_D[`rt]==IR_M[`rt]));
	assign stall_cal_r = (`cal_r_D) && (`load_E) && (IR_D[`rs]==IR_E[`rt]||IR_D[`rt]==IR_E[`rt]);
	assign stall_cal_i = (`cal_i_D) & (`load_E) & (IR_D[`rs]==IR_E[`rt]);
	assign stall_load = (`load_D) & (`load_E) & (IR_D[`rs]==IR_E[`rt]);
	assign stall_store = (`store_D) & (`load_E) & (IR_D[`rs]==IR_E[`rt]);
	assign stall_jr = ((IR_D[`op]==`R&IR_D[`func]==`jr) & (`cal_r_E) & (IR_D[`rs]==IR_E[`rd]))||
							((IR_D[`op]==`R&IR_D[`func]==`jr) & (`cal_i_E) & (IR_D[`rs]==IR_E[`rt]))||
							((IR_D[`op]==`R&IR_D[`func]==`jr) & (`load_E) & (IR_D[`rs]==IR_E[`rt]))||
							((IR_D[`op]==`R&IR_D[`func]==`jr) & (`load_M) & (IR_D[`rs]==IR_M[`rt]));
	assign stall_jalr =  ((IR_D[`op]==`R&IR_D[`func]==`jalr) & (`cal_r_E) & (IR_D[`rs]==IR_E[`rd]))||
								((IR_D[`op]==`R&IR_D[`func]==`jalr) & (`cal_i_E) & (IR_D[`rs]==IR_E[`rt]))||
								((IR_D[`op]==`R&IR_D[`func]==`jalr) & (`load_E) & (IR_D[`rs]==IR_E[`rt]))||
								((IR_D[`op]==`R&IR_D[`func]==`jalr) & (`load_M) & (IR_D[`rs]==IR_M[`rt]));
			
	always@(*) begin
		stall <= stall_b||stall_cal_r||stall_cal_i||stall_load||stall_store||stall_jr||stall_jalr;
	end
	
	assign IR_D_en = !stall;
	assign IR_E_clr = stall;
	assign PC_en = !stall;
	
	`define RF_RD1 (`cal_r_D||`cal_i_D||`load_D||`store_D||`beq_D||(IR_D[`op]==`R&(IR_D[`func]==`jr||IR_D[`func]==`jalr)))
	`define RF_RD2 (`cal_r_D||`store_D||`beq_D)
	
	assign ForwardRSD = (`RF_RD1 & (IR_E[`op]==`jal) & IR_D[`rs]==31 & IR_D[`rs]!=0) ? 3 :
							  (`RF_RD1 & (IR_E[`op]==`R&&IR_E[`func]==`jalr)	& IR_D[`rs]==IR_E[`rd] & IR_D[`rs]!=0) ? 3 :
							  (`RF_RD1 &  `cal_r_M & IR_D[`rs]==IR_M[`rd] & IR_D[`rs]!=0) ? 1 :
							  (`RF_RD1 &  `cal_i_M & IR_D[`rs]==IR_M[`rt] & IR_D[`rs]!=0) ? 1 :
							  (`RF_RD1 & (IR_M[`op]==`jal)	& IR_D[`rs]==31 & IR_D[`rs]!=0) ? 4 :
							  (`RF_RD1 & (IR_M[`op]==`R&&IR_M[`func]==`jalr)	& IR_D[`rs]==IR_M[`rd] & IR_D[`rs]!=0) ? 4 :
							  (`RF_RD1 &  `cal_r_W & IR_D[`rs]==IR_W[`rd] & IR_D[`rs]!=0) ? 2 :
							  (`RF_RD1 &  `cal_i_W & IR_D[`rs]==IR_W[`rt] & IR_D[`rs]!=0) ? 2 :
							  (`RF_RD1 &  `load_W & IR_D[`rs]==IR_W[`rt] & IR_D[`rs]!=0) ? 2 :
							  (`RF_RD1 & (IR_W[`op]==`jal)	& IR_D[`rs]==31 & IR_D[`rs]!=0) ? 5 :
							  (`RF_RD1 & (IR_W[`op]==`R&&IR_W[`func]==`jalr) & IR_D[`rs]==IR_W[`rd] & IR_D[`rs]!=0) ? 5 : 0 ;
	assign ForwardRTD = (`RF_RD2 & (IR_E[`op]==`jal)	& IR_D[`rt]==31 & IR_D[`rt]!=0) ? 3 :
							  (`RF_RD2 & (IR_E[`op]==`R&&IR_E[`func]==`jalr)	& IR_D[`rt]==IR_E[`rd] & IR_D[`rt]!=0) ? 3 :
							  (`RF_RD2 &  `cal_r_M & IR_D[`rt]==IR_M[`rd] & IR_D[`rt]!=0) ? 1 :
							  (`RF_RD2 &  `cal_i_M & IR_D[`rt]==IR_M[`rt] & IR_D[`rt]!=0) ? 1 :
							  (`RF_RD2 & (IR_M[`op]==`jal)	& IR_D[`rt]==31 & IR_D[`rt]!=0) ? 4 :
							  (`RF_RD2 & (IR_M[`op]==`R&&IR_M[`func]==`jalr)	& IR_D[`rt]==IR_M[`rd] & IR_D[`rt]!=0) ? 4 :
							  (`RF_RD2 &  `cal_r_W & IR_D[`rt]==IR_W[`rd] & IR_D[`rt]!=0) ? 2 :
							  (`RF_RD2 &  `cal_i_W & IR_D[`rt]==IR_W[`rt] & IR_D[`rt]!=0) ? 2 :
							  (`RF_RD2 &  `load_W & IR_D[`rt]==IR_W[`rt] & IR_D[`rt]!=0) ? 2 :
							  (`RF_RD2 & (IR_W[`op]==`jal)	& IR_D[`rt]==31 & IR_D[`rt]!=0) ? 5 :
							  (`RF_RD2 & (IR_W[`op]==`R&&IR_W[`func]==`jalr)	& IR_D[`rt]==IR_W[`rd] & IR_D[`rt]!=0) ? 5 : 0; 
	assign ForwardRSE	= ((`cal_r_E||`cal_i_E||`load_E||`store_E) & `cal_r_M & (IR_E[`rs]==IR_M[`rd]) & IR_E[`rs]!=0) ? 1 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & `cal_i_M & (IR_E[`rs]==IR_M[`rt]) & IR_E[`rs]!=0) ? 1 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & (IR_M[`op]==`jal) & (IR_E[`rs]==31) & IR_E[`rs]!=0) ? 4 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & (IR_M[`op]==`R&IR_M[`func]==`jalr) & (IR_E[`rs]==IR_M[`rd]) & IR_E[`rs]!=0) ? 4 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & `cal_r_W & (IR_E[`rs]==IR_W[`rd]) & IR_E[`rs]!=0) ? 2 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & `cal_i_W & (IR_E[`rs]==IR_W[`rt]) & IR_E[`rs]!=0) ? 2 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & `load_W & (IR_E[`rs]==IR_W[`rt]) & IR_E[`rs]!=0) ? 2 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & (IR_W[`op]==`jal) & (IR_E[`rs]==31) & IR_E[`rs]!=0) ? 5 :
							  ((`cal_r_E||`cal_i_E||`load_E||`store_E) & (IR_W[`op]==`R&IR_W[`func]==`jalr) & (IR_E[`rs]==IR_W[`rd]) & IR_E[`rs]!=0) ? 5 : 0;
	assign ForwardRTE	= ((`cal_r_E||`store_E) & `cal_r_M & (IR_E[`rt]==IR_M[`rd]) & IR_E[`rt]!=0) ? 1 :
							  ((`cal_r_E||`store_E) & `cal_i_M & (IR_E[`rt]==IR_M[`rt]) & IR_E[`rt]!=0) ? 1 :
							  ((`cal_r_E||`store_E) & (IR_M[`op]==`jal) & (IR_E[`rt]==31) & IR_E[`rt]!=0) ? 4 :
							  ((`cal_r_E||`store_E) & (IR_M[`op]==`R&IR_M[`func]==`jalr) & (IR_E[`rt]==IR_M[`rd]) & IR_E[`rt]!=0) ? 4 :
							  ((`cal_r_E||`store_E) & `cal_r_W & (IR_E[`rt]==IR_W[`rd]) & IR_E[`rt]!=0) ? 2 :
							  ((`cal_r_E||`store_E) & `cal_i_W & (IR_E[`rt]==IR_W[`rt]) & IR_E[`rt]!=0) ? 2 :
							  ((`cal_r_E||`store_E) & `load_W & (IR_E[`rt]==IR_W[`rt]) & IR_E[`rt]!=0) ? 2 :
							  ((`cal_r_E||`store_E) & (IR_W[`op]==`jal) & (IR_E[`rt]==31) & IR_E[`rt]!=0) ? 5 :
							  ((`cal_r_E||`store_E) & (IR_W[`op]==`R&IR_W[`func]==`jalr) & (IR_E[`rt]==IR_W[`rd]) & IR_E[`rt]!=0) ? 5 : 0;
	assign ForwardRTM	= ((`store_M) & `cal_r_W & (IR_M[`rt]==IR_W[`rd]) & IR_M[`rt]!=0) ? 2 :
							  ((`store_M) & `cal_i_W & (IR_M[`rt]==IR_W[`rt]) & IR_M[`rt]!=0) ? 2 :
							  ((`store_M) & `load_W & (IR_M[`rt]==IR_W[`rt]) & IR_M[`rt]!=0) ? 2 :
							  ((`store_M) & (IR_W[`op]==`jal) & (IR_M[`rt]==31) & IR_M[`rt]!=0) ? 5 :
							  ((`store_M) & (IR_W[`op]==`R&IR_W[`func]==`jalr) & (IR_M[`rt]==IR_W[`rd]) & IR_M[`rt]!=0) ? 5 : 0;
endmodule
