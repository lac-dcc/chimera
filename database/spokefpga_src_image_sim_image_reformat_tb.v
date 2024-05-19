// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*

Image Reformat


    This is sad... icarcus can't compile this when any data assignment is happening.

    Might be me... however Yosys is cool with it.

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../image/rtl/image_defs.v"

// Error line number  offset 174?

module image_reformat_instance #(
        parameter [`IS_w-1:0] InIS = `IS_DEFAULT,
        parameter [`IS_w-1:0] OutIS = `IS_DEFAULT
    )();

    parameter Output=`OutputDebug;

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    task i_init;
        begin
        end
    endtask

    task  i_clock;
        begin
            #2
            @( posedge clock );
            // `Info( "    Clock");
            #2
            ;
        end
    endtask

    reg  reset;
    task  i_reset;
        begin
            reset = 1;
            i_clock;
            `Info( "    Reset");
            reset = 0;
            i_clock;
        end
    endtask

    task test_init;
        begin
            i_init;
            i_reset;

        end
    endtask

    //
    // Spec Details
    //

    localparam InImageWidth  = `I_w( InIS );
    localparam OutImageWidth = `I_w( OutIS );

    //
    // ImageBuffer Instance Under Test
    //

    wire [InImageWidth-1:0]  image_in;
    wire [OutImageWidth-1:0] image_out;

    image_reformat #(
            .InIS( InIS ),
            .OutIS( OutIS )
        ) ir (
            .clock( clock ),
            .reset( reset ),

            .image_in( image_in ),
            .image_out( image_out )
        );

    //
    // Signals
    //

    localparam InC0Width    = `IS_C0_WIDTH( InIS );
    localparam InC1Width    = `IS_C1_WIDTH( InIS );
    localparam InC2Width    = `IS_C2_WIDTH( InIS );
    localparam InAlphaWidth = `IS_ALPHA_WIDTH( InIS );
    localparam InZWidth     = `IS_Z_WIDTH( InIS );

    // All the in signals
    reg                  in_start;
    reg                  in_stop;
    reg                  in_valid;
    reg                  in_error;

    reg [ InC0Width-1:0 ]    in_c0;
    reg [ InC1Width-1:0 ]    in_c1;
    reg [ InC2Width-1:0 ]    in_c2;
    reg [ InAlphaWidth-1:0 ] in_alpha;
    reg [ InZWidth-1:0 ]     in_z;

    wire                 in_ready;
    wire                 in_request;
    wire                 in_cancel;


    // Setup the in signals to be controlled from here.
    assign `I_Start( InIS, image_in ) = in_start;
    assign `I_Stop(  InIS, image_in ) = in_stop;
    assign `I_Error( InIS, image_in ) = in_error;
    assign `I_Valid( InIS, image_in ) = in_valid;

    // setup the out signals to be read from here
    assign in_request = `I_Request( InIS, image_in );
    assign in_cancel  = `I_Cancel( InIS, image_in );
    assign in_ready   = `I_Ready( InIS, image_in );

    // All the out signals

    localparam OutC0Width    = `IS_C0_WIDTH( OutIS );
    localparam OutC1Width    = `IS_C1_WIDTH( OutIS );
    localparam OutC2Width    = `IS_C2_WIDTH( OutIS );
    localparam OutAlphaWidth = `IS_ALPHA_WIDTH( OutIS );
    localparam OutZWidth     = `IS_Z_WIDTH( OutIS );

    wire                 out_start;
    wire                 out_stop;
    wire                 out_valid;
    wire                 out_error;

    wire [ OutC0Width-1:0 ]    out_c0;
    wire [ OutC1Width-1:0 ]    out_c1;
    wire [ OutC2Width-1:0 ]    out_c2;
    wire [ OutAlphaWidth-1:0 ] out_alpha;
    wire [ OutZWidth-1:0 ]     out_z;

    reg                  out_ready;
    reg                  out_request;
    reg                  out_cancel;

    assign out_start = `I_Start( OutIS, image_out );
    assign out_stop  = `I_Stop( OutIS, image_out );
    assign out_error = `I_Error( OutIS, image_out );
    assign out_valid = `I_Valid( OutIS, image_out );

    assign `I_Request( OutIS, image_out ) = out_request;
    assign `I_Cancel(  OutIS, image_out ) = out_cancel;
    assign `I_Ready(   OutIS, image_out ) = out_ready;

    task test_image_init;
        begin
            in_start <= 0;
            in_stop <= 0;
            in_valid <= 0;
            in_error <= 0;
            in_c0 <= 0;
            in_c1 <= 0;
            in_c2 <= 0;
            in_alpha <= 0;
            in_z <= 0;
            out_ready <= 0;
            out_request <= 0;
            out_cancel <= 0;
        end
    endtask

    //
    // Tests
    //

    task test_initial_state(  inout integer AssertErrorCount, inout integer AssertTestCount );
        begin
            `InfoDo $display( "    Test Initial State" );

            `InfoDo $display( "        InIS %x", InIS );
            `InfoDo $display( "             In Format    %d",  `IS_FORMAT( InIS ) );
            `InfoDo $display( "             In C0_w      %d",  `I_C0_w( InIS ) );
            `InfoDo $display( "             In C1_w      %d",  `I_C1_w( InIS ) );
            `InfoDo $display( "             In C2_w      %d",  `I_C2_w( InIS ) );
            `InfoDo $display( "             In Alpha_w   %d",  `I_Alpha_w( InIS ) );
            `InfoDo $display( "             In Z_w       %d",  `I_Z_w( InIS ) );

            `InfoDo $display( "        OutIS %x", OutIS );
            `InfoDo $display( "            Out Format    %d",  `IS_FORMAT( OutIS ) );
            `InfoDo $display( "            Out C0_w      %d",  `I_C0_w( OutIS ) );
            `InfoDo $display( "            Out C1_w      %d",  `I_C1_w( OutIS ) );
            `InfoDo $display( "            Out C2_w      %d",  `I_C2_w( OutIS ) );
            `InfoDo $display( "            Out Alpha_w   %d",  `I_Alpha_w( OutIS ) );
            `InfoDo $display( "            Out Z_w       %d",  `I_Z_w( OutIS ) );

            `InfoDo $display( "       In I_w %d", `I_w( InIS ) );
            `InfoDo $display( "      Out I_w %d", `I_w( OutIS ) );

            i_clock;
            i_clock;

            `AssertEqual( out_start,  0, "Initial states" );
            `AssertEqual( out_stop,   0, "Initial states" );
            `AssertEqual( out_valid,  0, "Initial states" );
            `AssertEqual( out_error,  0, "Initial states" );
            `AssertEqual( in_ready,   0, "Initial states" );
            `AssertEqual( in_request, 0, "Initial states" );
            `AssertEqual( in_cancel,  0, "Initial states" );

        end
    endtask

    task test_in_2_out( inout integer AssertErrorCount, inout integer AssertTestCount );
        begin

            in_start = 0;
            in_stop = 0;
            in_valid = 0;
            in_error = 0;

            #1

            `AssertEqual( out_start, in_start, "Low Out Start" );
            `AssertEqual( out_stop,  in_stop,  "Low Out Stop" );
            `AssertEqual( out_valid, in_start, "Low Out Valid" );
            `AssertEqual( out_error, in_error, "Low Out Error" );

            in_start = 1;
            in_stop = 1;
            in_valid = 1;
            in_error = 1;

            #1

            `AssertEqual( out_start, in_start, "High Out Start" );
            `AssertEqual( out_stop,  in_stop,  "High Out Stop" );
            `AssertEqual( out_valid, in_start, "High Out Valid" );
            `AssertEqual( out_error, in_error, "High Out Error" );

        end
    endtask

    task test_out_2_in( inout integer AssertErrorCount, inout integer AssertTestCount );
        begin

            out_ready = 0;
            out_request = 0;
            out_cancel = 0;

            #1

            `AssertEqual( in_ready,   out_ready,   "Low Out Ready" );
            `AssertEqual( in_request, out_request, "Low Out Request" );
            `AssertEqual( in_cancel,  out_cancel,  "Low Out Cancel" );

            out_ready = 1;
            out_request = 1;
            out_cancel = 1;

            #1

            `AssertEqual( in_ready,   out_ready,   "High Out Ready" );
            `AssertEqual( in_request, out_request, "High Out Request" );
            `AssertEqual( in_cancel,  out_cancel,  "High Out Cancel" );

        end
    endtask

endmodule

module image_reformat_tb();

    parameter Output=`OutputDebug;
    // parameter Output=`OutputInfo;
    // parameter Output=`OutputError;

    initial begin
      $dumpfile("image_reformat_tb.vcd");
      $dumpvars( 0, image_reformat_tb );
    end

    `AssertSetup

    // leaving as an integer doesn't seem to work, also data processing doesn't test properly in Icarus - using illegal cases
    // localparam [`IS_w-1:0] IS_G10_A0G0    = `IS( 0, 0, 10, 10, 0, 1, `IS_FORMAT_GRAYSCALE, 10, 0, 0, 0, 0 );
    // localparam [`IS_w-1:0] IS_RGB565_A0G0 = `IS( 0, 0, 10, 10, 0, 1, `IS_FORMAT_RGB, 5, 6, 5, 0, 0 );

    localparam [`IS_w-1:0] IS_G10_A0G0    = `IS( 0, 0, 10, 10, 0, 1, `IS_FORMAT_YOUR_MOTHER, 10, 0, 0, 0, 0 );
    localparam [`IS_w-1:0] IS_RGB565_A0G0 = `IS( 0, 0, 10, 10, 0, 1, `IS_FORMAT_YOUR_MOTHER, 5, 6, 5, 0, 0 );

    image_reformat_instance #( .InIS(IS_G10_A0G0 ), .OutIS( IS_RGB565_A0G0 ) ) i_g10_rgb565( );

    initial begin
        $display( "Image Reformat Tests %s", `__FILE__ );

        i_g10_rgb565.test_init;

        i_g10_rgb565.test_image_init;

        i_g10_rgb565.test_initial_state( AssertErrorCount, AssertTestCount);

        i_g10_rgb565.test_in_2_out( AssertErrorCount, AssertTestCount );
        i_g10_rgb565.test_out_2_in( AssertErrorCount, AssertTestCount );

        `AssertSummary

        $finish;
    end

endmodule

