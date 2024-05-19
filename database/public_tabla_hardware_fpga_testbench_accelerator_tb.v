// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module  accelerator_tb;
	// ******************************************************************
	// PARAMETERS
	// ******************************************************************
	localparam logNumPu					= 3;
	localparam logNumPe					= 3;
	localparam memDataLen				= 16;  //width of the data coming from the memory
	localparam dataLen					= 16;
	localparam indexLen					= 8; 
    localparam logMemNamespaces       	= 2;  //instruction, data, weight, meta
    localparam logNumMemLanes			= 4;	
    
	localparam numPe                 	= 1 << logNumPe;
    localparam numPu                 	= 1 << logNumPu; 
    localparam peBusIndexLen         	= logNumPe + 1;
    localparam gbBusIndexLen         	= logNumPu + 1;
    localparam numMemLanes				= 1 << logNumMemLanes;
    localparam numPuMemLanes 			= numMemLanes/numPu;
    localparam logNumPeMemLanes			= logNumPu + logNumPe - logNumMemLanes;
    localparam memCtrlIn				= logMemNamespaces + (logNumPeMemLanes+1)*numMemLanes;
    
	reg reset;
	reg clk;
	reg start;
	reg eoc;
	reg mem_rd_wrt;
	reg [memCtrlIn - 1 : 0] 				mem_ctrl_in;

    reg [memDataLen*numMemLanes - 1 : 0] 	mem_data_input;
    wire [memDataLen*numMemLanes - 1 : 0]  	mem_data_output;
    
    wire                            		eol;

	accelerator #(
		.logNumPu(logNumPu),
		.logNumPe(logNumPe),
		.memDataLen(memDataLen),  //width of the data coming from the memory
		.dataLen(dataLen),
		.indexLen(indexLen),
    	.logMemNamespaces(logMemNamespaces)  //instruction, data, weight, meta
	)
	accelerator_unit(
    	.clk(clk),
    	.reset(reset),
    	.start(start),
    	.eoc(eoc),
    	.mem_rd_wrt(mem_rd_wrt),
   	 	.mem_ctrl_in(mem_ctrl_in),
    	.mem_data_input(mem_data_input),
    	.mem_data_output(mem_data_output),
    	.eol(eol)
	);
	
	
	always #5 clk = ~clk;

	initial
    begin
        $dumpfile("hw-imp/bin/waveform/accelerator_tb.vcd");
        $dumpvars(0,accelerator_tb);
    end
    
    
   	initial begin
   	clk = 0;
   	reset = 1;
   	start = 0;
   	mem_rd_wrt = 0;

	#20
	reset = 0;
	mem_ctrl_in = 50'b00100100100100100100100100100100100100100100100110; 
	mem_data_input = 256'h0001000100010001000100010001000100010001000100010001000100010001;
	
	#10
	mem_ctrl_in = 50'b01101101101101101101101101101101101101101101101110; 
	mem_data_input = 256'h0001000100010001000100010001000100010001000100010001000100010001;
	
	#10
	mem_ctrl_in = 50'b10110110110110110110110110110110110110110110110110; 
	mem_data_input = 256'h0001000100010001000100010001000100010001000100010001000100010001;
	
	#10
	mem_ctrl_in = 50'b11111111111111111111111110; 
	mem_data_input = 256'h000100010001000100010001000100010001000100010001000100010001;
	
	#10
	mem_ctrl_in = 50'b00100100100100100100100100100100100100100100100101; 
	mem_data_input = 256'h0002000200020002000200020002000200020002000200020002000200020002;
	
	#10
	mem_ctrl_in = 50'b01101101101101101101101101101101101101101101101101; 
	mem_data_input = 256'h0002000200020002000200020002000200020002000200020002000200020002;
	
	#10
	mem_ctrl_in = 50'b10110110110110110110110110110110110110110110110101; 
	mem_data_input = 256'h0002000200020002000200020002000200020002000200020002000200020002;
	
	#10
	mem_ctrl_in = 50'b11111111111111111111111101; 
	mem_data_input = 256'h000200020002000200020002000200020002000200020002000200020002;
	
	#10 
	mem_ctrl_in = 50'b000;
  	mem_data_input = 256'b0000000000000000;
  	
	
	#10 start = 1;
	
	#10
	start = 0;
	
	#1000 
	eoc  = 1;
	
	#10
	eoc = 0;
	
	#10
	mem_ctrl_in = 50'b00100100100100100100100100100100100100100100100110; 
	mem_data_input = 256'h0003000300030003000300030003000300030003000300030003000300030003;
	
	#10
	mem_ctrl_in = 50'b01101101101101101101101101101101101101101101101110; 
	mem_data_input = 256'h0003000300030003000300030003000300030003000300030003000300030003;
	
	#10
	mem_ctrl_in = 50'b10110110110110110110110110110110110110110110110110; 
	mem_data_input = 256'h0003000300030003000300030003000300030003000300030003000300030003;
	
	#10
	mem_ctrl_in = 50'b11111111111111111111111110; 
	mem_data_input = 256'h0003000300030003000300030003000300030003000300030003000300030003;
	
	#10
	mem_ctrl_in = 50'b00100100100100100100100100100100100100100100100101; 
	mem_data_input = 256'h0004000400040004000400040004000400040004000400040004000400040004;
	
	#10
	mem_ctrl_in = 50'b01101101101101101101101101101101101101101101101101; 
	mem_data_input = 256'h0004000400040004000400040004000400040004000400040004000400040004;
	
	#10
	mem_ctrl_in = 50'b10110110110110110110110110110110110110110110110101; 
	mem_data_input = 256'h0004000400040004000400040004000400040004000400040004000400040004;
	
	#10
	mem_ctrl_in = 50'b11111111111111111111111101; 
	mem_data_input = 256'h000400040004000400040004000400040004000400040004000400040004;
	
	#10 
	mem_ctrl_in = 50'b000;
  	mem_data_input = 256'b0000000000000000;
  	
	
	#10 start = 1;
	
	#10
	start = 0;
	
	/* #1000
	mem_ctrl_in = 50'b00100100100100100100100100100100100100100100100101; 
	mem_data_input = 256'h0002000200020002000200020002000200020002000200020002000200020002;
	
	#10
	mem_ctrl_in = 50'b01101101101101101101101101101101101101101101101101; 
	mem_data_input = 256'h0002000200020002000200020002000200020002000200020002000200020002;
	
	#10
	mem_ctrl_in = 50'b10110110110110110110110110110110110110110110110101; 
	mem_data_input = 256'h0002000200020002000200020002000200020002000200020002000200020002;
	
	#10
	mem_ctrl_in = 50'b11111111111111111111111101; 
	mem_data_input = 256'h000200020002000200020002000200020002000200020002000200020002;
	
	#10
	mem_rd_wrt = 0;
	mem_ctrl_in = 50'b0;
	mem_data_input = 256'b0000000000000000;
	
	#10
	start = 1;
	
	#10 
	start = 0;*/
	

	/*mem_ctrl_in = 50'b00100100100101; 
	mem_data_input = 256'h0162000900060012;
	
	#10
	mem_ctrl_in = 50'b0; 
	
	#10
	start = 1;
	
	#10 
	start = 0;
	
	#305
	mem_rd_wrt = 1;
	mem_ctrl_in = 50'b00100100100; 
	
	#10
	mem_rd_wrt = 0;
	mem_ctrl_in = 50'b0; */

	#1000
	$finish;
	
	end
endmodule
