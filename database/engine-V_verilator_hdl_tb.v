`timescale 1 ns / 1 ps

module tb (
`ifdef VERILATOR
	input clk
`endif
);
`ifndef VERILATOR
	reg clk = 1;
	always #10 clk = ~clk;
`endif

	reg resetn = 0;
	integer resetn_cnt = 0;

	reg uresetn = 0;
	integer uresetn_cnt = 0;

	integer cycle = 0;

	wire trap;

	initial begin
		$write("\nRISC-V Soft CPU Contest 2018\n");
		$write("Engine-V Contest entry by MicroFPGA UG\n");
		$write("Verilator testbench: MF8A18 booting from SPI Flash\n\n");

		$write("[TESTBENCH_BEGIN]\n");
	end

	always @(posedge clk) begin
		cycle <= cycle + 1;
	end

	always @(posedge clk) begin
		if (resetn_cnt < 200)
			resetn_cnt <= resetn_cnt + 1;
		else
			resetn <= 1;
	end

	wire UART_RX_wire;
	wire [7:0] UART_rx_byte;
	wire UART_rx_rdy;
	wire uart_baud_4x;

	wire 	FLASH_MISO;
	wire 	FLASH_MOSI;
	wire 	FLASH_SCK;
	wire 	FLASH_CS;

	MF8A18_SoC soc (
		.clk		(clk),
		.resetn		(resetn),
		.FLASH_MISO	(FLASH_MISO),
		.FLASH_MOSI	(FLASH_MOSI),
		.FLASH_SCK	(FLASH_SCK),
		.FLASH_CS	(FLASH_CS),
		.UART_TXD       (UART_RX_wire)
	);

	spiflash flash (
		.csb		(FLASH_CS),
		.clk		(FLASH_SCK),
		.io0		(FLASH_MOSI),
		.io1		(FLASH_MISO),
		.io2		(1'b 1),
		.io3		(1'b 1)
	);


	baudgen baud115200 (
		.clk		(clk),
		.tick           (uart_baud_4x)
	);

	rx uart_rx_inst (
		.res_n		(uresetn),
		.rx		(UART_RX_wire),
		.clk		(uart_baud_4x),		 /* Baud Rate x 4 (4 posedge's per bit) */
		.rx_byte	(UART_rx_byte),
		.rdy		(UART_rx_rdy)
	);

	always @(posedge clk) begin
		if (cycle > 5*50*1000000) begin
//		if (cycle > 1000) begin
			$display("Finished after about 5 seconds run time...\n\r");
			$finish;			
		end
	end

	always @(posedge uart_baud_4x) begin
		if (uresetn_cnt < 2)
			uresetn_cnt <= uresetn_cnt + 1;
		else
			uresetn <= 1;

		if (UART_rx_rdy) begin
			if (UART_rx_byte == 8'hff) begin
				$write("[TESTBENCH_END]\n\n");
				$write("RV32I Compliance test Halt");
				$finish;
			end else
				$write("%c", UART_rx_byte);
		end
	end



endmodule
