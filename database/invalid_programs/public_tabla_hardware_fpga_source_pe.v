`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"	
	`include "log.vh"	
	`include "config.vh"	
`endif

module pe
#(
//--------------------------------------------------------------------------------------
	parameter peId                    = 0,
    parameter puId                    = 0,
    parameter numPe                    = 8,
    parameter logNumPe                = 3,
    parameter logNumPu                = 0,
    parameter memDataLen              = 16,
    parameter logMemNamespaces        = 2, 
    
    parameter indexLen                = 8, 
    parameter dataLen                 = 32,
    parameter logNumPeMemLanes        = 2,
	
	parameter fnLen                 = 5,
	parameter nameLen               = 3,

 	parameter peBusIndexLen         = logNumPe,
	parameter puBusIndexLen         = logNumPu
	//--------------------------------------------------------------------------------------
) (
//--------------------------------------------------------------------------------------
	
	input clk,
	input rstn,
	
	input start,
	input eoc,
	input restart,
	
	output  pe_stall,
	
	// memory interface
	input  mem_wrt_valid,
	input  mem_weight_rd_valid,
	
	input  [logNumPeMemLanes - 1 : 0]  peId_mem_in,
	input  [logMemNamespaces - 1  : 0] mem_data_type,
	
	input  [memDataLen - 1 : 0]  mem_data_input,
	output [memDataLen - 1 : 0]  mem_data_output,
	
	output reg eoi,
	
	// bus IO
	
	input   [dataLen - 1 : 0]           pe_neigh_data_in,
	input                               pe_neigh_data_in_v,

	input   [dataLen - 1 : 0]           pu_neigh_data_in,
	input                               pu_neigh_data_in_v,

	input   [dataLen - 1 : 0]           pe_bus_data_in,
	input                               pe_bus_data_in_v,

	input   [dataLen - 1 : 0]           pu_bus_data_in,
	input                               pu_bus_data_in_v,

	output  [dataLen - 1 : 0]           pe_neigh_data_out,
	output                              pe_neigh_data_out_v,

	output  [dataLen - 1 : 0]           pu_neigh_data_out,
	output                              pu_neigh_data_out_v,

	output  [dataLen - 1 : 0]           pe_bus_data_out,
	output  [peBusIndexLen - 1 : 0]     pe_bus_data_out_addr,               
	output                              pe_bus_data_out_v,               

	output  [peBusIndexLen - 1 : 0]     pe_bus_src_addr,
	output                              pe_bus_src_rq,

	output  [puBusIndexLen - 1 : 0]     pu_bus_src_addr,
	output                              pu_bus_src_rq,
	
	output  [dataLen - 1 : 0]           pu_bus_data_out,
	output  [puBusIndexLen - 1 : 0]     pu_bus_data_out_addr,
	output                              pu_bus_data_out_v,
	input                 pe_bus_contention,
	input                 pu_bus_contention,
	
	output pe_neigh_full,
	output pu_neigh_full,
	input pe_neigh_full_in,
	input pu_neigh_full_in
	
//--------------------------------------------------------------------------------------
);

