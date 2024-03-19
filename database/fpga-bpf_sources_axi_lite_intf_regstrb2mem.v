//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
/*
regstrb2mem.v

The output of the AirHDL-generated module is a bunch of registers with strobe signals. I
need to convert this into sequential writes to code memory.
*/

/*
primitive next_vld_tt (
	output nxt_vld,
	input cur_vld,
	input strb,
	input wr_en
);

table
//curvld	strb	wr_en	:	nxt_vld
	0		0		0		:	0;
	1		0		0		:	1;
	?		0		1		:	0;
	?		1		0		:	1;
	?		1		1		:	0;
endtable

endprimitive
*/

/*Great, primitives are not supported. I guess I have to do a kmap
{strb | wr_en}|	00	01	11	10
--------------|----------------
curvld		0 |	0	0	0	1
			1 |	1	0	0	1

nxt_vld = (strb && !wr_en) || (curvld && !wr_en); 	(SOP)
nxt_vld = (!wr_en) && (strb || curvld);				(POS)
*/

//TODO: Should these be parameters? And by the way, there are a lot of hardcoded widths
`define CODE_DATA_WIDTH 64 
`define PACKET_BYTE_ADDR_WIDTH 12

module regstrb2mem # (
    parameter CODE_ADDR_WIDTH = 9
)(
	input wire clk,

	//Interface to codemem
	output reg [CODE_ADDR_WIDTH-1:0] code_mem_wr_addr = 0,
	output wire [`CODE_DATA_WIDTH-1:0] code_mem_wr_data,
	output wire code_mem_wr_en,
	
	//Interface from regs
	input wire [31:0] inst_high_value,
	input wire inst_high_strobe,
	input wire [31:0] inst_low_value,
	input wire inst_low_strobe,
	
	input wire control_start
);
    
    
wire [CODE_ADDR_WIDTH-1:0] next_code_mem_wr_addr;

assign code_mem_wr_data = {inst_high_value, inst_low_value};

reg inst_low_valid = 0, inst_high_valid = 0;
wire next_inst_low_valid, next_inst_high_valid;

assign code_mem_wr_en = !control_start &&(
	(inst_low_valid && inst_high_strobe) ||
	(inst_high_valid && inst_low_strobe)
);

/*
next_vld_tt high(next_inst_high_valid, inst_high_valid, inst_high_strobe, code_mem_wr_en);
next_vld_tt low(next_inst_low_valid, inst_low_valid, inst_low_strobe, code_mem_wr_en);
*/

assign next_inst_high_valid = (!code_mem_wr_en) && (inst_high_strobe || inst_high_valid);	
assign next_inst_low_valid = (!code_mem_wr_en) && (inst_low_strobe || inst_low_valid);

assign next_code_mem_wr_addr = (code_mem_wr_en ? code_mem_wr_addr+1 : code_mem_wr_addr);

//Assumes inst_high_strobe and inst_low_strobe will never be asserted on the same clock cycle
//Also assumes that register values stay constant between strobe signals
always @(posedge clk) begin
	if (control_start)
		code_mem_wr_addr <= 0;
	else
		code_mem_wr_addr <= next_code_mem_wr_addr;
		
	inst_high_valid <= next_inst_high_valid;
	inst_low_valid <= next_inst_low_valid;
end

endmodule
