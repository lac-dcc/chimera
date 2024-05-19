// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b4_pri_enc_if(
   input [15:0] encoder_in,
   output reg [3:0] binary_out,
   input enable
  );

always @ (*)
begin
  binary_out = 0;
  if (enable) begin
   if (encoder_in[0] == 1'b1)
		binary_out = 0;
    else if (encoder_in[1] == 1'b1)
		binary_out = 1;
    else if (encoder_in[2] == 1'b1)
		binary_out = 2;
    else if (encoder_in[3] == 1'b1)
		binary_out = 3;
    else if (encoder_in[4] == 1'b1)
		binary_out = 4;
    else if (encoder_in[5] == 1'b1)
		binary_out = 5;
    else if (encoder_in[6] == 1'b1)
		binary_out = 6;
    else if (encoder_in[7] == 1'b1)
		binary_out = 7;
    else if (encoder_in[8] == 1'b1)
		binary_out = 8;
    else if (encoder_in[9] == 1'b1)
		binary_out = 9;
    else if (encoder_in[10] == 1'b1)
		binary_out = 10;
    else if (encoder_in[11] == 1'b1)
		binary_out = 11;
    else if (encoder_in[12] == 1'b1)
		binary_out = 12;
    else if (encoder_in[13] == 1'b1)
		binary_out = 13;
    else if (encoder_in[14] == 1'b1)
		binary_out = 14;
    else if (encoder_in[15] == 1'b1)
		binary_out = 15;

  end
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
	b4_pri_enc_if (SW_reg,LED_wire,enable);
  
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

	b4_pri_enc_if (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule