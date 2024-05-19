// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"
	`include "config.vh"
`endif

module pe_empty 
#(
	//--------------------------------------------------------------------------------------
	parameter peId 					= 0,
	parameter puId					= 0,
	parameter logNumPe				= 3,
	parameter logNumPu				= 0,
	parameter memDataLen			= 16,
	parameter logMemNamespaces      = 2,  //number of namespaces written by memory (instruction, data, weight, meta)

    parameter indexLen              = 8,  //index len of the src and destinations in the instruction 
    parameter dataLen               = 16,
    parameter logNumPeMemLanes		= 2,
    parameter peBusIndexLen         = logNumPe + 1,
    parameter gbBusIndexLen         = logNumPu + 1
	//--------------------------------------------------------------------------------------
) (
	//--------------------------------------------------------------------------------------
    input  wire                             clk,
  input  wire                             reset,
  
  input  wire                               start,
  input  wire                eoc,
  
  //coming from memory to PE
  input  wire                             mem_wrt_valid,
  input  wire                mem_weight_rd_valid,
  
  input  wire  [logNumPeMemLanes - 1 : 0]  peId_mem_in,
  input  wire [logMemNamespaces - 1  : 0] mem_data_type,
  
  //going in and out of memory
  input  wire [memDataLen - 1 : 0]        mem_data_input,
  output wire [memDataLen - 1 : 0]        mem_data_output,
  
  //going to memory from PE
  output wire                inst_eol,
  
  input  wire [dataLen - 1 : 0]           pe_neigh_data_in,
  input  wire                             pe_neigh_data_in_v,
  
  input  wire [dataLen - 1 : 0]           pu_neigh_data_in,
  input  wire                             pu_neigh_data_in_v,
  
  input  wire [dataLen - 1 : 0]           pe_bus_data_in,
  input  wire                             pe_bus_data_in_v,
  
  input  wire [dataLen - 1 : 0]           gb_bus_data_in,
  input  wire                             gb_bus_data_in_v,
  
  output wire [dataLen - 1 : 0]           pe_neigh_data_out,
  output wire                             pe_neigh_data_out_v,
  
  output wire [dataLen - 1 : 0]           pu_neigh_data_out,
  output wire                             pu_neigh_data_out_v,
  
  output wire [dataLen - 1 : 0]           pe_bus_data_out,
  output wire [peBusIndexLen - 1 : 0]     pe_bus_data_out_v,
  input  wire               pe_bus_contention,               
  
  output wire [peBusIndexLen - 2 : 0]     pe_bus_src_addr,
  output wire                             pe_bus_src_rq,
  
  output wire [gbBusIndexLen - 2 : 0]     gb_bus_src_addr,
  output wire                             gb_bus_src_rq,

  output wire [dataLen - 1 : 0]           gb_bus_data_out,
  output wire [gbBusIndexLen - 1 : 0]     gb_bus_data_out_v,
  input  wire               gb_bus_contention
	//----------------------------------------------------------------------------------------
);

	localparam destNum               = 3;
    localparam srcNum                = 3;
    localparam fnLen                 = 3;
    localparam nameLen               = 3;
    
    localparam instAddrLen           = `INDEX_INST;
    localparam dataAddrLen           = `C_LOG_2(`DATA_MEM_SIZE);
    localparam weightAddrLen         = `C_LOG_2(`WEIGHT_MEM_SIZE);
    localparam metaAddrLen           = `INDEX_META;
    localparam interimAddrLen        = `C_LOG_2(`INTERIM_MEM_SIZE);
  
	localparam instLen               = fnLen + nameLen*destNum + nameLen*srcNum + indexLen*(destNum+srcNum);



	/*initial begin
		$display ("peId %d", peId);
	end*/
    

	assign mem_data_output = {memDataLen{1'b0}};
	assign inst_eol = 1'b1;
	
    assign pe_neigh_data_out 	= pe_neigh_data_out ;	 
    assign pe_neigh_data_out_v 	= pe_neigh_data_out_v ;	
                                                       
    assign pu_neigh_data_out 	= pu_neigh_data_out ;	
    assign pu_neigh_data_out_v 	= pu_neigh_data_out_v; 	
                                                       
    assign pe_bus_data_out 	= pe_bus_data_out ;	
    assign pe_bus_data_out_v 	= pe_bus_data_out_v; 						
                                                       
    assign gb_bus_data_out 	= gb_bus_data_out ;	
    assign gb_bus_data_out_v 	= gb_bus_data_out_v;	 	

endmodule
