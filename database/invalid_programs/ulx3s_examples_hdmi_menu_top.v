module top
(
	input        clk_25mhz,
	input [2:1]  btn,
	output [3:0] gpdi_dp, gpdi_dn,
	output [7:0] led,
	output       ftdi_rxd,
	input        ftdi_txd,
	output       sd_clk,
	output       sd_cmd,
	inout [3:0]  sd_d,
	output       flash_csn,
        output       flash_mosi,
	inout        flash_miso,
	inout [27:0] gn, gp,
	//output       wifi_en
);
	//assign wifi_en = 0;

	//assign sd_d[2:1] = 4'bzz;
	
	// Get access to flash_sck
	wire flash_sck;
	wire tristate = 1'b0;

	USRMCLK u1 (.USRMCLKI(flash_sck), .USRMCLKTS(tristate));

	// Power-on reset
	reg [5:0] reset_cnt = 0;
        wire resetn = &reset_cnt;

        always @(posedge clk_25mhz) begin
                reset_cnt <= reset_cnt + !resetn;
        end

	wire [23:0] color;
	wire [9:0] x;
	wire [9:0] y;
	wire [6:0] xc = x[9:3];
	wire [5:0] yc = y[9:4];

	wire [7:0] data_out;

	wire [71:0] title = "Game Menu";

	reg [127:0] game[8];

	reg [11:0] addr;

	localparam TITLE_ROW = 5;
	localparam TITLE_START_COL = 34;
	localparam TITLE_END_COL = 43;
	localparam MENU_START_ROW = 8;
	localparam MENU_END_ROW = 16;
	localparam MENU_START_COL = 32;
	localparam MENU_END_COL = 48;

	reg [2:0] sel = 0;
	reg [3:0] index = 0;

	// Set the address 
	always @* begin
		if (yc == TITLE_ROW && (xc >= TITLE_START_COL && xc < TITLE_END_COL)) begin
			addr = {title[((TITLE_END_COL - xc) << 3)-1 -: 8], y[3:0]};
		end else if ((yc >= MENU_START_ROW && yc < MENU_END_ROW) && (xc >= MENU_START_COL && xc < MENU_END_COL))  begin
			addr = {game[yc - MENU_START_ROW][((MENU_END_COL - xc) << 3)-1 -: 8], y[3:0]};
		end else begin
		       addr = 0;
		end	       
	end

	wire btn1_down, btn2_down;

	always @(posedge clk_25mhz) begin
		if (btn1_down) sel <= sel + 1;
		if (btn2_down) index <= sel + 1; 
	end

	PushButton_Debouncer db1 (.clk(clk_25mhz), .PB(btn[1]), .PB_down(btn1_down));
	PushButton_Debouncer db2 (.clk(clk_25mhz), .PB(btn[2]), .PB_down(btn2_down));

	font_rom vga_font(
		.clk(clk_25mhz),
		.addr(addr),
		.data_out(data_out)
	);

	assign color = data_out[7-x[2:0]+1] ? (yc == (MENU_START_ROW + sel) ? 24'hffff00 : 24'hffffff) : 24'h000000; // +1 for sync

	hdmi_video hdmi_video
	(
		.clk_25mhz(clk_25mhz),
		.x(x),
		.y(y),
		.color(color),
		.gpdi_dp(gpdi_dp),
		.gpdi_dn(gpdi_dn)	
	);

	wire [3:0] gx,gy;
	wire [7:0] ch;
	wire set_ch;
	wire [7:0] led_out;

	attosoc soc(
		.clk(clk_25mhz),
		.resetn(resetn),
		.index(index),
		.led(led_out),
		.uart_tx(ftdi_rxd),
		.uart_rx(ftdi_txd),
		.SPI_SCK(flash_sck),
		.SPI_SS(flash_csn),
		.SPI_MOSI(flash_mosi),
		.SPI_MISO(flash_miso),
		.SD_SCK(sd_clk),
		.SD_SS(sd_d[3]),
		.SD_MOSI(sd_cmd),
		.SD_MISO(sd_d[0]),
		.x(gx),
		.y(gy),
		.ch(ch),
		.set_ch(set_ch)
	);

	// Set game menu character
	always @(posedge clk_25mhz) begin
		if (set_ch) begin
			game[gy][((16 - gx) << 3) - 1 -: 8] <= ch;
		end
	end

	assign led = led_out[7:0];

endmodule

