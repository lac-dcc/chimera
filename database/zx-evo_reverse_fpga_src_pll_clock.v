// This module receives 28 MHz as input clock
// and strobes strobes for all clocked parts

// clk	|—__——__——__——__—|	period = 28		duty = 50%		phase = 0
// cnt	|< 0>< 1>< 2>< 3>|
// f0	|————____————____|	period = 14		duty = 50%		phase = 0
// f1	|____————____————|	period = 14		duty = 50%		phase = 180
// h0	|————————________|	period = 7		duty = 50%		phase = 0
// h1	|________————————|	period = 7		duty = 50%		phase = 180
// c0	|————____________|	period = 7		duty = 25%		phase = 0
// c1	|____————________|	period = 7		duty = 25%		phase = 90
// c2	|________————____|	period = 7		duty = 25%		phase = 180
// c3	|____________————|	period = 7		duty = 25%		phase = 270

module clock (

	input wire clk,
	input wire [1:0] ay_mod,
	
	output reg	f0, f1,
	output reg	h0, h1,
	output reg	c0, c1, c2, c3,
	output wire ay_clk
);


	reg [1:0] cnt;

	always @(posedge clk)
	begin
		cnt <= cnt + 2'b1;
		
		{f1, f0} <= 2'b1 << cnt[2'b0];
		{h1, h0} <= 2'b1 << cnt[2'b1];
		{c3, c2, c1, c0} <= 4'b1 << cnt;
	end

// AY clock generator	
	// ay_mod - clock selection for AY, MHz: 00 - 1.75 / 01 - 1.7733 / 10 - 3.5 / 11 - 3.546
	reg [7:0] skip_cnt;
	reg [3:0] ay_cnt;
	assign ay_clk = ay_mod[1] ? ay_cnt[2] : ay_cnt[3];
	
	always @(posedge clk)
	begin
		skip_cnt <= skip_cnt[7] ? 8'd73 : skip_cnt - 8'd1;
		ay_cnt <= ay_cnt + (skip_cnt[7] & ay_mod[0] ? 4'd2 : 4'd1);
	end
	
	
endmodule
