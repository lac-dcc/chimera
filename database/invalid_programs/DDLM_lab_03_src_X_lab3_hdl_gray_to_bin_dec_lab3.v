module b10_gray2bin_v1(
   input  wire [9:0]gray,
   output wire [9:0]bin
);

	assign bin[0] = gray[9] ^ gray[8] ^ gray[7] ^ gray[6] ^ gray[5] ^ gray[4] ^ gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
	assign bin[1] = gray[8] ^ gray[7] ^ gray[6] ^ gray[5] ^ gray[4] ^ gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
	assign bin[2] = gray[7] ^ gray[6] ^ gray[5] ^ gray[4] ^ gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
	assign bin[3] = gray[6] ^ gray[5] ^ gray[4] ^ gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
	assign bin[4] = gray[5] ^ gray[4] ^ gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
	assign bin[5] = gray[4] ^ gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
	assign bin[6] = gray[3] ^ gray[2] ^ gray[1] ^ gray[0];
	assign bin[7] = gray[2] ^ gray[1] ^ gray[0];
	assign bin[8] = gray[1] ^ gray[0];
	assign bin[9] = gray[0];

endmodule


module b10_gray2bin_v2(gray, bin);
	parameter SIZE = 10;

	input  wire [SIZE-1:0]gray;
	output wire [SIZE-1:0]bin;

	genvar i;

	generate
		 for (i=0; i<SIZE; i=i+1)
			begin: bit
				assign bin[i] = ^gray[SIZE-1:i];
			end
		endgenerate
endmodule



module timeQuest_wrapper(clock,SW,LED);
	input clock;
	input [9:0] SW;
	output [9:0] LED;
 
	reg [9:0] SW_reg;
	reg [9:0] LED_reg; // registers for 'catching' time
 
	wire [9:0] LED_wire;
	wire [9:0] SW_wire;
	assign SW_wire = SW_reg;
	
	// creating our test instance
	b10_gray2bin_v1 (SW_reg,LED_wire);
  
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

	b10_gray2bin_v2  (SW,LEDR);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR);
	
endmodule