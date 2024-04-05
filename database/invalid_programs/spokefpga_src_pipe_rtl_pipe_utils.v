`timescale 1ns / 100ps

/*

Pipe Utils

PipeSpec

- p_pack
- p_unpack
- p_pack_payload
- p_unpack_payload

- assume all payloads must start in bit position 0
- assume all data fields must start in bit position 0

Packing Templates

    p_unpack_payload #( .PipeSpec( PipeSpec ) ) p_upp( .pipe(pipe_in), .payload(in_payload), .valid(in_valid), .ready(in_ready) );
    p_pack_payload #( .PipeSpec( PipeSpec ) )   p_pp( .payload(out_payload), .valid(out_valid), .ready(out_ready), .pipe(pipe_out) );

    p_pack #( .PipeSpec( PipeSpec ) ) in_pack( .start(in_start), .stop(in_stop), .data(in_data), .valid(in_valid), .ready(in_ready), .pipe(pipe_in) );
    p_unpack #( .PipeSpec( PipeSpec ) ) out_unpack( .pipe(pipe_out), .start(out_start), .stop(out_stop), .data(out_data), .valid(out_valid), .ready(out_ready) );

Module Template

    wire [ `P_m( `PS_def ):0] pipe_in;
    wire [ `P_m( `PS_def ):0] pipe_out;

    pipe_m #( .PipeSpec( PipeSpec ) ) p_m (
        .clock( clock ),
        .reset( reset ),

        .pipe_in( pipe_in ),
        .pipe_out( pipe_out )
    );

    reg        in_start;
    reg        in_stop;
    reg [`P_Data_m(PipeSpec):0]  in_data;
    reg        in_valid;
    wire       in_ready;

    wire       out_start;
    wire       out_stop;
    wire [`P_Data_m(PipeSpec):0] out_data;
    wire       out_valid;
    reg        out_ready;

    p_pack #( .PipeSpec(PipeSpec) ) in_pack( .start(in_start), .stop(in_stop), .data(in_data), .valid(in_valid), .ready(in_ready), .pipe(pipe_in) );
    p_unpack #( .PipeSpec(PipeSpec) ) out_unpack( .pipe(pipe_out), .start(out_start), .stop(out_stop), .data(out_data), .valid(out_valid), .ready(out_ready) );

    // or

    wire [`P_Payload_m(PipeSpec):0] in_payload;
    wire in_valid;
    wire in_ready;
    wire [`P_Payload_m(PipeSpec):0] out_payload;
    wire out_valid;
    wire out_ready;

    p_unpack_payload #( .PipeSpec(PipeSpec) ) p_upp( .pipe(pipe_in), .payload(in_payload), .valid(in_valid), .ready(in_ready) );
    p_pack_payload   #( .PipeSpec(PipeSpec) ) p_pp( .payload(out_payload), .valid(out_valid), .ready(out_ready), .pipe(pipe_out) );

    ...

*/


// bring in the pipe predefinitions - valid from anywhere!
`include "../../pipe/rtl/pipe_defs.v"

//
// Pack and Unpack the whole Payload
//

module p_pack_payload #( parameter PipeSpec = `PS_def ) (
        input [`P_Payload_w(PipeSpec)-1:0] payload,
        inout [`P_m(PipeSpec):0]   pipe
    );

    assign pipe[`P_Payload_m(PipeSpec):0] = payload;

endmodule

module p_unpack_payload #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]       pipe,
        output [`P_Payload_w(PipeSpec)-1:0] payload
    );

    assign payload  = pipe[`P_Payload_m(PipeSpec):0];

endmodule

//
// Pack and Unpack Valid & Ready
//

module p_pack_valid_ready #( parameter PipeSpec = `PS_def ) (
        input                    valid,
        output                   ready,
        inout [`P_m(PipeSpec):0] pipe
    );

    assign pipe[ `P_Valid_b(PipeSpec) ] = valid;
    assign ready = pipe[ `P_Ready_b(PipeSpec) ];

endmodule

module p_pack_valid #( parameter PipeSpec = `PS_def ) (
        input                    valid,
        inout [`P_m(PipeSpec):0] pipe
    );

    assign pipe[ `P_Valid_b(PipeSpec) ] = valid;

endmodule

module p_unpack_valid_ready #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        output                   valid,
        input                    ready
    );

    assign valid = pipe[ `P_Valid_b(PipeSpec) ];
    assign pipe[ `P_Ready_b(PipeSpec) ] = ready;

endmodule

module p_monitor_valid_ready #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        output                   valid,
        output                    ready
    );

    assign valid = pipe[ `P_Valid_b(PipeSpec) ];
    assign ready = pipe[ `P_Ready_b(PipeSpec) ];