localparam instAddrLen           = `INDEX_INST;
localparam dataAddrLen           = `C_LOG_2(`DATA_MEM_SIZE);
localparam weightAddrLen         = `C_LOG_2(`WEIGHT_MEM_SIZE);
localparam metaAddrLen           = `INDEX_META;
localparam interimAddrLen        = `C_LOG_2(`INTERIM_MEM_SIZE);
localparam instLen               = fnLen + (indexLen+nameLen)*2 + 1+interimAddrLen+1+weightAddrLen+1+1+1+peBusIndexLen+1+puBusIndexLen;
//localparam instLen               = fnLen + (indexLen+nameLen)*2 + 1+indexLen+1+indexLen+1+1+1+peBusIndexLen+1+puBusIndexLen;
	
    
wire [instLen-1:0] inst_word;
//Instruction Splitting
wire dest_weight_wrt,dest_interim_wrt,dest_pe_bus_wrt,dest_pu_bus_wrt,dest_pe_neigh_wrt,dest_pu_neigh_wrt;
wire [nameLen - 1: 0] src0Name,src1Name;
wire [indexLen - 1: 0] src0Index,src1Index;
wire [weightAddrLen-1:0]  dest_weight_Index;
wire [interimAddrLen-1:0]  dest_interim_Index;
wire [peBusIndexLen-1:0]  dest_pe_bus_Index;
wire [puBusIndexLen-1:0]  dest_pu_bus_Index;
wire [fnLen-1:0] fn;
//Instruction Decoding
localparam srcLen = (1<<nameLen);
wire [srcLen-1:0] src0_one_hot,src1_one_hot, src_rq;
wire pe_neigh_data_rq,pu_neigh_data_rq,pe_bus_data_rq,pu_bus_data_rq;
wire [dataAddrLen - 1 : 0] data_rd_addr_w;
wire [weightAddrLen - 1 : 0]  weight_rd_addr_w;
wire [interimAddrLen - 1 : 0] interim_rd_addr0_w,interim_rd_addr1_w;
wire [metaAddrLen - 1 : 0] meta_rd_addr_w;
wire [peBusIndexLen-1:0]  pe_bus_src_index;
wire [puBusIndexLen-1:0]  pu_bus_src_index;
wire [1:0] interim_rq;

//Pipelines
reg [fnLen-1:0] fn_q,fn_q1,fn_q2,fn_q23,fn_q3;
reg [nameLen-1:0] src0Name_q,src1Name_q,src0Name_q1,src1Name_q1,src0Name_q2,src1Name_q2;
reg [srcLen-1:0] src_rq_q,src_rq_q1,src_rq_q2;
reg pe_neigh_data_rq_q,pu_neigh_data_rq_q,pe_bus_data_rq_q,pu_bus_data_rq_q;
reg pe_bus_data_rq_q2,pu_bus_data_rq_q2,pe_neigh_data_rq_q2,pu_neigh_data_rq_q2;
reg pe_bus_data_rq_q1,pu_bus_data_rq_q1,pe_neigh_data_rq_q1,pu_neigh_data_rq_q1;
reg [dataAddrLen - 1 : 0] data_rd_addr_q,data_rd_addr_q1;
reg [weightAddrLen - 1 : 0]  weight_rd_addr_q,weight_rd_addr_q1;
reg [interimAddrLen - 1 : 0] interim_rd_addr0_q,interim_rd_addr1_q;
reg [interimAddrLen - 1 : 0] interim_rd_addr0_q1,interim_rd_addr1_q1;
reg [interimAddrLen - 1 : 0] interim_rd_addr0_q2,interim_rd_addr1_q2;
reg [metaAddrLen - 1 : 0] meta_rd_addr_q,meta_rd_addr_q1;
reg [peBusIndexLen-1:0]  pe_bus_src_index_q;
reg [puBusIndexLen-1:0]  pu_bus_src_index_q;
reg [1:0] interim_rq_q,interim_rq_q1,interim_rq_q2;
reg eoi_q,eoi_q1,eoi_q2;
wire eoi_w;
wire stall;
reg pe_neigh_data_reg_v_q,pu_neigh_data_reg_v_q;
reg [weightAddrLen-1:0]  dest_weight_Index_q,dest_weight_Index_q1,dest_weight_Index_q2,dest_weight_Index_q23,dest_weight_Index_q3;
reg [interimAddrLen-1:0]  dest_interim_Index_q,dest_interim_Index_q1,dest_interim_Index_q2,dest_interim_Index_q23,dest_interim_Index_q3;
reg [peBusIndexLen-1:0]  dest_pe_bus_Index_q,dest_pe_bus_Index_q1,dest_pe_bus_Index_q2,dest_pe_bus_Index_q23,dest_pe_bus_Index_q3;
reg [puBusIndexLen-1:0]  dest_pu_bus_Index_q,dest_pu_bus_Index_q1,dest_pu_bus_Index_q2,dest_pu_bus_Index_q23,dest_pu_bus_Index_q3;
reg  dest_weight_wrt_q,dest_interim_wrt_q,dest_pe_bus_wrt_q,dest_pu_bus_wrt_q,dest_pe_neigh_wrt_q,dest_pu_neigh_wrt_q;
reg  dest_weight_wrt_q1,dest_interim_wrt_q1,dest_pe_bus_wrt_q1,dest_pu_bus_wrt_q1,dest_pe_neigh_wrt_q1,dest_pu_neigh_wrt_q1;
reg  dest_weight_wrt_q2,dest_interim_wrt_q2,dest_pe_bus_wrt_q2,dest_pu_bus_wrt_q2,dest_pe_neigh_wrt_q2,dest_pu_neigh_wrt_q2;
reg  dest_weight_wrt_q3,dest_interim_wrt_q3,dest_pe_bus_wrt_q3,dest_pu_bus_wrt_q3,dest_pe_neigh_wrt_q3,dest_pu_neigh_wrt_q3;
reg  dest_weight_wrt_q23,dest_interim_wrt_q23,dest_pe_bus_wrt_q23,dest_pu_bus_wrt_q23,dest_pe_neigh_wrt_q23,dest_pu_neigh_wrt_q23;
//source mux out
wire weight_invalid,data_invalid,meta_invalid,interim_invalid,pe_bus_invalid,pu_bus_invalid,pe_neigh_invalid,pu_neigh_invalid,bus_out_invalid,neigh_out_invalid;
wire [dataLen-1:0] operand0_data,operand1_data;
reg [dataLen-1:0] operand0_data_r,operand1_data_r;

wire [memDataLen-1:0] op_weight_read    ;
wire [memDataLen-1:0] op_data_read      ;
wire [dataLen-1:0] compute_data_out  ;
reg [dataLen-1:0] compute_data_out_d,compute_data_out_d2  ;
wire [dataLen-1:0] interim_data_out0,interim_data_out1 ;
wire [memDataLen-1:0] op_meta_read      ;
reg [dataLen-1:0] neigh_data_out    ;
reg [dataLen-1:0] bus_data_out      ;

reg [dataLen - 1 : 0]           pe_bus_data_in_q,pu_bus_data_in_q;
reg pe_bus_data_in_v_q,pu_bus_data_in_v_q;

wire [dataLen-1:0] pe_neigh_data_reg,pu_neigh_data_reg;
wire pe_neigh_data_reg_v,pu_neigh_data_reg_v;

wire data_out_v,weight_out_v,meta_out_v,interim_data_out0_v,interim_data_out1_v;
//---------------------------- Instruction FIFO --------------------------------

instruction_memory
	#( 
	.dataLen(instLen),
	.peId(peId),
	.addrLen(instAddrLen)
	)
instruction_memory_inst (
	.clk		( clk		),
	.rstn		( rstn		),
	
	.stall		( stall		),
	.start		( start		),
	.restart	( restart	),
	.data_out	( inst_word	)
);

//---------------------------- Instruction Splitting --------------------------------

assign {fn,src0Name,src0Index,src1Name,src1Index,dest_interim_wrt,dest_interim_Index,dest_weight_wrt,dest_weight_Index,dest_pu_neigh_wrt,dest_pe_neigh_wrt,dest_pe_bus_wrt,dest_pe_bus_Index,dest_pu_bus_wrt,dest_pu_bus_Index} = inst_word;

//---------------------------- Instruction Decoding --------------------------------

assign src0_one_hot = (1<< src0Name);
assign src1_one_hot = (1<< src1Name);
assign src_rq = src0_one_hot | src1_one_hot;

assign pe_neigh_data_rq = (src0_one_hot[`NAMESPACE_NEIGHBOR] && ~src0Index[0])||(src1_one_hot[`NAMESPACE_NEIGHBOR] && ~src1Index[0]);
assign pu_neigh_data_rq = (src0_one_hot[`NAMESPACE_NEIGHBOR] && src0Index[0])||(src1_one_hot[`NAMESPACE_NEIGHBOR] && src1Index[0]);

assign pe_bus_data_rq = (src0_one_hot[`NAMESPACE_BUS] && ~src0Index[0])||(src1_one_hot[`NAMESPACE_BUS] && ~src1Index[0]);
assign pu_bus_data_rq = (src0_one_hot[`NAMESPACE_BUS] && src0Index[0])||(src1_one_hot[`NAMESPACE_BUS] && src1Index[0]);

assign 	pe_bus_src_index = src0_one_hot[`NAMESPACE_BUS] ? src0Index[peBusIndexLen : 1] : src1Index[peBusIndexLen : 1];
assign 	pu_bus_src_index = src0_one_hot[`NAMESPACE_BUS] ? src0Index[puBusIndexLen : 1] : src1Index[puBusIndexLen : 1];

assign 	data_rd_addr_w = src0_one_hot[`NAMESPACE_DATA] ? src0Index[dataAddrLen - 1 : 0] : src1Index[dataAddrLen - 1 : 0];
assign 	weight_rd_addr_w = src0_one_hot[`NAMESPACE_WEIGHT] ? src0Index[weightAddrLen - 1 : 0] : src1Index[weightAddrLen - 1 : 0];
assign 	meta_rd_addr_w = src0_one_hot[`NAMESPACE_META] ? src0Index[metaAddrLen - 1 : 0] : src1Index[metaAddrLen - 1 : 0];
assign 	interim_rd_addr0_w = src0_one_hot[`NAMESPACE_INTERIM] ? src0Index[interimAddrLen - 1 : 0] : src1Index[interimAddrLen - 1 : 0];
//assign 	interim_rd_addr1_w = src1Index[interimAddrLen - 1 : 0];

assign interim_rq = {src1_one_hot[`NAMESPACE_INTERIM],src0_one_hot[`NAMESPACE_INTERIM]};

