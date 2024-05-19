// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

`timescale 1ns / 100ps

/*

Lcd Image N

Overview

    Lcd Image N is designed to control the Lcd module.

    It manages multiple image streams and presents them to the Lcd.

Issues

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

    lcd_image_n #(
            .LcdWidth( LcdWidth ),
            .LcdHeight( LcdHeight ),
            .LcdCoordinateWidth( LcdCoordinateWidth ),
            .LcdCommandWidth( LcdCommandWidth ),
            .LcdPixelWidth( LcdPixelWidth )
        ) l(
            .clock( clock ),
            .reset( reset ),


            // LCD HW
        );

To Do

Testing

    Tested in lcd_image_n_tb.v

    Tested in Hackaday Badge

*/

`include "../../pipe/rtl/pipe_defs.v"

`include "../../image/rtl/image_defs.v"

module lcd_image_n #(

        // How many of the chanels are in use?
        parameter ImageCount = 4,

        // Images - set to null by default
        parameter [`IS_w-1:0] IS_0 = `IS_NULL,
        parameter [`IS_w-1:0] IS_1 = `IS_NULL,
        parameter [`IS_w-1:0] IS_2 = `IS_NULL,
        parameter [`IS_w-1:0] IS_3 = `IS_NULL,
        parameter [`IS_w-1:0] IS_4 = `IS_NULL,
        parameter [`IS_w-1:0] IS_5 = `IS_NULL,
        parameter [`IS_w-1:0] IS_6 = `IS_NULL,
        parameter [`IS_w-1:0] IS_7 = `IS_NULL,

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

        // Images (only 4)
        inout [`I_w(IS_0)-1:0] image_0,
        inout [`I_w(IS_1)-1:0] image_1,
        inout [`I_w(IS_2)-1:0] image_2,
        inout [`I_w(IS_3)-1:0] image_3,
        inout [`I_w(IS_0)-1:0] image_4,
        inout [`I_w(IS_1)-1:0] image_5,
        inout [`I_w(IS_2)-1:0] image_6,
        inout [`I_w(IS_3)-1:0] image_7,

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

    localparam [`IS_w-1:0] LcdIs = `IS( 0, 0, LcdWidth, LcdHeight, 0, 1,`IS_FORMAT_RGB, LcdPixelRedWidth, LcdPixelGreenWidth, LcdPixelBlueWidth, 0, 0 );

    // are these broken?  Using them below in image_n_rect_x0, image_n_rect_y0 caused problems
    localparam LcdWidthWidth = `IS_WIDTH_WIDTH( LcdIs );
    localparam LcdHeightWidth = `IS_HEIGHT_WIDTH( LcdIs );

    localparam NullDataWidth = `I_Data_w( `IS_NULL );

    //
    // Image_0
    //

    localparam Image0DataWidth = `I_Data_w( IS_0 );
    localparam Image0TransferSize = `IS_PIXEL_COUNT( IS_0 );
    localparam Image0TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_0 );

    localparam Image0RectX0 = `IS_X( IS_0 );
    localparam Image0RectX1 = `IS_X( IS_0 ) + `IS_WIDTH( IS_0 ) - 1;
    localparam Image0RectY0 = `IS_Y( IS_0 );
    localparam Image0RectY1 = `IS_Y( IS_0 ) + `IS_HEIGHT( IS_0 ) - 1;

    wire                       image_0_in_start;
    wire                       image_0_in_stop;
    wire [Image0DataWidth-1:0] image_0_in_data;
    wire                       image_0_in_valid;
    wire                       image_0_in_error;

    reg                       image_0_in_ready;
    reg                       image_0_in_request;
    reg                       image_0_in_cancel;

    assign image_0_in_start   = `I_Start( IS_0, image_0 );
    assign image_0_in_stop    = `I_Stop( IS_0, image_0 );
    assign image_0_in_data    = `I_Data( IS_0, image_0 );
    assign image_0_in_error   = `I_Error( IS_0, image_0 );
    assign image_0_in_valid   = `I_Valid( IS_0, image_0 );

    assign `I_Request( IS_0, image_0 ) = image_0_in_request;
    assign `I_Cancel( IS_0, image_0 )  = image_0_in_cancel;
    assign `I_Ready( IS_0, image_0 )   = image_0_in_ready;

    //
    // Image_1
    //

    localparam Image1DataWidth = `I_Data_w( IS_1 );
    localparam Image1TransferSize = `IS_PIXEL_COUNT( IS_1 );
    localparam Image1TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_1 );

    localparam Image1RectX0 = `IS_X( IS_1 );
    localparam Image1RectX1 = `IS_X( IS_1 ) + `IS_WIDTH( IS_1 ) - 1;
    localparam Image1RectY0 = `IS_Y( IS_1 );
    localparam Image1RectY1 = `IS_Y( IS_1 ) + `IS_HEIGHT( IS_1 ) - 1;

    wire                       image_1_in_start;
    wire                       image_1_in_stop;
    wire [Image1DataWidth-1:0] image_1_in_data;
    wire                       image_1_in_valid;
    wire                       image_1_in_error;

    reg                        image_1_in_ready;
    reg                        image_1_in_request;
    reg                        image_1_in_cancel;

    assign image_1_in_start   = `I_Start( IS_1, image_1 );
    assign image_1_in_stop    = `I_Stop( IS_1, image_1 );
    assign image_1_in_data    = `I_Data( IS_1, image_1 );
    assign image_1_in_error   = `I_Error( IS_1, image_1 );
    assign image_1_in_valid   = `I_Valid( IS_1, image_1 );

    assign `I_Request( IS_1, image_1 ) = image_1_in_request;
    assign `I_Cancel( IS_1, image_1 )  = image_1_in_cancel;
    assign `I_Ready( IS_1, image_1 )   = image_1_in_ready;

    //
    // Image_2
    //

    localparam Image2DataWidth = `I_Data_w( IS_2 );
    localparam Image2TransferSize = `IS_PIXEL_COUNT( IS_2 );
    localparam Image2TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_2 );

    localparam Image2RectX0 = `IS_X( IS_2 );
    localparam Image2RectX1 = `IS_X( IS_2 ) + `IS_WIDTH( IS_2 ) - 1;
    localparam Image2RectY0 = `IS_Y( IS_2 );
    localparam Image2RectY1 = `IS_Y( IS_2 ) + `IS_HEIGHT( IS_2 ) - 1;

    wire                       image_2_in_start;
    wire                       image_2_in_stop;
    wire [Image2DataWidth-1:0] image_2_in_data;
    wire                       image_2_in_valid;
    wire                       image_2_in_error;

    reg                        image_2_in_ready;
    reg                        image_2_in_request;
    reg                        image_2_in_cancel;

    assign image_2_in_start   = `I_Start( IS_2, image_2 );
    assign image_2_in_stop    = `I_Stop( IS_2, image_2 );
    assign image_2_in_data    = `I_Data( IS_2, image_2 );
    assign image_2_in_error   = `I_Error( IS_2, image_2 );
    assign image_2_in_valid   = `I_Valid( IS_2, image_2 );

    assign `I_Request( IS_2, image_2 ) = image_2_in_request;
    assign `I_Cancel( IS_2, image_2 )  = image_2_in_cancel;
    assign `I_Ready( IS_2, image_2 )   = image_2_in_ready;

    //
    // Image_3
    //

    localparam Image3DataWidth = `I_Data_w( IS_3 );
    localparam Image3TransferSize = `IS_PIXEL_COUNT( IS_3 );
    localparam Image3TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_3 );

    localparam Image3RectX0 = `IS_X( IS_3 );
    localparam Image3RectX1 = `IS_X( IS_3 ) + `IS_WIDTH( IS_3 ) - 1;
    localparam Image3RectY0 = `IS_Y( IS_3 );
    localparam Image3RectY1 = `IS_Y( IS_3 ) + `IS_HEIGHT( IS_3 ) - 1;

    wire                       image_3_in_start;
    wire                       image_3_in_stop;
    wire [Image3DataWidth-1:0] image_3_in_data;
    wire                       image_3_in_valid;
    wire                       image_3_in_error;

    reg                        image_3_in_ready;
    reg                        image_3_in_request;
    reg                        image_3_in_cancel;

    assign image_3_in_start   = `I_Start( IS_3, image_3 );
    assign image_3_in_stop    = `I_Stop( IS_3, image_3 );
    assign image_3_in_data    = `I_Data( IS_3, image_3 );
    assign image_3_in_error   = `I_Error( IS_3, image_3 );
    assign image_3_in_valid   = `I_Valid( IS_3, image_3 );

    assign `I_Request( IS_3, image_3 ) = image_3_in_request;
    assign `I_Cancel( IS_3, image_3 )  = image_3_in_cancel;
    assign `I_Ready( IS_3, image_3 )   = image_3_in_ready;

    //
    // Image_4
    //

    localparam Image4DataWidth = `I_Data_w( IS_4 );
    localparam Image4TransferSize = `IS_PIXEL_COUNT( IS_4 );
    localparam Image4TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_4 );

    localparam Image4RectX0 = `IS_X( IS_4 );
    localparam Image4RectX1 = `IS_X( IS_4 ) + `IS_WIDTH( IS_4 ) - 1;
    localparam Image4RectY0 = `IS_Y( IS_4 );
    localparam Image4RectY1 = `IS_Y( IS_4 ) + `IS_HEIGHT( IS_4 ) - 1;

    wire                       image_4_in_start;
    wire                       image_4_in_stop;
    wire [Image4DataWidth-1:0] image_4_in_data;
    wire                       image_4_in_valid;
    wire                       image_4_in_error;

    reg                        image_4_in_ready;
    reg                        image_4_in_request;
    reg                        image_4_in_cancel;

    assign image_4_in_start   = `I_Start( IS_4, image_4 );
    assign image_4_in_stop    = `I_Stop( IS_4, image_4 );
    assign image_4_in_data    = `I_Data( IS_4, image_4 );
    assign image_4_in_error   = `I_Error( IS_4, image_4 );
    assign image_4_in_valid   = `I_Valid( IS_4, image_4 );

    assign `I_Request( IS_4, image_4 ) = image_4_in_request;
    assign `I_Cancel( IS_4, image_4 )  = image_4_in_cancel;
    assign `I_Ready( IS_4, image_4 )   = image_4_in_ready;

    //
    // Image_5
    //

    localparam Image5DataWidth = `I_Data_w( IS_5 );
    localparam Image5TransferSize = `IS_PIXEL_COUNT( IS_5 );
    localparam Image5TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_5 );

    localparam Image5RectX0 = `IS_X( IS_5 );
    localparam Image5RectX1 = `IS_X( IS_5 ) + `IS_WIDTH( IS_5 ) - 1;
    localparam Image5RectY0 = `IS_Y( IS_5 );
    localparam Image5RectY1 = `IS_Y( IS_5 ) + `IS_HEIGHT( IS_5 ) - 1;

    wire                       image_5_in_start;
    wire                       image_5_in_stop;
    wire [Image5DataWidth-1:0] image_5_in_data;
    wire                       image_5_in_valid;
    wire                       image_5_in_error;

    reg                        image_5_in_ready;
    reg                        image_5_in_request;
    reg                        image_5_in_cancel;

    assign image_5_in_start   = `I_Start( IS_5, image_5 );
    assign image_5_in_stop    = `I_Stop( IS_5, image_5 );
    assign image_5_in_data    = `I_Data( IS_5, image_5 );
    assign image_5_in_error   = `I_Error( IS_5, image_5 );
    assign image_5_in_valid   = `I_Valid( IS_5, image_5 );

    assign `I_Request( IS_5, image_5 ) = image_5_in_request;
    assign `I_Cancel( IS_5, image_5 )  = image_5_in_cancel;
    assign `I_Ready( IS_5, image_5 )   = image_5_in_ready;

    //
    // Image_6
    //

    localparam Image6DataWidth = `I_Data_w( IS_6 );
    localparam Image6TransferSize = `IS_PIXEL_COUNT( IS_6 );
    localparam Image6TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_6 );

    localparam Image6RectX0 = `IS_X( IS_6 );
    localparam Image6RectX1 = `IS_X( IS_6 ) + `IS_WIDTH( IS_6 ) - 1;
    localparam Image6RectY0 = `IS_Y( IS_6 );
    localparam Image6RectY1 = `IS_Y( IS_6 ) + `IS_HEIGHT( IS_6 ) - 1;

    wire                       image_6_in_start;
    wire                       image_6_in_stop;
    wire [Image6DataWidth-1:0] image_6_in_data;
    wire                       image_6_in_valid;
    wire                       image_6_in_error;

    reg                        image_6_in_ready;
    reg                        image_6_in_request;
    reg                        image_6_in_cancel;

    assign image_6_in_start   = `I_Start( IS_6, image_6 );
    assign image_6_in_stop    = `I_Stop( IS_6, image_6 );
    assign image_6_in_data    = `I_Data( IS_6, image_6 );
    assign image_6_in_error   = `I_Error( IS_6, image_6 );
    assign image_6_in_valid   = `I_Valid( IS_6, image_6 );

    assign `I_Request( IS_6, image_6 ) = image_6_in_request;
    assign `I_Cancel( IS_6, image_6 )  = image_6_in_cancel;
    assign `I_Ready( IS_6, image_6 )   = image_6_in_ready;

    //
    // Image_7
    //

    localparam Image7DataWidth = `I_Data_w( IS_7 );
    localparam Image7TransferSize = `IS_PIXEL_COUNT( IS_7 );
    localparam Image7TransferSizeWidth = `IS_PIXEL_COUNT_WIDTH( IS_7 );

    localparam Image7RectX0 = `IS_X( IS_7 );
    localparam Image7RectX1 = `IS_X( IS_7 ) + `IS_WIDTH( IS_7 ) - 1;
    localparam Image7RectY0 = `IS_Y( IS_7 );
    localparam Image7RectY1 = `IS_Y( IS_7 ) + `IS_HEIGHT( IS_7 ) - 1;

    wire                       image_7_in_start;
    wire                       image_7_in_stop;
    wire [Image7DataWidth-1:0] image_7_in_data;
    wire                       image_7_in_valid;
    wire                       image_7_in_error;

    reg                        image_7_in_ready;
    reg                        image_7_in_request;
    reg                        image_7_in_cancel;

    assign image_7_in_start   = `I_Start( IS_7, image_7 );
    assign image_7_in_stop    = `I_Stop( IS_7, image_7 );
    assign image_7_in_data    = `I_Data( IS_7, image_7 );
    assign image_7_in_error   = `I_Error( IS_7, image_7 );
    assign image_7_in_valid   = `I_Valid( IS_7, image_7 );

    assign `I_Request( IS_7, image_7 ) = image_7_in_request;
    assign `I_Cancel( IS_7, image_7 )  = image_7_in_cancel;
    assign `I_Ready( IS_7, image_7 )   = image_7_in_ready;


    //
    // Image n
    //

    reg [2:0]  lin_image;

    // Decide on Data width.
    // ... these really ought to all be the same
    localparam ImageNDataWidth = ( Image0DataWidth > Image1DataWidth ) ? Image0DataWidth : Image1DataWidth;

    reg [ImageNDataWidth-1:0] image_n_in_data_overflow;

    // Decide on the transfer size
    localparam ImageNTransferSize = ( Image0TransferSize > Image1TransferSize ) ? Image0TransferSize : Image1TransferSize;
    localparam ImageNTransferSizeWidth = ( Image0TransferSizeWidth > Image1TransferSizeWidth ) ? Image0TransferSizeWidth : Image1TransferSizeWidth;

    reg [LcdCoordinateWidth-1:0] image_n_rect_x0;
    reg [LcdCoordinateWidth-1:0] image_n_rect_x1;
    reg [LcdCoordinateWidth-1:0] image_n_rect_y0;
    reg [LcdCoordinateWidth-1:0] image_n_rect_y1;

    reg  [ImageNTransferSizeWidth-1:0] image_n_transfer_count;
    wire [ImageNTransferSizeWidth-1:0] image_n_transfer_count_next = image_n_transfer_count + 1;

    reg [ImageNTransferSizeWidth-1:0] image_n_transfer_size;

    reg                       image_n_connected;
    reg                       image_n_in_start;
    reg                       image_n_in_stop;
    reg [ImageNDataWidth-1:0] image_n_in_data;
    reg                       image_n_in_valid;
    reg                       image_n_in_error;
    reg                       image_n_in_ready;
    reg                       image_n_in_request;
    reg                       image_n_in_cancel;

    // image_n_connected =  ( lin_image == 0 )? ;
    // image_n_rect_x0 =  ( lin_image == 0 )? ;
    // image_n_rect_x1 =  ( lin_image == 0 )? ;
    // image_n_rect_y0 =  ( lin_image == 0 )? ;
    // image_n_rect_y1 =  ( lin_image == 0 )? ;
    // image_n_in_start =  ( lin_image == 0 )? ;
    // image_n_in_stop =  ( lin_image == 0 )? ;
    // image_n_in_data =  ( lin_image == 0 )? ;
    // image_n_in_valid =  ( lin_image == 0 )? ;
    // image_n_in_error =  ( lin_image == 0 )? ;

    always @(*) begin
        image_n_connected = 0;
        image_n_rect_x0 = 0;
        image_n_rect_x1 = 0;
        image_n_rect_y0 = 0;
        image_n_rect_y1 = 0;
        image_n_transfer_size = 0;
        image_n_in_start = 0;
        image_n_in_stop = 0;
        image_n_in_data = 0;
        image_n_in_valid = 0;
        image_n_in_error = 0;
        image_0_in_request = 0;
        image_0_in_cancel = 0;
        image_0_in_ready = 0;
        image_1_in_request = 0;
        image_1_in_cancel = 0;
        image_1_in_ready = 0;
        image_2_in_request = 0;
        image_2_in_cancel = 0;
        image_2_in_ready = 0;
        image_3_in_request = 0;
        image_3_in_cancel = 0;
        image_3_in_ready = 0;
        image_4_in_request = 0;
        image_4_in_cancel = 0;
        image_4_in_ready = 0;
        image_5_in_request = 0;
        image_5_in_cancel = 0;
        image_5_in_ready = 0;
        image_6_in_request = 0;
        image_6_in_cancel = 0;
        image_6_in_ready = 0;
        image_7_in_request = 0;
        image_7_in_cancel = 0;
        image_7_in_ready = 0;

        case ( lin_image )
            0: begin
                    image_n_connected = ( Image0DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image0RectX0;
                    image_n_rect_x1 = Image0RectX1;
                    image_n_rect_y0 = Image0RectY0;
                    image_n_rect_y1 = Image0RectY1;
                    image_n_transfer_size = Image0TransferSize;
                    image_n_in_start = image_0_in_start;
                    image_n_in_stop = image_0_in_stop;
                    image_n_in_data = image_0_in_data;
                    image_n_in_valid = image_0_in_valid;
                    image_n_in_error = image_0_in_error;
                    image_0_in_cancel = image_n_in_cancel;
                    image_0_in_ready = image_n_in_ready;
                    image_0_in_request = image_n_in_request;
                end
            1: begin
                    image_n_connected = ( Image1DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image1RectX0;
                    image_n_rect_x1 = Image1RectX1;
                    image_n_rect_y0 = Image1RectY0;
                    image_n_rect_y1 = Image1RectY1;
                    image_n_transfer_size = Image1TransferSize;
                    image_n_in_start = image_1_in_start;
                    image_n_in_stop = image_1_in_stop;
                    image_n_in_data = image_1_in_data;
                    image_n_in_valid = image_1_in_valid;
                    image_n_in_error = image_1_in_error;
                    image_1_in_cancel = image_n_in_cancel;
                    image_1_in_ready = image_n_in_ready;
                    image_1_in_request = image_n_in_request;
                end
            2: begin
                    image_n_connected = ( Image2DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image2RectX0;
                    image_n_rect_x1 = Image2RectX1;
                    image_n_rect_y0 = Image2RectY0;
                    image_n_rect_y1 = Image2RectY1;
                    image_n_transfer_size = Image2TransferSize;
                    image_n_in_start = image_2_in_start;
                    image_n_in_stop = image_2_in_stop;
                    image_n_in_data = image_2_in_data;
                    image_n_in_valid = image_2_in_valid;
                    image_n_in_error = image_2_in_error;
                    image_2_in_cancel = image_n_in_cancel;
                    image_2_in_ready = image_n_in_ready;
                    image_2_in_request = image_n_in_request;
                end
            3: begin
                    image_n_connected = ( Image3DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image3RectX0;
                    image_n_rect_x1 = Image3RectX1;
                    image_n_rect_y0 = Image3RectY0;
                    image_n_rect_y1 = Image3RectY1;
                    image_n_transfer_size = Image3TransferSize;
                    image_n_in_start = image_3_in_start;
                    image_n_in_stop = image_3_in_stop;
                    image_n_in_data = image_3_in_data;
                    image_n_in_valid = image_3_in_valid;
                    image_n_in_error = image_3_in_error;
                    image_3_in_cancel = image_n_in_cancel;
                    image_3_in_ready = image_n_in_ready;
                    image_3_in_request = image_n_in_request;
                end
            4: begin
                    image_n_connected = ( Image4DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image4RectX0;
                    image_n_rect_x1 = Image4RectX1;
                    image_n_rect_y0 = Image4RectY0;
                    image_n_rect_y1 = Image4RectY1;
                    image_n_transfer_size = Image4TransferSize;
                    image_n_in_start = image_4_in_start;
                    image_n_in_stop = image_4_in_stop;
                    image_n_in_data = image_4_in_data;
                    image_n_in_valid = image_4_in_valid;
                    image_n_in_error = image_4_in_error;
                    image_4_in_cancel = image_n_in_cancel;
                    image_4_in_ready = image_n_in_ready;
                    image_4_in_request = image_n_in_request;
                end
            5: begin
                    image_n_connected = ( Image5DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image5RectX0;
                    image_n_rect_x1 = Image5RectX1;
                    image_n_rect_y0 = Image5RectY0;
                    image_n_rect_y1 = Image5RectY1;
                    image_n_transfer_size = Image5TransferSize;
                    image_n_in_start = image_5_in_start;
                    image_n_in_stop = image_5_in_stop;
                    image_n_in_data = image_5_in_data;
                    image_n_in_valid = image_5_in_valid;
                    image_n_in_error = image_5_in_error;
                    image_5_in_cancel = image_n_in_cancel;
                    image_5_in_ready = image_n_in_ready;
                    image_5_in_request = image_n_in_request;
                end
            6: begin
                    image_n_connected = ( Image6DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image6RectX0;
                    image_n_rect_x1 = Image6RectX1;
                    image_n_rect_y0 = Image6RectY0;
                    image_n_rect_y1 = Image6RectY1;
                    image_n_transfer_size = Image6TransferSize;
                    image_n_in_start = image_6_in_start;
                    image_n_in_stop = image_6_in_stop;
                    image_n_in_data = image_6_in_data;
                    image_n_in_valid = image_6_in_valid;
                    image_n_in_error = image_6_in_error;
                    image_6_in_cancel = image_n_in_cancel;
                    image_6_in_ready = image_n_in_ready;
                    image_6_in_request = image_n_in_request;
                end
            7: begin
                    image_n_connected = ( Image7DataWidth > NullDataWidth );
                    image_n_rect_x0 = Image7RectX0;
                    image_n_rect_x1 = Image7RectX1;
                    image_n_rect_y0 = Image7RectY0;
                    image_n_rect_y1 = Image7RectY1;
                    image_n_transfer_size = Image7TransferSize;
                    image_n_in_start = image_7_in_start;
                    image_n_in_stop = image_7_in_stop;
                    image_n_in_data = image_7_in_data;
                    image_n_in_valid = image_7_in_valid;
                    image_n_in_error = image_7_in_error;
                    image_7_in_cancel = image_n_in_cancel;
                    image_7_in_ready = image_n_in_ready;
                    image_7_in_request = image_n_in_request;
                end
        endcase
    end

    assign debug[ 2:0 ] = lin_image;
    assign debug[3] = image_n_in_valid;
    assign debug[4] = image_n_in_ready;
    assign debug[5] = lcd_rect_pixel_write_valid;
    assign debug[6] = lcd_rect_pixel_write_ready;

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

    reg lin_configuring;
    reg lin_running;
    reg lin_busy;

    assign configuring = lin_configuring;
    assign running = lin_running;
    assign busy = lin_busy;


    localparam LIN_STATE_START          = 0,
               LIN_STATE_CONFIGURE      = 1,
               LIN_STATE_IDLE           = 2,
               LIN_STATE_REFRESH        = 3,
               LIN_STATE_START_TRANSFER = 4,
               LIN_STATE_TRANSFER       = 5,
               LIN_STATE_STARVE         = 6,
               LIN_STATE_STALL          = 7,
               LIN_STATE_OVERFLOW       = 8,
               LIN_STATE_END_TRANSFER   = 9,
               LIN_STATE_ABORT_TRANSFER = 10,
               LIN_STATE_BUSY           = 11;

    reg [3:0]  lin_state;

    localparam TimeOutCountWidth = $clog2( TimeOutCount + 1 ) + 1;
    localparam TimeOutCountShort = 4;

    reg [TimeOutCountWidth:0] lin_timeout_counter;
    wire lin_timeout_expired = lin_timeout_counter[ TimeOutCountWidth ];

    always @( posedge clock ) begin

        if ( reset ) begin

            lin_configuring <= 0;
            lin_running <= 0;
            lin_busy <= 0;

            lin_state <= LIN_STATE_START;
            lcd_command <= LCD_COMMAND_NONE;
            lcd_abort <= 0;
            lcd_fill_pixel <= 0;

            lin_image <= 0;

            lcd_rect_x0 <= 0;
            lcd_rect_x1 <= 0;
            lcd_rect_y0 <= 0;
            lcd_rect_y1 <= 0;
            lcd_rect_pixel_write <= 0;
            lcd_rect_pixel_write_valid <= 0;

            lcd_rect_pixel_read_ready <= 0;

            image_n_in_ready <= 0;
            image_n_in_request <= 0;
            image_n_in_cancel <= 0;

            image_n_transfer_count <= 0;

            lin_timeout_counter <= 0;

        end else begin
            case ( lin_state )
                LIN_STATE_START: begin // 0
                        lcd_command <= LCD_COMMAND_CONFIGURE;
                        lin_state <= LIN_STATE_CONFIGURE;
                        lin_configuring <= 1;
                        lin_busy <= 1;
                        lin_timeout_counter <= TimeOutCountShort;
                    end
                LIN_STATE_CONFIGURE: begin // 1
                        if ( lin_timeout_expired ) begin
                            if ( lcd_ready ) begin
                                lin_timeout_counter <= TimeOutCountShort;
                                lcd_fill_pixel <= 1;
                                lcd_rect_x0 <= 0;
                                lcd_rect_x1 <= LcdWidth - 1;
                                lcd_rect_y0 <= 0;
                                lcd_rect_y1 <= LcdHeight - 1;
                                lcd_command <= LCD_COMMAND_FILL_RECT;
                                lin_state <= LIN_STATE_BUSY;
                            end else begin
                                lcd_command <= LCD_COMMAND_NONE;
                            end
                        end else begin
                            lin_timeout_counter <= lin_timeout_counter - 1;
                        end
                    end
                LIN_STATE_IDLE: begin // 2
                        lin_configuring <= 0;
                        lin_running <= 1;

                        lcd_abort <= 0;
                        image_n_in_cancel <= 0;

                        // this needs to also deal with individual refresh signals
                        if ( refresh ) begin
                            lin_state <= LIN_STATE_REFRESH;
                            lin_image <= 0;
                            lin_busy <= 1;
                        end else begin
                            lin_busy <= 0;
                        end
                    end
                LIN_STATE_REFRESH: begin // 3
                        if ( lin_image < ImageCount ) begin
                            if ( image_n_connected ) begin
                                lcd_rect_x0 <= image_n_rect_x0;
                                lcd_rect_x1 <= image_n_rect_x1;
                                lcd_rect_y0 <= image_n_rect_y0;
                                lcd_rect_y1 <= image_n_rect_y1;
                                lcd_command <= LCD_COMMAND_WRITE_RECT;
                                image_n_in_ready <= 0;
                                image_n_in_request <= 1;
                                lin_state <= LIN_STATE_START_TRANSFER;
                            end else begin
                                lin_image <= lin_image + 1;
                            end
                        end else begin
                            lin_busy <= 0;
                            lin_image <= 0;
                            lin_state <= LIN_STATE_IDLE;
                        end
                    end
                LIN_STATE_START_TRANSFER: begin // 4
                        lcd_command <=  LCD_COMMAND_NONE;
                        image_n_in_request <= 0;
                        if ( lcd_rect_pixel_write_ready ) begin
                            image_n_in_ready <= 1;
                            image_n_transfer_count <= 0;
                            lcd_rect_pixel_write_valid <= 0;
                            lin_timeout_counter <= TimeOutCount;
                            lin_state <= LIN_STATE_TRANSFER;
                        end
                    end
                LIN_STATE_TRANSFER: begin // 5
                        if ( image_n_in_stop || !lin_timeout_expired ) begin
                            if ( image_n_in_valid && ( ( image_n_transfer_count != 0 ) || image_n_in_start ) ) begin
                                lin_timeout_counter <= TimeOutCount;
                                if ( lcd_rect_pixel_write_ready || !lcd_rect_pixel_write_valid ) begin
                                    lcd_rect_pixel_write <= image_n_in_data;
                                    lcd_rect_pixel_write_valid <= 1;
                                    if ( image_n_transfer_count_next == image_n_transfer_size ) begin
                                        image_n_transfer_count <= 0;
                                        image_n_in_ready <= 0;
                                        lin_state <= LIN_STATE_END_TRANSFER;
                                    end else begin
                                        image_n_transfer_count <= image_n_transfer_count_next;
                                    end
                                end else begin
                                    image_n_in_ready <= 0;
                                    image_n_in_data_overflow <= image_n_in_data;
                                    lin_state <= LIN_STATE_OVERFLOW;
                                end
                            end else begin
                                lin_timeout_counter <= lin_timeout_counter - 1;
                                image_n_in_ready <= 0;
                                if ( ~lcd_rect_pixel_write_ready ) begin
                                    lin_state <= LIN_STATE_STALL;
                                end else begin
                                    lcd_rect_pixel_write <= 0;
                                    lcd_rect_pixel_write_valid <= 0;
                                    lin_state <= LIN_STATE_STARVE;
                                end
                            end
                        end else begin
                            // timeout (more than TimeOutCount cycles since last valid char)
                            lin_state <= LIN_STATE_ABORT_TRANSFER;
                        end
                    end
                LIN_STATE_STARVE: begin // 6
                        if ( !lin_timeout_expired ) begin
                            if ( image_n_in_valid ) begin
                                image_n_in_ready <= 1;
                                lin_timeout_counter <= TimeOutCount;
                                lin_state <= LIN_STATE_TRANSFER;
                            end else begin
                                lin_timeout_counter <= lin_timeout_counter - 1;
                            end
                        end else begin
                            lin_state <= LIN_STATE_ABORT_TRANSFER;
                        end
                    end
                LIN_STATE_STALL: begin // 7
                        if ( !lin_timeout_expired ) begin
                            if ( lcd_rect_pixel_write_ready ) begin
                                lin_timeout_counter <= TimeOutCount;
                                lin_state <= LIN_STATE_TRANSFER;
                                image_n_in_ready <= 1;
                                lcd_rect_pixel_write <= 0;
                                lcd_rect_pixel_write_valid <= 0;
                            end else begin
                                lin_timeout_counter <= lin_timeout_counter - 1;
                            end
                        end else begin
                            lin_state <= LIN_STATE_ABORT_TRANSFER;
                        end
                    end
                LIN_STATE_OVERFLOW: begin // 8
                        if ( !lin_timeout_expired ) begin
                            if ( lcd_rect_pixel_write_ready ) begin
                                lcd_rect_pixel_write <= image_n_in_data_overflow;
                                if ( image_n_transfer_count_next == image_n_transfer_size ) begin
                                    image_n_transfer_count <= 0;
                                    image_n_in_ready <= 0;
                                    lin_state <= LIN_STATE_END_TRANSFER;
                                end else begin
                                    image_n_in_ready <= 1;
                                    image_n_transfer_count <= image_n_transfer_count_next;
                                    lin_state <= LIN_STATE_TRANSFER;
                                end
                            end else begin
                                lin_timeout_counter <= lin_timeout_counter - 1;
                            end
                        end else begin
                            lin_state <= LIN_STATE_ABORT_TRANSFER;
                        end
                    end
                LIN_STATE_END_TRANSFER: begin // 9
                        if ( lcd_rect_pixel_write_ready ) begin
                            lin_timeout_counter <= TimeOutCount;
                            lcd_rect_pixel_write <= 0;
                            image_n_in_ready <= 0;
                            lcd_rect_pixel_write_valid <= 0;
                            lin_image <= lin_image + 1;
                            lin_state <= LIN_STATE_REFRESH;
                        end else begin
                            if ( !lin_timeout_expired ) begin
                                lin_timeout_counter <= lin_timeout_counter - 1;
                            end else begin
                                lin_state <= LIN_STATE_ABORT_TRANSFER;
                            end
                        end
                    end
                LIN_STATE_ABORT_TRANSFER: begin // 10
                        lcd_rect_pixel_write <= 0;
                        lcd_rect_pixel_write_valid <= 0;
                        image_n_transfer_count <= 0;
                        image_n_in_ready <= 0;
                        lcd_abort <= 1;
                        image_n_in_cancel <= 1;
                        lin_busy <= 0;
                        lin_state <= LIN_STATE_IDLE;
                    end
                LIN_STATE_BUSY: begin // 10
                        lcd_command <= LCD_COMMAND_NONE;
                        if ( lin_timeout_expired ) begin
                            if ( lcd_ready ) begin
                                lin_state <= LIN_STATE_IDLE;
                            end
                        end else begin
                            lin_timeout_counter <= lin_timeout_counter - 1;
                        end
                    end
            endcase
        end
    end
endmodule

