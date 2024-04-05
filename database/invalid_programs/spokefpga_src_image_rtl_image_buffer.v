`timescale 1ns / 100ps

/*

Image Buffer

Overview

    Image Buffer received images, stores them and resends them

    Also includes a combinatorial access port.  At no doubt great cost.

Issues


Use

    Connect this module to a source and to a destination.

Invocation

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

            .buffer_out_x( x ),
            .buffer_out_y( y ),
            .buffer_out_data( d )
        );

Testing

    Tested in image_buffer_tb.v

    NOT Tested on the Hackaday 2019 Badge (ECP5)

*/

`include "../../image/rtl/image_defs.v"

// Error line offset 344?

module image_buffer #(
        parameter [`IS_w-1:0 ] IS = `IS_DEFAULT,
        parameter ImplementAccessPort = 0
    ) (
        input clock,
        input reset,

        input  in_request_external,
        input  out_request_external,

        inout [`I_w( IS )-1:0 ] image_in,
        inout [`I_w( IS )-1:0 ] image_out,

        output in_receiving,
        output out_sending,

        input  [`IS_WIDTH_WIDTH( IS )-1:0]  buffer_out_x,
        input  [`IS_HEIGHT_WIDTH( IS )-1:0] buffer_out_y,
        output [`IS_DATA_WIDTH( IS )-1:0]   buffer_out_data
    );

    //
    // Spec Info
    //

    localparam Width = `IS_WIDTH( IS );
    localparam Height = `IS_HEIGHT( IS );

    localparam PixelCount = `IS_PIXEL_COUNT( IS );
    localparam PixelCountWidth = `IS_PIXEL_COUNT_WIDTH( IS );

    localparam WidthWidth = `IS_WIDTH_WIDTH( IS );
    localparam HeightWidth = `IS_HEIGHT_WIDTH( IS );
    localparam DataWidth = `IS_DATA_WIDTH( IS );

    reg [DataWidth-1:0] buffer[0 : Height * Width -1];

    //
    // Buffer In
    //

    wire                 in_start;
    wire                 in_stop;
    wire [DataWidth-1:0] in_data;
    wire                 in_valid;
    wire                 in_error;

    reg                  in_ready;
    reg                  in_request;
    reg                  in_cancel;

    assign in_start   = `I_Start( IS, image_in );
    assign in_stop    = `I_Stop( IS, image_in );
    assign in_data    = `I_Data( IS, image_in );
    assign in_error   = `I_Error( IS, image_in );
    assign in_valid   = `I_Valid( IS, image_in );

    assign `I_Request( IS, image_in ) = in_request;
    assign `I_Cancel( IS, image_in )  = in_cancel;
    assign `I_Ready( IS, image_in )   = in_ready;

    localparam BIN_STATE_IDLE = 0,
               BIN_STATE_RECEIVING = 1;

    reg bin_state;

    reg [WidthWidth-1:0]   bin_x;
    reg [HeightWidth-1:0]  bin_y;

    reg  [PixelCountWidth-1:0] bin_index;
    wire [PixelCountWidth-1:0] bin_index_next = bin_index + 1;

    always @( posedge clock ) begin
        if ( reset || in_error ) begin
            bin_state <= BIN_STATE_IDLE;
            bin_index <= 0;
            in_cancel <= 0;
            in_ready <= 0;
            in_request <= 0;
        end else begin
            case ( bin_state )
                BIN_STATE_IDLE: begin
                        if ( in_request_external ) begin
                            in_request <= 1;
                            bin_state <= BIN_STATE_RECEIVING;
                            in_ready <= 1;
                        end
                    end
                BIN_STATE_RECEIVING: begin
                    // need a valid character - first needs a start marker
                        if ( in_valid && ( bin_index || in_start ) ) begin
                            in_request <= 0;
                            buffer[ bin_index ] <= in_data;
                            if ( bin_index_next != PixelCount ) begin
                                bin_index <= bin_index_next;
                            end else begin
                                bin_index <= 0;
                                in_ready <= 0;
                                bin_state <= BIN_STATE_IDLE;
                            end
                        end else begin
                            in_request <= 0;
                        end
                    end
            endcase
        end
    end

    assign in_receiving = (bin_state != BIN_STATE_IDLE );

    //
    // Buffer Out
    //

    // Grab all the signals from the image pipe
    reg                 out_start;
    reg                 out_stop;
    reg [DataWidth-1:0] out_data;
    reg                 out_valid;
    reg                 out_error;

    wire                out_ready;
    wire                out_request;
    wire                out_cancel;

    assign `I_Start( IS, image_out ) = out_start;
    assign `I_Stop(  IS, image_out ) = out_stop;
    assign `I_Data(  IS, image_out ) = out_data;
    assign `I_Valid( IS, image_out ) = out_valid;
    assign `I_Error( IS, image_out ) = out_error;

    assign out_request = `I_Request( IS, image_out );
    assign out_cancel  = `I_Cancel(  IS, image_out );
    assign out_ready   = `I_Ready(   IS, image_out );

    localparam BOUT_STATE_IDLE = 0,
               BOUT_STATE_SENDING = 1;

    reg bout_state;

    reg  [PixelCountWidth-1:0] bout_index;
    wire [PixelCountWidth-1:0] bout_index_next = bout_index + 1;

    always @( posedge clock ) begin
        if ( reset || out_cancel ) begin
            bout_state <= BOUT_STATE_IDLE;
            bout_index <= 0;
            out_start <= 0;
            out_stop <= 0;
            out_data <= 0;
            out_error <= 0;
            out_valid <= 0;
        end else begin
            case ( bout_state )
                BOUT_STATE_IDLE: begin
                        if ( out_request || out_request_external ) begin
                            // assume idle values - change only the necessary
                            out_start <= 1;
                            out_data <= buffer[ 0 ];
                            out_valid <= 1;
                            bout_state <= BOUT_STATE_SENDING;
                        end
                    end
                BOUT_STATE_SENDING: begin
                        if ( out_ready ) begin
                            if ( bout_index_next == PixelCount ) begin
                                bout_index <= 0;
                                out_stop <= 0;
                                out_data <= 0;
                                out_valid <= 0;
                                bout_state <= BOUT_STATE_IDLE;
                            end else begin
                                out_start <= 0;
                                bout_index <= bout_index_next;
                                out_data <= buffer[ bout_index_next ];
                                if ( bout_index_next == PixelCount - 1 )
                                    out_stop <= 1;
                            end
                        end
                    end
            endcase
        end
    end

    assign out_sending = ( bout_state != BOUT_STATE_IDLE );

    //
    // Buffer Initialization Maybe
    //

    reg [WidthWidth-1:0]   init_x;
    reg [HeightWidth-1:0]  init_y;

    initial begin
        for ( init_y = 0; init_y < Height; init_y = init_y + 1 )
            for ( init_x = 0; init_x < Width; init_x = init_x + 1 )
                 buffer[ init_y * Width + init_x ] = 0;
    end

    //
    // Buffer Out Port
    //

    if ( ImplementAccessPort ) begin
        reg [DataWidth-1:0] ib_buffer_out_data;
        always @(buffer_out_y or buffer_out_x) begin
            ib_buffer_out_data = ( buffer[ buffer_out_y * Width + buffer_out_x ] );
        end
        assign buffer_out_data = ib_buffer_out_data;
    end

endmodule

