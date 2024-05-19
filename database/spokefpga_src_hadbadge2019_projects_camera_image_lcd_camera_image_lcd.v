// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*
    Hackaday Superconference 2019 Badge

    Camera Image LCD

        This is camera_image (camera wrapped with image processing) talking to lcd_image
        (lcd wrapped with image processing)

        - lcd
        - lcd image
        - camera_core
        - camera_image



*/

`include "../../pipe/rtl/pipe_defs.v"

`include "../../image/rtl/image_defs.v"

module camera_image_lcd (
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

	//
	// Clocks
	//

    wire clock_48mhz;
    clock_pll c_pll (.CLKI( clk ), .CLKOP( clock_48mhz ));
    // assign clock_48mhz = clk;

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

    `ifdef BADGE_V2
	    assign led[ 8 ] = led_counter[ 25:19 ] == 0; // D15
    `else
	    assign ledc[ 8 ] = led_counter[ 25:19 ] == 0; // D15
    `endif

	//
	// APPLICATION
	//

    //
    // Camera
    //

    // See the camera_core.v source for more information about it.

    localparam LcdWidth = 480;
    localparam LcdHeight = 320;

    localparam CameraWidth = 752;
    localparam CameraHeight = 482;

    // HERE!  A little buried is the spec for the image that's going to be captured and placed.
    localparam ImageWidth = 320;
    localparam ImageHeight = 200;
    localparam ImageXInitial = ( LcdWidth - ImageWidth ) / 2;
    localparam ImageYInitial = ( LcdHeight - ImageHeight ) / 2;

    localparam BlankingWidth = 10;
    localparam CoordinateWidth = 10;
    localparam CameraPixelWidth = 10;

    reg  camera_configure;
    reg  camera_start;
    reg  camera_stop;

    wire camera_configuring;
    wire camera_idle;
    wire camera_running;
    wire camera_error;
    wire camera_busy;
    wire camera_image_transfer;

    // // // reg [BlankingWidth-1:0]   camera_horizontal_blanking;
    // // // reg [BlankingWidth-1:0]   camera_vertical_blanking;

    // // reg camera_set_blanking;

    // reg camera_snapshot_mode;
    // reg camera_set_snapshot_mode;
    // reg camera_snapshot;

	wire [7:0] debug;

    // The epic I2C Gap could be reduced significantly, but since I2C is
    // only used for configuration here it's not hurting anything

    reg refresh;

    //
    // Camera Core (leaving the I2C IO up to the outer layers)
    //

    wire sda;
    wire scl;

    wire camera_scl_out;
    wire camera_sda_out;

    wire       vs;
    wire       hs;
    wire       pclk;
    wire       xclk;
    wire [9:0] d;
    wire       rst;
    wire       cled;
    wire       pwdn;

    wire       trigger;

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

    // Image Control
    reg [CoordinateWidth-1:0] camera_image_x;
    reg [CoordinateWidth-1:0] camera_image_y;
    reg camera_image_origin_update;

    // Image Out (can't be the full width of the camera (min col start is 1, min row start is 4)
    localparam [`IS_w-1:0] CameraIS =  `IS( 0, 0, ImageWidth, ImageHeight, 0, 1, `IS_FORMAT_GRAYSCALE, 10, 0, 0, 0, 0 );

    localparam ImagePixelCount = `IS_PIXEL_COUNT( CameraIS );

    localparam ImageWidthWidth =  `IS_WIDTH_WIDTH(  CameraIS );
    localparam ImageHeightWidth = `IS_HEIGHT_WIDTH( CameraIS );
    localparam ImageDataWidth =   `IS_DATA_WIDTH(   CameraIS );

    localparam ImageC0Width =     `IS_C0_WIDTH(    CameraIS );
    localparam ImageC1Width =     `IS_C1_WIDTH(    CameraIS );
    localparam ImageC2Width =     `IS_C2_WIDTH(    CameraIS );
    localparam ImageAlphaWidth =  `IS_ALPHA_WIDTH( CameraIS );
    localparam ImageZWidth =      `IS_Z_WIDTH(     CameraIS );

    wire [`I_w( CameraIS )-1:0 ] camera_image_out;
    reg                    camera_out_request_external;

    // All the out signals
    wire                 camera_image_out_start;
    wire                 camera_image_out_stop;
    wire [ImageDataWidth-1:0] camera_image_out_data;
    wire                 camera_image_out_valid;
    wire                 camera_image_out_error;
    wire                 camera_image_out_ready;
    wire                 camera_image_out_request;
    wire                 camera_image_out_cancel;

    // Monitoring all the signals
    assign camera_image_out_start = `I_Start( CameraIS, camera_image_out );
    assign camera_image_out_stop  = `I_Stop( CameraIS, camera_image_out );
    assign camera_image_out_data  = `I_Data( CameraIS, camera_image_out );
    assign camera_image_out_error = `I_Error( CameraIS, camera_image_out );
    assign camera_image_out_valid = `I_Valid( CameraIS, camera_image_out );

    assign camera_image_out_request = `I_Request( CameraIS, camera_image_out );
    assign camera_image_out_cancel  = `I_Cancel( CameraIS, camera_image_out );
    assign camera_image_out_ready   = `I_Ready( CameraIS, camera_image_out );

    camera_image #(
            .IS( CameraIS ),
            .CameraWidth( CameraWidth ),
            .CameraHeight( CameraHeight ),
            .ImageXInitial( ImageXInitial ),
            .ImageYInitial( ImageYInitial ),
            .I2CClockCount( 400 ),
			.I2CGapCount( ( 1 << 13 ) )
        ) cam_image (
            .clock( clock_48mhz),
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
            .image_transfer( camera_image_transfer ),

            // Image Control
            .image_x( camera_image_x ),
            .image_y( camera_image_y ),
            .image_origin_update( camera_image_origin_update ),

            // Image Out
            .image_out( camera_image_out ),
            .out_request_external( camera_out_request_external ),

            // Connections to the hardware
            .scl_in( scl ),
            .scl_out( camera_scl_out ),
            .sda_in( sda ),
            .sda_out( camera_sda_out ),
            .vs( vs ),
            .hs( hs ),
            .pclk( pclk ),
            .d( d ),
            .rst( rst ),
            .pwdn( pwdn ),
            .led( cled ),
            .trigger( trigger )

            // .debug( debug )
        );

    // Tristate Ports - Clock is pure output, data needs to be bidirectional (Open Drain)
	// T : Tristate, not Transmit!
	BB    clock_io( .I( camera_scl_out ), .T( 0 ), .O( scl ), .B( genio[18] ) );
	BBPU   data_io( .I( 0 ), .T( camera_sda_out), .O( sda ), .B( genio[19] ) );

    assign pmod[ 0 ] = refresh;                   // Request originating here
    assign pmod[ 1 ] = camera_image_out_valid;
    assign pmod[ 2 ] = image_fifo_out_valid;
    assign pmod[ 3 ] = image_fifo_out_ready;
    //assign pmod[ 6 ] = lcd_image_valid; // can't use these with reformat...
    //assign pmod[ 7 ] = lcd_image_ready;

    assign pmod[ 4 ] = debug[ 0 ];
    assign pmod[ 5 ] = debug[ 1 ];
    assign pmod[ 6 ] = debug[ 4 ];

    assign pmod[ 7 ] = lcd_wr;

    // assign pmod[ 5 ] = image_fifo_out_ready;
    // assign pmod[ 6 ] = lcd_image_stop;

    //
    // Image FIFO
    //

    wire [`I_w( CameraIS )-1:0 ] image_fifo_to_reformat;

    image_fifo #( .InIS( CameraIS ), .OutIS( CameraIS ), .MemoryWidth( 9 ) ) i_f( clock_48mhz, reset, camera_image_out, image_fifo_to_reformat );

    wire                 image_fifo_out_valid;
    wire                 image_fifo_out_ready;

    assign image_fifo_out_valid = `I_Valid( CameraIS, image_fifo_to_reformat );
    assign image_fifo_out_ready   = `I_Ready( CameraIS, image_fifo_to_reformat );

    //
    // Image Reformat
    //

    localparam [`IS_w-1:0] LcdIS =  `IS( ImageXInitial, ImageYInitial, ImageWidth, ImageHeight, 0, 1, `IS_FORMAT_RGB, 5, 6, 5, 0, 0 );

    wire [`I_w( LcdIS )-1:0 ] lcd_image_in;

    image_reformat #( .InIS( CameraIS ), .OutIS( LcdIS ) ) ir( clock_48mhz, reset, image_fifo_to_reformat, lcd_image_in );

    wire lcd_image_stop;
    assign lcd_image_stop = `I_Stop( LcdIS, lcd_image_in );

    wire lcd_image_valid;
    wire lcd_image_ready;

    assign lcd_image_valid = `I_Valid( LcdIS, lcd_image_in );
    assign lcd_image_ready = `I_Ready( LcdIS, lcd_image_in );

    //
    // LCD Image
    //

    `include "../../drivers/rtl/lcd_defs.v"

    wire lcd_configuring;
    wire lcd_running;
    wire lcd_busy;

	// wire [7:0] debug;

    lcd_image #(
            .IS( LcdIS ),
        ) lc (
            .clock( clock_48mhz ),
            .reset( reset ),

            .image( lcd_image_in ),

            .configuring( lcd_configuring ),
            .running( lcd_running ),
            .busy( lcd_busy ),

            .refresh( refresh ),

            // Connecting the LCD Hardware
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

    localparam ControlTimerWidth = 24;
	localparam ControlTimerLongCount = 2**22;
	localparam ControlTimerShortCount = 10;

	reg [ ControlTimerWidth:0 ] control_timer;
	wire control_timer_expired = control_timer[ ControlTimerWidth ];

	always @( posedge clock_48mhz ) begin
		if ( reset ) begin
            camera_configure <= 0;
			camera_start <= 0;
			camera_stop <= 0;
			control_timer <= ControlTimerLongCount;
			control_state <= CONTROL_POWER_DOWN;
            camera_out_request_external <= 0;
    `ifdef BADGE_V2
            led[ 7:0 ] <= 0;
    `else
	        ledc[ 7:0 ] <= 0;
    `endif

		end else begin
			case ( control_state )
				CONTROL_POWER_DOWN: begin
						if ( control_timer_expired ) begin
							camera_configure <= 1;
							control_state <= CONTROL_CONFIGURING;
						end else begin
							control_timer <= control_timer - 1;
						end
					end
				CONTROL_CONFIGURING: begin
                        // Configuring
                        // ... stop asking
                        camera_configure <= 0;
                        // Wait for LCD (no LCD... something's really wrong)
                        if ( lcd_running ) begin
                            // Wait for camera
                            if ( camera_idle && !camera_busy ) begin
                                if ( control_timer_expired ) begin
                                    control_timer <= ControlTimerLongCount;
                                    control_state <= CONTROL_RUNNING;
                                    camera_start <= 1;
                                end else begin
                                    control_timer <= control_timer - 1;
                                end
                            end else begin
                                // No camera?  BSoD for you!
                                if ( camera_error ) begin
                                    camera_start <= 0;
                                    control_state <= CONTROL_ERROR;
                                    // lcd_command <= LCD_COMMAND_FILL_RECT;
                                    // lcd_fill_pixel <= { 5'H1F, 6'H00, 5'H00 };
        							control_timer <= ControlTimerLongCount;
                                end
                            end
                        end
					end
				CONTROL_RUNNING: begin
                        // Request WRITE while the button (LEFT) is down
                        if ( control_timer_expired ) begin
                            if ( !camera_busy && !lcd_busy && ~btn[ 2 ] && ~camera_image_transfer ) begin
                                refresh <= 1;
                                control_timer <= ControlTimerLongCount;
                            end
                            camera_start <= ~btn[ 1 ];
                        end else begin
                            refresh <= 0;
                            control_timer <= control_timer - 1;
                        end
					end
				CONTROL_ERROR: begin
                        if ( control_timer_expired ) begin
                            // Check camera again with button press (UP)
                            if ( ~btn[ 0 ] ) begin
                                control_state <= CONTROL_POWER_DOWN;
                                control_timer <= ControlTimerLongCount;
                            end
                        end else begin
                            control_timer <= control_timer - 1;
                        end
                    end
			endcase
		end
	end

endmodule
