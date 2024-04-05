`timescale 1ns / 100ps

/*

    Image Debayer

        Takes an incoming Bayer-patterned image and converts it to RGB

        According to the datasheet, the imager starts with blue-green, next row is green-red

        We need to know two things:  are we starting with a green or not, and is the next color red or blue

        The flags aren't ideal

        - green_first
        - red_first

        However, with these two we can locate ourselves in the array.

        For each pixel we need an RGB value, so we can't even start accurately sending full pixels until
        we've seen a two rows.  Similarly, the first column lacks both of the other colors.

        We're going to need a row of pixels to supply the missing colors.

        For each pixel, we replace the color in the correct bin.

           [B] G  B  G  B  ...     [..B] [.GB] [.GB] ...
                                      ^    ^      ^
            G  R  G  R  G          [G.B] [RGB] [RGB] ...
                                    ^     ^      ^
            B  G  B  G  B          [G.B] [RGB] [RGB] ...
                                      ^    ^      ^
            ...                    ...

        The `green_first` and the `red_first` flags initialize the state machine then line by line
        the state machine contributes to the line memory.

        From a Bayer Camera, green first and blue first are not directly related to line number, rather
        it's like this:

            localparam Bayer_BlueFirst = ( ( ImageYInitial % 2 ) == 0 );

        Whether it's a blue-green or green_red line can be determined from the Y (line) number.

            localparam Bayer_GreenFirst = (!Bayer_BlueFirst) ^ ( ( ImageXInitial % 2 ) == 1 );

        The green first value depends on the X (column) BUT is swapped if not on a blue-green line

    Testing

        Tested in image_debayer_tb.v

        Not Tested in ECP5 - Hackaday Badge
*/

`include "../../image/rtl/image_defs.v"

