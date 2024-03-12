/*
 * Copyright 2018 MicroFPGA UG
 * Apache 2.0 License
 */

module ROM1K16 (
	clk,
	addr,
	dout
);

input           clk;        
input [9:0]    addr;
output [15:0]  dout;

/*
 * Generic and simulator friendly memory
 */    

	reg [15:0] memory [0:2*1024-1];
	reg [15:0] memory_r;
	initial $readmemh("rv32i.mem", memory);

	assign dout =  memory_r;
    
	always @(posedge clk) begin
		memory_r <= memory[addr];
//		$write("\n\rROM: %04X", addr);
	end


endmodule