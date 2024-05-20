// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// to run on an icezero
//`define TESTBENCH;
`define icezero;
//`define ice40;
//`define xilinx

// written 2020-05-07 by mza
// based on mza-test039.spi.v and mza-test036.function-generator.althea.v and mza-test017.serializer-ram.v
// updated 2020-06-01 by mza
// last updated 2021-02-03 by mza

`include "lib/spi.v"

//`define USE_SLOW_CLOCK
//`define USE_INFERRED_RAM_16
`define USE_BRAM_256
//`define USE_BRAM_512
//`define USE_BRAM_1K
//`define USE_BRAM_2K

`ifdef USE_SLOW_CLOCK
`include "lib/easypll.v"
`endif

//`ifdef xilinx
//`else
//`endif

module RAM_ice40_2k_32bit (
	input reset,
	input write_clock,
	input [10:0] write_address,
	input [31:0] write_data,
	input write_enable,
	input read_clock,
	input [10:0] read_address,
	output [31:0] read_data
);
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_15 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[31:30]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[31:30]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_14 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[29:28]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[29:28]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_13 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[27:26]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[27:26]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_12 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[25:24]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[25:24]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_11 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[23:22]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[23:22]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_10 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[21:20]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[21:20]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_09 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[19:18]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[19:18]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_08 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[17:16]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[17:16]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_07 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[15:14]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[15:14]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_06 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[13:12]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[13:12]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_05 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[11:10]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[11:10]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_04 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[9:8]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[9:8]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_03 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[7:6]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[7:6]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_02 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[5:4]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[5:4]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_01 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[3:2]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[3:2]));
	RAM_ice40_2k_2bit RAM_ice40_2k_2bit_00 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[1:0]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[1:0]));
endmodule

module RAM_ice40_1k_32bit (
	input reset,
	input write_clock,
	input [9:0] write_address,
	input [31:0] write_data,
	input write_enable,
	input read_clock,
	input [9:0] read_address,
	output [31:0] read_data
);
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_7 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[31:28]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[31:28]));
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_6 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[27:24]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[27:24]));
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_5 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[23:20]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[23:20]));
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_4 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[19:16]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[19:16]));
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_3 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[15:12]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[15:12]));
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_2 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[11:8]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[11:8]));
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_1 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[7:4]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[7:4]));
	RAM_ice40_1k_4bit RAM_ice40_1k_4bit_0 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[3:0]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[3:0]));
endmodule

module RAM_ice40_512_32bit (
	input reset,
	input write_clock,
	input [8:0] write_address,
	input [31:0] write_data,
	input write_enable,
	input read_clock,
	input [8:0] read_address,
	output [31:0] read_data
);
	RAM_ice40_512_8bit RAM_ice40_512_8bit_3 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[31:24]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[31:24]));
	RAM_ice40_512_8bit RAM_ice40_512_8bit_2 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[23:16]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[23:16]));
	RAM_ice40_512_8bit RAM_ice40_512_8bit_1 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[15:8]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[15:8]));
	RAM_ice40_512_8bit RAM_ice40_512_8bit_0 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[7:0]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[7:0]));
endmodule

module RAM_ice40_256_32bit (
	input reset,
	input write_clock,
	input [7:0] write_address,
	input [31:0] write_data,
	input write_enable,
	input read_clock,
	input [7:0] read_address,
	output [31:0] read_data
);
	RAM_ice40_256_16bit RAM_ice40_256_16bit_1 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[31:16]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[31:16]));
	RAM_ice40_256_16bit RAM_ice40_256_16bit_0 (.reset(reset),
		.write_clock(write_clock), .write_address(write_address), .write_data(write_data[15:0]), .write_enable(write_enable),
		.read_clock(read_clock),   .read_address(read_address),   .read_data(read_data[15:0]));
endmodule

module RAM_ice40_256_16bit (
	input reset,
	input write_clock,
	input [7:0] write_address,
	input [15:0] write_data,
	input write_enable,
	input read_clock,
	input [7:0] read_address,
	output [15:0] read_data
);
	wire [10:0] write_address11 = { 3'b000, write_address };
	wire [10:0] read_address11  = { 3'b000, read_address };
	SB_RAM40_4K #( // see SBTICETechnologyLibrary201504.pdf
		.WRITE_MODE(0), // configured as 256x16
		.READ_MODE(0)   // configured as 256x16
	) ram40_4k_inst (
		.WCLK(write_clock),
		.WADDR(write_address11),
		.WDATA(write_data),
		.WE(write_enable),
		.WCLKE(1),
		.MASK(16'b0),
		.RCLK(read_clock),
		.RADDR(read_address11),
		.RDATA(read_data),
		.RE(1),
		.RCLKE(1)
	);
endmodule

module RAM_ice40_512_8bit (
	input reset,
	input write_clock,
	input [8:0] write_address,
	input [7:0] write_data,
	input write_enable,
	input read_clock,
	input [8:0] read_address,
	output [7:0] read_data
);
	wire [10:0] write_address11 = { 2'b00, write_address };
	wire [10:0] read_address11  = { 2'b00, read_address };
	wire [15:0] write_data16 = { 8'h0, write_data };
	wire [15:0] read_data16;
	SB_RAM40_4K #( // see SBTICETechnologyLibrary201504.pdf
		.WRITE_MODE(1), // configured as 512x8
		.READ_MODE(1)   // configured as 512x8
	) ram40_4k_inst (
		.WCLK(write_clock),
		.WADDR(write_address11),
		.WDATA(write_data16),
		.WE(write_enable),
		.WCLKE(1),
		.MASK(16'b0),
		.RCLK(read_clock),
		.RADDR(read_address11),
		.RDATA(read_data16),
		.RE(1),
		.RCLKE(1)
	);
	assign read_data = read_data16[7:0];
endmodule

module RAM_ice40_1k_4bit (
	input reset,
	input write_clock,
	input [9:0] write_address,
	input [3:0] write_data,
	input write_enable,
	input read_clock,
	input [9:0] read_address,
	output [3:0] read_data
);
	wire [10:0] write_address11 = { 1'b0, write_address };
	wire [10:0] read_address11  = { 1'b0, read_address };
	wire [15:0] write_data16 = { 12'h0, write_data };
	wire [15:0] read_data16;
	SB_RAM40_4K #( // see MemoryUsageGuideforiCE40Devices.pdf
		.WRITE_MODE(2), // configured as 1kx4
		.READ_MODE(2)   // configured as 1kx4
	) ram40_1024x4_inst (
		.WCLK(write_clock),
		.WADDR(write_address11),
		.WDATA(write_data16),
		.WE(write_enable),
		.WCLKE(1),
		.RCLK(read_clock),
		.RADDR(read_address11),
		.RDATA(read_data16),
		.RE(1),
		.RCLKE(1)
	);
	assign read_data = read_data16[3:0];
endmodule

module RAM_ice40_2k_2bit (
	input reset,
	input write_clock,
	input [10:0] write_address,
	input [1:0] write_data,
	input write_enable,
	input read_clock,
	input [10:0] read_address,
	output [1:0] read_data
);
	wire [15:0] write_data16 = { 14'h0, write_data };
	wire [15:0] read_data16;
	SB_RAM40_4K #( // see MemoryUsageGuideforiCE40Devices.pdf
		.WRITE_MODE(3), // configured as 2kx2
		.READ_MODE(3)   // configured as 2kx2
	) ram40_1024x4_inst (
		.WCLK(write_clock),
		.WADDR(write_address),
		.WDATA(write_data16),
		.WE(write_enable),
		.WCLKE(1),
		.RCLK(read_clock),
		.RADDR(read_address),
		.RDATA(read_data16),
		.RE(1),
		.RCLKE(1)
	);
	assign read_data = read_data16[1:0];
endmodule

// modified from MemoryUsageGuideforiCE40Devices.pdf
module RAM_inferred #(
	parameter addr_width = 9,
	parameter data_width = 8
) (
	input reset,
	input [addr_width-1:0] waddr, raddr,
	input [data_width-1:0] din,
	input write_en, wclk, rclk,
	output reg [data_width-1:0] dout = 0
);
	reg [data_width-1:0] mem [(1<<addr_width)-1:0];
	always @(posedge wclk) begin
		if (reset) begin
//			for (i=0; i<waddr
		end else begin
			if (write_en) begin
				mem[waddr] <= din;
			end
		end
	end
	always @(posedge rclk) begin
		if (~reset) begin
			dout <= mem[raddr];
		end
	end
endmodule

module top (
	input clock100,
	input rpi_spi_sclk,
	input rpi_spi_mosi,
	output rpi_spi_miso,
	input rpi_spi_ce0,
	input rpi_spi_ce1,
	output pmod4_5,
	output pmod4_6,
	output pmod4_7,
	output pmod4_8,
	output led1,
	output led2,
	output led3
);
	reg reset1 = 1;
	wire clock_ram;
	wire clock_spi;
`ifdef USE_SLOW_CLOCK
	wire clock16;
	reg reset2 = 1;
	wire pll_locked;
	easypll #(.DIVR(4'd3), .DIVF(7'd40), .DIVQ(3'd6)) mp (.clock_input(clock100), .reset_active_low(~reset1), .global_clock_output(clock16), .pll_is_locked(pll_locked));
	assign clock_ram = clock16;
	assign clock_spi = clock16;
`else
	assign clock_ram = clock100;
	assign clock_spi = clock100;
`endif
	reg [7:0] reset_counter = 0;
	always @(posedge clock100) begin
		if (reset1) begin
			if (reset_counter[7]) begin
				reset1 <= 0;
			end else begin
				reset_counter <= reset_counter + 1'b1;
			end
`ifdef USE_SLOW_CLOCK
		end else if (reset2) begin
			if (pll_locked) begin
				reset2 <= 0;
			end
`endif
		end
	end
//`ifdef xilinx
//	assign clock16 = clock100, pll_locked = 1;
//	assign clock16 = clock100, pll_locked = 1;
//`endif
//	wire [7:0] data_from_controller;
//	wire [7:0] data_to_controller;
//	wire data_valid;
	wire [7:0] command8;
	wire [15:0] address16;
	wire [31:0] data32;
//	wire [15:0] write_data16;
//	wire [15:0] read_data16;
	wire [31:0] read_data32;
//	reg write_enable = 0;
	wire transaction_valid;
//	SPI_peripheral_simple8 spi_s8 (.clock(clock_spi), .SCK(rpi_spi_sclk), .MOSI(rpi_spi_mosi), .MISO(rpi_spi_miso), .SSEL(rpi_spi_ce0), .data_to_controller(data_to_controller), .data_from_controller(data_from_controller), .data_valid(data_valid));
	SPI_peripheral_command8_address16_data32 spi_c8_a16_d32 (.clock(clock_spi),
		.SCK(rpi_spi_sclk), .MOSI(rpi_spi_mosi), .MISO(rpi_spi_miso), .SSEL(rpi_spi_ce1),
		.transaction_valid(transaction_valid), .command8(command8), .address16(address16), .data32(data32), .data32_to_controller(read_data32));
`ifdef USE_INFERRED_RAM_16
	wire [3:0] address4 = address16[3:0];
	RAM_inferred #(.addr_width(4), .data_width(32)) myram (.reset(reset1),
		.wclk(clock_ram), .waddr(address4), .din(data32), .write_en(transaction_valid),
		.rclk(clock_ram), .raddr(address4), .dout(read_data32));
`elsif USE_BRAM_256
	wire [7:0] address8 = address16[7:0];
	RAM_ice40_256_32bit myram (.reset(reset1),
		.write_clock(clock_ram), .write_address(address8), .write_data(data32), .write_enable(transaction_valid),
		.read_clock(clock_ram), .read_address(address8), .read_data(read_data32));
`elsif USE_BRAM_512
	wire [8:0] address9 = address16[8:0];
	RAM_ice40_512_32bit myram (.reset(reset1),
		.write_clock(clock_ram), .write_address(address9), .write_data(data32), .write_enable(transaction_valid),
		.read_clock(clock_ram), .read_address(address9), .read_data(read_data32));
`elsif USE_BRAM_1K
	wire [9:0] address10 = address16[9:0];
	RAM_ice40_1k_32bit myram (.reset(reset1),
		.write_clock(clock_ram), .write_address(address10), .write_data(data32), .write_enable(transaction_valid),
		.read_clock(clock_ram), .read_address(address10), .read_data(read_data32));
`elsif USE_BRAM_2K
	wire [10:0] address11 = address16[10:0];
	RAM_ice40_2k_32bit myram (.reset(reset1),
		.write_clock(clock_ram), .write_address(address11), .write_data(data32), .write_enable(transaction_valid),
		.read_clock(clock_ram), .read_address(address11), .read_data(read_data32));
`endif
//	RAM_ice40_1k_16bit myram (.reset(reset2), .write_clock(clock_ram), .write_address(write_address10), .write_data(write_data16), .write_enable(write_enable), .read_clock(clock_ram), .read_address(read_address10), .read_data(read_data16));
//	reg [7:0] previous_data_from_controller = 0;
//	reg which16 = 0;
//	always @(posedge clock100) begin
//		case (which16)
//			2'b00:   begin read_data32[31:16] <= read_data16; end
//			default: begin read_data32[15:0]  <= read_data16; end
//		endcase
//		read_address10 <= { address16[8:0], which16 };
//		which16 <= ~which16;
//		if (transaction_valid) begin
//			write_enable <= 1;
//		end
//	end
//	assign data_to_controller = previous_data_from_controller;
//	assign led1 = reset1;
//	assign led2 = reset2;
	wire [2:0] leds = { led1, led2, led3 };
	//assign leds = data_from_controller[2:0];
	assign leds = data32[2:0];
//	assign pmod4_5 = rpi_spi_sclk;
//	assign pmod4_6 = rpi_spi_mosi;
//	assign pmod4_7 = rpi_spi_ce0;
//	assign pmod4_8 = rpi_spi_ce1;
//	assign rpi_spi_miso = 0;
	assign pmod4_5 = rpi_spi_sclk;
	assign pmod4_6 = rpi_spi_mosi;
	assign pmod4_7 = rpi_spi_miso;
	assign pmod4_8 = rpi_spi_ce1;
endmodule

module top_tb;
	reg SCK = 0;
	reg MOSI = 0;
	reg SSEL = 1;
	reg [7:0] i = 0;
	reg [7:0] j = 0;
	task automatic spi_c8_a16_d32_controller_transaction;
		input [7:0] command8;
		input [15:0] address16;
		input [31:0] data32;
		begin
			#300;
			SSEL <= 0;
			for (i=8; i>0; i=i-1) begin : command
				MOSI <= command8[i-1];
				#100;
				SCK <= 1;
				#100;
				SCK <= 0;
			end
			for (i=16; i>0; i=i-1) begin : address
				MOSI <= address16[i-1];
				#100;
				SCK <= 1;
				#100;
				SCK <= 0;
			end
			for (i=32; i>0; i=i-1) begin : data
				MOSI <= data32[i-1];
				#100;
				SCK <= 1;
				#100;
				SCK <= 0;
			end
			MOSI <= 0;
			#100;
			SSEL <= 1;
		end
	endtask
	reg clock100 = 0;
	reg rpi_spi_ce0 = 1;
	wire MISO;
	wire led1, led2, led3;
	top mytop (.clock100(clock100), .rpi_spi_sclk(SCK), .rpi_spi_mosi(MOSI), .rpi_spi_miso(MISO), .rpi_spi_ce0(rpi_spi_ce0), .rpi_spi_ce1(SSEL), .led1(led1), .led2(led2), .led3(led3));
//	reg [7:0] command8 = 8'h01;
//	reg [15:0] address16 = 16'h0045;
//	reg [31:0] data32 = 32'h6789abcd;
	initial begin
		SCK <= 0;
		MOSI <= 0;
		SSEL <= 1;
		spi_c8_a16_d32_controller_transaction(8'h01, 16'h0001, 32'h01234567);
		spi_c8_a16_d32_controller_transaction(8'h01, 16'h0001, 32'h01234567);
		spi_c8_a16_d32_controller_transaction(8'h01, 16'h0101, 32'h89abcdef);
		spi_c8_a16_d32_controller_transaction(8'h01, 16'h0101, 32'h89abcdef);
		spi_c8_a16_d32_controller_transaction(8'h01, 16'h0001, 32'h01234567);
//		for (j=0; j<3; j=j+1) begin : twice
//		end
		#200;
		//$finish;
	end
	always begin
		#10;
		clock100 <= ~clock100;
	end
endmodule

