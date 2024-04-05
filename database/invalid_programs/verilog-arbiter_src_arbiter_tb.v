/**
 * Testbench: arbiter
 *
 * Created: Sat Jun  1 19:01:54 EDT 2013
 *
 * Author: Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE
//`define DEBUG_CONVOLVER


`include "arbiter.v"

module arbiter_tb;

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

    localparam NUM_PORTS = 9;
    localparam SEL_WIDTH = ((NUM_PORTS > 1) ? $clog2(NUM_PORTS) : 1);

`ifdef TB_VERBOSE
    initial $display("Testbench for unit 'arbiter'");
`endif

    /**
     *  signals, registers and wires
     */
    reg                     rst;

    reg  [NUM_PORTS-1:0]    request;
    wire [NUM_PORTS-1:0]    grant;
    wire [SEL_WIDTH-1:0]    select;
    wire                    active;

    /**
     * Unit under test
     */

    arbiter #(
        .NUM_PORTS (NUM_PORTS))
    uut (
        .clk        (clk),
        .rst        (rst),
        .request    (request),
        .grant      (grant),
        .select     (select),
        .active     (active)
    );



    /**
     * Wave form display
     */
    task display_signals;
        $display(
            "%d\t%d",
            $time, rst,

            "\t%b\t%b\t%b",
            request,
            grant,
            active,

            "\t%d",
            select,
        );
    endtask // display_signals

    task display_header;
        $display(
            "\t\ttime\trst",
        );
    endtask


    /**
     * Testbench program
     */


    initial begin
        // init values
        clk = 0;
        rst = 0;

        request = 1'b0;
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

        request = 9'b100000001;
        repeat(15) @(posedge clk);
        request = 9'b000000010;
        repeat(15) @(posedge clk);
        request = 9'b010000001;
        repeat(15) @(posedge clk);

        request = 9'b000000001;
        @(posedge clk);
        request = 9'b010000001;
        repeat(15) @(posedge clk);
        request = 9'b010000000;
        repeat(5) @(posedge clk);
        request = 9'b010000100;
        repeat(10) @(posedge clk);
        request = 9'b000000100;
        repeat(15) @(posedge clk);
        request = 9'b000100000;
        repeat(15) @(posedge clk);
        request = 9'b000000000;
        @(posedge clk);
        request = 9'b000100000;
        repeat(10) @(posedge clk);


`ifdef TB_VERBOSE
    $display("TEST when all ports request priority");
`endif
        request = 9'b111111111;
        repeat(10) @(posedge clk);
        request = 9'b111011111;
        @(posedge clk);
        request = 9'b111111111;
        repeat(10) @(posedge clk);
        request = 9'b110111111;
        @(posedge clk);
        request = 9'b111111111;
        repeat(10) @(posedge clk);
        request = 9'b101111111;
        @(posedge clk);
        request = 9'b111111111;
        repeat(10) @(posedge clk);
        request = 9'b011111111;
        @(posedge clk);
        request = 9'b111111111;
        repeat(10) @(posedge clk);


        @(posedge clk);
`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end


endmodule
