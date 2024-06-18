// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 4X2 PRIORITY ENCODER BEHAVIORAL
************************************************/

module encode_4_2_priority_bh(Y,V,I);

	input [3:0]I;
	output reg [1:0]Y;
	output reg V;

	always@(*) begin
		if(I[0]) {V,Y}=3'b100;
		else if(I[1]) {V,Y}=3'b101;
		else if(I[2]) {V,Y}=3'b110;
		else if(I[3]) {V,Y}=3'b111;
		else {V,Y}=3'b000;
	end

endmodule