// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module CON_FF(
	input [1:0] IR_Bits,
	input [31:0] busMuxOut,
	input conInput,
	output reg conOutput
);


//if con is enabled
always @(posedge conInput) 
	begin

	if (busMuxOut == 32'd0 && IR_Bits == 0)
		//branch if equal
		 conOutput = 1'b1;
	else if (busMuxOut != 1'd0 && IR_Bits == 1)
		//branch if not equal
		 conOutput = 1'b1;
	else if (busMuxOut[31] == 0 && IR_Bits == 2)
		//branch if greater than
		 conOutput = 1'b1;
	else if (busMuxOut[31] == 1 && IR_Bits == 3)
		//branch if less than
		 conOutput = 1'b1;
	else 
		 conOutput = 1'b0;

	//else return 0	

	end
endmodule