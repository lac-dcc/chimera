// This program was cloned from: https://github.com/SteffenReith/ElemRV
// License: Apache License 2.0

`timescale 1ns/10ps

module elemrv_tb;
	reg clock;
	reg reset;

	reg gpioStatus[0:3];
	reg hyperbus_dq[0:7];
	reg hyperbus_rwds;
	reg jtag_tck;
	reg jtag_tdi;
	reg jtag_tms;
	reg spi_dq1;
	reg uartStd_rxd;
	reg uartStd_cts;

	always #20 clock <= ~clock;
	always #50 jtag_tck <= ~jtag_tck;

	initial begin
		$dumpfile("elemrv_tb.vcd");
		$dumpvars;

		clock <= 0;
		reset <= 0;
		gpioStatus[0] <= 0;
		gpioStatus[1] <= 0;
		gpioStatus[2] <= 0;
		gpioStatus[3] <= 0;
		hyperbus_dq[0] <= 0;
		hyperbus_dq[1] <= 0;
		hyperbus_dq[2] <= 0;
		hyperbus_dq[3] <= 0;
		hyperbus_dq[4] <= 0;
		hyperbus_dq[5] <= 0;
		hyperbus_dq[6] <= 0;
		hyperbus_dq[7] <= 0;
		hyperbus_rwds <= 0;
		jtag_tck <= 0;
		jtag_tdi <= 0;
		jtag_tms <= 0;
		spi_dq1 <= 0;
		uartStd_rxd <= 1;
		uartStd_cts <= 0;
		#1000 reset <= 1;

		#10000 $finish;
	end

	wire clock_pin;
	wire reset_pin;
	wire gpioStatus_pin[0:3];
	wire hyperbus_ck_pin;
	wire hyperbus_cs_pin;
	wire hyperbus_dq_pin[0:7];
	wire hyperbus_reset_pin;
	wire hyperbus_rwds_pin;
	wire jtag_tck_pin;
	wire jtag_tdi_pin;
	wire jtag_tdo_pin;
	wire jtag_tms_pin;
	wire spi_cs0_pin;
	wire spi_dq0_pin;
	wire spi_dq1_pin;
	wire spi_sck_pin;
	wire uartStd_txd_pin;
	wire uartStd_rxd_pin;
	wire uartStd_cts_pin;
	wire uartStd_rts_pin;

	assign clock_pin = clock;
	assign reset_pin = reset;
	assign gpioStatus_pin[0] = gpioStatus[0];
	assign gpioStatus_pin[1] = gpioStatus[1];
	assign gpioStatus_pin[2] = gpioStatus[2];
	assign gpioStatus_pin[3] = gpioStatus[3];
	assign hyperbus_dq_pin[0] = hyperbus_dq[0];
	assign hyperbus_dq_pin[1] = hyperbus_dq[1];
	assign hyperbus_dq_pin[2] = hyperbus_dq[2];
	assign hyperbus_dq_pin[3] = hyperbus_dq[3];
	assign hyperbus_dq_pin[4] = hyperbus_dq[4];
	assign hyperbus_dq_pin[5] = hyperbus_dq[5];
	assign hyperbus_dq_pin[6] = hyperbus_dq[6];
	assign hyperbus_dq_pin[7] = hyperbus_dq[7];
	assign hyperbus_rwds_pin = hyperbus_rwds;
	assign jtag_tck_pin = jtag_tck;
	assign jtag_tdi_pin = jtag_tdi;
	assign jtag_tms_pin = jtag_tms;
	assign spi_dq1_pin = spi_dq1;
	assign uartStd_rxd_pin = uartStd_rxd;
	assign uartStd_cts_pin = uartStd_cts;

	ElemRVTop uut (
		.io_clock_PAD(clock_pin),
		.io_reset_PAD(reset_pin),
		.io_gpioStatus_0_PAD(gpioStatus_pin[0]),
		.io_gpioStatus_1_PAD(gpioStatus_pin[1]),
		.io_gpioStatus_2_PAD(gpioStatus_pin[2]),
		.io_gpioStatus_3_PAD(gpioStatus_pin[3]),
		.io_hyperbus_ck_PAD(hyperbus_ck_pin),
		.io_hyperbus_cs_0_PAD(hyperbus_cs_pin),
		.io_hyperbus_dq_0_PAD(hyperbus_dq_pin[0]),
		.io_hyperbus_dq_1_PAD(hyperbus_dq_pin[1]),
		.io_hyperbus_dq_2_PAD(hyperbus_dq_pin[2]),
		.io_hyperbus_dq_3_PAD(hyperbus_dq_pin[3]),
		.io_hyperbus_dq_4_PAD(hyperbus_dq_pin[4]),
		.io_hyperbus_dq_5_PAD(hyperbus_dq_pin[5]),
		.io_hyperbus_dq_6_PAD(hyperbus_dq_pin[6]),
		.io_hyperbus_dq_7_PAD(hyperbus_dq_pin[7]),
		.io_hyperbus_reset_PAD(hyperbus_reset_pin),
		.io_hyperbus_rwds_PAD(hyperbus_rwds_pin),
		.io_jtag_tck_PAD(jtag_tck_pin),
		.io_jtag_tdi_PAD(jtag_tdi_pin),
		.io_jtag_tdo_PAD(jtag_tdo_pin),
		.io_jtag_tms_PAD(jtag_tms_pin),
		.io_spi_cs_0_PAD(spi_cs0_pin),
		.io_spi_dq_0_PAD(spi_dq0_pin),
		.io_spi_dq_1_PAD(spi_dq1_pin),
		.io_spi_sck_PAD(spi_sck_pin),
		.io_uartStd_cts_PAD(uartStd_cts_pin),
		.io_uartStd_rts_PAD(uartStd_rts_pin),
		.io_uartStd_rxd_PAD(uartStd_rxd_pin),
		.io_uartStd_txd_PAD(uartStd_txd_pin)
	);

endmodule

module bondpad_70x70(pad);
	input pad;
endmodule
