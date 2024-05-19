// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*

Pipe FIFO

Testing

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../image/rtl/image_defs.v"

module image_fifo_tb();

    //parameter Output=`OutputDebug;
    parameter Output=`OutputInfo;
    //parameter Output=`OutputError;

    localparam [`IS_w-1:0] ImageSpec = `IS_DEFAULT;
    localparam ImageWidth = `I_w( ImageSpec );
    localparam ImageDataWidth = `I_Data_w( ImageSpec );
    localparam MemoryWidth = 3;
    localparam MemorySize = 1 << MemoryWidth;

    reg  reset;

    initial begin
      $dumpfile("image_fifo_tb.vcd");
      $dumpvars( 0, image_fifo_tb );
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    `AssertSetup

    wire [ImageWidth-1:0] image_in;
    wire [ImageWidth-1:0] image_out;

    image_fifo #( .InIS( ImageSpec ), .OutIS( ImageSpec ), .MemoryWidth( MemoryWidth ) ) i_f (
        .clock( clock ),
        .reset( reset ),

        .image_in( image_in ),
        .image_out( image_out )
    );


    reg                       image_in_start;
    reg                       image_in_stop;
    reg [ImageDataWidth-1:0]  image_in_data;
    reg                       image_in_valid;
    reg                       image_in_error;
    wire                      image_in_ready;
    wire                      image_in_request;
    wire                      image_in_cancel;

    assign     `I_Start( ImageSpec, image_in ) = image_in_start;
    assign     `I_Stop( ImageSpec, image_in ) = image_in_stop;
    assign     `I_Data( ImageSpec, image_in ) = image_in_data;
    assign     `I_Valid( ImageSpec, image_in ) = image_in_valid;
    assign     `I_Error( ImageSpec, image_in ) = image_in_error;
    assign     image_in_ready   = `I_Ready( ImageSpec, image_in );
    assign     image_in_request = `I_Request( ImageSpec, image_in );
    assign     image_in_cancel  = `I_Cancel( ImageSpec, image_in );

    wire                      image_out_start;
    wire                      image_out_stop;
    wire [ImageDataWidth-1:0] image_out_data;
    wire                      image_out_valid;
    wire                      image_out_error;
    reg                       image_out_ready;
    reg                       image_out_request;
    reg                       image_out_cancel;

    assign     image_out_start = `I_Start( ImageSpec, image_out ) ;
    assign     image_out_stop = `I_Stop( ImageSpec, image_out ) ;
    assign     image_out_data = `I_Data( ImageSpec, image_out ) ;
    assign     image_out_valid = `I_Valid( ImageSpec, image_out ) ;
    assign     image_out_error = `I_Error( ImageSpec, image_out ) ;
    assign     `I_Ready( ImageSpec, image_out ) = image_out_ready;
    assign     `I_Request( ImageSpec, image_out ) = image_out_request;
    assign     `I_Cancel( ImageSpec, image_out ) = image_out_cancel;

    task if_init;
        begin
            image_in_start = 0;
            image_in_stop = 0;
            image_in_data = 0;
            image_in_valid = 0;
            image_in_error = 0;

            image_out_ready = 1;
            image_out_request = 0;
            image_out_cancel = 0;
        end
    endtask

    task  if_clock;
        begin
            #2
            @( posedge clock );
            `Debug( "            Clock");
            #2
            ;
        end
    endtask

    task  if_reset;
        begin
            reset = 1;
            if_clock;
            `Info( "    Reset");
            reset = 0;
            if_clock;
        end
    endtask

    task if_in( input reg start_in, input reg stop_in, input reg [ImageDataWidth-1:0] data_in );
        begin
            image_in_start = start_in;
            image_in_stop = stop_in;
            image_in_data = data_in;
            image_in_valid = 1;

            `InfoDo $display( "            In:  %0x:%0x:%0x", start_in, stop_in, data_in );

            if_clock;

            image_in_start = 0;
            image_in_stop = 0;
            image_in_data = 0;
            image_in_valid = 0;
        end
    endtask


    integer i, j, k;

    reg                    start, start0;
    reg                    stop, stop0;
    reg [ImageDataWidth:0] data, data0;

    reg [8*50:1] test_name;

    task if_out( input reg valid_out, input reg start_out, input reg stop_out, input reg [ImageDataWidth-1:0] data_out );
        begin
            `InfoDo $display( "                        Out: %0x:%0x:%0x (%0x)", image_out_start, image_out_stop, image_out_data, image_out_valid );
            `AssertEqual( image_out_valid, valid_out, test_name );
            `AssertEqual( image_out_start, start_out, test_name );
            `AssertEqual( image_out_stop, stop_out, test_name );
            `AssertEqual( image_out_data, data_out, test_name );
        end
    endtask

    task if_check_initial_state;
        begin
            `Info( "Initial State" );
            test_name = "Initial State";

            `Assert( image_in_ready, test_name );

            `Assert( !image_in_valid, test_name );
        end
    endtask

    task if_single_stepping( input  reg pauses );
        begin
            `InfoDo $display( "Single Stepping Pauses = %0x", pauses );

            if_check_initial_state;

            test_name = "Single Stepping";

            image_out_ready = 1;

            // just put one word in and take one out, but do it enough to
            // ensure wrapping a couple of times
            for ( i = 0; i < MemorySize * 3; i = i + 1 ) begin
                start = i % 2;
                stop = i % 3;
                data = i + 8'H10;
                if_in( start, stop, data );

                // if so directed, pause for a little between the insertion and removal
                if ( pauses ) begin
                    image_out_ready = 0;
                    for ( j = 0; j < 4; j = j + 1 ) begin
                        `Info( "        Hold" );
                        if_out( 1, start, stop, data );
                        if_clock;
                    end
                    image_out_ready = 1;
                end

                if_out( 1, start, stop, data );
            end

            if_clock;
            if_out( 0, 0, 0, 0 );

        end
    endtask

    task if_partial_load( input  reg pauses );
        begin
            `InfoDo $display( "Partial Load Pauses = %0x", pauses );

            if_check_initial_state;

            test_name = "Partial Load";

            // do this a few times to ensure both addresses wrap around
            for ( j = 0; j < 3; j = j + 1 ) begin
                `InfoDo $display( "    Filling %0d", j );

                image_out_ready = 0;

                // Add some words - no output
                start0 = 0;
                stop0 = 0;
                data0 = 8'H10 * j;
                for ( i = 0; i < 2 * MemorySize / 3; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    if_in( start, stop, data );
                    if_out( 1, start0, stop0, data0 );
                    if ( pauses ) begin
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Pause" );
                            if_out( 1, start0, stop0, data0 );
                            if_clock;
                        end
                    end
                end

                image_out_ready = 1;

                `InfoDo $display( "    Emptying %0d", j );

                // Get them all back
                for ( i = 0; i < 2 * MemorySize / 3; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    if_out( 1, start, stop, data );
                    if ( pauses ) begin
                        image_out_ready = 0;
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Hold" );
                            if_out( 1, start, stop, data );
                            if_clock;
                        end
                        image_out_ready = 1;
                    end
                    if_clock;

                                    // if so directed, pause for a little between the insertion and removal

                end

                if_out( 0, 0, 0, 0 );
            end
        end
    endtask

    localparam FillExtra = 10;

    task if_fill( input reg pauses );
        begin
            `InfoDo $display( "Fill Pauses = %0x", pauses );

            if_check_initial_state;

            test_name = "Fill";

            // do this a few times to ensure both addresses wrap around
            for ( j = 0; j < 3; j = j + 1 ) begin
                `InfoDo $display( "    Fill To Full %0d", j );

                image_out_ready = 0;

                // Add some words - no output
                start0 = 0;
                stop0 = 0;
                data0 = 8'H10 * j;
                for ( i = 0; i < MemorySize + FillExtra; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    if_in( start, stop, data );
                    if_out( 1, start0, stop0, data0 );
                    if ( i >= MemorySize ) begin
                        `Info( "        FULL" );
                        `Assert( ~image_in_ready, test_name );
                    end
                    if ( pauses ) begin
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Pause" );
                            if_out( 1, start0, stop0, data0 );
                            if_clock;
                        end
                    end
                end

                image_out_ready = 1;

                `InfoDo $display( "    Emptying %0d", j );

                // Get all the words back that fit
                for ( i = 0; i < MemorySize; i = i + 1 ) begin
                    start = i % 2;
                    stop = i % 3;
                    data = data0 + i;
                    if_out( 1, start, stop, data );

                    if ( pauses ) begin
                        image_out_ready = 0;
                        for ( k = 0; k < 4; k = k + 1 ) begin
                            `Info( "        Hold" );
                            if_out( 1, start, stop, data );
                            if_clock;
                        end
                        image_out_ready = 1;
                    end

                    if_clock;
                end

                // has to be empty after all that
                if_out( 0, 0, 0, 0 );
            end
        end
    endtask

    task if_check_in_to_out_signals;
        begin
            `Info( "    In to Out Signals" );

            image_in_error = 0;

            if_clock;

            `Assert( ~image_out_error, "Error Idle"  );

            `Info( "        Checking Error Up" );

            image_in_error = 1;

            if_clock;

            `Assert( image_out_error, "Error Not Idle"  );

            `Info( "        Checking Error Down" );

            image_in_error = 0;

            if_clock;

            `Assert( !image_out_error, "Error Idle Again"  );

            if_clock;

        end
    endtask

    task if_check_out_to_in_signals;
        begin

            `Info( "    Out to In Signals" );

            image_out_request = 0;
            image_out_cancel = 0;


            if_clock;

            `Assert( ~image_in_request, "Request Idle"  );
            `Assert( ~image_in_cancel,  "Cancel Idle"  );

            `Info( "        Checking Request Up" );

            image_out_request = 1;

            if_clock;

            `Assert( image_in_request, "Request Not Idle"  );
            `Assert( ~image_in_cancel,  "Cancel Idle Still"  );

            if_clock;

            `Assert( image_in_request, "Request Not Idle"  );
            `Assert( ~image_in_cancel,  "Cancel Idle Still"  );

            if_clock;

            `Info( "        Checking Request Down" );

            image_out_request = 0;

            if_clock;

            `Assert( !image_in_request, "Request Idle Again"  );
            `Assert( ~image_in_cancel,  "Cancel Idle Still"  );

            if_clock;

            `Assert( ~image_in_request, "Request Idle"  );
            `Assert( ~image_in_cancel,  "Cancel Idle"  );

            `Info( "        Checking Request Up" );

            image_out_cancel = 1;

            if_clock;

            `Assert( ~image_in_request, "Request Idle"  );
            `Assert( image_in_cancel,  "Cancel Not Idle"  );

            `Info( "        Checking Request Down" );

            image_out_cancel = 0;

            if_clock;

            `Assert( ~image_in_request, "Request Idle Still"  );
            `Assert( ~image_in_cancel,  "Cancel Idle Again Still"  );

            if_clock;

        end
    endtask

    initial begin
        $display( "\nImage FIFO Test %s", `__FILE__ );

        if_init;
        if_reset;

        if_check_initial_state;

        if_single_stepping( 0 );
        if_single_stepping( 1 );

        if_partial_load( 0 );
        if_partial_load( 1 );

        if_fill( 0 );
        if_fill( 1 );

        if_check_in_to_out_signals;
        if_check_out_to_in_signals;

        `AssertSummary

        $finish;
    end



endmodule

