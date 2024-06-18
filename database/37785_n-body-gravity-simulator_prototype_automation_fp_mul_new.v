// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

module fp_mul(num1,num2,res);
// input [26:0]num1,num2  ; output [26:0]res 

//input clk;
//input reset;
input wire [26:0]num1,num2;
//output reg [26:0]o_product;
output [26:0]res;

wire sign_a,sign_b;
wire sign_res;
wire [7:0]exp_a,exp_b,exp;
wire [8:0] exp_sum;
reg [8:0] exp_res;
wire [18:0]frac_a,frac_b;
wire [18:0]man_a,man_b;
wire [37:0]prod;
//wire [17:0]product;
reg [17:0]mantissa;
wire [26:0]res;

wire zero,zero_res;

//reg [55:0]pipe;

assign zero = ~((|num1[25:0])  && (|num2[25:0]));

assign sign_a=num1[26];
assign sign_b=num2[26];
assign exp_a=num1[25:18];
assign exp_b=num2[25:18];
assign frac_a= (|num1[25:18])? { 1'b1,num1[17:0]}:{1'b0,num1[17:0]};
assign frac_b= (|num2[25:18])? { 1'b1,num2[17:0]}:{1'b0,num2[17:0]};

/*
always @(posedge clk)
begin
pipe[27:0]<= {sign_a,exp_a,frac_a};
pipe[55:28]<= {sign_b,exp_b,frac_b};
end
*/

//deregistering the outputs
/*
always @(posedge clk)
begin
if(reset)
o_product<=27'b0;
else
o_product<=res;
end
*/

/* computation ->: involves computing sign_bit,exponent_sum,product
------------------------------------------------------------------------------*/
assign sign_res = sign_a ^ sign_b;
assign exp_sum= exp_a + exp_b;

assign prod= frac_a * frac_b ;

assign norm = (prod[37])?1'b1:1'b0;

always @(*)
begin
	exp_res= exp_sum - 8'd127  ;    // due to double counting
	if(!norm)
		begin
		mantissa= prod[35:18];
		end
	else
		begin
		mantissa= prod[36:19];
		exp_res=exp_res + 1'b1;
		end
end

assign zero_res = ~(|{exp_res,mantissa});

assign res= (zero_res || zero)?{sign_res,26'b0}:{sign_res,exp_res[7:0],mantissa};

endmodule
