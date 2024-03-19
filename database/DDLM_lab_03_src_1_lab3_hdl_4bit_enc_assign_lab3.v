module b1_enc_assign(
   input [15:0] in,
   output [3:0] binary_out,
   input enable
  );

  assign binary_out[0] = (in[1] | in[3] | in[5] | in[7] | in[9] | in[11] | in[13] | in[15]) & enable;
  assign binary_out[1] = (in[2] | in[3] | in[6] | in[7] | in[10] | in[11] | in[14] | in[15]) & enable;
  assign binary_out[2] = (in[4] | in[5] | in[6] | in[7] | in[12] | in[13] | in[14] | in[15]) & enable;
  assign binary_out[3] = (in[8] | in[9] | in[10] | in[11] | in[12] | in[13] | in[14] | in[15]) & enable;

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
	b1_enc_assign (SW_reg,LED_wire,enable);
  
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

	b1_enc_assign (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule