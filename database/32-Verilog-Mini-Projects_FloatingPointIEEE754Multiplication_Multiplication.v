module Multiplication(input [31:0] a,input [31:0] b,output exception,overflow,underflow,output [31:0] res);

wire sign,round,normalised,zero;
wire [8:0] exponent,sum_exponent;
wire [22:0] product_mantissa;
wire [23:0] op_a,op_b;
wire [47:0] product,product_normalised; 


assign sign = a[31] ^ b[31];   													// XOR of 32nd bit
assign exception = (&a[30:23]) | (&b[30:23]);											// Execption sets to 1 when exponent of any a or b is 255
																// If exponent is 0, hidden bit is 0

assign op_a = (|a[30:23]) ? {1'b1,a[22:0]} : {1'b0,a[22:0]};
assign op_b = (|b[30:23]) ? {1'b1,b[22:0]} : {1'b0,b[22:0]};

assign product = op_a * op_b;													// Product
assign round = |product_normalised[22:0];  											// Last 22 bits are ORed for rounding off purpose
assign normalised = product[47] ? 1'b1 : 1'b0;	
assign product_normalised = normalised ? product : product << 1;								// Normalized value based on 48th bit
assign product_mantissa = product_normalised[46:24] + (product_normalised[23] & round); 					// Mantissa
assign zero = exception ? 1'b0 : (product_mantissa == 23'd0) ? 1'b1 : 1'b0;
assign sum_exponent = a[30:23] + b[30:23];
assign exponent = sum_exponent - 8'd127 + normalised;
assign overflow = ((exponent[8] & !exponent[7]) & !zero) ; 									// Overall exponent is greater than 255 then Overflow
assign underflow = ((exponent[8] & exponent[7]) & !zero) ? 1'b1 : 1'b0; 							// Sum of exponents is less than 255 then Underflow
assign res = exception ? 32'd0 : zero ? {sign,31'd0} : overflow ? {sign,8'hFF,23'd0} : underflow ? {sign,31'd0} : {sign,exponent[7:0],product_mantissa};

endmodule



module multiplication_tb;

reg [31:0] a,b;
wire exception,overflow,underflow;
wire [31:0] res;

reg clk = 1'b1;

Multiplication dut(a,b,exception,overflow,underflow,res);

always clk = #5 ~clk;

initial
begin
iteration (32'h0200_0000,32'h0200_0000,1'b0,1'b0,1'b0,32'h0000_0000,`__LINE__);

iteration (32'h4234_851F,32'h427C_851F,1'b0,1'b0,1'b0,32'h4532_10E9,`__LINE__); // 45.13 * 63.13 = 2849.0569;

iteration (32'h4049_999A,32'hC166_3D71,1'b0,1'b0,1'b0,32'hC235_5062,`__LINE__); //3.15 * -14.39 = -45.3285

iteration (32'hC152_6666,32'hC240_A3D7,1'b0,1'b0,1'b0,32'h441E_5375,`__LINE__); //-13.15 * -48.16 = 633.304

iteration (32'h4580_0000,32'h4580_0000,1'b0,1'b0,1'b0,32'h4B80_0000,`__LINE__); //4096 * 4096 = 16777216

iteration (32'h3ACA_62C1,32'h3ACA_62C1,1'b0,1'b0,1'b0,32'h361F_FFE7,`__LINE__); //0.00154408081 * 0.00154408081 = 0.00000238418

iteration (32'h0000_0000,32'h0000_0000,1'b0,1'b0,1'b0,32'h0000_0000,`__LINE__); // 0 * 0 = 0;

iteration (32'hC152_6666,32'h0000_0000,1'b0,1'b0,1'b0,32'h441E_5375,`__LINE__); //-13.15 * 0 = 0;

iteration (32'h7F80_0000,32'h7F80_0000,1'b1,1'b1,1'b0,32'h0000_0000,`__LINE__); 

$stop;

end

task iteration(
input [31:0] op_a,op_b,
input Expected_Exception,Expected_Overflow,Expected_Underflow,
input [31:0] Expected_result,
input integer linenum 
);
begin
@(negedge clk)
begin
	a = op_a;
	b = op_b;
end

@(posedge clk)
begin
if ((Expected_result == res) && (Expected_Exception == exception) && (Expected_Overflow == overflow) && (Expected_Underflow == underflow))
	$display ("Success : %d",linenum);

else
	$display ("Failed : Expected_result = %h, Result = %h, \n Expected_Exception = %d, Exception = %d,\n Expected_Overflow = %d, Overflow = %d, \n Expected_Underflow = %d, Underflow = %d - %d \n ",Expected_result,res,Expected_Exception,exception,Expected_Overflow,overflow,Expected_Underflow,underflow,linenum);
end
end
endtask
endmodule
