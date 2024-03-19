module game_logo_display
    (
        input wire clk,             // input clock signal for synchronous rom
        input wire [9:0] x, y,      // current pixel coordinates from vga_sync circuit
        output wire [11:0] rgb_out // output rgb signal for current pixel
        );
	
	// vectors to index game_logo_rom
	wire [5:0] row;
	wire [8:0] col;
	assign row = y - 64;
	assign col = x - 136;
	
	// instantiate game_logo_rom
	 game_logo_rom  game_logo_romgameover_rom_unit (.clk(clk), .row(row), .col(col), .color_data(rgb_out));

endmodule