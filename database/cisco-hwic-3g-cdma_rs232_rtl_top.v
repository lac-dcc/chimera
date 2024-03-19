
module top(
    input               clk25,

    output [3:0]        leds,

    output              uart_drv_ena_,
    output              uart_drv_sd_,

    output              uart_txd,
    input               uart_cts,           // Clear to Send

    input               uart_rxd,
    output              uart_rts            // Request to Send
);

    reg reset_ = 1'b0;
    always @(posedge clk25) begin
        reset_ <= 1'b1;
    end

	reg [24:0]	count;
	
	always @(posedge clk25)
	begin
		if (!reset_) begin
			count 	<= 0;
		end
		else begin
			count	<= count + 1;
		end
	end

	assign leds[0] = count[24];
	assign leds[1] = !uart_txd;
    assign leds[2] = 1'b1;
    assign leds[3] = 1'b1;

    assign uart_drv_ena_ = 1'b0;            // ADM3222 EN_: Set 0 to enable RX
    assign uart_drv_sd_  = 1'b1;            // ADM3222 SD_: Set 1 to enabel TX

	wire 		rx2tx_req;
	wire 		rx2tx_ready;
	wire [7:0]	rx2tx_data;

	uart_rx #(.BAUD(115200), .CLK_HZ(25000000)) u_uart_rx (
		.clk (clk25),
		.reset_(reset_),
		.rx_req(rx2tx_req),
		.rx_ready(rx2tx_ready),
		.rx_data(rx2tx_data),
		.uart_rxd(uart_rxd)
	);

	// The uart_tx baud rate is slightly higher than 115200.
	// This is to avoid dropping bytes when the PC sends data at a rate that's a bit faster
	// than 115200. 
	// In a normal design, one typically wouldn't use immediate loopback, so 115200 would be the 
	// right value.
	uart_tx #(.BAUD(116000), .CLK_HZ(25000000)) u_uart_tx (
		.clk (clk25),
		.reset_(reset_),
		.tx_req(rx2tx_req),
		.tx_ready(rx2tx_ready),
		.tx_data(rx2tx_data),
		.uart_txd(uart_txd)
	);

    assign uart_rts = 1'b1;

endmodule
