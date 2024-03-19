`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
	parameter DATA_WIDTH = 8;
	parameter SEL_WIDTH = 3;	//2;
	parameter INPUT_CHANNELS = 8;
    // input and output test signals
    wire  [DATA_WIDTH-1:0] y;
	wire  [DATA_WIDTH-1:0] y2;
	reg   [SEL_WIDTH-1:0] sel;
	reg   [INPUT_CHANNELS-1:0] sel2;
	reg   [DATA_WIDTH-1:0] d0; 
	reg	  [DATA_WIDTH-1:0] d1;
	reg   [DATA_WIDTH-1:0] d2;
	reg   [DATA_WIDTH-1:0] d3;
	reg   [DATA_WIDTH-1:0] d4; 
	reg   [DATA_WIDTH-1:0] d5;
	reg   [DATA_WIDTH-1:0] d6;
	reg   [DATA_WIDTH-1:0] d7;
 
   // creating the instance of the module we want to test
	bn_mux_n_1_generate #(DATA_WIDTH,SEL_WIDTH) bn_mux_n_1_generate (.data({d7,d6,d5,d4,d3,d2,d1,d0}), .sel(sel), .y(y));
	//bn_mux_n_1_generate #(DATA_WIDTH,SEL_WIDTH) bn_mux_n_1_generate (.data({d3,d2,d1,d0}), .sel(sel), .y(y));
	
	bn_selector_n_1_generate #(DATA_WIDTH,INPUT_CHANNELS) bn_selector_n_1_generate (.data({d7,d6,d5,d4,d3,d2,d1,d0}), .sel(sel2), .y(y2));
	
	initial 
        begin
			d0=0; d1=1; d2=2; d3=3; d4=4; d5=5; d6=6; d7=7;
			#5;
            sel = 0;     
			sel2 = 8'b00000001;
			#10;
			repeat (2**SEL_WIDTH-1)	
			begin
				sel=sel+1;
				sel2=sel2<<1;
				#10;
			end
			d7=123;
			#10;
			d7=77;
			#10;
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("sel=%b sel2=%b d0=%d d1=%d d2=%d d3=%d d4=%d d5=%d d6=%d d7=%d y=%d y2=%d", 
		         sel, sel2, d0, d1, d2, d3, d4, d5, d6, d7, y, y2);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
