`timescale 1ns / 1ps

/*

Pipe Fifo

Regular FIFO.  There is a one clock delay from input to output in the case of an empty FIFO.

Pipe in and pipe out.  "In" and "Out" relative to the module.

Size is specified as a 2^MemoryWidth.  We need the size to be a power of two to use rollover
addressing.

Typical instanciations

Packed Pipeline interface

    wire [`P_m(PipeSpec):0] in;
    wire [`P_m(PipeSpec):0] out;

    pipe_fifo #(
            .PipeSpec( `PS_d8s ),
            .MemoryWidth( 4 )
        ) p_f_p (
            .clock( clock ),
            .reset( reset ),

            .pipe_in( pipe_in ),
            .pipe_out( pipe_out ),
        );

    pipeline_fifo p_f_p_( clock, reset, in, out ); // using defaults and positional parameters

Tested in pipeline_fifo_tb.v

Implemented and tested on iCE40

NOT Implemented and tested on Xilinx A7

*/

`include "../../pipe/rtl/pipe_defs.v"

module pipe_fifo #( parameter PipeSpec = `PS_d8s, parameter MemoryWidth = 3 ) (
        input clock,
        input reset,

        inout [`P_m(PipeSpec):0] pipe_in,
        inout [`P_m(PipeSpec):0] pipe_out
    );

    wire [`P_Payload_m(PipeSpec):0] in_payload;
    wire in_valid;
    wire in_ready;
    wire [`P_Payload_m(PipeSpec):0] out_payload;
    wire out_valid;
    wire out_ready;

    p_unpack_payload #( .PipeSpec(PipeSpec) ) p_up_p( .pipe(pipe_in), .payload(in_payload) );
    p_unpack_valid_ready #( .PipeSpec(PipeSpec) ) p_up_vr( .pipe(pipe_in), .valid(in_valid), .ready(in_ready) );
    p_pack_payload   #( .PipeSpec(PipeSpec) ) p_p_p( .payload(out_payload), .pipe(pipe_out) );
    p_pack_valid_ready  #( .PipeSpec(PipeSpec) ) p_p_vr( .valid(out_valid), .ready(out_ready), .pipe(pipe_out) );

    // Store the whole payload
    reg [`P_Payload_m(PipeSpec):0] memory [0:1<<MemoryWidth];

    // MemoryWidth + 1 (extra rX, wX, so read != write when full)
    reg [MemoryWidth:0] read_address;
    reg [MemoryWidth:0] write_address;

    // Are we ready? There's room if r != w or rX == wX
    assign in_ready = ( read_address[MemoryWidth] == write_address[MemoryWidth] ) ||
                      ( read_address[MemoryWidth-1:0] != write_address[MemoryWidth-1:0] );

    // Write logic
    always @(posedge clock) begin
        if ( reset ) begin
            write_address <= 0;
        end else begin
            if ( in_ready ) begin
                if ( in_valid ) begin
                    memory[ write_address[MemoryWidth-1:0] ] <= in_payload;
                    write_address <= write_address + 1;
                end
            end
        end
    end

    // Are we valid? (any time the whole read and write addresses are not exactly equal)
    assign out_valid = ( read_address != write_address );

    // Read logic
    always @(posedge clock) begin
        if ( reset ) begin
            read_address <= 0;
        end else begin
            if ( out_valid ) begin
                if ( out_ready ) begin
                    read_address <= read_address + 1;
                end
            end
        end
    end

    assign out_payload = ( out_valid ) ? memory[ read_address[MemoryWidth-1:0] ] : 0;

endmodule
