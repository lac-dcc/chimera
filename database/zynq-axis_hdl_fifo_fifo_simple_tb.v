/**
 * Testbench:
 *  fifo_simple
 *
 * Created:
 *  Sun Nov 30 13:44:07 EST 2014
 *
 * Author:
 *  Berin Martini (berin.martini@gmail.com)
 */

`timescale 1ns/10ps

`define TB_VERBOSE
//`define VERBOSE

`include "fifo_simple.v"

module fifo_simple_tb;

    /**
     * Clock and control functions
     */

    // Generate a clk
    reg clk;
    always #1 clk = !clk;

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

    localparam DATA_WIDTH   = 6;
    localparam ADDR_WIDTH   = 4;


    /**
     *  signals, registers and wires
     */

    reg                     rst;
    reg                     pop;
    reg                     push;
    reg  [DATA_WIDTH-1:0]   push_data;
    wire [DATA_WIDTH-1:0]   pop_data;
    wire                    empty;
    wire                    full;
    wire                    empty_a;
    wire                    full_a;

    wire [ADDR_WIDTH:0]     count;


    /**
     * Unit under test
     */

    fifo_simple #(
        .DATA_WIDTH (DATA_WIDTH),
        .ADDR_WIDTH (ADDR_WIDTH))
    uut (
        .clk        (clk),
        .rst        (rst),

        .count      (count),
        .full       (full),
        .full_a     (full_a),
        .empty      (empty),
        .empty_a    (empty_a),

        .push       (push),
        .push_data  (push_data),

        .pop        (pop),
        .pop_data   (pop_data)
    );


    /**
     * Wave form display
     */

    task display_signals;
        $display("%d\t%b\t%b\t%d\t%b\t%b\t%b\t%d\t%b\t%b\t%d\t%d",
            $time, rst,
            push,
            push_data,
            full,
            full_a,
            pop,
            pop_data,
            empty,
            empty_a,
            count,
            |(count[ADDR_WIDTH:ADDR_WIDTH-1]),
        );
    endtask // display_signals

    task display_header;
        $display(
            "\t\ttime\trst",

            "\tpush",
            "\tdat",
            "\tfull",
            "\tfull_a",

            "\tpop",
            "\tdat",
            "\tempty",
            "\tempty_a",
            "\tcount",

        );
    endtask


    /**
     * Testbench program
     */

    initial begin
        // init values
        clk         = 0;
        rst         = 0;
        push        = 0;
        push_data   = 0;
        pop         = 0;


`ifdef TB_VERBOSE
    $display("RESET");
`endif

        @(negedge clk);
        rst <= 1'b1;
        repeat(6) @(negedge clk);
        rst <= 1'b0;
        repeat(6) @(negedge clk);


        $display("TEST write to fifo");
        repeat (20) @(negedge clk) begin
            push        <= 1'b1;
            push_data   <= $random;
        end
        push        <= 1'b0;
        push_data   <= 0;


        $display("TEST read from fifo");
        #1
        repeat (16) @(negedge clk) begin
            pop <= 1'b1;
        end
        pop <= 1'b0;

        $display("TEST write 5 data points to fifo");
        repeat (5) @(negedge clk) begin
            push        <= 1'b1;
            push_data   <= $random;
        end
        push        <= 1'b0;
        push_data   <= 0;
        #5

        $display("TEST read two data points from fifo");
        repeat (2) @(negedge clk) begin
            pop <= 1'b1;
        end
        pop <= 1'b0;

        #5
        $display("TEST write 15 data points to fifo");
        repeat (15) @(negedge clk) begin
            push        <= 1'b1;
            push_data   <= $random;
        end
        push        <= 1'b0;
        push_data   <= 0;
        #5

        $display("TEST read two data points from fifo");
        #1
        repeat (8) @(negedge clk) begin
            pop <= 1'b1;
        end
        pop <= 1'b0;


        $display("TEST simultaneous read/write 15 data points to fifo");
        repeat (15) @(negedge clk) begin
            pop         <= 1'b1;
            push        <= 1'b1;
            push_data   <= $random;
        end
        repeat (15) @(negedge clk) begin
            pop <= 1'b1;
        end

        $display("OTHER TESTS");
        push <= 1'b0;

`ifdef TB_VERBOSE
    $display("END");
`endif
        -> end_trigger;
    end
endmodule
