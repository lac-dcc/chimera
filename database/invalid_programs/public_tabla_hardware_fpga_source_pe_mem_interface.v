`timescale 1ns/1ps
`ifdef FPGA
	`include "inst.vh"
	`include "log.vh"
`endif

module pe_mem_interface #(
    parameter peId = 0,
	parameter logNumPe = 3,
	parameter logNumPu = 3,
	parameter dataLen = 16,
	parameter instLen = 69,	
	parameter indexLen = 6,
	parameter dataAddrLen = 5,
	parameter weightAddrLen = 5,
	parameter metaAddrLen = 2,
	parameter logMemNamespaces = 2, //instruction, data, weight, meta
	parameter memDataLen = 16,
	parameter logNumPeMemLanes	= 2
)(
	clk, 
	reset,
	
	//from the Memory
	//--------------------------------------------------------------------------------------
	eoc,
	mem_wrt_valid,
	mem_weight_rd_valid,
	peId_mem_in,
	mem_data_type,
	mem_data_input,
	mem_data_output,
	
	//From the PE to Memory
	//--------------------------------------------------------------------------------------
	inst_restart,
//	pe_inst_fifo_full,
	pe_namespace_weight_out,
	weight_read_back_addr,
	pe_namespace_wrt_done,
	
	//To the PE Namespace
	//--------------------------------------------------------------------------------------
	pe_namespace_data_wrt,
	data_wrt_addr,
	
	pe_namespace_data,
	
	pe_namespace_weight_wrt,
	weight_wrt_addr,
	
	pe_namespace_meta_wrt,
	meta_wrt_addr
);
	//--------------------------------------------------------------------------------------
	
	
	localparam dataRemainder 		= (dataLen%memDataLen > 0); 
    localparam countEntireData		= dataLen/memDataLen + dataRemainder; 
    localparam logCountEntireData   = `C_LOG_2 (countEntireData);
    
    localparam instRemainder 		= (instLen%memDataLen > 0); 
    localparam countEntireInst		= instLen/memDataLen + instRemainder;
