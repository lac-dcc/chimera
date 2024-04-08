module carry_save_adder(a,b,c,d, sum,cout);
  input [3:0] a, b,c,d;
output [4:0] sum;
output cout;
 
wire [3:0] s0,s1;
  wire [3:0] c0, c1;
 
//1st Statge
full_adder fa0( .a(a[0]), .b(b[0]), .cin(c[0]), .sum(s0[0]), .cout(c0[0]));
full_adder fa1( .a(a[1]), .b(b[1]), .cin(c[1]), .sum(s0[1]), .cout(c0[1]));
full_adder fa2( .a(a[2]), .b(b[2]), .cin(c[2]), .sum(s0[2]), .cout(c0[2]));
full_adder fa3( .a(a[3]), .b(b[3]), .cin(c[3]), .sum(s0[3]), .cout(c0[3]));
 
//2nd Stage
full_adder fa4( .a(d[0]), .b(s0[0]), .cin(1'b0), .sum(sum[0]), .cout(c1[0]));
full_adder fa5( .a(d[1]), .b(s0[1]), .cin(c0[0]), .sum(s1[0]), .cout(c1[1]));
full_adder fa6( .a(d[2]), .b(s0[2]), .cin(c0[1]), .sum(s1[1]), .cout(c1[2]));
full_adder fa7( .a(d[3]), .b(s0[3]), .cin(c0[2]), .sum(s1[2]), .cout(c1[3]));
 
 ripple_carry_4_bit rca1 (.a(c1[3:0]),.b({c0[3],s1[2:0]}), .cin(1'b0),.sum(sum[4:1]), .cout(cout));
 
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
half_adder  h1(.a(a), .b(b), .sum(x), .cout(y));
half_adder  h2(.a(x), .b(cin), .sum(sum), .cout(z));
assign cout= y|z;
endmodule


module half_adder( a,b, sum, cout );
input a,b;
output sum,  cout;
assign sum= a^b;
assign cout= a & b;
endmodule

module carry_save_tb;
wire [4:0] sum;
wire cout;
reg [3:0] a,b,c,d;
 
 carry_save_adder uut(
.a(a),
.b(b),
.c(c),
 .d(d),
.sum(sum),
.cout(cout));
 
initial begin
$display($time, " Starting the Simulation");
     a=0; b=0; c=0; d=0;
  #100 a= 4'd10; b=4'd0; c=4'd0; d=4'd0;
  #100 a= 4'd10; b=4'd10; c=4'd0; d=4'd0;
  #100 a= 4'd4; b=4'd6; c=4'd12; d=4'd0;
  #100 a= 4'd11; b=4'd2; c=4'd4; d=4'd7;
  #100 a= 4'd20; b=4'd0; c=4'd20; d=4'd0;
  #100 a= 4'd12; b=4'd5; c=4'd10; d=4'd10;
  #100 a= 4'd7; b=4'd6; c=4'd12; d=4'd8;
  #100 a= 4'd15; b=4'd15; c=4'd15; d=4'd15;
 
end
 
initial
  $monitor("A=%d, B=%d, C=%d,D=%d,Sum= %d, Cout=%d",a,b,c,d,sum,cout);
endmodule
