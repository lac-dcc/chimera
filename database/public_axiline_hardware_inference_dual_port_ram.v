// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module true_dual_port_ram#(
parameter addrLen = 6,
parameter dataLen = 32,
parameter memSize = 1 << addrLen
//parameter ram_type = "distributed"
)
(
	input [dataLen-1:0] data_a,
	input [addrLen-1:0] addr_a, addr_b,
	input we_a, re_b, clk,
	output reg [dataLen-1:0] q_b
);
	// Declare the RAM variable
	reg [dataLen-1:0] ram[memSize-1:0];
	
	// Port A
	always @ (posedge clk)
	begin
		if (we_a) 
		begin
			ram[addr_a] <= data_a;
		end
	end
	
	// Port B
	always @ (posedge clk)
	begin
		if (re_b)
		begin
			q_b <= ram[addr_b];
		end
		
	end
	
endmodule

