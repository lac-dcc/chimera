module b11_seven_seg(
  input [3:0] binary_in,
  output reg [6:0] hex_out
);

always @ (*)
	begin
		case(binary_in)
		 0:hex_out = 7'b1000000;
		 1:hex_out = 7'b1111001;
		 2:hex_out = 7'b0100100;
		 3:hex_out = 7'b0110000;
		 4:hex_out = 7'b0011001;
		 5:hex_out = 7'b0010010;
		 6:hex_out = 7'b0000010;
		 7:hex_out = 7'b1111000;
		 8:hex_out = 7'b0000000;
		 9:hex_out = 7'b0010000;
		 default:hex_out = 7'b111111;
		endcase
	end

endmodule



module timeQuest_wrapper(clock,SW,LED);
	input clock;
	input [3:0] SW;
	output [9:0] LED;
 
	reg [3:0] SW_reg;
	reg [9:0] LED_reg; // registers for 'catching' time
 
	wire [9:0] LED_wire;
	wire [3:0] SW_wire;
	assign SW_wire = SW_reg;
	
	// creating our test instance
	b11_seven_seg (SW_reg,LED_wire);
  
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

	b11_seven_seg  (SW,LEDR);
	// Please comment the line above and uncomment line below to use timeQUest_wrapper
	//timeQuest_wrapper(KEY[1],SW,LEDR);
	
endmodule