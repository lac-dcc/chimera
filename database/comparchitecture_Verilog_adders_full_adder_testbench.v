module full_adder_testbench;

// input and output test signals
reg a, b, carry_in;

wire carry_out, sum;

// creating the instance of the module we want to test
full_adder fa(a, b, carry_in, sum, carry_out);

initial
begin
a = 1'b0;
b = 1'b1;
carry_in = 1'b0;
#5; // pause (5 units of delay )
carry_in = 1'b1;
#5;
a = 1'b1;
b = 1'b0;
#5;
carry_in = 1'b0;
#5
a = 1'b0;
b = 1'b0;
#5
carry_in = 1'b1;
#5
a = 1'b1;
b = 1'b1;
#5;
carry_in = 1'b0;
end

// print signal values on every change
initial
$monitor("a= %b b = %b carry_in = %b sum = %b carry_out = %b", a, b, carry_in, sum, carry_out);

initial
$dumpvars;

endmodule
