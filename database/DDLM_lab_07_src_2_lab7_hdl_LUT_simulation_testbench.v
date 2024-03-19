// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

	reg [3:0] x;
	wire y;

    // creating the instance of the module we want to test
    //  lab7_2 - module name
    //  dut  - instance name ('dut' means 'device under test')
    lab7_2 dut ( x, y );
	
initial 
	begin
		// set inital values of signal
		x = 4'b0000;
	
        repeat(15)
        begin
			#10;                     
			x = x + 4'b0001;	 
        end
	end
	
	initial 
		#160 $finish;
	
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("x=%b y=%h", x, y);

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule
