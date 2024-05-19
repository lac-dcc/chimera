// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*

Image Debayer Test


Testing

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../image/rtl/image_defs.v"

module image_debayer_instance #(
        parameter [`IS_w-1:0] IS = `IS_DEFAULT
    )(
        input [1:0] operation
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

    localparam ImplementAccessPort = 1;
    localparam [7:0] ImageWidth =  `I_w( IS );

    localparam [7:0] Width  = `IS_WIDTH( IS );
    localparam [7:0] Height = `IS_HEIGHT( IS );

    localparam [31:0] PixelCount = `IS_PIXEL_COUNT( IS );

    localparam [7:0] WidthWidth  = `IS_WIDTH_WIDTH( IS );
    localparam [7:0] HeightWidth = `IS_HEIGHT_WIDTH( IS );
    localparam [7:0] DataWidth   = `IS_DATA_WIDTH( IS );

    localparam [7:0] C0Width    = `IS_C0_WIDTH( IS );
    localparam [7:0] C1Width    = `IS_C1_WIDTH( IS );
    localparam [7:0] C2Width    = `IS_C2_WIDTH( IS );
    localparam [7:0] AlphaWidth = `IS_ALPHA_WIDTH( IS );
    localparam [7:0] ZWidth     = `IS_Z_WIDTH( IS );

    localparam C0Max    = ( 1 << C0Width ) - 1;
    localparam C1Max    = ( 1 << C1Width ) - 1;
    localparam C2Max    = ( 1 << C2Width ) - 1;
    localparam AlphaMax = ( 1 << AlphaWidth ) - 1;
    localparam ZMax     = ( 1 << ZWidth ) - 1;

    //
    // Image Background
    //

    wire [ImageWidth-1:0 ] image_background2debayer;
    reg                    background_out_request_external;

    wire background_out_sending;

    localparam [`IS_w-1:0] IS_RGB8 = `IS( 0, 0, 32, 32, 0, 1, `IS_FORMAT_RGB, 8,  8,  8, 0, 0 );

    localparam ColorDataWidth = `IS_DATA_WIDTH( IS_RGB8 );

    reg [ColorDataWidth-1:0] color;

    image_background #(
            .IS( IS )
    ) ibackground (
            .clock( clock ),
            .reset( reset ),

            .operation( operation ),
            .color( color ),

            .out_request_external( background_out_request_external ),

            .image_out( image_background2debayer ),

            .out_sending( background_out_sending )
        );

    // All the buffer out signals (set up to monitor all)
    wire                 background_out_start;
    wire                 background_out_stop;
    wire [DataWidth-1:0] background_out_data;
    wire                 background_out_valid;
    wire                 background_out_error;
    wire                 background_out_ready;
    wire                 background_out_request;
    wire                 background_out_cancel;

    assign background_out_start   = `I_Start(   IS, image_background2debayer );
    assign background_out_stop    = `I_Stop(    IS, image_background2debayer );
    assign background_out_data    = `I_Data(    IS, image_background2debayer );
    assign background_out_error   = `I_Error(   IS, image_background2debayer );
    assign background_out_valid   = `I_Valid(   IS, image_background2debayer );
    assign background_out_request = `I_Request( IS, image_background2debayer );
    assign background_out_cancel  = `I_Cancel(  IS, image_background2debayer );
    assign background_out_ready   = `I_Ready(   IS, image_background2debayer );

    //
    // ImageDebayer
    //

    localparam [`IS_w-1:0] IS_DB = `IS( 0, 0, Width, Height, 0, 1, `IS_FORMAT_RGB, 5, 6, 5, 0, 0 );

    localparam DBImageWidth     = `I_w( IS_DB );
    localparam DBImageDataWidth = `IS_DATA_WIDTH( IS_DB );

    wire [DBImageWidth-1:0 ] debayer_image_out;

    // All the debayer out signals
    wire                        debayer_out_start;
    wire                        debayer_out_stop;
    wire [DBImageDataWidth-1:0] debayer_out_data;
    wire                        debayer_out_valid;
    wire                        debayer_out_error;
    wire                        debayer_out_ready;
    wire                        debayer_out_request;
    wire                        debayer_out_cancel;

    assign debayer_out_start = `I_Start( IS_DB, debayer_image_out );
    assign debayer_out_stop = `I_Stop( IS_DB, debayer_image_out );
    assign debayer_out_data = `I_Data( IS_DB, debayer_image_out );
    assign debayer_out_error = `I_Error( IS_DB, debayer_image_out );
    assign debayer_out_valid = `I_Valid( IS_DB, debayer_image_out );
    assign debayer_out_request = `I_Request( IS_DB, debayer_image_out );
    assign debayer_out_cancel = `I_Cancel( IS_DB, debayer_image_out );
    assign debayer_out_ready = `I_Ready( IS_DB, debayer_image_out );

    image_debayer #(
            .InIS( IS ),
            .OutIS( IS_DB )
    ) idebayer (
            .clock( clock ),
            .reset( reset ),

            .image_in( image_background2debayer ),
            .image_out( debayer_image_out )
        );

    //
    // ImageBuffer
    //

    reg  buffer_in_request_external;
    reg  buffer_out_request_external;

    wire [DBImageWidth-1:0 ] buffer_image_out;

    wire in_receiving;
    wire out_sending;

    reg  [WidthWidth-1:0]       buffer_port_out_x;
    reg  [HeightWidth-1:0]      buffer_port_out_y;
    wire [DBImageDataWidth-1:0] buffer_port_out_data;

    image_buffer #(
            .IS( IS_DB ),
            .ImplementAccessPort( ImplementAccessPort )
    ) ibuffer (
            .clock( clock ),
            .reset( reset ),

            .in_request_external( buffer_in_request_external ),
            .out_request_external( buffer_out_request_external ),

            .image_in( debayer_image_out ),
            .image_out( buffer_image_out ),

            .in_receiving( in_receiving ),
            .out_sending( out_sending ),

            .buffer_out_x( buffer_port_out_x ),
            .buffer_out_y( buffer_port_out_y ),
            .buffer_out_data( buffer_port_out_data )
        );

    //
    // Signals
    //

    // All the out signals
    wire                 buffer_out_start;
    wire                 buffer_out_stop;
    wire [DataWidth-1:0] buffer_out_data;
    wire                 buffer_out_valid;
    wire                 buffer_out_error;
    reg                  buffer_out_ready;
    reg                  buffer_out_request;
    reg                  buffer_out_cancel;

    assign buffer_out_start = `I_Start( IS_DB, buffer_image_out );
    assign buffer_out_stop = `I_Stop( IS_DB, buffer_image_out );
    assign buffer_out_data = `I_Data( IS_DB, buffer_image_out );
    assign buffer_out_error = `I_Error( IS_DB, buffer_image_out );
    assign buffer_out_valid = `I_Valid( IS_DB, buffer_image_out );

    assign `I_Request( IS_DB, buffer_image_out ) = buffer_out_request;
    assign `I_Cancel( IS_DB, buffer_image_out ) = buffer_out_cancel;
    assign `I_Ready( IS_DB, buffer_image_out ) = buffer_out_ready;

    //
    // Tests
    //

    task test_initial_state(  inout integer AssertErrorCount, inout integer AssertTestCount );
        begin
            `InfoDo $display( "    Test Initial State" );

            `InfoDo $display( "        IS            %x", IS_DB );
            `InfoDo $display( "                 IS_w %d", `IS_w );
            `InfoDo $display( "                  I_w %d", `I_w( IS_DB ) );
            `InfoDo $display( "            IS_DB.X      %d", `IS_X( IS_DB ) );
            `InfoDo $display( "            IS_DB.Y      %d", `IS_Y( IS_DB ) );
            `InfoDo $display( "            IS_DB.Width  %d", `IS_WIDTH( IS_DB ) );
            `InfoDo $display( "            IS_DB.Height %d", `IS_HEIGHT( IS_DB ) );
            `InfoDo $display( "          Pixel Count %d", PixelCount );

            `Assert( !background_out_sending, "Not Sending" );

            buffer_out_request = 0;
            buffer_out_cancel = 0;
            buffer_out_ready = 0;

            background_out_request_external <= 0;
            buffer_out_request_external <= 0;
            buffer_in_request_external <= 0;
        end
    endtask

    integer in_i;
    integer out_i;
    integer out_i_check;
    integer count;
    integer count_limit;

    reg [DataWidth-1:0] data_check;

    reg [DataWidth-1:0] pixel;

    task test_background( inout integer AssertErrorCount, inout integer AssertTestCount );
        begin

            `InfoDo $display( "    Test Background" );

            `Assert( !background_out_request, "No Out Request" );
            `Assert( !background_out_cancel, "No Out Cancel" );
            `Assert( !background_out_ready, "No Out Ready" );

            // pull a frame
            buffer_in_request_external = 1;

            `Info( "        Requesting" );

            i_clock;

            buffer_in_request_external = 0;

            // not ready yet
            `Assert( !background_out_request, "Buffer Request" );
            `Assert( !background_out_ready, "Buffer Ready" );

            i_clock;

            // takes one extra clock to propagate in
            `Assert( background_out_request, "Buffer Request" );
            // `Assert( background_out_ready, "Buffer Ready" );

            out_i = 0;

            count_limit = PixelCount + 10;
            count = 0;

            // set the solid color up
            `I_C0( IS_RGB8, color ) = 8'HFF;
            `I_C1( IS_RGB8, color ) = 8'HFF;
            `I_C2( IS_RGB8, color ) = 8'HFF;

            pixel = `I_Color2Color( IS, IS_RGB8, color );

            `Info( "        Looping" );

            while ( ( out_i < PixelCount ) && ( count < count_limit ) ) begin

                if ( background_out_ready && background_out_valid ) begin
                    if ( out_i == 0 ) begin
                        `Assert( background_out_start, "Start" );
                    end
                    if ( out_i == PixelCount - 1'H1  ) begin
                        `Assert( background_out_stop, "Stop" );
                    end
                    out_i = out_i + 1'H1;
                    // `InfoDo $display( "        Data Check %d", out_i );
                    data_check = `I_Data( IS, background_out_data );
                    if ( ( operation == 2'H0 ) && ( `IS_FORMAT( IS ) == `IS_FORMAT_GRAYSCALE ) ) begin
                        `AssertEqual( pixel, data_check, "Xfer");
                    end
                end

                count = count + 1;
                i_clock;

            end

            `Assert( count < count_limit, "Count Limit" );
            `AssertEqual( out_i, PixelCount, "Out Count" );

        end
    endtask

    //
    // Buffer to Console
    //

    localparam [7:0] OutC0Width    = `IS_C0_WIDTH( IS_DB );
    localparam [7:0] OutC1Width    = `IS_C1_WIDTH( IS_DB );
    localparam [7:0] OutC2Width    = `IS_C2_WIDTH( IS_DB );
    localparam [7:0] OutAlphaWidth = `IS_ALPHA_WIDTH( IS_DB );
    localparam [7:0] OutZWidth     = `IS_Z_WIDTH( IS_DB );

    localparam [7:0] OutDataWidth  = `IS_DATA_WIDTH( IS_DB );

    localparam OutC0Max    = ( 1 << OutC0Width ) - 1;
    localparam OutC1Max    = ( 1 << OutC1Width ) - 1;
    localparam OutC2Max    = ( 1 << OutC2Width ) - 1;
    localparam OutAlphaMax = ( 1 << OutAlphaWidth ) - 1;
    localparam OutZMax     = ( 1 << OutZWidth ) - 1;

    integer out_frame_x;
    integer out_frame_y;
    integer out_frame_pixel_r;
    integer out_frame_pixel_g;
    integer out_frame_pixel_b;
    integer out_frame_pixel_total;

    localparam out_frame_pixel_max_total = ( (2**C0Width) + (2**C1Width) + (2**C2Width) - 3 );

    function [2:0] out_brightness( input reg[ OutDataWidth-1:0 ] pixel ); begin

            out_frame_pixel_r = ( C0Width > 0 ) ? `I_C0( IS_DB, pixel ) : 0;
            out_frame_pixel_g = ( C1Width > 0 ) ? `I_C1( IS_DB, pixel ) : 0;
            out_frame_pixel_b = ( C2Width > 0 ) ? `I_C2( IS_DB, pixel ) : 0;
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

    function [2:0] out_c0( input reg[ OutDataWidth-1:0 ] pixel ); begin
            out_c0 = ( OutC0Width == 0 ) ? 0 :
                            ( `I_C0( IS_DB, pixel ) == 0 ) ? 0 :
                                  ( ( `I_C0( IS_DB, pixel ) <= ( OutC0Max / 4 ) ? 1 :
                                       ( `I_C0( IS_DB, pixel ) <= ( OutC0Max / 2 ) ? 2 : 3 ) ) );
        end
    endfunction

    function [2:0] out_c1( input reg[ OutDataWidth-1:0 ] pixel ); begin
            out_c1 = ( OutC1Width == 0 ) ? 0 :
                            ( `I_C1( IS_DB, pixel ) == 0 ) ? 0 :
                                  ( ( `I_C1( IS_DB, pixel ) <= ( OutC1Max / 4 ) ? 1 :
                                       ( `I_C1( IS_DB, pixel ) <= ( OutC1Max / 2 ) ? 2 : 3 ) ) );
        end
    endfunction

    function [2:0] out_c2( input reg[ OutDataWidth-1:0 ] pixel ); begin
            out_c2 = ( OutC2Width == 0 ) ? 0 :
                            ( `I_C2( IS_DB, pixel ) == 0 ) ? 0 :
                                  ( ( `I_C2( IS_DB, pixel ) <= ( OutC2Max / 4 ) ? 1 :
                                       ( `I_C2( IS_DB, pixel ) <= ( OutC2Max / 2 ) ? 2 : 3 ) ) );
        end
    endfunction

    // integer b;

    task out_frame_mono( input reg full );
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
                    buffer_port_out_x = out_frame_x;
                    buffer_port_out_y = out_frame_y;

                    #1

                    b = out_c0( buffer_port_out_data );

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


    integer r;
    integer b;
    integer g;

    task out_frame_rgb( input reg full );
        begin

            // Top of the frame
            $write( "        /" );
            for ( out_frame_x = 0; out_frame_x < Width; out_frame_x = out_frame_x + 1 ) begin
                $write( "---" );
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
                    buffer_port_out_x = out_frame_x;
                    buffer_port_out_y = out_frame_y;

                    #1

                    r = out_c0( buffer_port_out_data );
                    g = out_c1( buffer_port_out_data );
                    b = out_c2( buffer_port_out_data );

                    // $display( "            %3d    %3x", out_frame_x, out_frame_out_data );
                    $write( "%s", ( r == 0 ) ? " " : ( ( r == 1 ) ? "." : ( ( r == 2 ) ? "r" : "R" ) ) );
                    $write( "%s", ( g == 0 ) ? " " : ( ( g == 1 ) ? "." : ( ( g == 2 ) ? "g" : "G" ) ) );
                    $write( "%s", ( b == 0 ) ? " " : ( ( b == 1 ) ? "." : ( ( b == 2 ) ? "b" : "B" ) ) );

                    /// $write( "***" );

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
                $write( "---" );
                if ( !full && ( out_frame_x == Width / 8 ) ) begin
                    $write( "..." );
                    out_frame_x = 15 * Width / 16;
                end
            end
            $write( "/\n" );

        end
    endtask
endmodule

module image_debayer_tb();

    parameter Output=`OutputDebug;
    // parameter Output=`OutputInfo;
    // parameter Output=`OutputError;

    initial begin
      $dumpfile("image_debayer_tb.vcd");
      $dumpvars( 1, image_debayer_tb );
      $dumpvars( 1, image_debayer_tb.idebayer );
    end

    `AssertSetup

    //
    // Single Module Tests
    //

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

    //
    // Spec Details
    //

    localparam [`IS_w-1:0] IS_IN = `IS( 0, 0, 8, 8, 0, 1, `IS_FORMAT_BAYER, 10, 0, 0, 0, 0 );

    localparam InImageDataWidth =  `I_w( IS_IN );

    localparam InWidth       = `IS_WIDTH( IS_IN );
    localparam InHeight      = `IS_HEIGHT( IS_IN );

    localparam InPixelCount  = `IS_PIXEL_COUNT( IS_IN );

    localparam InWidthWidth  = `IS_WIDTH_WIDTH( IS_IN );
    localparam InHeightWidth = `IS_HEIGHT_WIDTH( IS_IN );
    localparam InDataWidth   = `IS_DATA_WIDTH( IS_IN );

    localparam InC0Width =     `IS_C0_WIDTH( IS_IN );
    localparam InC1Width =     `IS_C1_WIDTH( IS_IN );
    localparam InC2Width =     `IS_C2_WIDTH( IS_IN );
    localparam InAlphaWidth =  `IS_ALPHA_WIDTH( IS_IN );
    localparam InZWidth =      `IS_Z_WIDTH( IS_IN );

    localparam [`IS_w-1:0] IS_OUT = `IS( 0, 0, 8, 8, 0, 1, `IS_FORMAT_RGB, 8, 8, 8, 0, 0 );

    localparam OutImageDataWidth =  `I_w( IS_OUT );

    localparam OutWidth       = `IS_WIDTH( IS_OUT );
    localparam OutHeight      = `IS_HEIGHT( IS_OUT );

    localparam OutPixelCount  = `IS_PIXEL_COUNT( IS_OUT );

    localparam OutWidthWidth  = `IS_WIDTH_WIDTH( IS_OUT );
    localparam OutHeightWidth = `IS_HEIGHT_WIDTH( IS_OUT );
    localparam OutDataWidth   = `IS_DATA_WIDTH( IS_OUT );

    localparam OutC0Width =     `IS_C0_WIDTH( IS_OUT );
    localparam OutC1Width =     `IS_C1_WIDTH( IS_OUT );
    localparam OutC2Width =     `IS_C2_WIDTH( IS_OUT );
    localparam OutAlphaWidth =  `IS_ALPHA_WIDTH( IS_OUT );
    localparam OutZWidth =      `IS_Z_WIDTH( IS_OUT );

    wire [InImageDataWidth-1:0] image_in;

    reg                    in_start;
    reg                    in_stop;
    reg  [InDataWidth-1:0] in_data;
    reg                    in_valid;
    reg                    in_error;
    wire                   in_ready;
    wire                   in_request;
    wire                   in_cancel;

    assign `I_Start( IS_IN, image_in ) = in_start;
    assign `I_Stop(  IS_IN, image_in ) = in_stop;
    assign `I_Data(  IS_IN, image_in ) = in_data;
    assign `I_Error( IS_IN, image_in ) = in_error;
    assign `I_Valid( IS_IN, image_in ) = in_valid;
    assign in_request = `I_Request( IS_IN, image_in );
    assign in_cancel  = `I_Cancel(  IS_IN, image_in );
    assign in_ready   = `I_Ready(   IS_IN, image_in );

    wire [OutImageDataWidth-1:0] image_out;

    wire                    out_start;
    wire                    out_stop;
    wire [OutDataWidth-1:0] out_data;
    wire                    out_valid;
    wire                    out_error;
    reg                     out_ready;
    reg                     out_request;
    reg                     out_cancel;

    assign out_start   = `I_Start(   IS_OUT, image_out );
    assign out_stop    = `I_Stop(    IS_OUT, image_out );
    assign out_data    = `I_Data(    IS_OUT, image_out );
    assign out_error   = `I_Error(   IS_OUT, image_out );
    assign out_valid   = `I_Valid(   IS_OUT, image_out );
    assign `I_Request( IS_OUT, image_out ) = out_request;
    assign `I_Cancel(  IS_OUT, image_out ) = out_cancel;
    assign `I_Ready(   IS_OUT, image_out ) = out_ready;

    //
    // Image Debayer
    //

    image_debayer #(
            .InIS( IS_IN ),
            .OutIS( IS_OUT )
    ) idebayer (
            .clock( clock ),
            .reset( reset ),

            .image_in( image_in ),
            .image_out( image_out )
        );

    task test_init;
        begin
            in_start = 0;
            in_stop = 0;
            in_data = 0;
            in_valid = 0;
            in_error = 0;
            out_ready = 1;
            out_request = 0;
            out_cancel = 0;
        end
    endtask

    task test_idle;
        begin
            `Info( "        Checking Idle" );
            `Assert( !in_request, "Idle - no request" );
            `Assert( !in_cancel, "Idle - no cancel" );
            `Assert( !out_start, "Idle - no start" );
            `Assert( !out_stop, "Idle - no stop" );
            `Assert( !out_valid, "Idle - no valid" );
        end
    endtask

    task test_control;
        begin
            `Info( "        Checking Control" );

            i_clock;

            `Assert( !in_request, "Pre Control - No Request" );
            `Assert( !in_cancel,  "Pre Control - No Cancel" );

            i_clock;

            out_request = 1;

            i_clock;

            `Assert( in_request, "Control - Request" );
            `Assert( !in_cancel, "Control - No Cancel" );

            out_request = 0;

            i_clock;

            `Assert( !in_request, "Control - No Request" );
            `Assert( !in_cancel,  "Control - No Cancel" );

            i_clock;

            out_cancel = 1;

            i_clock;

            `Assert( !in_request, "Control - No Request" );
            `Assert( in_cancel,   "Control - Cancel" );

            out_cancel = 0;

            i_clock;

            `Assert( !in_request, "Control - No Request" );
            `Assert( !in_cancel,  "Control - No Cancel" );
        end
    endtask

    integer count;
    integer count_limit;
    integer out_i;
    integer data_check;

    task test_non_start_blocking;
        begin
            `Info( "        Testing Non Start Blocking" );

            count = 0;
            while ( count < 10 ) begin

                in_data = 1;
                in_valid = 1;

                `Assert( !out_valid, "No characters without a start" );
                count = count + 1;

                i_clock;
            end

            in_data = 0;
            in_valid = 0;

            i_clock;

        end
    endtask


    task test_throughput( input reg in_pauses, input reg out_pauses );
        begin
            `InfoDo $display( "        Checking Throughput (In Pauses %d Out Pauses %d)", in_pauses, out_pauses );

            i_clock;

            `Assert( !out_start,  "Control - No Start" );
            `Assert( !out_stop,   "Control - No Stop" );
            `Assert( !out_data,   "Control - No Data" );
            `Assert( !out_valid,  "Control - No Valid" );

            out_ready = 1;

            count = 0;
            while( count < InPixelCount ) begin

                `InfoDo $display( "            C%-0d", count );

                if ( in_pauses && ( count % 10 == 0 ) ) begin

                    in_valid = 0;
                    i_clock;
                    `Assert( ( !count || !out_valid ),  "In Pause - No Out Valid" );
                    i_clock;
                    `Assert( ( !count || !out_valid ),  "In Pause - No Out Valid" );
                    i_clock;
                    `Assert( ( !count || !out_valid ),  "In Pause - No Out Valid" );
                    i_clock;

                end

                in_start = ( count == 0 );
                in_stop = ( count == ( InPixelCount - 1 ) );
                in_data = count;
                in_valid = 1;

                while ( !in_ready )
                    i_clock;

                if ( out_pauses && ( count > 0 ) && ( count % 5 == 0 ) ) begin

                    out_ready = 0;
                    i_clock;
                    in_valid = 0;
                    // `Assert( !in_ready,  "Out Pause - No In Ready" );
                    `Assert( out_valid,  "Out Pause - Out Valid" );
                    i_clock;
                    `Assert( !in_ready,  "Out Pause - No In Ready" );
                    `Assert( out_valid,  "Out Pause - Out Valid" );
                    i_clock;
                    `Assert( !in_ready,  "Out Pause - No In Ready" );
                    `Assert( out_valid,  "Out Pause - Out Valid" );
                    i_clock;
                    out_ready = 1;
                    i_clock;
                    in_valid = 0;

                end else begin

                    i_clock;

                    `Assert( out_valid,  "Control - Valid" );

                end

                `AssertEqual( in_start, out_start,  "Control - Start" );
                `AssertEqual( in_stop,  out_stop,   "Control - Stop" );

                count = count + 1;

            end

            in_start = 0;
            in_stop = 0;
            in_valid = 0;

            i_clock;

            `Assert( !out_start,  "Control - No Start" );
            `Assert( !out_stop,   "Control - No Stop" );
            `Assert( !out_data,   "Control - No Data" );
            `Assert( !out_valid,  "Control - No Valid" );

        end
    endtask

    integer count_in;
    integer count_out;
    integer total_transfer;
    reg in_ready_latched;

    task test_throughput_interleaved( input reg in_pauses, input reg out_pauses );
        begin
            `InfoDo $display( "        Checking Interleaved Throughput (In Pauses %d Out Pauses %d)", in_pauses, out_pauses );

            i_clock;

            `Assert( !out_start,  "Control - No Start" );
            `Assert( !out_stop,   "Control - No Stop" );
            `Assert( !out_data,   "Control - No Data" );
            `Assert( !out_valid,  "Control - No Valid" );

            total_transfer = 10;

            count_in = 0;
            count_out = 0;

            count = 0;
            count_limit = 100;

            out_ready = 0;
            in_valid = 0;

            while ( ( count < count_limit ) && ( ( count_in < total_transfer ) || ( count_out < total_transfer ) ) ) begin

                in_ready_latched = in_ready;

                i_clock;

                if ( ( in_valid == 0 ) && ( count_in < total_transfer ) && ( ( count % 2 ) == 0 ) ) begin
                    in_valid = 1;
                    in_data = count_in;
                    in_start = ( count_in == 0 );
                    in_stop = ( count_in == total_transfer - 1 );
                end

                if (  in_ready_latched && in_valid ) begin
                    in_valid = 0;
                    in_data = 0;
                    in_start = 0;
                    in_stop = 0;
                    `InfoDo $display( "                C In %-0d", count_in );
                    count_in = count_in + 1;
                end

                if ( out_valid )
                    out_ready = ( ( count % 4 ) == 0 );

                if ( out_ready && out_valid ) begin
                    count_out = count_out + 1;
                    `InfoDo $display( "                            C Out C %-0d (%-0d)", out_data, count_out );
                end


                count = count + 1;

            end

            in_valid = 0;

            i_clock;
            i_clock;
            i_clock;

            `AssertEqual( count_in, total_transfer, "In" );
            `AssertEqual( count_out, total_transfer, "Out" );

            `Assert( !out_start,  "Control - No Start" );
            `Assert( !out_stop,   "Control - No Stop" );
            `Assert( !out_data,   "Control - No Data" );
            `Assert( !out_valid,  "Control - No Valid" );

        end
    endtask



    //
    // Complete Instance Tests
    //

    localparam [`IS_w-1:0] IS_BAYER_LG = `IS( 0, 0, 48, 48, 0, 1, `IS_FORMAT_BAYER, 10, 0, 0, 0, 0 );
    localparam [`IS_w-1:0] IS_BAYER_SM = `IS( 0, 0, 8, 8, 0, 1, `IS_FORMAT_BAYER, 10, 0, 0, 0, 0 );
    localparam [`IS_w-1:0] IS_RGB8     = `IS( 0, 0, 32, 32, 0, 1, `IS_FORMAT_RGB,    8, 8, 8, 0, 0 );

    image_debayer_instance #( .IS(IS_BAYER_SM) ) ib_bayer_sm( 2'H0 );
    image_debayer_instance #( .IS(IS_BAYER_LG) ) ib_bayer_lg( 2'H1 );

    initial begin
        $display( "Image Debayer Tests %s", `__FILE__ );

        `Info( "    Data Check" );

        `Info( "    Data In Spec" );
        `InfoDo $display( "        IS_IN                %x",  IS_IN );
        `InfoDo $display( "            IS_IN.X          %d", `IS_X( IS_IN ) );
        `InfoDo $display( "            IS_IN.Y          %d", `IS_Y( IS_IN ) );
        `InfoDo $display( "            IS_IN.Width      %d", `IS_WIDTH( IS_IN ) );
        `InfoDo $display( "            IS_IN.Height     %d", `IS_HEIGHT( IS_IN ) );
        `InfoDo $display( "            IS_IN.C0Width    %d", `IS_C0_WIDTH( IS_IN ) );
        `InfoDo $display( "            IS_IN.C1Width    %d", `IS_C1_WIDTH( IS_IN ) );
        `InfoDo $display( "            IS_IN.C2Width    %d", `IS_C2_WIDTH( IS_IN ) );
        `InfoDo $display( "            IS_IN.AlphaWidth %d", `IS_ALPHA_WIDTH( IS_IN ) );
        `InfoDo $display( "            IS_IN.ZWidth     %d", `IS_Z_WIDTH( IS_IN ) );
        `InfoDo $display( "            IS_IN.DataWidth  %d", `IS_DATA_WIDTH( IS_IN ) );
        `InfoDo $display( "            IS_IN.PixelCount %d", `IS_PIXEL_COUNT( IS_IN ) );

        `Info( "    Data Out Spec" );
        `InfoDo $display( "        IS_OUT                %x",  IS_OUT );
        `InfoDo $display( "            IS_OUT.X          %d", `IS_X( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.Y          %d", `IS_Y( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.Width      %d", `IS_WIDTH( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.Height     %d", `IS_HEIGHT( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.C0Width    %d", `IS_C0_WIDTH( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.C1Width    %d", `IS_C1_WIDTH( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.C2Width    %d", `IS_C2_WIDTH( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.AlphaWidth %d", `IS_ALPHA_WIDTH( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.ZWidth     %d", `IS_Z_WIDTH( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.DataWidth  %d", `IS_DATA_WIDTH( IS_OUT ) );
        `InfoDo $display( "            IS_OUT.PixelCount %d", `IS_PIXEL_COUNT( IS_OUT ) );

        i_clock;
        i_reset;
        i_clock;

        test_init;
        test_idle;
/*
        test_control;

        test_non_start_blocking;

        i_clock;
        i_clock;
        i_clock;
        i_clock;

        test_throughput( 0, 0 );

        i_clock;
        i_clock;
        i_clock;
        i_clock;

        test_throughput( 1, 0 );

        i_clock;
        i_clock;
        i_clock;
        i_clock;

        test_throughput( 0, 1 );

        i_clock;
        i_clock;
        i_clock;
        i_clock;

        test_throughput( 1, 1 );
*/
        i_clock;
        i_clock;
        i_clock;
        i_clock;

        test_throughput_interleaved( 0, 0 );

        i_clock;
        i_clock;
        i_clock;
        i_clock;
/*
        i_clock;
        i_clock;
        i_clock;
        i_clock;

        `Info( "    Instanced Checks" );

        ib_bayer_lg.test_init;
        ib_bayer_sm.test_init;

        `Info( "    Spec Check" );
        `InfoDo $display( "        IS                %x",  IS_BAYER_SM );
        `InfoDo $display( "            IS.X          %d", `IS_X( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.Y          %d", `IS_Y( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.Width      %d", `IS_WIDTH( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.Height     %d", `IS_HEIGHT( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.C0Width    %d", `IS_C0_WIDTH( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.C1Width    %d", `IS_C1_WIDTH( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.C2Width    %d", `IS_C2_WIDTH( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.AlphaWidth %d", `IS_ALPHA_WIDTH( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.ZWidth     %d", `IS_Z_WIDTH( IS_BAYER_SM ) );
        `InfoDo $display( "            IS.DataWidth  %d", `IS_DATA_WIDTH( IS_BAYER_SM ) );

        `Info( "    Checking IB BAYER SM" );

        ib_bayer_sm.test_initial_state( AssertErrorCount, AssertTestCount);

        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;

        ib_bayer_sm.out_frame_mono( 1 );

        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;

        ib_bayer_sm.test_background( AssertErrorCount, AssertTestCount );

        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;

        ib_bayer_sm.out_frame_rgb( 1 );

        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;
        ib_bayer_sm.i_clock;


        `Info( "    Checking IB BAYER LG" );

        `Info( "    Spec Check" );
        `InfoDo $display( "        IS                %x", IS_BAYER_LG );
        `InfoDo $display( "            IS.X          %d", `IS_X( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.Y          %d", `IS_Y( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.Width      %d", `IS_WIDTH( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.Height     %d", `IS_HEIGHT( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.C0Width    %d", `IS_C0_WIDTH( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.C1Width    %d", `IS_C1_WIDTH( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.C2Width    %d", `IS_C2_WIDTH( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.AlphaWidth %d", `IS_ALPHA_WIDTH( IS_BAYER_LG ) );
        `InfoDo $display( "            IS.ZWidth     %d", `IS_Z_WIDTH( IS_BAYER_LG ) );

        ib_bayer_lg.out_frame_mono( 1 );

        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;

        ib_bayer_lg.test_background( AssertErrorCount, AssertTestCount );

        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;

        ib_bayer_lg.out_frame_rgb( 1 );

        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
        ib_bayer_lg.i_clock;
*/
        `AssertSummary

        $finish;
    end

endmodule