endmodule

//
// Pack and Unpack Start and Stop
//

module p_pack_start_stop #( parameter PipeSpec = `PS_def ) (
        input                    start,
        input                    stop,
        inout [`P_m(PipeSpec):0] pipe
    );

    generate
        if ( `P_Start_w( PipeSpec ) )
            assign pipe[ `P_Start_b(PipeSpec) ] = start;
        if ( `P_Stop_w( PipeSpec ) )
            assign pipe[ `P_Stop_b(PipeSpec) ]  = stop;
    endgenerate

endmodule

module p_unpack_start_stop #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        output                   start,
        output                   stop
    );

    generate
        if ( `P_Start_w( PipeSpec ) )
            assign start = pipe[ `P_Start_b(PipeSpec) ];
        else
            assign start = 1'B0;
        if ( `P_Stop_w( PipeSpec ) )
            assign stop  = pipe[ `P_Stop_b(PipeSpec) ];
        else
            assign stop = 1'B0;
    endgenerate

endmodule

//
// Pack and Unpack Data
//

module p_pack_data #( parameter PipeSpec = `PS_def ) (
        input [`P_Data_w(PipeSpec)-1:0] data,
        inout [`P_m(PipeSpec):0]      pipe
    );

    generate
        if ( `P_Data_w( PipeSpec ) )
            assign pipe[ `P_Data_m(PipeSpec):`P_Data_l(PipeSpec) ] = data;
    endgenerate

endmodule

module p_unpack_data #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]       pipe,
        output [`P_Data_w(PipeSpec)-1:0] data
    );

    generate
        if ( `P_Data_w( PipeSpec ) )
            assign data  = pipe[ `P_Data_m(PipeSpec):`P_Data_l(PipeSpec) ];
    endgenerate

endmodule

//
// Pack and Unpack Data Size
//

module p_pack_data_size #( parameter PipeSpec = `PS_def ) (
        input [`P_DataSize_w(PipeSpec)-1:0] data_size,
        inout [`P_m(PipeSpec):0]          pipe
    );

    generate
        if ( `P_DataSize_w( PipeSpec ) )
            assign pipe[`P_DataSize_m(PipeSpec):`P_DataSize_l(PipeSpec)] = data_size;
    endgenerate

endmodule

module p_unpack_data_size #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]          pipe,
        output [`P_DataSize_w(PipeSpec)-1:0] data_size
    );

    generate
        if ( `P_DataSize_w( PipeSpec ) )
            assign data_size = pipe[`P_DataSize_m(PipeSpec):`P_DataSize_l(PipeSpec)];
        else
            assign data_size = 0;
    endgenerate

endmodule

//
// Reverse Pipeline
//

//
// Pack and Unpack Reverse Valid & Ready
//

module p_pack_rev_valid_ready #( parameter PipeSpec = `PS_def ) (
        output                   rev_valid,
        input                    rev_ready,
        inout [`P_m(PipeSpec):0] pipe
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        assign rev_valid = pipe[ `P_RevValid_l(PipeSpec) ];
        assign pipe[ `P_RevReady_l(PipeSpec) ] = rev_ready;
    end

endmodule

module p_pack_rev_ready #( parameter PipeSpec = `PS_def ) (
        input                    rev_ready,
        inout [`P_m(PipeSpec):0] pipe
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        assign pipe[ `P_RevReady_l(PipeSpec) ] = rev_ready;
    end

endmodule

module p_unpack_rev_valid_ready #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        input                    rev_valid,
        output                   rev_ready
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        assign pipe[ `P_RevValid_l(PipeSpec) ] = rev_valid;
        assign rev_ready = pipe[ `P_RevReady_l(PipeSpec) ];
    end

endmodule

module p_monitor_rev_valid_ready #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        output                   rev_valid,
        output                   rev_ready
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        assign rev_valid = pipe[ `P_RevValid_l(PipeSpec) ];
        assign rev_ready = pipe[ `P_RevReady_l(PipeSpec) ];
    end

endmodule

//
// Pack and Unpack Reverse Start & Stop
//

module p_pack_rev_start_stop #( parameter PipeSpec = `PS_def ) (
        output                   rev_start,
        output                   rev_stop,
        inout [`P_m(PipeSpec):0] pipe
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevStart_w( PipeSpec ) )
            assign rev_start = pipe[ `P_RevStart_l(PipeSpec) ];
        if ( `P_Stop_w( PipeSpec ) )
            assign rev_stop  = pipe[ `P_RevStop_l(PipeSpec) ];
    end

endmodule

module p_unpack_rev_start_stop #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        input                    rev_start,
        input                    rev_stop
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevStart_w( PipeSpec ) )
            assign pipe[ `P_RevStart_l(PipeSpec) ] = rev_start;
        if ( `P_RevStop_w( PipeSpec ) )
            assign pipe[ `P_RevStop_l(PipeSpec) ]  = rev_stop;
    end

endmodule

module p_monitor_rev_start_stop #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        output                   rev_start,
        output                   rev_stop
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevStart_w( PipeSpec ) )
            assign rev_start = pipe[ `P_RevStart_l(PipeSpec) ];
        if ( `P_Stop_w( PipeSpec ) )
            assign rev_stop  = pipe[ `P_RevStop_l(PipeSpec) ];
    end

endmodule

//
// Pack and Unpack Reverse Data
//

module p_pack_rev_data #( parameter PipeSpec = `PS_def ) (
        output [`P_RevData_w(PipeSpec)-1:0] rev_data,
        inout [`P_m(PipeSpec):0]      pipe
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevData_w( PipeSpec ) )
            assign rev_data  = pipe[ `P_RevData_m(PipeSpec):`P_RevData_l(PipeSpec) ];
    end

