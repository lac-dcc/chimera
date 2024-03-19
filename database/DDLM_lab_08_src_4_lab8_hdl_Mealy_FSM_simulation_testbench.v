// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

    reg clock;
    reg reset_n;
    reg enable;
	reg a;
    wire y;
	wire [1:0] state;

    // creating the instance of the module we want to test
    //  lab8_4 - module name
    //  dut  - instance name ('dut' means 'device under test')
    lab8_4 dut (clock, reset_n, enable, a, y);
    assign state = dut.state;
	
initial 
    begin
        // set inital values of signal
        clock = 1;
        reset_n = 0;
        enable = 1;
		a = 1;
        
        #10; reset_n = 1;
		repeat (7)
		begin
			enable = 0;
			#20; a = 0;
			enable = 1;
			#20; a = 1;
			#20; 			
		end
    end
    
    //every 10 ns invert clk 
    always #10 clock = ~clock;

    initial 
        #250 $finish;
    
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("clock=%b, reset_n=%b, enable=%b, a=%b, y=%b, state=%b", 
            clock, reset_n, enable, a, y, state);

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule