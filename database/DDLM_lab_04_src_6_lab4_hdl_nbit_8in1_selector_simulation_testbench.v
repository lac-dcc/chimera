`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
	parameter DATA_WIDTH = 8;
    // input and output test signals
    wire  [DATA_WIDTH-1:0] y;
	reg   [7:0] sel;
	reg   [DATA_WIDTH-1:0] d0; 
	reg	  [DATA_WIDTH-1:0] d1;
	reg   [DATA_WIDTH-1:0] d2;
	reg   [DATA_WIDTH-1:0] d3;
	reg   [DATA_WIDTH-1:0] d4; 
	reg   [DATA_WIDTH-1:0] d5;
	reg   [DATA_WIDTH-1:0] d6;
	reg   [DATA_WIDTH-1:0] d7;
 
   // creating the instance of the module we want to test
	bn_select_8_1_case #(8) select_8_1 (.d0(d0), .d1(d1), .d2(d2), 
	                                           .d3(d3), .d4(d4), .d5(d5), 
											   .d6(d6), .d7(d7), .sel(sel), .y(y));
	
	initial 
        begin
			d0=0; d1=1; d2=2; d3=3; d4=4; d5=5; d6=6; d7=7;
			#5;
            sel = 8'b00000001;     
			#10;
			repeat (7)
			begin
				sel=sel<<1;
				#10;
			end
			d7=123;
			#10;
			d7=77;
			#10;
			sel=$urandom;
			#10;
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("sel=%b d0=%d d1=%d d2=%d d3=%d d4=%d d5=%d d6=%d d7=%d y=%d", 
		         sel, d0, d1, d2, d3, d4, d5, d6, d7, y);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
