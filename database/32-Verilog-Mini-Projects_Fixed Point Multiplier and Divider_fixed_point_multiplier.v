module qmult #(
	//Parameterized values
	parameter Q = 15,
	parameter N = 32
	)
	(
	 input			[N-1:0]	i_multiplicand,
	 input			[N-1:0]	i_multiplier,
	 output			[N-1:0]	o_result,
	 output	reg				ovr
	 );
	 
	
	
	reg [2*N-1:0]	r_result;		
											
	reg [N-1:0]		r_RetVal;
	

	assign o_result = r_RetVal;	
	
	always @(i_multiplicand, i_multiplier)	begin						
		r_result <= i_multiplicand[N-2:0] * i_multiplier[N-2:0];	
																
		ovr <= 1'b0;															
		end
	
		
	always @(r_result) begin													
		r_RetVal[N-1] <= i_multiplicand[N-1] ^ i_multiplier[N-1];	
		r_RetVal[N-2:0] <= r_result[N-2+Q:Q];								
																						
		if (r_result[2*N-2:N-1+Q] > 0)										
			ovr <= 1'b1;
		end

endmodule
module Test_mult;

	// Inputs
	reg [31:0] i_multiplicand;
	reg [31:0] i_multiplier;

	// Outputs
	wire [31:0] o_result;
	wire			ovr;
	
	// Instantiate the Unit Under Test (UUT)
	qmult #(19,32) uut (
		.i_multiplicand(i_multiplicand), 
		.i_multiplier(i_multiplier), 
		.o_result(o_result),
		.ovr(ovr)
	);

	initial begin
		$monitor ("%b,%b,%b,%b", i_multiplicand, i_multiplier, o_result, ovr);		
		
		// Initialize Inputs
 		i_multiplicand = 32'b00000000000110010010000111111011;	//pi = 3.141592
		i_multiplicand[31] = 0;												
		i_multiplier[31] = 0;												
		i_multiplier[30:0] = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#100 i_multiplier[0] = 1;		//	1.91E-6
  	end

	// Add stimulus here
	always begin
		#10 i_multiplier[30:0] = (i_multiplier[30:0] << 1) + 1;		
	end
      
endmodule
