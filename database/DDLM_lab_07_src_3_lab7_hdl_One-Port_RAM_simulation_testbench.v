`timescale 1ns/1ns
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals

    reg [3:0] data_in;
    reg [5:0] addr;
    reg we;
    reg clk;
    wire [3:0] data_out;
    wire [5:0] addr_out;

    // creating the instance of the module we want to test
    lab7_3 dut (data_in, addr, we, clk, data_out, addr_out);
    
    initial 
    begin
        // set initial values of signal
        clk = 0;
        we = 0;
        addr = 6'b000000;
        data_in = 4'b0000; 

        // write data in RAM
        #20; we = 0;                  // write enable
        for (addr=0; addr < 6; addr= addr+1)
            begin
                #20;
                data_in = data_in + 1;
            end

        //read data from RAM
        #20; we = 1;
        for (addr=0; addr < 6; addr= addr+1)
            #20; // end of for loop     
    end
    
    //every 10 ns invert clk 
    always #10 clk = ~clk;
    
    initial 
        #300 $finish;
    
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("data_in=%b addr=%b we=%b clk=%b data_out=%b addr_out=%b", 
            data_in, addr, we, clk, data_out, addr_out);

   // do at the beginning of the simulation
   initial 
       $dumpvars;

endmodule