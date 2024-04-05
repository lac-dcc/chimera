/*

Camera Image Testbench - Testing the Camera Image producer

Overview


See Also


*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../pipe/rtl/pipe_defs.v"

`include "../../image/rtl/image_defs.v"

module camera_image_tb();

    parameter Output=`OutputDebug;

    reg  reset;

    initial begin
        $dumpfile("camera_image_tb.vcd");
        $dumpvars( 1, camera_image_tb );
        $dumpvars( 1, camera_image_tb.cam_image );
        $dumpvars( 1, camera_image_tb.cam_image.cam );
        $dumpvars( 1, camera_image_tb.buffer );
        $dumpvars( 1, camera_image_tb.cam_proxy );
        $dumpvars( 0, camera_image_tb.cam_proxy.i2c_s );
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    `AssertSetup

    //
    // Camera Dimensions
    //

    localparam CameraWidth = 32;
    localparam CameraHeight = 16;

    localparam CoordinateWidth = 10;
    localparam BlankingWidth = 16;

    //
    // Bus
    //

    wire sda;
    wire scl;

    wire camera_scl_out;
    wire camera_sda_out;

    wire camera_proxy_scl_out;
    wire camera_proxy_sda_out;

    assign scl = ( camera_scl_out && camera_proxy_scl_out );
    assign sda = ( camera_sda_out && camera_proxy_sda_out );
    // simulate no connection
    // assign sda = ( camera_sda_out ); //&& camera_proxy_sda_out );

    //
    // Camera Core (leaving the I2C IO up to the outer layers)
    //

    wire       out_vs;
    wire       out_hs;
    wire       out_valid;
    wire [9:0] out_d;

    wire       vs;
    wire       hs;
    wire       pclk;
    wire       xclk;
    wire [9:0] d;
    wire       rst;
    wire       led;
    wire       pwdn;

    wire       trigger;

    reg configure;
    reg start;
    reg stop;

    wire configuring;
    wire idle;
    wire running;
    wire error;
    wire busy;
    wire image_transfer;

    // Image Control
    reg [CoordinateWidth-1:0] image_x;
    reg [CoordinateWidth-1:0] image_y;
    reg image_origin_update;

    // Image Out (can't be the full width of the camera (min col start is 1, min row start is 4)
    localparam IS =  `IS( 0, 0, CameraWidth - 1, CameraHeight - 4, 0, 1, `IS_FORMAT_GRAYSCALE, 10, 0, 0, 0, 0 );

    localparam ImageWidth = `IS_WIDTH( IS );
    localparam ImageHeight = `IS_HEIGHT( IS );

    localparam ImagePixelCount = `IS_PIXEL_COUNT( IS );

    localparam ImageWidthWidth =  `IS_WIDTH_WIDTH( IS );
    localparam ImageHeightWidth = `IS_HEIGHT_WIDTH( IS );
    localparam ImageDataWidth =   `IS_DATA_WIDTH( IS );

    localparam ImageC0Width =     `IS_C0_WIDTH( IS );
    localparam ImageC1Width =     `IS_C1_WIDTH( IS );
    localparam ImageC2Width =     `IS_C2_WIDTH( IS );
    localparam ImageAlphaWidth =  `IS_ALPHA_WIDTH( IS );
    localparam ImageZWidth =      `IS_Z_WIDTH( IS );

    wire [`I_w( IS )-1:0 ] image_out;
    reg                    out_request_external;

    // All the out signals
    wire                 image_out_start;
    wire                 image_out_stop;
    wire [ImageDataWidth-1:0] image_out_data;
    wire                 image_out_valid;
    wire                 image_out_error;
    wire                 image_out_ready;
    wire                 image_out_request;
    wire                 image_out_cancel;

    // Monitoring all the signals
    assign image_out_start = `I_Start( IS, image_out );
    assign image_out_stop = `I_Stop( IS, image_out );
    assign image_out_data = `I_Data( IS, image_out );
    assign image_out_error = `I_Error( IS, image_out );
    assign image_out_valid = `I_Valid( IS, image_out );

    assign image_out_request = `I_Valid( IS, image_out );
    assign image_out_cancel = `I_Cancel( IS, image_out );
    assign image_out_ready = `I_Ready( IS, image_out );

    camera_image #(
            .IS( IS ),
            .CameraWidth( CameraWidth ),
            .CameraHeight( CameraHeight ),
            .CameraHorizontalBlanking( 10 ),
            .CameraVerticalBlanking( 10 ),
            .I2CClockCount( 20 ),
            .I2CGapCount( 1 << 6  )
        ) cam_image (
            .clock( clock ),
            .reset( reset ),

            // Camera Control
            .configure( configure ),
            .start( start ),
            .stop( stop ),

            // Camera Status
            .configuring( configuring ),
            .error( error ),
            .idle( idle ),
            .running( running ),
            .busy( busy ),
            .image_transfer( image_transfer ),

            // Image Control
            .image_x( image_x ),
            .image_y( image_y ),
            .image_origin_update( image_origin_update ),

            // Image Out
            .image_out( image_out ),
            .out_request_external( out_request_external ),

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
            .led( led ),
            .trigger( trigger )
        );



    reg buffer_in_request_external;
    reg buffer_out_request_external;

    wire buffer_in_receiving;
    wire buffer_out_sending;

    // Access Port
    reg [ImageWidthWidth-1:0]  buffer_out_x;
    reg [ImageHeightWidth-1:0] buffer_out_y;
    wire [ImageDataWidth-1:0]  buffer_out_data;

    // the out image
    wire [`I_w( IS )-1:0 ] buffer_image_out;

    // All the out signals
    wire                 buffer_image_out_start;
    wire                 buffer_image_out_stop;
    wire [ImageDataWidth-1:0] buffer_image_out_data;
    wire                 buffer_image_out_valid;
    wire                 buffer_image_out_error;

    reg                  buffer_image_out_ready;
    reg                  buffer_image_out_request;
    reg                  buffer_image_out_cancel;

    assign buffer_image_out_start = `I_Start( IS, buffer_image_out );
    assign buffer_image_out_stop = `I_Stop( IS, buffer_image_out );
    assign buffer_image_out_data = `I_Data( IS, buffer_image_out );
    assign buffer_image_out_error = `I_Error( IS, buffer_image_out );
    assign buffer_image_out_valid = `I_Valid( IS, buffer_image_out );

    assign `I_Request( IS, buffer_image_out ) = buffer_image_out_request;
    assign `I_Cancel( IS, buffer_image_out ) = buffer_image_out_cancel;
    assign `I_Ready( IS, buffer_image_out ) = buffer_image_out_ready;

    image_buffer #(
            .IS( IS ),
            .ImplementAccessPort( 1 )
    ) buffer (
            .clock( clock ),
            .reset( reset ),

            .in_request_external( buffer_in_request_external ),
            .out_request_external( buffer_out_request_external ),

            .image_in( image_out ),
            .image_out( buffer_image_out ),

            .in_receiving( buffer_in_receiving ),
            .out_sending( buffer_out_sending ),

            .buffer_out_x( buffer_out_x ),
            .buffer_out_y( buffer_out_y ),
            .buffer_out_data( buffer_out_data )
        );

    camera_proxy #(
            .Width( CameraWidth ),
            .Height( CameraHeight )
        ) cam_proxy (
            .clock( clock ),
            .reset( reset ),

            .scl_in( scl ),
            .scl_out( camera_proxy_scl_out ),
            .sda_in( sda ),
            .sda_out( camera_proxy_sda_out ),

            .vs( vs ),
            .hs( hs ),
            .pclk( pclk ),
            .xclk( xclk ),
            .d( d ),

            .rst( rst ),
            .pwdn( pwdn ),

            .led( led ),
            .trigger( trigger )
        );

    assign xclk = ctb_xclk;

    integer i, j, k;
    integer c;
    integer timeout;
    integer count;

    integer long_c;
    integer long_count;

    reg [8*50:1] test_name;

    task camtb_init;
        begin
            // command <= 0;
            configure = 0;
            start = 0;
            stop = 0;
            ctb_xclk = 0;

            image_x = 0;
            image_y = 0;
            image_origin_update = 0;

            buffer_in_request_external = 0;
            buffer_out_request_external = 0;

            buffer_image_out_cancel = 0;
            buffer_image_out_request = 0;
            buffer_image_out_ready = 0;

            c = 0;
            column_count = 0;
            row_count = 0;

            pixel_count = 0;

            test_height = 0;
            test_width = 0;

        end
    endtask

    reg ctb_xclk;

    task  camtb_clock;
        begin
            #2
            @( posedge clock );
            // `Info( "            Clock");
            ctb_xclk = !ctb_xclk;
            #2
            ;
        end
    endtask

    task camtb_clock_multiple( input integer  n );
        begin
            for ( i = 0; i < n; i = i + 1 ) begin
                camtb_clock;
            end
        end
    endtask

    task  camtb_reset;
        begin
            reset = 1;
            camtb_clock;
            `Info( "    Reset");
            reset = 0;
            camtb_clock;
        end
    endtask

    task camtb_check_write_rect( input integer x0, input integer y0, input integer x1, input integer y1 );
        begin
            `InfoDo $display( "    Check Write [%3d,%3d]-[%3d,%3d]", x0, y0, x1, y1 );
        end
    endtask

    task camtb_wait_not_busy;
        begin
            `InfoDo $display( "        Wait Not Busy" );

            while ( busy )
                camtb_clock;
        end
    endtask

    integer out_frame_x;
    integer out_frame_y;
    integer out_frame_pixel;

    localparam out_frame_pixel_max_total = ( (2**ImageDataWidth) - 1 );

    function [2:0] out_brightness( input reg[ ImageDataWidth-1:0 ] pixel ); begin

            out_frame_pixel = ( ImageC0Width ) ? `I_C0( IS, pixel ) : 0;

            out_brightness = ( out_frame_pixel == 0 ) ? 0 :
                                  ( ( out_frame_pixel <= ( out_frame_pixel_max_total / 4 ) ? 1 :
                                       ( out_frame_pixel <= ( out_frame_pixel_max_total / 2 ) ? 2 : 3 ) ) );

            // $display( "        Brightness %x -> %x %x %x -> %x", pixel, out_frame_pixel_r, out_frame_pixel_g, out_frame_pixel_b, lcdtb_brightness );

        end
    endfunction

    integer b;

    task out_frame( input reg full );
        begin

            // Top of the frame
            $write( "        /" );
            for ( out_frame_x = 0; out_frame_x < ImageWidth; out_frame_x = out_frame_x + 1 ) begin
                $write( "--" );
                if ( !full && ( out_frame_x == ImageWidth / 8 ) ) begin
                    $write( "..." );
                    out_frame_x = 15 * ImageWidth / 16;
                end
            end
            $write( "\\\n" );

            for ( out_frame_y = 0; out_frame_y < ImageHeight; out_frame_y = out_frame_y + 1 ) begin
                $write( "        |" );
                // $display( "        %3d", out_frame_y );
                for ( out_frame_x = 0; out_frame_x < ImageWidth; out_frame_x = out_frame_x + 1 ) begin
                    buffer_out_x = out_frame_x;
                    buffer_out_y = out_frame_y;

                    #1

                    b = out_brightness( buffer_out_data );

                    // $display( "            %3d    %3x", out_frame_x, out_frame_out_data );
                    $write( "%s", ( b == 0 ) ? "  " : ( ( b == 1 ) ? ". " : ( ( b == 2 ) ? ".." : "oo" ) ) );
                    if ( !full && ( out_frame_x == ImageWidth / 8 ) ) begin
                        $write( "..." );
                        out_frame_x = 15 * ImageWidth / 16;
                    end
                end
                $write( "|\n" );
                if ( !full && ( out_frame_y == ImageHeight / 8 ) ) begin
                    $write( "        ...\n" );
                    out_frame_y = 15 * ImageHeight / 16;
                end
            end

            // Bottom of the frame
            $write( "        \\" );
            for ( out_frame_x = 0; out_frame_x < ImageWidth; out_frame_x = out_frame_x + 1 ) begin
                $write( "--" );
                if ( !full && ( out_frame_x == ImageWidth / 8 ) ) begin
                    $write( "..." );
                    out_frame_x = 15 * ImageWidth / 16;
                end
            end
            $write( "/\n" );

        end
    endtask


    // task camtb_set_snapshot( input reg in ) ;
    //     begin
    //         `InfoDo $display( "    Set Snapshot Mode %d", in );
    //         snapshot_mode = in;

    //         while ( busy )
    //             camtb_clock;

    //         set_snapshot_mode = 1;

    //         camtb_clock;

    //         set_snapshot_mode = 0;
    //     end
    // endtask

    // task camtb_set_window( input integer cs, input integer rs, input integer ww, input integer wh );
    //     begin
    //         `InfoDo $display( "    Set Window  X %3d Y %3d W %3d H %3d", cs, rs, ww, wh );

    //         while ( busy )
    //             camtb_clock;

    //         column_start = cs;
    //         row_start = rs;
    //         window_width = ww;
    //         window_height = wh;

    //         set_window = 1;

    //         camtb_clock;

    //         set_window = 0;

    //         `Assert( busy, "Should be busy for a while" );

    //         while (!busy )
    //             camtb_clock;

    //         while (busy)
    //             camtb_clock;

    //     end
    // endtask

    integer data_count;
    integer command_count;

    integer column_count;
    integer row_count;
    integer pixel_count;

    integer test_width;
    integer test_height;

    reg pclk_previous;

    initial begin
        $display( "\nCAMERA Test %s", `__FILE__ );

        camtb_init;
        camtb_reset;

        camtb_clock_multiple( 100 );

        `Info( "    Checking Idle State" );

        `Info( "    Configure" );

        configure = 1;

        camtb_clock;

        configure = 0;

        `Assert( configuring, "Configuring" );

        while ( configuring )
            camtb_clock;

        `Info( "    Idle" );

        `Assert( idle, "Idle" );

        camtb_clock_multiple( 1000 );

        // Try to get some commands in

        // camtb_set_snapshot( 1 );

        // camtb_wait_not_busy;

        // camtb_clock_multiple( 10 );

        camtb_wait_not_busy;

        // `Info( "    Set Window" );

        // test_width = 8;
        // test_height = 8;

        // camtb_set_window( 2, 2, test_width, test_height );

        camtb_wait_not_busy;


        `Info( "    Running" );

        start = 1;

        camtb_clock;

        start = 0;

        while ( running == 0 ) begin
            camtb_clock;
            $display( "        %d", running );
        end

        `Assert( running, "Running" );

        //
        // Image
        //

        `Info( "    Image Request (via Buffer)" );

        buffer_in_request_external = 1;
        camtb_clock;
        buffer_in_request_external = 0;

        `Info( "    Waiting for image transfer" );

        c = 0;
        count = 100000;
        while ( ( image_transfer == 0 ) && ( c < count ) ) begin
            c = c + 1;
            camtb_clock;
        end

        `Info( "    Image Transfer" );

        `Assert( c < count, "Image Transfer taking too long" );

        pixel_count = 0;

        $write( "        " );

        while ( ( c < count ) && ( image_transfer == 1) && ( pixel_count < (ImageWidth * ImageHeight)  ) ) begin

            c = 0;
            count = 10000;
            while ( ( image_out_valid == 0 ) && ( c < count ) ) begin
                camtb_clock;
                c = c + 1;
            end

            `Assert( c < count, "Image Pixel taking too long" );
            `Assert( image_out_valid, "Pixel" );

            if ( pixel_count == 0 )
                `Assert( image_out_start, "Start" );

            if ( pixel_count == ( ( ImageWidth * ImageHeight ) -1 ) )
                `Assert( image_out_stop, "Stop" );

            $write( " %-d", pixel_count  );
            pixel_count = pixel_count + 1;

            camtb_clock;

        end

        `Assert( c < count, "Timeout" );
        `AssertEqual( pixel_count, (ImageWidth * ImageHeight), "Pixel Count"  );

        `InfoDo $display( "        P %-d", pixel_count );

        camtb_clock_multiple( 100 );

        out_frame( 1 );

        `AssertSummary

        $finish;
    end

endmodule

