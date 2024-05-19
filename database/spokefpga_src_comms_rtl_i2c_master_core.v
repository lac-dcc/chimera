// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

`timescale 1ns / 100ps

/*

I2C Master Core

Overview

    Pipeline-based I2C Master.

    There are two and possibly three things that need to be specified:

    - slave address
    - operation
    - (if read) read count

    These can be specified in the pipe (ADDRESS + R/W, [COUNT], [DATA]) or elements can
    be specified separately via port.

    This is some FIDDLY code.  Don't modify unless you have the test bench on hand to check your work!!!

Timing

               _____              ___     ___     _       ___               ___     ___          ___         _____
    I2C Clock  _____\____________/   \___/   \___/  ...  /   \_____________/   \___/   \__ ... _/   \_______/_____

                                |-------| ClockCount

Invocation

    Usually you'll invoke the platform-wrapped version

    i2c_master_core #(
            .PipeSpec( PipeSpec ),
            .ClockCount( ClockCount )
        ) i2c_m(
            .clock( clock ),
            .reset( reset ),

            .slave_address( -1 ),
            .read_count( -1 ),
            .operation( -1 ),
            .start( 0 ),

            .complete( complete ),
            .error( error ),
            .write_count( write_count ),

            .pipe_in( pipe_in ),
            .pipe_out( pipe_out ),

            .scl_out( scl_out ),
            .scl_in( scl_in ),
            .sda_out( sda_out ),
            .sda_in( sda_in )
        );

To Do

    There is no proper accomodation of WRITE-READ operations with repeated stop.



Testing


*/

`include "../../pipe/rtl/pipe_defs.v"

