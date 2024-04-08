// RSAinput: initialize mem_m and mem_e, then read two 32bit values and multiply them.

module RSAinput 
	#(parameter WIDTH = 32, ADDR_WIDTH = 7)
	(addr1, addr2, clk, dataoutl, dataouth);

	// port instantiation
	input   [ADDR_WIDTH-1:0] addr1;
	input   [ADDR_WIDTH-1:0] addr2;
	input   clk;

	output  [WIDTH-1:0] dataoutl;
	output  [WIDTH-1:0] dataouth;

	wire [WIDTH - 1 : 0] dataout1;
	wire [WIDTH - 1 : 0] dataout2;

	mem_m mem_m0(
		.addr(addr1), .clk(clk), .dataout(dataout1)
	);

	mem_e mem_e0(
		.addr(addr1), .clk(clk), .dataout(dataout2)
	);

	multiplier multiplier0(
		.clk(clk),
		.dataa(dataout1), .datab(dataout2),
		.dataoutl(dataoutl), .dataouth(dataouth)
	);

endmodule