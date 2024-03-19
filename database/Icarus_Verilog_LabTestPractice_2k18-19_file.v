`timescale 1ms/1ns
/*Behavioral*/
module dff(
	output q,
	input d,
	input clk,
	input reset,
	input set
);
	
	reg q;

	initial
		q = 1'b0;

	always @(posedge clk or set) begin
		case ({reset, set}) 
			2'b00 : q <= d;
			2'b01 : q <= 1'b1;
			2'b10 : q <= 1'b0;
			2'b11 : q <= 1'bz;	
		endcase
	end

endmodule

module tff(
	output q,
	input t,
	input clk,
	input reset
);
	reg q;
	initial 
		q <= 1'b0;
	always @(posedge clk) begin
		if(reset)
			q <= 1'b0;
		else
			if( t == 0)
				q <= q;
			else 
				q <= ~q;
	end

endmodule

module counter4bit(
	output [3:0] q,
	input clock,
	input rst,
	input en
);
	wire clk;
	wire [3:0] t;
	assign t[0] = 1'b1;
	assign t[1] = q[0];
	and(t[2], q[1], q[0]);
	and(t[3], q[2], t[2]);

	assign clk = clock & en;

	tff ff1(q[0], t[0], clk, rst);
	tff ff2(q[1], t[1], clk, rst);
	tff ff3(q[2], t[2], clk, rst);
	tff ff4(q[3], t[3], clk, rst);

endmodule

/*Gate Lvl*/
module ctrlLogic(
	output t0,
	output t1,
	output t2,
	input clk,
	input s,
	input z,
	input x,
	input set
);
	// reg t0;
	// initial 
	// 	t0 = 1'b1;
	wire dt0, dt1, dt2, t0, t1, t2;
	wire sbar, zbar, xbar;
	wire t0and1, t0and2, t0or1;
	wire t1and1, t1and2, t1and3, t1or1, t1or2;
	wire t2and1, t2and2, t2or1;
	
	not(sbar,s);
	not(zbar,z);
	not(xbar,x);

	and(t0and1, t0, sbar);
	and(t0and2, t2, z);
	or(t0or1, t0and1, t0and2);

	and(t1and1, t0, s);
	and(t1and2, t2, xbar, zbar);
	and(t1and3, t1, xbar);
	or(t1or1, t1and1, t1and2);
	or(t1or2, t1or1, t1and3);

	and(t2and1, t1, x);
	and(t2and2, t2, x, zbar);
	or(t2or1, t2and1, t2and2);
		
	dff ff1(t0,t0or1,clk, 1'b0, set);
	dff ff2(t1,t1or2,clk, 1'b0, 1'b0);
	dff ff3(t2,t2or1,clk, 1'b0, 1'b0);

endmodule

module intg(
	output [3:0] q,
	output g,
	input s,
	input xx,
	input clk,
	input set
);
	
	wire rst;
	wire en;
	wire [2:0] t;
	wire zz;

	assign rst = t[0] & s;
	assign en = (t[1] & xx) | (t[2] & (~zz) & xx);
	
	wire [3:0] q;
	counter4bit ctr(q, clk, rst, en);

	assign zz = q[0] & q[1] & q[2] & q[3];
	ctrlLogic ctrl(t[0], t[1], t[2], clk, s, zz, xx, set);
	
	wire d;
	assign d = zz & t[2];
	dff ff(g, d, clk, rst, 1'b0);	

endmodule

module tb_intg();
	
	reg clk;
	initial 
		clk = 1'b0;
	always
	#0.5 clk = ~clk;
	
	reg s;
	reg xx;
	reg set;
	wire [3:0] q;
	wire g;

	intg mod(q, g, s, xx, clk, set);

	initial begin
			set = 1'b1;
			s = 1'b0;
			xx = 1'b0;
	#5	 	s = 1'b1;
			set = 1'b0;
			xx = 1'b1;
		#30 xx = 1'b0;
		#100 $finish;

	end	
	initial begin
		$dumpfile("file.vcd");
		$dumpvars;
	end

	initial begin
		$monitor($time,"s = %b, x = %b, q = %d, g = %b", s, xx, q, g);
	end

endmodule