module i2c_master_core #(
        parameter PipeSpec = `PS_d8,
        parameter ClockCount = 200
    ) (
        input clock,
        input reset,

        input [`P_Data_w(PipeSpec)-1:0]  slave_address,    // slave address, or -1 for in pipe (extra bit for the -1)
        input [`P_Data_w(PipeSpec):0]    read_count,       // read count, or -1 for in pipe (extra bit for the -1)
        input [2:0]                      operation,        // 0 write, 1 read, 2 write read, -1 in pipe (extra bit for the -1)
        input                            send_address,     // send the address out of the pipe_out
        input                            send_operation,   // send the operation out of the pipe_out
        input                            send_write_count, // send the write count out of the pipe_out

        input                            start_operation,       // start read operation (needed if everything else is spec'ed by port)

        output                           complete,         // operation is complete
        output                           error,            // operation error occurred
        output [`P_Data_w(PipeSpec)-1:0] write_count,      // write count

        inout [`P_w(PipeSpec)-1:0]       pipe_in,
        inout [`P_w(PipeSpec)-1:0]       pipe_out,

        output reg [0:0]                 scl_out,
        input                            scl_in,
        output reg [0:0]                 sda_out,
        input                            sda_in,

        output [7:0] debug
    );

    // `PS_MustHaveStartStop( PipeSpec );  // Weird error here means the supplied pipe doesn't have Start and Stop.  Sorry.
    // `PS_MustHaveData( PipeSpec );       // Weird error here means the supplied pipe doesn't have Data.  Sorry.

    localparam OperationWrite     =  0;
    localparam OperationRead      =  1;
    localparam OperationWriteRead =  2;
    localparam OperationInPipe    = -1;

    localparam ClockCountWidth = $clog2( ClockCount + 1 ) + 1;

    reg [ClockCountWidth:0] clock_counter;
    wire clock_counter_expired = clock_counter[ ClockCountWidth ];

    localparam DataWidth = `P_Data_w( PipeSpec );
    localparam AddressWidth = DataWidth - 1;

    localparam BitCounterWidth = $clog2( DataWidth + 1 ) + 1;
    reg [BitCounterWidth-1:0] bit_counter;
    wire bit_counter_expired = bit_counter[ BitCounterWidth -1 ];

    // slave address in pipe (-1)
    wire slave_address_in_pipe = slave_address[ AddressWidth ];

    // operation in pipe (-1)
    wire operation_in_pipe = operation[ 2 ];

    // operation in pipe (-1)
    wire read_count_in_pipe = read_count[ DataWidth ];

    //
    // Pipes
    //

    wire                 in_start;
    wire                 in_stop;
    wire [DataWidth-1:0] in_data;
    wire                 in_valid;
    wire in_ready;

    p_unpack_start_stop  #( .PipeSpec( PipeSpec ) ) p_up_ss( .pipe(pipe_in), .start( in_start), .stop( in_stop) );
    p_unpack_data        #( .PipeSpec( PipeSpec ) )  p_up_d( .pipe(pipe_in), .data( in_data) );
    p_unpack_valid_ready #( .PipeSpec( PipeSpec ) ) p_up_vr( .pipe(pipe_in), .valid( in_valid), .ready( in_ready) );

    wire                 out_start;
    wire                 out_stop;
    wire [DataWidth-1:0] out_data;
    wire                 out_valid;
    wire                 out_ready;

    p_pack_ssdvrp #( .PipeSpec( PipeSpec ) ) out_pack( .start(out_start), .stop(out_stop), .data(out_data), .valid(out_valid), .ready(out_ready), .pipe(pipe_out) );

    //
    // Internals
    //

    reg scl_in_1;
    reg sda_in_1;

    always @(posedge clock) begin

        scl_in_1 <= scl_in;
        sda_in_1 <= sda_in;

    end

    reg [DataWidth-1:0] transfer_word;

    // reg [OutCountWidth:0] out_count;

    localparam I2CM_IDLE =            0,
               I2CM_ADDRESS =         1,
               I2CM_OPERATION =       2,
               I2CM_COUNT =           3,
               I2CM_START_TRIGGER =   4,
               I2CM_START =           5,
               I2CM_BITS =            6,
               I2CM_CLOCK_UP =        7,
               I2CM_CLOCK_DOWN =      8,
               I2CM_ACK_BIT =         9,
               I2CM_ACK_CLOCK_UP =   10,
               I2CM_ACK_CLOCK_DOWN = 11,
               I2CM_NEXT =           12,
               I2CM_REPORT_A =       13,
               I2CM_REPORT_B =       14,
               I2CM_DRAIN =          15,
               I2CM_ENDING1 =        16,
               I2CM_ENDING2 =        17,
               I2CM_STOP =           18;

    reg [4:0] i2cm_state;

    localparam I2CM_FUNCTION_IDLE = 0,
               I2CM_FUNCTION_ADDRESS = 1,
               I2CM_FUNCTION_COUNT = 2,
               I2CM_FUNCTION_READING = 3,
               I2CM_FUNCTION_WRITING = 4;

    reg [2:0] i2cm_function;

    // For the frontend, states in which the module will consume incoming pipe data
    assign in_ready = ( i2cm_state == I2CM_ADDRESS ) ||
                      ( i2cm_state == I2CM_OPERATION ) ||
                      ( i2cm_state == I2CM_COUNT ) ||
                      ( ( i2cm_state == I2CM_NEXT ) && !in_start ) ||
                      ( i2cm_state == I2CM_DRAIN );

    reg i2cm_ack;
    reg i2cm_start_required;
    reg i2cm_stop;

    reg [DataWidth-1:0] i2cm_address;

    reg [DataWidth-1:0] i2cm_word_counter;
    reg [DataWidth-1:0] i2cm_read_count;

    reg [DataWidth-1:0] i2cm_write_count;

    reg                 i2cm_complete;
    reg                 i2cm_error;

    reg                 i2cm_out_start;
    reg                 i2cm_out_stop;
    reg [DataWidth-1:0] i2cm_out_data;
    reg                 i2cm_out_valid;
    wire                i2cm_out_ready;

    reg                 i2cm_read;

    // Is the backend ready?
    wire out_be_ready;

    always @(posedge clock) begin
        if ( reset ) begin
            clock_counter <= 0;
            scl_out <= 1;
            sda_out <= 1;
            i2cm_ack <= 0;
            i2cm_start_required <= 0;
            i2cm_stop <= 0;
            i2cm_state <= I2CM_IDLE;
            i2cm_function <= I2CM_FUNCTION_IDLE;
            i2cm_out_start <= 0;
            i2cm_out_stop <= 0;
            i2cm_out_data <= 0;
            i2cm_out_valid <= 0;
            i2cm_word_counter <= 0;
            i2cm_read_count <= 0;
            i2cm_read <= 0;
            i2cm_write_count <= 0;
            i2cm_complete <= 0;
            i2cm_error <= 0;
        end else begin
            case ( i2cm_state )
                I2CM_IDLE: begin // 0  - ouch these first few states could be more compact
                        if ( ( in_valid && in_start ) || start_operation ) begin
                            i2cm_complete <= 0;
                            i2cm_error <= 0;
                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                            i2cm_start_required <= 1;
                            i2cm_function <= I2CM_FUNCTION_ADDRESS;
                            if ( slave_address_in_pipe ) begin
                                // address will come from the pipe
                                i2cm_state <= I2CM_ADDRESS;
                            end else begin
                                i2cm_address <= slave_address[ DataWidth-2:0];
                                if ( operation_in_pipe ) begin
                                    // operation will come from the the pipe
                                    i2cm_state <= I2CM_OPERATION;
                                end else begin
                                    // operation is specified by port
                                    // Now we're in the slightly odd place that it must have
                                    // been some data or start operation that caused this operation
                                    if ( operation == OperationRead ) begin
                                        // the triggering data was a count.  Build the address with the operation
                                        transfer_word <= { slave_address[ DataWidth-2:0 ], 1'H1 };
                                        // we need a count before we can start
                                        i2cm_read <= 1;
                                        if ( read_count_in_pipe ) begin
                                            i2cm_state <= I2CM_COUNT;
                                        end else begin
                                            sda_out <= 0;
                                            i2cm_read_count <= read_count;
                                            i2cm_state <= I2CM_START;
                                            i2cm_stop <= 1;
                                        end
                                    end else begin
                                        // Write (or Write/Read)
                                        // the data will be the data that needs to be written
                                        // build the address byte
                                        transfer_word <= { slave_address[ DataWidth-2:0 ], 1'H0 };
                                        i2cm_state <= I2CM_START;
                                        i2cm_read <= 0;
                                        // this is it - start
                                        sda_out <= 0;
                                    end
                                end
                            end
                        end
                    end
                I2CM_ADDRESS: begin // 1
                        if ( in_valid && ( in_start == i2cm_start_required ) ) begin
                            // grab the data
                            if ( operation_in_pipe ) begin
                                // operation is in-pipe, address needs to move over
                                i2cm_address <= in_data[ DataWidth-1:1];
                                i2cm_read <= in_data[ 0 ];
                                transfer_word <= in_data;
                            end else begin
                                // operation is specified by port, address is not shifted
                                i2cm_address <= in_data[ DataWidth-2:0];
                                transfer_word <= { in_data[ DataWidth-2:0 ], (operation == OperationRead) };
                                i2cm_read <= (operation == OperationRead);
                            end

                            // signal START
                            sda_out <= 0;
                            i2cm_ack <= 0;

                            i2cm_start_required <= 0;

                            // READ = 1, WRITE = 0
                            if ( ( (operation_in_pipe) && in_data[ 0 ] ) || ( operation == OperationRead ) ) begin
                                // we need a count before we can start
                                if ( read_count_in_pipe ) begin
                                    i2cm_state <= I2CM_COUNT;
                                end else begin
                                    i2cm_read_count <= read_count;
                                    i2cm_state <= I2CM_START;
                                    i2cm_stop <= 1;
                                end
                            end else begin
                                // just start
                                i2cm_stop <= in_stop;
                                i2cm_state <= I2CM_START;
                            end
                        end
                    end
                I2CM_OPERATION: begin // 2
                        if ( in_valid && ( in_start == i2cm_start_required ) ) begin
                            i2cm_read <= in_data[ 0 ];
                            // signal START
                            sda_out <= 0;
                            i2cm_ack <= 0;
                            transfer_word <= { i2cm_address[ DataWidth-2:0 ], in_data[ 0 ] };

                            i2cm_start_required <= 0;

                            // READ = 1, WRITE = 0
                            if ( in_data[ 0 ] ) begin
                                if ( read_count_in_pipe ) begin
                                    i2cm_state <= I2CM_COUNT;
                                end else begin
                                    i2cm_read_count <= read_count;
                                    i2cm_state <= I2CM_START;
                                    i2cm_stop <= 1;
                                end
                            end else begin
                                // just start
                                i2cm_stop <= in_stop;
                                i2cm_state <= I2CM_START;
                            end
                        end
                    end
                I2CM_COUNT: begin // 3
                        if ( in_valid && ( in_start == i2cm_start_required ) ) begin
                            // grab the count - and store it -2 since we terminate when the count is -1
                            sda_out <= 0;
                            i2cm_read_count <= in_data;
                            i2cm_state <= I2CM_START;
                            i2cm_stop <= 1;
                        end
                    end
                // Not used.
                I2CM_START_TRIGGER: begin // 4
                        if ( start_operation )
                            i2cm_state <= I2CM_START;
                    end
                I2CM_START: begin // 5
                        // Sitting with clock untouched & data lowered until
                        if ( clock_counter_expired ) begin
                            if ( ~i2cm_read )
                                i2cm_write_count <= 0;
                            // end of start
                            scl_out <= 0;
                            i2cm_state <= I2CM_BITS;
                            bit_counter <= DataWidth - 2;  // DataWidth - 2 + 2;
                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_BITS: begin // 6
                        // make sure we're not sending
                        if ( i2cm_out_valid ) begin
                            i2cm_out_start <= 0;
                            i2cm_out_stop <= 0;
                            i2cm_out_data <= 0;
                            i2cm_out_valid <= 0;
                        end
                        // Sitting with the clock lowered waiting to set data up
                        if ( clock_counter_expired ) begin
                            // new data
                            // scl_out <= 0;
                            // If we're writing, we'll want to set the outgoing data up
                            if ( i2cm_function != I2CM_FUNCTION_READING ) begin
                                sda_out <= transfer_word[ DataWidth -1 ];
                                transfer_word <= { transfer_word, 1'H0 };
                            end else begin
                                sda_out <= 1;
                            end
                            i2cm_state <= I2CM_CLOCK_UP;
                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_CLOCK_UP: begin // 7
                        // sitting with the clock low and the data being set up
                        if ( clock_counter_expired ) begin
                            // clock the data in
                            scl_out <= 1;
                            // detect the stretch - will need a timeout here
                            if ( scl_in_1 == 1 ) begin
                                // Clock is definitely high again
                                if ( i2cm_function == I2CM_FUNCTION_READING ) begin
                                    // transfer_word <= { transfer_word[ DataWidth-2:0], bit_counter[ 0 ] };
                                    transfer_word <= { transfer_word[ DataWidth-2:0], sda_in_1 };
                                end
                                // This stretch detecter takes ONE clock
                                clock_counter <= ( ClockCount >> 1 ) - 'H3;
                                i2cm_state <= I2CM_CLOCK_DOWN;
                            end
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_CLOCK_DOWN: begin // 8
                        // sitting with the clock high and the data being valid
                        if ( clock_counter_expired ) begin
                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                            scl_out <= 0;
                            if ( bit_counter_expired ) begin
                                i2cm_state <= I2CM_ACK_BIT;
                            end else begin
                                i2cm_state <= I2CM_BITS;
                                bit_counter <= bit_counter - 1;
                            end
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_ACK_BIT: begin // 9
                        // sitting with clock down until time passes
                        // Prepare to read or write the ACK
                        if ( clock_counter_expired ) begin
                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                            if ( i2cm_function != I2CM_FUNCTION_READING ) begin
                                    sda_out <= 1;
                            end else begin
                                // about to WRITE an ACK.. unless it's the last byte
                                if ( i2cm_word_counter == ( i2cm_read_count - 1'H1 ) )
                                    sda_out <= 1;
                                else
                                    sda_out <= 0;
                            end
                            i2cm_state <= I2CM_ACK_CLOCK_UP;
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_ACK_CLOCK_UP: begin // 10
                        // sitting with the clock low and the data being set up
                        // read the ACK if appropriate
                        if ( clock_counter_expired ) begin
                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                            // clock the data in
                            scl_out <= 1;
                            // detect the stretch
                            if ( scl_in_1 == 1 ) begin
                                // Clock is definitely high again
                                if ( i2cm_function != I2CM_FUNCTION_READING ) begin
                                    // read the ack if we're writing or doing an address
                                    i2cm_ack <= ~sda_in_1;
                                end else begin
                                    // no line assertion
                                   //sda_out <= 1;
                                end
                                // don't hold data low it creates a STOP here
                                // sda_out <= 0;
                                // This stretch detecter takes ONE clock
                                clock_counter <= ( ClockCount >> 1 ) - 'H3;
                                i2cm_state <= I2CM_ACK_CLOCK_DOWN;
                            end
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_ACK_CLOCK_DOWN: begin // 11
                        // sitting with the clock high and the data being valid
                        if ( clock_counter_expired ) begin
                            // what to do
                            case ( i2cm_function )
                                I2CM_FUNCTION_ADDRESS: begin
                                        // drop the clock
                                        scl_out <= 0;

                                        i2cm_word_counter <= 0;
                                        clock_counter <= ( ClockCount >> 2 ) - 'H2;
                                        bit_counter <= DataWidth - 2;  // DataWidth - 2 + 1;
                                        if ( i2cm_ack ) begin
                                            // got an ACK
                                            if ( i2cm_read ) begin
                                                if ( out_be_ready ) begin
                                                    // got an ACK - a slave responded
                                                    if ( send_address || send_operation ) begin
                                                        i2cm_out_start <= 1;
                                                        i2cm_out_stop <= 0;
                                                        if ( send_address && send_operation )
                                                            i2cm_out_data <= { i2cm_address, 1'H1 };
                                                        else begin
                                                            if ( send_address )
                                                                i2cm_out_data <= { 1'H0, i2cm_address };
                                                            else
                                                                i2cm_out_data <= 1'H1;
                                                        end
                                                        i2cm_out_valid <= 1;
                                                    end
                                                    i2cm_state <= I2CM_BITS;
                                                    // don't change this until we're out of here since we're using it to "case" above
                                                    i2cm_function <= ( i2cm_read ) ? I2CM_FUNCTION_READING : I2CM_FUNCTION_WRITING;
                                                end
                                            end else begin
                                                    // don't change this until we're out of here since we're using it to "case" above
                                                i2cm_function <= ( i2cm_read ) ? I2CM_FUNCTION_READING : I2CM_FUNCTION_WRITING;
                                                i2cm_state <= I2CM_NEXT;
                                            end
                                        end else begin
                                            // no ACK... need to abort
                                            // don't change this until we're out of here since we're using it to "case" above
                                            i2cm_function <= ( i2cm_read ) ? I2CM_FUNCTION_READING : I2CM_FUNCTION_WRITING;
                                            i2cm_error <= 1;
                                            if ( i2cm_stop ) begin
                                                // was no other word - write status
                                                i2cm_state <= I2CM_REPORT_A;
                                            end else begin
                                                // more words - drain them
                                                i2cm_state <= I2CM_DRAIN;
                                            end
                                        end
                                    end
                                I2CM_FUNCTION_READING: begin
                                        // drop the clock
                                        scl_out <= 0;
                                        //if ( i2cm_ack ) begin
                                        if ( out_be_ready ) begin
                                            i2cm_out_start <= ( i2cm_word_counter == 0 ) && ~send_address && ~send_operation;
                                            i2cm_out_data <= transfer_word;
                                            i2cm_out_valid <= 1;
                                            i2cm_word_counter <= i2cm_word_counter + 1'H1;
                                            if ( i2cm_word_counter == ( i2cm_read_count - 1'H1 ) ) begin
                                                i2cm_out_stop <= 1;
                                                i2cm_complete <= 1;
                                                i2cm_state <= I2CM_ENDING1;
                                            end else begin
                                                i2cm_out_stop <= 0;
                                                transfer_word <= 0;
                                                i2cm_state <= I2CM_BITS;
                                            end
                                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                                            bit_counter <= DataWidth - 2;  // DataWidth - 2 + 1;

                                        end
                                        //end else begin
                                        //    i2cm_state <= I2CM_DRAIN;
                                        //end
                                    end
                                I2CM_FUNCTION_WRITING: begin
                                        bit_counter <= DataWidth - 2;  // DataWidth - 2 + 1;
                                        clock_counter <= ( ClockCount >> 2 ) - 'H2;
                                        scl_out <= 0;
                                        if ( i2cm_ack )
                                            i2cm_word_counter <= i2cm_word_counter + 1;
                                        else
                                            i2cm_error <= 1;
                                        // This is critical... no stop and the module just waits for the next character
                                        if ( i2cm_stop ) begin
                                            // the last word had a "stop" - the write is complete
                                            i2cm_state <= I2CM_REPORT_A;
                                            i2cm_complete <= 1;
                                        end else begin
                                            if ( ~i2cm_ack ) begin
                                                i2cm_error <= 1;
                                                i2cm_state <= I2CM_DRAIN;
                                            end else begin
                                                i2cm_state <= I2CM_NEXT;
                                            end
                                        end
                                    end
                            endcase
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_NEXT: begin // 12
                        // here is where we might detect a new operation...
                        // but this is ill conceived and really needs support from the operation field (WriteRead)
                        // So I'm removing the repeated start logic and the test cases that need it
                        if ( in_valid ) begin // || start_operation) begin
                            if ( in_start ) begin // || start_operation ) begin
                                // famous repeated start
                                // the front end doesn't grab the character if start is selected
                                // BUT may need to write out the write report
                                // sda_out <= 1;
                                i2cm_state <= I2CM_REPORT_A;
                                clock_counter <= ( ClockCount >> 2 ) - 'H3;
                            end else begin
                                scl_out <= 0;
                                transfer_word <= in_data;
                                i2cm_stop <= in_stop;
                                i2cm_state <= I2CM_BITS;
                                clock_counter <= ( ClockCount >> 2 ) - 'H3; // (one fewer clocks)
                            end
                        end
                    end
                I2CM_REPORT_A: begin // 13
                        // output the word count
                        i2cm_write_count <= i2cm_word_counter;
                        if ( out_be_ready ) begin
                            // We may need to send other stuff - like address, etc.
                            if ( send_address ) begin
                                if ( send_operation ) begin
                                    i2cm_out_data <= { i2cm_address, i2cm_read  };
                                end else begin
                                    i2cm_out_data <= { 1'H0, i2cm_address };
                                end
                                i2cm_out_start <= 1;
                                i2cm_out_valid <= 1;
                            end else begin
                                if ( send_operation ) begin
                                    i2cm_out_start <= 1;
                                    i2cm_out_data <= i2cm_read;
                                    i2cm_out_valid <= 1;
                                end
                            end
                            // only flag stop if we are not reading, or we are writing, but not sending a count
                            i2cm_out_stop = ( i2cm_read && i2cm_error ) || ( ~i2cm_read && ~send_write_count );
                            if ( i2cm_function == I2CM_FUNCTION_READING ) begin
                                // i2cm_out_stop <= 1;
                                i2cm_state <= I2CM_ENDING1;
                            end else begin
                                // i2cm_out_stop <= 0;
                                i2cm_state <= I2CM_REPORT_B;
                            end
                        end
                    end
                I2CM_REPORT_B: begin // 14
                        // complete the word count
                        if ( i2cm_out_valid ) begin
                            i2cm_out_start <= 0;
                            i2cm_out_stop <= 0;
                            i2cm_out_data <= 0;
                            i2cm_out_valid <= 0;
                        end else begin
                            if ( !send_write_count ) begin
                                i2cm_state <= I2CM_ENDING1;
                            end else begin
                                if ( out_be_ready ) begin
                                    i2cm_out_start <= ( ~send_address && ~send_operation );
                                    i2cm_out_data <= i2cm_word_counter;
                                    i2cm_out_valid <= 1;
                                    i2cm_out_stop <= 1;
                                    i2cm_state <= I2CM_ENDING1;
                                end
                            end
                        end
                    end
                I2CM_DRAIN: begin // 15
                        // grab any incoming characters until the stop.
                        if ( ~in_valid || ( in_valid && in_stop ) || i2cm_stop ) begin
                            i2cm_state <= I2CM_REPORT_A;
                        end
                    end
                I2CM_ENDING1: begin // 16
                        i2cm_function <= I2CM_FUNCTION_IDLE;
                        if ( i2cm_out_valid ) begin
                            i2cm_out_start <= 0;
                            i2cm_out_stop <= 0;
                            i2cm_out_data <= 0;
                            i2cm_out_valid <= 0;
                        end
                        // sitting with the clock low (?) and NO data begin set up
                        if ( clock_counter_expired ) begin
                            if ( ( in_valid && in_start ) ) // || start_operation )
                                sda_out <= 1;
                            else
                                sda_out <= 0;
                            i2cm_state <= I2CM_ENDING2;
                            clock_counter <= ( ClockCount >> 2 ) - 'H2;
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_ENDING2: begin // 17
                        // sitting with the clock low and NO data begin set up
                        if ( clock_counter_expired ) begin
                            scl_out <= 1;
                            if ( scl_in_1 ) begin
                                i2cm_state <= I2CM_STOP;
                                clock_counter <= ( ClockCount >> 2 ) - 'H2;
                            end
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                I2CM_STOP: begin // 18
                        if ( clock_counter_expired ) begin
                            sda_out <= 1;
                            i2cm_state <= I2CM_IDLE;
                        end else begin
                            clock_counter <= clock_counter - (clock_counter_expired ? 0 : 1 );
                        end
                    end
                default: begin
                        i2cm_state <= I2CM_IDLE;
                    end

            endcase

            // case ( master_state )
            // endcase
        end
    end

    localparam I2CM_BE_IDLE = 0,
               I2CM_BE_BUSY = 1;

    reg i2cm_be_state;

    reg                 i2cm_out_start_store;
    reg                 i2cm_out_stop_store;
    reg [DataWidth-1:0] i2cm_out_data_store;
    reg                 i2cm_out_valid_store;

    always @( posedge clock ) begin
        if ( reset ) begin
            i2cm_be_state <= I2CM_BE_IDLE;
            i2cm_out_start_store <= 0;
            i2cm_out_stop_store <= 0;
            i2cm_out_data_store <= 0;
            i2cm_out_valid_store <= 0;
        end else begin
            case ( i2cm_be_state )
                I2CM_BE_IDLE: begin
                        if ( i2cm_out_valid ) begin
                            i2cm_out_start_store <= i2cm_out_start;
                            i2cm_out_stop_store <= i2cm_out_stop;
                            i2cm_out_data_store <= i2cm_out_data;
                            i2cm_out_valid_store <= 1;
                            i2cm_be_state <= I2CM_BE_BUSY;
                        end
                    end
                I2CM_BE_BUSY: begin
                        if ( out_ready ) begin
                            i2cm_out_start_store <= 0;
                            i2cm_out_stop_store <= 0;
                            i2cm_out_data_store <= 0;
                            i2cm_out_valid_store <= 0;
                            i2cm_be_state <= I2CM_BE_IDLE;
                        end
                    end
            endcase
        end
    end

    assign out_start = i2cm_out_start_store;
    assign out_stop = i2cm_out_stop_store;
    assign out_data = i2cm_out_data_store;
    assign out_valid = i2cm_out_valid_store;

    assign out_be_ready = ( i2cm_be_state == I2CM_BE_IDLE );

    assign write_count = i2cm_write_count;
    assign complete = i2cm_complete;
    assign error = i2cm_error;

    assign debug[3:0] = i2cm_state;

endmodule

