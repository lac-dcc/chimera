module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

	assign out_assign = a & b;

	always@(*)begin
		out_alwaysblock = a & b;
	end
endmodule