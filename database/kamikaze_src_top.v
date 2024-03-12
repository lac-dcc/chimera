module top(clk_i, rst_i, io_o, trap);
	input clk_i;
	input rst_i;
	output [7:0] io_o;
	output trap;

`ifndef FPGA_ARCH_ANLOGIC_AL3	
	localparam MEM_SIZE = 4096;
	reg [31:0] memory [0:MEM_SIZE-1];
	initial $readmemh("../firmware/firmware.hex", memory);
`endif
	
	wire [31:0] im_addr;
	reg [31:0] im_data;
	
	kamikaze cpu(.clk_i(clk_i),
			.rst_i(rst_i),
			.im_addr_o(im_addr),
			.im_data_i(im_data));

`ifndef FPGA_ARCH_ANLOGIC_AL3	
	always @(posedge clk_i)
	begin
		if(rst_i)
			im_data <= memory[im_addr[31:2]];
		else
			im_data <= 32'h0;
	end
`else
		assign io_o = im_data[7:0] ^ im_data[15:7] ^ im_data[23:16] ^ im_data[31:24];
`endif
	
endmodule
