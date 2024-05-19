// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1ns/1ns

module testbench;
    // input and output test signals

	reg clk;
	reg [5:0] addr;
	wire [3:0] data_out;
	wire [5:0] addr_out;
	integer i;
 
    // creating the instance of the module we want to test
    //  lab7_41 - module name
    //  dut  - instance name ('dut' means 'device under test')
    lab7_4 dut (clk, addr, data_out, addr_out);
	
initial 
	begin
		// set initial values of signal
		clk = 0;
		#20; 				// pause
		addr = 6'b000000;	// set address signals value
            for (i=0 ; i<=16; i=i+1)
            begin
				#20; 			// pause
				addr = addr+6'b000001;	// set address signals value
            end
	end
	
	//every 10 ns invert clk 
	always #10 clk = ~clk;
	
	initial 
		#380 $finish;
	   
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("clk=%b addr=%b data_out=%b addr_out=%b", 
			clk, addr, data_out, addr_out);

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule
