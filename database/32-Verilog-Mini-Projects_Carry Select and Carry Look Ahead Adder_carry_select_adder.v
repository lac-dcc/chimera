module carry_select_adder_16bit(a, b, cin, sum, cout);
input [15:0] a,b;
input cin;
output [15:0] sum;
output cout;
 
wire [2:0] c;
 
ripple_carry_4_bit rca1(
.a(a[3:0]),
.b(b[3:0]),
.cin(cin),
.sum(sum[3:0]),
.cout(c[0]));
 

carry_select_adder_4bit_slice csa_slice1(
.a(a[7:4]),
.b(b[7:4]),
.cin(c[0]),
.sum(sum[7:4]),
.cout(c[1]));
 
carry_select_adder_4bit_slice csa_slice2(
.a(a[11:8]),
.b(b[11:8]),
.cin(c[1]),
.sum(sum[11:8]), 
.cout(c[2]));
 
carry_select_adder_4bit_slice csa_slice3(
.a(a[15:12]),
.b(b[15:12]),
.cin(c[2]),
.sum(sum[15:12]),
.cout(cout));
endmodule
 
 
module carry_select_adder_4bit_slice(a, b, cin, sum, cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
 
wire [3:0] s0,s1;
wire c0,c1;
 
ripple_carry_4_bit rca1(
.a(a[3:0]),
.b(b[3:0]),
.cin(1'b0),
.sum(s0[3:0]),
.cout(c0));
 
ripple_carry_4_bit rca2(
.a(a[3:0]),
.b(b[3:0]),
.cin(1'b1),
.sum(s1[3:0]),
.cout(c1));
 
mux2X1 #(4) ms0(
.in0(s0[3:0]),
.in1(s1[3:0]),
.sel(cin),
.out(sum[3:0]));
 
mux2X1 #(1) mc0(
.in0(c0),
.in1(c1),
.sel(cin),
.out(cout));
endmodule
 
 
module mux2X1( in0,in1,sel,out);
parameter width=16; 
input [width-1:0] in0,in1;
input sel;
output [width-1:0] out;
assign out=(sel)?in1:in0;
endmodule
 

module ripple_carry_4_bit(a, b, cin, sum, cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
 
wire c1,c2,c3;
 
full_adder fa0(
.a(a[0]),
.b(b[0]),
.cin(cin),
.sum(sum[0]),
.cout(c1));
 
full_adder fa1(
.a(a[1]),
.b(b[1]),
.cin(c1),
.sum(sum[1]),
.cout(c2));
 
full_adder fa2(
.a(a[2]),
.b(b[2]),
.cin(c2),
.sum(sum[2]),
.cout(c3));
 
full_adder fa3(
.a(a[3]),
.b(b[3]),
.cin(c3),
.sum(sum[3]),
.cout(cout));
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

module carry_select_adder_16bit_tb;
reg [15:0] a,b;
reg cin;
wire [15:0] sum;
wire cout;
 
  carry_select_adder_16bit uut(.a(a), .b(b),.cin(cin),.sum(sum),.cout(cout));
 
initial begin
  a=0; b=0; cin=0;
  #10 a=16'd2; b=16'd2; cin=1'd1;
  #10 a=16'd2; b=16'd4; cin=1'd1;
  #10 a=16'd100; b=16'd0; cin=1'd0;
  #10 a=16'd12; b=16'd3; cin=1'd1;
end
 
initial
  $monitor( "A=%d, B=%d, Cin= %d, Sum=%d, Cout=%d", a,b,cin,sum,cout);
endmodule