endmodule

module p_unpack_rev_data #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]       pipe,
        input [`P_RevData_w(PipeSpec)-1:0] rev_data
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevData_w( PipeSpec ) )
            assign pipe[ `P_RevData_m(PipeSpec):`P_RevData_l(PipeSpec) ] = rev_data;
    end

endmodule

module p_monitor_rev_data #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]            pipe,
        output [`P_RevData_w(PipeSpec)-1:0] rev_data
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevData_w( PipeSpec ) )
            assign rev_data  = pipe[ `P_RevData_m(PipeSpec):`P_RevData_l(PipeSpec) ];
    end

endmodule

//
// Pack and Unpack Reverse Data Size
//

module p_pack_rev_data_size #( parameter PipeSpec = `PS_def ) (
        output [`P_RevDataSize_w(PipeSpec)-1:0] rev_data_size,
        inout [`P_m(PipeSpec):0]          pipe
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevDataSize_w( PipeSpec ) )
            assign rev_data_size = pipe[`P_RevDataSize_m(PipeSpec):`P_RevDataSize_l(PipeSpec)];
        else
            assign rev_data_size = 0;
    end

endmodule

module p_unpack_rev_data_size #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]            pipe,
        input [`P_RevDataSize_w(PipeSpec)-1:0] rev_data_size
    );

    if ( `PS_Reverse_v( PipeSpec ) ) begin
        if ( `P_RevDataSize_w( PipeSpec ) )
            assign pipe[`P_RevDataSize_m(PipeSpec):`P_RevDataSize_l(PipeSpec)] = rev_data_size;
    end

endmodule

//
// Pack and Unpack Command
//

module p_pack_command #( parameter PipeSpec = `PS_def ) (
        input [`P_Command_w(PipeSpec)-1:0] command,
        inout [`P_m(PipeSpec):0]      pipe
    );

    generate
        if ( `P_Command_w( PipeSpec ) )
            assign pipe[ `P_Command_m(PipeSpec):`P_Command_l(PipeSpec) ] = command;
    endgenerate

endmodule

module p_unpack_command #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]       pipe,
        output [`P_Command_w(PipeSpec)-1:0] command
    );

    generate
        if ( `P_Command_w( PipeSpec ) )
            assign command  = pipe[ `P_Command_m(PipeSpec):`P_Command_l(PipeSpec) ];
    endgenerate

endmodule

//
// Pack and Unpack Result
//

module p_pack_result #( parameter PipeSpec = `PS_def ) (
        output [`P_Result_w(PipeSpec)-1:0] result,
        inout [`P_m(PipeSpec):0]      pipe
    );

    generate
        if ( `P_Result_w( PipeSpec ) )
            assign result  = pipe[ `P_Result_m(PipeSpec):`P_Result_l(PipeSpec) ];
    endgenerate

endmodule

module p_unpack_result #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]       pipe,
        input [`P_Result_w(PipeSpec)-1:0] result
    );

    generate
        if ( `P_Result_w( PipeSpec ) )
            assign pipe[ `P_Result_m(PipeSpec):`P_Result_l(PipeSpec) ] = result;
    endgenerate

endmodule

module p_monitor_result #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]      pipe,
        output [`P_Result_w(PipeSpec)-1:0] result
    );

    generate
        if ( `P_Result_w( PipeSpec ) )
            assign result  = pipe[ `P_Result_m(PipeSpec):`P_Result_l(PipeSpec) ];
    endgenerate

endmodule

//
// Pack and Unpack Request
//

module p_pack_request #( parameter PipeSpec = `PS_def ) (
        output [`P_Request_w(PipeSpec)-1:0] request,
        inout [`P_m(PipeSpec):0]      pipe
    );

    generate
        if ( `P_Request_w( PipeSpec ) )
            assign request  = pipe[ `P_Request_m(PipeSpec):`P_Request_l(PipeSpec) ];
    endgenerate

endmodule

module p_unpack_request #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0]       pipe,
        input [`P_Request_w(PipeSpec)-1:0] request
    );

    generate
        if ( `P_Request_w( PipeSpec ) )
            assign pipe[ `P_Request_m(PipeSpec):`P_Request_l(PipeSpec) ] = request;
    endgenerate

endmodule

//
// Misc Pipe Helpers
//

module p_info #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe,
        output             start,
        output             stop,
        output [`P_Data_m(PipeSpec):0] data,
        output             valid,
        output             ready
    );
    generate
        if ( `P_Start_w( PipeSpec ) )
            assign start = pipe[ `P_Start_b(PipeSpec) ];
        else
            assign start = 0;
        if ( `P_Stop_w( PipeSpec ) )
            assign stop  = pipe[ `P_Stop_b(PipeSpec) ];
        else
            assign stop = 0;
    endgenerate

    assign data  = pipe[ `P_Data_m(PipeSpec):`P_Data_l(PipeSpec) ];
    assign valid = pipe[ `P_Valid_b(PipeSpec) ];
    assign ready = pipe[ `P_Ready_b(PipeSpec) ];

