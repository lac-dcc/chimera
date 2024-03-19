
module vram_ip
(
	input	  [7:0] address,
	input	 [31:0] byteena,
	input	        clock,
	input	[255:0] data,
	input	        wren,
	output[255:0] q
);

spram #(8,256) ram
(
	.clock(clock),
	.address(address),
	.data(data),
	.wren(wren),
	.byteena(byteena),
	.q(q)
);

endmodule
