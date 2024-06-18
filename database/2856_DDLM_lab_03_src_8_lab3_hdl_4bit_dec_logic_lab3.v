// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b8_4bit_dec_assign_logic(in,out,enable);
  input enable;
  input [3:0] in;
  output  [15:0] out;
  
  assign out[0] = !in[0] & !in[1] & !in[2] & !in[3] & enable;
  assign out[1] = in[0] & !in[1] & !in[2] & !in[3] & enable;
  assign out[2] = !in[0] & in[1] & !in[2] & !in[3] & enable;
  assign out[3] = in[0] & in[1] & !in[2] & !in[3] & enable;
  assign out[4] = !in[0] & !in[1] & in[2] & !in[3] & enable;
  assign out[5] = in[0] & !in[1] & in[2] & !in[3] & enable;
  assign out[6] = !in[0] & in[1] & in[2] & !in[3] & enable;
  assign out[7] = in[0] & in[1] & in[2] & !in[3] & enable;
  assign out[8] = !in[0] & !in[1] & !in[2] & in[3] & enable;
  assign out[9] = in[0] & !in[1] & !in[2] & in[3] & enable;
  assign out[10] = !in[0] & in[1] & !in[2] & in[3] & enable;
  assign out[11] = in[0] & in[1] & !in[2] & in[3] & enable;
  assign out[12] = !in[0] & !in[1] & in[2] & in[3] & enable;
  assign out[13] = in[0] & !in[1] & in[2] & in[3] & enable;
  assign out[14] = !in[0] & in[1] & in[2] & in[3] & enable;
  assign out[15] = in[0] & in[1] & in[2] & in[3] & enable;
  
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
	b8_4bit_dec_assign_logic (SW_reg,LED_wire,enable);
  
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

	b8_4bit_dec_assign_logic  (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule