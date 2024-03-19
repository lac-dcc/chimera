`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : control.v
// Title        : Control Unit.
// Library      : nanoLADA
// Purpose      : Computer Architecture, Design and Verfication
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.

module control(	
	sel_pc,
	sel_addpc,
	sel_wr,
	sel_b,
	sel_data,
	reg_wr,
	mem_wr,
	ext_ops,
	alu_ops,
	opcode,
	z_flag,
	reserved
	);
output reg sel_pc;
output reg sel_addpc;
output reg sel_wr;
output reg sel_b;
output reg sel_data;
output reg reg_wr;
output reg mem_wr;
output reg [1:0] ext_ops;
output reg [2:0] alu_ops;
input [5:0] opcode;
input z_flag;
input [2:0] reserved; 

localparam ORI=6'b010000;
localparam ORUI=6'b010001;
/*Change ADD to RTYPE*/
localparam RTYPE=6'b000001;
localparam LW=6'b011000;
localparam SW=6'b011100;
localparam BEQ=6'b100100;
localparam JMP=6'b110000;

// sel_pc
always @(opcode)
begin
	case (opcode)
		JMP : sel_pc=1;
		default : sel_pc=0;
	endcase
end

// sel_addpc
always @(opcode or z_flag)
begin
	case (opcode)
		BEQ : sel_addpc=z_flag;
		default : sel_addpc=0;
	endcase
end

// sel_wr
always @(opcode)
begin
	case (opcode)
		ORI : sel_wr=1;
		ORUI : sel_wr=1;
		LW : sel_wr=1;
		default : sel_wr=0;
	endcase
end

// sel_b
always @(opcode)
begin
	case (opcode)
		ORI : sel_b=1;
		ORUI : sel_b=1;
		LW : sel_b=1;
		SW : sel_b=1;
		default : sel_b=0;
	endcase
end

// sel_data
always @(opcode)
begin
	case (opcode)
		LW : sel_data=1;
		default : sel_data=0;
	endcase
end

// reg_wr
always @(opcode)
begin
	case (opcode)
		ORI : reg_wr=1;
		ORUI : reg_wr=1;
		RTYPE : reg_wr=1;
		LW : reg_wr=1;
		default : reg_wr=0;
	endcase
end

// mem_wr
always @(opcode)
begin
	case (opcode)
		SW : mem_wr=1;
		default : mem_wr=0;
	endcase
end

// ext_ops
always @(opcode)
begin
	case (opcode)
		ORUI : ext_ops=2'b10;
		LW : ext_ops=2'b01;
		SW : ext_ops=2'b01;
		BEQ : ext_ops=2'b01;
		default : ext_ops=2'b00;
	endcase
end

// alu_ops
//add reserved to always -> must detect change in Reserved bit too in order for R-type to work
always @(opcode && reserved)
begin
	case (opcode)
		ORI : alu_ops=3'b010;
		ORUI : alu_ops=3'b010;
		BEQ : alu_ops=3'b001;
		/*RTYPE sens alu_ops accoring to reserved last three bit*/
		RTYPE : alu_ops= reserved;
		default : alu_ops=3'b000;
	endcase
end

endmodule

//Change ALU ops
// 01 to 010 , 10 to 001
	
