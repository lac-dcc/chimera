`timescale 1ns / 1ps

/*

Image Fifo

    There is a one clock delay from input to output in the case of an empty FIFO.

    Image In and Image Out.  "In" and "Out" relative to the module.

    Image spec in and image spec out need to have the same data size.

    Size is specified as a 2^MemoryWidth.  We need the size to be a power of two to use rollover
    addressing.

    Also handles all the image signals that don't want to be FIFO'ed

    Does filter spurious signals by ensisting that all messages are bracketed by START and
    STOP signals.

    If the module encounters an `out_cancel`, it resets the module (dumping whatever's in the buffer)

Typical instanciations

    wire [`I_w(ImageSpec)-1:0] in;
    wire [`I_m(ImageSpec)-1:0] out;

    image_fifo #(
            .ImageSpec( `IS_d8s ),
            .MemoryWidth( 4 )
        ) p_f_p (
            .clock( clock ),
            .reset( reset ),

            .pipe_in( pipe_in ),
            .pipe_out( pipe_out ),
        );

    image_fifo i_f( clock, reset, in, out ); // using defaults and positional parameters

Tested in image_fifo_tb.v

    NOT Implemented and tested on iCE40

    NOT Implemented and tested on Xilinx A7

    Implemented and tested on ECP5 (Hackaday Badge)

*/

`include "../../image/rtl/image_defs.v"

module image_fifo #(
        parameter InIS = `IS_DEFAULT,
        parameter OutIS = `IS_DEFAULT,
        parameter MemoryWidth = 8
    ) (
        input clock,
        input reset,

        inout [`I_w(InIS)-1:0]  image_in,
        inout [`I_w(OutIS)-1:0] image_out
    );

    localparam ImagePayload_w = `I_Payload_w( InIS );

    // Image In Signals

    wire image_in_valid;
    wire image_in_ready;
    wire image_in_error;
    reg  image_in_request;
    reg  image_in_cancel;

    wire [ImagePayload_w-1:0] image_in_payload;

    assign `I_Ready(   InIS, image_in ) = image_in_ready;
    assign `I_Request( InIS, image_in ) = image_in_request;
    assign `I_Cancel(  InIS, image_in ) = image_in_cancel;

    assign image_in_valid   = `I_Valid( InIS, image_in );
    assign image_in_payload = `I_Payload( InIS, image_in );
    assign image_in_error   = `I_Error( InIS, image_in );

    // Image Out Signals

    wire image_out_valid;
    wire image_out_ready;
    wire image_out_request;
    wire image_out_cancel;
    reg  image_out_error;

    wire [ImagePayload_w-1:0] image_out_payload;

    assign `I_Valid( OutIS, image_out ) = image_out_valid;
    assign image_out_ready = `I_Ready( OutIS, image_out );
    assign image_out_request = `I_Request( OutIS, image_out );
    assign image_out_cancel = `I_Cancel( OutIS, image_out );
    assign `I_Payload( OutIS, image_out ) = image_out_payload;
    assign `I_Error( OutIS, image_out ) = image_out_error;

    //
    // Main Logic
    //

    // Store the whole payload (payload is the same In and Out
    reg [ImagePayload_w-1:0] memory [0:(1<<MemoryWidth)-1];

    // MemoryWidth + 1 (so read != write when full - nice trick!)
    reg [MemoryWidth:0] read_address;
    reg [MemoryWidth:0] write_address;

    // Are we ready? There's room if r != w or rX == wX
    assign image_in_ready = ( read_address[MemoryWidth] == write_address[MemoryWidth] ) ||
                            ( read_address[MemoryWidth-1:0] != write_address[MemoryWidth-1:0] );

    // Write logic
    always @(posedge clock) begin
        if ( reset || image_in_cancel ) begin
            write_address <= 0;
        end else begin
            if ( image_in_ready ) begin
                if ( image_in_valid ) begin
                    memory[ write_address[MemoryWidth-1:0] ] <= image_in_payload;
                    write_address <= write_address + 1;
                end
            end
        end
    end

    // Are we valid? (any time the whole read and write addresses are not exactly equal)
    assign image_out_valid = ( read_address != write_address );

    // Read logic
    always @(posedge clock) begin
        if ( reset || image_in_cancel ) begin
            read_address <= 0;
        end else begin
            if ( image_out_valid ) begin
                if ( image_out_ready ) begin
                    read_address <= read_address + 1;
                end
            end
        end
    end

    assign image_out_payload = ( image_out_valid ) ? memory[ read_address[MemoryWidth-1:0] ] : 0;

    always @( clock ) begin
        if ( reset ) begin
            image_in_request <= 0;
            image_in_cancel  <= 0;
            image_out_error  <= 0;
        end else begin
            image_in_request <= image_out_request;
            image_in_cancel  <= image_out_cancel;
            image_out_error  <= image_in_error;
        end
    end

endmodule
