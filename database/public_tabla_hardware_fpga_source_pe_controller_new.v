// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"	
`endif

module pe_controller_new
#(
//--------------------------------------------------------------------------------------
	parameter destNum               = 3,
	parameter srcNum                = 3,
	parameter fnLen                 = 3,
	parameter nameLen               = 3,
	parameter indexLen              = 8,
	parameter weightAddrLen         = 5,
	parameter interimAddrLen        = 2,
	parameter dataAddrLen           = 5,
 	parameter metaAddrLen           = 2,
 	parameter peBusIndexLen         = 4,
	parameter gbBusIndexLen         = 4,
	parameter instLen               = fnLen + (indexLen+nameLen)*2 + 1+interimAddrLen+1+weightAddrLen+1+1+peBusIndexLen+gbBusIndexLen
	//--------------------------------------------------------------------------------------
) (
//--------------------------------------------------------------------------------------
	input  wire clk, reset, eoc,
	input  wire [instLen - 1 : 0] inst_in,
	input  wire inst_in_v,
	input start,
	
	input wire inst_stall,
	input wire bus_contention,	
	
	output reg [fnLen - 1 : 0] pe_compute_fn,
	output reg inst_out_v, inst_out_v_dd,

	output reg pe_core_weight_wrt,
	output reg pe_core_gradient_wrt,
	output reg pe_core_interim_wrt,
	
	output reg pe_core_pe_neig_wrt, pe_core_pu_neig_wrt,
	
	output reg [weightAddrLen - 1 : 0] pe_core_gradient_wrt_addr, pe_core_weight_wrt_addr,
	output reg [interimAddrLen - 1 : 0] pe_core_interim_wrt_addr,
	
	output reg [peBusIndexLen - 1 : 0 ] pe_core_pe_bus_wrt_addr,
	output reg [gbBusIndexLen - 1 : 0] pe_core_gb_bus_wrt_addr,
	
	output reg [dataAddrLen - 1 : 0] pe_core_data_rd_addr,
	output reg [weightAddrLen - 1 : 0]  pe_core_weight_rd_addr, pe_core_gradient_rd_addr,
	output reg [interimAddrLen - 1 : 0] pe_core_interim_rd_addr0, pe_core_interim_rd_addr1,
	output reg [metaAddrLen - 1 : 0] pe_core_meta_rd_addr,

	output reg pe_neigh_data_rq, pu_neigh_data_rq,
	output reg pe_bus_data_rq, gb_bus_data_rq,
	
	output reg [peBusIndexLen-2:0] pe_bus_rd_addr,
	output reg [gbBusIndexLen-2:0] gb_bus_rd_addr,

	output reg src0_rq, src1_rq, src2_rq,
	
	output reg [indexLen - 1: 0] src0Index, src1Index, src2Index,
	
	output reg [srcNum - 1 : 0 ] src0Name, src1Name, src2Name,
	
	output reg inst_eol 
//--------------------------------------------------------------------------------------
);


	
	//--------------------------------------------------------------------------------------
	
	 wire [fnLen - 1 : 0] pe_compute_fn_d;

	 wire pe_core_weight_wrt_d;
	 wire pe_core_gradient_wrt_d;
	 wire pe_core_interim_wrt_d;
	
	 wire pe_core_pe_neig_wrt_d, pe_core_pu_neig_wrt_d;
	
	 wire [weightAddrLen - 1 : 0] pe_core_gradient_wrt_addr_d, pe_core_weight_wrt_addr_d;
	 wire [interimAddrLen - 1 : 0] pe_core_interim_wrt_addr_d;
	
	 wire [peBusIndexLen - 1 : 0 ] pe_core_pe_bus_wrt_addr_d;
	 wire [gbBusIndexLen - 1 : 0 ] pe_core_gb_bus_wrt_addr_d;
	
	 wire [dataAddrLen - 1 : 0] pe_core_data_rd_addr_d;
	 wire [weightAddrLen - 1 : 0]  pe_core_weight_rd_addr_d, pe_core_gradient_rd_addr_d;
	 wire [interimAddrLen - 1 : 0] pe_core_interim_rd_addr0_d, pe_core_interim_rd_addr1_d;
	 wire [metaAddrLen - 1 : 0] pe_core_meta_rd_addr_d;

	 wire src0_rq_d, src1_rq_d;
	 
	 wire [indexLen - 1: 0] src0Index_d, src1Index_d;
	
	 wire [srcNum - 1 : 0 ] src0Name_d, src1Name_d;

	 wire inst_eol_d; 
	 
	 //--------------------------------------------------------------------------------------
	//extra delay to compensate for the BRAM
	reg [fnLen - 1 : 0] pe_compute_fn_dd;
	reg pe_core_weight_wrt_dd;
	reg pe_core_gradient_wrt_dd;
	reg pe_core_interim_wrt_dd;
	reg pe_core_pe_neig_wrt_dd, pe_core_pu_neig_wrt_dd;
	reg [weightAddrLen - 1 : 0] pe_core_gradient_wrt_addr_dd, pe_core_weight_wrt_addr_dd;
	reg [interimAddrLen - 1 : 0] pe_core_interim_wrt_addr_dd;
	reg [peBusIndexLen - 1 : 0 ] pe_core_pe_bus_wrt_addr_dd;
	reg [gbBusIndexLen - 1 : 0] pe_core_gb_bus_wrt_addr_dd;
//	reg [interimAddrLen - 1 : 0] pe_core_interim_rd_addr0_dd, pe_core_interim_rd_addr1_dd;
	reg pe_neigh_data_rq_dd, pu_neigh_data_rq_dd, pe_bus_data_rq_dd, gb_bus_data_rq_dd;
	reg src0_rq_dd, src1_rq_dd;
	reg [indexLen - 1: 0] src0Index_dd, src1Index_dd; 
	reg inst_eol_dd;
	reg start_d,start_dd;
	//--------------------------------------------------------------------------------------
	wire  dest_weight_wrt, dest_interim_wrt,dest_pe_bus_wrt,dest_gb_bus_wrt,dest_pe_neigh_wrt,dest_pu_neigh_wrt;
	wire [weightAddrLen - 1: 0] dest_weight_Index;
	wire [interimAddrLen - 1: 0] dest_interim_Index;
	wire [peBusIndexLen - 2: 0] dest_pe_bus_Index;
	wire [gbBusIndexLen - 2: 0] dest_gb_bus_Index;

	
	instCutter_new
	#(
    .instLen(instLen),
		.fnLen(fnLen),
		.nameLen(nameLen),
		.indexLen(indexLen),
    .interimAddrLen(interimAddrLen),
    .weightAddrLen(weightAddrLen),
    .peBusIndexLen(peBusIndexLen),
    .gbBusIndexLen(gbBusIndexLen)
	)
	instCutterUnit(
		.instword(inst_in),
		.instword_v(inst_in_v),
		.fn(pe_compute_fn_d),
		
		.dest_weight_wrt(dest_weight_wrt),
		.dest_weight_Index(dest_weight_Index),

		.dest_interim_wrt(dest_interim_wrt),
		.dest_interim_Index(dest_interim_Index),
	
		.dest_pe_bus_wrt(dest_pe_bus_wrt),
		.dest_gb_bus_wrt(dest_gb_bus_wrt),
		.dest_pe_bus_Index(dest_pe_bus_Index),
		.dest_gb_bus_Index(dest_gb_bus_Index),

    .dest_pe_neigh_wrt(dest_pe_neigh_wrt),
    .dest_pu_neigh_wrt(dest_pu_neigh_wrt),

		.src0Name(src0Name_d),
		.src0Index(src0Index_d),

		.src1Name(src1Name_d),
		.src1Index(src1Index_d)
	);
		

	assign src0_rq_d = |src0Name_d && inst_in_v;
	assign src1_rq_d = |src1Name_d && inst_in_v;
	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	
	assign pe_core_gradient_wrt_d = 1'b0;
	assign pe_core_weight_wrt_d = dest_weight_wrt  && inst_in_v;
	assign pe_core_interim_wrt_d = dest_interim_wrt  && inst_in_v;
	
	assign pe_core_weight_wrt_addr_d = dest_weight_Index[weightAddrLen - 1 : 0] & {weightAddrLen{dest_weight_wrt}};
	
	assign pe_core_interim_wrt_addr_d = dest_interim_Index[interimAddrLen - 1 : 0] & {interimAddrLen{dest_interim_wrt}};

	//--------------------------------------------------------------------------------------
	wire [peBusIndexLen - 2 : 0 ] pe_core_pe_bus_wrt_addr_w;
	wire [gbBusIndexLen - 2 : 0 ] pe_core_gb_bus_wrt_addr_w;
	wire pe_core_pe_bus_wrt, pe_core_gb_bus_wrt;

	assign pe_core_pe_bus_wrt = dest_pe_bus_wrt && inst_in_v;
  assign pe_core_gb_bus_wrt = dest_gb_bus_wrt && inst_in_v;

	assign pe_core_pe_bus_wrt_addr_w = dest_pe_bus_Index;
	assign pe_core_gb_bus_wrt_addr_w = dest_gb_bus_Index;

	assign pe_core_pe_bus_wrt_addr_d = {pe_core_pe_bus_wrt_addr_w,pe_core_pe_bus_wrt}; 
	assign pe_core_gb_bus_wrt_addr_d = {pe_core_gb_bus_wrt_addr_w,pe_core_gb_bus_wrt}; 

	assign pe_core_pe_neig_wrt_d = dest_pe_neigh_wrt && inst_in_v;
	assign pe_core_pu_neig_wrt_d = dest_pu_neigh_wrt && inst_in_v;
	
	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	wire [(1 << srcNum) - 1 : 0] src0_decoder_out;
	wire [(1 << srcNum) - 1 : 0] src1_decoder_out;

	
	decoder
	#(
		.inputLen(srcNum)
	)
	decode_src0(
		src0Name_d,
 		src0_decoder_out 
	);
	
	decoder
	#(
		.inputLen(srcNum)
	)
	decode_src1(
		src1Name_d,
 		src1_decoder_out 
	);
	
	wire pe_neigh_data_rq_d0,pe_neigh_data_rq_d1,pe_neigh_data_rq_d;
	wire pe_bus_data_rq_d0,pe_bus_data_rq_d1,pe_bus_data_rq_d;
	wire gb_bus_data_rq_d0,gb_bus_data_rq_d1,gb_bus_data_rq_d;
	wire pu_neigh_data_rq_d0,pu_neigh_data_rq_d1,pu_neigh_data_rq_d;
	
	assign pe_neigh_data_rq_d0 = src0_decoder_out[`NAMESPACE_NEIGHBOR] && ~src0Index_d[0] ;
	assign pe_neigh_data_rq_d1 = src1_decoder_out[`NAMESPACE_NEIGHBOR] && ~src1Index_d[0] ;
	assign pe_neigh_data_rq_d = pe_neigh_data_rq_d0 || pe_neigh_data_rq_d1 ;
	
	assign pu_neigh_data_rq_d0 = src0_decoder_out[`NAMESPACE_NEIGHBOR] && src0Index_d[0] ;
	assign pu_neigh_data_rq_d1 = src1_decoder_out[`NAMESPACE_NEIGHBOR] && src1Index_d[0] ;
	assign pu_neigh_data_rq_d = pu_neigh_data_rq_d0 || pu_neigh_data_rq_d1 ;
	
	assign pe_bus_data_rq_d0 = src0_decoder_out[`NAMESPACE_BUS] && ~src0Index_d[0] ;
	assign pe_bus_data_rq_d1 = src1_decoder_out[`NAMESPACE_BUS] && ~src1Index_d[0] ;
	assign pe_bus_data_rq_d = pe_bus_data_rq_d0 || pe_bus_data_rq_d1 ;
	 
	assign gb_bus_data_rq_d0 = src0_decoder_out[`NAMESPACE_BUS] && src0Index_d[0];
	assign gb_bus_data_rq_d1 = src1_decoder_out[`NAMESPACE_BUS] && src1Index_d[0];
	assign gb_bus_data_rq_d = gb_bus_data_rq_d0 || gb_bus_data_rq_d1 ;

	
	wire [weightAddrLen - 1 : 0] weight_rd_addr0, weight_rd_addr1, weight_rd_addr2;
	wire [dataAddrLen - 1 : 0] data_rd_addr0, data_rd_addr1, data_rd_addr2;
	wire [weightAddrLen - 1 : 0] gradient_rd_addr0, gradient_rd_addr1, gradient_rd_addr2;
	wire [metaAddrLen - 1 : 0] meta_rd_addr0, meta_rd_addr1, meta_rd_addr2;
	wire [interimAddrLen - 1 : 0] interim_rd_addr0, interim_rd_addr1, interim_rd_addr2;
	wire [peBusIndexLen - 2 : 0] pe_bus_rd_addr0, pe_bus_rd_addr1, pe_bus_rd_addr2,pe_bus_rd_addr_d;
	reg [peBusIndexLen - 2 : 0] pe_bus_rd_addr_dd;
	wire [gbBusIndexLen - 2 : 0] gb_bus_rd_addr0, gb_bus_rd_addr1, gb_bus_rd_addr2,gb_bus_rd_addr_d;
	reg [gbBusIndexLen - 2 : 0] gb_bus_rd_addr_dd;
	
	assign pe_bus_rd_addr0 = src0Index_d[peBusIndexLen - 1 : 1] & {peBusIndexLen-1{src0_decoder_out[`NAMESPACE_BUS]}};
	assign pe_bus_rd_addr1 = src1Index_d[peBusIndexLen - 1 : 1] & {peBusIndexLen-1{src1_decoder_out[`NAMESPACE_BUS]}};
	assign pe_bus_rd_addr_d = pe_bus_rd_addr0 | pe_bus_rd_addr1 ;	

	assign gb_bus_rd_addr0 = src0Index_d[gbBusIndexLen - 1 : 1] & {gbBusIndexLen-1{src0_decoder_out[`NAMESPACE_BUS]}};
	assign gb_bus_rd_addr1 = src1Index_d[gbBusIndexLen - 1 : 1] & {gbBusIndexLen-1{src1_decoder_out[`NAMESPACE_BUS]}};
	assign gb_bus_rd_addr_d = gb_bus_rd_addr0 | gb_bus_rd_addr1 ;	

	assign data_rd_addr0 = src0Index_d[dataAddrLen - 1 : 0] & {dataAddrLen{src0_decoder_out[`NAMESPACE_DATA]}};
	assign data_rd_addr1 = src1Index_d[dataAddrLen - 1 : 0] & {dataAddrLen{src1_decoder_out[`NAMESPACE_DATA]}};
	assign pe_core_data_rd_addr_d = data_rd_addr0 | data_rd_addr1 ;
	
	assign weight_rd_addr0 = src0Index_d[weightAddrLen - 1 : 0] & {weightAddrLen{src0_decoder_out[`NAMESPACE_WEIGHT]}};
	assign weight_rd_addr1 = src1Index_d[weightAddrLen - 1 : 0] & {weightAddrLen{src1_decoder_out[`NAMESPACE_WEIGHT]}};
	assign pe_core_weight_rd_addr_d = weight_rd_addr0 | weight_rd_addr1 ;
	
//	assign gradient_rd_addr0 = src0Index_d[weightAddrLen - 1 : 0] & {weightAddrLen{src0_decoder_out[`NAMESPACE_GRADIENT]}};
//	assign gradient_rd_addr1 = src1Index_d[weightAddrLen - 1 : 0] & {weightAddrLen{src1_decoder_out[`NAMESPACE_GRADIENT]}};
//	assign pe_core_gradient_rd_addr_d = gradient_rd_addr0 | gradient_rd_addr1 ;
	
	assign interim_rd_addr0 = src0Index_d[interimAddrLen - 1 : 0] & {interimAddrLen{src0_decoder_out[`NAMESPACE_INTERIM]}};
	assign interim_rd_addr1 = src1Index_d[interimAddrLen - 1 : 0] & {interimAddrLen{src1_decoder_out[`NAMESPACE_INTERIM]}};
	assign pe_core_interim_rd_addr0_d = interim_rd_addr0;
	assign pe_core_interim_rd_addr1_d = interim_rd_addr1 ;
	
	assign meta_rd_addr0 = src0Index_d[metaAddrLen - 1 : 0] & {metaAddrLen{src0_decoder_out[`NAMESPACE_META]}};
	assign meta_rd_addr1 = src1Index_d[metaAddrLen - 1 : 0] & {metaAddrLen{src1_decoder_out[`NAMESPACE_META]}};
	assign pe_core_meta_rd_addr_d = meta_rd_addr0 | meta_rd_addr1 ;
	//--------------------------------------------------------------------------------------
	assign inst_eol_d = ~(|src0Name_d || |src1Name_d  || dest_weight_wrt || dest_interim_wrt || dest_pe_bus_wrt || dest_gb_bus_wrt || dest_pe_neigh_wrt|| dest_pu_neigh_wrt) && inst_in_v;

	wire load_control_signals;
	assign load_control_signals = ~(bus_contention || inst_stall)||start ||start_d;
	reg load_control_signals_d;
	
	//--------------------------------------------------------------------------------------
	
	always @(posedge clk) begin
		if(reset || eoc)
		begin
			pe_compute_fn <= 0;
      pe_bus_rd_addr <= 0;
      pe_bus_rd_addr_dd <= 0;

		gb_bus_rd_addr <= 0;
      gb_bus_rd_addr_dd <= 0;
			pe_core_weight_wrt <= 0;
