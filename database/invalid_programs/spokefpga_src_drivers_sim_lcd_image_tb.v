/*

LCD Controller Testbench - Testing LCD Controller

Overview

    Instanciates an Image Background to provide the image, LCD Image, an LCD module and an LCD_proxy
    and hooks them all up.

    Testing is conducted by sending the lcd controller instructions, results confirmed at the proxy

    As an additional tool, the contents of the LCD proxy frame buffer can be dumped to the console.

See Also

    lcd
    lcd_proxy

Issues

    Doesn't test STARVE situations (i.e. where there is no in_valid data)

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../pipe/rtl/pipe_defs.v"

// `include "../../image/rtl/image_defs.v"
    `include "../../image/rtl/image_defs.v"

module lcd_image_tb();

    parameter Output=`OutputDebug;

    localparam LcdWidth = 32;
    localparam LcdHeight = 16;
    localparam LcdCoordinateWidth = 9;
    localparam LcdPixelWidth = 16;
    localparam LcdPixelRedWidth = 5;
    localparam LcdPixelGreenWidth = 6;
    localparam LcdPixelBlueWidth = 5;
    localparam LcdCommandWidth = 3;
    localparam LcdDataWidth = 18;
    localparam LcdConfigureTimerCount = 2;
    localparam LcdCommandDataTimerCount = 2;
    localparam LcdDelayTimerCount = 100;

    reg  reset;

    initial begin
        $dumpfile("lcd_image_tb.vcd");
        $dumpvars( 1, lcd_image_tb );
        $dumpvars( 1, lcd_image_tb.ib );
        $dumpvars( 1, lcd_image_tb.li );
        $dumpvars( 1, lcd_image_tb.li.l );
        $dumpvars( 1, lcd_image_tb.lp );
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    `AssertSetup

    // Panel Signals
    wire [LcdDataWidth-1:0] lcd_db;
    wire                 lcd_rd;
    wire                 lcd_wr;
    wire                 lcd_rs;
    wire                 lcd_cs;
    wire                 lcd_id;
    wire                 lcd_rst;
    wire                 lcd_fmark;
    wire                 lcd_blen;

    `include "../../drivers/rtl/lcd_defs.v"

    // LCD Command
    wire                 lcd_configuring;
    wire                 lcd_running;
    wire                 lcd_busy;

    //
    // Control
    //

    reg refresh;

    //
    // Image Background
    //

    localparam [`IS_w-1:0] BackgroundIS = `IS( 2, 2, 4, 4, 0, 1, `IS_FORMAT_RGB, LcdPixelRedWidth, LcdPixelGreenWidth, LcdPixelBlueWidth, 0, 0 );

    wire [`I_w(BackgroundIS)-1:0 ] image_background2controller;
    reg                            background_out_request_external;

    wire background_out_sending;

    localparam Data0Width =   `IS_DATA_WIDTH( BackgroundIS );
    reg [Data0Width-1:0]   color;


    image_background #(
            .IS( BackgroundIS )
        ) ib (
            .clock( clock ),
            .reset( reset ),

            .operation( 2'H0 ),
            //.color( `I_Data_Create( BackgroundIS, 31, 63, 31, 0, 0 ) ),
            .color( { 8'HFF, 8'HFF, 8'HFF } ),

            .out_request_external( background_out_request_external ),

            .image_out( image_background2controller ),

            .out_sending( background_out_sending )
        );

    //
    // LCD Image
    //

    lcd_image #(
            .IS( BackgroundIS ),

            .LcdWidth( LcdWidth ),
            .LcdHeight( LcdHeight ),
            .LcdCoordinateWidth( LcdCoordinateWidth ),
            .LcdCommandWidth( LcdCommandWidth ),
            .LcdPixelWidth( LcdPixelWidth ),
            .LcdCommandDataTimerCount( LcdCommandDataTimerCount ),
            .LcdDelayTimerCount( LcdDelayTimerCount )
        ) li (
            .clock( clock ),
            .reset( reset ),

            .configuring( lcd_configuring ),
            .running( lcd_running ),
            .busy( lcd_busy ),

            .image( image_background2controller ),

            .refresh( refresh ),

            // Connecting to the LCD(-proxy)
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

    reg  [LcdCoordinateWidth-1:0 ] lcd_out_x;
    reg  [LcdCoordinateWidth-1:0 ] lcd_out_y;
    wire [LcdPixelWidth-1:0 ]      lcd_out_p;

    wire [LcdDataWidth-1:0] lcd_out_data;
    wire                    lcd_out_dc;
    wire                    lcd_out_valid;

    lcd_proxy #(
            .Width( LcdWidth ),
            .Height( LcdHeight ),
            .CoordinateWidth( LcdCoordinateWidth ),
            .DataWidth( LcdDataWidth ),
            .PixelWidth( LcdPixelWidth ),
            .PixelRedWidth( LcdPixelRedWidth ),
            .PixelGreenWidth( LcdPixelGreenWidth ),
            .PixelBlueWidth( LcdPixelBlueWidth )
        ) lp (
            .clock( clock ),
            .reset( reset ),

            .lcd_db(lcd_db),
            .lcd_rd(lcd_rd),
            .lcd_wr(lcd_wr),
            .lcd_rs(lcd_rs),
            .lcd_cs(lcd_cs),
            .lcd_id(lcd_id),
            .lcd_rst(lcd_rst),
            .lcd_fmark(lcd_fmark),
            .lcd_blen(lcd_blen),

            .lcd_out_data( lcd_out_data ),
            .lcd_out_dc( lcd_out_dc ),
            .lcd_out_valid( lcd_out_valid ),

            .lcd_out_x( lcd_out_x ),
            .lcd_out_y( lcd_out_y ),
            .lcd_out_p( lcd_out_p )
    );

    integer i, j, k;
    integer c;
    integer timeout;
    integer count;

    reg [8*50:1] test_name;

    task lit_init;
        begin

            lcd_out_x = 0;
            lcd_out_y = 0;

            background_out_request_external = 0;

            refresh = 0;

        end
    endtask

    task  lit_clock;
        begin
            #2
            @( posedge clock );
            // `Info( "            Clock");
            #2
            ;
        end
    endtask

    task lit_clock_multiple( input integer  n );
        begin
            for ( i = 0; i < n; i = i + 1 ) begin
                lit_clock;
            end
        end
    endtask

    task  lit_reset;
        begin
            reset = 1;
            lit_clock;
            `Info( "    Reset");
            reset = 0;
            lit_clock;
        end
    endtask

    integer lcd_x;
    integer lcd_y;
    integer lcd_pixel_r;
    integer lcd_pixel_g;
    integer lcd_pixel_b;
    integer lcd_pixel_total;

    localparam lcd_pixel_max_total = ( (2**LcdPixelRedWidth) + (2**LcdPixelGreenWidth) + (2**LcdPixelBlueWidth) - 3 );

    function [2:0] lit_brightness( input reg[ LcdPixelWidth-1:0 ] pixel ); begin
            lcd_pixel_r = ( pixel >> ( LcdPixelBlueWidth + LcdPixelGreenWidth ) ) & ( (2**LcdPixelRedWidth)-1);
            lcd_pixel_g = ( pixel >> ( LcdPixelBlueWidth ) ) & ( (2**LcdPixelGreenWidth)-1);
            lcd_pixel_b = ( pixel ) & ( (2**LcdPixelBlueWidth)-1);
            lcd_pixel_total = lcd_pixel_r + lcd_pixel_g + lcd_pixel_b;

            // lit_brightness = ( lcd_pixel_total == 0 ) ? 0 : 1;

            lit_brightness = ( lcd_pixel_total == 0 ) ? 0 :
                                  ( ( lcd_pixel_total <= ( lcd_pixel_max_total / 4 ) ? 1 :
                                       ( lcd_pixel_total <= ( lcd_pixel_max_total / 2 ) ? 2 : 3 ) ) );

            // $display( "        Brightness %x -> %x %x %x -> %x", pixel, lcd_pixel_r, lcd_pixel_g, lcd_pixel_b, lit_brightness );

        end
    endfunction

    function [LcdPixelWidth-1:0] pixel( input reg [7:0] r, input reg [7:0] g, input reg [7:0] b );
        begin
            pixel = { 2'H0, r[7:3], g[7:2], b[7:3] };
            // $display( "    Pixel %x %x %x -> %x", r, g, b, pixel );
        end
    endfunction

    integer b;

    task lit_frame( input reg full );
        begin
            // Top of the frame
            $write( "        /" );
            for ( lcd_x = 0; lcd_x < LcdWidth; lcd_x = lcd_x + 1 ) begin
                $write( "--" );
                if ( !full && ( lcd_x == LcdWidth / 8 ) ) begin
                    $write( "..." );
                    lcd_x = 15 * LcdWidth / 16;
                end
            end
            $write( "\\\n" );

            for ( lcd_y = 0; lcd_y < LcdHeight; lcd_y = lcd_y + 1 ) begin
                $write( "        |" );
                // $display( "        %3d", lcd_y );
                for ( lcd_x = 0; lcd_x < LcdWidth; lcd_x = lcd_x + 1 ) begin
                    lcd_out_x = lcd_x;
                    lcd_out_y = lcd_y;

                    #1 // lit_clock;

                    b = lit_brightness( lcd_out_p );
                    // $display( "            %3d    %3x", lcd_x, lcd_out_data );
                    $write( "%s", ( b == 0 ) ? "  " : ( ( b == 1 ) ? ". " : ( ( b == 2 ) ? ".." : "oo" ) ) );
                    if ( !full && ( lcd_x == LcdWidth / 8 ) ) begin
                        $write( "..." );
                        lcd_x = 15 * LcdWidth / 16;
                    end
                end
                $write( "|\n" );
                if ( !full && ( lcd_y == LcdHeight / 8 ) ) begin
                    $write( "        ...\n" );
                    lcd_y = 15 * LcdHeight / 16;
                end
            end

            // Bottom of the frame
            $write( "        \\" );
            for ( lcd_x = 0; lcd_x < LcdWidth; lcd_x = lcd_x + 1 ) begin
                $write( "--" );
                if ( !full && ( lcd_x == LcdWidth / 8 ) ) begin
                    $write( "..." );
                    lcd_x = 15 * LcdWidth / 16;
                end
            end
            $write( "/\n" );

        end
    endtask

    task lit_check_pixel( input integer x, input integer y, input reg[LcdPixelWidth-1:0] pixel );
        begin
            lcd_out_x = x;
            lcd_out_y = y;

            #1 // lit_clock;

            `InfoDo $display( "        Testing [%3d,%3d] = %x (%x)", x, y, pixel, lcd_out_p );

            `AssertEqual( lcd_out_p, pixel, "Pixel Must Match" );
        end
    endtask



    reg [LcdPixelWidth-1:0] wr_pixel;
    integer ready_count;

    function [LcdPixelWidth-1:0] calculate_pixel( input reg [LcdCoordinateWidth-1:0] x, input reg [LcdCoordinateWidth-1:0] y );
        begin
            calculate_pixel = { 2'H0, x + y, x + y, x + y };
            $display( "    Calculate Pixel [%x,%x] -> %x", x, y, calculate_pixel );
        end
    endfunction

    reg     lcd_wr_prev;
    reg     lcd_proxy_command;
    integer lcd_proxy_data;

    integer data_count;
    integer command_count;

    initial begin
        $display( "\nLCD Test %s", `__FILE__ );

        lit_init;
        lit_reset;

        lit_clock;
        lit_clock;

        `Info( "    Init" );

        lit_clock_multiple( 200 );

        // one
        while ( !lcd_configuring )
          lit_clock;

        `Info( "    Configuring" );

        // configuration
        while ( lcd_configuring )
          lit_clock;

        while ( !lcd_running )
          lit_clock;

        `Info( "    Running" );

        while ( lcd_busy )
          lit_clock;

        `Info( "    Idle" );

        lit_clock_multiple( 100 );

        `Info( "    Refresh" );
        refresh = 1;

        lit_clock;

        refresh = 0;

        while ( !lcd_busy )
          lit_clock;

        `Info( "    Image (approx 30s)" );

        // update
        count = 30000;
        c = 0;
        while ( lcd_busy && ( c < count ) ) begin
          lit_clock;
          c = c + 1;
        end

        `Assert( c < count, "Timeout!" );

        lit_clock_multiple( 10 );

        lit_frame( 1 );

        lit_clock_multiple( 100 );

        //
        // Again!
        //

        `Info( "    Refresh - again" );

        refresh = 1;

        lit_clock;

        refresh = 0;

        while ( !lcd_busy )
          lit_clock;

        `Info( "    Image (approx 30s)" );

        // update
        count = 20000;
        c = 0;
        while ( lcd_busy && ( c < count ) ) begin
          lit_clock;
          c = c + 1;
        end

        `Assert( c < count, "Timeout!" );

        lit_clock_multiple( 10 );

        lit_frame( 1 );

        lit_clock_multiple( 100 );

        `AssertSummary

        $finish;
    end

endmodule

