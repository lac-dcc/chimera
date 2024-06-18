// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals
   
    reg [5:0] binary;

    wire [8:0] LED_wire;
 
   // creating the instance of the module we want to test
	b9_6bit_dec_mips_maindec b9_6bit_dec_mips_maindec (binary,LED_wire[0],LED_wire[1],LED_wire[2],
										LED_wire[3],LED_wire[4],LED_wire[5],LED_wire[6],{LED_wire[7],LED_wire[8]});
	
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
           binary=6'b100011;
        #1;                                         
           binary=6'b101011;
        #1;
           binary=binary+1;
        #1;
           binary=6'b000100;
        #1;
           binary=binary+1;
        #1;
           binary=6'b001000;
        #1;
           binary=binary+1;
        #1;
           binary=6'b000010;
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
	   	   binary = 1;
        #1;
           binary=binary+1;

    end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
         $monitor("binary=%b, LED_wire=%b",
            binary, LED_wire);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