endmodule

module p_specs #( parameter PipeDataWidth = 8 );


endmodule

//
//  Start Stop Data Valid Ready Pack and Unpackers
//

module p_pack_ssdvrp #( parameter PipeSpec = `PS_def ) (
        input                               start,
        input                               stop,
        input [`P_Data_w(PipeSpec)-1:0]     data,
        input                               valid,
        output                              ready,

        inout [`P_w(PipeSpec)-1:0]          pipe
    );

    generate
        if ( `P_Start_w( PipeSpec ) )
            assign pipe[ `P_Start_b(PipeSpec) ] = start;
        if ( `P_Stop_w( PipeSpec ) )
            assign pipe[ `P_Stop_b(PipeSpec) ]  = stop;
    endgenerate

    assign pipe[ `P_Data_w(PipeSpec)-1:`P_Data_l(PipeSpec) ] = data;
    assign pipe[ `P_Valid_b(PipeSpec) ] = valid;
    assign ready = pipe[ `P_Ready_b(PipeSpec) ];

endmodule

module p_unpack_pssdvr #( parameter PipeSpec = `PS_def ) (
        inout [`P_w(PipeSpec)-1:0]           pipe,

        output                               start,
        output                               stop,
        output [`P_Data_w(PipeSpec)-1:0]     data,
        output                               valid,
        input                                ready
    );

    generate
        if ( `P_Start_w( PipeSpec ) )
            assign start = pipe[ `P_Start_b(PipeSpec) ];
        if ( `P_Stop_w( PipeSpec ) )
            assign stop  = pipe[ `P_Stop_b(PipeSpec) ];
    endgenerate

    assign data  = pipe[ `P_Data_m(PipeSpec):`P_Data_l(PipeSpec) ];
    assign valid = pipe[ `P_Valid_b(PipeSpec) ];
    assign pipe[ `P_Ready_b(PipeSpec) ] = ready;

