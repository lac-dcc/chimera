`timescale 1ns/1ns


module tb;

reg clk;
reg ena;
reg clr;
reg accumulate;

reg [31:0] value1, value2;


wire [31:0] result;




MAC u0 (
	.clk0       (clk),       //   input,   width = 1,       clk0.clk
	.ena        (ena),        //   input,   width = 1,        ena.ena
	.clr0       (clr),       //   input,   width = 1,       clr0.reset
	.result     (result),     //  output,  width = 32,     result.result
	.accumulate (accumulate), //   input,   width = 1, accumulate.accumulate
	.ay         (value1),         //   input,  width = 32,         ay.ay
	.az         (value2)          //   input,  width = 32,         az.az
);



always 
begin
    clk = 1'b1; 
    #10; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #10; // low for 20 * timescale = 20 ns
end



initial
begin
	ena = 1'b0;
	clr = 1'b1;
	value1 = 32'b00111111100000000000000000000000;
    value2 = 32'b00111111100000000000000000000000;
	accumulate = 1'b0;

	#35;
	ena = 1'b1;
	clr = 1'b0;
	accumulate = 1;

	#60;
	accumulate = 0;

	#60;
	accumulate = 1;

	#60;
	clr = 1'b1;

	#60;
	$stop;


end




endmodule