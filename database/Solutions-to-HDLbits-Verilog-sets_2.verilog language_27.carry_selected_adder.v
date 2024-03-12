module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire cin;
wire [15:0] sum1;
wire [15:0] sum2_0;
wire [15:0] sum2_1;
wire cout1, cout1_0, cout1_1;
wire cout2_0, cout2_1;

assign cin = 0;
assign cout1_0 = 0;
assign cout1_1 = 1;

add16 u_add16_1(
	.a(a[15:0]),
	.b(b[15:0]),
	.cin(cin),
	.sum(sum1),
	.cout(cout1)
	);
 
 //assume cout1 = 0
add16 u_add16_2_0(
	.a(a[31:16]),
	.b(b[31:16]),
	.cin(cout1_0),
	.sum(sum2_0),
	.cout(cout2_0)
	);

//assume cout1 = 1
add16 u_add16_2_1(
	.a(a[31:16]),
	.b(b[31:16]),
	.cin(cout1_1),
	.sum(sum2_1),
	.cout(cout2_1)
	);

always@(a or b)begin
	if(cout1 == 0)	
		sum = {sum2_0, sum1};
	else    
		sum = {sum2_1, sum1};

end
endmodule