endmodule

//
// Data Valid Ready Pack and Unpackers
//

module p_pack_dvr #( parameter PipeSpec = `PS_def ) (
        input [`P_Data_w(PipeSpec)-1:0]     data,
        input                               valid,
        output                              ready,

        inout [`P_w(PipeSpec)-1:0]          pipe
    );

    assign pipe[ `P_Data_w(PipeSpec)-1:`P_Data_l(PipeSpec) ] = data;
    assign pipe[ `P_Valid_b(PipeSpec) ] = valid;
    assign ready = pipe[ `P_Ready_b(PipeSpec) ];

endmodule

module p_unpack_dvr #( parameter PipeSpec = `PS_def ) (
        inout [`P_w(PipeSpec)-1:0]           pipe,

        output [`P_Data_w(PipeSpec)-1:0]     data,
        output                               valid,
        input                                ready
    );

    assign data  = pipe[ `P_Data_m(PipeSpec):`P_Data_l(PipeSpec) ];
    assign valid = pipe[ `P_Valid_b(PipeSpec) ];
    assign pipe[ `P_Ready_b(PipeSpec) ] = ready;

endmodule



// These big OMNI pack and unpack modules are good for unpacking everything

module p_pack #( parameter PipeSpec = `PS_def ) (
        input                               start,
        input                               stop,
        input [`P_Data_w(PipeSpec)-1:0]     data,
        input [`P_DataSize_w(PipeSpec)-1:0] datasize,
        input                               valid,
        output                              ready,

        inout [`P_w(PipeSpec)-1:0]            pipe
    );

    generate
        if ( `P_Start_w( PipeSpec ) )
            assign pipe[ `P_Start_b(PipeSpec) ] = start;
        if ( `P_Stop_w( PipeSpec ) )
            assign pipe[ `P_Stop_b(PipeSpec) ]  = stop;
    endgenerate

    generate
        if ( `P_DataSize_w( PipeSpec ) )
            assign pipe[ `P_DataSize_m(PipeSpec):`P_DataSize_l(PipeSpec) ] = datasize;
    endgenerate

    assign pipe[ `P_Data_m(PipeSpec):`P_Data_l(PipeSpec) ] = data;
    assign pipe[ `P_Valid_b(PipeSpec) ] = valid;
    assign ready = pipe[ `P_Ready_b(PipeSpec) ];

endmodule

module p_unpack #( parameter PipeSpec = `PS_def ) (
        inout [`P_w(PipeSpec)-1:0]           pipe,

        output                               start,
        output                               stop,
        output [`P_Data_w(PipeSpec)-1:0]     data,
        output [`P_DataSize_w(PipeSpec)-1:0] datasize,
        output                               valid,
        input                                ready
    );

    generate
        if ( `P_Start_w( PipeSpec ) )
            assign start = pipe[ `P_Start_b(PipeSpec) ];
        if ( `P_Stop_w( PipeSpec ) )
            assign stop  = pipe[ `P_Stop_b(PipeSpec) ];
    endgenerate

    generate
        if ( `P_DataSize_w( PipeSpec ) )
            assign datasize = pipe[ `P_DataSize_m(PipeSpec):`P_DataSize_l(PipeSpec) ];
    endgenerate

    assign data  = pipe[ `P_Data_m(PipeSpec):`P_Data_l(PipeSpec) ];
    assign valid = pipe[ `P_Valid_b(PipeSpec) ];
    assign pipe[ `P_Ready_b(PipeSpec) ] = ready;

endmodule

//
//  Pipe Null Source - just sits there
//

// A null source - valid = 0, data = 0, start = 0, stop = 0

module p_null_source #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe_out
    );

    // doing nothing
    assign pipe_out[`P_Payload_m(PipeSpec):0] = 0;
    assign pipe_out[`P_Valid_b(PipeSpec)] = 0;

