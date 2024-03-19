`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    parameter WIDTH = 8;
    parameter SHIFT = 3;
    // input and output test signals
    reg  [WIDTH - 1:0] x;
    reg  [SHIFT - 1:0] shamt;
    wire [WIDTH - 1:0] lr_out;
    wire [WIDTH - 1:0] rr_out;
 
    // create the instances of the modules you want to test
    left_rotator
    #(
        .WIDTH(WIDTH),
        .SHIFT(SHIFT)
    )
    left_rotator_dut
    (
        .x    (x     ),
        .shamt(shamt ),
        .z    (lr_out)
    );
    
    right_rotator
    #(
        .WIDTH(WIDTH),
        .SHIFT(SHIFT)
    )
    right_rotator_dut
    (
        .x    (x     ),
        .shamt(shamt ),
        .z    (rr_out)
    );
    
    //write test sequence
    initial begin
        x     = 0;
        shamt = 0;
        #8
        $stop;
    end
    
    initial
        forever begin
            #1;
            x     = $urandom_range(0, 2 ** WIDTH - 1);
            shamt = $urandom_range(0, 2 ** SHIFT - 1);
        end
            
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("Time:\t%g, x: %b, shamt: %b, lr_out: %b, rr_out: %b",
                $time,
                x,
                shamt,
                lr_out,
                rr_out
            );
            
    // do at the beginning of the simulation
    //configure signals dump for waveform's creation
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars(1);  //iverilog dump init
    end
    
endmodule
