// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-08-06 by mza
// updated 2020-05-29 by mza
// last updated 2021-02-04 by mza

`define icestick
`include "lib/hex2bcd.v"
`include "lib/uart.v"
`include "lib/i2c.v"

module mytop (input clock, output [5:1] LED, 
output [7:0] J1,
output [7:0] J2,
output [7:0] J3,
output sda_out,
output reg sda_dir,
input sda_in,
input RX,
output TX
);
	wire [6:0] i2c_address = 7'h27; // honeywell HIH6121 i2c humidity sensor
	wire ack;
	wire error;
	reg start_i2c_transfer = 0;
	wire busy;
	assign J1 = 0;
	assign J2[2] = scl;
	assign J2[7:4] = 0;
	assign J2[1:0] = 0;
	assign LED[5] = ~error;
	assign LED[4] = ack;
	assign LED[3] = uart_busy;
	assign LED[2] = busy;
	assign LED[1] = start_i2c_transfer;
	assign J3[7:4] = 0;
	assign J3[3] = sda_dir;
	assign J3[2] = sda_in;
	assign J3[1] = sda_out;
	wire scl;
	assign J3[0] = scl;
	reg [31:0] counter = 0;
	localparam length_of_line = 6+6+6+2;
	reg [7:0] uart_character_counter = 0;
	reg uart_transfers_are_allowed = 0;
	localparam i2c_clock_pickoff = 5; // yields 187.5 kHz
	localparam uart_character_pickoff = 11; // this is already close to the limit for 115200
	localparam uart_line_pickoff = 22;
	localparam slow_clock_pickoff = uart_line_pickoff;
	reg [15:0] uart_line_counter = 0;
	reg uart_resetb = 0;
	reg [7:0] relative_humidity = 0;
	reg [7:0] temperature = 0;
	always @(posedge clock) begin
		counter++;
		if (~uart_resetb) begin
			if (counter[31:15]==0) begin
				uart_line_counter <= 0;
				uart_resetb <= 0;
				uart_character_counter <= length_of_line - 1;
				uart_transfers_are_allowed <= 0;
			end else begin
				uart_resetb <= 1;
			end
		end
		if (counter[slow_clock_pickoff:0]==0) begin
			buffered_bcd1 <= bcd1;
			buffered_bcd2 <= bcd2;
			buffered_bcd3 <= bcd3;
		end else if (counter[slow_clock_pickoff:0]==1) begin
			immediate_humidity[13:8] <= byte_a[5:0];
			immediate_humidity[7:0] <= byte_b;
			immediate_temperature[13:6] <= byte_c;
			immediate_temperature[5:0] <= byte_d[7:2];
		end else if (counter[slow_clock_pickoff:0]==2) begin
			// datasheet says to divide the raw number by (2^14-2)
			// to get the % relative humidity
			// but to get just the ##% value, can just divide by
			// 163.82, but a fair approximation to this is to
			// multiply by 100
			// (shift-left-by-2+shift-left-by-5+shift-left-by-6)
			// and then divide by 2^14 (shift-right-by-14)
			//relative_humidity = immediate_humidity[13:8] + immediate_humidity[13:9];
			// temp = value/(2^14-2)*165-40 ~= value/100-40
			temperature = immediate_temperature[13:7] + immediate_temperature[13:9] - 40;
		end else if (counter[slow_clock_pickoff:0]==3) begin
			value1 <= uart_line_counter;
			//value2 <= { 2'b00, immediate_humidity };
			//value3 <= { 8'h00, relative_humidity };
			value2 <= { 2'b00, immediate_temperature };
			value3 <= { 8'h00, temperature };
		end else begin
			if (busy==1) begin
				start_i2c_transfer <= 0;
			end else begin
				start_i2c_transfer <= 1;
			end
		end
		if (counter[uart_line_pickoff:0]==0) begin // less frequent
			uart_transfers_are_allowed <= 1;
			uart_line_counter++;
		end
		if (counter[uart_character_pickoff:0]==1) begin // more frequent
			if (uart_transfers_are_allowed==1) begin
				if (uart_character_counter<=length_of_line) begin
					start_uart_transfer <= 1;
					uart_character_counter++;
				end else begin
					uart_transfers_are_allowed <= 0;
					uart_character_counter = 0;
				end
			end
		end else begin
			start_uart_transfer <= 0;
		end
		if (uart_character_counter==length_of_line) begin
			byte_to_send <= 8'h0d; // cr
		end else if (uart_character_counter==length_of_line+1) begin
			byte_to_send <= 8'h0a; // nl
		end else if (uart_character_counter==1) begin
			byte_to_send <= { 4'h3, buffered_bcd1[23:20] };
		end else if (uart_character_counter==2) begin
			byte_to_send <= { 4'h3, buffered_bcd1[19:16] };
		end else if (uart_character_counter==3) begin
			byte_to_send <= { 4'h3, buffered_bcd1[15:12] };
		end else if (uart_character_counter==4) begin
			byte_to_send <= { 4'h3, buffered_bcd1[11:08] };
		end else if (uart_character_counter==5) begin
			byte_to_send <= { 4'h3, buffered_bcd1[07:04] };
		end else if (uart_character_counter==6) begin
			byte_to_send <= { 4'h3, buffered_bcd1[03:00] };
		end else if (uart_character_counter==7) begin
			byte_to_send <= 8'h20;
		end else if (uart_character_counter==8) begin
			byte_to_send <= { 4'h3, buffered_bcd2[23:20] };
		end else if (uart_character_counter==9) begin
			byte_to_send <= { 4'h3, buffered_bcd2[19:16] };
		end else if (uart_character_counter==10) begin
			byte_to_send <= { 4'h3, buffered_bcd2[15:12] };
		end else if (uart_character_counter==11) begin
			byte_to_send <= { 4'h3, buffered_bcd2[11:08] };
		end else if (uart_character_counter==12) begin
			byte_to_send <= { 4'h3, buffered_bcd2[07:04] };
		end else if (uart_character_counter==13) begin
			byte_to_send <= { 4'h3, buffered_bcd2[03:00] };
		end else if (uart_character_counter==14) begin
			byte_to_send <= 8'h20;
		end else if (uart_character_counter==15) begin
			byte_to_send <= { 4'h3, buffered_bcd3[11:08] };
		end else if (uart_character_counter==16) begin
			byte_to_send <= { 4'h3, buffered_bcd3[07:04] };
		end else if (uart_character_counter==17) begin
			byte_to_send <= { 4'h3, buffered_bcd3[03:00] };
		end else begin
			byte_to_send <= 8'h20;
		end
	end
	reg [13:0] immediate_humidity = 0;
	reg [13:0] immediate_temperature = 0;
	wire [23:0] bcd1;
	wire [23:0] bcd2;
	wire [11:0] bcd3;
	reg [23:0] buffered_bcd1 = 0;
	reg [23:0] buffered_bcd2 = 0;
	reg [11:0] buffered_bcd3 = 0;
	reg [15:0] value1 = 0;
	reg [15:0] value2 = 0;
	reg [7:0] value3 = 0;
	hex2bcd #(.INPUT_SIZE_IN_NYBBLES(4)) h2binst1 ( .clock(clock), .reset(~uart_resetb), .hex_in(value1), .bcd_out(bcd1), .sync() );
	hex2bcd #(.INPUT_SIZE_IN_NYBBLES(4)) h2binst2 ( .clock(clock), .reset(~uart_resetb), .hex_in(value2), .bcd_out(bcd2), .sync() );
	hex2bcd #(.INPUT_SIZE_IN_NYBBLES(2)) h2binst3 ( .clock(clock), .reset(~uart_resetb), .hex_in(value3), .bcd_out(bcd3), .sync() );
//	reg [13:0] previous_humidity;
//	reg [13:0] previous_temperature;
//	localparam number_of_samples_to_accumulate = 8;
//	localparam log2_of_number_of_samples_to_accumulate = $clog2(number_of_samples_to_accumulate);
//	reg [13+log2_of_number_of_samples_to_accumulate:0] accumulated_humidity;
//	reg [13+log2_of_number_of_samples_to_accumulate:0] accumulated_temperature;
//	reg [log2_of_number_of_samples_to_accumulate-1:0] counter_for_accumulating;
//	localparam accumulation_clock_pickoff = i2c_clock_pickoff + log2_of_number_of_samples_to_accumulate + 1;
//	assign counter_for_accumulating = counter[accumulation_clock_pickoff];
//	wire accumulation_clock = counter[accumulation_clock_pickoff-1];
//	always @(posedge accumulation_clock) begin
		//immediate_humidity[13:8] <= byte[0][5:0];
		//immediate_humidity[7:0] <= byte[1];
		//immediate_temperature[13:6] <= byte[2];
		//immediate_temperature[5:0] <= byte[3][7:2];
//		if (counter_for_accumulating==0) begin
//			accumulated_humidity = 0;
//			accumulated_temperature = 0;
//		end else begin
//			accumulated_humidity = accumulated_humidity + previous_humidity;
//			accumulated_temperature = accumulated_temperature + previous_temperature;
//		end
//	end
	wire [7:0] byte_a;
	wire [7:0] byte_b;
	wire [7:0] byte_c;
	wire [7:0] byte_d;
	wire i2c_clock;
	assign i2c_clock = counter[i2c_clock_pickoff];
	wire i2c_busy;
	reg start_i2c_transfer = 0;
	i2c_send_one_byte_and_read_one_plus_four_bytes_back myinstance(
		.clock(i2c_clock),
		.address(i2c_address),
		.scl(scl),
		.sda_out(sda_out),
		.sda_dir(sda_dir),
		.sda_in(sda_in),
		.start_transfer(start_i2c_transfer),
		.busy(busy),
		.ack(ack),
		.error(error),
		.byte_a(byte_a),
		.byte_b(byte_b),
		.byte_c(byte_c),
		.byte_d(byte_d)
	);
	wire uart_busy;
	reg start_uart_transfer = 0;
	reg [7:0] byte_to_send = 0;
	wire uart_character_clock;
	assign uart_character_clock = counter[uart_character_pickoff];
	uart my_uart_instance (.clk(clock), .resetq(uart_resetb), .uart_busy(uart_busy), .uart_tx(TX), .uart_wr_i(start_uart_transfer), .uart_dat_i(byte_to_send));
endmodule // mytop

module top (
	input CLK,
	output LED1, LED2, LED3, LED4, LED5,
	output J1_3, J1_4, J1_5, J1_6, J1_7, J1_8, J1_9, J1_10,
	//inout J2_1, J2_2, J2_3, J2_4, J2_7, J2_8, J2_9, J2_10,
	inout J2_4,
	output J2_1, J2_2, J2_3, J2_7, J2_8, J2_9, J2_10,
	output J3_3, J3_4, J3_5, J3_6, J3_7, J3_8, J3_9, J3_10,
	output DCDn, DSRn, CTSn, TX, IR_TX, IR_SD,
	input DTRn, RTSn, RX, IR_RX
);
	wire [7:0] J1 = { J1_10, J1_9, J1_8, J1_7, J1_6, J1_5, J1_4, J1_3 };
	wire [7:0] J2 = { J2_10, J2_9, J2_8, J2_7, J2_4, J2_3, J2_2, J2_1 };
	wire [7:0] J3 = { J3_10, J3_9, J3_8, J3_7, J3_6, J3_5, J3_4, J3_3 };
	wire [5:1] LED = { LED5, LED4, LED3, LED2, LED1 };
	assign { DCDn, DSRn, CTSn } = 1;
	assign { IR_TX, IR_SD } = 0;
	wire sda_dir;
	wire sda_in;
	wire sda_out;
	mytop mytop_instance (.clock(CLK), .LED(LED), .J1(J1), .J2(J2), .J3(J3),
		.sda_out(sda_out), .sda_in(sda_in), .sda_dir(sda_dir), .TX(TX), .RX(RX));
	SB_IO #(
		.PIN_TYPE(6'b 1010_01), // 1010 = output is tristated; 01 = input is normal
		.PULLUP(1'b 0)
	) my_i2c_data_pin (
		.PACKAGE_PIN(J2[3]),
		.OUTPUT_ENABLE(sda_dir),
//		.D_OUT_0(sda_out ? 1'b1 : 1'bz),
		.D_OUT_0(sda_out),
		.D_IN_0(sda_in)
	);
endmodule // icestick

