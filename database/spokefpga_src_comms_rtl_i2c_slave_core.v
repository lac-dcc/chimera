// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

`timescale 1ns / 100ps

/*

I2C Slave Core

    Pipeline-based I2C Slave.

    This is some FIDDLY code.  Don't modify unless you have the test bench on hand to check your work!!!

Invocation

    Mostly you'll use the platform adjusting wrappers.

    i2c_slave_core #(
            .PipeSpec( PipeSpec ),
            .Address( Address )
        ) i2c_s(
            .clock( clock ),
            .reset( reset ),

            .pipe_in( pipe_in ),
            .pipe_out( pipe_out ),

            .scl( scl ),
            .sda_transmit( sda_transmit ),
            .sda( sda_out ),
            .sda( sda_in )
        );

Dependencies

    pipe/rtl/pipe_defs.v
    pipe/rtl/pipe_utils.v

Testing

    Tested in i2c_master_slave_ic.v

*/

`include "../../pipe/rtl/pipe_defs.v"

module i2c_slave_core #(
        parameter Address = 7'H50,
        parameter PipeSpec = `PS_d8
    ) (
        input clock,
        input reset,

        inout [`P_w(PipeSpec)-1:0]   pipe_in,
        inout [`P_w(PipeSpec)-1:0]   pipe_out,

        output reg [0:0]           scl_out,
        output                     scl_in,
        output reg [0:0]           sda_out,
        input                      sda_in,

        output [7:0] debug
    );

    // `PS_MustHaveStartStop( PipeSpec );
    // `PS_MustHaveData( PipeSpec );

    localparam DataWidth = `P_Data_w( PipeSpec );
    localparam AddressWidth = DataWidth - 1;

    wire                 in_start;
    wire                 in_stop;
    wire [DataWidth-1:0] in_data;
    wire                 in_valid;
    wire                 in_ready;

    p_unpack_start_stop  #( .PipeSpec( PipeSpec ) ) p_up_ss( .pipe(pipe_in), .start( in_start), .stop( in_stop) );
    p_unpack_data        #( .PipeSpec( PipeSpec ) )  p_up_d( .pipe(pipe_in), .data( in_data) );
    p_unpack_valid_ready #( .PipeSpec( PipeSpec ) ) p_up_vr( .pipe(pipe_in), .valid( in_valid), .ready( in_ready) );

    wire                 out_start;
    wire                 out_stop;
    wire [DataWidth-1:0] out_data;
    wire                 out_valid;
    wire                 out_ready;

    p_pack_ssdvrp #( .PipeSpec( PipeSpec ) ) out_pack( .start(out_start), .stop(out_stop), .data(out_data), .valid(out_valid), .ready(out_ready), .pipe(pipe_out) );

    integer i;

    localparam I2CS_IDLE = 0,
               I2CS_START = 1,
               I2CS_TRANSFER_A = 2,
               I2CS_TRANSFER_B = 3,
               I2CS_TRANSFER_ACK_A = 4,
               I2CS_TRANSFER_ACK_B = 5,
               I2CS_NEXT = 6,
               I2CS_FINAL_OUT = 7,
               I2CS_FINAL_OUT_DONE = 8,
               I2CS_STOP = 9;

    reg [3:0] i2cs_state;

    localparam I2CS_FUNCTION_IDLE = 0,
               I2CS_FUNCTION_ADDRESS = 1,
               I2CS_FUNCTION_READING = 2,
               I2CS_FUNCTION_WRITING = 3;

    reg [1:0] i2cs_function;
    reg       i2cs_address_match;

    reg [DataWidth-1:0] transfer_register;

    localparam BitCounterWidth = $clog2( DataWidth + 1 ) + 1;
    reg [BitCounterWidth-1:0] bit_counter;
    wire bit_counter_expired = bit_counter[ BitCounterWidth -1 ];

    reg [DataWidth-1:0] transfer;

    // reg [OutCountWidth:0] out_count;

    // assign in_ready = ( i2cs_state == IDLE );

    reg i2cs_scl_in_prev;
    reg i2cs_sda_in_prev;

    // Output registers
    reg                 i2cs_out_start;
    reg                 i2cs_out_stop;
    reg [DataWidth-1:0] i2cs_out_data;
    reg                 i2cs_out_valid;
    wire                i2cs_out_ready;
    reg                 i2cs_ack;
    reg                 i2cs_started;

    wire out_be_ready;

    reg                 i2cs_out_first;

    assign in_ready = ( i2cs_state == I2CS_NEXT );

    always @(posedge clock) begin
        if ( reset ) begin
            i2cs_out_start <= 0;
            i2cs_out_stop <= 0;
            i2cs_out_data <= 0;
            i2cs_out_valid <= 0;
            scl_out <= 1;
            sda_out <= 1;
            i2cs_scl_in_prev <= 1;
            i2cs_sda_in_prev <= 1;
            i2cs_state <= I2CS_IDLE;
            i2cs_function <= I2CS_FUNCTION_IDLE;
            i2cs_address_match <= 0;
            i2cs_out_first <= 1;
            i2cs_ack <= 0;
            i2cs_started <= 0;
        end else begin
            i2cs_sda_in_prev <= sda_in;
            i2cs_scl_in_prev <= scl_in;
            case ( i2cs_state )
                I2CS_IDLE: begin
                        // start is when data drops while clock is high
                        if ( ~sda_in && i2cs_sda_in_prev &&
                              scl_in && i2cs_scl_in_prev  ) begin
                            i2cs_state <= I2CS_START;
                        end
                    end
                I2CS_START: begin
                        if ( ~sda_in && ~scl_in  ) begin
                            i2cs_state <= I2CS_TRANSFER_A;
                            bit_counter <= DataWidth - 2;
                            transfer <= 0;
                            i2cs_out_first <= 1;
                            i2cs_function <= I2CS_FUNCTION_ADDRESS;
                        end
                    end
                I2CS_TRANSFER_A: begin // 2
                        if ( i2cs_out_valid ) begin
                            i2cs_out_start <= 0;
                            i2cs_out_start <= 0;
                            i2cs_out_data <= 0;
                            i2cs_out_valid <= 0;
                        end

                        // if ( scl_in && i2cs_scl_in_prev ) begin
                        //     // stop is when data goes up when clock is high
                        //     if (  sda_in && ~i2cs_sda_in_prev ) begin
                        //         i2cs_state <= I2CS_IDLE;
                        //     end
                        // end

                        if ( scl_in ) begin
                            if ( i2cs_function != I2CS_FUNCTION_READING )
                                transfer <= { transfer[DataWidth-2:0], sda_in };
                            i2cs_state <= I2CS_TRANSFER_B;
                        end
                    end
                I2CS_TRANSFER_B: begin // 3
                        // here's where a STOP OR REPEATED START could happen
                        if ( scl_in && i2cs_scl_in_prev ) begin

                            // check for start - might be another start
                            if ( ~sda_in && i2cs_sda_in_prev ) begin
                                i2cs_started <= 1;
                                if ( i2cs_function == I2CS_FUNCTION_WRITING ) begin
                                    i2cs_state <= I2CS_FINAL_OUT;
                                end else begin
                                    // i2cs_state <= I2CS_START;
                                    i2cs_state <= I2CS_TRANSFER_A;
                                    bit_counter <= DataWidth - 2;
                                    transfer <= 0;
                                    i2cs_out_first <= 1;
                                    i2cs_function <= I2CS_FUNCTION_ADDRESS;
                                end
                            end else begin
                                // stop is when data goes up when clock is high
                                if ( ( sda_in && ~i2cs_sda_in_prev ) ) begin
                                    i2cs_started <= 0;
                                    if ( i2cs_function == I2CS_FUNCTION_WRITING ) begin
                                        i2cs_state <= I2CS_FINAL_OUT;
                                    end else begin
                                        i2cs_state <= I2CS_IDLE;
                                    end
                                end
                            end
                        end else begin
                            if ( ~scl_in ) begin
                                if ( bit_counter_expired ) begin
                                    case ( i2cs_function )
                                        I2CS_FUNCTION_ADDRESS: begin
                                                if ( transfer[ DataWidth-1:1] == Address ) begin
                                                    i2cs_address_match <= 1;
                                                    sda_out <= 0;
                                                end else begin
                                                    i2cs_address_match <= 0;
                                                    sda_out <= 1;
                                                end
                                            end
                                        I2CS_FUNCTION_WRITING: begin
                                                sda_out <= 0;
                                            end
                                        I2CS_FUNCTION_READING: begin
                                                sda_out <= 1;
                                            end
                                    endcase
                                    i2cs_state <= I2CS_TRANSFER_ACK_A;
                                end else begin
                                    bit_counter <= bit_counter - 1;
                                    i2cs_state <= I2CS_TRANSFER_A;
                                    if ( i2cs_function == I2CS_FUNCTION_READING ) begin
                                        sda_out <= transfer_register[ DataWidth-1 ];
                                        transfer_register <= { transfer_register[ DataWidth-2:0 ], 1'H0 };
                                    end
                                end
                            end
                        end
                    end
                I2CS_TRANSFER_ACK_A: begin // 4
                        // wait for clock UP
                        if ( scl_in ) begin
                            i2cs_state <= I2CS_TRANSFER_ACK_B;
                            if ( i2cs_function == I2CS_FUNCTION_READING )
                                i2cs_ack = ~sda_in;
                        end
                    end
                I2CS_TRANSFER_ACK_B: begin // 5
                        // wait for clock DOWN
                        if ( ~scl_in ) begin
                            // release the ack pulse on data
                            sda_out <= 1;
                            case ( i2cs_function )
                                I2CS_FUNCTION_ADDRESS: begin
                                        if ( i2cs_address_match ) begin
                                            i2cs_function <= ( transfer[ 0 ] ? I2CS_FUNCTION_READING : I2CS_FUNCTION_WRITING );
                                            if ( transfer[ 0 ] ) begin
                                                // stomp on the clock in case there's no data ready
                                                //scl_out <= 0;
                                                i2cs_state <= I2CS_NEXT;
                                            end else begin
                                                bit_counter <= DataWidth - 2;
                                                i2cs_state <= I2CS_TRANSFER_A;
                                            end
                                        end else begin
                                            // no match - wait for the bus to be idle
                                            i2cs_state <= I2CS_STOP;
                                        end
                                    end
                                I2CS_FUNCTION_READING: begin
                                        if ( i2cs_ack ) begin
                                            i2cs_state <= I2CS_NEXT;
                                            // drop that clock!  We might not have data yet
                                            //scl_out <= 0;
                                        end else begin
                                            i2cs_state <= I2CS_IDLE;
                                        end
                                    end
                                I2CS_FUNCTION_WRITING: begin
                                        if ( out_be_ready ) begin
                                            bit_counter <= DataWidth - 2;
                                            // write out... hold clock down if not ready
                                            // scl_out <= 0;
                                            i2cs_state <= I2CS_TRANSFER_A;
                                            scl_out <= 1;

                                            // release the ACK line
                                            sda_out <= 1;

                                            i2cs_out_start <= i2cs_out_first;
                                            i2cs_out_stop <= 0;
                                            i2cs_out_data <= transfer;
                                            i2cs_out_valid <= 1;

                                            i2cs_out_first <= 0;
                                        end else begin
                                            // hold the clock.  This is a big deal.  It could block the whole system.
                                            // Obviously there should be a timeout.
                                            scl_out <= 0;
                                        end
                                    end
                            endcase
                        end
                    end
                I2CS_NEXT: begin // 6
                        if ( scl_in && i2cs_scl_in_prev ) begin
                            // stop is when data goes up when clock is high
                            if (  sda_in && ~i2cs_sda_in_prev ) begin
                                    i2cs_state <= I2CS_IDLE;
                            end
                        end else begin
                            // check for start first time around
                            if ( in_valid && ( in_start || ~i2cs_out_first ) ) begin
                                scl_out <= 1;
                                transfer_register <= { in_data[ DataWidth-2:0 ], 1'H0 };
                                sda_out <= in_data[ DataWidth-1 ];
                                i2cs_out_first <= 0;
                                bit_counter <= DataWidth - 2;
                                i2cs_state <= I2CS_TRANSFER_A;
                            end
                        end
                    end
                I2CS_FINAL_OUT: begin // 7
                        if ( out_be_ready ) begin
                            i2cs_out_start <= i2cs_out_first;
                            i2cs_out_stop <= 1;
                            i2cs_out_data <= 0;
                            i2cs_out_valid <= 1;
                            i2cs_state <= I2CS_FINAL_OUT_DONE;
                        end
                    end
                I2CS_FINAL_OUT_DONE: begin // 8
                        i2cs_out_start <= 0;
                        i2cs_out_stop <= 0;
                        i2cs_out_data <= 0;
                        i2cs_out_valid <= 0;
                        if ( i2cs_started ) begin
                            i2cs_started <= 0;
                            if ( scl_in )
                                i2cs_state <= I2CS_START;
                            else begin
                                i2cs_state <= I2CS_TRANSFER_A;
                                bit_counter <= DataWidth - 2;
                                transfer <= 0;
                                i2cs_out_first <= 1;
                                i2cs_function <= I2CS_FUNCTION_ADDRESS;
                            end
                        end else
                            i2cs_state <= I2CS_IDLE;
                    end
                I2CS_STOP: begin
                        // confirm clock is high for either stop or repeated start
                        if ( scl_in && i2cs_scl_in_prev ) begin
                            // stop is when data goes up when clock is high
                            if (  sda_in && ~i2cs_sda_in_prev ) begin
                                i2cs_state <= I2CS_IDLE;
                            end
                            // repeated start is when data drops while clock is high
                            if ( ~sda_in && i2cs_sda_in_prev ) begin
                                i2cs_state <= I2CS_START;
                            end
                        end
                    end
            endcase
        end
    end

    localparam I2CS_BE_IDLE = 0,
               I2CS_BE_BUSY = 1;

    reg i2cs_be_state;

    reg                 i2cs_out_start_store;
    reg                 i2cs_out_stop_store;
    reg [DataWidth-1:0] i2cs_out_data_store;
    reg                 i2cs_out_valid_store;

    always @( posedge clock ) begin
        if ( reset ) begin
            i2cs_be_state <= I2CS_BE_IDLE;
            i2cs_out_start_store <= 0;
            i2cs_out_stop_store <= 0;
            i2cs_out_data_store <= 0;
            i2cs_out_valid_store <= 0;
        end else begin
            case ( i2cs_be_state )
                I2CS_BE_IDLE: begin
                        if ( i2cs_out_valid ) begin
                            i2cs_out_start_store <= i2cs_out_start;
                            i2cs_out_stop_store <= i2cs_out_stop;
                            i2cs_out_data_store <= i2cs_out_data;
                            i2cs_out_valid_store <= 1;
                            i2cs_be_state <= I2CS_BE_BUSY;
                        end
                    end
                I2CS_BE_BUSY: begin
                        if ( out_ready ) begin
                            i2cs_out_start_store <= 0;
                            i2cs_out_stop_store <= 0;
                            i2cs_out_data_store <= 0;
                            i2cs_out_valid_store <= 0;
                            i2cs_be_state <= I2CS_BE_IDLE;
                        end
                    end
            endcase
        end
    end

    assign out_start = i2cs_out_start_store;
    assign out_stop = i2cs_out_stop_store;
    assign out_data = i2cs_out_data_store;
    assign out_valid = i2cs_out_valid_store;

    assign out_be_ready = ( i2cs_be_state == I2CS_BE_IDLE );

    assign debug[7:4] = i2cs_state;

endmodule

