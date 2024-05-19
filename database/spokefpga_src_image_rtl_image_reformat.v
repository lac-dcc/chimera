// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

`timescale 1ns / 100ps

/*

    Image Reformat

        Takes an image pipeline in, transfers all the signals to and from the image out pipeline

        While its at it, it converts pixels from the in-format to the out-format

    Testing

        Sadly the data changing aspects of this module can't be tested by Icarus.  There seems to
        be a bug in Icarus perhaps related to assigning inout array members where there is no "anchor"
        within the module itself.

        The other aspects test OK

        Tested in image_reformat_tb.v

        Tested in ECP5 - Hackaday Badge

*/

`include "../../image/rtl/image_defs.v"

module image_reformat #(
        parameter [`IS_w-1:0] InIS = `IS_DEFAULT,
        parameter [`IS_w-1:0] OutIS = `IS_DEFAULT
    ) (
        input clock,
        input reset,

        inout [`I_w(InIS)-1:0]  image_in,
        inout [`I_w(OutIS)-1:0] image_out
    );

    //
    // Grab all the signals
    //

    wire                  in_start;
    wire                  in_stop;
    wire                  in_valid;
    wire                  in_error;

    wire                  in_ready;
    wire                  in_request;
    wire                  in_cancel;

    assign in_start = `I_Start( InIS, image_in ) ;
    assign in_stop  = `I_Stop(  InIS, image_in ) ;
    assign in_error = `I_Error( InIS, image_in ) ;
    assign in_valid = `I_Valid( InIS, image_in ) ;

    assign `I_Request( InIS, image_in ) = in_request;
    assign `I_Cancel(  InIS, image_in ) = in_cancel;
    assign `I_Ready(   InIS, image_in ) = in_ready;

    wire                  out_start;
    wire                  out_stop;
    wire                  out_valid;
    wire                  out_error;

    wire                  out_ready;
    wire                  out_request;
    wire                  out_cancel;

    assign `I_Start( OutIS, image_out ) = out_start;
    assign `I_Stop(  OutIS, image_out ) = out_stop;
    assign `I_Error( OutIS, image_out ) = out_error;
    assign `I_Valid( OutIS, image_out ) = out_valid;

    assign out_request = `I_Request( OutIS, image_out );
    assign out_cancel  = `I_Cancel(  OutIS, image_out );
    assign out_ready   = `I_Ready(   OutIS, image_out );

    // In -> Out signals
    assign out_start = in_start;
    assign out_stop  = in_stop;
    assign out_valid = in_valid;
    assign out_error = in_error;

    // Out -> In
    assign in_ready   = out_ready;
    assign in_request = out_request;
    assign in_cancel  = out_cancel;

    localparam InFormat  = `IS_FORMAT( InIS );
    localparam OutFormat = `IS_FORMAT( OutIS );

    localparam InC0_w     = `I_C0_w( InIS );
    localparam InC1_w     = `I_C1_w( InIS );
    localparam InC2_w     = `I_C2_w( InIS );
    localparam InAlpha_w  = `I_Alpha_w( InIS );
    localparam InZ_w      = `I_Z_w( InIS );

    localparam OutC0_w    = `I_C0_w( OutIS );
    localparam OutC1_w    = `I_C1_w( OutIS );
    localparam OutC2_w    = `I_C2_w( OutIS );
    localparam OutAlpha_w = `I_Alpha_w( OutIS );
    localparam OutZ_w     = `I_Z_w( OutIS );

    localparam InC0_m = `I_C0_m( InIS, 0 );
    localparam InC0_l = `I_C0_l( InIS, 0 );
    localparam InC1_m = `I_C1_m( InIS, 0 );
    localparam InC1_l = `I_C1_l( InIS, 0 );
    localparam InC2_m = `I_C2_m( InIS, 0 );
    localparam InC2_l = `I_C2_l( InIS, 0 );

    localparam OutC0_m = `I_C0_m( OutIS, 0 );
    localparam OutC0_l = `I_C0_l( OutIS, 0 );
    localparam OutC1_m = `I_C1_m( OutIS, 0 );
    localparam OutC1_l = `I_C1_l( OutIS, 0 );
    localparam OutC2_m = `I_C2_m( OutIS, 0 );
    localparam OutC2_l = `I_C2_l( OutIS, 0 );

    localparam OutC0BitsfromInC0  = ( InC0_w < OutC0_w ) ? InC0_w : OutC0_w;
    localparam signed OutC0Pad           = ( OutC0_w - OutC0BitsfromInC0 );
    localparam OutC1BitsfromInC1  = ( InC1_w < OutC1_w ) ? InC1_w : OutC1_w;
    localparam signed OutC1Pad           = ( OutC1_w - OutC1BitsfromInC1 );
    localparam OutC2BitsfromInC2  = ( InC2_w < OutC2_w ) ? InC2_w : OutC2_w;
    localparam signed OutC2Pad           = ( OutC2_w - OutC2BitsfromInC2 );

    localparam OutC1BitsfromInC0  = ( InC0_w < OutC1_w ) ? InC0_w : OutC1_w;
    localparam OutC1PadG          = ( OutC1_w - OutC1BitsfromInC0 );
    localparam OutC2BitsfromInC0  = ( InC0_w < OutC2_w ) ? InC0_w : OutC2_w;
    localparam OutC2PadG          = ( OutC2_w - OutC2BitsfromInC0 );

    // In smaller than Out
    //                               Cx_w  OutCxBitfromInCx   OutCxPad
    // [ O7 O6 O5 O4 O3 O2 O1 O0 ]   8     4                  4
    // [ I3 I2 I1 I0 ]               4
    //

    // Out smaller than In
    //                               Cx_w  OutCxBitfromInCx   OutCxPad
    // [ O3 O2 O1 O0 ]               4     -4                 0
    // [ I7 I6 I5 I4 I3 I2 I1 I0 ]   8

    // wire [OutC0_w-1:0] c0;
    // wire [OutC1_w-1:0] c1;
    // wire [OutC2_w-1:0] c2;

    // initial begin
    //     $display( "    In  IS_w %-0d", `I_w(InIS) );
    //     $display( "    Out IS_w %-0d", `I_w(OutIS) );

    //     $display( "    C0 w %-0d", OutC0_w );
    //     $display( "    C1 w %-0d", OutC1_w );
    //     $display( "    C2 w %-0d", OutC2_w );
    //     $display( "    OutC0_m %-0d OutC0_l %-0d", OutC0_m, OutC0_l );
    //     $display( "    OutC1_m %-0d OutC1_l %-0d", OutC1_m, OutC1_l );
    //     $display( "    OutC2_m %-0d OutC2_l %-0d", OutC2_m, OutC2_l );
    // end

    always @(image_in) begin

        if ( InFormat == `IS_FORMAT_GRAYSCALE ) begin
            if ( OutFormat == `IS_FORMAT_RGB ) begin
                image_out[ OutC0_m : OutC0_l ] = image_in[ InC0_m -: OutC0BitsfromInC0];
                image_out[ OutC1_m : OutC1_l ] = image_in[ InC0_m -: OutC1BitsfromInC0];
                image_out[ OutC2_m : OutC2_l ] = image_in[ InC0_m -: OutC2BitsfromInC0];
                if ( OutC0Pad > 0 )
                    image_out[ (OutC0_l-1) -: OutC0Pad ] = 1'B0;
                if ( OutC1PadG > 0 )
                    image_out[ (OutC1_l-1) -: OutC1PadG ] = 1'B0;
                if ( OutC2PadG > 0 )
                    image_out[ (OutC2_l-1) -: OutC2PadG ] = 1'B0;
            end else begin
                image_out[ OutC0_m : OutC0_l ] = 5'H0F;
                image_out[ OutC1_m : OutC1_l ] = 6'H1F;
                image_out[ OutC2_m : OutC2_l ] = 5'H0F;
            end
        end else begin
            if ( InFormat == `IS_FORMAT_RGB ) begin
                if ( OutFormat == `IS_FORMAT_RGB ) begin
                    image_out[ OutC0_m : OutC0_l ] = image_in[ InC0_m -: OutC0BitsfromInC0 ];
                    image_out[ OutC1_m : OutC1_l ] = image_in[ InC1_m -: OutC1BitsfromInC1 ];
                    image_out[ OutC2_m : OutC2_l ] = image_in[ InC2_m -: OutC2BitsfromInC2 ];
                    if ( OutC0Pad > 0 )
                        image_out[ (OutC0_l-1) -: OutC0Pad ] = 1'B0;
                    if ( OutC1Pad > 0 )
                        image_out[ (OutC1_l-1) -: OutC1Pad ] = 1'B0;
                    if ( OutC2Pad > 0 )
                        image_out[ (OutC2_l-1) -: OutC2Pad ] = 1'B0;
                end else begin
                    image_out[ OutC0_m : OutC0_l ] = 5'H0F;
                    image_out[ OutC1_m : OutC1_l ] = 6'H00;
                    image_out[ OutC2_m : OutC2_l ] = 5'H00;
                end
            end else begin
                image_out[ OutC0_m : OutC0_l ] = 5'H00;
                image_out[ OutC1_m : OutC1_l ] = 6'H00;
                image_out[ OutC2_m : OutC2_l ] = 5'H1F;
            end
        end

        // Wow.  A lot of trouble with this.

        // Icarus won't compile any of these assignments (no workaround other than commenting out the assignment)

        // Yosys doesn't seem to like the case statements.  ("If" above work)

        // image_out[ OutC0_m : OutC0_l ] = image_in[ InC0_m -: OutC0BitsfromInC0];
        // image_out[ OutC1_m : OutC1_l ] = image_in[ InC0_m -: OutC1BitsfromInC0];
        // image_out[ OutC2_m : OutC2_l ] = image_in[ InC0_m -: OutC2BitsfromInC0];
        // if ( OutC0Pad > 0 )
        //     image_out[ (OutC0_l-1) -: OutC0Pad ] = 0;
        // if ( OutC1PadG > 0 )
        //     image_out[ (OutC1_l-1) -: OutC1PadG ] = 0;
        // if ( OutC2PadG > 0 )
        //     image_out[ (OutC2_l-1) -: OutC2PadG ] = 0;

        // case ( InFormat )
        //     `IS_FORMAT_GRAYSCALE: begin
        //             case ( OutFormat )
        //                `IS_FORMAT_RGB: begin
        //                         image_out[ OutC0_m : OutC0_l ] = image_in[ InC0_m -: OutC0BitsfromInC0];
        //                         image_out[ OutC1_m : OutC1_l ] = image_in[ InC0_m -: OutC1BitsfromInC0];
        //                         image_out[ OutC2_m : OutC2_l ] = image_in[ InC0_m -: OutC2BitsfromInC0];
        //                         if ( OutC0Pad > 0 )
        //                             image_out[ (OutC0_l-1) -: OutC0Pad ] = 0;
        //                         if ( OutC1PadG > 0 )
        //                             image_out[ (OutC1_l-1) -: OutC1PadG ] = 0;
        //                         if ( OutC2PadG > 0 )
        //                             image_out[ (OutC2_l-1) -: OutC2PadG ] = 0;
        //                     end
        //                 default: begin
        //                         image_out[ OutC0_m : OutC0_l ] = 5'H0F;
        //                         image_out[ OutC1_m : OutC1_l ] = 6'H1F;
        //                         image_out[ OutC2_m : OutC2_l ] = 5'H0F;
        //                     end
        //             endcase
        //         end
        //     `IS_FORMAT_RGB: begin
        //             case ( OutFormat )
        //                 `IS_FORMAT_RGB: begin
        //                         image_out[ OutC0_m : OutC0_l ] = image_in[ InC0_m -: OutC0BitsfromInC0 ];
        //                         image_out[ OutC1_m : OutC1_l ] = image_in[ InC1_m -: OutC1BitsfromInC1 ];
        //                         image_out[ OutC2_m : OutC2_l ] = image_in[ InC2_m -: OutC2BitsfromInC2 ];
        //                         if ( OutC0Pad > 0 )
        //                             image_out[ (OutC0_l-1) -: OutC0Pad ] = 0;
        //                         if ( OutC1Pad > 0 )
        //                             image_out[ (OutC1_l-1) -: OutC1Pad ] = 0;
        //                         if ( OutC2Pad > 0 )
        //                             image_out[ (OutC2_l-1) -: OutC2Pad ] = 0;
        //                     end
        //                 default: begin
        //                         image_out[ OutC0_m : OutC0_l ] = 5'H0F;
        //                         image_out[ OutC1_m : OutC1_l ] = 6'H00;
        //                         image_out[ OutC2_m : OutC2_l ] = 5'H00;
        //                     end
        //             endcase
        //         end
        //     default: begin
        //             case ( OutFormat )
        //                 `IS_FORMAT_GRAYSCALE: begin
        //                         image_out[ OutC0_m : OutC0_l ] = 5'H00;
        //                         image_out[ OutC1_m : OutC1_l ] = 6'H05;
        //                         image_out[ OutC2_m : OutC2_l ] = 5'H00;
        //                     end
        //                 default: begin
        //                         image_out[ OutC0_m : OutC0_l ] = 5'H00;
        //                         image_out[ OutC1_m : OutC1_l ] = 6'H00;
        //                         image_out[ OutC2_m : OutC2_l ] = 5'H1F;
        //                     end
        //             endcase
        //         end
        // endcase

    end



endmodule