`ifndef DM
`define DM	
	module DM(
	input [4:0] addr,
	input [31:0] data,
	input reset,
	input memWrite,
	input memRead,
	output [31:0] readData);
		
		reg [31:0] mem [0:31];
		
		always @(memWrite)
			if(~memRead)
				mem[addr] = data;
			
		always @(memRead)
			readData = mem[addr];
		
		always @(reset) begin
			if(reset) begin
				for( j=0; j<32; j = j+1) begin
					data[j] = 32'd0;
				end
			end
		end
		
	endmodule
`endif
