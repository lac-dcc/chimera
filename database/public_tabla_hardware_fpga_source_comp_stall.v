// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps

`ifdef FPGA
	`include "inst.vh"
`endif

module comp_stall #(
	parameter srcNum = 3,
	parameter indexLen = 8
	)
	(
		input interim_out_v0,
		input interim_out_v1,
		
		input pe_neigh_data_reg_v,
		input pu_neigh_data_reg_v,
		
		input pe_bus_data_reg_v,
		input gb_bus_data_reg_v,
		
		input [indexLen - 1: 0] src0Index,
		input [indexLen - 1: 0] src1Index,
		
		input [(1 << srcNum) - 1 : 0] src0_decoder_out,
		input [(1 << srcNum) - 1 : 0] src1_decoder_out,
		
		input src0_v_bram, src1_v_bram,
		
		input inst_valid,
		
		output src0_v, src1_v,
		
		output inst_stall_comp
	);	

	wire src0_v_comp, src1_v_comp;
	wire src0_rq_comp, src1_rq_comp;
	
	wire [ 1 : 0] srcInterimInV;
	
	wire src0NeighValid, src1NeighValid; 
	wire src0BusValid, src1BusValid;
	
	assign srcInterimInV = { interim_out_v1 &  src1_decoder_out[`NAMESPACE_INTERIM], interim_out_v0 & src0_decoder_out[`NAMESPACE_INTERIM] } ;

	assign src0NeighValid = (src0_decoder_out[`NAMESPACE_NEIGHBOR]) && ((~src0Index[0] && pe_neigh_data_reg_v) || (src0Index[0] && pu_neigh_data_reg_v));
	assign src1NeighValid = (src1_decoder_out[`NAMESPACE_NEIGHBOR]) && ((~src1Index[0] && pe_neigh_data_reg_v) || (src1Index[0] && pu_neigh_data_reg_v));
	
	assign src0BusValid = (src0_decoder_out[`NAMESPACE_BUS]) && ((~src0Index[0] && pe_bus_data_reg_v) || (src0Index[0] && gb_bus_data_reg_v));
	assign src1BusValid = (src1_decoder_out[`NAMESPACE_BUS]) && ((~src1Index[0] && pe_bus_data_reg_v) || (src1Index[0] && gb_bus_data_reg_v));
	
	assign src0_v_comp = (srcInterimInV[0] || src0NeighValid || src0BusValid) && inst_valid;
	assign src1_v_comp = (srcInterimInV[1] || src1NeighValid || src1BusValid) && inst_valid;
	
	assign src0_rq_comp = src0_decoder_out[`NAMESPACE_BUS] || src0_decoder_out[`NAMESPACE_NEIGHBOR] || src0_decoder_out[`NAMESPACE_INTERIM];
	assign src1_rq_comp = src1_decoder_out[`NAMESPACE_BUS] || src1_decoder_out[`NAMESPACE_NEIGHBOR] || src1_decoder_out[`NAMESPACE_INTERIM];

	assign inst_stall_comp = ((src0_rq_comp && ~src0_v_comp) || (src1_rq_comp && ~src1_v_comp)) && inst_valid ; 
	
	assign src0_v =  src0_v_bram || src0_v_comp;
	assign src1_v =  src1_v_bram || src1_v_comp;
	
endmodule