module  pu_tb;
	// ******************************************************************
	// PARAMETERS
	// ******************************************************************
	localparam puId 					= 0;
	localparam logNumPu					= 3;
	localparam logNumPe					= 3;
	localparam memDataLen				= 16;  //width of the data coming from the memory
	localparam dataLen					= 16;
	localparam indexLen					= 8; 
    localparam logMemNamespaces       	= 2;  //instruction, data, weight, meta
    parameter numPuMemColumns			= 2;
    localparam logNumPeMemColumn 		= 2;
    
	localparam numPe                 	= 1 << logNumPe;
    localparam numPu                 	= 1 << logNumPu; 
    localparam peBusIndexLen         	= logNumPe + 1;
    localparam gbBusIndexLen         	= logNumPu + 1;
    localparam memDataLenIn				= memDataLen*numPuMemColumns;
    localparam memCtrlIn				= (logNumPeMemColumn+1)*numPuMemColumns;
    
    
	reg reset;
	reg clk;
	reg start;
	reg [memCtrlIn - 1: 0]				ctrl_mem_in;
	reg [logMemNamespaces - 1 : 0 ] 	mem_data_type;
	reg [memDataLenIn - 1 : 0] 			mem_data_input;
	wire [memDataLen*numPe - 1 : 0] 	mem_data_output;
	
	reg [dataLen - 1 : 0]				pu_neigh_data_in;
   	reg									pu_neigh_data_in_v;
    	
	reg [dataLen - 1 : 0 ] 				gb_bus_data_in;
   	reg 								gb_bus_data_in_v;
   	
   	reg 								gb_bus_contention;
   	
   	wire 								inst_eol;
   	wire								inst_eoc;
	
	wire [dataLen - 1 : 0 ] 			pu_neigh_data_out;
    wire 								pu_neigh_data_out_v;
	
	wire [dataLen - 1 : 0 ] 			gb_bus_data_out;
   	wire [gbBusIndexLen - 1 : 0] 		gb_bus_data_out_v;


	pu #(
		.puId(puId),
		.logNumPu(logNumPu),
		.logNumPe(logNumPe),
		.memDataLen(memDataLen),  //width of the data coming from the memory
		.dataLen(dataLen),
		.indexLen(indexLen),
    	.logMemNamespaces(logMemNamespaces),  //instruction, data, weight, meta
    	.logNumPeMemColumn(logNumPeMemColumn)
	)
	pu_unit (
		.clk(clk),
		.reset(reset),
		.start(start),
		.ctrl_mem_in(ctrl_mem_in),
		.mem_data_type(mem_data_type),
		.mem_data_input(mem_data_input),
		.mem_data_output(mem_data_output),
	
		.pu_neigh_data_in(pu_neigh_data_in),
   		.pu_neigh_data_in_v(pu_neigh_data_in_v),
    	
		.gb_bus_data_in(gb_bus_data_in),
   		.gb_bus_data_in_v(gb_bus_data_in_v),
   	
   		.inst_eol(inst_eol),
   		.inst_eoc(inst_eoc),
   		.gb_bus_contention(gb_bus_contention),
	
		.pu_neigh_data_out(pu_neigh_data_out),
   		.pu_neigh_data_out_v(pu_neigh_data_out_v),
	
		.gb_bus_data_out(gb_bus_data_out),
    	.gb_bus_data_out_v(gb_bus_data_out_v)
	);
	
	
	always #5 clk = ~clk;

	initial
    begin
        $dumpfile("hw-imp/bin/waveform/pu_tb.vcd");
        $dumpvars(0,pu_tb);
    end
    
    
   	initial begin
   	clk = 0;
   	reset = 1;
   	start = 0;

	#10
	reset = 0;
	ctrl_mem_in = 6'b1;
	mem_data_type = 0;
    
    //coming from memory to PE
   	pu_neigh_data_in = 'hdd;
    pu_neigh_data_in_v = 0;
    
    gb_bus_data_in = 'hdd;
    gb_bus_data_in_v = 0;
    
    mem_data_input = 16'b0000000000000000;
    gb_bus_contention = 0;
	
	#10 mem_data_input = 16'b0100000000010000;
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b0000000000000000;
	#10	mem_data_input	= 16'b01010;
	
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b0100000001000000;
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b0000000010000000;
	#10	mem_data_input	= 16'b00010;
	
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b0100000010101000;
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b0000000100000000;
	#10	mem_data_input	= 16'b01010;
	
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b0000000010110000;
	#10 mem_data_input = 16'b0001111000001101;
	#10 mem_data_input = 16'b0000000111100000;
	#10	mem_data_input	= 16'b01010;
	
	#10 mem_data_type = 1;
		mem_data_input = 16'h12;
		
	#10 mem_data_type = 2;
		mem_data_input = 16'h34;
	
	#10 mem_data_type = 1;
		mem_data_input = 16'h56;
		
	#10 mem_data_type = 2;
		mem_data_input = 16'h78;
	
	#10 mem_data_type = 2;
		mem_data_input = 16'h9A;
	
	#10 mem_data_type = 3;
		mem_data_input = 16'h12;
	
	#10 ctrl_mem_in = 6'b11;
		mem_data_type = 0;
		mem_data_input = 16'b0000000000000000;
		
	#10 mem_data_input = 16'b0100000000010000;
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b0000000001100000;
	#10	mem_data_input	= 16'b01110;
	
	
	#10 mem_data_type = 1;
		mem_data_input  = 3;
		
	#10 mem_data_type = 2;
		mem_data_input  = 18;
	
	#10 ctrl_mem_in = 6'b111;
		mem_data_type = 0;
		mem_data_input = 16'b0000000000000000;
		
	#10 mem_data_input = 16'b1000000000111000;
	#10 mem_data_input = 16'b0000000000000000;
	#10 mem_data_input = 16'b000000000000000;
	#10	mem_data_input	= 16'b00110;
	
	#10 mem_data_type = 1;
		mem_data_input  = 121;
	
		
	#10 ctrl_mem_in = 6'b0;
	start = 1;
	
	#10
	start = 0;
	
	#100
	$finish;
	
	end
endmodule
