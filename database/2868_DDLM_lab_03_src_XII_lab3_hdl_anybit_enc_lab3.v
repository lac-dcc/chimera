// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b12_anybit_enc (in,enc_out,enable);
	parameter OUT_SIZE = 4; // configure this parameter only to get amount of output bits
	parameter IN_SIZE = 1<<OUT_SIZE; // input bits are calculated like 2^(output bits)
	
	input  wire [IN_SIZE-1:0] in;
	output wire [OUT_SIZE-1:0] enc_out;
	
	reg [OUT_SIZE-1:0] out;
	assign enc_out = out;
	input enable;
	integer i;
	always @(in) begin
		if(enable) begin
			i=0;
			while (i<IN_SIZE-1 && !in[i]) i=i+1;
			out <= i;
		end else out<=0;
	end
endmodule




module timeQuest_wrapper(clock,SW,LED,enable);
	input clock,enable;
	input [9:0] SW;
	output [3:0] LED;
 
	reg [9:0] SW_reg;
	reg [3:0] LED_reg; // registers for 'catching' time
 
	wire [3:0] LED_wire;
	wire [9:0] SW_wire;
	assign SW_wire = SW_reg;
	
	// creating our test instance
	b12_anybit_enc (SW_reg,LED_wire,enable);
  
   // clock needed to determine at which step register was filled with data
	always @(posedge clock)
		begin
			SW_reg <= SW; // avoiding race and latch by setting '<=' instead of '='
			LED_reg<=LED_wire;
		end
	assign LED = LED_reg;
endmodule


module lab3
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

	//b12_anybit_enc  (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule