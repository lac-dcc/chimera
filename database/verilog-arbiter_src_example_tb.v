// This program was cloned from: https://github.com/bmartini/verilog-arbiter
// License: MIT License

/**
 * Testbench: example
 *
 * Created:
 *  Tue Jun  4 17:48:13 EDT 2013
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE
//`define DEBUG_CONVOLVER


`include "example.v"

module example_tb;

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

    localparam NUM_PORTS    = 3;
    localparam TIMEOUT      = 5;

`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'example'");
`endif

    /**
     *  signals, registers and wires
     */
    reg     rst;

    reg  [NUM_PORTS-1:0]    request;
    wire [NUM_PORTS-1:0]    grant;
    wire                    active;

    /**
     * Unit under test
     */

    example #(
        .NUM_PORTS  (NUM_PORTS),
        .TIMEOUT    (TIMEOUT))
    uut (
        .clk        (clk),
        .rst        (rst),

        .request    (request),
        .grant      (grant),

        .active     (active)
    );



    /**
     * Wave form display
     */
    task display_signals;
        $display(
            "%d\t%d",
            $time, rst,

            "\t%b\t%b",
            request,
            grant,

            "\t%b",
            active,
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


    initial begin
        // init values
        clk = 0;
        rst = 0;

        request = 'b0;
        //end init


`ifdef TB_VERBOSE
    $display("RESET");
`endif

        repeat(10) @(negedge clk);
        rst <= 1'b1;
        repeat(10) @(negedge clk);
        rst <= 1'b0;

        repeat(20) @(negedge clk);


`ifdef TB_VERBOSE
    $display("TEST different ports request priority");
`endif

        request = 3'b010;
        repeat(15) @(negedge clk);
        request = 3'b000;
        repeat(15) @(negedge clk);
        request = 3'b110;
        repeat(15) @(negedge clk);
        request = 3'b111;
        repeat(25) @(negedge clk);
        request = 3'b010;
        repeat(15) @(negedge clk);
        request = 3'b110;
        repeat(15) @(negedge clk);
        request = 3'b011;
        repeat(15) @(negedge clk);
        request = 3'b001;
        repeat(15) @(negedge clk);




        @(negedge clk);
`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end


endmodule
