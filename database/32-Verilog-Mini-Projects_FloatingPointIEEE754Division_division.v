// Priority Encoder

module priority_encoder(
			input [24:0] significand,
			input [7:0] exp_a,
			output reg [24:0] Significand,
			output [7:0] exp_sub
			);

reg [4:0] shift;

always @(significand)
begin
	casex (significand)
		25'b1_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand = significand;
									 				shift = 5'd0;
								 			  	end
		25'b1_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand = significand << 1;
									 				shift = 5'd1;
								 			  	end

		25'b1_001x_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand = significand << 2;
									 				shift = 5'd2;
								 				end

		25'b1_0001_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin 							
													Significand = significand << 3;
								 	 				shift = 5'd3;
								 				end

		25'b1_0000_1xxx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand = significand << 4;
								 	 				shift = 5'd4;
								 				end

		25'b1_0000_01xx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand = significand << 5;
								 	 				shift = 5'd5;
								 				end

		25'b1_0000_001x_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h020000
									 				Significand = significand << 6;
								 	 				shift = 5'd6;
								 				end

		25'b1_0000_0001_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h010000
									 				Significand = significand << 7;
								 	 				shift = 5'd7;
								 				end

		25'b1_0000_0000_1xxx_xxxx_xxxx_xxxx : 	begin						// 24'h008000
									 				Significand = significand << 8;
								 	 				shift = 5'd8;
								 				end

		25'b1_0000_0000_01xx_xxxx_xxxx_xxxx : 	begin						// 24'h004000
									 				Significand = significand << 9;
								 	 				shift = 5'd9;
								 				end

		25'b1_0000_0000_001x_xxxx_xxxx_xxxx : 	begin						// 24'h002000
									 				Significand = significand << 10;
								 	 				shift = 5'd10;
								 				end

		25'b1_0000_0000_0001_xxxx_xxxx_xxxx : 	begin						// 24'h001000
									 				Significand = significand << 11;
								 	 				shift = 5'd11;
								 				end

		25'b1_0000_0000_0000_1xxx_xxxx_xxxx : 	begin						// 24'h000800
									 				Significand = significand << 12;
								 	 				shift = 5'd12;
								 				end

		25'b1_0000_0000_0000_01xx_xxxx_xxxx : 	begin						// 24'h000400
									 				Significand = significand << 13;
								 	 				shift = 5'd13;
								 				end

		25'b1_0000_0000_0000_001x_xxxx_xxxx : 	begin						// 24'h000200
									 				Significand = significand << 14;
								 	 				shift = 5'd14;
								 				end

		25'b1_0000_0000_0000_0001_xxxx_xxxx  : 	begin						// 24'h000100
									 				Significand = significand << 15;
								 	 				shift = 5'd15;
								 				end

		25'b1_0000_0000_0000_0000_1xxx_xxxx : 	begin						// 24'h000080
									 				Significand = significand << 16;
								 	 				shift = 5'd16;
								 				end

		25'b1_0000_0000_0000_0000_01xx_xxxx : 	begin						// 24'h000040
											 		Significand = significand << 17;
										 	 		shift = 5'd17;
												end

		25'b1_0000_0000_0000_0000_001x_xxxx : 	begin						// 24'h000020
									 				Significand = significand << 18;
								 	 				shift = 5'd18;
								 				end

		25'b1_0000_0000_0000_0000_0001_xxxx : 	begin						// 24'h000010
									 				Significand = significand << 19;
								 	 				shift = 5'd19;
												end

		25'b1_0000_0000_0000_0000_0000_1xxx :	begin						// 24'h000008
									 				Significand = significand << 20;
								 					shift = 5'd20;
								 				end

		25'b1_0000_0000_0000_0000_0000_01xx : 	begin						// 24'h000004
									 				Significand = significand << 21;
								 	 				shift = 5'd21;
								 				end

		25'b1_0000_0000_0000_0000_0000_001x : 	begin						// 24'h000002
									 				Significand = significand << 22;
								 	 				shift = 5'd22;
								 				end

		25'b1_0000_0000_0000_0000_0000_0001 : 	begin						// 24'h000001
									 				Significand = significand << 23;
								 	 				shift = 5'd23;
								 				end

		25'b1_0000_0000_0000_0000_0000_0000 : 	begin						// 24'h000000
								 					Significand = significand << 24;
							 	 					shift = 5'd24;
								 				end
		default : 	begin
						Significand = (~significand) + 1'b1;
						shift = 8'd0;
					end

	endcase
end
assign exp_sub = exp_a - shift;

endmodule

//Addition and Subtraction

module Addition_Subtraction(
input [31:0] a,b,
input add_sub_signal,														// If 1 then addition otherwise subtraction
output exception,
output [31:0] res      
);

wire operation_add_sub_signal;
wire enable;
wire output_sign;

wire [31:0] op_a,op_b;
wire [23:0] significand_a,significand_b;
wire [7:0] exponent_diff;


wire [23:0] significand_b_add_sub;
wire [7:0] exp_b_add_sub;

wire [24:0] significand_add;
wire [30:0] add_sum;

wire [23:0] significand_sub_complement;
wire [24:0] significand_sub;
wire [30:0] sub_diff;
wire [24:0] subtraction_diff; 
wire [7:0] exp_sub;

assign {enable,op_a,op_b} = (a[30:0] < b[30:0]) ? {1'b1,b,a} : {1'b0,a,b};							// For operations always op_a must not be less than b

assign exp_a = op_a[30:23];
assign exp_b = op_b[30:23];

assign exception = (&op_a[30:23]) | (&op_b[30:23]);										// Exception flag sets 1 if either one of the exponent is 255.

assign output_sign = add_sub_signal ? enable ? !op_a[31] : op_a[31] : op_a[31] ;

assign operation_add_sub_signal = add_sub_signal ? op_a[31] ^ op_b[31] : ~(op_a[31] ^ op_b[31]);				// Assign significand values according to Hidden Bit.

assign significand_a = (|op_a[30:23]) ? {1'b1,op_a[22:0]} : {1'b0,op_a[22:0]};							// If exponent is zero,hidden bit = 0,else 1
assign significand_b = (|op_b[30:23]) ? {1'b1,op_b[22:0]} : {1'b0,op_b[22:0]};

assign exponent_diff = op_a[30:23] - op_b[30:23];										// Exponent difference calculation

assign significand_b_add_sub = significand_b >> exponent_diff;

assign exp_b_add_sub = op_b[30:23] + exponent_diff; 

assign perform = (op_a[30:23] == exp_b_add_sub);										// Checking if exponents are same

// Add Block //
assign significand_add = (perform & operation_add_sub_signal) ? (significand_a + significand_b_add_sub) : 25'd0; 

assign add_sum[22:0] = significand_add[24] ? significand_add[23:1] : significand_add[22:0];					// res will be most 23 bits if carry generated, else least 22 bits.

