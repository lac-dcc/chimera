// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*
    Hackaday Superconference 2019 Badge

	Basic
*/

`include "../../pipe/rtl/pipe_defs.v"
`include "../../image/rtl/image_defs.v"

module image_badge2019_usb (
		input clk,
		input [7:0] btn,
`ifdef BADGE_V3
		output [10:0] ledc,
		output [2:0] leda,
		inout [29:0] genio,
`else
		output [8:0] led,
		inout [27:0] genio,
`endif
		output uart_tx,
		input uart_rx,
`ifdef BADGE_V3
		output irda_tx,
		input irda_rx,
		output irda_sd,
`endif
		output pwmout,

		output [17:0] lcd_db,
		output lcd_rd,
		output lcd_wr,
		output lcd_rs,
		output lcd_cs,
		input lcd_id,
		output lcd_rst,
		input lcd_fmark,
		output lcd_blen,

		output psrama_nce,
		output psrama_sclk,
		inout [3:0] psrama_sio,
		output psramb_nce,
		output psramb_sclk,
		inout [3:0] psramb_sio,
		output flash_cs,
		inout flash_miso,
		inout flash_mosi,
		inout flash_wp,
		inout flash_hold,
		output fsel_d,
		output fsel_c,
		output programn,

		output [3:0] gpdi_dp, gpdi_dn,
		inout usb_dp,
		inout usb_dm,
		output usb_pu,
		input usb_vdet,

		inout [5:0] sao1,
		inout [5:0] sao2,

		inout [7:0] pmod,

		output adcrefout,
		input adcref4
	);

	`include "../../drivers/rtl/lcd_defs.v"

    localparam CommandDataTimerCount = 0;
    localparam DelayTimerCount = 10000;
    localparam CoordinateWidth = 9;
    localparam CommandWidth = 3;
    localparam PixelWidth = 16;
    localparam PixelRedWidth = 5;
    localparam PixelGreenWidth = 6;
    localparam PixelBlueWidth = 5;
    localparam DataWidth = 18;
    localparam PanelWidth = 480;
    localparam PanelHeight = 320;

	//
	// Clocks
	//

    wire clock_48mhz;
    clock_pll c_pll (.CLKI( clk ), .CLKOP( clock_48mhz ));

	//
	// Reset
	//

    reg [5:0] reset_counter = 0;
    wire reset = ~reset_counter[5];
    always @(posedge clock_48mhz)
        reset_counter <= reset_counter + reset;


	//
	// Config
	//

	reg fpga_reload=0;
	assign programn = ~fpga_reload;
	always @( posedge clock_48mhz )
		if ( ~btn[4] )
			fpga_reload <= 1;

	//
	// LED
	//

	reg [28:0] led_counter = 0;
	always @( posedge clock_48mhz ) begin
		if ( reset ) begin
		end else begin
			led_counter <= led_counter + 1'H1;
		end
	end

	assign led[ 8 ] = led_counter[ 25:19 ] == 0;


	//
	// IMAGE BUFFER
	//


    localparam [`IS_w-1:0] IS = `IS( 0, 0, 10, 10, 0, 1, `IS_FORMAT_RGB, 8, 8, 8, 0, 0 );

    localparam ImageWidth =  `I_w( IS );

	localparam Width = `IS_WIDTH( IS );
    localparam Height = `IS_HEIGHT( IS );

    localparam PixelCount = `IS_PIXEL_COUNT( IS );

    localparam WidthWidth =  `IS_WIDTH_WIDTH( IS );
    localparam HeightWidth = `IS_HEIGHT_WIDTH( IS );
    localparam DataWidth =   `IS_DATA_WIDTH( IS );

    localparam C0Width =     `IS_C0_WIDTH( IS );
    localparam C1Width =     `IS_C1_WIDTH( IS );
    localparam C2Width =     `IS_C2_WIDTH( IS );
    localparam AlphaWidth =  `IS_ALPHA_WIDTH( IS );
    localparam ZWidth =      `IS_Z_WIDTH( IS );

    reg  in_request_external;
    reg  out_request_external;

    wire [ImageWidth-1:0 ] image_in;
    wire [ImageWidth-1:0 ] image_out;

    wire in_receiving;
    wire out_sending;

    reg  [WidthWidth-1:0]  buffer_out_x;
    reg  [HeightWidth-1:0] buffer_out_y;
    wire [DataWidth-1:0]   buffer_out_data;

    image_buffer #(
            .IS( IS )
        ) ib (
            .clock( clock_48mhz ),
            .reset( reset ),

            .in_request_external( in_request_external ),
            .out_request_external( out_request_external ),

            .image_in( image_in ),
            .image_out( image_out ),

            .in_receiving( in_receiving ),
            .out_sending( out_sending ),

            .buffer_out_x( buffer_out_x ),
            .buffer_out_y( buffer_out_y ),
            .buffer_out_data( buffer_out_data )
        );


	//
	// LCD
    //

    function [PixelWidth-1:0] pixel( input reg [7:0] r, input reg [7:0] g, input reg [7:0] b );
        begin
            pixel = { r[7:3], g[7:2], b[7:3] };
        end
    endfunction

	wire [7:0] debug;

    reg [ CommandWidth-1:0]   command;
    wire                      ready;

    reg [PixelWidth-1:0]      fill_pixel;

    reg [CoordinateWidth-1:0] rect_x0;
    reg [CoordinateWidth-1:0] rect_x1;
    reg [CoordinateWidth-1:0] rect_y0;
    reg [CoordinateWidth-1:0] rect_y1;

    wire [CoordinateWidth-1:0] pixel_x;
    wire [CoordinateWidth-1:0] pixel_y;

    reg [PixelWidth-1:0]      rect_pixel_write;
    reg                       rect_pixel_write_valid;
    wire                      rect_pixel_write_ready;
    wire [PixelWidth-1:0]     rect_pixel_read;
    wire                      rect_pixel_read_valid;
    reg                       rect_pixel_read_ready;

	lcd #(
		.PanelWidth( PanelWidth ),
		.PanelHeight( PanelHeight ),
		.CoordinateWidth( CoordinateWidth ),
		.CommandWidth( CommandWidth ),
		.DataWidth( DataWidth ),
		.PixelWidth( PixelWidth ),
		.PixelRedWidth( PixelRedWidth ),
		.PixelGreenWidth( PixelGreenWidth ),
		.PixelBlueWidth( PixelBlueWidth ),
		.CommandDataTimerCount( CommandDataTimerCount ),
		.DelayTimerCount( DelayTimerCount )
	) l(
		.clock( clock_48mhz ),
		.reset( reset ),

		.command( command ),
		.ready( ready ),

		.fill_pixel( fill_pixel ),

		.rect_x0( rect_x0 ),
		.rect_x1( rect_x1 ),
		.rect_y0( rect_y0 ),
		.rect_y1( rect_y1 ),

		.pixel_x( pixel_x ),
		.pixel_y( pixel_y ),

		.rect_pixel_write( rect_pixel_write ),
		.rect_pixel_write_valid( rect_pixel_write_valid ),
		.rect_pixel_write_ready( rect_pixel_write_ready ),

		.rect_pixel_read( rect_pixel_read ),
		.rect_pixel_read_valid( rect_pixel_read_valid ),
		.rect_pixel_read_ready( rect_pixel_read_ready ),

		.lcd_db(lcd_db),
		.lcd_rd(lcd_rd),
		.lcd_wr(lcd_wr),
		.lcd_rs(lcd_rs),
		.lcd_cs(lcd_cs),
		.lcd_id(lcd_id),
		.lcd_rst(lcd_rst),
		.lcd_fmark(lcd_fmark),
		.lcd_blen(lcd_blen),

		.debug( debug )
	);

	assign pmod = debug;

	//
	// Button
	//

	localparam ButtonTimerWidth = 25;
	localparam ButtonTimerLongCount = 2**20;
	localparam ButtonTimerShortCount = 10;

	reg [ ButtonTimerWidth:0 ] button_timer;
	wire button_timer_expired = button_timer[ ButtonTimerWidth ];

	reg [7:0] color_current;
	reg [7:0] position_current;

	always @( posedge clock_48mhz ) begin
		if ( reset ) begin
			button_timer <= -1;
			color_current <= 0;
			position_current <= 0;
		end else begin
			if ( button_timer_expired ) begin
				if ( ~btn[ 0 ] ) begin
					command <= LCD_COMMAND_CONFIGURE;
					button_timer <= ButtonTimerShortCount;
				end else
				if ( ready ) begin
					if ( ~btn[ 1 ] ) begin
						command <= LCD_COMMAND_FILL_RECT;
						rect_x0 <= 0;
						rect_x1 <= 479;
						rect_y0 <= 0;
						rect_y1 <= 319;
						fill_pixel <= pixel( 64, 64, 64 );
						button_timer <= ButtonTimerShortCount;
					end else if ( ~btn[ 2 ] ) begin
						command <= LCD_COMMAND_WRITE_RECT;
						rect_x0 <= 120;
						rect_x1 <= 360;
						rect_y0 <= 40;
						rect_y1 <= 280;
						button_timer <= ButtonTimerShortCount;
					end else if ( ~btn[ 3 ] ) begin
						command <= LCD_COMMAND_FILL_RECT;
						rect_x0 <= 120;
						rect_x1 <= 360;
						rect_y0 <= 40;
						rect_y1 <= 280;
						fill_pixel <= pixel( color_current, 0, 0 );
						color_current <= color_current + 1;
						button_timer <= ButtonTimerLongCount;
					end else if ( ~btn[ 5 ] ) begin
						command <= LCD_COMMAND_FILL_RECT;
						rect_x0 <= position_current + 64;
						rect_x1 <= position_current + 64;
						rect_y0 <= 40;
						rect_y1 <= 280;
						fill_pixel <= pixel( 0, 0, color_current );
						if ( position_current == 127 ) begin
    						position_current <= 0;
							color_current <= color_current + 155;
						end else
    						position_current <= position_current + 1;
						button_timer <= ButtonTimerLongCount;
					end
				end
			end else begin
			    command <= LCD_COMMAND_NONE;
				button_timer <= button_timer - 1'H1;
			end
		end
	end

    function [PixelWidth-1:0] calculate_pixel( input reg [CoordinateWidth-1:0] x, input reg [CoordinateWidth-1:0] y );
        begin
            //calculate_pixel = 0;
            // calculate_pixel = { x + y, x + y, x + y };

			if ( (x[3:0] == 0) || (y[3:0] == 0 ) )
			    calculate_pixel = 16'HFFFF;
			    // calculate_pixel = pixel( 20 + x + y, 20 + x + y, 20 + x + y );
			else
			    calculate_pixel = 0;

            // $display( "    Calculate Pixel [%x,%x] -> %x", x, y, calculate_pixel );
        end
    endfunction

	always @( posedge clock_48mhz ) begin
		if ( reset ) begin
			rect_pixel_write <= calculate_pixel( pixel_x - rect_x0, pixel_y - rect_y0);
			rect_pixel_write_valid <= 1;
		end else begin
			if ( rect_pixel_write_ready )
				rect_pixel_write <= calculate_pixel( pixel_x - rect_x0, pixel_y - rect_y0);
		end
	end

	assign led[ 7 ] = button_timer_expired;
	assign led[ 6 ] = ready;
	assign led[ 5 ] = ~btn[ 0 ];
	assign led[ 4 ] = ~btn[ 1 ];
	assign led[ 3 ] = ~btn[ 2 ];
	assign led[ 2 ] = ~btn[ 3 ];
	assign led[ 1 ] = ~btn[ 4 ];

	//
	// USB CDC ACM
	//
/*
    // uart pipeline in and out
    localparam PipeSpec = `PS_d8s;
    wire [`P_m( PipeSpec ):0 ] pipe;

    // usb uart - this instanciates the entire USB device.
    usb_uart #( .PipeSpec( PipeSpec ) ) uart (
        .clk_48mhz  (clock_48mhz),
        .reset      (reset),

        // pins
        .pin_usb_p( usb_dp ),
        .pin_usb_n( usb_dm ),

        // uart pipeline, in and out
        .pipe_in( pipe ),
        .pipe_out( pipe )

        //.debug( debug )
    );

    // USB Host Detect Pull Up
    assign usb_pu = 1'b1;
*/
endmodule

