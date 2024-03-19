module uart_tb ();

reg nreset;
reg clk;
reg [7:0] txdata;
reg txvalid;
wire txready;
wire tx;
wire tx2;

wire voted;
wire [7:0] rxdata;
wire rxvalid;
wire rxready;

initial begin
	$dumpfile("top.vcd");
	$dumpvars(0,uart_tb);

	$monitor("Hello world");
	
	clk = 1'b0;
	nreset = 1'b0;
	txdata = 8'b01000011;
	txvalid = 1'b0;
	
	#100 nreset = 1'b1;
	
	#100 txvalid = 1'b1;
	//rxready = 1'b1;
	
	#200000 $finish;
	
end

always begin
	#5 clk = !clk;
end

always @(posedge clk) begin
	if (txready & txvalid) begin
		txdata <= txdata + 8'b1;
		if (txdata == 8'b01000100) begin
			txvalid <= 1'b0;
		end
	end
end

uart_tx U1 (
	.nreset(nreset),
	.clk(clk),
	.tx_valid(txvalid),
	.tx_ready(txready),
	.tx_data(txdata),
	.tx(tx)
);

uart_rx U2 (
	.nreset(nreset),
	.clk(clk),
	.rx(tx),
	.rx_data(rxdata),
	.rx_valid(rxvalid),
	.rx_ready(rxready),
	
	.voted_o(voted)
	//.cmax_o(LED)
);

uart_tx U3 (
	.nreset(nreset),
	.clk(clk),
	.tx_valid(rxvalid),
	.tx_ready(rxready),
	.tx_data(rxdata),
	.tx(tx2)
);

endmodule