assign add_sum[30:23] = significand_add[24] ? (1'b1 + op_a[30:23]) : op_a[30:23];						// If carry generates in sum value then exponent is added with 1 else feed as it is.

// Sub Block //
assign significand_sub_complement = (perform & !operation_add_sub_signal) ? ~(significand_b_add_sub) + 24'd1 : 24'd0 ; 

assign significand_sub = perform ? (significand_a + significand_sub_complement) : 25'd0;

priority_encoder pe(significand_sub,op_a[30:23],subtraction_diff,exp_sub);

assign sub_diff[30:23] = exp_sub;

assign sub_diff[22:0] = subtraction_diff[22:0];


// Output //
assign res = exception ? 32'b0 : ((!operation_add_sub_signal) ? {output_sign,sub_diff} : {output_sign,add_sum});

endmodule


// Multiplication
module Multiplication(
		input [31:0] a,
		input [31:0] b,
		output exception,overflow,underflow,
		output [31:0] res
		);

wire sign,product_round,normalised,zero;
wire [8:0] exponent,sum_exponent;
wire [22:0] product_mantissa;
wire [23:0] op_a,op_b;
wire [47:0] product,product_normalised; //48 Bits


assign sign = a[31] ^ b[31];   													// XOR of 32nd bit

assign exception = (&a[30:23]) | (&b[30:23]);											// Execption sets to 1 when exponent of any a or b is 255
																// If exponent is 0, hidden bit is 0



assign op_a = (|a[30:23]) ? {1'b1,a[22:0]} : {1'b0,a[22:0]};

assign op_b = (|b[30:23]) ? {1'b1,b[22:0]} : {1'b0,b[22:0]};

assign product = op_a * op_b;													// Product

assign product_round = |product_normalised[22:0];  									        // Last 22 bits are ORed for rounding off purpose

assign normalised = product[47] ? 1'b1 : 1'b0;	

assign product_normalised = normalised ? product : product << 1;								// Normalized value based on 48th bit

assign product_mantissa = product_normalised[46:24] + {21'b0,(product_normalised[23] & product_round)};				// Mantissa

assign zero = exception ? 1'b0 : (product_mantissa == 23'd0) ? 1'b1 : 1'b0;

assign sum_exponent = a[30:23] + b[30:23];

assign exponent = sum_exponent - 8'd127 + normalised;

assign overflow = ((exponent[8] & !exponent[7]) & !zero) ;									// Overall exponent is greater than 255 then Overflow

assign underflow = ((exponent[8] & exponent[7]) & !zero) ? 1'b1 : 1'b0; 							// Sum of exponents is less than 255 then Underflow 

assign res = exception ? 32'd0 : zero ? {sign,31'd0} : overflow ? {sign,8'hFF,23'd0} : underflow ? {sign,31'd0} : {sign,exponent[7:0],product_mantissa};


endmodule


// Iteration
module Iteration(
	input [31:0] operand_1,
	input [31:0] operand_2,
	output [31:0] solution
	);

wire [31:0] Intermediate_Value1,Intermediate_Value2;

Multiplication M1(operand_1,operand_2,,,,Intermediate_Value1);

//32'h4000_0000 -> 2.
Addition_Subtraction A1(32'h4000_0000,{1'b1,Intermediate_Value1[30:0]},1'b0,,Intermediate_Value2);

Multiplication M2(operand_1,Intermediate_Value2,,,,solution);

endmodule

// Division
module division(
	input [31:0] a,
	input [31:0] b,
	output exception,
	output [31:0] res
);

wire sign;
wire [7:0] shift;
wire [7:0] exp_a;
wire [31:0] divisor;
wire [31:0] op_a;
wire [31:0] Intermediate_X0;
wire [31:0] Iteration_X0;
wire [31:0] Iteration_X1;
wire [31:0] Iteration_X2;
wire [31:0] Iteration_X3;
wire [31:0] solution;

wire [31:0] denominator;
wire [31:0] op_a_change;

assign exception = (&a[30:23]) | (&b[30:23]);

assign sign = a[31] ^ b[31];

assign shift = 8'd126 - b[30:23];

assign divisor = {1'b0,8'd126,b[22:0]};

assign denominator = divisor;

assign exp_a = a[30:23] + shift;

assign op_a = {a[31],exp_a,a[22:0]};

assign op_a_change = op_a;

//32'hC00B_4B4B = (-37)/17
Multiplication x0(32'hC00B_4B4B,divisor,,,,Intermediate_X0);

//32'h4034_B4B5 = 48/17
Addition_Subtraction X0(Intermediate_X0,32'h4034_B4B5,1'b0,,Iteration_X0);

Iteration X1(Iteration_X0,divisor,Iteration_X1);

Iteration X2(Iteration_X1,divisor,Iteration_X2);

Iteration X3(Iteration_X2,divisor,Iteration_X3);

Multiplication END(Iteration_X3,op_a,,,,solution);

assign res = {sign,solution[30:0]};
endmodule

`define N_TESTS 100000

module division_tb;

	reg clk = 0;
	reg [31:0] a;
	reg [31:0] b;
	
	wire [31:0] res;
	wire exception;

	reg [31:0] expected_res;

	reg [95:0] testVector [`N_TESTS-1:0];

	reg test_stop_enable;

	integer mcd;
	integer test_n = 0;
	integer pass   = 0;
	integer error  = 0;

	division DUT(a,b,exception,res);

	always #5 clk = ~clk;

	initial  
	begin 
		$readmemh("Test.txt", testVector);
		mcd = $fopen("Error_Results.txt");
	end 

	always @(posedge clk) 
	begin
			{a,b,expected_res} = testVector[test_n];
			test_n = test_n + 1'b1;

			#2;
			if (res[31:12] == expected_res[31:12])
				begin
					//$fdisplay (mcd,"TestPassed Test Number -> %d",test_n);
					pass = pass + 1'b1;
				end

			if (res[31:12] != expected_res[31:12])
				begin
					$fdisplay (mcd,"Test Failed Expected res = %h,Obtained res = %h,Test Number-> %d",expected_res,res,test_n);
					$display ("Zero Division Error or some other error",mcd,"Test Failed Expected res = %h,Obtained res = %h,Test Number-> %d",expected_res,res,test_n);
					error = error + 1'b1;
				end
			
			if (test_n >= `N_TESTS) 
			begin
				$fdisplay(mcd,"Completed %d tests, %d passes and %d fails.", test_n, pass, error);
				test_stop_enable = 1'b1;
			end
	end

always @(posedge test_stop_enable)
begin
$fclose(mcd);
$finish;
end

endmodule

