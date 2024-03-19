`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
parameter DATA_CASE_WIDTH = 8;
parameter DATA_BLOCK_WIDTH  = 2;
    // input and output test signals
    wire  [DATA_CASE_WIDTH-1:0] dout0_case;
	wire  [DATA_CASE_WIDTH-1:0] dout1_case;
    wire  [DATA_CASE_WIDTH-1:0] dout2_case;
	wire  [DATA_CASE_WIDTH-1:0] dout3_case;
	wire  [DATA_BLOCK_WIDTH-1:0] dout0_block;
	wire  [DATA_BLOCK_WIDTH-1:0] dout1_block;
    wire  [DATA_BLOCK_WIDTH-1:0] dout2_block;
	wire  [DATA_BLOCK_WIDTH-1:0] dout3_block;
	reg   [1:0] sel;
	reg   [DATA_CASE_WIDTH-1:0] din_case;
	reg   [DATA_BLOCK_WIDTH-1:0] din_block;
	
 
   // creating the instance of the module we want to test
	bn_demux_1_4_case #(DATA_CASE_WIDTH) bn_demux_1_4_case (.din(din_case), .sel(sel), .dout0(dout0_case), .dout1(dout1_case), .dout2(dout2_case), .dout3(dout3_case));
	b2_demux_1_4_block b2_demux_1_4_block (.din(din_block), .sel(sel), .dout0(dout0_block), .dout1(dout1_block), .dout2(dout2_block), .dout3(dout3_block));
	
	initial 
        begin
			din_case=8'b11111111;
			din_block=din_case;
			#5;
            sel = 2'b00;     // sel change to 00; a -> y
			#10;
			sel = 2'b01;     // sel change to 01; b -> y
			#10
			sel = 2'b10;     // sel change to 10; c -> y
			#10;
			sel = 2'b11;     // sel change to 11; ? -> y
			#10;
			din_case=8'b10101010;
			din_block=din_case;
			#10;
			din_case=8'b01010101;
			din_block=din_case;
			#10;
        end
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("sel=%b din_case=%b din_block=%b dout0_case=%b dout1_case=%b dout2_case=%b dout3_case=%b dout0_block=%b dout1_block=%b dout2_block=%b dout3_block=%b", 
		         sel, din_case, din_block, dout0_case, dout1_case, dout2_case, dout3_case, dout0_block, dout1_block, dout2_block, dout3_block);
    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init
endmodule
