module carry_skip_16bit(a, b, cin, sum, cout);
input [15:0] a,b;
input cin;
output cout;
output [15:0] sum;
 
wire [2:0] c;
 
carry_skip_4bit csa1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c[0]));
carry_skip_4bit csa2 (.a(a[7:4]), .b(b[7:4]), .cin(c[0]), .sum(sum[7:4]), .cout(c[1]));
carry_skip_4bit csa3(.a(a[11:8]), .b(b[11:8]), .cin(c[1]), .sum(sum[11:8]), .cout(c[2]));
carry_skip_4bit csa4(.a(a[15:12]), .b(b[15:12]), .cin(c[2]), .sum(sum[15:12]), .cout(cout));
 
endmodule
 
module carry_skip_4bit(a, b, cin, sum, cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire [3:0] p;
wire c0;
wire bp;
 
ripple_carry_4_bit rca1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c0));
generate_p p1(a,b,p,bp);
mux2X1 m0(.in0(c0),.in1(cin),.sel(bp),.out(cout));
 
endmodule
 
module generate_p(a,b,p,bp);
input [3:0] a,b;
output [3:0] p;
output bp;
assign p= a^b;
assign bp= &p;
endmodule
 

module ripple_carry_4_bit(a, b, cin, sum, cout);
input [3:0] a,b;
input cin;
wire c1,c2,c3;
output [3:0] sum;
output cout;
 
full_adder fa0(.a(a[0]), .b(b[0]),.cin(cin), .sum(sum[0]),.cout(c1));
full_adder fa1(.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]),.cout(c2));
full_adder fa2(.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]),.cout(c3));
full_adder fa3(.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]),.cout(cout));
endmodule
 
module full_adder(a,b,cin,sum, cout);
input a,b,cin;
output sum, cout;
wire x,y,z;
half_adder h1(.a(a), .b(b), .sum(x), .cout(y));
half_adder h2(.a(x), .b(cin), .sum(sum), .cout(z));
or or_1(cout,z,y);
endmodule


module half_adder( a,b, sum, cout );
input a,b;
output sum, cout;
xor xor_1 (sum,a,b);
and and_1 (cout,a,b);
endmodule
 

module mux2X1( in0,in1,sel,out);
input in0,in1;
input sel;
output out;
assign out=(sel)?in1:in0;
endmodule


module carry_skip_16bit_tb;
wire [15:0] sum;
wire cout;
reg [15:0] a,b;
reg cin;
 
carry_skip_16bit uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
 
initial begin
     a=0; b=0; cin=0;
#10 a= 16'b0000000000000101; b=16'b000000000000101; cin=1'b1;
#10 a= 16'b0000000000011111; b=16'b000000000001100; cin=1'b0;
#10 a= 16'b0000000000011111; b=16'b000000000001100; cin=1'b0;
#10 a= 16'b1100011000011111; b=16'b000000110001100; cin=1'b1;
#10 a= 16'b1111111111111111; b=16'b000000000000000; cin=1'b1;
#10 a =16'b0000000000000001; b=16'b000000000000001; cin=1'b1;
#10 a =16'b0000000000000010; b=16'b000000000000010; cin=1'b1;
end
 
initial
$monitor("time= ", $time, "A=%b, B=&b, Cin=%b : Sum= %b, Cout=%cout",a,b,cin,sum,cout);
endmodule
