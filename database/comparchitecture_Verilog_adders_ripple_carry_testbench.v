module ripple_carry_testbench;

// input and output test signals
reg [15:0] in1, in2;

wire [15:0] out;
wire overflow;

// creating the instance of the module we want to test
ripple_carry rc(in1, in2, out, overflow);

initial
begin
in1 = 16'b0000000000000000;
in2 = 16'b0000000000000000;
#5; // pause (5 units of delay )
in1 = 16'b0000000000000001;
in2 = 16'b0000000000000000;
#5;
in1 = 16'b0000000000000001;
in2 = 16'b0000000000000001;
#5;
in1 = 16'b0000000000000010;
in2 = 16'b0000000000000001;
#5;
in1 = 16'b0000000011000111;
in2 = 16'b0000000001100001;
#5;
in1 = 16'b0000000010000001;
in2 = 16'b0000000000000000;
#5
in1 = 16'b1111111111111111;
in2 = 16'b1111111111111111;
#5
in1 = 16'b1111111111111111;
in2 = 16'b0000000000000001;
#5
in1 = 16'b1111111111111111;
in2 = 16'b0000000000000000;
end

// print signal values on every change
initial
$monitor("in1 = %b in2 = %b out = %b overflow = %b", in1, in2, out, overflow);

initial
$dumpvars;

endmodule
