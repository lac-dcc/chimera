`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
   // input and output test signals
   reg  x, y;
   wire z_behavioral, z_structural;
   wire c_out_behavioral, c_out_structural;
 
   // create the instances of the modules you want to test
    half_adder half_adder_behavioral_dut(
        .x        ( x                ),
        .y        ( y                ),
        .z        ( z_behavioral     ),
        .carry_out( c_out_behavioral )
    );
    
    half_adder_structural half_adder_structural_dut(
        .x        ( x                ),
        .y        ( y                ),
        .z        ( z_structural     ),
        .carry_out( c_out_structural )
    );
    
    //write test sequence
    initial begin
        x = 2'b00;
        y = 2'b00;
        #4
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
    
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("Time:\t%g, x: %b, y: %b, z_b: %b, z_s: %b, c_out_b: %b, c_out_s: %b",
                $time,
                x,
                y,
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
