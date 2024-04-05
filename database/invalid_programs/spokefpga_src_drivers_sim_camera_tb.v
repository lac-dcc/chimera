/*

Camera Testbench - Testing Camera Module

Overview


See Also

    lcd
    lcd_proxy
    lcd_image

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../pipe/rtl/pipe_defs.v"

module camera_tb();

    parameter Output=`OutputDebug;

    reg  reset;

    initial begin
        $dumpfile("camera_tb.vcd");
        $dumpvars( 1, camera_tb );
        $dumpvars( 1, camera_tb.cam );
        $dumpvars( 1, camera_tb.cam.cam_conf );
        $dumpvars( 1, camera_tb.cam.i2c_m );
        $dumpvars( 1, camera_tb.cam_proxy );
        $dumpvars( 0, camera_tb.cam_proxy.i2c_s );
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

    reg [CoordinateWidth-1:0] column_start;
    reg [CoordinateWidth-1:0] row_start;
    reg [CoordinateWidth-1:0] window_width;
    reg [CoordinateWidth-1:0] window_height;

    reg set_origin;
    reg set_window;

    reg [BlankingWidth-1:0]   horizontal_blanking;
    reg [BlankingWidth-1:0]   vertical_blanking;

    reg set_blanking;

    reg snapshot_mode;
    reg set_snapshot_mode;
    reg snapshot;

    localparam PixelWidth = 10;

    // Toggling on the pipe or not to pipe issue
    // localparam PixelPipeSpec =`PS( PixelWidth, 0, 1, 0, 0, 0, 0 );  // PixelWidth data, Start Stop, and Ready Valid implied
    // localparam PixelPipeWidth = `P_w( PixelPipeSpec );

    // wire [ PixelPipeWidth-1 : 0 ] pipe_pipe;

    wire [PixelWidth-1:0] pixel_data;
    wire                  pixel_frame_start;
    wire                  pixel_frame_stop;
    wire                  pixel_line_start;
    wire                  pixel_line_stop;

    camera_core #(
            .Width( CameraWidth ),
            .Height( CameraHeight ),
            .I2CClockCount( 32 ),
            .I2CGapCount(1 << 8)
        ) cam (
            .clock( clock ),
            .reset( reset ),

            // Camera Control
            .configure( configure ),
            .start( start ),
            .stop( stop ),

            // Camera Status
            .running( running ),
            .idle( idle ),
            .configuring( configuring ),
            .busy( busy ),
            .error( error ),

            // Set Window / Origin
            .column_start( column_start ),
            .row_start( row_start),
            .window_width( window_width ),
            .window_height( window_height ),

            .set_origin( set_origin ),
            .set_window( set_window ),

            // Set Blanking
            .horizontal_blanking( horizontal_blanking ),
            .vertical_blanking( vertical_blanking ),

            .set_blanking( set_blanking ),

            // Set Snapshot
            .snapshot_mode( snapshot_mode ),
            .set_snapshot_mode( set_snapshot_mode ),

            .snapshot( snapshot ),

            // Camera Data
            .out_vs( out_vs ),
            .out_hs( out_hs ),
            .out_valid( out_valid ),
            .out_d( out_d ),

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

    reg [8*50:1] test_name;

    task camtb_init;
        begin
            // command <= 0;
            configure = 0;
            start = 0;
            stop = 0;
            ctb_xclk = 0;

            snapshot = 0;

            c = 0;
            column_count = 0;
            row_count = 0;

            test_height = 0;
            test_width = 0;

            set_origin = 0;
            set_window = 0;
            set_blanking = 0;
            set_snapshot_mode = 0;

            column_start = 0;
            row_start = 0;
            window_width = 0;
            window_height = 0;

            horizontal_blanking = 0;
            vertical_blanking = 0;

            snapshot_mode = 0;
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

    task camtb_set_snapshot( input reg in ) ;
        begin
            `InfoDo $display( "    Set Snapshot Mode %d", in );
            snapshot_mode = in;

            while ( busy )
                camtb_clock;

            set_snapshot_mode = 1;

            camtb_clock;

            set_snapshot_mode = 0;
        end
    endtask

    task camtb_set_window( input integer cs, input integer rs, input integer ww, input integer wh );
        begin
            `InfoDo $display( "    Set Window  X %3d Y %3d W %3d H %3d", cs, rs, ww, wh );

            while ( busy )
                camtb_clock;

            column_start = cs;
            row_start = rs;
            window_width = ww;
            window_height = wh;

            set_window = 1;

            camtb_clock;

            set_window = 0;

            `Assert( busy, "Should be busy for a while" );

            while (!busy )
                camtb_clock;

            while (busy)
                camtb_clock;

        end
    endtask

    integer data_count;
    integer command_count;

    integer column_count;
    integer row_count;

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

        `Info( "    Set Window" );

        test_width = 8;
        test_height = 8;

        camtb_set_window( 2, 2, test_width, test_height );

        camtb_wait_not_busy;

        camtb_clock_multiple( 1000 );

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
        // Snapshot stuff
        //

        // `Info( "    Trigger!" );

        // snapshot = 1;
        // camtb_clock;

        // c = 0;
        // count = 100;
        // while ( ( led == 0 ) && ( c < count ) ) begin
        //     camtb_clock;
        //     c = c + 1;
        // end

        // snapshot = 0;

        // `Assert( c < count, "Too long waiting for Exposure" );

        // `Info( "    Exposure" );

        // c = 0;
        // count = 1000;
        // while ( ( led == 1 ) && ( c < count ) ) begin
        //     camtb_clock;
        //     c = c + 1;
        // end

        // `Assert( c < count, "Exposure too long" );

        //
        // FRAME
        //

        `Info( "    Frame Start" );

        c = 0;
        count = 100000;
        while ( ( out_vs == 0 ) && ( c < count ) ) begin
            camtb_clock;
            c = c + 1;
        end

        `Assert( c < count, "Frame Start too long" );

        row_count = 0;
        column_count = 0;

        while ( ( out_vs == 1) && ( row_count < test_height  ) ) begin

            `Info( "        Wait for Line Start" );

            c = 0;
            count = 10000;
            while ( ( out_hs == 0 ) && ( c < count ) ) begin
                camtb_clock;
                c = c + 1;
            end

            `Assert( c < count, "Too long waiting for dropped hs after vs" );

            `Info( "        Read Line Start" );

            c  = 0;
            count = 1000;
            while ( ( out_hs == 1 ) && ( c < count ) ) begin

                while ( ( !out_valid ) && ( c < count ) )  begin
                    camtb_clock;
                    c = c + 1;
                end

                camtb_clock;

                c = c + 1;
                column_count = column_count + 1;
            end

            `Info( "        Line End" );

            `AssertEqual( column_count, test_width, "Wrong column count" );
            `Assert( c < count, "Too long in line" );

            `InfoDo $display( "        H %-d", column_count );

            column_count = 0;

            row_count = row_count + 1;
        end

        `InfoDo $display( "        V %-d", row_count );

        `Info( "    Frame End" );

        c = 0;
        count = 10000;
        while ( ( vs == 1 ) && ( c < count ) ) begin
            camtb_clock;
            c = c + 1;
        end

        `Assert( c < count, "Too long waiting for end of frame" );

        camtb_clock_multiple( 100 );

        `AssertEqual( row_count, test_height, "Wrong row count" );

        camtb_wait_not_busy;

        `Info( "    Idle" );

        stop = 1;

        camtb_clock;

        stop = 0;

        c = 0;
        count = 100000;
        while ( ( running == 1 ) && ( c < count ) ) begin
            camtb_clock;
            c = c + 1;
        end

        camtb_clock;

        `Assert( c < count, "Stop took too long" );

        `Info( "    Set New Window = size of camera image" );

        // The maximum width is limited by the minimum column start (1)
        test_width = CameraWidth - 1;
        // The maximum height is limited by the minimum row start (4)
        test_height = CameraHeight - 4;

        camtb_set_window( 1, 4, test_width, test_height );

        camtb_wait_not_busy;

        camtb_clock_multiple( 1000 );

        `Info( "    Restart Start" );

        start = 1;

        camtb_clock;

        start = 0;

        camtb_clock;

        c = 0;
        count = 100000;
        while ( ( running == 0 ) && ( c < count ) ) begin
            camtb_clock;
            c = c + 1;
        end

        `Assert( c < count, "Start took too long" );

        //
        // FRAME
        //

        `Info( "    Frame Start" );

        c = 0;
        count = 100000;
        while ( ( out_vs == 0 ) && ( c < count ) ) begin
            camtb_clock;
            c = c + 1;
        end

        `Assert( c < count, "Frame Start too long" );

        row_count = 0;
        column_count = 0;

        while ( ( out_vs == 1) && ( row_count < test_height  ) ) begin

            `Info( "        Wait for Line Start" );

            c = 0;
            count = 10000;
            while ( ( out_hs == 0 ) && ( c < count ) ) begin
                camtb_clock;
                c = c + 1;
            end

            `Assert( c < count, "Too long waiting for dropped hs after vs" );

            `Info( "        Read Line Start" );

            c  = 0;
            count = 1000;
            while ( ( out_hs == 1 ) && ( c < count ) ) begin

                while ( ( !out_valid ) && ( c < count ) )  begin
                    camtb_clock;
                    c = c + 1;
                end

                camtb_clock;

                c = c + 1;
                column_count = column_count + 1;
            end

            `Info( "        Line End" );

            `AssertEqual( column_count, test_width, "Wrong column count" );
            `Assert( c < count, "Too long in line" );

            `InfoDo $display( "        H %-d", column_count );

            column_count = 0;

            row_count = row_count + 1;
        end

        `InfoDo $display( "        V %-d", row_count );

        `Info( "    Frame End" );

        c = 0;
        count = 10000;
        while ( ( vs == 1 ) && ( c < count ) ) begin
            camtb_clock;
            c = c + 1;
        end

        `Assert( c < count, "Too long waiting for end of frame" );

        camtb_clock_multiple( 100 );

        `AssertEqual( row_count, test_height, "Wrong row count" );


        `AssertSummary

        $finish;
    end

endmodule