//  localparam instLogRemainder 	= countEntireInst/(1 << `C_LOG_2 (countEntireInst)) > 0;
    localparam logCountEntireInst   = `C_LOG_2 (countEntireInst);
    
	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	input clk;
	input reset;
	
	input eoc;
	input mem_wrt_valid;
	input mem_weight_rd_valid;
	input [logNumPeMemLanes - 1 : 0] peId_mem_in;

	input [logMemNamespaces - 1 : 0] mem_data_type;
	input [dataLen - 1 : 0] mem_data_input;
	output[dataLen - 1 : 0] mem_data_output;
	
	input inst_restart;
	input [dataLen - 1 : 0] pe_namespace_weight_out;
	output[weightAddrLen - 1 : 0] weight_read_back_addr;
	output reg  pe_namespace_wrt_done;

	output reg  pe_namespace_data_wrt;
	output wire [dataAddrLen - 1 : 0] data_wrt_addr;
	
	output reg  [dataLen - 1 : 0] pe_namespace_data;
	
	output reg  pe_namespace_weight_wrt;
	output wire [weightAddrLen - 1 : 0] weight_wrt_addr;
	
	output reg  pe_namespace_meta_wrt;
	output wire [metaAddrLen - 1 : 0] meta_wrt_addr;
	//--------------------------------------------------------------------------------------
	
	wire mem_wrt;
	assign mem_wrt = (peId_mem_in == peId[(logNumPe+logNumPu)-1-:logNumPeMemLanes]) && mem_wrt_valid;
	
	wire mem_weight_rd;
	assign mem_weight_rd = (peId_mem_in == peId[(logNumPe+logNumPu) - 1-: logNumPeMemLanes]) && mem_weight_rd_valid;
	
	reg mem_weight_rd_d;
	always @(posedge clk) mem_weight_rd_d = mem_weight_rd;
		
	assign mem_data_output = mem_weight_rd_d ? pe_namespace_weight_out : {memDataLen{1'b0}};
	wire [3:0] extra;	
	//--------------------------------------------------------------------------------------
	Cnter #(.len(dataAddrLen+1)) 
	dataWrtPntr(
		.clk(clk),
		.reset(reset),
 		.wrt(inst_restart || eoc),
		.cnt(pe_namespace_data_wrt),
		.dataIn({dataAddrLen+1{1'b0}}),
		.dataOut({extra[0],data_wrt_addr})
	);
	
	//--------------------------------------------------------------------------------------
	Cnter #(.len(weightAddrLen+1)) 
	weightWrtPntr(
		.clk(clk),
		.reset(reset),
		.wrt(eoc),
		.cnt(pe_namespace_weight_wrt),
		.dataIn({weightAddrLen+1{1'b0}}),
		.dataOut({extra[1],weight_wrt_addr})
	);
		
	Cnter #(.len(weightAddrLen+1)) 
	weightRdPntr(
		.clk(clk),
		.reset(reset),
		.wrt(eoc),
		.cnt(mem_weight_rd),
		.dataIn({weightAddrLen+1{1'b0}}),
		.dataOut({extra[2],weight_read_back_addr})
	);
	
	//--------------------------------------------------------------------------------------
	Cnter #(.len(metaAddrLen+1)) 
	metaWrtPntr(
		.clk(clk),
		.reset(reset),
		.wrt(eoc),
		.cnt(pe_namespace_meta_wrt),
		.dataIn({metaAddrLen+1{1'b0}}),
		.dataOut({extra[3],meta_wrt_addr})
	);

	//--------------------------------------------------------------------------------------
	
    //collect the instruction parts coming from the memory
	//--------------------------------------------------------------------------------------
/*	wire [memDataLen*countEntireInst - 1 : 0 ] instRegCollectIn;
	wire [logCountEntireInst - 1 : 0 ] instCntOut;
	
	genvar i;
	generate
		if(countEntireInst > 1) begin
			wire [memDataLen*countEntireInst - 1 : 0 ] instRegCollectOut;
			Cnter #(.len(logCountEntireInst))
			instCntr(
				.clk(clk),
				.reset(reset || (instCntOut == countEntireInst-1)),
				.wrt(1'b0),
				.cnt(mem_wrt),
				.dataIn({logCountEntireInst{1'b0}}),
				.dataOut(instCntOut)
			);
			for (i = 0; i < countEntireInst ; i = i + 1) begin: instCollectLoop
				register#(.LEN(memDataLen))
    			instRegCollectRegister
				(
					.clk(clk), 
					.dataIn(mem_data_input),
					.dataOut(instRegCollectOut[i*memDataLen+:memDataLen]),
					.reset(reset),
					.wrEn(mem_wrt && (instCntOut == i))
				);
			end
			
			assign instRegCollectIn = {mem_data_input,instRegCollectOut[memDataLen*(countEntireInst-1) - 1 : 0]};
		end
		else begin
			assign instRegCollectIn = mem_data_input;
			assign instCntOut = 0;
		end
	endgenerate*/
	//--------------------------------------------------------------------------------------

    //collect the data parts coming from memory
	//--------------------------------------------------------------------------------------
	wire [memDataLen*countEntireData - 1 : 0 ] dataRegCollectIn;
	wire [logCountEntireData - 1 : 0 ] dataCntOut;

	genvar j;
	generate
	if(countEntireData > 1) begin
		wire [memDataLen*countEntireData - 1 : 0 ] dataRegCollectOut;
	
		Cnter #(.len(logCountEntireData)) 
		dataCntr(
			.clk(clk),
			.reset(reset || (dataCntOut == countEntireData - 1)),
			.wrt(1'b0),
			.cnt(mem_wrt),
			.dataIn(),
			.dataOut(dataCntOut)
		);
		
		for (j = 0; j < countEntireData ; j = j + 1) begin: dataCollectLoop
			register#(.LEN(memDataLen*countEntireData))
    		dataRegCollectRegister
			(
				.clk(clk), 
				.dataIn(mem_data_input),
				.dataOut(dataRegCollectOut[j*memDataLen+:memDataLen]),
				.reset(reset),
				.wrEn(mem_wrt && (dataCntOut == j))
			);
		end
		//assign dataRegCollectIn[memDataLen*j+: memDataLen] = (dataCntOut == countEntireData-1) ? mem_data_input : dataRegCollectOut[memDataLen*j+: memDataLen];      //
		assign dataRegCollectIn = {mem_data_input,dataRegCollectOut[memDataLen*(countEntireData-1) - 1 : 0]};
	end
	else begin
		assign dataCntOut = 0;
		assign dataRegCollectIn = mem_data_input;
	end
	endgenerate
	
	//--------------------------------------------------------------------------------------

	always @(posedge clk) begin
		case (mem_data_type)
			/* `NAMESPACE_MEM_INST : begin
				pe_namespace_weight_wrt <= 0;
				pe_namespace_data_wrt <= 0;
				pe_namespace_meta_wrt <= 0;
				if(instCntOut == countEntireInst - 1) begin
					pe_namespace_inst_wrt <= mem_wrt; 
					pe_namespace_wrt_done <= mem_wrt;
					pe_namespace_inst <= mem_wrt ? instRegCollectIn[instLen - 1 : 0] : 0;
				end
				else  begin
					pe_namespace_inst_wrt <= 0; 
					pe_namespace_wrt_done <=0;
					pe_namespace_inst <= 0;
				end
			end*/
			 
			`NAMESPACE_MEM_DATA : begin
				pe_namespace_weight_wrt <= 0;
				pe_namespace_meta_wrt <= 0;
				if(dataCntOut == countEntireData - 1) begin
					pe_namespace_data_wrt <= mem_wrt; 
					pe_namespace_wrt_done <= mem_wrt;
					pe_namespace_data <= mem_wrt ? dataRegCollectIn[dataLen - 1 : 0] : 0;
				end
				else  begin
					pe_namespace_wrt_done <= 0;
					pe_namespace_data  <= 0;
					pe_namespace_data_wrt <= 0;
				end
			end
		
			`NAMESPACE_MEM_WEIGHT : begin
				pe_namespace_data_wrt <= 0;
				pe_namespace_meta_wrt <= 0;
				if(dataCntOut == countEntireData - 1) begin
					pe_namespace_weight_wrt <= mem_wrt; 
					pe_namespace_wrt_done <= mem_wrt;
					pe_namespace_data <= mem_wrt ? dataRegCollectIn[dataLen - 1 : 0] : 0;
				end
				else  begin
					pe_namespace_wrt_done <= 0;
					pe_namespace_data  <= 0;
					pe_namespace_weight_wrt <= 0;
				end
			end  
			  
			`NAMESPACE_MEM_META: begin
				pe_namespace_weight_wrt <= 0;
				pe_namespace_data_wrt <= 0;
				if(dataCntOut == countEntireData - 1) begin
					pe_namespace_meta_wrt <= mem_wrt; 
					pe_namespace_wrt_done <= mem_wrt;
					pe_namespace_data <= mem_wrt ? dataRegCollectIn[dataLen - 1 : 0] : 0;
				end
				else  begin
					pe_namespace_wrt_done <=0;
					pe_namespace_data  <= 0;
					pe_namespace_meta_wrt <= 0;
				end
			end

			default begin
				pe_namespace_data_wrt <= 0;
				pe_namespace_weight_wrt <= 0;
				pe_namespace_meta_wrt <= 0;
				pe_namespace_wrt_done <= 0;
			end
		endcase
	end
	//--------------------------------------------------------------------------------------

endmodule

