// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    parameter WIDTH = 8;
    // input and output test signals
    reg  [WIDTH - 1:0] x, y;
    wire eq, neq, lt, lte, gt, gte;
 
    // create the instances of the modules you want to test
    comparator #(.WIDTH(WIDTH)) comparator_dut(
        .x  (x  ),
        .y  (y  ),
        .eq (eq ),
        .neq(neq),
        .lt (lt ),
        .lte(lte),
        .gt (gt ),
        .gte(gte)
    );
        
    //write test sequence
    initial begin
        x = 0;
        y = 0;
        #8
        $stop;
    end
    
    initial
        forever begin
            #1;
            x = $urandom_range(0, 2 ** WIDTH - 1);
            y = $urandom_range(0, 2 ** WIDTH - 1);
        end
            
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("Time:\t%g, x: %b, y: %b, eq: %b, neq: %b, lt: %b, lte: %b, gt: %b, gte: %b",
                $time,
                x,
                y,
                eq,
                neq,
                lt,
                lte,
                gt,
                gte
            );
            
    // do at the beginning of the simulation
    //configure signals dump for waveform's creation
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars(1);  //iverilog dump init
    end
    
endmodule
