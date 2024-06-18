// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

// 1ns = the time represented by #1
// 1ps is the resolution of the times stored in the simulation VCD (Value Change Dump) file
`timescale 1ns/1ps

// Create a module named 'tb' that has no ports
module tb();

    reg a;          // Signals driven from within a process (an initial or always block) must be type reg
    reg b;
    wire sum;       // Signals that are driven from outside a process must be type wire
    wire cy;

    // Instantiate (create one instance of) a top module and call it 'uut' within this module
    // We have the opportuinity here to connect the ports of the module to our local signals.
    top uut (
        .a(a),      // connect our 'reg a' to top's input port a 
        .b(b),      // connect our 'reg b' to top's input port b
        .sum(sum),  // connect top's output port 'sum' to our 'wire sum'
        .cy(cy)     // connect top's output port 'cy' to our 'wire cy'
        );

    // 'initial' is a 'process' that will run once when the simulation starts
    // $xyz is the notation used to refer to a 'system task'
    initial begin
        $dumpfile("top_tb.vcd");    // where to write the dump
        $dumpvars;                  // dump EVERYTHING
    end

    // all initial process blocks will start at the same time and run in parallel
    initial begin
        a = 0;      // = is a 'blocking assignment' that runs in the order given during simulation
        b = 0;
        #1;         // #nnn is a statement that will wait nnn units of time given in the `timescale
        a = 0;
        b = 1;
        #1;
        a = 1;
        b = 0;
        #1;
        a = 1;
        b = 1;
        #1;
        a = 0;
        b = 0;
        #10;
        
        $finish;    // The $finish 'system task' halts the simulation
    end

endmodule