//	 		pe_core_gradient_wrt <= 0;
	 		pe_core_interim_wrt <= 0;
	
	 		pe_core_pe_neig_wrt <= 0;
	 		pe_core_pu_neig_wrt <= 0;
	
//	 		pe_core_gradient_wrt_addr <= 0; 
	 		pe_core_weight_wrt_addr <= 0;
	 		pe_core_interim_wrt_addr <= 0;
	
	 		pe_core_pe_bus_wrt_addr <= 0;
	 		pe_core_gb_bus_wrt_addr <= 0;
	
	 		pe_core_data_rd_addr <= 0;
	 		pe_core_weight_rd_addr <= 0;
//	 		pe_core_gradient_rd_addr <= 0;
	 		pe_core_interim_rd_addr0 <= 0;
	 		pe_core_interim_rd_addr1 <= 0;
	 		pe_core_meta_rd_addr <= 0;
	 		
	 		inst_out_v <= 0;

	 		src0_rq <= 0; 
	 		src1_rq <= 0; 
	 		
	 		src0Name <= 0;
	 		src1Name <= 0;
	 	
			inst_eol <= 0;
			
			pe_compute_fn_dd <= 0;
			pe_core_weight_wrt_dd <= 0;
//			pe_core_gradient_wrt_dd <= 0;
			pe_core_interim_wrt_dd <= 0;
			pe_core_pe_neig_wrt_dd <= 0; 
			pe_core_pu_neig_wrt_dd <= 0;
