module top (
	input CLK12M,
	input USER_BTN,
	output reg [7:0] LED,
	inout [8:1] PIO,
	
	inout [5:0] BDBUS,
	inout [14:0] D
);

wire voted;
wire tx;
wire rx;

wire nreset;
assign nreset = USER_BTN;

wire clk;
assign clk = CLK12M;

reg [7:0] q;
wire [7:0] d;
reg source_ready;
wire source_valid;
reg sink_valid;
wire sink_ready;

assign rx = BDBUS[0]; // BDBUS[0] is USB UART TX (FPGA RX)
assign BDBUS[1] = tx; // BDBUS[1] is USB UART RX (FPGA TX)

assign D[0] = rx;
assign D[1] = voted;
assign D[2] = sink_valid;
assign D[3] = sink_ready;
assign D[4] = tx;

uart_rx U2 (
	.nreset(nreset),
	.clk(CLK12M),
	.rx(BDBUS[0]),
	.rx_data(d),
	.rx_valid(source_valid),
	.rx_ready(source_ready),
	
	// "voted" is the rx signal recovered by receiver
	.voted_o(voted)
	//.cmax_o(LED)
);	

uart_tx U1 (
	.nreset(nreset),
	.clk(CLK12M),
	.tx_valid(sink_valid),
	.tx_ready(sink_ready),
	.tx_data(q),
	.tx(tx)
);

always @(posedge CLK12M or negedge nreset)
	if (~nreset) begin
		LED <= 8'b0;
	end else begin
		if (sink_ready & sink_valid) begin
			LED <=  q;
		end
	end

always @(posedge CLK12M or negedge nreset)
	if (~nreset) begin
		q = 8'b0;
		source_ready <= 1'b1;
		sink_valid <= 1'b0;
	end else begin
		if (source_ready & source_valid) begin
			if (d >= "a" && d <= "z") begin
				// convert character to uppercase
				q <= d - ("a" - "A");
			end else begin
				q <= d;
			end
			sink_valid <= 1'b1;
			source_ready <= 1'b0;
		end
		
		if (sink_ready & sink_valid) begin
			sink_valid <= 1'b0;
			source_ready <= 1'b1;
		end
	end
	
endmodule
