`timescale 1ns/1ps
`include "inst.vh"

module pe_tb;
	// ******************************************************************
	// PARAMETERS
	// ******************************************************************
	parameter peId 					= 0;
	parameter logNumPe				= 3;
	parameter logNumPu				= 0;
	parameter memDataLen			= 16;
	parameter logMemNamespaces      = 2;  //number of namespaces written by memory (instruction, data, weight, meta)

    parameter indexLen              = 8;  //index len of the src and destinations in the instruction 
    parameter dataLen               = 16;
    
    localparam peBusIndexLen         = logNumPe + 1;
    localparam gbBusIndexLen         = logNumPu + 1;
    
    parameter logNumPeMemColumn		= 2;
	// ******************************************************************

	// ******************************************************************
	// Wires and Regs
	// ******************************************************************
	reg                             clk;
    reg                             reset;
    
    reg								start;
    
    //coming from memory to PE
    reg								mem_weight_rd_valid;
    reg                            	mem_wrt_valid;
    reg [logNumPeMemColumn - 1 : 0]	peId_mem_in;
    reg [logMemNamespaces - 1 : 0]  mem_data_type;
    
    //going in and out of memory
    reg  [memDataLen - 1 : 0]       mem_data_in;
	wire [memDataLen - 1 : 0]		mem_data_out;
    
    //going to memory from PE
    wire                             inst_eol;
    
    reg [dataLen - 1 : 0]           pe_neigh_data_in;
    reg                             pe_neigh_data_in_v;
    
    reg [dataLen - 1 : 0]           pu_neigh_data_in;
    reg                     		pu_neigh_data_in_v;
    
    reg [dataLen - 1 : 0]           pe_bus_data_in;
    reg                             pe_bus_data_in_v;
    
    reg [dataLen - 1 : 0]           gb_bus_data_in;
    reg                             gb_bus_data_in_v;
    
    wire [dataLen - 1 : 0]           pe_neigh_data_out;
    wire                             pe_neigh_data_out_v;
    
    wire [dataLen - 1 : 0]           pu_neigh_data_out;
    wire                             pu_neigh_data_out_v;
    
    wire [dataLen - 1 : 0]           pe_bus_data_out;
    wire [peBusIndexLen - 1 : 0]     pe_bus_data_out_v;
    
    wire [dataLen - 1 : 0]           gb_bus_data_out;
    wire [gbBusIndexLen - 1 : 0]     gb_bus_data_out_v;
	// ******************************************************************
	
	pe #(
	//--------------------------------------------------------------------------------------
	.peId(peId),
	.logNumPe(logNumPe),
	.logNumPu(logNumPu),
	.memDataLen(memDataLen),
	.logMemNamespaces(logMemNamespaces),  

    .indexLen(indexLen), 
    .dataLen(dataLen)
	//--------------------------------------------------------------------------------------
	) 
	pe_unit(
	//--------------------------------------------------------------------------------------
    .clk(clk),
    .reset(reset),
    
    .start(start),
    
    .mem_weight_rd_valid (mem_weight_rd_valid),
   	.mem_wrt_valid(mem_wrt_valid),
    .peId_mem_in(peId_mem_in),
    .mem_data_type(mem_data_type),
    
    .mem_data_input(mem_data_in),
    .mem_data_output(mem_data_out),
    
    .inst_eol(inst_eol),
    
    .pe_neigh_data_in(pe_neigh_data_in),
    .pe_neigh_data_in_v(pe_neigh_data_in_v),
    
    .pu_neigh_data_in(pu_neigh_data_in),
    .pu_neigh_data_in_v(pu_neigh_data_in_v),
    
    .pe_bus_data_in(pe_bus_data_in),
    .pe_bus_data_in_v(pe_bus_data_in_v),
    
    .gb_bus_data_in(gb_bus_data_in),
    .gb_bus_data_in_v(gb_bus_data_in_v),
    
    .pe_neigh_data_out(pe_neigh_data_out),
    .pe_neigh_data_out_v(pe_neigh_data_out_v),
    
    .pu_neigh_data_out(pu_neigh_data_out),
    .pu_neigh_data_out_v(pu_neigh_data_out_v),
    
    .pe_bus_data_out(pe_bus_data_out),
    .pe_bus_data_out_v(pe_bus_data_out_v),
    
    .gb_bus_data_out(gb_bus_data_out),
    .gb_bus_data_out_v(gb_bus_data_out_v)
	//----------------------------------------------------------------------------------------
);	
	
	always #5 clk = ~clk;

	initial
    begin
        $dumpfile("hw-imp/bin/waveform/pe_tb.vcd");
        $dumpvars(0,pe_tb);
    end
    
    initial begin
   	clk = 1;
   	reset = 1;
   	start = 0;
   	mem_weight_rd_valid = 0;

	#11
	reset = 0;
	mem_wrt_valid = 1;
	peId_mem_in = 0;
//	mem_data_type = 0;
    start = 0;
    
    //coming from memory to PE
   	pe_neigh_data_in = 'hdd;
    pe_neigh_data_in_v = 0 ;
    
   	pu_neigh_data_in = 'hdd;
    pu_neigh_data_in_v = 0;
    
    pe_bus_data_in = 'hdd;
    pe_bus_data_in_v = 0;
    
    gb_bus_data_in = 'hdd;
    gb_bus_data_in_v = 0;
    /* 
    mem_data_in = 16'b0000000000000000;
	
	#10 mem_data_in = 16'b0100000000010000;
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0000000000000000;
	#10	mem_data_in	= 16'b01010;
	
	#10 mem_data_in = 16'b0000100000000000;
	#10 mem_data_in = 16'b0100000001010000;
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0000000010000000;
	#10	mem_data_in	= 16'b00010;
	
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0100000010101000;
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0000000100000000;
	#10	mem_data_in	= 16'b01010;
	
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0100000010101000;
	#10 mem_data_in = 16'b0000000000000000;
	#10 mem_data_in = 16'b0000000100000000;
	#10	mem_data_in	= 16'b01010;
	#10*/
	
 	#10	mem_data_type = 1;
		mem_data_in = 16'h12;
		
	#10 mem_data_type = 2;
		mem_data_in = 16'h34;
	
	#10 mem_data_type = 1;
		mem_data_in = 16'h56;
		
	#10 mem_data_type = 2;
		mem_data_in = 16'h78;
	
	#10 mem_data_type = 2;
		mem_data_in = 16'h9A;
	
	#10 mem_data_type = 3;
		mem_data_in = 16'h12;
	
	#10 
	mem_wrt_valid = 0;
	start = 1;
	
	#10
	start = 0;
	
	
	#100 
	start = 1;
	
	#10 
	start = 0;
	
	#300
	$finish;
	
	end
endmodule
