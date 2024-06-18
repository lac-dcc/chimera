// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ns  

module tb();

    reg     clk = 0;
    wire    reset1;
    wire    reset2;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        #5000;           // wait a while
        $finish;        // stop the simulation 
    end

    always #1 clk = ~clk;

    // positional parameters can be used but can be error-prone during development
    por #( .delay(3) ) r1 ( reset1, clk );       // port order matters here
    por #( 1000 ) r2 ( .clk(clk), .reset(reset2) ); // port order does not matter here

endmodule

// This uses the old-style (annoying and error-prone) way to define a module.
module por ( reset, clk );

    output reg  reset = 1'b1;   // we can initialize regs that are ports
    input       clk;            // default type is wire

    parameter delay = 10;       // the order of a plurality of parameters matters!

    localparam  NUM_BITS = $clog2(delay);

    // an appropriately sized counter
    reg [NUM_BITS-1:0] counter = 0;
    reg [NUM_BITS-1:0] counter_next = 0;
    reg reset_next = 1'b1;

    always @( posedge clk ) begin
        counter <= counter_next;
        reset <= reset_next;
    end

    // Keeping the combinational circuitry for determining the next state 
    // in its own block can keep things much cleaner in more complex systems.
    always @(*) begin
        if ( counter == delay-1 ) begin
            reset_next = 1'b0;          // de-assert the reset signal
            counter_next = counter;     // do not advance the counter
        end else begin
            reset_next = 1'b1;          // assert the reset signal
            counter_next = counter + 1; // advance the delay counter
        end
    end

endmodule
