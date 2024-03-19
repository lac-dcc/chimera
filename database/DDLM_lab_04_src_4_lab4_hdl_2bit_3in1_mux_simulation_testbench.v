`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals
    reg  [1:0] a;
	reg  [1:0] b;
    reg  [1:0] c;
	reg  [1:0] sel;
	wire [1:0] y_case_correct;
	wire [1:0] y_casex_correct;
	wire [1:0] y_case_latch;
 
   // creating the instance of the module we want to test
	b2_mux_3_1_case_latch b2_mux_3_1_case_latch(a,b,c,sel,y_case_latch);
	b2_mux_3_1_case_correct b2_mux_3_1_case_correct(a,b,c,sel,y_case_correct);
	b2_mux_3_1_casex_correct b2_mux_3_1_casex_correct(a,b,c,sel,y_casex_correct);
	
	initial 
        begin
			a = 2'b00;
			b = 2'b01;
			c = 2'b10;
			#5;
            sel = 2'b00;     // sel change to 00; a -> y
			#10;
			sel = 2'b01;     // sel change to 01; b -> y
			#10
			sel = 2'b10;     // sel change to 10; c -> y
			#10;
			sel = 2'b11;     // sel change to 11; ? -> y
			#10;
			sel = 2'b00;     // sel change to 00; a -> y
			#10;
			sel = 2'b11;     // sel change to 11; ? -> y
			#10;
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("a=%b b=%b c=%b sel=%b y_case_latch=%b y_case_correct=%b y_casex_correct=%b", 
		         a, b, c, sel, y_case_latch, y_case_correct, y_casex_correct);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
