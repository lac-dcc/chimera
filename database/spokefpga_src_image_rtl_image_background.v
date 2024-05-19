// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

`timescale 1ns / 100ps

/*

Image Background

Overview

    Image Background generates various backgrounds, based on the operation value

    - 0 - Solid background is specified color
    - 1 - Grid test pattern (white borders, and colored grid lines)

    Operation is checked each pixel, so can be changed at any time.

    Future Ideas
    - Noise - white noise
    - Vertical Gradient is one color moving to another from top to bottom
    - External - external code provides pixels based on co-ordinates

Issues


Use

    Connect this module to a destination.

    It responds to requests.

    Future
    - Generate Update requests downstream

Invocation

    image_backgound #(
            .IS( IS )
        ) ib (
            .clock( clock ),
            .reset( reset ),

            .operation( operation ),
            .color( color ),

            .out_request_external( out_request_external ),

            .image_out( image_out ),

            .out_sending( out_sending ),
        );

Testing

    Tested in image_solid_tb.v

    NOT Tested on the Hackaday 2019 Badge (ECP5)

*/

`include "../../image/rtl/image_defs.v"

module image_background #(
        parameter [`IS_w-1:0] IS = `IS_DEFAULT,
        parameter Step = 0,
        parameter Bayer_GreenFirst = 0,
        parameter Bayer_BlueFirst = 1
    ) (
        input clock,
        input reset,

        input [1:0] operation,
        input [23:0 ] color,

        input  out_request_external,

        inout [`I_w( IS )-1:0 ] image_out,

        output out_sending
    );

    //
    // Spec Info
    //

    localparam Width  = `IS_WIDTH( IS );
    localparam Height = `IS_HEIGHT( IS );

    localparam WidthWidth  = `IS_WIDTH_WIDTH( IS );
    localparam HeightWidth = `IS_HEIGHT_WIDTH( IS );
    localparam DataWidth   = `IS_DATA_WIDTH( IS );

    localparam [7:0] C0Width    = `I_C0_w( IS );
    localparam [7:0] C1Width    = `I_C1_w( IS );
    localparam [7:0] C2Width    = `I_C2_w( IS );
    localparam [7:0] AlphaWidth = `I_Alpha_w( IS );
    localparam [7:0] ZWidth     = `I_Z_w( IS );

    localparam InternalWidth    = 10;
    localparam AccumulatorWidth = 12;

    localparam Format = `IS_FORMAT( IS );

    localparam [`IS_w-1:0] IS_RGB8 = `IS( 0, 0, 32, 32,   0, 1, `IS_FORMAT_RGB,   8,  8,  8, 0, 0 );

    localparam SolidColorWidth = `I_C0_w( IS_RGB8 );

    //
    // Image Out
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

    // Assign the outgoing signals
    assign `I_Start( IS, image_out ) = out_start;
    assign `I_Stop( IS, image_out ) = out_stop;
    assign `I_Data( IS, image_out ) = out_data;
    assign `I_Valid( IS, image_out ) = out_valid;
    assign `I_Error( IS, image_out ) = out_error;

    // Assign the incoming signals
    assign out_request = `I_Request( IS, image_out );
    assign out_cancel  = `I_Cancel( IS, image_out );
    assign out_ready   = `I_Ready( IS, image_out );

    // States
    localparam BOUT_STATE_IDLE = 0,
               BOUT_STATE_SENDING = 1,
               BOUT_STATE_COMPLETE = 2;

    reg  [1:0] bout_state;

    reg  [WidthWidth-1:0]  bout_x;
    reg  [HeightWidth-1:0] bout_y;
    wire [WidthWidth-1:0]  bout_x_next = bout_x + 1;
    wire [HeightWidth-1:0] bout_y_next = bout_y + 1;

    reg  bayer_green;
    reg  bayer_green_line;
    reg  bayer_blue;

    wire bout_xy_start = ( bout_x == 0 ) && ( bout_y == 0 );
    wire bout_xy_end   = ( bout_x == Width - 1 ) && ( bout_y == Height - 1 );

    reg [C0Width-1:0]    c0;
    reg [C1Width-1:0]    c1;
    reg [C2Width-1:0]    c2;
    if ( AlphaWidth > 0 )
        reg [AlphaWidth-1:0] alpha;
    else
        reg alpha;

    if ( ZWidth > 0 )
        reg [ZWidth-1:0]     z;
    else
        reg z;

    reg [AccumulatorWidth-1:0] acc;

    localparam C0Max    = ( 1 << C0Width ) - 1;
    localparam C1Max    = ( 1 << C1Width ) - 1;
    localparam C2Max    = ( 1 << C2Width ) - 1;
    if ( AlphaWidth > 0 )
        localparam AlphaMax = ( 1 << AlphaWidth ) - 1;
    if ( ZWidth > 0 )
        localparam ZMax     = ( 1 << ZWidth ) - 1;

    localparam InternalMax = ( 1 << InternalWidth ) - 1;

    reg [5:0] step;

    //
    // Grid Functions
    //

    function [InternalWidth-1:0] r_grid( input [WidthWidth-1:0] x, input [HeightWidth-1:0] y );
        if ( ( x < 2 ) || ( y < 2 ) || ( x > (Width - 3)) || ( y > (Height - 3)) || ( y[3:1] == 2 ) || ( x[3:1] == 2 ) )
            r_grid = InternalMax;
        else
            r_grid = 0;
    endfunction

    function [InternalWidth-1:0] g_grid( input [WidthWidth-1:0] x, input [HeightWidth-1:0] y );
        if ( ( x < 2 ) || ( y < 2 ) || ( x > (Width - 3)) || ( y > (Height - 3)) || ( y[3:1] == 4 ) || ( x[3:1] ==  4 ) )
            g_grid = InternalMax;
        else
            g_grid = 0;
    endfunction

    function [InternalWidth-1:0] b_grid( input [WidthWidth-1:0] x, input [HeightWidth-1:0] y );
        if ( ( x < 2 ) || ( y < 2 ) || ( x > (Width - 3)) || ( y > (Height - 3)) || ( y[3:1] == 6 ) || ( x[3:1] == 6 ) )
            b_grid = InternalMax;
        else
            b_grid = 0;
    endfunction

    if ( AlphaWidth > 0 ) begin
        function [InternalWidth-1:0] alpha_grid( input [WidthWidth-1:0] x, input [HeightWidth-1:0] y );
                    alpha_grid = InternalMax;
        endfunction
    end

    if ( ZWidth > 0 ) begin
        function [InternalWidth-1:0] z_grid( input [WidthWidth-1:0] x, input [HeightWidth-1:0] y );
                    z_grid = 0;
        endfunction
    end

    always @( * ) begin

        c0 = 0;
        c1 = 0;
        c2 = 0;
        if ( AlphaWidth > 0 ) begin
            alpha = 0;
        end

        if ( ZWidth > 0 ) begin
            z = 0;
        end

        acc = 0;

        if ( Format == `IS_FORMAT_GRAYSCALE ) begin
            case ( operation )
                0: begin
                        c0 = `I_ColorComponent( 10, C0Width, `I_C0( IS_RGB8, color ) + `I_C1( IS_RGB8, color ) + `I_C2( IS_RGB8, color ) );
                    end
                1: begin
                        acc = r_grid( bout_x, bout_y ) + g_grid( bout_x, bout_y ) + b_grid( bout_x, bout_y );
                        c0 = acc[AccumulatorWidth-1 -: C0Width ];
                    end
            endcase
        end else begin
            if ( Format == `IS_FORMAT_RGB ) begin
                case ( operation )
                    0: begin
                            c0 = `I_C0( IS_RGB8, color );
                            c1 = `I_C1( IS_RGB8, color );
                            c2 = `I_C2( IS_RGB8, color );
                        end
                    1: begin
                            c0 = ( InternalWidth > C0Width ) ? r_grid( bout_x, bout_y ) >> ( InternalWidth - C0Width ) : r_grid( bout_x, bout_y ) << ( C0Width - InternalWidth );
                            c1 = ( InternalWidth > C1Width ) ? g_grid( bout_x, bout_y ) >> ( InternalWidth - C1Width ) : g_grid( bout_x, bout_y ) << ( C1Width - InternalWidth );
                            c2 = ( InternalWidth > C2Width ) ? b_grid( bout_x, bout_y ) >> ( InternalWidth - C2Width ) : b_grid( bout_x, bout_y ) << ( C2Width - InternalWidth );
                        end
                endcase
            end else begin
                if ( Format == `IS_FORMAT_BAYER ) begin
                    case ( operation )
                        0: begin
                                if ( bayer_green )
                                    c0 = `I_ColorComponent( SolidColorWidth, C0Width, `I_C1( IS_RGB8, color ) );
                                else begin
                                    if ( bayer_blue )
                                        c0 = `I_ColorComponent( SolidColorWidth, C0Width, `I_C2( IS_RGB8, color ) );
                                    else
                                        c0 = `I_ColorComponent( SolidColorWidth, C0Width, `I_C0( IS_RGB8, color ) );
                                end
                            end
                        1: begin
                                if ( bayer_green )
                                    c0 = ( InternalWidth > C0Width ) ? g_grid( bout_x, bout_y ) >> ( InternalWidth - C0Width ) : g_grid( bout_x, bout_y ) << ( C0Width - InternalWidth );
                                else begin
                                    if ( bayer_blue )
                                        c0 = ( InternalWidth > C0Width ) ? b_grid( bout_x, bout_y ) >> ( InternalWidth - C0Width ) : b_grid( bout_x, bout_y ) << ( C0Width - InternalWidth );
                                    else
                                        c0 = ( InternalWidth > C0Width ) ? r_grid( bout_x, bout_y ) >> ( InternalWidth - C0Width ) : r_grid( bout_x, bout_y ) << ( C0Width - InternalWidth );
                                end
                            end
                    endcase
                end
            end
        end

    end

    always @( posedge clock ) begin
        if ( reset || out_cancel ) begin
            bout_state <= BOUT_STATE_IDLE;
            bout_x <= 0;
            bout_y <= 0;
            out_start <= 0;
            out_stop <= 0;
            out_data <= 0;
            out_error <= 0;
            out_valid <= 0;
            bayer_green_line <= Bayer_GreenFirst;
            bayer_green <= Bayer_GreenFirst;
            bayer_blue <= Bayer_BlueFirst;
        end else begin
            case ( bout_state )
                BOUT_STATE_IDLE: begin
                        if ( out_request || out_request_external ) begin
                            bout_state <= BOUT_STATE_SENDING;
                        end
                    end
                BOUT_STATE_SENDING: begin
                        if ( out_ready || !out_valid ) begin
                            if ( ( Format == `IS_FORMAT_GRAYSCALE ) || ( Format == `IS_FORMAT_BAYER ) )
                                out_data <= c0;
                            else
                                out_data <= { c2, c1, c0 };
                            out_start <= ( bout_xy_start );
                            out_valid <= 1;
                            if ( bout_x == Width-1 ) begin
                                if ( bout_y == Height-1 ) begin
                                    out_stop <= 1;
                                    bout_state <= BOUT_STATE_COMPLETE;
                                end else begin
                                    bout_x <= 0;
                                    bayer_blue <= !bayer_blue;
                                    bayer_green <= !bayer_green_line;
                                    bayer_green_line <= !bayer_green_line;
                                    bout_y <= bout_y_next;
                                end
                            end else begin
                                bout_x <= bout_x_next;
                                bayer_green <= !bayer_green;
                            end
                        end
                    end
                BOUT_STATE_COMPLETE: begin
                        if ( out_ready ) begin
                            out_data <= 0;
                            out_start <= 0;
                            out_stop <= 0;
                            out_valid <= 0;
                            bout_x <= 0;
                            bout_y <= 0;
                            bayer_green_line <= Bayer_GreenFirst;
                            bayer_green <= Bayer_GreenFirst;
                            bayer_blue <= Bayer_BlueFirst;
                            bout_state <= BOUT_STATE_IDLE;
                        end
                    end
            endcase
        end
    end

    assign out_sending = ( bout_state != BOUT_STATE_IDLE );

endmodule