endmodule

//
// Pipe Null Sink - takes all input
//

module p_null_sink #( parameter PipeSpec = `PS_def ) (
        inout [`P_m(PipeSpec):0] pipe_in
    );

    // receiving everything
    assign pipe_in[ `P_Ready_b(PipeSpec) ] = 1;

endmodule

//
// Pipe 2 Data - takes a pipe and latches data
//

// Takes a pipe and latches it's data out whenever a new word is accepted
module p_pipe2data #( parameter PipeSpec = `PS_def ) (
        input clock,
        input reset,

        inout [`P_m(PipeSpec):0] pipe,

        output [`P_Data_m(PipeSpec):0] data,
        output data_valid
    );

    wire [`P_Data_m(PipeSpec):0] in_data;
    wire in_valid;
    reg  in_ready;

    p_unpack_valid_ready #( .PipeSpec(PipeSpec) ) p_u_v( pipe, in_valid, in_ready );
    p_unpack_data #( .PipeSpec(PipeSpec) ) p_u_d( pipe, in_data  );

    reg [`P_Data_m(PipeSpec):0] p2d_data;
    reg                         p2d_data_valid;

    always @(posedge clock) begin
        if ( reset ) begin
            p2d_data <= 0;
            p2d_data_valid <= 0;
            in_ready <= 1;
        end else begin
            if ( in_valid ) begin
                p2d_data <= in_data;
                p2d_data_valid <= 1;
            end
        end
    end

    assign data = p2d_data;
    assign data_valid = p2d_data_valid;

endmodule

//
// Data 2 Pipe - sends data on pipe when either a) asked to (data_valid) or b) data valid and the data changes
//


// Takes data and data_valid and sends new values on the pipe whenever those values are marked valid

/*

    wire [`P_m(PipeSpec):0] pipe;

    reg [`P_Data_m(PipeSpec):0] data_in;
    reg                         data_in_valid;

    p_data2pipe #(
            .PipeSpec( PipeSpec )
    ) p_d2p (
            .clock( clock ),
            .reset( reset ),

            .data( data_in ),
            .data_valid( data_in_valid ),

            .pipe( pipe )
        );

    Tested in pipe_data2pipe_tb
    Tested in iCE40

*/

module p_data2pipe #( parameter PipeSpec = `PS_def ) (
        input clock,
        input reset,

        input send,

        input [`P_Data_m(PipeSpec):0] data,
        input data_valid,

        inout [`P_m(PipeSpec):0] pipe
    );

    reg [`P_Data_m(PipeSpec):0] out_data;
    reg out_valid;
    wire out_ready;
    reg out_start;
    reg out_stop;

    reg send_previous;

    p_pack_valid_ready #( .PipeSpec(PipeSpec) ) p_p_v( out_valid, out_ready, pipe );
    p_pack_data #( .PipeSpec(PipeSpec) ) p_p_d( out_data, pipe );
    p_pack_start_stop #( .PipeSpec(PipeSpec) ) p_p_ss( out_start, out_stop, pipe );

    reg [`P_Data_m(PipeSpec):0] transferred_data;
    reg transferred_any;

    always @(posedge clock) begin
        if ( reset ) begin
            out_data <= 0;
            out_valid <= 0;
            out_start <= 0;
            out_stop <= 0;
            transferred_data <= 0;
            transferred_any <= 0;
            send_previous <= 0;
        end else begin
            send_previous <= send;
            if ( out_valid && out_ready ) begin
                transferred_data <= out_data;
                if ( data_valid && (( data != out_data ) || ( send && ~send_previous ) ) ) begin
                    out_data <= data;
                end else begin
                    out_data <= 0;
                    out_valid <= 0;
                    out_start <= 0;
                    out_stop <= 0;
                end
            end else begin
                if ( data_valid ) begin
                    if ( ( data != transferred_data ) || !transferred_any ||  ( send && ~send_previous ) ) begin
                        transferred_any <= 1;
                        out_start <= 1;
                        out_stop <= 1;
                        out_data <= data;
                        out_valid <= 1;
                    end else begin
                        out_start <= 0;
                        out_stop <= 0;
                        out_data <= 0;
                        out_valid <= 0;
                    end
                end
            end
        end
    end

endmodule

