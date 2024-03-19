`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    parameter WIDTH = 8;
    // input and output test signals
    reg  c_in;
    reg  [WIDTH - 1:0] x, y;
    wire [WIDTH - 1:0] z;
    wire c_out;
 
   // create the instances of the modules you want to test
    adder #(.WIDTH(WIDTH)) adder_dut(
        .carry_in (c_in ),
        .x        (x    ),
        .y        (y    ),
        .z        (z    ),
        .carry_out(c_out)
    );
        
    //write test sequence
    initial begin
        x    = 0;
        y    = 0;
        c_in = 0;
        #8
        $stop;
    end
    
    initial
        forever begin
            #1;
            x = $urandom_range(0, 2 ** WIDTH - 1);
            y = $urandom_range(0, 2 ** WIDTH - 1);
            
            c_in = $urandom_range(0, 1);
        end
            
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("Time:\t%g, x: %b, y: %b, c_in: %b, z: %b, c_out: %b",
                $time,
                x,
                y,
                c_in,
                z,
                c_out
            );
            
    // do at the beginning of the simulation
    //configure signals dump for waveform's creation
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars(1);  //iverilog dump init
    end
    
endmodule
