// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

    reg [3:0] binary;

    wire [6:0] indicator_binary;

b11_seven_seg b11_seven_seg (binary,indicator_binary);

initial 
    begin
        // set inital values of signal
        binary = 0;

		
        #1;                                           
           binary=binary+1;
        #1;
           binary=binary+1;
        #1;
           binary=binary+1;
        #1;
           binary=binary+1;
        #1;
           binary=binary+1;
        #1;
           binary=binary+1;
        #1;
           binary=binary+1;
        #1;
           binary=binary+1;
        #1;
           binary=binary+1;
	#1;
           binary=binary+1;
        #1;
           binary=binary+1;
	#1;
           binary=binary+1;

    end
    


    
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("binary=%b, indicator_binary=%b",
            binary, indicator_binary);

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule