// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

    reg [9:0] gray_code;

    wire [9:0] binary_code;

b10_gray2bin_v1 b10_gray2bin_v1 (gray_code,binary_code);

initial 
    begin
        // set inital values of signal
        gray_code = 0;

		
        #1;                                           
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
	#1;
           gray_code=gray_code+1;
        #1;
           gray_code=gray_code+1;
	#1;
           gray_code=gray_code+1;

    end
    


   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("gray_code=%b, binary_code=%b",
            gray_code, binary_code);

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule