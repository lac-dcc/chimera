/*

Pipe FIFO

Testing

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../pipe/rtl/pipe_defs.v"

module pipe_fifo_tb();

    //parameter Output=`OutputDebug;
    parameter Output=`OutputInfo;
    //parameter Output=`OutputError;

    localparam PipeSpec = `PS_d8s;
    localparam MemoryWidth = 3;
    localparam MemorySize = 1 << MemoryWidth;

    `include "../sim/pipe_sim_tools.v"

    reg  reset;

    initial begin
      $dumpfile("pipe_fifo_tb.vcd");
      $dumpvars( 0, pipe_fifo_tb );
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    `AssertSetup

    wire [`P_m(PipeSpec):0] pipe_in;
    wire [`P_m(PipeSpec):0] pipe_out;

    pipe_fifo #( .PipeSpec( PipeSpec ), .MemoryWidth( MemoryWidth ) ) p_f (
        .clock( clock ),
        .reset( reset ),

        .pipe_in( pipe_in ),
        .pipe_out( pipe_out )
    );

    reg        in_start;
    reg        in_stop;
    reg [`P_Data_m(PipeSpec):0]  in_data;
    reg [`P_DataSize_w(PipeSpec)-1:0] in_datasize;
    reg        in_valid;
    wire       in_ready;

    wire       out_start;
    wire       out_stop;
    wire [`P_Data_m(PipeSpec):0] out_data;
    wire       out_valid;
    reg        out_ready;

    p_pack #( .PipeSpec(PipeSpec) ) in_pack( .start(in_start), .stop(in_stop), .data(in_data), .datasize( in_datasize ),.valid(in_valid), .ready(in_ready), .pipe(pipe_in) );
    p_unpack #( .PipeSpec(PipeSpec) ) out_unpack( .pipe(pipe_out), .start(out_start), .stop(out_stop), .data(out_data), .valid(out_valid), .ready(out_ready) );

    task pf_init;
        begin
            in_start = 0;
            in_stop = 0;
            in_data = 0;
            in_valid = 0;
            out_ready = 1;
        end
    endtask

    task  pf_clock;
        begin
            #2
            @( posedge clock );
            `Info( "            Clock");
            #2
            ;
        end
    endtask

    task  pf_reset;
        begin
            reset = 1;
            pf_clock;
            `Info( "    Reset");
            reset = 0;
            pf_clock;
        end
    endtask

    task pf_in( reg start_in, reg stop_in, reg [`P_Data_m(PipeSpec):0] data_in );
        begin
            in_start = start_in;
            in_stop = stop_in;
            in_data = data_in;
            in_valid = 1;

            `InfoDo $display( "        In:  %0x:%0x:%0x", start_in, stop_in, data_in );

            pf_clock;

            in_start = 0;
            in_stop = 0;
            in_data = 0;
            in_valid = 0;
        end
    endtask


    integer i, j, k;

    reg             start, start0;
    reg             stop, stop0;
    reg [`P_Data_m(PipeSpec):0] data, data0;

    reg [8*50:1] test_name;

    task pf_out( reg valid_out, reg start_out, reg stop_out, reg [`P_Data_m(PipeSpec):0] data_out );
        begin
            `InfoDo $display( "        Out: %0x:%0x:%0x (%0x)", out_start, out_stop, out_data, out_valid );
            `AssertEqual( out_valid, valid_out, test_name );
            `AssertEqual( out_start, start_out, test_name );
            `AssertEqual( out_stop, stop_out, test_name );
            `AssertEqual( out_data, data_out, test_name );
        end
    endtask

    task pf_check_initial_state;
        begin
            `Info( "Initial State" );
            test_name = "Initial State";

            `Assert( in_ready, test_name );

            `AssertPipeIdle( PipeSpec, pipe_out, test_name );
        end
    endtask

    task pf_single_stepping( reg pauses );
        begin
            `InfoDo $display( "Single Stepping Pauses = %0x", pauses );

            pf_check_initial_state;

            test_name = "Single Stepping";

            out_ready = 1;

            // just put one word in and take one out, but do it enough to
            // ensure wrapping a couple of times
            for ( i = 0; i < MemorySize * 3; i = i + 1 ) begin
                start = i % 2;
                stop = i % 3;
                data = i + 8'H10;
                pf_in( start, stop, data );

                // if so directed, pause for a little between the insertion and removal
                if ( pauses ) begin
                    out_ready = 0;
                    for ( j = 0; j < 4; j = j + 1 ) begin
                        `Info( "        Hold" );
                        pf_out( 1, start, stop, data );
                        pf_clock;
                    end
                    out_ready = 1;
                end

                pf_out( 1, start, stop, data );
            end

            pf_clock;
            pf_out( 0, 0, 0, 0 );

        end
    endtask

    task pf_partial_load( reg pauses );
        begin
            `InfoDo $display( "Partial Load Pauses = %0x", pauses );

            pf_check_initial_state;

            test_name = "Partial Load";

            // do this a few times to ensure both addresses wrap around
            for ( j = 0; j < 3; j = j + 1 ) begin
                `InfoDo $display( "    Filling %0d", j );

                out_ready = 0;

                // Add some words - no output
                start0 = 0;
                stop0 = 0;
                data0 = 8'H10 * j;
                for ( i = 0; i < 2 * MemorySize / 3; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    pf_in( start, stop, data );
                    pf_out( 1, start0, stop0, data0 );
                    if ( pauses ) begin
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Pause" );
                            pf_out( 1, start0, stop0, data0 );
                            pf_clock;
                        end
                    end
                end

                out_ready = 1;

                `InfoDo $display( "    Emptying %0d", j );

                // Get them all back
                for ( i = 0; i < 2 * MemorySize / 3; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    pf_out( 1, start, stop, data );
                    if ( pauses ) begin
                        out_ready = 0;
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Hold" );
                            pf_out( 1, start, stop, data );
                            pf_clock;
                        end
                        out_ready = 1;
                    end
                    pf_clock;

                                    // if so directed, pause for a little between the insertion and removal

                end

                pf_out( 0, 0, 0, 0 );
            end
        end
    endtask

    localparam FillExtra = 10;

    task pf_fill( reg pauses );
        begin
            `InfoDo $display( "Fill Pauses = %0x", pauses );

            pf_check_initial_state;

            test_name = "Fill";

            // do this a few times to ensure both addresses wrap around
            for ( j = 0; j < 3; j = j + 1 ) begin
                `InfoDo $display( "    Fill To Full %0d", j );

                out_ready = 0;

                // Add some words - no output
                start0 = 0;
                stop0 = 0;
                data0 = 8'H10 * j;
                for ( i = 0; i < MemorySize + FillExtra; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    pf_in( start, stop, data );
                    pf_out( 1, start0, stop0, data0 );
                    if ( i >= MemorySize ) begin
                        `Info( "        FULL" );
                        `Assert( ~in_ready, test_name );
                    end
                    if ( pauses ) begin
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Pause" );
                            pf_out( 1, start0, stop0, data0 );
                            pf_clock;
                        end
                    end
                end

                out_ready = 1;

                `InfoDo $display( "    Emptying %0d", j );

                // Get all the words back that fit
                for ( i = 0; i < MemorySize; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    pf_out( 1, start, stop, data );

                    if ( pauses ) begin
                        out_ready = 0;
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Hold" );
                            pf_out( 1, start, stop, data );
                            pf_clock;
                        end
                        out_ready = 1;
                    end

                    pf_clock;
                end

                // has to be empty after all that
                pf_out( 0, 0, 0, 0 );
            end
        end
    endtask

    initial begin
        $display( "\nPipeline FIFO Test %s", `__FILE__ );

        pf_init;
        pf_reset;

        pf_check_initial_state;

        pf_single_stepping( 0 );
        pf_single_stepping( 1 );

        pf_partial_load( 0 );
        pf_partial_load( 1 );

        pf_fill( 0 );
        pf_fill( 1 );

        `AssertSummary

        $finish;
    end



endmodule

