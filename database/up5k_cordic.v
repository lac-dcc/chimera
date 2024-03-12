module cordic(
	input clk,
	input reset,
	output signed [BITS-1:0] sin,
	output signed [BITS-1:0] cos
);
	parameter BITS = 20;
	parameter SHIFT = 5;
	localparam MAX = (1 << (BITS-1)) - 1;
	reg signed [BITS-1:0] x;
	reg signed [BITS-1:0] y;
//int xp = x + (y >> shift) - (x >> (2*shift+1));
//int yp = y - (x >> shift) - (y >> (2*shift+1)); // + (xacc >> shift);
	wire signed [BITS:0] nx = x + (y >>> SHIFT) - (x >>> (2*SHIFT+1));
	wire signed [BITS:0] ny = y - (x >>> SHIFT) - (y >>> (2*SHIFT+1));

	assign sin = x[BITS-1:0]; // + (1 << (BITS-1));
	assign cos = y[BITS-1:0]; // + (1 << (BITS-1));


	always @(posedge clk)
	begin
		if (reset) begin
			x <= MAX;
			y <= 0;
		end else
		if (nx > MAX) begin
			x <= MAX;
			y <= 0;
		end else
		if (ny > MAX) begin
			x <= 0;
			y <= MAX;
		end else
		if (nx < -MAX) begin
			x <= -MAX;
			y <= 0;
		end else
		if (ny < -MAX) begin
			x <= 0;
			y <= -MAX;
		end else
		begin
			x <= nx;
			y <= ny;
		end
	end

endmodule


module test_cordic;

	parameter BITS=20;
	wire signed [BITS-1:0] x;
	wire signed [BITS-1:0] y;
	reg reset = 1;
	reg clk = 0;

	cordic #(BITS,5) cord(clk, reset, x, y);


	always #5 clk = !clk;

	always begin
		# 50 reset <= 0;
		# 100000 $finish;
	end

	initial begin
		//$display("time,clk,x,y");
		$monitor("%d %d", x, y);
	end

endmodule
