// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2022-10-14 by mza
// based on mza-test058.palimpsest.protodune-LBLS-DAQ.althea.revBLM.v
// based on mza-test057.palimpsest.protodune-LBLS-DAQ.althea.revB.v
// based on mza-test066.palimpsest.protodune-LBLS-DAQ.ampoliros48.revA.v
// and mza-test035.SCROD_XRM_clock_and_revo_receiver_frame9_and_trigger_generator.v
// last updated 2024-04-12 by mza

`define althea_revBLM
`include "lib/generic.v"
`include "lib/RAM8.v"
`include "lib/fifo.v"
//`include "lib/RAM.sv" // ise does not and will not support systemverilog
`include "lib/plldcm.v"
`include "lib/serdes_pll.v"
`include "lib/half_duplex_rpi_bus.v"
`include "lib/sequencer.v"
`include "lib/reset.v"
`include "lib/edge_to_pulse.v"
`include "lib/frequency_counter.v"

module palimpsest_simple_pollable_memory #(
	parameter BUS_WIDTH = 16,
	parameter LOG2_OF_BUS_WIDTH = $clog2(BUS_WIDTH),
	parameter TRANSACTIONS_PER_DATA_WORD = 2,
	parameter LOG2_OF_TRANSACTIONS_PER_DATA_WORD = $clog2(TRANSACTIONS_PER_DATA_WORD),
	parameter TRANSACTIONS_PER_ADDRESS_WORD = 1,
	parameter BANK_ADDRESS_DEPTH = 13,
	parameter LOG2_OF_NUMBER_OF_BANKS = BUS_WIDTH*TRANSACTIONS_PER_ADDRESS_WORD - BANK_ADDRESS_DEPTH, // 3
	parameter NUMBER_OF_BANKS = 1<<LOG2_OF_NUMBER_OF_BANKS, // 2^3 = 8
	parameter ADDRESS_AUTOINCREMENT_MODE = 1,
	parameter SIMULATION = 0,
	parameter COUNTER100_BIT_PICKOFF = SIMULATION ? 5 : 23
) (
	input clock100_p, clock100_n,
//	input button,
	inout [5:0] coax,
//	input [2:0] rot,
	inout [BUS_WIDTH-1:0] bus,
	input read,            // 0=write;    1=read
	input register_select, // 0=address;  1=data
	input enable,          // 0=inactive; 1=active
	output ack_valid,
	output other,
//	output [7-LEFT_DAC_OUTER*4:4-LEFT_DAC_OUTER*4] led,
	output [3:0] coax_led
);
	genvar i;
	// PLL_ADV VCO range is 400 MHz to 1080 MHz
	localparam PERIOD = 10.0;
	localparam MULTIPLY = 8;
	localparam DIVIDE = 2;
	localparam EXTRA_DIVIDE = 16;
	localparam SCOPE = "GLOBAL"; // "GLOBAL" (400 MHz), "BUFIO2" (525 MHz), "BUFPLL" (1080 MHz)
//	wire [7:0] pattern [12:1];
//	reg [7:0] status [12:1];
	localparam ERROR_COUNT_PICKOFF = 7;
	wire [3:0] status4;
	wire [7:0] status8;
	wire reset;
	// ----------------------------------------------------------------------
	wire reset100;
	wire clock100;
	IBUFGDS mybuf0 (.I(clock100_p), .IB(clock100_n), .O(clock100));
	reset_wait4pll #(.COUNTER_BIT_PICKOFF(COUNTER100_BIT_PICKOFF)) reset100_wait4pll (.reset_input(reset), .pll_locked_input(1'b1), .clock_input(clock100), .reset_output(reset100));
	// ----------------------------------------------------------------------
	wire [BUS_WIDTH*TRANSACTIONS_PER_ADDRESS_WORD-1:0] address_word_full;
	wire [BANK_ADDRESS_DEPTH-1:0] address_word_narrow = address_word_full[BANK_ADDRESS_DEPTH-1:0];
	wire [BUS_WIDTH*TRANSACTIONS_PER_DATA_WORD-1:0] write_data_word;
	wire [BUS_WIDTH*TRANSACTIONS_PER_DATA_WORD-1:0] read_data_word [NUMBER_OF_BANKS-1:0];
	wire [LOG2_OF_NUMBER_OF_BANKS-1:0] bank;
	wire [NUMBER_OF_BANKS-1:0] write_strobe;
	wire [NUMBER_OF_BANKS-1:0] read_strobe;
	wire [ERROR_COUNT_PICKOFF:0] hdrb_read_errors;
	wire [ERROR_COUNT_PICKOFF:0] hdrb_write_errors;
	wire [ERROR_COUNT_PICKOFF:0] hdrb_address_errors;
	half_duplex_rpi_bus #(
		.BUS_WIDTH(BUS_WIDTH), .BANK_ADDRESS_DEPTH(BANK_ADDRESS_DEPTH), .ADDRESS_AUTOINCREMENT_MODE(ADDRESS_AUTOINCREMENT_MODE),
		.TRANSACTIONS_PER_DATA_WORD(TRANSACTIONS_PER_DATA_WORD), .TRANSACTIONS_PER_ADDRESS_WORD(TRANSACTIONS_PER_ADDRESS_WORD)
	) hdrb (
		.bus(bus),
		.read(read),                       // 0=write;    1=read
		.register_select(register_select), // 0=address;  1=data
		.enable(enable),                   // 0=inactive; 1=active
		.ack_valid(ack_valid),
		.clock(clock100), .reset(reset100), .bank(bank), .write_strobe(write_strobe), .read_strobe(read_strobe),
		.write_data_word(write_data_word), .read_data_word(read_data_word[bank]), .address_word_reg(address_word_full),
		.read_errors(hdrb_read_errors), .write_errors(hdrb_write_errors), .address_errors(hdrb_address_errors)
	);
	// ----------------------------------------------------------------------
	RAM_s6_8k_32bit_8bit #(.ENDIANNESS("BIG")) mem_bank0 (.reset(reset100),
		.clock_a(clock100), .address_a(address_word_narrow), .data_in_a(write_data_word), .write_enable_a(write_strobe[0]), .data_out_a(read_data_word[0]),
		.clock_b(clock100), .address_b(15'd0), .data_out_b());
	RAM_s6_8k_32bit_8bit #(.ENDIANNESS("BIG")) mem_bank7 (.reset(reset100),
		.clock_a(clock100), .address_a(address_word_narrow), .data_in_a(write_data_word), .write_enable_a(write_strobe[7]), .data_out_a(read_data_word[7]),
		.clock_b(clock100), .address_b(15'd0), .data_out_b());
	// ----------------------------------------------------------------------
	assign coax[3] = register_select;
	assign coax[2] = ack_valid;
	assign coax[1] = read;
	assign coax[0] = enable;
	for (i=4; i<=5; i=i+1) begin : dummy_coax
		assign coax[i] = 0;
	end
	assign other = 0;
	assign reset = 0;
	// ----------------------------------------------------------------------
	if (1) begin
		assign status4[3] = 0;
		assign status4[2] = 0;
		assign status4[1] = 0;
		assign status4[0] = 0;
		// -------------------------------------
		assign status8[7] = 0;
		assign status8[6] = 0;
		assign status8[5] = 0;
		assign status8[4] = 0;
		// -------------------------------------
		assign status8[3] = 0;
		assign status8[2] = 0;
		assign status8[1] = 0;
		assign status8[0] = 0;
	end
	assign coax_led = status4;
	initial begin
		#100;
		$display("BUS_WIDTH=%d, TRANSACTIONS_PER_DATA_WORD=%d, TRANSACTIONS_PER_ADDRESS_WORD=%d", BUS_WIDTH, TRANSACTIONS_PER_DATA_WORD, TRANSACTIONS_PER_ADDRESS_WORD);
		$display("%d banks", NUMBER_OF_BANKS);
	end
endmodule

module palimpsest #(
	parameter NOTHING = 0
) (
	input clock100_p, clock100_n,
	inout [5:0] coax,
	// other IOs:
	output rpi_gpio22, // ack_valid
	input rpi_gpio23, // register_select
//	input rpi_gpio4_gpclk0, // enable // pulled out the wrong pin
	input rpi_gpio5, // read
	// 16 bit bus:
	inout rpi_gpio6_gpclk2, rpi_gpio7_spi_ce1, rpi_gpio8_spi_ce0, rpi_gpio9_spi_miso,
	inout rpi_gpio10_spi_mosi, rpi_gpio11_spi_sclk, rpi_gpio12, rpi_gpio13,
	inout rpi_gpio14, rpi_gpio15, rpi_gpio16, rpi_gpio17,
	inout rpi_gpio18, rpi_gpio19, rpi_gpio20, rpi_gpio21,
	// other IOs:
	input n, // pulled out the wrong pin
//	input rpi_gpio2_i2c1_sda, // pulled out the wrong pin
	//input [2:0] rot
//	input button, // reset
	output other, // goes to PMOD connector
//	output [7-LEFT_DAC_OUTER*4:4-LEFT_DAC_OUTER*4] led,
	output [3:0] coax_led
);
	localparam BUS_WIDTH = 16;
	localparam BANK_ADDRESS_DEPTH = 13;
	localparam TRANSACTIONS_PER_DATA_WORD = 2;
	localparam TRANSACTIONS_PER_ADDRESS_WORD = 1;
	localparam ADDRESS_AUTOINCREMENT_MODE = 1;
	wire [3:0] internal_coax_led;
	//wire [7:0] internal_led;
	//assign led = internal_led;
	assign coax_led = internal_coax_led;
	palimpsest_simple_pollable_memory #(
		.BUS_WIDTH(BUS_WIDTH), .BANK_ADDRESS_DEPTH(BANK_ADDRESS_DEPTH),
		.TRANSACTIONS_PER_DATA_WORD(TRANSACTIONS_PER_DATA_WORD),
		.TRANSACTIONS_PER_ADDRESS_WORD(TRANSACTIONS_PER_ADDRESS_WORD),
		.ADDRESS_AUTOINCREMENT_MODE(ADDRESS_AUTOINCREMENT_MODE)
	) pali_highway (
		.clock100_p(clock100_p), .clock100_n(clock100_n),
//		.button(button),
		.coax(coax),
		.bus({
			rpi_gpio21, rpi_gpio20, rpi_gpio19, rpi_gpio18,
			rpi_gpio17, rpi_gpio16, rpi_gpio15, rpi_gpio14,
			rpi_gpio13, rpi_gpio12, rpi_gpio11_spi_sclk, rpi_gpio10_spi_mosi,
			rpi_gpio9_spi_miso, rpi_gpio8_spi_ce0, rpi_gpio7_spi_ce1, rpi_gpio6_gpclk2
		}),
		.register_select(rpi_gpio23), .read(rpi_gpio5),
//		.enable(rpi_gpio4_gpclk0), .ack_valid(rpi_gpio22),
//		.enable(rpi_gpio2_i2c1_sda), .ack_valid(rpi_gpio22), // pulled out the wrong pin
		.enable(n), .ack_valid(rpi_gpio22), // pulled out the wrong pin
//		.rot(rot),
		.other(other),
//		.led(internal_led),
		.coax_led(internal_coax_led)
	);
endmodule

