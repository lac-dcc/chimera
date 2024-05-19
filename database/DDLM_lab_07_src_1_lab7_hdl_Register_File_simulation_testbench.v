// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

    reg              clk;
    reg     [6:0]    SW;
    wire    [3:0]    LEDR;

    // creating the instance of the module we want to test
    //  lab7_1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    lab7_1 dut ( clk, SW, LEDR );
    
initial 
    begin
        // set inital values of signal
        clk = 1;
        SW = 7'b1001111;
        #5;                     
        
        repeat(3)
        begin
            #20;                     
            SW[5:4] = SW[5:4]+2'b01;     
        end

        #40; 
        SW = 7'b0000000;
        repeat(3)
        begin
            #20;                     
            SW[5:4] = SW[5:4]+2'b01;     
        end
    end
    
    //every 10 ns invert clk 
    always #10 clk = ~clk;

    
    initial 
        #200 $finish;
    
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("clk=%b SW=%h LEDR=%h", 
            clk, SW, LEDR);

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule
