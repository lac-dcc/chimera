// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230907

`default_nettype none
module RAM #(
	parameter ADDRESS_WIDTH = 16,
	parameter DATA_WIDTH    = 8,
	parameter MEMORY_DEPTH  = 2**ADDRESS_WIDTH
)(
	input wire Clock,
	input wire Reset,
	input wire ReadEnable_i,
	input wire WriteEnable_i,
	input wire [ADDRESS_WIDTH-1:0] Address_i,
	input wire [   DATA_WIDTH-1:0] Data_i,
	output reg [   DATA_WIDTH-1:0] Data_o
);
	
	// Create the memory array
	reg [DATA_WIDTH-1:0] Memory [0:MEMORY_DEPTH-1] /* synthesis syn_ramstyle = "block_ram" */;
	
	// Check memory depth and address space
	initial begin
		if(MEMORY_DEPTH > 2**ADDRESS_WIDTH)
			$fatal(0, "Required memory depth is larger than address space");
	end
	
	// Initialize memory with zeros
	integer i;
	initial begin
		for(i=0; i<2**ADDRESS_WIDTH; i=i+1) begin
			Memory[i] = 0;
		end
	end
	
	// Memory logic
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Data_o <= 0;
		end else begin
			if(ReadEnable_i)
				Data_o <= Memory[Address_i];
			if(WriteEnable_i)
				Memory[Address_i] <= Data_i;
		end
	end

endmodule
`default_nettype wire