// This program was cloned from: https://github.com/bmartini/verilog-arbiter
// License: MIT License

/**
 * Testbench: timer
 *
 * Created:
 *  Sun Jun  2 18:47:52 EDT 2013
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE
//`define DEBUG_CONVOLVER


`include "timer.v"

module timer_tb;

    /**
     * Clock and control functions
     */

    // Generate a clk
    reg clk;
    always #1 clk = !clk;
    //always #10 s_clk    = !s_clk;

    // End of simulation event definition
    event end_trigger;
    always @(end_trigger) $finish;

`ifdef TB_VERBOSE
    // Display header information
    initial #1 display_header();
    always @(end_trigger) display_header();

    // And strobe signals at each clk
    always @(posedge clk) display_signals();
`endif

//    initial begin
//        $dumpfile("result.vcd"); // Waveform file
//        $dumpvars;
//    end


    /**
     * Local parameters
     */

    parameter TIMEOUT = 10;

`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'timer'");
`endif

    /**
     *  signals, registers and wires
     */
    reg     rst;

    reg     up_req;
    wire    up_grant;
    wire    down_req;
    wire    down_grant;

    /**
     * Unit under test
     */

    timer #(
        .TIMEOUT (TIMEOUT))
    uut (
        .clk       (clk),
        .rst       (rst),

        .up_req     (up_req),
        .up_grant   (up_grant),
        .up_ack     (),

        .down_req   (down_req),
        .down_grant (down_grant),
        .down_ack   ()
    );



    /**
     * Wave form display
     */
    task display_signals;
        $display(
            "%d\t%d",
            $time, rst,

            "\t%b\t%b",
            up_req,
            down_req,

            "\t%b\t%b",
            up_grant,
            down_grant,
        );
    endtask // display_signals

    task display_header;
        $display({
            "\t\ttime\trst",
            ""});
    endtask


    /**
     * Testbench program
     */

    assign down_grant = down_req;


    initial begin
        // init values
        clk = 0;
        rst = 0;

        up_req = 1'b0;
        //end init


`ifdef TB_VERBOSE
    $display("RESET");
`endif

        repeat(10) @(posedge clk);
        rst <= 1'b1;
        repeat(10) @(posedge clk);
        rst <= 1'b0;

        repeat(20) @(posedge clk);


`ifdef TB_VERBOSE
    $display("TEST different ports request priority");
`endif

        up_req = 1'b1;
        repeat(5) @(posedge clk);
        up_req = 1'b0;
        repeat(15) @(posedge clk);
        up_req = 1'b1;
        repeat(15) @(posedge clk);
        up_req = 1'b0;
        @(posedge clk);


        @(posedge clk);
`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end


endmodule
