`timescale 1ns / 1ps

/*

Pipe FrontEnd

Performs the handshaking, and unpacking for a pipeline-based module.

Simple pipelines only for now!

This is a partly combinatorial module.  All of start, stop, data, & valid are valid immediately unless the backend can't take the data.


Issues



Typical instanciations

    wire [`P_w(PipeSpec)-1:0] in;

    pf #(
            .PipeSpec( `PS_d8 ),
        ) p_fe (
            .clock( clock ),
            .reset( reset ),

            .pipe_in( pipe_in ),

            .in_start( in_start ),
            .in_stop( in_stop ),
            .in_data( in_data ),
            .in_valid( in_valid ),
            .in_ready( in_ready )
        );

Utilization

    Xilinx 7 - 28 LUTs


Testing

    (No TB testing has been done on !Geedy mode)

    Tested in pipe_frontend_tb.v

    Tested in iCE40 implementation

    Tested in Xilinx 7 implementation

*/

`include "../../pipe/rtl/pipe_defs.v"

module pipe_frontend #(
        parameter PipeSpec = `PS_d8,
        parameter Greedy = 1
    ) (
        input clock,
        input reset,

        inout [`P_w(PipeSpec)-1:0] pipe_in,

        output                           in_start,
        output                           in_stop,
        output [`P_Data_w(PipeSpec)-1:0] in_data,
        output                           in_valid,
        input                            in_ready
    );

    localparam Pipe_Data_w = `P_Data_w(PipeSpec);

    wire                   pipe_in_start;
    wire                   pipe_in_stop;
    wire [Pipe_Data_w-1:0] pipe_in_data;
    wire                   pipe_in_valid;
    reg                    pipe_in_ready;

    p_unpack_start_stop  #( .PipeSpec( PipeSpec ) ) p_up_ss( .pipe(pipe_in), .start(pipe_in_start), .stop(pipe_in_stop) );
    p_unpack_data        #( .PipeSpec( PipeSpec ) )  p_up_d( .pipe(pipe_in), .data(pipe_in_data) );
    p_unpack_valid_ready #( .PipeSpec( PipeSpec ) ) p_up_vr( .pipe(pipe_in), .valid(pipe_in_valid), .ready(pipe_in_ready) );

    localparam ESC_FRONTEND_STATE_STREAM    = 0,
               ESC_FRONTEND_STATE_STALL     = 1;

    reg pf_state;
    reg pf_state_next;

    reg                    pf_start_store;
    reg                    pf_stop_store;
    reg [Pipe_Data_w-1:0]  pf_data_store;
    reg                    pf_valid_store;

    reg                    pf_start_next;
    reg                    pf_stop_next;
    reg  [Pipe_Data_w-1:0] pf_data_next;
    reg                    pf_valid_next;

    reg                    pf_in_start;
    reg                    pf_in_stop;
    reg [Pipe_Data_w-1:0]  pf_in_data;
    reg                    pf_in_valid;

    // Front End
    //
    // State:
    //      Passing - signals passed directly to next stage, if not ready, save, next step stall
    //      Stall - stored signals passing to next state, if ready next state Passing

    // This always @(*) statement does all the work.  Mostly it passes state directly to the backend.
    // However, if there is a holdup in the backend, it will hold the current data, and
    // store any overun

    always @(*) begin
        // All the default behavior

        // next state is just the current state
        pf_state_next = pf_state;

        // backend gets the input directly
        pf_in_start = pipe_in_start;
        pf_in_stop = pipe_in_stop;
        pf_in_data = pipe_in_data;
        pf_in_valid = pipe_in_valid;

        // next frontend
        pf_start_next = pf_start_store;
        pf_stop_next = pf_stop_store;
        pf_data_next = pf_data_store;
        pf_valid_next = pf_valid_store;

        case ( pf_state )
            ESC_FRONTEND_STATE_STREAM: begin
                    // Flowing - in this state either the data gets passed through, or it gets remembered
                    if ( !in_ready && in_valid ) begin
                        // input is saved
                        pf_start_next = pipe_in_start;
                        pf_stop_next = pipe_in_stop;
                        pf_data_next = pipe_in_data;
                        pf_valid_next = pipe_in_valid;

                        pf_state_next = ESC_FRONTEND_STATE_STALL;
                    end
                end
            ESC_FRONTEND_STATE_STALL: begin
                    // current frontend output comes from storage
                    pf_in_start = pf_start_store;
                    pf_in_stop = pf_stop_store;
                    pf_in_data = pf_data_store;
                    pf_in_valid = pf_valid_store;

                    // If the backend can take the data
                    if ( in_ready ) begin
                        // wipe memory
                        pf_start_next = 0;
                        pf_stop_next = 0;
                        pf_data_next = 0;
                        pf_valid_next = 0;

                        pf_state_next = ESC_FRONTEND_STATE_STREAM;
                    end
                end
            default: begin
                    pf_state_next = ESC_FRONTEND_STATE_STREAM;
                end
        endcase
    end

    always @(posedge clock) begin
        if ( reset ) begin
            pf_state <= ESC_FRONTEND_STATE_STREAM;

            // clear the memory
            pf_start_store <= 0;
            pf_stop_store <= 0;
            pf_data_store <= 0;
            pf_valid_store <= 0;

            pipe_in_ready <= 0;
        end else begin
            pf_state <= pf_state_next;

            // update memory
            pf_start_store <= pf_start_next;
            pf_stop_store <= pf_stop_next;
            pf_data_store <= pf_data_next;
            pf_valid_store <= pf_valid_next;

            pipe_in_ready <= ( ( pf_state_next == ESC_FRONTEND_STATE_STREAM ) && in_ready );
        end
    end

    assign in_start = pf_in_start;
    assign in_stop = pf_in_stop;
    assign in_data = pf_in_data;
    assign in_valid = pf_in_valid;

endmodule
