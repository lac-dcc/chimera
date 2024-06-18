// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    // input and output test signals
    reg  [1:0] a;
	reg  [1:0] b;
	reg  sel;
    wire [1:0] y_comb_correct1;
	wire [1:0] y_comb_correct2;
	wire [1:0] y_comb_incorrect;
	wire [1:0] y_sel;
	wire [1:0] y_if;
	wire [1:0] y_case;
 
   // creating the instance of the module we want to test
	b2_mux_2_1_sel b2_mux_2_1_sel  (a, b, sel, y_sel);
	b2_mux_2_1_if b2_mux_2_1_if  (a, b, sel, y_if);
	b2_mux_2_1_case b2_mux_2_1_case  (a, b, sel, y_case);
	b2_mux_2_1_comb_correct1 b2_mux_2_1_comb_correct1  (a, b, sel, y_comb_correct1);
	b2_mux_2_1_comb_correct2 b2_mux_2_1_comb_correct2  (a, b, sel, y_comb_correct2);
	b2_mux_2_1_comb_incorrect b2_mux_2_1_comb_incorrect  (a, b, sel, y_comb_incorrect);
	
	
	initial 
        begin
			a = 2'b00;
			b = 2'b11;
			#5;
            sel = 1'b0;     // sel change to 0; a -> y
			#10;
			sel = 1'b1;     // sel change to 1; b -> y
			#10
			b = 2'b10;		// b change; y changes too. sel == 1'b1
			#5
			b = 2'b01;
            #5;            // pause
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("a=%b b=%b sel=%b y_sel=%b y_if=%b y_case=%b y_comb_corr1=%b y_comb_corr2=%b y_comb_incorr=%b", 
		         a, b, sel, y_sel, y_if, y_case, y_comb_correct1, y_comb_correct2, y_comb_incorrect);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
