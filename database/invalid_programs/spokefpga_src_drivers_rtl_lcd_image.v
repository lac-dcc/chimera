`timescale 1ns / 100ps

/*

Lcd Image

Overview

    Lcd Control the Lcd modules, sending a single image to the LCD

Issues

    Should this module just wrap the lcd?  Is anything gained by forcing users to connect them
    at the higher level?

Use


Invocation

Instanciation Template

    localparam LcdWidth = 480;
    localparam LcdHeight = 320;
    localparam LcdPixelRedWidth = 5,
    localparam LcdPixelGreenWidth = 6,
    localparam LcdPixelBlueWidth = 5,
    localparam LcdCoordinateWidth = 9;
    localparam LcdDataWidth = 18;
    localparam LcdPixelWidth = 16;
    localparam LcdCommandWidth = 3;

    reg [ CommandWidth-1:0]   lcd_command;
    wire                      lcd_ready;

    reg [PixelWidth-1:0]      lcd_fill_pixel;

    reg [CoordinateWidth-1:0] lcd_rect_x0;
    reg [CoordinateWidth-1:0] lcd_rect_x1;
    reg [CoordinateWidth-1:0] lcd_rect_y0;
    reg [CoordinateWidth-1:0] lcd_rect_y1;

    reg [CoordinateWidth-1:0] lcd_pixel_x;
    reg [CoordinateWidth-1:0] lcd_pixel_y;

    reg [PixelWidth-1:0]      lcd_rect_pixel_write;
    reg                       lcd_rect_pixel_write_valid;
    wire                      lcd_rect_pixel_write_ready;
    wire [PixelWidth-1:0]     lcd_rect_pixel_read;
    wire                      lcd_rect_pixel_read_valid;
    reg                       lcd_rect_pixel_read_ready;

    lcd_image #(
            .IS( ImageSpec ),

            .LcdWidth( LcdWidth ),
            .LcdHeight( LcdHeight ),
            .LcdCoordinateWidth( LcdCoordinateWidth ),
            .LcdCommandWidth( LcdCommandWidth ),
            .LcdPixelWidth( LcdPixelWidth )
        ) l(
            .clock( clock ),
            .reset( reset ),

            .image_in( image_in ),

            //  LCD HW
        );

To Do

Testing

    Tested in lcd_image_tb.v

*/

`include "../../pipe/rtl/pipe_defs.v"

