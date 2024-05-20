// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230916

`default_nettype none
module ROM #(
	parameter ADDRESS_WIDTH = 16,
	parameter DATA_WIDTH    = 8,
	parameter MEMORY_DEPTH  = 2**ADDRESS_WIDTH,
	parameter MEMORY_FILE   = "data.mem"
)(
	input wire Clock,
	input wire Reset,
	input wire ReadEnable_i,
	input wire [ADDRESS_WIDTH-1:0] Address_i,
	output reg [   DATA_WIDTH-1:0] Data_o
);
	
	// Create the memory array
	reg [DATA_WIDTH-1:0] Memory [0:MEMORY_DEPTH-1] /* synthesis syn_romstyle = "EBR" */;
	
	// Check memory depth and address space
	initial begin
		if(MEMORY_DEPTH > 2**ADDRESS_WIDTH)
			$fatal(0, "Required memory depth is larger than address space");
	end
	
	// Initialize memory with values from a file
	initial begin
		$readmemh(MEMORY_FILE, Memory);
	end
	
	// Memory logic
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			Data_o <= 0;
		else if(ReadEnable_i)
			Data_o <= Memory[Address_i];
	end

endmodule
`default_nettype wire