//			pe_core_gradient_wrt_addr_dd <= 0;
			pe_core_weight_wrt_addr_dd <= 0;
			pe_core_interim_wrt_addr_dd <= 0;
			pe_core_pe_bus_wrt_addr_dd <= 0; 
			pe_core_gb_bus_wrt_addr_dd <= 0;
//			pe_core_interim_rd_addr0_dd <= 0;
//			pe_core_interim_rd_addr1_dd <= 0;
			pe_neigh_data_rq_dd <= 0;
			pu_neigh_data_rq_dd <= 0;
			pe_bus_data_rq_dd <= 0;
			gb_bus_data_rq_dd <= 0;
			src0_rq_dd <= 0;
			src1_rq_dd <= 0; 
			src0Index <= 0; 
			src1Index <= 0; 
			src0Index_dd <= 0; 
			src1Index_dd <= 0;

			inst_eol_dd <= 0; 
            start_d <=0;
            start_dd <=0;
			
		end
		else begin
        start_d <= start;
        start_dd <= start_d;
        inst_out_v_dd <= load_control_signals || start_d ? inst_in_v : inst_out_v_dd;
		inst_out_v <= load_control_signals_d || start_dd ? inst_out_v_dd : inst_out_v ;
		load_control_signals_d <= load_control_signals;
		if(load_control_signals)
		begin


			pe_bus_rd_addr_dd <= pe_bus_rd_addr_d;
			
			gb_bus_rd_addr_dd <= gb_bus_rd_addr_d;
			
			pe_core_data_rd_addr <= pe_core_data_rd_addr_d;
	 		pe_core_weight_rd_addr <= pe_core_weight_rd_addr_d;
//	 		pe_core_gradient_rd_addr <= pe_core_gradient_rd_addr_d;
	 		pe_core_meta_rd_addr <= pe_core_meta_rd_addr_d;
							
	 		pe_core_interim_rd_addr0 <= pe_core_interim_rd_addr0_d;
	 		pe_core_interim_rd_addr1 <= pe_core_interim_rd_addr1_d;
	 		
			src0Name <= src0Name_d;
	 		src1Name <= src1Name_d;
			
			pe_compute_fn_dd <= pe_compute_fn_d;

			pe_core_weight_wrt_dd <= pe_core_weight_wrt_d;
//	 		pe_core_gradient_wrt_dd <= pe_core_gradient_wrt_d;
	 		pe_core_interim_wrt <= pe_core_interim_wrt_d;
	
	 		pe_core_pe_neig_wrt_dd <= pe_core_pe_neig_wrt_d;
	 		pe_core_pu_neig_wrt_dd <= pe_core_pu_neig_wrt_d;
	
//	 		pe_core_gradient_wrt_addr_dd <= pe_core_gradient_wrt_addr_d; 
	 		pe_core_weight_wrt_addr_dd  <= pe_core_weight_wrt_addr_d;
	 		pe_core_interim_wrt_addr <= pe_core_interim_wrt_addr_d;
	
	 		pe_core_pe_bus_wrt_addr_dd <= pe_core_pe_bus_wrt_addr_d;
	 		pe_core_gb_bus_wrt_addr_dd <= pe_core_gb_bus_wrt_addr_d;
	
//	 		pe_core_interim_rd_addr0_dd <= pe_core_interim_rd_addr0_d;
//	 		pe_core_interim_rd_addr1_dd <= pe_core_interim_rd_addr1_d;
	 		
	 		pe_neigh_data_rq_dd <= pe_neigh_data_rq_d;
	 		pu_neigh_data_rq_dd <= pu_neigh_data_rq_d;
	 		pe_bus_data_rq_dd   <= pe_bus_data_rq_d;
	 		gb_bus_data_rq_dd   <= gb_bus_data_rq_d;
	 	

	 		src0_rq_dd <= src0_rq_d; 
	 		src1_rq_dd <= src1_rq_d; 
	
	 		src0Index_dd <= src0Index_d;
	 		src1Index_dd <= src1Index_d;
	 		 
			inst_eol_dd <= inst_eol_d;
		end
		if(load_control_signals_d)
		begin
	   pe_bus_rd_addr <= pe_bus_rd_addr_dd;
        gb_bus_rd_addr <= gb_bus_rd_addr_dd;
        pe_compute_fn <= pe_compute_fn_dd;
        
        pe_core_weight_wrt <= pe_core_weight_wrt_dd;
        pe_core_interim_wrt_dd <= pe_core_interim_wrt_dd;
        
        pe_core_pe_neig_wrt <= pe_core_pe_neig_wrt_dd;
        pe_core_pu_neig_wrt <= pe_core_pu_neig_wrt_dd;
        
         pe_core_gradient_wrt_addr <= pe_core_gradient_wrt_addr_dd; 
         pe_core_weight_wrt_addr  <= pe_core_weight_wrt_addr_dd;
         pe_core_interim_wrt_addr_dd <= pe_core_interim_wrt_addr_dd;
        
         pe_core_pe_bus_wrt_addr <= pe_core_pe_bus_wrt_addr_dd;
         pe_core_gb_bus_wrt_addr <= pe_core_gb_bus_wrt_addr_dd;
          pe_neigh_data_rq <= pe_neigh_data_rq_dd;
         pu_neigh_data_rq <= pu_neigh_data_rq_dd;
         pe_bus_data_rq   <= pe_bus_data_rq_dd;
         gb_bus_data_rq   <= gb_bus_data_rq_dd;
         
         src0_rq <= src0_rq_dd; 
         src1_rq <= src1_rq_dd; 
        
         src0Index <= src0Index_dd;
         src1Index <= src1Index_dd;
         inst_eol <= inst_eol_dd;
        end
	end
	end
endmodule