`include "../../image/rtl/image_defs.v"

module lcd_image #(

        // Images - set to null by default
        parameter [`IS_w-1:0] IS = `IS_NULL,

        // Lcd parameters
        parameter LcdWidth           = 480,
        parameter LcdHeight          = 320,
        parameter LcdPixelRedWidth   = 5,
        parameter LcdPixelGreenWidth = 6,
        parameter LcdPixelBlueWidth  = 5,
        parameter LcdCoordinateWidth = 9,
        parameter LcdDataWidth       = 18,
        parameter LcdPixelWidth      = 16,
        parameter LcdCommandWidth    = 3,
        parameter LcdCommandDataTimerCount = 0,
        parameter LcdDelayTimerCount = 10000,
        parameter TimeOutCount       = 4000000
    ) (
        input clock,
        input reset,

        inout [`I_w(IS)-1:0] image,

        output configuring,
        output running,
        output busy,

        input refresh,

        // LCD Hardware Interface
        output  [LcdDataWidth-1:0] lcd_db,
        output                     lcd_rd,
        output                     lcd_wr,
        output                     lcd_rs,
        output                     lcd_cs,
        input                      lcd_id,
        output                     lcd_rst,
        input                      lcd_fmark,
        output                     lcd_blen,

        output [7:0] debug
    );

    `include "../../drivers/rtl/lcd_defs.v"

    // create a spec for the display
    parameter [`IS_w-1:0] LcdIs = `IS( 0, 0, LcdWidth, LcdHeight, 0, 1,`IS_FORMAT_RGB, LcdPixelRedWidth, LcdPixelGreenWidth, LcdPixelBlueWidth, 0, 0 );

    localparam LcdWidthWidth = `IS_WIDTH_WIDTH( LcdIs );
    localparam LcdHeightWidth = `IS_HEIGHT_WIDTH( LcdIs );

    localparam NullDataWidth = `I_Data_w( `IS_NULL );

    //
    // Image
    //

    localparam ImageDataWidth = `I_Data_w( IS );
    localparam ImageTransferSize = `IS_PIXEL_COUNT( IS );
    localparam ImageTransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS );

    localparam ImageRectX0 = `IS_X( IS );
    localparam ImageRectX1 = `IS_X( IS ) + `IS_WIDTH( IS ) - 1;
    localparam ImageRectY0 = `IS_Y( IS );
    localparam ImageRectY1 = `IS_Y( IS ) + `IS_HEIGHT( IS ) - 1;

    wire                      image_in_start;
    wire                      image_in_stop;
    wire [ImageDataWidth-1:0] image_in_data;
    wire                      image_in_valid;
    wire                      image_in_error;

    reg                       image_in_ready;
    reg                       image_in_request;
    reg                       image_in_cancel;

    assign image_in_start   = `I_Start( IS, image );
    assign image_in_stop    = `I_Stop( IS, image );
    assign image_in_data    = `I_Data( IS, image );
    assign image_in_error   = `I_Error( IS, image );
    assign image_in_valid   = `I_Valid( IS, image );

    assign `I_Request( IS, image ) = image_in_request;
    assign `I_Cancel( IS, image )  = image_in_cancel;
    assign `I_Ready( IS, image )   = image_in_ready;

    reg [LcdWidthWidth-1:0]  image_rect_x0;
    reg [LcdWidthWidth-1:0]  image_rect_x1;
    reg [LcdHeightWidth-1:0] image_rect_y0;
    reg [LcdHeightWidth-1:0] image_rect_y1;


    //
    // LCD
    //

    // LCD Connection
    reg [LcdCommandWidth-1:0]     lcd_command;
    reg                           lcd_abort;
    wire                          lcd_ready;
    reg [LcdPixelWidth-1:0]       lcd_fill_pixel;
    reg [LcdCoordinateWidth-1:0]  lcd_rect_x0;
    reg [LcdCoordinateWidth-1:0]  lcd_rect_x1;
    reg [LcdCoordinateWidth-1:0]  lcd_rect_y0;
    reg [LcdCoordinateWidth-1:0]  lcd_rect_y1;
    reg [LcdPixelWidth-1:0]       lcd_rect_pixel_write;
    reg                           lcd_rect_pixel_write_valid;
    wire                          lcd_rect_pixel_write_ready;
    wire [LcdPixelWidth-1:0]      lcd_rect_pixel_read;
    wire                          lcd_rect_pixel_read_valid;
    reg                           lcd_rect_pixel_read_ready;

    lcd #(
            .Width( LcdWidth ),
            .Height( LcdHeight ),
            .CoordinateWidth( LcdCoordinateWidth ),
            .CommandWidth( LcdCommandWidth ),
            .DataWidth( LcdDataWidth ),
            .PixelWidth( LcdPixelWidth ),
            .PixelRedWidth( LcdPixelRedWidth ),
            .PixelGreenWidth( LcdPixelGreenWidth ),
            .PixelBlueWidth( LcdPixelBlueWidth ),
            .CommandDataTimerCount( LcdCommandDataTimerCount ),
            .DelayTimerCount( LcdDelayTimerCount )
        ) l (
            .clock( clock ),
            .reset( reset ),

            // Connecting to the LCD Controller
            .command( lcd_command ),
            .abort( lcd_abort ),
            .ready( lcd_ready ),
            .fill_pixel( lcd_fill_pixel ),
            .rect_x0( lcd_rect_x0 ),
            .rect_x1( lcd_rect_x1 ),
            .rect_y0( lcd_rect_y0 ),
            .rect_y1( lcd_rect_y1 ),
            // .pixel_x( lcd_pixel_x ),
            // .pixel_y( lcd_pixel_y ),
            .rect_pixel_write( lcd_rect_pixel_write ),
            .rect_pixel_write_valid( lcd_rect_pixel_write_valid ),
            .rect_pixel_write_ready( lcd_rect_pixel_write_ready ),
            .rect_pixel_read( lcd_rect_pixel_read ),
            .rect_pixel_read_valid( lcd_rect_pixel_read_valid ),
            .rect_pixel_read_ready( lcd_rect_pixel_read_ready ),

            // Connecting to the LCD
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
    // Main Logic
    //

    reg li_configuring;
    reg li_running;
    reg li_busy;

    assign configuring = li_configuring;
    assign running = li_running;
    assign busy = li_busy;

    localparam LI_STATE_START          = 0,
               LI_STATE_CONFIGURE      = 1,
               LI_STATE_IDLE           = 2,
               LI_STATE_REFRESH        = 3,
               LI_STATE_START_TRANSFER = 4,
               LI_STATE_TRANSFER       = 5,
               LI_STATE_STARVE         = 6,
               LI_STATE_STALL          = 7,
               LI_STATE_OVERFLOW       = 8,
               LI_STATE_END_TRANSFER   = 9,
               LI_STATE_ABORT_TRANSFER = 10,
               LI_STATE_BUSY           = 11;

    reg [3:0]  li_state;

    assign debug[3:0] = li_state;
    assign debug[4] = ( image_transfer_count_next == ImageTransferSize );
    assign debug[5] = lcd_rect_pixel_write_ready;

    reg  [ImageTransferSizeWidth:0] image_transfer_count;
    wire [ImageTransferSizeWidth:0] image_transfer_count_next = image_transfer_count + 1;

    localparam TimeOutCountWidth = $clog2( TimeOutCount + 1 ) + 1;
    localparam TimeOutCountShort = 4;

    reg [TimeOutCountWidth:0] li_timeout_counter;
    wire li_timeout_expired = li_timeout_counter[ TimeOutCountWidth ];

    reg [ImageDataWidth-1:0] image_in_data_overflow;

    always @( posedge clock ) begin

        if ( reset ) begin

            li_configuring <= 0;
            li_running <= 0;
            li_busy <= 0;

            li_state <= LI_STATE_START;
            lcd_command <= LCD_COMMAND_NONE;
            lcd_abort <= 0;

            lcd_fill_pixel <= 0;

            lcd_rect_x0 <= 0;
            lcd_rect_x1 <= 0;
            lcd_rect_y0 <= 0;
            lcd_rect_y1 <= 0;
            lcd_rect_pixel_write <= 0;
            lcd_rect_pixel_write_valid <= 0;

            lcd_rect_pixel_read_ready <= 0;

            image_in_ready <= 0;
            image_in_request <= 0;
            image_in_cancel <= 0;

            image_transfer_count <= 0;

            li_timeout_counter <= 0;

        end else begin
            case ( li_state )
                LI_STATE_START: begin // 0
                        lcd_command <= LCD_COMMAND_CONFIGURE;
                        li_state <= LI_STATE_CONFIGURE;
                        li_configuring <= 1;
                        li_busy <= 1;
                        li_timeout_counter <= TimeOutCountShort;
                    end
                LI_STATE_CONFIGURE: begin // 1
                        if ( li_timeout_expired ) begin
                            if ( lcd_ready ) begin
                                lcd_fill_pixel <= 1;
                                lcd_rect_x0 <= 0;
                                lcd_rect_x1 <= LcdWidth - 1;
                                lcd_rect_y0 <= 0;
                                lcd_rect_y1 <= LcdHeight - 1;
                                lcd_command <= LCD_COMMAND_FILL_RECT;
                                li_timeout_counter <= TimeOutCountShort;
                                li_state <= LI_STATE_BUSY;
                            end else begin
                                lcd_command <= LCD_COMMAND_NONE;
                            end
                        end else begin
                            li_timeout_counter <= li_timeout_counter - 1;
                        end
                    end
                LI_STATE_IDLE: begin // 2
                        li_configuring <= 0;
                        li_running <= 1;

                        lcd_abort <= 0;
                        image_in_cancel <= 0;

                        if ( refresh ) begin
                            li_busy <= 1;
                            li_state <= LI_STATE_REFRESH;
                        end else begin
                            li_busy <= 0;
                        end
                    end
                LI_STATE_REFRESH: begin // 3
                        lcd_rect_x0 <= ImageRectX0;
                        lcd_rect_x1 <= ImageRectX1;
                        lcd_rect_y0 <= ImageRectY0;
                        lcd_rect_y1 <= ImageRectY1;
                        lcd_command <= LCD_COMMAND_WRITE_RECT;
                        image_in_ready <= 0;
                        image_in_request <= 1;
                        li_state <= LI_STATE_START_TRANSFER;
                    end
                LI_STATE_START_TRANSFER: begin // 4
                        lcd_command <=  LCD_COMMAND_NONE;
                        image_in_request <= 0;
                        // wait for the lcd to be ready to receive (timeout?)
                        if ( lcd_rect_pixel_write_ready ) begin
                            image_in_ready <= 1;
                            image_transfer_count <= 0;
                            lcd_rect_pixel_write_valid <= 0;
                            li_timeout_counter <= TimeOutCount;
                            li_state <= LI_STATE_TRANSFER;
                            //li_state <= LI_STATE_STALL;
                        end
                    end
                LI_STATE_TRANSFER: begin // 5
                        if ( image_in_stop || !li_timeout_expired ) begin
                            if ( image_in_valid && ( ( image_transfer_count != 0 ) || image_in_start ) ) begin
                                li_timeout_counter <= TimeOutCount;
                                if ( lcd_rect_pixel_write_ready || !lcd_rect_pixel_write_valid ) begin
                                    lcd_rect_pixel_write <= image_in_data;
                                    lcd_rect_pixel_write_valid <= 1;
                                    if ( image_transfer_count_next == ImageTransferSize ) begin
                                        image_transfer_count <= 0;
                                        image_in_ready <= 0;
                                        li_state <= LI_STATE_END_TRANSFER;
                                    end else begin
                                        image_transfer_count <= image_transfer_count_next;
                                    end
                                end else begin
                                    image_in_ready <= 0;
                                    image_in_data_overflow <= image_in_data;
                                    li_state <= LI_STATE_OVERFLOW;
                                end
                            end else begin
                                li_timeout_counter <= li_timeout_counter - 1;
                                image_in_ready <= 0;
                                if ( ~lcd_rect_pixel_write_ready ) begin
                                    li_state <= LI_STATE_STALL;
                                end else begin
                                    lcd_rect_pixel_write <= 0;
                                    lcd_rect_pixel_write_valid <= 0;
                                    li_state <= LI_STATE_STARVE;
                                end
                            end
                        end else begin
                            // timeout (more than TimeOutCount cycles since last valid char)
                            li_state <= LI_STATE_ABORT_TRANSFER;
                        end
                    end
                LI_STATE_STARVE: begin // 6
                        if ( !li_timeout_expired ) begin
                            if ( image_in_valid ) begin
                                image_in_ready <= 1;
                                li_timeout_counter <= TimeOutCount;
                                li_state <= LI_STATE_TRANSFER;
                            end else begin
                                li_timeout_counter <= li_timeout_counter - 1;
                            end
                        end else begin
                            li_state <= LI_STATE_ABORT_TRANSFER;
                        end
                    end
                LI_STATE_STALL: begin // 7
                        if ( !li_timeout_expired ) begin
                            if ( lcd_rect_pixel_write_ready ) begin
                                li_timeout_counter <= TimeOutCount;
                                li_state <= LI_STATE_TRANSFER;
                                image_in_ready <= 1;
                                lcd_rect_pixel_write <= 0;
                                lcd_rect_pixel_write_valid <= 0;
                            end else begin
                                li_timeout_counter <= li_timeout_counter - 1;
                            end
                        end else begin
                            li_state <= LI_STATE_ABORT_TRANSFER;
                        end
                    end
                LI_STATE_OVERFLOW: begin // 8
                        if ( !li_timeout_expired ) begin
                            if ( lcd_rect_pixel_write_ready ) begin
                                lcd_rect_pixel_write <= image_in_data_overflow;
                                if ( image_transfer_count_next == ImageTransferSize ) begin
                                    image_transfer_count <= 0;
                                    image_in_ready <= 0;
                                    li_state <= LI_STATE_END_TRANSFER;
                                end else begin
                                    image_in_ready <= 1;
                                    image_transfer_count <= image_transfer_count_next;
                                    li_state <= LI_STATE_TRANSFER;
                                end
                            end else begin
                                li_timeout_counter <= li_timeout_counter - 1;
                            end
                        end else begin
                            li_state <= LI_STATE_ABORT_TRANSFER;
                        end
                    end
                LI_STATE_END_TRANSFER: begin // 9
                        if ( lcd_rect_pixel_write_ready ) begin
                            li_timeout_counter <= TimeOutCount;
                            lcd_rect_pixel_write <= 0;
                            image_in_ready <= 0;
                            lcd_rect_pixel_write_valid <= 0;
                            li_busy <= 0;
                            li_state <= LI_STATE_IDLE;
                        end else begin
                            if ( !li_timeout_expired ) begin
                                li_timeout_counter <= li_timeout_counter - 1;
                            end else begin
                                li_state <= LI_STATE_ABORT_TRANSFER;
                            end
                        end
                    end
                LI_STATE_ABORT_TRANSFER: begin // 10
                        lcd_rect_pixel_write <= 0;
                        lcd_rect_pixel_write_valid <= 0;
                        image_transfer_count <= 0;
                        image_in_ready <= 0;
                        lcd_abort <= 1;
                        image_in_cancel <= 1;
                        li_busy <= 0;
                        li_state <= LI_STATE_IDLE;
                    end
                LI_STATE_BUSY: begin // 11
                        lcd_command <= LCD_COMMAND_NONE;
                        if ( li_timeout_expired ) begin
                            if ( lcd_ready ) begin
                                li_state <= LI_STATE_IDLE;
                            end
                        end else begin
                            li_timeout_counter <= li_timeout_counter - 1;
                        end
                    end
            endcase
        end
    end

endmodule

