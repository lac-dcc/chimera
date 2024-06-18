// This program was cloned from: https://github.com/trabucayre/GateMate_demos
// License: MIT License

// Mouse needs pins to be IN/OUT if I set pins as INOUT in CCF then keyboard does not work

`default_nettype none

module colorBarVGAPS2
#(
  parameter ps2core = 2 // 0-minimig 1-oberon 2-keyboard
)
(
	input clk_i, 
	input rstn_i,
	output [3:0] o_r,
	output [3:0] o_g,
	output [3:0] o_b,
	output o_vsync,
	output o_hsync,
	output o_clk,
	output o_rst,
	inout ps2clk,
	inout ps2data,
	output o_led
);

wire clk_pix, lock;


/* PLL for 125MHz (1/2 hdmi clk rate) */
pll pll_inst (
    .clock_in(clk_i), // 10 MHz
	.rst_in(~rstn_i),
    .clock_out(clk_pix), // 40 MHz, 0 deg
    .locked(lock)
);

assign o_clk = 1'b0;//clk_pix;
assign o_rst = 1'b0;//lock;

reg [19:0] reset_counter;
always @(posedge clk_pix)
begin
  if(rstn_i == 1'b1 && reset_counter[19] == 1'b0)
    reset_counter <= reset_counter + 1;
  if(rstn_i == 1'b0)
    reset_counter <= 0;
end
wire reset;
assign reset = reset_counter[19];

wire mouse_update;
reg [10:0] mouse_x, mouse_y, mouse_z;
reg [2:0] mouse_btn;

reg [7:0] ps2_keyboard_code;

generate
  if(ps2core == 0) // using minimig core
  begin
    wire ps2mdat_in, ps2mclk_in, ps2mdat_out, ps2mclk_out;
    assign ps2clk = ps2mclk_out ? 1'bz : 1'b0;
    assign ps2data = ps2mdat_out ? 1'bz : 1'b0;
    assign ps2mclk_in = ps2clk;
    assign ps2mdat_in = ps2data;
    ps2mouse
    #(
      .c_x_bits(11),
      .c_y_bits(11)
    )
    ps2mouse_minimig_inst
    (
      .clk(clk_pix),
      .reset(reset),
      .ps2mdati(ps2mdat_in),
      .ps2mclki(ps2mclk_in),
      .ps2mdato(ps2mdat_out),
      .ps2mclko(ps2mclk_out),
      .xcount(mouse_x),
      .ycount(mouse_y),
      .btn(mouse_btn)
    );
    assign mouse_update = 1'b1;
  end
  if(ps2core == 1) // using oberon core
  begin
    mousem
    #(
      .c_x_bits(11),
      .c_y_bits(11),
      .c_z_bits(11),
      .c_hotplug(1)
    )
    ps2mouse_oberon_inst
    (
      .clk(clk_pix),
      .clk_ena(1'b1),
      .ps2m_reset(reset),
      .ps2m_clk(ps2clk),
      .ps2m_dat(ps2data),
      .update(mouse_update),
      .x(mouse_x),
      .y(mouse_y),
      .z(mouse_z),
      .btn(mouse_btn)
    );
  end
  if(ps2core == 2) // using oberon core
  begin
	ps2kbd kbd(clk_pix, ps2clk, ps2data, ps2_keyboard_code, , );
  end

endgenerate

    parameter C_bits = 64; // can be 8 bu easier to read if some bits are 0x00
    reg [C_bits-1:0] R_display; // something to display
    always @(posedge clk_pix)
    begin
      R_display[63:47] <= mouse_x;
      R_display[46:36] <= mouse_x;
      R_display[35:25] <= mouse_y;
      R_display[24:14] <= mouse_z;
      R_display[13:11] <= mouse_btn;
      R_display[10:8] <= 2'b00;
      R_display[7:0] <= ps2_keyboard_code;
    end

    parameter C_color_bits = 16; 
    wire [9:0] x;
    wire [9:0] y;
    // for reverse screen:
    wire [9:0] rx = 636-x;
    wire [C_color_bits-1:0] color;
    hex_decoder_v
    #(
        .c_data_len(C_bits),
        .c_row_bits(4), // 2**n digits per row (4*2**n bits/row) 3->32, 4->64, 5->128, 6->256 
        .c_grid_6x8(0), // NOTE: TRELLIS needs -abc9 option to compile
        .c_font_file("../libs/hex/hex_font.mem"),
        .c_x_bits(8),
        .c_y_bits(4),
	.c_color_bits(C_color_bits)
    )
    hex_decoder_v_inst
    (
        .clk(clk_pix),
        .data(R_display),
        .x(rx[9:2]),
        .y(y[5:2]),
        .color(color)
    );

	assign o_led = reset; 

	assign o_r = color[15:12];
	assign o_g = color[10:7];
	assign o_b = color[4:1];

	wire vga_hsync, vga_vsync, vga_blank;

	vga
	vga_instance
	(
	  .clk_pixel(clk_pix),
	  .clk_pixel_ena(1'b1),
	  .test_picture(1'b0), // enable test picture generation
	  .beam_x(x),
	  .beam_y(y),
	  //.vga_r(vga_r),
	  //.vga_g(vga_g),
	  //.vga_b(vga_b),
	  .vga_hsync(o_hsync),
	  .vga_vsync(o_vsync),
	  .vga_blank(vga_blank)
	);

endmodule
