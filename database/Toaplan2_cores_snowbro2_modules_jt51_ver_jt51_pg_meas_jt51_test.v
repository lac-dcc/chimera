// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

/*

	tab size 4

*/

module jt51_test;

reg clk;
reg	rst;
// Channel frequency
reg	[6:0]	kc;
reg	[5:0]	kf;
// Operator multiplying
reg	[3:0]	mul;
// Operator detuning
reg	[2:0]	dt1;
reg	[1:0]	dt2;
// phase modulation from LFO
reg	signed	[7:0]	pm;
reg	[2:0]	pms;
// phase operation

wire	[ 4:0]	keycode_III;

`ifndef LFO_PM
	`define LFO_PM 0
`endif
`ifndef LFP_PMS
	`define LFP_PMS 0
`endif

initial begin
	clk = 0;
	forever #140 clk = ~clk;
end

initial begin
	rst = 0;
	#20 rst = 1;
	#300 rst = 0;
    $display("DUMP START");
end

`ifdef LFO_TEST
reg fin;

always @(posedge clk  ) begin
	if( rst ) begin
		kc <= { 3'd3, 4'd4 };
		kf <= 6'd0;
		dt2<= 2'd0;
		dt1<= 3'd0;
		mul<= 4'd1;
		pm <= 0;
		pms<= 3'd1;
        fin<=1'b0;
	end
	else begin
		{ fin,pms, pm } <= {fin,pms,pm} + 1'd1;
		if( fin ) begin
        	#(280*7) $display("DUMP END");
            $finish;
        end
	end
end
`endif

`ifdef LFO_FULL_TEST
reg fin;

always @(posedge clk or posedge rst ) begin
	if( rst ) begin
		kc <= 7'd0;
		kf <= 6'd0;
		dt2<= 2'd0;
		dt1<= 3'd0;
		mul<= 4'd1;
		pm <= 0;
		pms<= 3'd1;
        fin<=1'b0;
	end
	else begin
		{ fin,pms, kc, kf, pm } <= {fin,pms, kc, kf, pm} + 1'd1;
		if( fin ) begin
        	#(280*7) $display("DUMP END");
            $finish;
        end
	end
end
`endif

`ifdef KC_TEST
always @(posedge clk or posedge rst ) begin
	if( rst ) begin
		kc <= 7'd0;
		kf <= 6'd0;
		dt2<= 2'd0;
		dt1<= 3'd0;
		mul<= 4'd1;
		pm <= `LFO_PM;
		pms<= `LFO_PMS;
	end
	else begin
		{ dt2, dt1, kc, kf } <= { dt2, dt1, kc, kf } + 1'd1;
		if( &{ dt2, dt1, kc, kf }==1'b1 ) begin
        	#(280*7) $display("DUMP END");
            $finish;
        end
	end
end
`endif

jt51_pg u_uut(
	.clk(clk),
	.cen(1'b1),
	// Channel frequency
	.kc_I(kc),
	.kf_I(kf),
	// Operator multiplying
	.mul_VI(mul),
	// Operator detuning
	.dt1_II(dt1),
	.dt2_I(dt2),
	// phase modulation from LFO
	.pm(pm),
	.pms_I(pms),
	// phase operation
	.pg_rst_III(1'b0),
	//.keycode_III(keycode_III),
	.pg_phase_X( )
);

initial begin
`ifdef DUMPSIGNALS
	`ifdef NCVERILOG
		$shm_open("jt51_test.shm");
		$shm_probe(jt51_test,"AS");
	`else
		$dumpfile("jt51_test.lxt");
		$dumpvars();
		$dumpon;
	`endif
	#(280*10000) $finish;
`endif
end

endmodule