module image_debayer #(
        parameter [`IS_w-1:0] InIS  = `IS_DEFAULT,
        parameter [`IS_w-1:0] OutIS = `IS_DEFAULT,
        parameter Bayer_GreenFirst = 0,
        parameter Bayer_BlueFirst = 1
    ) (
        input clock,
        input reset,

        inout [`I_w(InIS)-1:0]  image_in,
        inout [`I_w(OutIS)-1:0] image_out,

        output [7:0] debug
    );

    //
    // Assertions
    //

    // Width and Height of In and Out Images need to be the same
    // In has to be in Bayer format
    // Out has to be RGB

    localparam Width  = `IS_WIDTH( InIS );
    localparam Height = `IS_HEIGHT( InIS );

    localparam WidthWidth  = `IS_WIDTH_WIDTH( InIS );
    localparam HeightWidth = `IS_HEIGHT_WIDTH( InIS );
    localparam DataWidth   = `IS_DATA_WIDTH( InIS );
    localparam InDataWidth = `IS_DATA_WIDTH( InIS );
    localparam InC0Width   = `IS_C0_WIDTH( InIS );

    localparam OutC0Width   = `IS_C0_WIDTH( OutIS );
    localparam OutC1Width   = `IS_C1_WIDTH( OutIS );
    localparam OutC2Width   = `IS_C2_WIDTH( OutIS );
    localparam OutDataWidth = `IS_DATA_WIDTH( OutIS );

    //
    // Obviously
    //

    // InIS  - Bayer, single component size n
    // OutIS - RGB, multiple compoent of the same size

    //
    // Grab all the signals
    //


    wire                   in_start;
    wire                   in_stop;
    wire [InDataWidth-1:0] in_data;
    wire                   in_valid;
    wire                   in_error;

    reg                    in_ready;
    reg                    in_request;
    reg                    in_cancel;

    assign in_start = `I_Start( InIS, image_in ) ;
    assign in_stop  = `I_Stop(  InIS, image_in ) ;
    assign in_data  = `I_Data(  InIS, image_in ) ;
    assign in_error = `I_Error( InIS, image_in ) ;
    assign in_valid = `I_Valid( InIS, image_in ) ;

    assign `I_Request( InIS, image_in ) = in_request;
    assign `I_Cancel(  InIS, image_in ) = in_cancel;
    assign `I_Ready(   InIS, image_in ) = in_ready;

    reg                    out_start;
    reg                    out_stop;
    reg [OutDataWidth-1:0] out_data;
    reg                    out_valid;
    reg                    out_error;

    wire                   out_ready;
    wire                   out_request;
    wire                   out_cancel;

    assign `I_Start( OutIS, image_out ) = out_start;
    assign `I_Stop(  OutIS, image_out ) = out_stop;
    assign `I_Data(  OutIS, image_out ) = out_data;
    assign `I_Error( OutIS, image_out ) = out_error;
    assign `I_Valid( OutIS, image_out ) = out_valid;

    assign out_request = `I_Request( OutIS, image_out );
    assign out_cancel  = `I_Cancel(  OutIS, image_out );
    assign out_ready   = `I_Ready(   OutIS, image_out );


    //
    // State
    //

    localparam ID_STATE_IDLE     = 0,
               ID_STATE_STREAM   = 1,
               ID_STATE_STALL    = 2,
               ID_STATE_STARVE   = 3,
               ID_STATE_OVERLOAD = 4,
               ID_STATE_COMPLETE = 5;

    reg [2:0] id_state;


    // Bayer status
    reg  bayer_green;
    reg  bayer_green_first_line;
    reg  bayer_blue;

    wire  bayer_green_next;
    wire  bayer_green_first_line_next;
    wire  bayer_blue_next;

    reg  [WidthWidth:0]  bout_x;
    reg  [HeightWidth:0] bout_y;
    reg  [WidthWidth:0]  bout_x_next;
    reg  [HeightWidth:0] bout_y_next;

    wire bout_xy_start = ( bout_x == 0 ) && ( bout_y == 0 );
    wire bout_xy_stop  = ( bout_x == ( Width - 1 ) ) && ( bout_y == ( Height - 1 ) );

    wire [OutDataWidth-1:0] out_data_next;

    reg [OutC0Width-1:0] c0;
    reg [OutC1Width-1:0] c1;
    reg [OutC2Width-1:0] c2;

    reg                    out_start_stall;
    reg                    out_stop_stall;
    reg [OutDataWidth-1:0] out_data_stall;

    reg [InDataWidth-1:0] green_buffer;
    reg [InDataWidth-1:0] color_buffer [0:Width-2];
    reg [WidthWidth-1:0]  color_buffer_index;
    reg [InDataWidth-1:0] other_color_buffer;

    wire [InDataWidth-1:0] green_buffer_next;
    wire [InDataWidth-1:0] color_buffer_next;
    wire [WidthWidth-1:0]  color_buffer_index_next;
    wire [InDataWidth-1:0] other_color_buffer_next;

    reg first_line;
    wire first_line_next;

    always @(*) begin

        bayer_blue_next = bayer_blue;
        bayer_green_next = bayer_green_first_line;
        bayer_green_first_line_next = bayer_green_first_line;

        other_color_buffer_next = other_color_buffer;
        green_buffer_next = green_buffer;
        color_buffer_next = 0;
        color_buffer_index_next = color_buffer_index;

        first_line_next = first_line;

        if ( bayer_green ) begin
            c1 = `I_ColorComponent( InC0Width, OutC1Width, `I_C0( InIS, in_data ) );
            if ( bayer_blue ) begin
                if ( first_line )
                    c0 = 0;
                else
                    c0 = `I_ColorComponent( InC0Width, OutC0Width, color_buffer[ color_buffer_index ] );
                c2 = `I_ColorComponent( InC0Width, OutC2Width, other_color );
            end else begin
                c0 = `I_ColorComponent( InC0Width, OutC0Width, other_color );
                if ( first_line )
                    c2 = 0;
                else
                    c2 = `I_ColorComponent( InC0Width, OutC2Width, color_buffer[ color_buffer_index ] );
            end
            green_buffer_next = `I_C0( InIS, in_data );
        end else begin
            other_color_buffer_next = `I_C0( InIS, in_data );
            color_buffer_next = `I_C0( InIS, in_data );
            color_buffer_index_next = color_buffer_index + 1;
            if ( bayer_blue ) begin
                if ( first_line )
                    c0 = 0;
                else
                    c0 = `I_ColorComponent( InC0Width, OutC0Width, color_buffer[ color_buffer_index ] );
                c1 = `I_ColorComponent( InC0Width, OutC1Width, green_buffer );
                c2 = `I_ColorComponent( InC0Width, OutC2Width, `I_C0( InIS, in_data ) );
            end else begin
                c0 = `I_ColorComponent( InC0Width, OutC0Width, `I_C0( InIS, in_data ) );
                c1 = `I_ColorComponent( InC0Width, OutC1Width, green_buffer );
                if ( first_line )
                    c2 = 0;
                else
                    c2 = `I_ColorComponent( InC0Width, OutC2Width, color_buffer[ color_buffer_index ] );
            end
        end

        out_data_next = { c2, c1, c0 };

        if ( bout_x == ( Width - 1 ) ) begin
            bout_x_next = 0;
            bout_y_next = bout_y + 1;
            bayer_blue_next = !bayer_blue;
            bayer_green_next = !bayer_green_first_line;
            bayer_green_first_line_next = !bayer_green_first_line;
            color_buffer_index_next = 0;
            green_buffer_next = 0;
            other_color_buffer_next = 0;
            first_line_next = 0;
        end else begin
            bout_x_next = bout_x + 1;
            bout_y_next = bout_y;
            bayer_green_next = !bayer_green;
        end
    end

    always @( posedge clock ) begin

        if ( reset ) begin

            out_start <= 0;
            out_stop <= 0;
            out_data <= 0;
            out_valid <= 0;
            out_error <= 0;
            in_ready <= 0;

            bout_x <= 0;
            bout_y <= 0;

            bayer_green_first_line <= Bayer_GreenFirst;
            bayer_green <= Bayer_GreenFirst;
            bayer_blue <= Bayer_BlueFirst;

            green_buffer <= 0;
            other_color_buffer <= 0;
            color_buffer_index  <= 0;

            first_line <= 1;

            id_state <= ID_STATE_IDLE;

            out_data_stall <= 0;

        end else begin

            if ( out_cancel ) begin
                id_state <= ID_STATE_COMPLETE;
            end else begin
                case ( id_state )
                    ID_STATE_IDLE: begin // 0
                            if ( in_valid && in_start ) begin
                                in_ready <= 1;
                                id_state <= ID_STATE_STREAM;
                            end
                        end
                    ID_STATE_STREAM: begin // 1
                            if ( in_valid ) begin
                                out_valid <= 1;

                                bout_x <= bout_x_next;
                                bout_y <= bout_y_next;

                                bayer_blue <= bayer_blue_next;
                                bayer_green <= bayer_green_next;
                                bayer_green_first_line <= bayer_green_first_line_next;

                                green_buffer <= green_buffer_next;
                                other_color_buffer <= other_color_buffer_next;
                                color_buffer[ color_buffer_index ] <= color_buffer_next;
                                color_buffer_index <= color_buffer_index_next;

                                first_line <= first_line_next;

                                if ( out_ready || !out_valid ) begin

                                    out_start <= bout_xy_start;
                                    out_stop <= bout_xy_stop;
                                    out_data <= out_data_next;

                                    if ( bout_xy_stop )
                                        id_state <= ID_STATE_COMPLETE;
                                end else begin
                                    // ~out_ready
                                    in_ready <= 0;
                                    out_start_stall <= bout_xy_start;
                                    out_stop_stall <= bout_xy_stop;
                                    out_data_stall <= out_data_next;
                                    id_state <= ID_STATE_OVERLOAD;
                                end
                            end else begin
                                // ~in_valid
                                in_ready <= 0;

                                if ( out_ready ) begin
                                    out_valid <= 0;
                                    if ( !bout_xy_stop ) begin
                                        out_start <= 0;
                                        out_stop <= 0;
                                        out_data <= 0;
                                        id_state <= ID_STATE_STARVE;
                                    end else begin
                                        id_state <= ID_STATE_COMPLETE;
                                    end
                                end else begin
                                    if ( out_valid )
                                        id_state <= ID_STATE_STALL;
                                    else
                                        id_state <= ID_STATE_STARVE;
                                end
                            end
                        end
                    ID_STATE_STALL: begin // 2
                            if ( out_ready ) begin
                                out_valid <= 0;
                                if ( !bout_xy_stop ) begin
                                    in_ready <= 1;
                                    id_state <= ID_STATE_STREAM;
                                    out_valid <= 0;
                                end else begin
                                    id_state <= ID_STATE_COMPLETE;
                                end
                            end
                        end
                    ID_STATE_STARVE: begin // 3
                            if ( in_valid ) begin
                                in_ready <= 1;
                                id_state <= ID_STATE_STREAM;
                            end
                        end
                    ID_STATE_OVERLOAD: begin
                            if ( out_ready ) begin
                                in_ready <= 1;

                                out_start <= out_start_stall;
                                out_stop <= out_stop_stall;
                                out_data <= out_data_stall;
                                out_valid <= 1;

                                id_state <= ID_STATE_STREAM;
                            end
                        end
                    ID_STATE_COMPLETE: begin
                            out_start <= 0;
                            out_stop <= 0;
                            out_data <= 0;
                            out_valid <= 0;
                            out_error <= 0;
                            in_ready <= 0;

                            bout_x <= 0;
                            bout_y <= 0;

                            bayer_green_first_line <= Bayer_GreenFirst;
                            bayer_green <= Bayer_GreenFirst;
                            bayer_blue <= Bayer_BlueFirst;

                            green_buffer <= 0;
                            color_buffer_index  <= 0;

                            first_line <= 1;

                            id_state <= ID_STATE_IDLE;
                        end
                endcase
            end
        end
    end

    always @( posedge clock ) begin
        in_request <= out_request;
        in_cancel <= out_cancel;
    end

    assign debug[2:0] = id_state;
    assign debug[ 3 ] = bayer_green;
    assign debug[ 4 ] = bayer_blue;

endmodule