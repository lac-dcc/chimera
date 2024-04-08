module top_module (
    input in1,
    input in2,
    output out);
	assign out = ~in2 & in1;
endmodule
