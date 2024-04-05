/*

Pipe FrontEnd



Testing

    The Greedy flag was added late.  It is not tested here.

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../pipe/rtl/pipe_defs.v"

module pipe_frontend_tb();

    parameter Output=`OutputDebug;
    // parameter Output=`OutputInfo;
    // parameter Output=`OutputError;

    localparam Pipe_Data_w = 8;

    localparam PipeSpec = Pipe_Data_w | `PS_START_STOP;

    localparam Pipe_w = `P_w(PipeSpec);

    `include "../sim/pipe_sim_tools.v"

    reg  reset;

    initial begin
      $dumpfile("pipe_frontend_tb.vcd");
      $dumpvars( 1, pipe_frontend_tb );
      $dumpvars( 1, p_fe );
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    `AssertSetup

    wire [Pipe_w-1:0] pipe_in;

    wire                    in_start;
    wire                    in_stop;
    wire [Pipe_Data_w-1:0]  in_data;
    wire                    in_valid;
    reg                     in_ready;

    pipe_frontend #(
            .PipeSpec( PipeSpec )
    ) p_fe (
            .clock( clock ),
            .reset( reset ),

            .pipe_in( pipe_in ),

            .in_start( in_start),
            .in_stop( in_stop),
            .in_data( in_data),
            .in_valid( in_valid),
            .in_ready( in_ready )
        );

    reg        pipe_in_start;
    reg        pipe_in_stop;
    reg [Pipe_Data_w-1:0]  pipe_in_data;
    reg        pipe_in_valid;
    wire       pipe_in_ready;

    p_pack_start_stop   #( .PipeSpec( PipeSpec ) )  p_pp_ss( .start(pipe_in_start), .stop(pipe_in_stop), .pipe(pipe_in) );
    p_pack_data         #( .PipeSpec( PipeSpec ) )   p_pp_d( .data(pipe_in_data), .pipe(pipe_in) );
    p_pack_valid_ready  #( .PipeSpec( PipeSpec ) )  p_pp_vr( .valid(pipe_in_valid), .ready(pipe_in_ready), .pipe(pipe_in) );

    task pfe_init;
        begin
            pipe_in_start = 0;
            pipe_in_stop = 0;
            pipe_in_data = 0;
            pipe_in_valid = 0;
            in_ready = 0;
        end
    endtask

    task  pfe_clock;
        begin
            #2
            @( posedge clock );
            `Info( "            Clock");
            #2
            ;
        end
    endtask

    task  pfe_miniclock;
        begin
            #100
            `Info( "            Mini Clock");
            #100
            ;
        end
    endtask

    task  pfe_reset;
        begin
            reset = 1;
            pfe_clock;
            `Info( "    Reset");
            reset = 0;
            pfe_clock;
        end
    endtask

    task pfe_in( input reg valid_in, input reg start_in, input reg stop_in, input reg [`P_Data_w( PipeSpec )-1:0] data_in );
        begin
            pipe_in_start = start_in;
            pipe_in_stop = stop_in;
            pipe_in_data = data_in;

            pipe_in_valid = valid_in;

            `InfoDo $display( "        In:          %0x:%0x:%2x:%0x:%0x", start_in, stop_in, data_in, valid_in, pipe_in_ready );
        end
    endtask

    task pfe_out( input reg valid_out, input reg start_out, input reg stop_out, input reg [`P_Data_w( PipeSpec )-1:0] data_out );
        begin
            `InfoDo $display( "        Out:                     %0x:%0x:%2x:%0x:%0x", in_start, in_stop, in_data, in_valid, in_ready );
            `AssertEqual( in_valid, valid_out, test_name );
            `AssertEqual( in_start, start_out, test_name );
            `AssertEqual( in_stop, stop_out, test_name );
            `AssertEqual( in_data, data_out, test_name );
        end
    endtask

    integer i, j, k;

    reg [8*50:1] test_name;

    task pfe_check_initial_state;
        begin
            `Info( "Initial State" );
            test_name = "Initial State";

            `Assert( !in_ready, test_name );

            `Assert( !in_valid, test_name );
        end
    endtask

    initial begin
        $display( "\nPipeline Frontend Test %s", `__FILE__ );

        pfe_init;
        pfe_reset;

        pfe_check_initial_state;

        pfe_clock;

        // make sure the front end is ready
        in_ready = 1;

        pfe_clock;

            test_name = "Regular pass through";

            `InfoDo $display( "    %-s", test_name );

            pfe_in( 1, 0, 0, 8'H55 );

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'H55 );

        pfe_clock;

            test_name = "Nothing";

            `InfoDo $display( "    %-s", test_name );

            pfe_in( 0, 0, 0, 0 );

            pfe_miniclock;

            pfe_out( 0, 0, 0, 0 );

        pfe_clock;

            test_name = "Ready Indecision";

            `InfoDo $display( "    %-s", test_name );

            in_ready = 1;

            pfe_in( 1, 0, 0, 8'H45 );

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'H45 );

            in_ready = 0;

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'H45 );

        pfe_clock;

            test_name = "From memory";

            `InfoDo $display( "    %-s", test_name );

            pfe_in( 0, 0, 0, 0 );

            pfe_out( 1, 0, 0, 8'H45 );

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'H45 );

        pfe_clock;

            test_name = "More Ready Indecision";

            `InfoDo $display( "    %-s", test_name );

            in_ready = 1;

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'H45 );

            in_ready = 0;

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'H45 );

        pfe_clock;

            test_name = "Interim Acceptance";

            `InfoDo $display( "    %-s", test_name );

            in_ready = 1;

            pfe_miniclock;

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'H45 );

        pfe_clock;

            test_name = "Interim Acceptance";

            pfe_miniclock;

            pfe_out( 0, 0, 0, 0 );

        pfe_clock;

            test_name = "Valid Indecision";

            `InfoDo $display( "    %-s", test_name );

            in_ready = 1;

            pfe_in( 1, 0, 0, 8'HAA );

            pfe_miniclock;

            pfe_out( 1, 0, 0, 8'HAA );

            pfe_in( 0, 0, 0, 8'HAA );

            pfe_miniclock;

            pfe_out( 0, 0, 0, 8'HAA );

            pfe_in( 0, 0, 0, 0 );

            pfe_miniclock;

            pfe_out( 0, 0, 0, 0 );

            pfe_in( 1, 0, 0, 8'H0A );

        pfe_clock;

            test_name = "More Ready Indecision";

            `InfoDo $display( "    %-s", test_name );

            pfe_out( 1, 0, 0, 8'H0A );

            in_ready = 0;

            pfe_miniclock;

            in_ready = 1;

            pfe_miniclock;

        pfe_clock;
        pfe_clock;

/*

*/
        `AssertSummary

        $finish;
    end

endmodule

