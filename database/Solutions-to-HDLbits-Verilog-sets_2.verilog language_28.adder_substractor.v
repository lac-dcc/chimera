module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

wire cout1, cout2;
wire [15:0] b_lo;
wire [15:0] b_hi;
wire [15:0] sum_lo;
wire [15:0] sum_hi;

always@(a or b or sub)begin
	if(sub == 0)begin
		b_lo = b[15:0];
		b_hi = b[31:16];
	end 
	else begin
		b_lo = {16{sub}} ^ b[15:0];
		b_hi = {16{sub}} ^ b[31:16];
	end
end

add16 u_add16_1(
	.a(a[15:0]),
	.b(b_lo),
	.cin(sub),
	.sum(sum_lo),
	.cout(cout1)
	);

add16 u_add16_2(
	.a(a[31:16]),
	.b(b_hi),
	.cin(cout1),
	.sum(sum_hi),
	.cout(cout2)
	);

assign sum = {sum_hi, sum_lo};

endmodule
