`default_nettype none
`timescale 1ns / 1ps

module video_converter (
	input  wire        reset,
	input  wire        clock,
	// gameboy signals
	input  wire  [1:0] pixel_data,
	input  wire        hsync, // active high
	input  wire        vsync, // active high
	input  wire        data_latch,
	// vga signals
	input  wire        pixel_clock,
	output wire [23:0] vga_rgb,
	output wire        vga_hsync,
	output wire        vga_vsync
	);

	// game boy screen size
	parameter GB_SCREEN_WIDTH = 10'd160;
	parameter GB_SCREEN_HEIGHT = 10'd144;
	
	// toggle for which is the front buffer
	// 0 -> buffer1 is front buffer
	// 1 -> buffer2 is front buffer
	reg front_buffer;
	
	wire[14:0] write_addr;
	wire[1:0] read_data;
	
	wire[14:0] b1_addr;
	wire b1_clk;
	wire[1:0] b1_din;
	wire[1:0] b1_dout;
	wire b1_we;	// active high
	
	wire[14:0] b2_addr;
	wire b2_clk;
	wire[1:0] b2_din;
	wire[1:0] b2_dout;
	wire b2_we;	// active high
	
	reg[1:0] last_pixel_data;
	reg[14:0] last_write_addr;
	
	assign b1_we = front_buffer ? (data_latch) : 0;
	assign b2_we = front_buffer ? 0 : (data_latch);
	
	assign read_data = (front_buffer) ? b2_dout : b1_dout;
	assign b1_din = (front_buffer) ? pixel_data : 0;
	assign b2_din = (front_buffer) ? 0 : pixel_data;
	
	BUFGMUX clock_mux_b1(.S(front_buffer), .O(b1_clk),
				.I0(pixel_clock), .I1(clock));
	BUFGMUX clock_mux_b2(.S(front_buffer), .O(b2_clk),
				.I0(clock), .I1(pixel_clock));
				
	// internal buffer ram
	frame_buffer buffer1(
		b1_addr,
		b1_clk,
		b1_din,
		b1_dout,
		b1_we
	);
	
	frame_buffer buffer2(
		b2_addr,
		b2_clk,
		b2_din,
		b2_dout,
		b2_we
	);
	
	reg gb_last_vsync;
	reg gb_last_hsync;
	reg gb_last_latch;
	reg [7:0] gb_line_count;
	reg [7:0] gb_pixel_count;
	
	// handle writing into the back_buffer
	always @ (posedge clock)
	begin
		if(reset)
		begin
			front_buffer <= 1'b0;
			gb_last_vsync <= 1'b0;
			gb_last_hsync <= 1'b0;
			gb_last_latch <= 1'b0;
		end
		else
		begin
			gb_last_vsync <= vsync;
			gb_last_hsync <= hsync;
			gb_last_latch <= data_latch;
		end
		
		// negedge hsync
		if (gb_last_hsync && !hsync)
		begin
			gb_line_count <= gb_line_count + 1;
		end
		
		// negedge data_latch
		if (gb_last_latch && !data_latch)
		begin
			gb_pixel_count <= gb_pixel_count + 1;
		end
		
		// posedge vsync
		if(!gb_last_vsync && vsync)
		begin
			front_buffer <= !front_buffer;
			gb_line_count <= 0;
			gb_pixel_count <= 0;
		end
	end
	
	// handle output to the vga module
	wire [9:0] pixel_count, line_count;
	vga_controller vgac(pixel_clock, reset, vga_hsync, vga_vsync, pixel_count, line_count);
	
	// write to our current counter
	assign write_addr = gb_line_count * 160 + gb_pixel_count;
	
	parameter X_OFFSET = 160;
	parameter Y_OFFSET = 76;
	
	// read from where the vga wants to read
	wire[14:0] buffer_pos = ((line_count - Y_OFFSET) >> 1) * 160 + ((pixel_count - X_OFFSET) >> 1);
	
	assign b1_addr = (front_buffer) ? write_addr : buffer_pos;
	assign b2_addr = (front_buffer) ? buffer_pos : write_addr;
	
	// generate a gameboy color
	// 00 -> white
	// 01 -> light gray
	// 10 -> dark gray
	// 11 -> black
	
	wire [7:0] my_color = (pixel_count >= X_OFFSET && line_count >= Y_OFFSET && pixel_count < X_OFFSET + 320 && line_count < Y_OFFSET + 288) ?
									(read_data == 2'b00) ? 8'b11111111 : 
									((read_data == 2'b01) ? 8'b10101010 :
									((read_data == 2'b10) ? 8'b01010101 : 8'b00000000)) : 8'b00000000;
	
	assign vga_rgb = { my_color, my_color, my_color };
	
endmodule
