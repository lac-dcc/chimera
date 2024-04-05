/*
    Camera

		MT9V034 / MT9V022 Interface to LCD

        This project connects the camera to the LCD in a low-level way, specifically without
        Image or Pipe dependencies.

        The control logic first fires up the LCD and camera, then waits for button 2 to be
        pushed.  When it is, a WRITE command is issued to the LCD which then waits for
        data on its rect_pixel_write ports.

        The camera is assumed to be asyncronously sending frames, so the job here is to
        find a frame and feed it to the LCD.  The camera is a lot faster than the LCD and
        can't be stopped or slowed so two things need to be done.  Firstly there needs to be
        a FIFO to absorb the row data as fast as the camera sends it and secondly the camera
        needs a long horizontal blanking period to give the LCD a chance to catch up.

	Electrical Connections


        | J6 | GENIO |Pin No.|PIN NAME  | TYPE   |DESCRIPTION|
        | -  |  - | - | -            | -      | - |
        |    |    | 1 | VCC          | POWER  | 3.3v Power supply |
        |    |    | 2 | GND          | Ground | Power ground |
        | 27 | 18 | 3 | SCL          | Input  | Two-Wire Serial Interface Clock |
        | 28 | 19 | 4 | SDA(SDATA)   | Bi-directional | Two-Wire Serial Interface Data I/O |
        | 25 | 16 | 5 | VS(VSYNC)    | Output | Active High: Frame Valid; indicates active frame |
        | 26 | 17 | 6 | HS(HREF)     | Output | Active High: Line/Data Valid; indicates active pixels |
        | 23 | 14 | 7 | PCLK         | Output | Pixel Clock output from sensor |
        | 24 | 15 | 8 | XCLK         | Input | Master Clock into Sensor |
        | 21 | 12 | 9 | D9           | Output | Pixel Data Output 9(MSB) |
        | 22 | 13 | 10| D8           | Output | Pixel Data Output 7(MSB) |
        | 19 | 10 | 11| D7           | Output | Pixel Data Output 7(MSB) |
        | 20 | 11 | 12| D6           | Output | Pixel Data Output 6      |
        | 17 |  8 | 13| D5           | Output | Pixel Data Output 5      |
        | 18 |  9 | 14| D4           | Output | Pixel Data Output 4      |
        | 15 |  6 | 15| D3           | Output | Pixel Data Output 3      |
        | 16 |  7 | 16| D2           | Output | Pixel Data Output 2      |
        | 13 |  4 | 17| D1           | Output | Pixel Data Output 1      |
        | 14 |  5 | 18| D0           | Output | Pixel Data Output 0 (LSB)|
        | 11 |  2 | 19| RST          | Input  | Sensor Reset |
        | 12 |  3 | 20| PDN(PWDN)    | Input  | Standby (active high) |
        |  9 |  0 | 21| Trigger(EXP) | Input  | External trigger output  |
        | 10 |  1 | 22| LED          | Output | LED Strobe |

            Note: Arducam Document is wrong re: 21 & 22.  They are exchanged.  This was very annoying.

    Dependencies

        camera_core - for the camera logic
            i2c_master

        lcd

    Issues

        Mysteriously we need the horizontal line to be one pixel too long for the image to match up
        properly.  This is (at least one) off by one error somewhere.

        I2C delays are LONG.  Are they still necessary?

*/

// `include "../../pipe/rtl/pipe_defs.v"

module camera_2_lcd (
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
    localparam CoordinateWidth = 10;
    localparam BlankingWidth = 16;
    localparam CommandWidth = 3;
    localparam PixelWidth = 16;
    localparam PixelRedWidth = 5;
    localparam PixelGreenWidth = 6;
    localparam PixelBlueWidth = 5;
    localparam DataWidth = 18;
    localparam CameraWidth = 752;
    localparam CameraHeight = 482;
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

    reg [8:0] reset_counter = 0;
    wire reset = ~reset_counter[8];
    always @(posedge clock_48mhz)
        reset_counter <= reset_counter + reset;

	//
	// Config
	//

	reg fpga_reload=0;
	assign programn = ~fpga_reload;
	always @( posedge clock_48mhz )
		if ( !btn[4] )
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

    `ifdef BADGE_V3
	    assign ledc[ 8 ] = led_counter[ 25:19 ] == 0; // D15
    `else
	    assign led[ 8 ] = led_counter[ 25:19 ] == 0; // D15
    `endif

	//
	// Camera
	//

    wire sda;
    wire scl;

    wire scl_out;
    wire sda_out;

    wire  vs;
    wire  hs;
    wire  pclk;
    wire  xclk;
    wire  [9:0] d;
    wire  rst;
    wire  pwdn;
	wire  cled;
	wire  trigger;

    // Unclear how important explicit IO primitives are
    // early debugging made me wonder.  But the 'scope probes
    // were on the wrong way so who knows.

    // assign hs =          genio[ 17 ];
    // assign vs =          genio[ 16 ];
    // assign pclk =        genio[ 14 ];
	// assign genio[ 15 ] = xclk;
    // assign d9 =          genio[ 12 ];
    // assign d8 =          genio[ 13 ];
    // assign d7 =          genio[ 10 ];
    // assign d6 =          genio[ 11 ];
    // assign d5 =          genio[  8 ];
    // assign d4 =          genio[  9 ];
    // assign d3 =          genio[  6 ];
    // assign d2 =          genio[  7 ];
    // assign d1 =          genio[  4 ];
    // assign d0 =          genio[  5 ];
    // assign rst =         genio[  2 ];
    // assign pwdn =        genio[  3 ];
    // assign cled =        genio[  0 ];
    // assign trigger =     genio[  1 ];

	IB ib_hs( .I( genio[ 17 ] ), .O( hs ) );
	IB ib_vs( .I( genio[ 16 ] ), .O( vs ) );
	IB ib_pclk( .I( genio[ 14 ] ), .O( pclk ) );
	IB ib_led( .I( genio[ 1 ] ), .O( cled ) );

    IB ib_d0( .I( genio[  5 ] ), .O( d[ 0 ] ) );
    IB ib_d1( .I( genio[  4 ] ), .O( d[ 1 ] ) );
    IB ib_d2( .I( genio[  7 ] ), .O( d[ 2 ] ) );
    IB ib_d3( .I( genio[  6 ] ), .O( d[ 3 ] ) );
    IB ib_d4( .I( genio[  9 ] ), .O( d[ 4 ] ) );
    IB ib_d5( .I( genio[  8 ] ), .O( d[ 5 ] ) );
    IB ib_d6( .I( genio[ 11 ] ), .O( d[ 6 ] ) );
    IB ib_d7( .I( genio[ 10 ] ), .O( d[ 7 ] ) );
    IB ib_d8( .I( genio[ 13 ] ), .O( d[ 8 ] ) );
    IB ib_d9( .I( genio[ 12 ] ), .O( d[ 9 ] ) );

    OB ob_xclk( .I( xclk ), .O( genio[ 15 ] ) );
    OB  ob_rst( .I( rst ),  .O( genio[ 2 ] ) );
    OB ob_pwdn( .I( pwdn ),  .O( genio[ 3 ] ) );

    OB ob_trigger( .I( trigger ), .O( genio[ 0 ] ) );

    //
    // Camera
    //

    // See the camera_core.v source for more information about it.

    reg  camera_configure;
    reg  camera_start;
    reg  camera_stop;

    wire camera_configuring;
    wire camera_idle;
    wire camera_running;
    wire camera_error;
    wire camera_busy;

    wire       camera_out_vs;
    wire       camera_out_hs;
    wire       camera_out_valid;
    wire [9:0] camera_out_d;

    reg [CoordinateWidth-1:0] camera_column_start;
    reg [CoordinateWidth-1:0] camera_row_start;
    reg [CoordinateWidth-1:0] camera_window_width;
    reg [CoordinateWidth-1:0] camera_window_height;

    reg camera_set_window;
    reg camera_set_origin;

    reg [BlankingWidth-1:0]   camera_horizontal_blanking;
    reg [BlankingWidth-1:0]   camera_vertical_blanking;

    reg camera_set_blanking;

    reg camera_snapshot_mode;
    reg camera_set_snapshot_mode;
    reg camera_snapshot;

	wire [7:0] debug;

    // The epic I2C Gap could be reduced significantly, but since I2C is
    // only used for configuration here it's not hurting anything

    camera_core #(
            .I2CClockCount( 400 ),
			.I2CGapCount( ( 1 << 13 ) )
        ) cam (
            .clock( clock_48mhz ),
            .reset( reset ),

            // Camera Control
            .configure( camera_configure ),
            .start( camera_start ),
            .stop( camera_stop ),

            // Camera Status
            .configuring( camera_configuring ),
            .idle( camera_idle ),
            .running( camera_running ),
            .busy( camera_busy ),
            .error( camera_error ),

            // Set Window Command
            .column_start( camera_column_start ),
            .row_start( camera_row_start),
            .window_width( camera_window_width ),
            .window_height( camera_window_height ),
            .set_window( camera_set_window ),
            .set_origin( camera_set_origin ),

            // Set Blanking Command
            .horizontal_blanking( camera_horizontal_blanking ),
            .vertical_blanking( camera_vertical_blanking ),
            .set_blanking( camera_set_blanking ),

            // Snapshot commands
            .snapshot_mode( camera_snapshot_mode ),
            .set_snapshot_mode( camera_set_snapshot_mode ),
            .snapshot( camera_snapshot ),

            // Data Output
            .out_vs( camera_out_vs ),
            .out_hs( camera_out_hs ),
            .out_valid( camera_out_valid ),
            .out_d( camera_out_d ),

            // Hardware Connections
            .scl_in( scl ),
            .scl_out( scl_out ),
            .sda_in( sda ),
            .sda_out( sda_out ),
            .vs( vs ),
            .hs( hs ),
            .pclk( pclk ),
            .d( d ),
			.rst( rst ),
			.pwdn( pwdn ),
			.led( cled ),
			.trigger( trigger ),

			.debug( debug )
        );

    // Tristate Ports - Clock is pure output, data needs to be bidirectional (Open Drain)
	// T : Tristate, not Transmit!
	BB clock_io( .I( scl_out ), .T( 0 ), .O( scl ), .B( genio[18] ) );
	BBPU   data_io( .I( 0 ), .T( sda_out), .O( sda ), .B( genio[19] ) );

	//
	// CAMERA LOGIC
	//

    // Most of the camera control logic handles getting the camera set up - both the
    // internal configuration and any config we need to add (for example window
    // size, blanking, etc.

    // It also clears the screen to a neutral gray.

    // The window we request is the exact size of the LCD display (or actually one more pixel
    // for some weird reason

    // Horizontal blanking needs to be long enough to let the LCD drain the FIFO.
    // The LCD is about half the speed of the Camera, so the horizontal blanking
    // period is about as long as the line aquisition time.

	// clock

    // creating the 26-ish MHz clock for the camera.  It's 24MHz.

	reg [2:0] clock_divided;

	always @( posedge clock_48mhz ) begin
		if ( reset )
			clock_divided <= 0;
		else
			clock_divided <= clock_divided + 1;
	end

	assign xclk = clock_divided[ 0 ];

	localparam CONTROL_POWER_DOWN = 0,
	           CONTROL_CONFIGURING = 1,
               CONTROL_CAMERA_SETUP = 2,
               CONTROL_CAMERA_SET_WINDOW = 3,
               CONTROL_CAMERA_SET_BLANKING = 4,
			   CONTROL_ERROR = 5,
			   CONTROL_RUNNING = 6;

	reg [3:0] control_state;

    localparam ControlTimerWidth = 26;
	localparam ControlTimerLongCount = 2**24;
	localparam ControlTimerShortCount = 10;

	reg [ ControlTimerWidth:0 ] control_timer;
	wire control_timer_expired = control_timer[ ControlTimerWidth ];

	always @( posedge clock_48mhz ) begin
		if ( reset ) begin
            camera_configure <= 0;
			camera_start <= 0;
			camera_stop <= 0;
            lcd_command <= LCD_COMMAND_NONE;
			control_timer <= ControlTimerLongCount;
			control_state <= CONTROL_POWER_DOWN;
            camera_set_origin <= 0;
            camera_set_blanking <= 0;
            camera_set_window <= 0;
            camera_set_snapshot_mode <= 0;
		end else begin
			case ( control_state )
				CONTROL_POWER_DOWN: begin
						if ( control_timer_expired ) begin
                            lcd_command <= LCD_COMMAND_CONFIGURE;
							camera_configure <= 1;
							control_state <= CONTROL_CONFIGURING;
						end else begin
							control_timer <= control_timer - ( control_timer_expired ? 0 : 1 );
						end
					end
				CONTROL_CONFIGURING: begin
                        // Configuring
                        // ... stop asking
                        lcd_command <= LCD_COMMAND_NONE;
                        camera_configure <= 0;
                        // Wait for LCD (no LCD... something's really wrong)
                        if ( lcd_ready ) begin
                            // Wait for camera
                            if ( camera_idle && !camera_busy ) begin
                                if ( control_timer_expired ) begin
                                    // Screen to gray
                                    lcd_rect_x0 <= 0;
                                    lcd_rect_y0 <= 0;
                                    lcd_rect_x1 <= 479;
                                    lcd_rect_y1 <= 319;
                                    lcd_command <= LCD_COMMAND_FILL_RECT;
                                    lcd_fill_pixel <= { 5'H0F, 6'H1F, 5'H0F };
                                    control_timer <= ControlTimerLongCount;
                                    control_state <= CONTROL_CAMERA_SETUP;
                                end else begin
                                    control_timer <= control_timer - 1;
                                end
                            end else begin
                                // No camera?  BSoD for you!
                                if ( camera_error ) begin
                                    camera_start <= 0;
                                    control_state <= CONTROL_ERROR;
                                    lcd_command <= LCD_COMMAND_FILL_RECT;
                                    lcd_fill_pixel <= { 5'H1F, 6'H00, 5'H00 };
        							control_timer <= ControlTimerLongCount;
                                end
                            end
                        end
					end
                CONTROL_CAMERA_SETUP: begin
                        lcd_command <= LCD_COMMAND_NONE;
                        if ( !camera_busy ) begin
                            if ( control_timer_expired ) begin
                                camera_column_start <= 9'D136;
                                camera_row_start <= 9'D80;
                                camera_window_width <= 9'D481;
                                camera_window_height <= 9'D320;
                                camera_set_window <= 1;
                                control_state <= CONTROL_CAMERA_SET_WINDOW;
                                control_timer <= ControlTimerLongCount;
                            end else begin
                                control_timer <= control_timer - 1;
                            end
                        end
                    end
                CONTROL_CAMERA_SET_WINDOW: begin
                        // setting window
                        camera_set_window <= 0;
                        if ( !camera_busy ) begin
                            if ( control_timer_expired ) begin
                                    // Done!  Next do blanking
                                    camera_horizontal_blanking <= 10'D500;
                                    camera_vertical_blanking <= 10'D750;
                                    camera_set_blanking <= 1;
                                    control_state <= CONTROL_CAMERA_SET_BLANKING;
                                    control_timer <= ControlTimerLongCount;
                            end else begin
                                control_timer <= control_timer - 1;
                            end
                        end
                    end
                CONTROL_CAMERA_SET_BLANKING: begin
                        // setting blanking
                        camera_set_blanking <= 0;
                        if ( !camera_busy ) begin
                            if ( control_timer_expired ) begin
                                camera_start <= 1;
                                // Done!  Set up to shoot
                                lcd_rect_x0 <= 0;
                                lcd_rect_y0 <= 0;
                                lcd_rect_x1 <= 479;
                                lcd_rect_y1 <= 319;
                                control_state <= CONTROL_RUNNING;
                                control_timer <= ControlTimerLongCount;
                            end else begin
                                control_timer <= control_timer - 1;
                            end
                        end
                    end
				CONTROL_RUNNING: begin
                        camera_start <= 0;
                        // Request WRITE while the button (LEFT) is down
                        if ( control_timer_expired ) begin
                            if ( lcd_ready && ~camera_out_vs && ~btn[ 2 ] ) begin
                                lcd_command <= LCD_COMMAND_WRITE_RECT;
                                control_timer <= ControlTimerShortCount;
                            end
                        end else begin
                            lcd_command <= LCD_COMMAND_NONE;
                            control_timer <= control_timer - 1;
                        end
					end
				CONTROL_ERROR: begin
                        lcd_command <= LCD_COMMAND_NONE;
                        if ( control_timer_expired ) begin
                            // Check camera again with button press (UP)
                            if ( ~btn[ 0 ] ) begin
                                control_state <= CONTROL_POWER_DOWN;
                                control_timer <= CONTROL_CONFIGURING;
                            end
                        end else begin
                            control_timer <= control_timer - 1;
                        end
                    end
			endcase
		end
	end

	//
	// LCD
    //

    function [PixelWidth-1:0] pixel( input reg [7:0] r, input reg [7:0] g, input reg [7:0] b );
        begin
            pixel = { r[7:3], g[7:2], b[7:3] };
        end
    endfunction

	// wire [7:0] debug;

    reg [ CommandWidth-1:0]   lcd_command;
    wire                      lcd_ready;

    reg [PixelWidth-1:0]      lcd_fill_pixel;

    reg [CoordinateWidth-1:0] lcd_rect_x0;
    reg [CoordinateWidth-1:0] lcd_rect_x1;
    reg [CoordinateWidth-1:0] lcd_rect_y0;
    reg [CoordinateWidth-1:0] lcd_rect_y1;

    wire [CoordinateWidth-1:0] pixel_x;
    wire [CoordinateWidth-1:0] pixel_y;

    reg [PixelWidth-1:0]      lcd_rect_pixel_write;
    reg                       lcd_rect_pixel_write_valid;
    wire                      lcd_rect_pixel_write_ready;
    wire [PixelWidth-1:0]     lcd_rect_pixel_read;
    wire                      lcd_rect_pixel_read_valid;
    reg                       lcd_rect_pixel_read_ready;

	lcd #(
		.Width( PanelWidth ),
		.Height( PanelHeight ),
		.CoordinateWidth( CoordinateWidth ),
		.CommandWidth( CommandWidth ),
		.DataWidth( DataWidth ),
		.PixelWidth( PixelWidth ),
		.PixelRedWidth( PixelRedWidth ),
		.PixelGreenWidth( PixelGreenWidth ),
		.PixelBlueWidth( PixelBlueWidth ),
		.CommandDataTimerCount( CommandDataTimerCount ),
		.DelayTimerCount( DelayTimerCount )
	) l (
		.clock( clock_48mhz ),
		.reset( reset ),

		.command( lcd_command ),
		.ready( lcd_ready ),
        .abort( 1'H0 ),

		.fill_pixel( lcd_fill_pixel ),

		.rect_x0( lcd_rect_x0 ),
		.rect_x1( lcd_rect_x1 ),
		.rect_y0( lcd_rect_y0 ),
		.rect_y1( lcd_rect_y1 ),

		.pixel_x( pixel_x ),
		.pixel_y( pixel_y ),

		.rect_pixel_write( lcd_rect_pixel_write ),
		.rect_pixel_write_valid( lcd_rect_pixel_write_valid ),
		.rect_pixel_write_ready( lcd_rect_pixel_write_ready ),
		.rect_pixel_read( lcd_rect_pixel_read ),
		.rect_pixel_read_valid( lcd_rect_pixel_read_valid ),
		.rect_pixel_read_ready( lcd_rect_pixel_read_ready ),

		.lcd_db(lcd_db),
		.lcd_rd(lcd_rd),
		.lcd_wr(lcd_wr),
		.lcd_rs(lcd_rs),
		.lcd_cs(lcd_cs),
		.lcd_id(lcd_id),
		.lcd_rst(lcd_rst),
		.lcd_fmark(lcd_fmark),
		.lcd_blen(lcd_blen)
	);

    //
    // Data Mover
    //

    // Find the right way to get the right data into the lcd.
    // The camera is mostly faster than the LCD, so going to grab a
    // smaller window, buffer a line and have a long blanking interval.

    // Split into two parts, connected by the FIFO memory.

    // The in part monitors the camera's VS (vertical sync) line and the
    // LCD's readiness to receive data.  When both are true it jumps to a
    // state where it waits for each line.

    // When a line starts, data is pushed into the FIFO each time
    // it is Valid, and the out part is signaled to start.

    // Finally when there are no more lines and VS goes low, the
    // machine goes back to waiting. The out part is told that it's
    // all over and it too returns to idle.

    // The out part, triggered but line_buffer_write_start begins to
    // transfer data as fast as it can into the LCD using the LCD's write
    // pixel port.

    reg [10:0] line_buffer_write_index;
    reg [9:0] line_buffer [0:751];

    reg line_buffer_write_start;
    reg line_buffer_write_done;

    reg line_buffer_read_done;

    reg [2:0] line_buffer_write_state;

    always @( posedge clock_48mhz ) begin
        if ( reset ) begin
            line_buffer_write_index <= 0;
            line_buffer_write_start <= 0;
            line_buffer_write_done  <= 0;
            line_buffer_write_state <= 0;
        end else begin
            case ( line_buffer_write_state )
                0:  // waiting for both a new frame start AND lcd is ready for data -> 1
                    if ( camera_out_vs && lcd_rect_pixel_write_ready )
                        line_buffer_write_state <= 1;
                1:  // waiting for new line -> 2, or end of frame -> 0
                    if ( camera_out_hs ) begin
                        line_buffer_write_start <= 1;
                        line_buffer_write_state <= 2;
                    end else begin
                        if ( !camera_out_vs )
                            line_buffer_write_state <= 0;
                    end
                2:  // if hs (line) still up, record data in buffer, flag started in case not already, otherwise -> 3
                    if ( camera_out_hs ) begin
                        if ( camera_out_valid ) begin
                            line_buffer[ line_buffer_write_index ] <= camera_out_d;
                            line_buffer_write_index <= line_buffer_write_index + 1;
                        end
                    end else begin
                        line_buffer_write_done  <= 1;
                        line_buffer_write_state <= 3;
                    end
                3:
                    if ( line_buffer_read_done  ) begin
                        line_buffer_write_index <= 0;
                        line_buffer_write_start <= 0;
                        line_buffer_write_done  <= 0;
                        line_buffer_write_state <= 1;
                    end
            endcase
        end
    end

    reg [10:0] line_buffer_read_index;
    wire [9:0] camera_data = line_buffer[ line_buffer_read_index ];

	always @( posedge clock_48mhz ) begin
		if ( reset ) begin
			lcd_rect_pixel_write <= 0;
			lcd_rect_pixel_write_valid <= 0;
            line_buffer_read_done <= 0;
            line_buffer_read_index <= 0;
		end else begin
            if ( line_buffer_write_start ) begin
                if (  line_buffer_read_index <= line_buffer_write_index )  begin
                    if ( lcd_rect_pixel_write_ready ) begin
                        lcd_rect_pixel_write_valid <= 1;
                        lcd_rect_pixel_write <= { camera_data[9:5], camera_data[9:4], camera_data[9:5] };
                        line_buffer_read_index <= line_buffer_read_index + 1;
                    end
                end else begin
                    lcd_rect_pixel_write_valid <= 0;
                    if ( line_buffer_write_done ) begin
                        line_buffer_read_done <= 1;
                        lcd_rect_pixel_write_valid <= 0;
                    end
                end
            end else begin
                line_buffer_read_done <= 0;
                line_buffer_read_index <= 0;
            end
		end
	end

	// Debug
	OB  o_p0( .O( pmod[ 0 ] ), .I( scl ) );
	OB  o_p1( .O( pmod[ 1 ] ), .I( sda ) );
	//OB  o_p0( .O( pmod[ 0 ] ), .I( camera_out_vs ) );
	//OB  o_p1( .O( pmod[ 1 ] ), .I( cled ) );
	OB  o_p2( .O( pmod[ 2 ] ), .I( camera_out_hs ) );
	OB  o_p3( .O( pmod[ 3 ] ), .I( camera_out_valid ) );
	OB  o_p4( .O( pmod[ 4 ] ), .I( line_buffer_write_start ) );
	OB  o_p5( .O( pmod[ 5 ] ), .I( line_buffer_write_done ) );
	OB  o_p6( .O( pmod[ 6 ] ), .I( lcd_rect_pixel_write_ready && lcd_rect_pixel_write_valid ) );
	OB  o_p7( .O( pmod[ 7 ] ), .I( line_buffer_read_done ) );
	// OB  o_p7( .O( pmod[ 7 ] ), .I( camera_out_d[9] ) );

	// OB  o_p4( .O( pmod[ 4 ] ), .I( debug[ 0 ] ) );
	// OB  o_p5( .O( pmod[ 5 ] ), .I( debug[ 1 ] ) );
	// OB  o_p6( .O( pmod[ 6 ] ), .I( debug[ 2 ] ) );
	// OB  o_p7( .O( pmod[ 7 ] ), .I( debug[ 3 ] ) );


    `ifdef BADGE_V3
        assign ledc[ 7 ] = control_timer_expired;
        assign ledc[ 6 ] = lcd_ready;
        assign ledc[ 5 ] = ~btn[ 0 ];
        assign ledc[ 4 ] = ~btn[ 1 ];
        assign ledc[ 3 ] = ~btn[ 2 ];
        assign ledc[ 2 ] = ~btn[ 3 ];
        assign ledc[ 1 ] = ~btn[ 4 ];
    `else
        assign led[ 7 ] = control_timer_expired;
        assign led[ 6 ] = lcd_ready;
        assign led[ 5 ] = ~btn[ 0 ];
        assign led[ 4 ] = ~btn[ 1 ];
        assign led[ 3 ] = ~btn[ 2 ];
        assign led[ 2 ] = ~btn[ 3 ];
        assign led[ 1 ] = ~btn[ 4 ];
    `endif

endmodule
