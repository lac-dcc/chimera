// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*

Image Utils

Obv. this is just dumb copied from FP utils.

Testing

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../image/rtl/image_defs.v"

// Error line number  offset 174?

module image_buffer_instance #(
        parameter IS = `IS_DEFAULT
    )(
    );

    parameter Output=`OutputDebug;

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    task i_init;
        begin
        end
    endtask

    task  i_clock;
        begin
            #2
            @( posedge clock );
            // `Info( "    Clock");
            #2
            ;
        end
    endtask

    reg  reset;
    task  i_reset;
        begin
            reset = 1;
            i_clock;
            `Info( "    Reset");
            reset = 0;
            i_clock;
        end
    endtask

    task test_init;
        begin
            i_init;
            i_reset;

            in_i = 0;
            out_i = 0;
        end
    endtask

    //
    // Spec Details
    //

    localparam ImageWidth =  `I_w( IS );
    localparam ImplementAccessPort = 1;

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

    //
    // ImageBuffer Instance Under Test
    //

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
            .IS( IS ),
            .ImplementAccessPort( ImplementAccessPort )
        ) ib (
            .clock( clock ),
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
    // Signals
    //

    // All the in signals
    reg                  in_start;
    reg                  in_stop;
    reg  [DataWidth-1:0] in_data;
    reg                  in_valid;
    reg                  in_error;

    wire                 in_ready;
    wire                 in_request;
    wire                 in_cancel;

    // Setup the in signals to be controlled from here.
    assign `I_Start( IS, image_in ) = in_start;
    assign `I_Stop( IS, image_in ) = in_stop;
    assign `I_Data( IS, image_in ) = in_data;
    assign `I_Error( IS, image_in ) = in_error;
    assign `I_Valid( IS, image_in ) = in_valid;

    // setup the out signals to be read from here
    assign in_request = `I_Request( IS, image_in );
    assign in_cancel  = `I_Cancel( IS, image_in );
    assign in_ready   = `I_Ready( IS, image_in );

    // All the out signals
    wire                 out_start;
    wire                 out_stop;
    wire [DataWidth-1:0] out_data;
    wire                 out_valid;
    wire                 out_error;

    reg                  out_ready;
    reg                  out_request;
    reg                  out_cancel;

    assign out_start = `I_Start( IS, image_out );
    assign out_stop = `I_Stop( IS, image_out );
    assign out_data = `I_Data( IS, image_out );
    assign out_error = `I_Error( IS, image_out );
    assign out_valid = `I_Valid( IS, image_out );

    assign `I_Request( IS, image_out ) = out_request;
    assign `I_Cancel( IS, image_out ) = out_cancel;
    assign `I_Ready( IS, image_out ) = out_ready;

    //
    // Tests
    //

    task test_initial_state(  inout integer AssertErrorCount, inout integer AssertTestCount );
        begin
            `InfoDo $display( "    Test Initial State" );

            `InfoDo $display( "        IS %x", IS );
            `InfoDo $display( "            IS.X      %d",  `IS_X( IS ) );
            `InfoDo $display( "            IS.Y      %d",  `IS_Y( IS ) );
            `InfoDo $display( "            IS.Width  %d",  `IS_WIDTH( IS ) );
            `InfoDo $display( "            IS.Height %d", `IS_HEIGHT( IS ) );

            `InfoDo $display( "        IS_w %d", `IS_w );
            `InfoDo $display( "        I_w %d", `I_w( IS ) );

            `Assert( !out_sending, "Not Sending" );
            `Assert( !in_receiving, "Not Receiving" );
            `Assert( !in_ready, "Not Ready" );

            in_start = 0;
            in_stop = 0;
            in_data = 0;
            in_error = 0;
            in_valid = 0;

            out_request = 0;
            out_cancel = 0;
            out_ready = 0;

            out_request_external <= 0;
            in_request_external <= 0;
        end
    endtask

    integer in_i;
    integer out_i;
    integer out_i_check;
    integer count;
    integer count_limit;

    task test_in_out( inout integer AssertErrorCount, inout integer AssertTestCount );
        begin

            `InfoDo $display( "    Test In" );

            `Assert( !out_request, "No Out Request" );
            `Assert( !out_cancel, "No Out Cancel" );
            `Assert( !out_ready, "No Out Ready" );

            `Assert( !in_request, "No In Request" );
            `Assert( !in_ready, "No In Ready" );
            `Assert( !in_cancel, "No In Cancel" );

            // no error asserted
            in_error = 0;

            // pull a frame
            in_request_external = 1;

            i_clock;
            `Assert( in_request, "In Request" );
            `Assert( in_ready, "In Ready" );

            in_valid = 1;

            for ( in_i = 0; in_i < PixelCount; in_i = in_i + 1 ) begin

                in_data = in_i % 2;
                in_start = ( in_i == 0 );
                in_stop = ( in_i == PixelCount - 1 );

                `Assert( in_ready, "In Ready" );

                i_clock;

            end

            in_valid = 0;
            in_data  = 0;
            in_start = 0;
            in_stop  = 0;

            i_clock;
            i_clock;
            i_clock;
            i_clock;

            // read the image out

            out_request <= 1;
            out_ready <= 1;

            i_clock;

            out_i = 0;

            count_limit = PixelCount + 10;
            count = 0;

            while ( ( out_i < PixelCount ) && ( count < count_limit ) ) begin

                if ( out_valid ) begin
                    out_i_check = out_i % 2;
                    `AssertEqual( out_data, out_i_check, "Data" );
                    `AssertEqual( out_start, ( out_i == 0 ), "Start" );
                    `AssertEqual( out_stop, ( out_i == PixelCount - 1 ), "Stop" );
                    out_i = out_i + 1;
                end

                count = count + 1;
                i_clock;

            end

            out_ready <= 0;

            `Assert( count < count_limit, "Count Limit" );
            `AssertEqual( out_i, PixelCount, "Out Count" );

        end
    endtask

    integer out_frame_x;
    integer out_frame_y;
    integer out_frame_pixel_r;
    integer out_frame_pixel_g;
    integer out_frame_pixel_b;
    integer out_frame_pixel_total;

    localparam out_frame_pixel_max_total = ( (2**C0Width) + (2**C1Width) + (2**C2Width) - 3 );

    function [2:0] out_brightness( input reg[ DataWidth-1:0 ] pixel ); begin

            out_frame_pixel_r = ( C0Width ) ? `I_C0( IS, pixel ) : 0;
            out_frame_pixel_g = ( C1Width ) ? `I_C1( IS, pixel ) : 0;
            out_frame_pixel_b = ( C2Width ) ? `I_C2( IS, pixel ) : 0;
            // out_frame_pixel_r = 0;
            // out_frame_pixel_g = 0;
            // out_frame_pixel_b = 0;

            out_frame_pixel_total = out_frame_pixel_r + out_frame_pixel_g + out_frame_pixel_b;

            // lcdtb_brightness = ( out_frame_pixel_total == 0 ) ? 0 : 1;

            out_brightness = ( out_frame_pixel_total == 0 ) ? 0 :
                                  ( ( out_frame_pixel_total <= ( out_frame_pixel_max_total / 4 ) ? 1 :
                                       ( out_frame_pixel_total <= ( out_frame_pixel_max_total / 2 ) ? 2 : 3 ) ) );

            // $display( "        Brightness %x -> %x %x %x -> %x", pixel, out_frame_pixel_r, out_frame_pixel_g, out_frame_pixel_b, lcdtb_brightness );

        end
    endfunction

    integer b;

    task out_frame( input reg full );
        begin

            // Top of the frame
            $write( "        /" );
            for ( out_frame_x = 0; out_frame_x < Width; out_frame_x = out_frame_x + 1 ) begin
                $write( "--" );
                if ( !full && ( out_frame_x == Width / 8 ) ) begin
                    $write( "..." );
                    out_frame_x = 15 * Width / 16;
                end
            end
            $write( "\\\n" );

            for ( out_frame_y = 0; out_frame_y < Height; out_frame_y = out_frame_y + 1 ) begin
                $write( "        |" );
                // $display( "        %3d", out_frame_y );
                for ( out_frame_x = 0; out_frame_x < Width; out_frame_x = out_frame_x + 1 ) begin
                    buffer_out_x = out_frame_x;
                    buffer_out_y = out_frame_y;

                    #1

                    b = out_brightness( buffer_out_data );

                    // $display( "            %3d    %3x", out_frame_x, out_frame_out_data );
                    $write( "%s", ( b == 0 ) ? "  " : ( ( b == 1 ) ? ". " : ( ( b == 2 ) ? ".." : "oo" ) ) );
                    if ( !full && ( out_frame_x == Width / 8 ) ) begin
                        $write( "..." );
                        out_frame_x = 15 * Width / 16;
                    end
                end
                $write( "|\n" );
                if ( !full && ( out_frame_y == Height / 8 ) ) begin
                    $write( "        ...\n" );
                    out_frame_y = 15 * Height / 16;
                end
            end

            // Bottom of the frame
            $write( "        \\" );
            for ( out_frame_x = 0; out_frame_x < Width; out_frame_x = out_frame_x + 1 ) begin
                $write( "--" );
                if ( !full && ( out_frame_x == Width / 8 ) ) begin
                    $write( "..." );
                    out_frame_x = 15 * Width / 16;
                end
            end
            $write( "/\n" );

        end
    endtask



endmodule

module image_buffer_tb();

    parameter Output=`OutputDebug;
    // parameter Output=`OutputInfo;
    // parameter Output=`OutputError;

    initial begin
      $dumpfile("image_buffer_tb.vcd");
      $dumpvars( 0, image_buffer_tb );
    end

    `AssertSetup

    // leaving as an integer doesn't seem to work
    localparam [`IS_w-1:0] IS_1 = `IS( 0, 0, 10, 10, 0, 1, `IS_FORMAT_RGB, 8, 8, 8, 0, 0 );

    image_buffer_instance #( .IS(IS_1) ) ibi1( );

    initial begin
        $display( "Image Buffer Tests %s", `__FILE__ );

        `Info( "    Spec Check" );
        `InfoDo $display( "        IS %x", IS_1 );
        `InfoDo $display( "            IS.X      %d",  `IS_X( IS_1 ) );
        `InfoDo $display( "            IS.Y      %d",  `IS_Y( IS_1 ) );
        `InfoDo $display( "            IS.Width  %d",  `IS_WIDTH( IS_1 ) );
        `InfoDo $display( "            IS.Height %d", `IS_HEIGHT( IS_1 ) );

        ibi1.test_init;
        ibi1.test_initial_state( AssertErrorCount, AssertTestCount);

        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;

        ibi1.out_frame( 1 );

        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;

        ibi1.test_in_out( AssertErrorCount, AssertTestCount );

        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;

        ibi1.out_frame( 1 );

        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;
        ibi1.i_clock;

        `AssertSummary

        $finish;
    end

endmodule

