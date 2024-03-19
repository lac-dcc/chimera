module b7_4bit_dec_assign_shift (
  input [3:0] binary_in,
  output wire [15:0] decoder_out,
  input enable
);

assign decoder_out = (enable) ? (1 << binary_in) : 16'b0 ;

endmodule

module b7_anybit_dec_assign_shift (
 binary_in, decoder_out, enable
);

   parameter IN_SIZE = 4; 
	parameter OUT_SIZE = 2<<IN_SIZE;
	
	input  wire [IN_SIZE-1:0] binary_in;
	output wire [OUT_SIZE-1:0] decoder_out;
	input enable;

   assign decoder_out = (enable) ? (1 << binary_in) : 0 ;

endmodule

module timeQuest_wrapper(clock,SW,LED,enable);
	input clock,enable;
	input [3:0] SW;
	output [9:0] LED;
 
	reg [3:0] SW_reg;
	reg [9:0] LED_reg; // registers for 'catching' time
 
	wire [9:0] LED_wire;
	wire [3:0] SW_wire;
	assign SW_wire = SW_reg;
	
	// creating our test instance
	b7_4bit_dec_assign_shift (SW_reg,LED_wire,enable);
  
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

	b7_4bit_dec_assign_shift  (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule