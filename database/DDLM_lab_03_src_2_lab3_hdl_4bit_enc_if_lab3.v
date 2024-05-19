// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module b2_enc_if(
   input [15:0] encoder_in,
   output reg [3:0] binary_out,
   input enable
  );

 always @ (*)
   begin
    binary_out = 0;
    if (enable) begin
		 if (encoder_in == 16'h1) begin
			binary_out = 0;
		 end  if (encoder_in == 16'h2) begin
			binary_out = 1;
		 end  if (encoder_in == 16'h4) begin
			binary_out = 2;
		 end  if (encoder_in == 16'h8) begin
			binary_out = 3;
		 end  if (encoder_in == 16'h10) begin
			binary_out = 4;
		 end  if (encoder_in == 16'h20) begin
			binary_out = 5;
		 end  if (encoder_in == 16'h40) begin
			binary_out = 6;
		 end  if (encoder_in == 16'h80) begin
			binary_out = 7;
		 end  if (encoder_in == 16'h100) begin
			binary_out = 8;
		 end  if (encoder_in == 16'h200) begin
			binary_out = 9;
		 end  if (encoder_in == 16'h400) begin
			binary_out = 10;
		 end  if (encoder_in == 16'h800) begin
			binary_out = 11;
		 end  if (encoder_in == 16'h1000) begin
			binary_out = 12;
		 end  if (encoder_in == 16'h2000) begin
			binary_out = 13;
		 end  if (encoder_in == 16'h4000) begin
			binary_out = 14;
		 end  if (encoder_in == 16'h8000) begin
			binary_out = 15;
		 end
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
	b2_enc_if (SW_reg,LED_wire,enable);
  
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

	//b2_enc_if (SW,LEDR,KEY[0]);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	timeQuest_wrapper(KEY[1],SW,LEDR,KEY[0]);
	
endmodule