assign eoi_w = (fn == {fnLen{1'b0}});
//---------------------------- Pipeline after decode --------------------------------
// source signals


always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		src_rq_q <= {srcLen{1'b0}};
		pe_neigh_data_rq_q <= 1'b0;
		pu_neigh_data_rq_q <= 1'b0;
		pe_bus_data_rq_q <= 1'b0;
		pu_bus_data_rq_q <= 1'b0;
		interim_rq_q <= 2'b0;
		eoi_q <= 1'b0;
	end
	else if(~stall) begin
		src_rq_q <= src_rq;
		pe_neigh_data_rq_q <= pe_neigh_data_rq;
		pu_neigh_data_rq_q <= pu_neigh_data_rq;
		pe_bus_data_rq_q <= pe_bus_data_rq;
		pu_bus_data_rq_q <= pu_bus_data_rq;
		interim_rq_q <= interim_rq;
		eoi_q <= eoi_w;
	end
end
always @(posedge clk ) begin
	if(~stall) begin
		data_rd_addr_q <= data_rd_addr_w;
		weight_rd_addr_q <= weight_rd_addr_w;
		meta_rd_addr_q <= meta_rd_addr_w;
		interim_rd_addr0_q <= interim_rd_addr0_w;
		interim_rd_addr1_q <= interim_rd_addr1_w;
		pe_bus_src_index_q <= pe_bus_src_index;
		pu_bus_src_index_q <= pu_bus_src_index;
	end
end

// destination signals
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		dest_weight_wrt_q <= 1'b0;
		dest_interim_wrt_q <= 1'b0;
		dest_pe_bus_wrt_q <= 1'b0;
		dest_pu_bus_wrt_q <= 1'b0;
		dest_pe_neigh_wrt_q <= 1'b0;
		dest_pu_neigh_wrt_q <= 1'b0;
	end
	else if(~stall) begin
		dest_weight_wrt_q <= dest_weight_wrt;
		dest_interim_wrt_q <= dest_interim_wrt;
		dest_pe_bus_wrt_q <= dest_pe_bus_wrt;
		dest_pu_bus_wrt_q <= dest_pu_bus_wrt;
		dest_pe_neigh_wrt_q <= dest_pe_neigh_wrt;
		dest_pu_neigh_wrt_q <= dest_pu_neigh_wrt;
	end
end
always @(posedge clk ) begin
	if(~stall) begin
		fn_q <= fn;
		src0Name_q <= src0Name;
		src1Name_q <= src1Name;
		dest_weight_Index_q <= dest_weight_Index;
		dest_interim_Index_q <= dest_interim_Index;
		dest_pe_bus_Index_q <= dest_pe_bus_Index;
		dest_pu_bus_Index_q <= dest_pu_bus_Index;
	end
end
//---------------------------- PE namespace -------------------------------- 

pe_namespace_wrapper
    #(
	.peId            		( peId              ),
	.numPe            		( numPe              ),
	.logNumPu          		( logNumPu          ),
	.logNumPe          		( logNumPe          ),  
	.indexLen               ( indexLen          ),
	.instAddrLen            ( instAddrLen       ),
	.dataAddrLen            ( dataAddrLen       ),
	.weightAddrLen          ( weightAddrLen     ),
	.metaAddrLen            ( metaAddrLen       ),
	.dataLen                ( memDataLen           ),
	.instLen                ( instLen           ),
	.logMemNamespaces       ( logMemNamespaces  ),
	.memDataLen          	( memDataLen        ),
	.logNumPeMemLanes      	( logNumPeMemLanes  ) 
    )
pe_namespace_wrapper_unit(
	.clk                        ( clk            		),
	.reset                      ( ~rstn          		),
	.start            			( start          		),
    .eoc            			( eoc            		),
	
	.mem_wrt_valid        		( mem_wrt_valid        	),
	.mem_weight_rd_valid    	( mem_weight_rd_valid   ),
	.peId_mem_in        		( peId_mem_in        	),
	.mem_data_type              ( mem_data_type        	),
	.mem_data_input             ( mem_data_input       	),
	.mem_data_output            ( mem_data_output      	),

	.pe_core_inst_stall         ( stall       			),
	
	.pe_core_weight_wrt_addr	( dest_weight_Index_q3	),
	.pe_core_weight_wrt_data	( compute_data_out[memDataLen-1:0]	),
	.pe_core_weight_wrt			( dest_weight_wrt_q3	),
	
	.pe_core_data_rd_addr_for_valid( data_rd_addr_q  	),
	.pe_core_data_rd_addr       ( data_rd_addr_q1  		),
	.pe_core_weight_rd_addr     ( weight_rd_addr_q1  	),
	.pe_core_meta_rd_addr       ( meta_rd_addr_q1   	),

	.pe_namespace_data_out_v  	( data_out_v      		),
	.pe_namespace_weight_out_v  ( weight_out_v    		),
	.pe_namespace_meta_out_v  	( meta_out_v      		),

	.pe_namespace_data_out      ( op_data_read    		),
	.pe_namespace_weight_out    ( op_weight_read  		),
	.pe_namespace_meta_out      ( op_meta_read    		)
    );	

interim_buffer	#(
	.addrLen                    ( interimAddrLen            ), 
	.dataLen                    ( dataLen                   )
    )
interim_buffer_inst	(
	.clk			( clk			),
	.rstn			( rstn			),
	
	.stall			( 1'b0               	),
	.interim_invalid( interim_invalid      	),
	.wrt_en			( dest_interim_wrt_q3	),
	.wrt_addr		( dest_interim_Index_q3	),
	.wrt_data		( compute_data_out		),
	
	.rd_en			( 1'b1					),
	
	.rd_addr		( interim_rd_addr0_q1	),
	//.rd_addr1		( interim_rd_addr1_q1	),
	
	.data_out		( interim_data_out0		),
	.data_out_v	( interim_data_out0_v	)
	//.data_out1		( interim_data_out1		),
	//.data_out1_v	( interim_data_out1_v	)
);	

//---------------------------- pipeline to match generate stall early -------------------------------- 

always @(posedge clk ) begin
	if(~stall) begin
		data_rd_addr_q1 <= data_rd_addr_q;
		weight_rd_addr_q1 <= weight_rd_addr_q;
		meta_rd_addr_q1 <= meta_rd_addr_q;
		interim_rd_addr0_q1<= interim_rd_addr0_q;
		interim_rd_addr1_q1 <= interim_rd_addr1_q;
	end
end

always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		src_rq_q1 <= {srcLen{1'b0}};
		pe_neigh_data_rq_q1 <= 1'b0;
		pu_neigh_data_rq_q1 <= 1'b0;
		pe_bus_data_rq_q1 <= 1'b0;
		pu_bus_data_rq_q1 <= 1'b0;
		interim_rq_q1 <= 2'b0;
		eoi_q1 <= 1'b0;
	end
	else if(~stall) begin
		src_rq_q1 <= src_rq_q;
		pe_neigh_data_rq_q1 <= pe_neigh_data_rq_q;
		pu_neigh_data_rq_q1 <= pu_neigh_data_rq_q;
		pe_bus_data_rq_q1 <= pe_bus_data_rq_q;
		pu_bus_data_rq_q1 <= pu_bus_data_rq_q;
		interim_rq_q1 <= interim_rq_q;
		eoi_q1 <= eoi_q;
	end
end
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		dest_weight_wrt_q1 <= 1'b0;
		dest_interim_wrt_q1 <= 1'b0;
		dest_pe_bus_wrt_q1 <= 1'b0;
		dest_pu_bus_wrt_q1 <= 1'b0;
		dest_pe_neigh_wrt_q1 <= 1'b0;
		dest_pu_neigh_wrt_q1 <= 1'b0;
	end
	else if(~stall) begin
		dest_weight_wrt_q1 <= dest_weight_wrt_q;
		dest_interim_wrt_q1 <= dest_interim_wrt_q;
		dest_pe_bus_wrt_q1 <= dest_pe_bus_wrt_q;
		dest_pu_bus_wrt_q1 <= dest_pu_bus_wrt_q;
		dest_pe_neigh_wrt_q1 <= dest_pe_neigh_wrt_q;
		dest_pu_neigh_wrt_q1 <= dest_pu_neigh_wrt_q;
	end
end
always @(posedge clk ) begin
    if(~stall) begin
        fn_q1 <= fn_q;
        src0Name_q1 <= src0Name_q;
        src1Name_q1 <= src1Name_q;
        dest_weight_Index_q1 <= dest_weight_Index_q;
        dest_interim_Index_q1 <= dest_interim_Index_q;
        dest_pe_bus_Index_q1 <= dest_pe_bus_Index_q;
        dest_pu_bus_Index_q1 <= dest_pu_bus_Index_q;
    end
end
	
//---------------------------- pipeline to match namespace delay -------------------------------- 
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		src_rq_q2 <= {srcLen{1'b0}};
		pe_neigh_data_rq_q2 <= 1'b0;
		pu_neigh_data_rq_q2 <= 1'b0;
		pe_bus_data_rq_q2 <= 1'b0;
		pu_bus_data_rq_q2 <= 1'b0;
		interim_rq_q2 <= 2'b0;
		eoi_q2 <= 1'b0;
	end
	else if(~stall) begin
		src_rq_q2 <= src_rq_q1;
		pe_neigh_data_rq_q2 <= pe_neigh_data_rq_q1;
		pu_neigh_data_rq_q2 <= pu_neigh_data_rq_q1;
		pe_bus_data_rq_q2 <= pe_bus_data_rq_q1;
		pu_bus_data_rq_q2 <= pu_bus_data_rq_q1;
		interim_rq_q2 <= interim_rq_q1;
		eoi_q2 <= eoi_q1;
	end
end
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		dest_weight_wrt_q2 <= 1'b0;
		dest_interim_wrt_q2 <= 1'b0;
		dest_pe_bus_wrt_q2 <= 1'b0;
		dest_pu_bus_wrt_q2 <= 1'b0;
		dest_pe_neigh_wrt_q2 <= 1'b0;
		dest_pu_neigh_wrt_q2 <= 1'b0;
	end
	else if(~stall) begin
		dest_weight_wrt_q2 <= dest_weight_wrt_q1;
		dest_interim_wrt_q2 <= dest_interim_wrt_q1;
		dest_pe_bus_wrt_q2 <= dest_pe_bus_wrt_q1;
		dest_pu_bus_wrt_q2 <= dest_pu_bus_wrt_q1;
		dest_pe_neigh_wrt_q2 <= dest_pe_neigh_wrt_q1;
		dest_pu_neigh_wrt_q2 <= dest_pu_neigh_wrt_q1;
	end
end
always @(posedge clk ) begin
    if(~stall) begin
        fn_q2 <= fn_q1;
        src0Name_q2 <= src0Name_q1;
        src1Name_q2 <= src1Name_q1;
        dest_weight_Index_q2 <= dest_weight_Index_q1;
        dest_interim_Index_q2 <= dest_interim_Index_q1;
        dest_pe_bus_Index_q2 <= dest_pe_bus_Index_q1;
        dest_pu_bus_Index_q2 <= dest_pu_bus_Index_q1;
    end
    interim_rd_addr0_q2<= interim_rd_addr0_q1;
    interim_rd_addr1_q2 <= interim_rd_addr1_q1;
end

//---------------------------- stall generation --------------------------------

assign weight_invalid = 1'b0;//~weight_out_v && src_rq_q1[`NAMESPACE_WEIGHT];
assign data_invalid = ~data_out_v && src_rq_q1[`NAMESPACE_DATA];
assign meta_invalid = 1'b0;//~meta_out_v && src_rq_q1[`NAMESPACE_META];
assign interim_invalid = 1'b0;//(~interim_data_out0_v && interim_rq_q1[0]) || (~interim_data_out1_v && interim_rq_q1[1]);
assign pe_neigh_invalid = (~pe_neigh_data_reg_v && pe_neigh_data_rq_q1 ); 
assign pu_neigh_invalid = (~pu_neigh_data_reg_v && pu_neigh_data_rq_q1 ); 
assign pe_bus_invalid = (~pe_bus_data_in_v && pe_bus_data_rq_q1 ); 
assign pu_bus_invalid = (~pu_bus_data_in_v && pu_bus_data_rq_q1 ); 

assign bus_out_invalid = (dest_pe_bus_wrt_q1 && pe_bus_contention)|| (dest_pu_bus_wrt_q1 && pu_bus_contention);
assign neigh_out_invalid = ( dest_pe_neigh_wrt_q1&& pe_neigh_full_in)|| (dest_pu_neigh_wrt_q1 && pu_neigh_full_in);

assign stall = weight_invalid || data_invalid || meta_invalid || interim_invalid || pe_neigh_invalid || pu_neigh_invalid || pe_bus_invalid || pu_bus_invalid || bus_out_invalid || neigh_out_invalid;
//---------------------------- source mux -------------------------------- 
reg stall_d,stall_d2;
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
       stall_d <= 1'b0;
       stall_d2 <= 1'b0;
   end
   else begin
       stall_d <= stall;
       stall_d2 <= stall_d;
   end
end

assign pe_stall = stall;

always @(posedge clk) begin
    neigh_data_out <= pu_neigh_data_rq_q1 ? pu_neigh_data_reg : pe_neigh_data_reg;
    pe_neigh_data_reg_v_q <= pe_neigh_data_reg_v;
    pu_neigh_data_reg_v_q <= pu_neigh_data_reg_v;
end

always @(posedge clk) 
    bus_data_out <= pu_bus_data_rq_q1 ? pu_bus_data_in : pe_bus_data_in;
always @(posedge clk) begin
    if(~stall_d2) begin
        compute_data_out_d <= compute_data_out;
        compute_data_out_d2 <= compute_data_out_d;
    end
end

op_selector#(
	.LEN                        ( dataLen                   )
)
operand0(
	.sel                        ( src0Name_q2               ),
	.weight                     ( {{dataLen-memDataLen{op_weight_read[memDataLen-1]}},op_weight_read}            ),
	.data                       ( {{dataLen-memDataLen{op_data_read[memDataLen-1]}},op_data_read}              ),
	.alu_out                    ( compute_data_out          ),
	.interim                    ( interim_data_out0         ),
	.meta                       ( {{dataLen-memDataLen{op_meta_read[memDataLen-1]}},op_meta_read}              ),
	.neigh                      ( neigh_data_out            ),
	.bus                        ( bus_data_out              ),
	.out                        ( operand0_data             )
);

op_selector#(
	.LEN                        ( dataLen                   )
)
operand1(
	.sel                        ( src1Name_q2               ),
	.weight                     ( {{dataLen-memDataLen{op_weight_read[memDataLen-1]}},op_weight_read}            ),
	.data                       ( {{dataLen-memDataLen{op_data_read[memDataLen-1]}},op_data_read}              ),
	.alu_out                    ( compute_data_out          ),
	.interim                    ( interim_data_out0         ),
	.meta                       ( {{dataLen-memDataLen{op_meta_read[memDataLen-1]}},op_meta_read}              ),
	.neigh                      ( neigh_data_out            ),
	.bus                        ( bus_data_out              ),
	.out                        ( operand1_data             )
);

reg eoi_q23,alu_on0,interim_on0,interim_on1,alu_on1;
////////////////////////////////////////////////////////////////////
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		dest_weight_wrt_q23 <= 1'b0;
		dest_interim_wrt_q23 <= 1'b0;
		dest_pe_bus_wrt_q23 <= 1'b0;
		dest_pu_bus_wrt_q23 <= 1'b0;
		dest_pe_neigh_wrt_q23 <= 1'b0;
		dest_pu_neigh_wrt_q23 <= 1'b0;
		eoi_q23 <= 1'b0;
		alu_on0 <= 1'b0;
		alu_on1 <= 1'b0;
		operand0_data_r <= {dataLen{1'b0}};
		operand1_data_r <= {dataLen{1'b0}};
	end
	else begin
	        eoi_q23 <= stall_d ? 1'b0 : eoi_q2;
			dest_weight_wrt_q23 <= stall_d ? 1'b0 :dest_weight_wrt_q2;
			dest_interim_wrt_q23 <= stall_d ? 1'b0 :dest_interim_wrt_q2;
			dest_pe_bus_wrt_q23 <= stall_d ? 1'b0 :dest_pe_bus_wrt_q2;
			dest_pu_bus_wrt_q23 <= stall_d ? 1'b0 :dest_pu_bus_wrt_q2;
			dest_pe_neigh_wrt_q23 <= stall_d ? 1'b0 :dest_pe_neigh_wrt_q2;
			dest_pu_neigh_wrt_q23 <= stall_d ? 1'b0 :dest_pu_neigh_wrt_q2;
			operand0_data_r <= operand0_data;
			alu_on0 <= (src0Name_q2 == 3'd1);
			interim_on0 <= (src0Name_q2 == 3'd5) && (interim_rd_addr0_q2 == dest_interim_Index_q3)&&dest_interim_wrt_q3;
			interim_on1 <= (src1Name_q2 == 3'd5) && (interim_rd_addr1_q2 == dest_interim_Index_q3)&&dest_interim_wrt_q3;
			alu_on1 <= (src1Name_q2 == 3'd1);
			operand1_data_r <= operand1_data;
	end
end
always @(posedge clk ) begin
	fn_q23 <= fn_q2;
//	src0Name_q23 <= src0Name_q2;
//	src1Name_q23 <= src1Name_q2;
	dest_weight_Index_q23 <= dest_weight_Index_q2;
	dest_interim_Index_q23 <= dest_interim_Index_q2;
	dest_pe_bus_Index_q23 <= dest_pe_bus_Index_q2;
	dest_pu_bus_Index_q23 <= dest_pu_bus_Index_q2;
end
//////////////////////////////////////////////////////////////////////////
//---------------------------- compute -------------------------------- 
wire [dataLen-1:0] operand0_in,operand1_in;
wire [dataLen-1:0] interim_forwarded;

assign interim_forwarded = compute_data_out_d;
assign operand0_in = alu_on0 ? compute_data_out :(interim_on0 ? interim_forwarded:operand0_data_r);
assign operand1_in = alu_on1 ? compute_data_out :(interim_on1 ? interim_forwarded: operand1_data_r);

pe_compute #(
	.memDataLen                 ( memDataLen                   ),
	.dataLen                    ( dataLen                   ),
	.logNumFn                   ( fnLen                     ),
	.peId            			( peId            ),
	.puId            			( puId            )
) pe_compute_unit (
	.clk            			( clk            			),
	.rstn            			( rstn            			),
	.operand1                   ( operand0_in             ),
	.operand2                   ( operand1_in             ),
    .stall                      ( stall_d2                   ),
	.fn                         ( fn_q23		                ),
	.result                     ( compute_data_out          )
);
//---------------------------- pipeline to match compute delay -------------------------------- 

always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		dest_weight_wrt_q3 <= 1'b0;
		dest_interim_wrt_q3 <= 1'b0;
		dest_pe_bus_wrt_q3 <= 1'b0;
		dest_pu_bus_wrt_q3 <= 1'b0;
		dest_pe_neigh_wrt_q3 <= 1'b0;
		dest_pu_neigh_wrt_q3 <= 1'b0;
		eoi <= 1'b0;
	end
	else begin
	        eoi <= eoi_q23;
			dest_weight_wrt_q3 <= dest_weight_wrt_q23;
			dest_interim_wrt_q3 <= dest_interim_wrt_q23;
			dest_pe_bus_wrt_q3 <= dest_pe_bus_wrt_q23;
			dest_pu_bus_wrt_q3 <= dest_pu_bus_wrt_q23;
			dest_pe_neigh_wrt_q3 <= dest_pe_neigh_wrt_q23;
			dest_pu_neigh_wrt_q3 <= dest_pu_neigh_wrt_q23;
	end
end
always @(posedge clk ) begin
//	fn_q3 <= fn_q23;
//	src0Name_q3 <= src0Name_q23;
//	src1Name_q3 <= src1Name_q23;
	dest_weight_Index_q3 <= dest_weight_Index_q23;
	dest_interim_Index_q3 <= dest_interim_Index_q23;
	dest_pe_bus_Index_q3 <= dest_pe_bus_Index_q23;
	dest_pu_bus_Index_q3 <= dest_pu_bus_Index_q23;
end
//---------------------------- assigning bus outputs --------------------------------
assign pe_neigh_data_out = compute_data_out;
assign pu_neigh_data_out = compute_data_out;
assign pe_bus_data_out = compute_data_out;
assign pu_bus_data_out = compute_data_out;

assign pe_neigh_data_out_v = dest_pe_neigh_wrt_q3;
assign pu_neigh_data_out_v = dest_pu_neigh_wrt_q3;
assign pe_bus_data_out_v = dest_pe_bus_wrt_q3;
assign pe_bus_data_out_addr = dest_pe_bus_Index_q3;
assign pu_bus_data_out_v = dest_pu_bus_wrt_q3;
assign pu_bus_data_out_addr = dest_pu_bus_Index_q3;

assign pe_bus_src_addr = pe_bus_src_index_q;
assign pu_bus_src_addr = pu_bus_src_index_q;
assign pe_bus_src_rq = pe_bus_data_rq_q;
assign pu_bus_src_rq = pu_bus_data_rq_q;

//---------------------------- neigh bus fifo --------------------------------



neigh_fifo #(
	.LEN    (dataLen),
	.DEPTH  (`NEIGH_FIFO_DEPTH),
	.PTR    (`C_LOG_2(`NEIGH_FIFO_DEPTH)),
    .NUM_PIPELINE_STAGES(`NEIGH_PIPELINE_STAGES_PE)
	)
pe_neigh_fifo(
	.clk    		(clk				),
	.rstn   		(rstn				),
	.stall          (stall              ),
	.data_in    	(pe_neigh_data_in	),
	.data_in_valid  (pe_neigh_data_in_v	),
	
	.rd_rqst    	(pe_neigh_data_rq_q	),
	
	.full           (pe_neigh_full      ),
	.data_out   	(pe_neigh_data_reg	),
	.data_out_valid (pe_neigh_data_reg_v)
	);

generate 
if(	peId%numPe == 0 ) begin : pu_neigh
    neigh_fifo #(
        .LEN    (dataLen),
        .DEPTH  (`NEIGH_FIFO_DEPTH),
        .PTR    (`C_LOG_2(`NEIGH_FIFO_DEPTH)),
        .NUM_PIPELINE_STAGES(`NEIGH_PIPELINE_STAGES_PU)
        )
    pu_neigh_fifo(
        .clk    		(clk				),
        .rstn   		(rstn				),
        .stall          (stall              ),
        .data_in    	(pu_neigh_data_in	),
        .data_in_valid  (pu_neigh_data_in_v	),
        
        .rd_rqst    	(pu_neigh_data_rq_q	),
        
        .full           (pu_neigh_full      ),
        .data_out   	(pu_neigh_data_reg	),
        .data_out_valid (pu_neigh_data_reg_v)
        );
end
else begin
    assign pu_neigh_full = 1'b0;
    assign pu_neigh_data_reg_v = 1'b1;
    assign pu_neigh_data_reg = {dataLen{1'b0}};
end
endgenerate	
always @(posedge clk or negedge rstn)
    if(~rstn) begin
        pe_bus_data_in_v_q <= 1'b0;
        pu_bus_data_in_v_q <= 1'b0;
    end
    else begin
        pe_bus_data_in_v_q <= pe_bus_data_in_v || (pe_bus_data_in_v_q && stall);
        pu_bus_data_in_v_q <= pu_bus_data_in_v || (pu_bus_data_in_v_q && stall);
    end
endmodule
