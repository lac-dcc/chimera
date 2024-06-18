// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input           CLK_100MHz,
    
    input   [7:0]   DIP,

    output          VGA_HSYNC,
    output          VGA_VSYNC,
    output  [7:0]   VGA_PIXEL,

    output  [7:0]   LED,
    output  [7:0]   SevenSegment,
	output  [2:0]   SevenSegmentEnable
);

    // Use PLL to generate VGA pixel clock
    // 1024x768  @ 60Hz:  65 MHz
    // 1600x1200 @ 60Hz: 162 MHz (325 MHz / 2)
    pll vga_clk(
        .CLK_IN1(CLK_100MHz),
        .CLK_OUT1(CLK_VGA),
        .LOCKED(pll_locked)
    );

    // Divide clock by 2
    reg CLK_VGA_DIV2;
    always @(posedge CLK_VGA) begin
        CLK_VGA_DIV2 <= ~CLK_VGA_DIV2;
    end

    // Generate VGA sync signals
    wire [12:0] h_pos, v_pos;
    sync vga_sync(
        .CLK(CLK_VGA_DIV2),
        .HSYNC(VGA_HSYNC),
        .VSYNC(VGA_VSYNC),
        .ACTIVE(VGA_ACTIVE),
        .h(h_pos),
        .v(v_pos)
    );

    // Generate RGB video
    wire [7:0] VGA_RGB;
    draw vga_video(
        .CLK(CLK_VGA_DIV2),
        .ACTIVE(VGA_ACTIVE),
        .VSYNC(VGA_VSYNC),
        .h(h_pos),
        .v(v_pos),
        .colour(~DIP),
        .rgb(VGA_RGB)
    );

    // Setup hex display
    hex #(
		.refresh_rate(1000),
		.sys_clk_freq(65000000)
	)
	display(
		.clk(CLK_VGA_DIV2),
		.hex_byte(~DIP),
		.segments(SevenSegment),
		.segments_enable(SevenSegmentEnable)
	);

    // Assign module I/O
    assign LED       = ~DIP;
    assign VGA_PIXEL = VGA_RGB;
endmodule
