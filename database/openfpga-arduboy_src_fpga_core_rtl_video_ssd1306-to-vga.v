// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the SSD1306 OLED display implementation.
 * 
 * Copyright (C) 2020  Iulian Gheorghiu (morgoth@devboard.tech)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
 
`timescale 1ns / 1ps


module ssd1306 # (
	parameter X_OLED_SIZE = 128,
	parameter Y_OLED_SIZE = 64,
	parameter X_PARENT_SIZE = 1280,
	parameter Y_PARENT_SIZE = 800,
	parameter PIXEL_INACTIVE_COLOR = 32'h10101010,
	parameter PIXEL_ACTIVE_COLOR = 32'hE0E0E0E0,
	parameter INACTIVE_DISPLAY_COLOR = 32'h00000000,
	parameter VRAM_BUFFERED_OUTPUT = "TRUE",
	parameter FULL_COLOR_OUTPUT = "TRUE"
	)(
	input rst_i,
	input clk_i,
	
	input [(FULL_COLOR_OUTPUT == "TRUE" ? 31 : 0):0]edge_color_i,
	input [/*clogb2(X_PARENT_SIZE > Y_PARENT_SIZE ? X_PARENT_SIZE : Y_PARENT_SIZE) - 1*/12:0]raster_x_i,
	input [/*clogb2(X_PARENT_SIZE > Y_PARENT_SIZE ? X_PARENT_SIZE : Y_PARENT_SIZE) - 1*/12:0]raster_y_i,
	input raster_clk_i,
	output reg[(FULL_COLOR_OUTPUT == "TRUE" ? 31 : 0):0]raster_d_o,
	
	input ss_i,
	input scl_i,
	input mosi_i,
	input dc_i
    );

/* SPI wires & regs*/
wire [7:0]bus_in;
wire rdy;
reg rdy_ack;
wire [7:0]bus_out;
wire first_byte;
/* !SPI wires */
reg [3:0]dc_del;

/* SPI module instance */
spi_slave # (
	.MAX_BITS_PER_WORD(8),
	.USE_TX("FALSE"),
	.USE_RX("TRUE")
	)spi_slave_inst(
	.rst_i(rst_i/* | dc ^ dc_del*/),
	.clk_i(clk_i),
	.en_i(1'b1),
	.bit_per_word_i(4'd8),
	.lsb_first_i(1'b0),
	.ss_i(ss_i),
	.scl_i(scl_i),
	.miso_o(),
	.mosi_i(mosi_i),
	.bus_i(bus_in),
	.rdy_o(rdy),
	.rdy_ack_i(rdy_ack),
	.bus_o(bus_out),
	.first_byte_o(first_byte),
	.last_byte_o(),
	.last_byte_ack_i()
	);
/* !SPI module instance */

/* BUFFER */
localparam X_RATIO = X_PARENT_SIZE / X_OLED_SIZE;
localparam Y_RATIO = Y_PARENT_SIZE / Y_OLED_SIZE;
localparam USED_RATIO = ((Y_RATIO > X_RATIO) ? X_RATIO : Y_RATIO);
localparam XY_PARENT_TO_OLED_RATIO = (USED_RATIO < 2) ? 1 : ((USED_RATIO < 4) ? 2 : ((USED_RATIO < 8) ? 4 : ((USED_RATIO < 16) ? 8 : 16)));
localparam XPOS_LSB_BIT = (XY_PARENT_TO_OLED_RATIO == 1) ? 0 : ((XY_PARENT_TO_OLED_RATIO == 2) ? 1 : ((XY_PARENT_TO_OLED_RATIO == 4) ? 2 : ((XY_PARENT_TO_OLED_RATIO == 8) ? 3 : 4)));
localparam XPOS_HSB_BIT = (XY_PARENT_TO_OLED_RATIO == 1) ? 6 : ((XY_PARENT_TO_OLED_RATIO == 2) ? 7 : ((XY_PARENT_TO_OLED_RATIO == 4) ? 8 : ((XY_PARENT_TO_OLED_RATIO == 8) ? 9 : 10)));
localparam YPOS_LSB_BIT = (XY_PARENT_TO_OLED_RATIO == 1) ? 0 : ((XY_PARENT_TO_OLED_RATIO == 2) ? 1 : ((XY_PARENT_TO_OLED_RATIO == 4) ? 2 : ((XY_PARENT_TO_OLED_RATIO == 8) ? 3 : 4)));
localparam YPOS_HSB_BIT = (XY_PARENT_TO_OLED_RATIO == 1) ? 5 : ((XY_PARENT_TO_OLED_RATIO == 2) ? 6 : ((XY_PARENT_TO_OLED_RATIO == 4) ? 7 : ((XY_PARENT_TO_OLED_RATIO == 8) ? 8 : 9)));
/* !BUFFER */

wire [6:0]raster_x = raster_x_i[XPOS_HSB_BIT : XPOS_LSB_BIT];
wire [5:0]raster_y = raster_y_i[YPOS_HSB_BIT : YPOS_LSB_BIT];

/* SSD1306 logick wires & regs */

`define SSD1306_MEMORYMODE          8'h20 ///< See datasheet / 2 Bytes
`define SSD1306_COLUMNADDR          8'h21 ///< See datasheet / 3 Bytes
`define SSD1306_PAGEADDR            8'h22 ///< See datasheet / 3 Bytes
`define SSD1306_SETCONTRAST         8'h81 ///< See datasheet / 2 Bytes
`define SSD1306_CHARGEPUMP          8'h8D ///< See datasheet / 2 Byte
`define SSD1306_SEGREMAP            8'hA0 ///< See datasheet / 1 Byte
`define SSD1306_DISPLAYALLON_RESUME 8'hA4 ///< See datasheet / 1 Byte
`define SSD1306_DISPLAYALLON        8'hA5 ///< Not currently used / 1 Byte
`define SSD1306_NORMALDISPLAY       8'hA6 ///< See datasheet / 1 Byte
`define SSD1306_INVERTDISPLAY       8'hA7 ///< See datasheet / 1 Byte
`define SSD1306_SETMULTIPLEX        8'hA8 ///< See datasheet / 2 Bytes
`define SSD1306_DISPLAYOFF          8'hAE ///< See datasheet / 1 Byte
`define SSD1306_DISPLAYON           8'hAF ///< See datasheet / 1 Byte
`define SSD1306_COMSCANINC          8'hC0 ///< Not currently used / 1 Byte
`define SSD1306_COMSCANDEC          8'hC8 ///< See datasheet / 1 Byte
`define SSD1306_SETDISPLAYOFFSET    8'hD3 ///< See datasheet / 2 Bytes
`define SSD1306_SETDISPLAYCLOCKDIV  8'hD5 ///< See datasheet / 2 Bytes
`define SSD1306_SETPRECHARGE        8'hD9 ///< See datasheet / 2 Bytes
`define SSD1306_SETCOMPINS          8'hDA ///< See datasheet / 2 Bytes
`define SSD1306_SETVCOMDETECT       8'hDB ///< See datasheet / 2 Bytes

`define SSD1306_SETLOWCOLUMN        8'h00 ///< Not currently used
`define SSD1306_SETHIGHCOLUMN       8'h10 ///< Not currently used
`define SSD1306_SETSTARTLINE        8'h40 ///< See datasheet

`define SSD1306_EXTERNALVCC         8'h01 ///< External display voltage source
`define SSD1306_SWITCHCAPVCC        8'h02 ///< Gen. display voltage from 3.3V

`define SSD1306_RIGHT_HORIZONTAL_SCROLL              8'h26 ///< Init rt scroll
`define SSD1306_LEFT_HORIZONTAL_SCROLL               8'h27 ///< Init left scroll
`define SSD1306_VERTICAL_AND_RIGHT_HORIZONTAL_SCROLL 8'h29 ///< Init diag scroll
`define SSD1306_VERTICAL_AND_LEFT_HORIZONTAL_SCROLL  8'h2A ///< Init diag scroll
`define SSD1306_DEACTIVATE_SCROLL                    8'h2E ///< Stop scroll
`define SSD1306_ACTIVATE_SCROLL                      8'h2F ///< Start scroll
`define SSD1306_SET_VERTICAL_SCROLL_AREA             8'hA3 ///< Set scroll range

reg [1:0]byte_cnt;
reg spi_rdy_n;
reg [6:0]x_cnt;
reg [2:0]y_cnt;
reg [9:0]write_addr;
reg [7:0]write_data;
reg [7:0]curr_cmd;
reg [1:0]curr_cmd_len;
reg on;
reg invert;
reg mem_wr;

(* ram_style="block" *)
reg [7:0]buff[1023:0];

reg [7:0]data_out_tmp;
always @ (posedge clk_i)
begin
	if(mem_wr)
	begin
		buff[write_addr] <= write_data;
	end
end

wire image_out = (raster_x_i[12 : XPOS_LSB_BIT] < X_OLED_SIZE && raster_y_i[12 : YPOS_LSB_BIT] < Y_OLED_SIZE);

always @ *
begin
	if(FULL_COLOR_OUTPUT == "TRUE")
	begin
		raster_d_o =  image_out ? (on ? ((invert ^ data_out_tmp[raster_y[2:0]]) ? PIXEL_ACTIVE_COLOR : PIXEL_INACTIVE_COLOR) : INACTIVE_DISPLAY_COLOR) : edge_color_i;
	end
	else
	begin
		raster_d_o =  image_out ? (on ? ((invert ^ data_out_tmp[raster_y[2:0]]) ? 1'b1 : 1'b0) : 1'b0) : edge_color_i;
	end
end

always @ *
begin
	if(VRAM_BUFFERED_OUTPUT != "TRUE")
	begin
		//data_out_tmp <= buff[{raster_y_i[YPOS_HSB_BIT:YPOS_LSB_BIT + 3], raster_x_i[XPOS_HSB_BIT:XPOS_LSB_BIT]}];
		data_out_tmp = buff[{raster_y[5:3], raster_x}];
	end
end

always @ (posedge raster_clk_i)
begin
	if(VRAM_BUFFERED_OUTPUT == "TRUE")
	begin
		data_out_tmp <= buff[{raster_y[5:3], raster_x}];
	end
end

reg latched_dc_command = 0;

// Cmd receive
always @ (posedge rst_i or posedge clk_i)
begin
	if(rst_i)
	begin
		byte_cnt = 2'h0;
		rdy_ack <= 1'b0;
		spi_rdy_n <= 1'b0;
		x_cnt <= 7'h0;
		y_cnt <= 6'h0;
		curr_cmd = 8'h00;
		curr_cmd_len = 2'h0;
		on <= 1'b0;
		mem_wr <= 1'b0;
		write_addr <= 10'h000;
		write_data <= 8'h00;
		dc_del <= 1'b1;
		invert <= 1'b0;
	end
	else
	begin
		mem_wr <= 1'b0;
		if(~rdy)
		begin
			rdy_ack <= 1'b0;

			if (~dc_i && scl_i) begin
				// Data was sent while in command mode
				// Latch command prompt
				latched_dc_command <= 1;
			end
		end
		dc_del <= {dc_del, dc_i};
		spi_rdy_n <= rdy;

		if({spi_rdy_n, rdy} == 2'b01)
		begin
			rdy_ack <= 1'b1;
			// If is data, and no command in progress
			if(dc_i && ~latched_dc_command)
			begin // Data
				mem_wr <= 1'b1;
				write_addr <= {y_cnt, x_cnt};
				write_data <= bus_out;
				{y_cnt, x_cnt} <= {y_cnt, x_cnt} + 10'd1;
				byte_cnt = 2'd0;
				curr_cmd_len = 2'd0;
				curr_cmd = 8'h00;

				latched_dc_command <= 0;
			end
			else
			begin // Command
				byte_cnt = byte_cnt + 7'h1;
				if(curr_cmd_len == 2'd0)
				begin
					curr_cmd = bus_out;
					case(bus_out)
						`SSD1306_COLUMNADDR,
						`SSD1306_PAGEADDR: curr_cmd_len = 2'd3;
						`SSD1306_MEMORYMODE,
						`SSD1306_SETCONTRAST,
						`SSD1306_CHARGEPUMP,
						`SSD1306_SETMULTIPLEX,
						`SSD1306_SETDISPLAYOFFSET,
						`SSD1306_SETDISPLAYCLOCKDIV,
						`SSD1306_SETPRECHARGE,
						`SSD1306_SETCOMPINS,
						`SSD1306_SETVCOMDETECT: curr_cmd_len = 2'd2;
						default: curr_cmd_len = 2'd1;
					endcase
				end
				if(curr_cmd_len == byte_cnt)
				begin
					case(curr_cmd)
						`SSD1306_COLUMNADDR: x_cnt <= bus_out;
						`SSD1306_PAGEADDR: y_cnt <= bus_out;
						`SSD1306_DISPLAYOFF: on <= 1'b0;
						`SSD1306_DISPLAYON: on <= 1'b1;
						`SSD1306_INVERTDISPLAY: invert <= 1'b1;
						`SSD1306_NORMALDISPLAY: invert <= 1'b0;
					endcase
					byte_cnt = 2'd0;
					curr_cmd_len = 2'd0;
					curr_cmd = 8'h00;

					latched_dc_command <= 0;
				end
			end
		end
	end
end

/* !SSD1306 logick wires & regs */
//  The following function calculates the address width based on specified data depth
function integer clogb2;
	input integer depth;
	for (clogb2=0; depth>0; clogb2=clogb2+1)
		depth = depth >> 1;
endfunction

endmodule
