/*

LCD Testbench - Testing LCD Module

Overview

    Instanciates an LCD module and an LCD_proxy and hooks them up.

    Testing is conducted by sending the lcd module data, having it talk to the proxy as if it were talking
    to a real LCD, then interogating the lcd proxy to confirm everything went as planned.

    As an additional tool, the contents of the LCD proxy frame buffer can be dumped to the console.

See Also

    lcd
    lcd_proxy
    lcd_image

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../pipe/rtl/pipe_defs.v"

module lcd_tb();

    parameter Output=`OutputDebug;

    localparam ConfigureTimerCount = 2;
    localparam CommandDataTimerCount = 2;
    localparam DelayTimerCount = 100;
    localparam CoordinateWidth = 9;
    localparam CommandWidth = 3;
    localparam PixelWidth = 16;
    localparam PixelRedWidth = 5;
    localparam PixelGreenWidth = 6;
    localparam PixelBlueWidth = 5;
    localparam DataWidth = 18;
    localparam LcdWidth = 480;
    localparam LcdHeight = 320;

    reg  reset;

    initial begin
        $dumpfile("lcd_tb.vcd");
        $dumpvars( 1, lcd_tb );
        $dumpvars( 1, lcd_tb.l );
        $dumpvars( 1, lcd_tb.lp );
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    `AssertSetup

    // Panel Signals
    wire [DataWidth-1:0] lcd_db;
    wire                 lcd_rd;
    wire                 lcd_wr;
    wire                 lcd_rs;
    wire                 lcd_cs;
    wire                 lcd_id;
    wire                 lcd_rst;
    wire                 lcd_fmark;
    wire                 lcd_blen;

    `include "../rtl/lcd_defs.v"

    // LCD Command
    reg [ CommandWidth-1:0]   command;
    wire                       ready;

    reg [PixelWidth-1:0] fill_pixel;

    reg [CoordinateWidth-1:0] rect_x0;
    reg [CoordinateWidth-1:0] rect_x1;
    reg [CoordinateWidth-1:0] rect_y0;
    reg [CoordinateWidth-1:0] rect_y1;

    wire [CoordinateWidth-1:0] pixel_x;
    wire [CoordinateWidth-1:0] pixel_y;

    reg [PixelWidth-1:0]  rect_pixel_write;
    reg                   rect_pixel_write_valid;
    wire                  rect_pixel_write_ready;
    wire [PixelWidth-1:0] rect_pixel_read;
    wire                  rect_pixel_read_valid;
    reg                   rect_pixel_read_ready;

    lcd #(
            .Width( LcdWidth ),
            .Height( LcdHeight ),
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
            .clock( clock ),
            .reset( reset ),

            .command( command ),

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

            .ready( ready ),

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

    reg [ CoordinateWidth-1:0 ] lcd_out_x;
    reg [ CoordinateWidth-1:0 ] lcd_out_y;
    wire [PixelWidth-1:0 ]      lcd_out_p;

    wire [DataWidth-1:0] lcd_out_data;
    wire                 lcd_out_dc;
    wire                 lcd_out_valid;

    lcd_proxy #(
            .Width( LcdWidth ),
            .Height( LcdHeight ),
            .CoordinateWidth( CoordinateWidth ),
            .DataWidth( DataWidth ),
            .PixelWidth( PixelWidth ),
            .PixelRedWidth( PixelRedWidth ),
            .PixelGreenWidth( PixelGreenWidth ),
            .PixelBlueWidth( PixelBlueWidth )
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

    task lcdtb_init;
        begin
            command <= 0;

                // LCD Command
                command <= 0;
                fill_pixel <= 0;
                rect_x0 <= 0;
                rect_x1 <= 0;
                rect_y0 <= 0;
                rect_y1 <= 0;
                rect_pixel_write <= 0;
                rect_pixel_write_valid <= 0;
                rect_pixel_read_ready <= 0;

                lcd_out_x = 0;
                lcd_out_y = 0;
        end
    endtask

    task  lcdtb_clock;
        begin
            #2
            @( posedge clock );
            // `Info( "            Clock");
            #2
            ;
        end
    endtask

    task lcdtb_clock_multiple( input integer  n );
        begin
            for ( i = 0; i < n; i = i + 1 ) begin
                lcdtb_clock;
            end
        end
    endtask

    task  lcdtb_reset;
        begin
            reset = 1;
            lcdtb_clock;
            `Info( "    Reset");
            reset = 0;
            lcdtb_clock;
        end
    endtask

    integer lcd_x;
    integer lcd_y;
    integer lcd_pixel_r;
    integer lcd_pixel_g;
    integer lcd_pixel_b;
    integer lcd_pixel_total;

    localparam lcd_pixel_max_total = ( (2**PixelRedWidth) + (2**PixelGreenWidth) + (2**PixelBlueWidth) - 3 );

    function [2:0] lcdtb_brightness( input reg[ PixelWidth-1:0 ] pixel ); begin
            lcd_pixel_r = ( pixel >> ( PixelBlueWidth + PixelGreenWidth ) ) & ( (2**PixelRedWidth)-1);
            lcd_pixel_g = ( pixel >> ( PixelBlueWidth ) ) & ( (2**PixelGreenWidth)-1);
            lcd_pixel_b = ( pixel ) & ( (2**PixelBlueWidth)-1);
            lcd_pixel_total = lcd_pixel_r + lcd_pixel_g + lcd_pixel_b;

            // lcdtb_brightness = ( lcd_pixel_total == 0 ) ? 0 : 1;

            lcdtb_brightness = ( lcd_pixel_total == 0 ) ? 0 :
                                  ( ( lcd_pixel_total <= ( lcd_pixel_max_total / 4 ) ? 1 :
                                       ( lcd_pixel_total <= ( lcd_pixel_max_total / 2 ) ? 2 : 3 ) ) );

            // $display( "        Brightness %x -> %x %x %x -> %x", pixel, lcd_pixel_r, lcd_pixel_g, lcd_pixel_b, lcdtb_brightness );

        end
    endfunction

    function [PixelWidth-1:0] pixel( input reg [7:0] r, input reg [7:0] g, input reg [7:0] b );
        begin
            pixel = { 2'H0, r[7:3], g[7:2], b[7:3] };
            // $display( "    Pixel %x %x %x -> %x", r, g, b, pixel );
        end
    endfunction

    integer b;

    task lcdtb_frame( input reg full );
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

                    #1 // lcdtb_clock;

                    b = lcdtb_brightness( lcd_out_p );
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

    task lcdtb_check_pixel( input integer x, input integer y, input reg[PixelWidth-1:0] pixel );
        begin
            lcd_out_x = x;
            lcd_out_y = y;

            #1 // lcdtb_clock;

            `InfoDo $display( "        Testing [%3d,%3d] = %x (%x)", x, y, pixel, lcd_out_p );

            `AssertEqual( lcd_out_p, pixel, "Pixel Must Match" );
        end
    endtask

    task lcdtb_check_fill( input integer x0, input integer y0, input integer x1, input integer y1, input reg[PixelWidth-1:0] pixel );
        begin
            `InfoDo $display( "    Check Fill [%3d,%3d]-[%3d,%3d] <= %x", x0, y0, x1, y1, pixel );

            rect_x0 = x0;
            rect_y0 = y0;
            rect_x1 = x1;
            rect_y1 = y1;

            fill_pixel = pixel;

            command = LCD_COMMAND_FILL_RECT;

            lcdtb_clock;

            command = LCD_COMMAND_NONE;

            `Assert( ~ready, "LCD not ready" );

            data_count = 0;
            command_count = 0;
            count = (rect_x1-rect_x0 + 1)*(rect_y1-rect_y0 + 1);
            timeout = count * CommandDataTimerCount * 64;
            while ( ( ( data_count < ( count + 8 ) ) || ( command_count < 3 ) ) && ( i < timeout)  ) begin
                if ( lcd_out_valid ) begin
                    if ( lcd_out_dc ) begin
                        if ( data_count >= 8 ) begin
                            `AssertEqual( lcd_out_data, pixel, "Data" );
                        end
                        //`InfoDo $display( "                LCD Proxy Data %3x", lcd_out_data );
                        data_count = data_count + 1;
                    end else begin
                        //`InfoDo $display( "                LCD Proxy Command %3x", lcd_out_data );
                        command_count = command_count + 1;
                    end
                end
                lcdtb_clock;
                i = i + 1;
            end

            `AssertEqual( command_count, 3, "Must get three commands (col addr, page addr, write)" );
            `AssertEqual( data_count, count + 8, "X x Y + ( 8 addrs)" );

            `Assert( ready, "LCD ready" );

            //lcdtb_clock_multiple( 30 * 20 * 10 );

            lcdtb_check_pixel( rect_x0, rect_y0, fill_pixel );
            lcdtb_check_pixel( rect_x0, rect_y1, fill_pixel );
            lcdtb_check_pixel( rect_x1, rect_y0, fill_pixel );
            lcdtb_check_pixel( rect_x1, rect_y1, fill_pixel );

            lcdtb_check_pixel( ( rect_x0 + rect_x1) / 2, ( rect_y0 + rect_y1 ) / 2, fill_pixel );

        end
    endtask

    reg [PixelWidth-1:0] wr_pixel;
    integer ready_count;

    function [PixelWidth-1:0] calculate_pixel( input reg [CoordinateWidth-1:0] x, input reg [CoordinateWidth-1:0] y );
        begin
            calculate_pixel = { 2'H0, ( x + y + 1'H1 ) % 8'HF, ( x + y + 1'H1 ) % 8'HF, ( x + y + 1'H1 ) % 8'HF };
            // $display( "            Calculate Pixel [%x,%x] -> %x", x, y, calculate_pixel );
        end
    endfunction

    task lcdtb_check_write_rect( input integer x0, input integer y0, input integer x1, input integer y1 );
        begin
            `InfoDo $display( "    Check Write [%3d,%3d]-[%3d,%3d]", x0, y0, x1, y1 );

            rect_x0 = x0;
            rect_y0 = y0;
            rect_x1 = x1;
            rect_y1 = y1;

            command = LCD_COMMAND_WRITE_RECT;

            lcdtb_clock;

            command = LCD_COMMAND_NONE;

            rect_x0 = 0;
            rect_y0 = 0;
            rect_x1 = 0;
            rect_y1 = 0;

            `Assert( ~ready, "LCD not ready" );

            count = (x1-x0 + 1)*(y1-y0 + 1);
            data_count = 0;
            command_count = 0;
            ready_count = 0;
            i = 0;
            timeout = count * CommandDataTimerCount * 64;

            rect_pixel_write = calculate_pixel( 0, 0 );
            rect_pixel_write_valid = 1;

            // lcdtb_clock;

            while ( ( (ready_count < count ) || ( data_count < ( count + 8 ) ) || ( command_count < 3 ) ) && ( i < timeout)  ) begin
                if ( rect_pixel_write_ready ) begin
                    ready_count = ready_count + 1;
                end
                rect_pixel_write = calculate_pixel( pixel_x - x0, pixel_y - y0 );
                if ( lcd_out_valid ) begin
                    if ( lcd_out_dc ) begin
                        // `InfoDo $display( "                LCD Proxy Data %3x", lcd_out_data );
                        data_count = data_count + 1;
                    end else begin
                        // `InfoDo $display( "                LCD Proxy Command %3x", lcd_out_data );
                        command_count = command_count + 1;
                    end
                end
                lcdtb_clock;
                i = i + 1;
            end

            rect_pixel_write_valid = 0;
            lcdtb_clock;

            `AssertEqual( ready_count, count, "Must have a Valid signal for each pixel" );
            `AssertEqual( command_count, 3, "Must get three commands (col addr, page addr, write)" );
            `AssertEqual( data_count, count + 8, "X x Y + ( 8 addrs)" );
            `Assert( i < timeout, "Timeout" );

            `Assert( ready, "LCD ready" );

            //lcdtb_clock_multiple( 30 * 20 * 10 );

            lcdtb_check_pixel( x0, y0, calculate_pixel( 0, 0 ) );
            lcdtb_check_pixel( x0, y1, calculate_pixel( 0, y1 - y0 ) );
            lcdtb_check_pixel( x1, y0, calculate_pixel( x1 - x0, 0 ) );
            lcdtb_check_pixel( x1, y1, calculate_pixel( x1 - x0, y1 - y0) );

        end
    endtask

    reg     lcd_wr_prev;
    reg     lcd_proxy_command;
    integer lcd_proxy_data;

    integer data_count;
    integer command_count;

    initial begin
        $display( "\nLCD Test %s", `__FILE__ );

        lcdtb_init;
        lcdtb_reset;


        lcdtb_clock;
        lcdtb_clock;

        `Info( "    Checking Idle State" );

        `Assert( ~ready, "LCD not ready" );
        `Assert( ~lcd_rst, "LCD is in reset" );
        `Assert( lcd_cs, "LCD is not selected" );
        `Assert( ~lcd_blen, "LCD Backlight is off" );

        `Info( "    Requesting Configure" );

        command = LCD_COMMAND_CONFIGURE;

        lcdtb_clock;

        `Assert( ~ready, "LCD not ready" );

        `Assert( lcd_rst, "LCD no reset" );
        `Assert( ~lcd_cs, "LCD select" );
        `Assert( lcd_blen, "LCD Backlight" );

        command = LCD_COMMAND_NONE;

        i = 0;
        c = 0;
        lcd_wr_prev = 1;
        count = 101;
        timeout = CommandDataTimerCount * count * 10 + 2 * DelayTimerCount;
        while ( ( ~ready || (i < count ) ) && ( c < timeout ) )  begin
            c = c + 1;
            if ( !lcd_wr && lcd_wr_prev ) begin
                // `InfoDo $display( "        %3d D/C %x Value %4x", i, lcd_rs, lcd_db );
                i = i + 1;
            end
            // if ( lcd_out_valid ) begin
            //     if ( lcd_out_dc ) begin
            //         `InfoDo $display( "                 LCD Proxy Data %3x", lcd_out_data );
            //     end else begin
            //         `InfoDo $display( "                 LCD Proxy Command %3x", lcd_out_data );
            //     end
            // end
            lcd_wr_prev = lcd_wr;
            lcdtb_clock;
        end

        `Assert( c < timeout, "Timeout" );
        `Assert( i > 0 , "Data Written" );
        `AssertEqual( i, count, "Full Configure" );

        lcdtb_clock;
        lcdtb_clock_multiple( 100 );

        `Assert( ready, "LCD ready" );
        `Assert( lcd_rst, "LCD is not in reset" );
        `Assert( ~lcd_cs, "LCD is not selected" );
        `Assert( lcd_blen, "LCD Backlight is on" );
/*
*/
        lcdtb_check_fill( 0, 0, 5, 5, pixel( 4, 4, 4 ) );
        //lcdtb_check_fill( 15, 15, 40, 40, pixel( 8, 8, 8 ) );
        //lcdtb_check_fill( 25, 5, 60, 30, pixel( 127, 127, 127 ) );
        lcdtb_check_fill( 4, 2, 477, 2, pixel( 255, 255, 255 ) );
        lcdtb_check_fill( 2, 4, 2, 317, pixel( 127, 127, 127 ) );

        lcdtb_check_write_rect( 10, 10, 13, 13 );
        lcdtb_check_write_rect( 20, 20, 29, 29 );

        c = 0;
        count = 1000;
        while ( !ready && ( c < count ) ) begin
            lcdtb_clock;
            c = c + 1;
        end

        `Assert( ready, "Ready" );
        `Assert( c < count, "Timeout" );

        lcdtb_clock_multiple( 10 );

        lcdtb_frame( 0 );

        lcdtb_clock_multiple( 10 );
        `AssertSummary

        $finish;
    end

endmodule

