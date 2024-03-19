`timescale 1ns / 1ps

module top_tb ();

reg nreset;
reg clk;

localparam ADDR_W = 17;

wire [ADDR_W-1:0] addr;
wire read_req;

reg [31:0] rdata;
reg waitrequest;
reg readdatavalid;

wire uart_valid;
wire uart_ready;
wire [7:0] uart_data;

wire CLK12M = clk;

wire tx;

initial begin
	$dumpfile("top_tb.vcd");
	$dumpvars(0,top_tb);

	$monitor("Hello world");

	fork
		clk = 1'b0;
		nreset = 1'b0;
		
		rdata= 32'hFE000021;
		waitrequest = 1'b0;
		readdatavalid = 1'b1;
		
		#10 nreset = 1'b1;
		
		#500000 $finish;
	join
	
end

always begin
	#5 clk = !clk;
end

uart_mem_dump U1 (
	.clk(CLK12M),
	.nreset(nreset),
	
	.mem_addr(addr),
	.mem_data(rdata),
	
	.mem_read(read_req),	// Read request
	.mem_waitrequest(waitrequest),
	.mem_readdatavalid(readdatavalid),
	
	.uart_valid(uart_valid),
	.uart_ready(uart_ready),
	.uart_data(uart_data)
);

uart_tx #(.clk_freq(1200000)) U2 (
	.clk(CLK12M),
	.nreset(nreset),
	
	.tx_valid(uart_valid),
	.tx_ready(uart_ready),
	.tx_data(uart_data),
	
	.tx(tx)
);

endmodule
