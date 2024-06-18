// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module select_encode_logic(
	IRdataOut, //going into select_encode_logic
	Gra,
	Grb,
	Grc,
	Rin,
	Rout,
	BAout,
	regIn,
	regOut, //going out of select_encode_logic
	CSignExtdataOut //going out of select_encode_logic
	);
	
	input wire 	
		Gra,
		Grb,
		Grc,
		Rin,
		Rout,
		BAout;

	output reg [15:0] regIn, regOut;
		
	input wire [31:0] IRdataOut;
	
	output [31:0] CSignExtdataOut;
	
	reg [3:0] tempReg;
	
	
	always@(*) begin
	
		//set all tozero at first
		regIn = 0;
		regOut = 0;
	
		if(Gra == 1) 
			tempReg = IRdataOut[26:23];	
	
		else if(Grb == 1) 
			tempReg = IRdataOut[22:19];
	
		else if(Grc == 1) 
			tempReg = IRdataOut[18:15];
			
		if(Rin == 1) 
			regIn[tempReg] = 1;

		else if (Rout == 1 || BAout)
			regOut[tempReg] = 1;
		
	end
	
	assign CSignExtdataOut = $signed(IRdataOut[18:0]);
		
endmodule
