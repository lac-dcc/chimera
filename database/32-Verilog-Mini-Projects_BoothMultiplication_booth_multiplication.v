module invert(output ib,input b);
	assign ib = ~b;
endmodule

module and2 (input wire i0, i1, output wire o);
  assign o = i0 & i1;
endmodule

module or2 (input wire i0, i1, output wire o);
  assign o = i0 | i1;
endmodule

module xor2 (input wire i0, i1, output wire o);
  assign o = i0 ^ i1;
endmodule

module nand2 (input wire i0, i1, output wire o);
   wire t;
   and2 and2_0 (i0, i1, t);
   invert invert_0 (t, o);
endmodule

module nor2 (input wire i0, i1, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   invert invert_0 (t, o);
endmodule

module xnor2 (input wire i0, i1, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   invert invert_0 (t, o);
endmodule

module and3 (input wire i0, i1, i2, output wire o);
   wire t;
   and2 and2_0 (i0, i1, t);
   and2 and2_1 (i2, t, o);
endmodule

module or3 (input wire i0, i1, i2, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   or2 or2_1 (i2, t, o);
endmodule

module nor3 (input wire i0, i1, i2, output wire o);
   wire t;
   or2 or2_0 (i0, i1, t);
   nor2 nor2_0 (i2, t, o);
endmodule

module nand3 (input wire i0, i1, i2, output wire o);
   wire t;
   and2 and2_0 (i0, i1, t);
   nand2 nand2_1 (i2, t, o);
endmodule

module xor3 (input wire i0, i1, i2, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   xor2 xor2_1 (i2, t, o);
endmodule

module xnor3 (input wire i0, i1, i2, output wire o);
   wire t;
   xor2 xor2_0 (i0, i1, t);
   xnor2 xnor2_0 (i2, t, o);
endmodule



module fa (input wire i0, i1, cin, output wire sum, cout);
   wire t0, t1, t2;
   xor3 _i0 (i0, i1, cin, sum);
   and2 _i1 (i0, i1, t0);
   and2 _i2 (i1, cin, t1);
   and2 _i3 (cin, i0, t2);
   or3 _i4 (t0, t1, t2, cout);
endmodule


module Adder(a,b,sum);
	input [7:0] a,b;
	output [7:0]sum;
	wire cout;
	wire [7:0] q;
	fa fa1(a[0],b[0],1'b0,sum[0],q[0]);
	fa fa2(a[1],b[1],q[0],sum[1],q[1]);
	fa fa3(a[2],b[2],q[1],sum[2],q[2]);
	fa fa4(a[3],b[3],q[2],sum[3],q[3]);
	fa fa5(a[4],b[4],q[3],sum[4],q[4]);
	fa fa6(a[5],b[5],q[4],sum[5],q[5]);
	fa fa7(a[6],b[6],q[5],sum[6],q[6]);
	fa fa8(a[7],b[7],q[6],sum[7],cout);
	
endmodule

module subtractor(a,b,sum);
	input [7:0] a,b;
	output [7:0]sum;
	wire [7:0] ib;
	wire cout;
	invert b1(ib[0],b[0]);
	invert b2(ib[1],b[1]);
	invert b3(ib[2],b[2]);
	invert b4(ib[3],b[3]);
	invert b5(ib[4],b[4]);
	invert b6(ib[5],b[5]);
	invert b7(ib[6],b[6]);
	invert b8(ib[7],b[7]);

	wire [7:0] q;
	fa fa1(a[0],ib[0],1'b1,sum[0],q[0]);
	fa fa2(a[1],ib[1],q[0],sum[1],q[1]);
	fa fa3(a[2],ib[2],q[1],sum[2],q[2]);
	fa fa4(a[3],ib[3],q[2],sum[3],q[3]);
	fa fa5(a[4],ib[4],q[3],sum[4],q[4]);
	fa fa6(a[5],ib[5],q[4],sum[5],q[5]);
	fa fa7(a[6],ib[6],q[5],sum[6],q[6]);
	fa fa8(a[7],ib[7],q[6],sum[7],cout);

endmodule



module booth_substep(input wire signed [7:0]a,Q,input wire signed q0,input wire signed [7:0] m,output reg signed [7:0] f8,output reg signed [7:0] l8,output reg cq0);
	wire [7:0] addam,subam;
	Adder myadd(a,m,addam);
	subtractor mysub(a,m,subam);
		always @(*) begin	
		if(Q[0] == q0) begin
			 cq0 = Q[0];
			l8 = Q>>1;
			 l8[7] = a[0];
			 f8 = a>>1;
			if (a[7] == 1)
			f8[7] = 1;
		end

		else if(Q[0] == 1 && q0 ==0) begin
			 cq0 = Q[0];
				l8 = Q>>1;
			 l8[7] = subam[0];
			 f8 = subam>>1;
			if (subam[7] == 1)
			f8[7] = 1;
		end

		else begin
			 cq0 = Q[0];
				l8 = Q>>1;
			 l8[7] = addam[0];
			 f8 = addam>>1;
			if (addam[7] == 1)
			f8[7] = 1;
		end
						
			
			
			 	
		
	
end	
endmodule 





 
module boothmul(input signed[7:0]a,b,output signed [15:0] c);
	wire signed [7:0]Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
	wire signed [7:0] m;
	wire signed [7:0] A1,A0,A3,A2;
	wire signed [7:0] A4,A5,A6,A7;
	wire signed[7:0] q0;
	wire qout;
	
	booth_substep step1(8'b00000000,a,1'b0,b,A1,Q1,q0[1]);
	booth_substep step2(A1,Q1,q0[1],b,A2,Q2,q0[2]);
	booth_substep step3(A2,Q2,q0[2],b,A3,Q3,q0[3]);
	booth_substep step4(A3,Q3,q0[3],b,A4,Q4,q0[4]);
	booth_substep step5(A4,Q4,q0[4],b,A5,Q5,q0[5]);
	booth_substep step6(A5,Q5,q0[5],b,A6,Q6,q0[6]);
	booth_substep step7(A6,Q6,q0[6],b,A7,Q7,q0[7]);
	booth_substep step8(A7,Q7,q0[7],b,c[15:8],c[7:0],qout);
	
	 
endmodule

module tb;
wire signed [15:0] z;
reg signed [7:0] a,b;


boothmul my_booth(.a(a),.b(b),.c(z));

initial begin 
end

initial
begin
$monitor($time,"Multiplication: %d * %d = %d",a,b,z );
a = 8'b11110000;
b = 8'b11110000;

#10

a = 8'b10010101;
b = 8'b100000;

#10

a = 8'b0111;
b = 8'b0;

#10

b = 8'b1;
a = 8'b1;

#10  

a = 8'b00111100;
b = 8'b0101;

#10

a = 8'b10101010;
b = 8'b100011;

#10

a = 8'b010001;
b = 8'b11100;

#10
a = 8'b1000;
b = 8'b10111111;

end
endmodule
