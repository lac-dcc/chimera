//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
/*
muxselinvert.v

I'm really going off the deep end here. I just spent like 30 minutes drawing 
K-maps like a schmuck! 

Open the file kmaps.html in your browser to see them for yourself
*/


module muxselinvert(
	input wire [1:0] sn_sel,
	input wire [1:0] cpu_sel,
	input wire [1:0] fwd_sel,
	
	output wire [1:0] ping_sel,
	output wire [1:0] pang_sel,
	output wire [1:0] pong_sel
);

assign ping_sel[1] = 	(~fwd_sel[1] & fwd_sel[0]) | (
						(~cpu_sel[1] & cpu_sel[0]) &
						 (sn_sel[1] | ~sn_sel[0])
						); 
assign ping_sel[0] = 	(~fwd_sel[1] & fwd_sel[0]) | 
						(~sn_sel[1] & sn_sel[0]);

assign pang_sel[1] =	(fwd_sel[1] & ~fwd_sel[0]) |
						(cpu_sel[1] & ~cpu_sel[0]);

assign pang_sel[0] =	(fwd_sel[1] & ~fwd_sel[0]) |
						(sn_sel[1] & ~sn_sel[0]);

assign pong_sel[1] = 	(fwd_sel[1] & fwd_sel[0]) | (
						(cpu_sel[1] & cpu_sel[0]) &
						 (~sn_sel[1] | ~sn_sel[0])
						); 

assign pong_sel[0] = 	(fwd_sel[1] & fwd_sel[0]) | 
						(sn_sel[1] & sn_sel[0]);
/*
Ping select bit 1 = F'W+C'P(S+N')

Ping select bit 0 = F'W+S'N

Pang select bit 1 = FW'+CP'

Pang select bit 0 = FW'+SN'

Pung select bit 1 = FW+CP(S'+N')

Pung select bit 0 = FW+SN

*/

endmodule
