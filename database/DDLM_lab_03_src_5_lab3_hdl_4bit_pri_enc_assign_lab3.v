module b5_pri_enc_assign(
   input [15:0] encoder_in,
   output [3:0] binary_out,
   input enable
  );

assign binary_out  = (enable) ? (
    (encoder_in[15] == 1'b1) ? 15 :
    (encoder_in[14] == 1'b1) ? 14 :
    (encoder_in[13] == 1'b1) ? 13 :
    (encoder_in[12] == 1'b1) ? 12 :
    (encoder_in[11] == 1'b1) ? 11 :
    (encoder_in[10] == 1'b1) ? 10 :
    (encoder_in[9] == 1'b1) ? 9 :
    (encoder_in[8] == 1'b1) ? 8 :
    (encoder_in[7] == 1'b1) ? 7 :
    (encoder_in[6] == 1'b1) ? 6 :
    (encoder_in[5] == 1'b1) ? 5 :
    (encoder_in[4] == 1'b1) ? 4 :
    (encoder_in[3] == 1'b1) ? 3 :
    (encoder_in[2] == 1'b1) ? 2 :
    (encoder_in[1] == 1'b1) ? 1 :
    (encoder_in[0] == 1'b1) ? 0 : 4'bxxxx):0;
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
	b5_pri_enc_assign (SW_reg,LED_wire,enable);
  
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

	b5_pri_enc_assign (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule