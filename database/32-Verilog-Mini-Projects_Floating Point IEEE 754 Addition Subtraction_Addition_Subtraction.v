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

module Addition_Subtraction(input [31:0] a,b,
input add_sub_signal,														// If 1 then addition otherwise subtraction
output exception,
output [31:0] res );

wire operation_add_sub_signal;
wire enable;
wire output_sign;

wire [31:0] op_a,op_b;
wire [23:0] significand_a,significand_b;
wire [7:0] exp_diff;


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

assign operation_add_sub_signal = add_sub_signal ? op_a[31] ^ op_b[31] : ~(op_a[31] ^ op_b[31]);
																// Assign significand values according to Hidden Bit.
assign significand_a = (|op_a[30:23]) ? {1'b1,op_a[22:0]} : {1'b0,op_a[22:0]};							// If exponent is zero,hidden bit = 0,else 1
assign significand_b = (|op_b[30:23]) ? {1'b1,op_b[22:0]} : {1'b0,op_b[22:0]};

assign exp_diff = op_a[30:23] - op_b[30:23];											// Exponent difference calculation
assign significand_b_add_sub = significand_b >> exp_diff;
assign exp_b_add_sub = op_b[30:23] + exp_diff; 

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


module Addition_Subtraction_tb;

reg [31:0] a,b;
reg clk=1'b0,
	reset =1'b1;
reg add_sub_signal;

wire [31:0] res;
wire exception;

Addition_Subtraction dut(a,b,add_sub_signal,exception,res);

always #5 clk = ~clk;

initial
begin

add_sub_signal = 1'b0;

iteration (32'h4201_51EC,32'h4242_147B,32'h42A1_B333,`__LINE__); //32.33 + 48.52 = 80.85

iteration (32'h4068_51EC,32'h4090_A3D7,32'h4102_6666,`__LINE__); //3.63 + 4.52 = 8.15.

iteration (32'h4195_0A3D,32'h419B_47AE,32'h4218_28F6,`__LINE__); //18.63 + 19.41 = 38.04.

iteration (32'h4217_999A,32'h3F8C_CCCD,32'h421C_0000,`__LINE__); //37.9 + 1.1 = 39.

iteration (32'h4383_C7AE,32'h4164_F5C3,32'h438A_EF5C,`__LINE__); //263.56 + 14.31 = 277.87

iteration (32'h4542_77D7,32'h453B_8FD7,32'h45BF_03D7,`__LINE__); //3111.49 + 3000.99 = 6112.48

iteration (32'h3F3A_E148,32'h3EB33333,32'h3F8A_3D71,`__LINE__); //0.73 + 0.35 = 1.08.

iteration (32'h3F7D_70A4,32'h3F7D_70A4,32'h3FFD_70A4,`__LINE__); //0.99 + 0.99 = 1.98

iteration (32'h3F40_0000,32'h3E94_7AE1,32'h3F85_1EB8,`__LINE__); //0.75 + 0.29 = 1.04

iteration (32'h4B7F_FFFF,32'h3F80_0000,32'h4B80_0000,`__LINE__); //16777215 + 1 = 16777216
								 // Corner Case

iteration (32'h4B7F_FFFF,32'h4000_0000,32'h4B80_0001,`__LINE__); //16777215 + 2 = 16777217.
								 // Corner Case

iteration (32'h4B7F_FFFF,32'h4B7F_FFFF,32'h4BFF_FFFF,`__LINE__); //16777215 + 16777215 = 33554430
								 // Working

iteration (32'h4B7F_FFFE,32'h3F80_0000,32'h4B7F_FFFF,`__LINE__); //16777214 + 1 = 16777215

iteration (32'hBF3A_E148,32'h3EC7_AE14,32'hBEAE_147B,`__LINE__); //-0.73 + 0.39 = -0.34

iteration (32'hC207_C28F,32'h4243_B852,32'h416F_D70A,`__LINE__); //-33.94 + 48.93 = 14.99

iteration (32'hBDB2_2D0E,32'h4305_970A,32'h4305_80C5,`__LINE__); //-0.087 + 133.59 = 133.503

iteration (32'h4E6B_79A3,32'hCCEB_79A3,32'h4E4E_0A6F,`__LINE__); //987654321 - 123456789 = 864197532

iteration (32'h4B80_0000,32'hCB80_0000,32'h0000_0000,`__LINE__); //16777216 - 16777216 = 0

iteration (32'h4B7F_FFFF,32'hCB7F_FFFF,32'h0000_0000,`__LINE__); //16777215 - 16777215 = 0

// Subtraction //

add_sub_signal = 1'b1;

iteration (32'h40A00000,32'h40C00000,32'hBF800000,`__LINE__); //5 - 6 = -1

iteration (32'h40C00000,32'h40A00000,32'h3F800000,`__LINE__); //6 - 5 = 1

iteration (32'hC0C00000,32'hC0A00000,32'hBF800000,`__LINE__); //-6 - (-5) = -1

iteration (32'hC0A00000,32'hC0C00000,32'h3F800000,`__LINE__); // -5 - (-6) = 1

iteration (32'h40C00000,32'hC0A00000,32'h41300000,`__LINE__); // 6 - (-5) = 11

iteration (32'h40A00000,32'hC0C00000,32'h41300000,`__LINE__); // 5 - (-6) = 11

iteration (32'hC0A00000,32'h40C00000,32'hC1300000,`__LINE__); // -5 - (6) = -11

iteration (32'hC0C00000,32'h40A00000,32'hC1300000,`__LINE__); // -6 - (+5) = -11

// Exception Cases //

iteration (32'h0000_0000,32'h3EC7_AE14,32'h3EC7_AE14,`__LINE__);

iteration (32'h3EC7_AE14,32'h0000_0000,32'h3EC7_AE14,`__LINE__);

iteration (32'h0000_0000,32'h0000_0000,32'h0000_0000,`__LINE__);

iteration (32'h7F80_0000,32'h7F90_0100,32'h0000_0000,`__LINE__);

iteration (32'h7F80_0000,32'h3EC7_AE14,32'h0000_0000,`__LINE__);

iteration (32'h3EC7_AE14,32'h7F80_0000,32'h0000_0000,`__LINE__);

iteration (32'h7F80_0000,32'h0000_0000,32'h0000_0000,`__LINE__);

iteration (32'h7F90_0100,32'h7F80_0000,32'h0000_0000,`__LINE__);

@(negedge clk)
$stop;

end

task iteration(
input [31:0] op_a,op_b,expected_value,
input integer line_num );

begin
	@(negedge clk)
	begin
		a = op_a;
		b = op_b;
	end

	@(posedge clk)
	begin
		#1;
		if (expected_value == res)
			$display ("Success: Line Number -> %d",line_num);
		else 
			$display ("Failed: \t\n A => %h, \t\n B => %h, \t\n Result Obtained => %h, \t\n Expected Value => %h - Line Number",op_a,op_b,res,expected_value,line_num);
	end
end
endtask

endmodule
