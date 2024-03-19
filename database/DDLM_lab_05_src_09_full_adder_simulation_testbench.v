`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
   // input and output test signals
   reg  c_in;
   reg  x, y;
   wire z_behavioral, z_structural;
   wire c_out_behavioral, c_out_structural;
 
   // create the instances of the modules you want to test
    full_adder full_adder_behavioral_dut(
        .carry_in ( c_in             ),
        .x        ( x                ),
        .y        ( y                ),
        .z        ( z_behavioral     ),
        .carry_out( c_out_behavioral )
    );
    
    full_adder_structural full_adder_structural_dut(
        .carry_in ( c_in             ),
        .x        ( x                ),
        .y        ( y                ),
        .z        ( z_structural     ),
        .carry_out( c_out_structural )
    );
    
    //write test sequence
    initial begin
        x    = 1'b0;
        y    = 1'b0;
        c_in = 1'b0;
        #8
        $stop;
    end
    
    initial
        forever begin
            #1;
            if( x == 1'b1 ) begin
                x = 1'b0;
                y = y + 1;
            end
            else begin
                x = x + 1;
            end
        end
        
    initial
        forever begin
            #4 c_in = c_in + 1;
        end
    
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("Time:\t%g, x: %b, y: %b, c_in %b, z_b: %b, z_s: %b, c_out_b: %b, c_out_s: %b",
                $time,
                x,
                y,
                c_in,
                z_behavioral,
                z_structural,
                c_out_behavioral,
                c_out_structural
            );
            
    // do at the beginning of the simulation
    //configure signals dump for waveform's creation
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars(1);  //iverilog dump init
    end
    
endmodule
