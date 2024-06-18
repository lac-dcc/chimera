// This program was cloned from: https://github.com/toivoh/tt06-retro-console
// License: Apache License 2.0

`default_nettype none `timescale 1ns / 1ps

//`define SIMPLE_TB
//`define FULL_TB
`define SIMPLE_TB2


`ifdef FULL_TB

/* This testbench just instantiates the module and makes some convenient wires
	 that can be driven / tested by the cocotb test.py.
*/
module tb #(RAM_EXTRA_DELAY=9) ();

	// Dump the signals to a VCD file. You can view it with gtkwave.
	initial begin
		$dumpfile("tb.vcd");
		$dumpvars(0, tb);
		#1;
	end

	// Wire up the inputs and outputs:
	reg clk;
	reg rst_n;
	reg ena;
`ifdef GL_TEST
	reg [7:0] ui_in;
`else
	reg [7:4] ui_in_74;
	wire [7:0] ui_in = {ui_in_74, data_pins};
`endif
	reg [7:0] uio_in;
	wire [7:0] uo_out;
	wire [7:0] uio_out;
	wire [7:0] uio_oe;

	tt_um_toivoh_retro_console dut (

		// Include power ports for the Gate Level test:
`ifdef GL_TEST
		.VPWR(1'b1),
		.VGND(1'b0),
`endif

		.ui_in  (ui_in),    // Dedicated inputs
		.uo_out (uo_out),   // Dedicated outputs
		.uio_in (uio_in),   // IOs: Input path
		.uio_out(uio_out),  // IOs: Output path
		.uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
		.ena    (ena),      // enable - goes high when design is selected
		.clk    (clk),      // clock
		.rst_n  (rst_n)     // not reset
	);

	wire [1:0] tx_pins, rx_pins;
	assign tx_pins = uio_out[5:4];
	assign rx_pins = uio_in[7:6];

	int counter;
	always @(posedge clk) begin
		if (!rst_n) counter <= 1;
		else counter <= counter + 1;
	end

	wire [2:0] avhsync = {uio_out[6], uo_out[3], uo_out[7]};
	wire [5:0] rgb = {uo_out[0], uo_out[4], uo_out[1], uo_out[5], uo_out[2], uo_out[6]};

	wire [3:0] addr_pins = uio_out[3:0];
	wire [3:0] my_addr_pins = uio_out[3:0];

`ifndef GL_TEST
	wire [3:0] data_pins;
	serial_ram #(.RAM_ADDR_BITS(16), .DELAY(RAM_EXTRA_DELAY)) extram (
		.clk(clk), .reset(!rst_n), .enable(1'b1),
		.addr_in(addr_pins), .data_out(data_pins)
	);

	wire [10-1:0] phase0 = dut.synth.voice.phase[0];
	wire [10-1:0] phase1 = dut.synth.voice.phase[1];
	wire [14-1:0] float_period0 = dut.synth.voice.float_period[0];
	wire [14-1:0] float_period1 = dut.synth.voice.float_period[1];
`else
	wire [3:0] data_pins = ui_in[3:0];
`endif
endmodule

`endif



`ifdef SIMPLE_TB

/* This testbench just instantiates the module and makes some convenient wires
	 that can be driven / tested by the cocotb test.py.
*/
module tb();

	// Dump the signals to a VCD file. You can view it with gtkwave.
	initial begin
		$dumpfile("tb.vcd");
		$dumpvars(0, tb);
		#1;
	end

	// Wire up the inputs and outputs:
	reg clk;
	reg rst_n;
	reg ena;
	reg [7:0] ui_in;
	reg [7:0] uio_in;
	wire [7:0] uo_out;
	wire [7:0] uio_out;
	wire [7:0] uio_oe;

	tt_um_toivoh_retro_console dut (

		// Include power ports for the Gate Level test:
`ifdef GL_TEST
		.VPWR(1'b1),
		.VGND(1'b0),
`endif

		.ui_in  (ui_in),    // Dedicated inputs
		.uo_out (uo_out),   // Dedicated outputs
		.uio_in (uio_in),   // IOs: Input path
		.uio_out(uio_out),  // IOs: Output path
		.uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
		.ena    (ena),      // enable - goes high when design is selected
		.clk    (clk),      // clock
		.rst_n  (rst_n)     // not reset
	);

	wire [1:0] tx_pins, rx_pins;
	assign tx_pins = uio_out[5:4];
	assign rx_pins = uio_in[7:6];

	int counter;
	always @(posedge clk) begin
		if (!rst_n) counter <= 1;
		else counter <= counter + 1;
	end

	wire [2:0] avhsync = {uio_out[6], uo_out[3], uo_out[7]};
	wire [5:0] rgb = {uo_out[0], uo_out[4], uo_out[1], uo_out[5], uo_out[2], uo_out[6]};

	wire [3:0] addr_pins = uio_out[3:0];
	wire [3:0] my_addr_pins = uio_out[3:0];
endmodule

`endif


`ifdef SIMPLE_TB2

/* This testbench just instantiates the module and makes some convenient wires
	 that can be driven / tested by the cocotb test.py.
*/
module tb #(parameter RAM_EXTRA_DELAY=7) ();

	// Dump the signals to a VCD file. You can view it with gtkwave.
	initial begin
		$dumpfile("tb.vcd");
		$dumpvars(0, tb);
		#1;
	end

	// Wire up the inputs and outputs:
	reg clk;
	reg rst_n;
	reg ena;
	reg [7:0] ui_in;
	reg [7:0] uio_in;
	wire [7:0] uo_out;
	wire [7:0] uio_out;
	wire [7:0] uio_oe;

	tt_um_toivoh_retro_console dut (

		// Include power ports for the Gate Level test:
`ifdef GL_TEST
		.VPWR(1'b1),
		.VGND(1'b0),
`endif

		.ui_in  (ui_in),    // Dedicated inputs
		.uo_out (uo_out),   // Dedicated outputs
		.uio_in (uio_in),   // IOs: Input path
		.uio_out(uio_out),  // IOs: Output path
		.uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
		.ena    (ena),      // enable - goes high when design is selected
		.clk    (clk),      // clock
		.rst_n  (rst_n)     // not reset
	);

	wire [1:0] tx_pins, rx_pins;
	assign tx_pins = uio_out[5:4];
	assign rx_pins = uio_in[7:6];

	int counter;
	always @(posedge clk) begin
		if (!rst_n) counter <= 1;
		else counter <= counter + 1;
	end

	wire [2:0] avhsync = {uio_out[6], uo_out[3], uo_out[7]};
	wire [5:0] rgb = {uo_out[0], uo_out[4], uo_out[1], uo_out[5], uo_out[2], uo_out[6]};

	//wire [3:0] addr_pins = uio_out[3:0];
	//wire [3:0] my_addr_pins = uio_out[3:0];
	wire [3:0] addr_pins_out = uio_out[3:0];

`ifndef GL_TEST
	wire [3:0] data_pins;
	reg [3:0] addr_pins;
	serial_ram #(.RAM_ADDR_BITS(16), .DELAY(RAM_EXTRA_DELAY)) extram (
		.clk(clk), .reset(!rst_n), .enable(1'b1),
		.addr_in(addr_pins), .data_out(data_pins)
	);
`endif
endmodule

`endif