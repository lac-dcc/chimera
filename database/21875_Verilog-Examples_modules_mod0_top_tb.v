// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 1ns/1ns  

// Module definitions can not nest.  But instantiations CAN!
// Therefore all modules have names in the global scope.
// Instantiations of modules have names that are in a local scope.

// Observation: The 'top-level module' is instantiated during
// synthesys by the compiler when it is executed and told the 
// name of the 'top.'

// During simulation, the top-level module is inferred by the simulator.
// Icarus Verilog will, by default, choose modules that are not instantiated 
// in any other modules as the top-level.

module tb();

    reg clk1 = 0;       // same as setting clk1 to 0 in an initial block
    reg clk2 = 0;
    wire the_value;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars;

        #100;           // wait a while
        $finish;        // stop the simulation 
    end

    always #3 clk1 = ~clk1;
    always #1 clk2 = ~clk2;

    // 'mod0' is to 'aaa' as 'reg' is to 'clk1'
    mod0 #(
            .P1(11),        // override the default value of P1 
            .P2(22),        // override the default value of P2
            .P3()           // explicitly use the default value for P3
        ) 
        aaa                 // the name of the instance is 'aaa'
        (
            .a(clk1),       // an input port can be driven from 
            .b(clk2),       //       anywhere in the instantiator.
            .q1(the_value)  // an output port must drive a 'net' (a wire)
                            // we can ignore ports we don't want to use
        );

endmodule


// NOTE: It is OK to define more than one module in the same file.
// This module is defined ANSI-style.

// Parameters must have values that are compile-time constants.
// Ports must be input, output, or inout.
// Only output ports may be of type 'reg'.
// input and inout ports must be 'net' types (on an FPGA, that means 'wire')

module mod0 
    #(                      // parameters start with an optionl #()
        parameter P1 = 101,
        parameter P2 = 102,
        parameter [7:0] P3 = 8'hc0, // range-based parameters are also allowed
        parameter P4 = P1+4 // Expressions are OK if evaluatable at compile-time
                            // But note that this example may be poor practice!
    )

    (                       // ports are listed in ()
        input wire  a,      // inputs MUST be type wire
        input wire  b,
        output wire q1,     // outputs can be wire 
        output reg  q2      //  or reg
    );

    localparam  LP1 = P1+P2;    // localparams must be compile-time constants

    // setting the value of a wire net...
    assign q1 = a & b;

    // setting the value of a reg...
    always @(*) begin
        q2 = a | b;
    end

    // This can show how random the scheduling of all the always
    // and assign statements can be as combinational circuits are
    // simulated in pieces.
    // Note the differences between using $display() and $strobe()
    always @(*) begin
        $display( "time:%3d a:%b b:%b q1:%b q2:%b P1:%3d P2:%3d P3:%3d P4:%3d LP1:%3d",
            $time, a, b, q1, q2, P1, P2, P3, P4, LP1 );
    end

endmodule
