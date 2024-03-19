module buffer_tb(
);

	reg clk;
	reg reset;
	reg [7:0] rd_addr1;
	reg [7:0] rd_addr2;
	reg [7:0] wr_addr;
	wire [31:0] rd_data1;
	wire [31:0] rd_data2;
	reg [31:0] wr_data;
	reg wr_en;

	buffer buff (
		.clk (clk),
		.reset (reset),
		
		.wr_en (wr_en),
		.wr_addr (wr_addr),
		.wr_data (wr_data),
		
		.rd_addr1 (rd_addr1),
		.rd_data1 (rd_data1),
		
		.rd_addr2 (rd_addr2),
		.rd_data2 (rd_data2)
		
	);

	initial
	begin
		$dumpfile("./bin/buffer.vcd");
		$dumpvars(0, buffer_tb);
		$monitor("rd_addr1,rd_addr2,rd_data1,rd_data2,wr_en,wr_addr,wr_data,clk,reset");
	end

	initial
	begin
		clk = 0;
		reset = 0;
		wr_en = 0;
	#5
		reset = 1;
	#10
		reset = 0;
		wr_addr = 0;
		wr_data = 1;
	#10
		wr_en = 1;
		wr_addr = 1;
		wr_data = 1;
	#10
		wr_en = 0;
		rd_addr1 = 0;
		rd_addr2 = 1;
	#100
		$finish;
	end

	always
	begin
		#5 clk = !clk;
	end
endmodule
