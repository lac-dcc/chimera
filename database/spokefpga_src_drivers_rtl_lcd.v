// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

`timescale 1ns / 100ps

/*

LCD panel

Overview

    LCD is designed for the Hackaday Badge 2019, 480 x 320.  16b / pixel.  Arranged as 5'Red, 6'Green, 5'Blue. It has a frame buffer.

    Basic operations are Write Rectangle and Read Rectangle.  Also there is Fill Rect.

    Display responds to commands, and reading and writing data.

Issues

    Should we convert the rectangle definitions X0 Y0, X1 Y1 to X, Y, W, H?  The latter seems more likely to be useful.

Use

    The module responds to a few commands (defined in lcd_defs.v)

        LCD_COMMAND_CONFIGURE - configures the panel - must be called before other commands will work
        LCD_COMMAND_FILL_RECT - puts a single color (fill_pixel) in the specified rectangle (rect_x0,rect_y0-rect_x1,rect_y1)
        LCD_COMMAND_WRITE_RECT - writes into the specified rectangle, pixels supplied to the rect_pixel_write port
        LCD_COMMAND_READ_RECT - reads pixels from a rectangle, pixels output to the rect_pixel_read_port

    Many of the parameters of the design are brought out as module parameters, however the default values work
    with the present hardware, so they can be left untouched.

Invocation

    localparam Width = 480;
    localparam Height = 320;
    localparam CoordinateWidth = 9;
    localparam DataWidth = 18;
    localparam PixelWidth = 16;
    localparam PixelRedWidth = 5;
    localparam PixelGreenWidth = 6;
    localparam PixelBlueWidth = 5;
    localparam DelayTimerCount = 10000;
    localparam CommandDataTimerCount = 2;
    localparam CommandWidth = 3;

    reg [ CommandWidth-1:0]   command;
    wire                      ready;

    reg [PixelWidth-1:0]      fill_pixel;

    reg [CoordinateWidth-1:0] rect_x0;
    reg [CoordinateWidth-1:0] rect_x1;
    reg [CoordinateWidth-1:0] rect_y0;
    reg [CoordinateWidth-1:0] rect_y1;

    reg [CoordinateWidth-1:0] pixel_x;
    reg [CoordinateWidth-1:0] pixel_y;

    reg [PixelWidth-1:0]      rect_pixel_write;
    reg                       rect_pixel_write_valid;
    wire                      rect_pixel_write_ready;
    wire [PixelWidth-1:0]     rect_pixel_read;
    wire                      rect_pixel_read_valid;
    reg                       rect_pixel_read_ready;

    lcd #(
            .Width( Width ),
            .Height( Height ),
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
            .clock( clock ),
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
            .lcd_blen(lcd_blen)
        );

Testing

    Tested in lcd_tb.v

    Tested on the Hackaday 2019 Badge (ECP5)

*/

`include "../../pipe/rtl/pipe_defs.v"

module lcd #(
        parameter Width = 480,
        parameter Height = 320,
        parameter CoordinateWidth = 9,
        parameter DataWidth = 18,
        parameter PixelWidth = 16,
        parameter PixelRedWidth = 5,
        parameter PixelGreenWidth = 6,
        parameter PixelBlueWidth = 5,
        parameter CommandWidth = 3,
        parameter CommandDataTimerCount = 2,
        parameter DelayTimerCount = 10000
    ) (
        input clock,
        input reset,

        // LCD Control
        input [ CommandWidth-1:0]   command,
        input                       abort,

        input [PixelWidth-1:0]      fill_pixel,

        input [CoordinateWidth-1:0] rect_x0,
        input [CoordinateWidth-1:0] rect_x1,
        input [CoordinateWidth-1:0] rect_y0,
        input [CoordinateWidth-1:0] rect_y1,

        output [CoordinateWidth-1:0] pixel_x,
        output [CoordinateWidth-1:0] pixel_y,

        input [PixelWidth-1:0]      rect_pixel_write,
        input                       rect_pixel_write_valid,
        output                      rect_pixel_write_ready,

        output [PixelWidth-1:0]     rect_pixel_read,
        output                      rect_pixel_read_valid,
        input                       rect_pixel_read_ready,

        // LCD Status
        output ready,

        //LCD interface
        output reg[DataWidth-1:0] lcd_db,
        output reg[0:0]           lcd_rd,
        output reg[0:0]           lcd_wr,
        output reg[0:0]           lcd_rs,
        output                    lcd_cs,
        input                     lcd_id,
        output                    lcd_rst,
        input                     lcd_fmark,
        output                    lcd_blen,

        output [7:0] debug
    );

    `include "../../drivers/rtl/lcd_defs.v"

    localparam ConfigurationValueWidth = 8;

    localparam LCD_COMMAND = 0;
    localparam LCD_DATA = 1;

    // we watch for this, then have a LONG snooze
    localparam LCD_COMMAND_CODE_START      = 8'H11;
    localparam LCD_COMMAND_CODE_SET_COLUMN_ADDRESS = 8'H2A;
    localparam LCD_COMMAND_CODE_SET_PAGE_ADDRESS   = 8'H2B;
    localparam LCD_COMMAND_CODE_WRITE_MEMORY_START = 8'H2C;

    localparam LCD_STATE_IDLE                = 0,
               LCD_STATE_CONFIGURE           = 1,
               LCD_STATE_READY               = 2,
               LCD_STATE_SET_X_RANGE         = 3,
               LCD_STATE_SET_X_RANGE_COMMAND = 4,
               LCD_STATE_SET_X_RANGE_X0_M    = 5,
               LCD_STATE_SET_X_RANGE_X0_L    = 6,
               LCD_STATE_SET_X_RANGE_X1_M    = 7,
               LCD_STATE_SET_X_RANGE_X1_L    = 8,
               LCD_STATE_SET_Y_RANGE         = 9,
               LCD_STATE_SET_Y_RANGE_COMMAND = 10,
               LCD_STATE_SET_Y_RANGE_Y0_M    = 11,
               LCD_STATE_SET_Y_RANGE_Y0_L    = 12,
               LCD_STATE_SET_Y_RANGE_Y1_M    = 13,
               LCD_STATE_SET_Y_RANGE_Y1_L    = 14,
               LCD_STATE_FILL_RECT           = 15,
               LCD_STATE_FILL_RECT_LOOP      = 16,
               LCD_STATE_READ_RECT           = 17,
               LCD_STATE_WRITE_RECT          = 18,
               LCD_STATE_WRITE_RECT_LOOP     = 19,
               LCD_STATE_WRITE_RECT_END_LOOP = 20;

    reg [4:0] lcd_state;

    reg lcd_ready;

    reg lcd_reset;
    reg lcd_back_light_enable;
    reg lcd_chip_select;

    reg lcd_configure_next;
    reg lcd_configure_restart;

    reg                               lcd_config_dc;
    reg [ConfigurationValueWidth-1:0] lcd_config_value;

    localparam TimerCount = DelayTimerCount;
    localparam TimerCountWidth = $clog2( TimerCount + 1 ) + 1;

    reg [TimerCountWidth:0] lcd_timer;
    wire lcd_timer_expired = lcd_timer[ TimerCountWidth ];

    reg       lcd_x_origin;
    reg       lcd_y_origin;
    reg       lcd_rectangle;

    reg [CommandWidth-1:0] lcd_command;

    reg [CoordinateWidth-1:0] lcd_x;
    reg [CoordinateWidth-1:0] lcd_y;

    reg [CoordinateWidth-1:0] lcd_stored_x0;
    reg [CoordinateWidth-1:0] lcd_stored_x1;
    reg [CoordinateWidth-1:0] lcd_stored_y0;
    reg [CoordinateWidth-1:0] lcd_stored_y1;

    reg lcd_rect_pixel_write_ready;

    reg lcd_rect_pixel_read;
    reg lcd_rect_pixel_read_valid;

    reg [PixelWidth-1:0] lcd_fill_pixel;

    reg lcd_stored_y_new;

    localparam LCD_IO_READ = 1,
               LCD_IO_WRITE = 0;

    localparam LCD_IO_DATA = 1,
               LCD_IO_COMMAND = 0;

    reg                 lcd_io_rw;
    reg                 lcd_io_dc;
    reg [DataWidth-1:0] lcd_io_data;

    reg lcd_io_tick;

    reg lcd_aborted;

    always @( posedge clock ) begin
        if ( reset ) begin
            lcd_state <= 0;
            lcd_reset <= 1;
            lcd_back_light_enable <= 0;
            lcd_chip_select <= 0;
            lcd_configure_next <= 0;
            lcd_configure_restart <= 1;
            lcd_stored_x0 <= -1;
            lcd_stored_x1 <= -1;
            lcd_stored_y0 <= -1;
            lcd_stored_y1 <= -1;
            lcd_ready <= 0;
            lcd_rectangle <= 0;
            lcd_x_origin <= 0;
            lcd_y_origin <= 0;
            lcd_x <= 0;
            lcd_y <= 0;
            lcd_command <= LCD_COMMAND_NONE;
            lcd_aborted <= 0;
            lcd_stored_y_new <= 0;
            lcd_io_tick <= 0;
            lcd_io_rw <= LCD_IO_READ;
            lcd_io_dc <= LCD_IO_COMMAND;
            lcd_io_data <= 0;
            lcd_rect_pixel_write_ready <= 0;

            lcd_rect_pixel_read <= 0;
            lcd_rect_pixel_read_valid <= 0;

        end else begin
            // capture any abort requests, no matter when they might occur.  Clear upon return to READY
            // This means we can check for an abort at fewer places.
            if ( lcd_state == LCD_STATE_READY) begin
                lcd_aborted <= 0;
            end else begin
                if ( abort )
                    lcd_aborted <= 0;
            end
            case ( lcd_state )
                LCD_STATE_IDLE: begin
                        if ( command == LCD_COMMAND_CONFIGURE ) begin
                            lcd_reset <= 0;
                            lcd_chip_select <= 1;
                            lcd_back_light_enable <= 1;
                            lcd_state <= LCD_STATE_CONFIGURE;
                            lcd_configure_restart <= 0;
                            lcd_timer <= DelayTimerCount;
                        end
                    end
                LCD_STATE_CONFIGURE: begin
                        if ( lcd_timer_expired ) begin
                            if ( lcd_io_tick == lcd_io_tock )
                                if ( ( lcd_config_dc == LCD_COMMAND ) && (lcd_config_value==0)) begin
                                    lcd_configure_next <= 0;
                                    lcd_ready <= 1;
                                    lcd_state <= LCD_STATE_READY;
                                end else begin
                                    lcd_io_tick <= ~lcd_io_tick;
                                    lcd_configure_next <= 1;
                                    lcd_io_dc <= lcd_config_dc;
                                    lcd_io_data <= { 10'H0, lcd_config_value };
                                    lcd_io_rw <= LCD_IO_WRITE;
                                    // If it was START, need to take a break
                                    if ( ( lcd_config_dc == LCD_COMMAND ) && ( lcd_config_value == LCD_COMMAND_CODE_START ) ) begin
                                        lcd_timer <= DelayTimerCount;
                                end
                            end else begin
                                lcd_configure_next <= 0;
                            end
                        end else begin
                                lcd_timer <= lcd_timer - 1'H1;
                                lcd_configure_next <= 0;
                            end
                    end
                LCD_STATE_READY: begin
                        // don't mess with the IO registers, an IO operation might still be running
                        // don't even start an operation if the abort line is up
                        if ( ~abort ) begin
                            case ( command )
                                LCD_COMMAND_CONFIGURE: begin
                                        lcd_ready <= 0;
                                        lcd_state <= LCD_STATE_CONFIGURE;
                                        lcd_timer <= DelayTimerCount;
                                    end
                                LCD_COMMAND_FILL_RECT,
                                LCD_COMMAND_READ_RECT,
                                LCD_COMMAND_WRITE_RECT: begin
                                        // all of these require a rectangle to be specified
                                        lcd_command <= command;
                                        lcd_ready <= 0;
                                        if ( command == LCD_COMMAND_FILL_RECT )
                                            lcd_fill_pixel <= fill_pixel;
                                        if ( ( rect_y0 != lcd_stored_y0 ) || ( rect_y1 != lcd_stored_y1 ) ) begin
                                            // new Y!  save that fact in case we need to do X first
                                            lcd_stored_y0 <= rect_y0;
                                            lcd_stored_y1 <= rect_y1;
                                            lcd_stored_y_new <= 1;
                                        end
                                        if ( ( rect_x0 != lcd_stored_x0 ) || ( rect_x1 != lcd_stored_x1 ) ) begin
                                            // new X!  save the values and get set to write the address
                                            lcd_stored_x0 <= rect_x0;
                                            lcd_stored_x1 <= rect_x1;
                                            lcd_state <= LCD_STATE_SET_X_RANGE;
                                        end else begin
                                            if ( ( rect_y0 != lcd_stored_y0 ) || ( rect_y1 != lcd_stored_y1 ) ) begin
                                                // new Y (but not a new X)
                                                lcd_state <= LCD_STATE_SET_Y_RANGE;
                                            end else begin
                                                // same bounds as last time, just do the operation
                                                case ( command )
                                                    LCD_COMMAND_FILL_RECT:
                                                        lcd_state <= LCD_STATE_FILL_RECT;
                                                    LCD_COMMAND_READ_RECT:
                                                        lcd_state <= LCD_STATE_READ_RECT;
                                                    LCD_COMMAND_WRITE_RECT:
                                                        lcd_state <= LCD_STATE_WRITE_RECT;
                                                endcase
                                            end
                                        end
                                    end
                                default: begin
                                    end
                            endcase
                        end
                    end
                LCD_STATE_SET_X_RANGE: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_dc <= LCD_IO_COMMAND;
                            lcd_io_rw <= LCD_IO_WRITE;
                            lcd_io_data <= { 10'H0, LCD_COMMAND_CODE_SET_COLUMN_ADDRESS };
                            lcd_state <= LCD_STATE_SET_X_RANGE_COMMAND;
                        end
                    end
                LCD_STATE_SET_X_RANGE_COMMAND: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_dc <= LCD_IO_DATA;
                            lcd_io_data <= { 17'H0, lcd_stored_x0[CoordinateWidth-1:8] };
                            lcd_state <= LCD_STATE_SET_X_RANGE_X0_M;
                        end
                    end
                LCD_STATE_SET_X_RANGE_X0_M: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_data <= { 10'H0, lcd_stored_x0[7:0] };
                            lcd_state <= LCD_STATE_SET_X_RANGE_X0_L;
                        end
                    end
                LCD_STATE_SET_X_RANGE_X0_L: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_data <= { 17'H0, lcd_stored_x1[CoordinateWidth-1:8] };
                            lcd_state <= LCD_STATE_SET_X_RANGE_X1_M;
                        end
                    end
                LCD_STATE_SET_X_RANGE_X1_M: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_data <= { 10'H0, lcd_stored_x1[7:0] };
                            lcd_state <= LCD_STATE_SET_X_RANGE_X1_L;
                        end
                    end
                LCD_STATE_SET_X_RANGE_X1_L: begin
                        if ( lcd_stored_y_new ) begin
                            lcd_state <= LCD_STATE_SET_Y_RANGE;
                        end else begin
                            case ( lcd_command )
                                LCD_COMMAND_FILL_RECT:
                                    lcd_state <= LCD_STATE_FILL_RECT;
                                LCD_COMMAND_READ_RECT:
                                    lcd_state <= LCD_STATE_READ_RECT;
                                LCD_COMMAND_WRITE_RECT:
                                    lcd_state <= LCD_STATE_WRITE_RECT;
                                default:
                                    lcd_state <= LCD_STATE_READY;
                            endcase
                        end
                    end
                LCD_STATE_SET_Y_RANGE: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_dc <= LCD_IO_COMMAND;
                            lcd_io_rw <= LCD_IO_WRITE;
                            lcd_io_data <= { 10'H0, LCD_COMMAND_CODE_SET_PAGE_ADDRESS };
                            lcd_state <= LCD_STATE_SET_Y_RANGE_COMMAND;
                        end
                    end
                LCD_STATE_SET_Y_RANGE_COMMAND: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_dc <= LCD_IO_DATA;
                            lcd_io_data <= { 17'H0, lcd_stored_y0[CoordinateWidth-1:8] };
                            lcd_state <= LCD_STATE_SET_Y_RANGE_Y0_M;
                        end
                    end
                LCD_STATE_SET_Y_RANGE_Y0_M: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_data <= { 10'H0, lcd_stored_y0[7:0] };
                            lcd_state <= LCD_STATE_SET_Y_RANGE_Y0_L;
                        end
                    end
                LCD_STATE_SET_Y_RANGE_Y0_L: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_data <= { 17'H0, lcd_stored_y1[CoordinateWidth-1:8] };
                            lcd_state <= LCD_STATE_SET_Y_RANGE_Y1_M;
                        end
                    end
                LCD_STATE_SET_Y_RANGE_Y1_M: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            lcd_io_tick <= !lcd_io_tick;
                            lcd_io_data <= { 10'H0, lcd_stored_y1[7:0] };
                            lcd_state <= LCD_STATE_SET_Y_RANGE_Y1_L;
                        end
                    end
                LCD_STATE_SET_Y_RANGE_Y1_L: begin
                        case ( lcd_command )
                            LCD_COMMAND_FILL_RECT:
                                lcd_state <= LCD_STATE_FILL_RECT;
                            LCD_COMMAND_READ_RECT:
                                lcd_state <= LCD_STATE_READ_RECT;
                            LCD_COMMAND_WRITE_RECT:
                                lcd_state <= LCD_STATE_WRITE_RECT;
                            default:
                                lcd_state <= LCD_STATE_READY;
                        endcase
                    end
                LCD_STATE_FILL_RECT: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            if ( !lcd_aborted && !abort ) begin
                                lcd_io_tick <= !lcd_io_tick;
                                lcd_io_dc <= LCD_IO_COMMAND;
                                lcd_io_rw <= LCD_IO_WRITE;
                                lcd_io_data <= { 10'H0, LCD_COMMAND_CODE_WRITE_MEMORY_START };
                                lcd_x <= lcd_stored_x0;
                                lcd_y <= lcd_stored_y0;
                                lcd_x_origin <= 1;
                                lcd_y_origin <= 1;
                                lcd_state <= LCD_STATE_FILL_RECT_LOOP;
                            end else begin
                                // clean up good...
                                lcd_state <= LCD_STATE_WRITE_RECT_END_LOOP;
                            end
                        end
                    end
                LCD_STATE_FILL_RECT_LOOP: begin
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            if ( !lcd_aborted && !abort ) begin
                                lcd_io_tick <= !lcd_io_tick;
                                lcd_io_data <= { 2'H0, lcd_fill_pixel };
                                lcd_io_dc <= LCD_IO_DATA;
                                if ( ( lcd_x == lcd_stored_x1 ) ) begin
                                    lcd_x <= lcd_stored_x0;
                                    lcd_x_origin <= 1;
                                    if ( ( lcd_y == lcd_stored_y1 ) ) begin
                                        lcd_state <= LCD_STATE_READY;
                                        lcd_y <= lcd_stored_y0;
                                        lcd_y_origin <= 1;
                                        lcd_ready <= 1;
                                    end else begin
                                        lcd_y <= lcd_y + 1;
                                    end
                                end else begin
                                    lcd_y_origin <= 0;
                                    lcd_x_origin <= 0;
                                    lcd_x <= lcd_x + 1;
                                end
                            end else begin
                                // clean up good...
                                lcd_state <= LCD_STATE_WRITE_RECT_END_LOOP;
                            end
                        end
                    end
                LCD_STATE_READ_RECT: begin
                        lcd_state <= LCD_STATE_READY;
                    end
                LCD_STATE_WRITE_RECT: begin
                        // seem familiar?  some dupe here..
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            if ( !lcd_aborted && !abort ) begin
                                lcd_io_tick <= !lcd_io_tick;
                                lcd_io_dc <= LCD_IO_COMMAND;
                                lcd_io_rw <= LCD_IO_WRITE;
                                lcd_io_data <= { 10'H0, LCD_COMMAND_CODE_WRITE_MEMORY_START };
                                lcd_x <= lcd_stored_x0;
                                lcd_y <= lcd_stored_y0;
                                lcd_x_origin <= 1;
                                lcd_y_origin <= 1;
                                lcd_state <= LCD_STATE_WRITE_RECT_LOOP;
                            end else begin
                                lcd_state <= LCD_STATE_WRITE_RECT_END_LOOP;
                            end
                        end else begin
                            lcd_rect_pixel_write_ready <= 0;
                        end
                    end
                LCD_STATE_WRITE_RECT_LOOP: begin // 19
                        if ( lcd_io_tick == lcd_io_tock ) begin
                            if ( !lcd_aborted && !abort ) begin
                                if ( lcd_rect_pixel_write_ready && rect_pixel_write_valid ) begin
                                    lcd_rect_pixel_write_ready <= 0;
                                    lcd_io_dc <= LCD_IO_DATA;
                                    lcd_io_tick <= !lcd_io_tick;
                                    lcd_io_data <= { 2'H0, rect_pixel_write};
                                    if ( ( lcd_x == lcd_stored_x1 ) ) begin
                                        if ( ( lcd_y == lcd_stored_y1 ) ) begin
                                            lcd_state <= LCD_STATE_WRITE_RECT_END_LOOP;
                                        end else begin
                                            lcd_x <= lcd_stored_x0;
                                            lcd_x_origin <= 1;
                                            lcd_y <= lcd_y + 1;
                                        end
                                    end else begin
                                        lcd_y_origin <= 0;
                                        lcd_x_origin <= 0;
                                        lcd_x <= lcd_x + 1;
                                    end
                                end else begin
                                    lcd_rect_pixel_write_ready <= 1;
                                end
                            end else begin
                                lcd_state <= LCD_STATE_WRITE_RECT_END_LOOP;
                            end
                        end
                    end
                LCD_STATE_WRITE_RECT_END_LOOP: begin
                    if ( lcd_io_tick == lcd_io_tock )
                        lcd_x <= 0;
                        lcd_y <= 0;
                        lcd_x_origin <= 0;
                        lcd_y_origin <= 0;
                        lcd_ready <= 1;
                        lcd_state <= LCD_STATE_READY;
                    end
            endcase

        end
    end

    assign lcd_blen = lcd_back_light_enable;
    assign lcd_cs = ~lcd_chip_select;
    assign lcd_rst = ~lcd_reset;

    assign ready = lcd_ready;

    assign pixel_x = ( ~lcd_ready ) ? lcd_x : 0;
    assign pixel_y = ( ~lcd_ready ) ? lcd_y : 0;

    assign rect_pixel_write_ready = lcd_rect_pixel_write_ready;

    assign rect_pixel_read = lcd_rect_pixel_read;
    assign rect_pixel_read_valid = lcd_rect_pixel_read_valid;

    assign debug[7:0] = { 2'H0, lcd_io_state[0], lcd_rs, lcd_rectangle, lcd_y_origin, lcd_x_origin, lcd_wr };

    //
    // IO State Machine
    //

    localparam LCD_IO_STATE_IDLE = 0,
               LCD_IO_STATE_WORKING = 1;

    reg [1:0] lcd_io_state;
    reg lcd_io_tock;

    localparam IoTimerCountWidth = $clog2( CommandDataTimerCount + 1 ) + 1;

    reg [IoTimerCountWidth:0] lcd_io_timer;
    wire lcd_io_timer_expired = lcd_io_timer[ IoTimerCountWidth ];

    always @( posedge clock ) begin
        if ( reset ) begin
            lcd_io_tock <= 0;
            lcd_io_state <= LCD_IO_STATE_IDLE;
            lcd_io_timer <= CommandDataTimerCount;
            lcd_db <= 0;
            lcd_rs <= 0;
            lcd_wr <= 1;
            lcd_rd <= 1;
        end else begin
            case ( lcd_io_state )
                LCD_IO_STATE_IDLE: begin
                        if ( lcd_io_timer_expired ) begin
                            if ( lcd_io_tick != lcd_io_tock ) begin
                                if ( lcd_io_rw == LCD_IO_READ ) begin
                                    lcd_wr <= 1;
                                    lcd_rd <= 0;
                                end else begin
                                    lcd_wr <= 0;
                                    lcd_rd <= 1;
                                    lcd_rs <= lcd_io_dc;
                                    lcd_db <= lcd_io_data;
                                end
                                lcd_io_timer <= CommandDataTimerCount - 1'H1;
                                lcd_io_state <= LCD_IO_STATE_WORKING;
                            end
                        end else begin
                            lcd_io_timer <= lcd_io_timer - 1'H1;
                        end
                    end
                LCD_IO_STATE_WORKING: begin
                        if ( lcd_io_timer_expired ) begin
                            lcd_io_tock <= !lcd_io_tock;
                            lcd_wr <= 1;
                            lcd_rd <= 1;
                            if ( lcd_io_rw == LCD_IO_READ ) begin
                                // how to read?
                            end /*else begin
                                lcd_db <= 0;
                                lcd_rs <= 0;
                            end*/
                            lcd_io_timer <= CommandDataTimerCount - 1'H1;
                            lcd_io_state <= LCD_IO_STATE_IDLE;
                        end else begin
                            lcd_io_timer <= lcd_io_timer - 1'H1;
                        end
                    end
            endcase
        end
    end

    //
    // Configuration Memory
    //

    reg [7:0] lcd_config_index;

    always @( posedge clock ) begin
        if ( reset ) begin
            lcd_config_index <= 0;
        end else begin
            case ( lcd_config_index )
                 0:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF0 }; // ?
                 1:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H5A };
                 2:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H5A };
                 3:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF1 }; // ?
                 4:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H5A };
                 5:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H5A };
                 6:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF2 }; // ?
                 7:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H3B };
                 8:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H40 };
                 9:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H03 }; // Data
                10:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H04 }; // Data
                11:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H02 }; // Data
                12:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                13:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                14:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                15:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                16:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                17:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                18:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                19:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                20:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                21:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H40 }; // Data
                22:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                23:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                24:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                25:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                26:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF4 }; // Comm
                27:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                28:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                29:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                30:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                31:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                32:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                33:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                34:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                35:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                36:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H6d }; // Data
                37:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H03 }; // Data
                38:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                39:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H70 }; // Data
                40:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H03 }; // Data
                41:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF5 }; // Comm
                42:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                43:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H54 }; // Data//Set VCOMH
                44:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H73 }; // Data//Set VCOM Amplitude
                45:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                46:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                47:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H04 }; // Data
                48:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                49:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                50:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H04 }; // Data
                51:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                52:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H53 }; // Data
                53:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H71 }; // Data
                54:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF6 }; // Comm
                55:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H04 }; // Data
                56:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                57:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H08 }; // Data
                58:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H03 }; // Data
                59:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H01 }; // Data
                60:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                61:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H01 }; // Data
                62:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                63:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF7 }; // Comm
                64:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H48 }; // Data
                65:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H80 }; // Data
                66:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H10 }; // Data
                67:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H02 }; // Data
                68:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                69:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF8 }; // Comm
                70:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H11 }; // Data
                71:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                72:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HF9 }; // Comm //Gamma Selection
                73:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H27 }; // Data
                74:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'HFA }; // Comm //Positive Gamma Control
                75:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H0B }; // Data
                76:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H0B }; // Data
                77:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H0F }; // Data
                78:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H26 }; // Data
                79:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H2A }; // Data
                80:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H30 }; // Data
                81:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H33 }; // Data
                82:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H12 }; // Data
                83:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H1F }; // Data
                84:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H25 }; // Data
                85:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H31 }; // Data
                86:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H30 }; // Data
                87:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H24 }; // Data
                88:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                89:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                90:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H01 }; // Data
                91:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                92:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                93:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H01 }; // Data
                94:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H3F }; // Data
                95:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H36 }; // Comm Set Address Mode
                96:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'HA0 }; // Data (Top-Bottom, Left-Right, Col then Row)
                97:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H3A }; // Comm //SET 16bit Color
                98:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H55 }; // Data //55=16bit, 66=18bit, 77=24bit
                99:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H11 }; // Comm //	if (!nowait) Delay(120);
                100:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H29 }; // Comm//Display on

                // this is not going to be constant any more
                // 95:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H2a }; // Comm Set Column Address (SC:EC)
                // 96:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                // 97:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                // 98:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H01 }; // Data
                // 99:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'HDF }; // Data
                // 100:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H2b }; // Comm Set Page Address (SP,EP)
                // 101:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                // 102:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H00 }; // Data
                // 103:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H01 }; // Data
                // 104:{ lcd_config_dc, lcd_config_value } <= { 1'H1, 8'H3F }; // Data
                // 105:{ lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H2c }; // Comm //Write mem start

                default:
                    { lcd_config_dc, lcd_config_value } <= { 1'H0, 8'H00 };
            endcase
            if ( !lcd_configure_restart ) begin
                if ( lcd_configure_next )
                    if ( lcd_config_dc || ( lcd_config_value != 0 ) )
                        lcd_config_index <= lcd_config_index + 1;
            end else begin
                lcd_config_index <= 0;
            end
        end
    end

endmodule

