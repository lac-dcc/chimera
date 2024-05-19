// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b13_custombit_dec (
   binary_in,
   decoder_out,
   enable
);

	parameter IN_SIZE = 4;
	parameter OUT_SIZE = 1<<IN_SIZE;
	
	input  wire [IN_SIZE-1:0] binary_in;
	output wire [OUT_SIZE-1:0] decoder_out;
	input enable;
	
	genvar i;

	generate		
		for (i=0; i<OUT_SIZE; i=i+1) begin : gen
		 assign decoder_out[i] = binary_in==i & enable ? 1'b1 : 1'b0;
		end
	endgenerate
endmodule



module timeQuest_wrapper(clock,SW,LED,enable);
	input clock;
	input [3:0] SW;
	input enable;
	output [9:0] LED;
	
	reg [3:0] SW_reg;
	reg [9:0] LED_reg; // registers for 'catching' time
 
	wire [9:0] LED_wire;
	wire [3:0] SW_wire;
	assign SW_wire = SW_reg;
	
	// creating our test instance
	b13_custombit_dec (SW_reg,LED_wire,enable);
  
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

	//b12_custombit_dec  (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule