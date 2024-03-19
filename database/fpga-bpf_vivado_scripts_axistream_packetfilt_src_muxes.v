//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*

I took this file and mostly copied it from my old project. There's nothing 
really bad about it... I don't think it can get cleaner than this.

*/

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

//A little helper module
module mux3 # (parameter
	WIDTH = 1
)(
	input wire [WIDTH-1:0] A,
	input wire [WIDTH-1:0] B,
	input wire [WIDTH-1:0] C,
	input wire [1:0] sel,
	output wire [WIDTH-1:0] D
);

	assign D = (sel[1] == 1'b1) ? 	((sel[0] == 1'b1) ? C : B) :
									((sel[0] == 1'b1) ? A : 0);
endmodule

/*

All agents are seen through their respective adapters

Snooper:
--> write addr
--> write data
--> 1 bit write enable
--> 8 bit length increment
--> 1 bit reset signal

CPU:
--> read address
--> 1 bit read enable
<-- read data
<-- 32 bit length

Forwarder:
--> read address
--> 1 bit read enable
<-- read data
<-- 32 bit length

Ping/Pang/Pung:
--> address
--> write data
--> 1 bit read enable
--> 1 bit write enable
--> 8 bit length increment
--> 1 bit reset signal
<-- read data
<-- 32 bit length
*/

`define ENABLE_BIT 1
`define VLD_BIT 1
`define RESET_SIG 1
module muxes # (
    parameter ADDR_WIDTH = 10,
	parameter DATA_WIDTH = 64,
    parameter INC_WIDTH = 8, 
	parameter PLEN_WIDTH = 32 
)(
	//Inputs
	//Format is {addr, wr_data, wr_en, bytes_inc}
	input wire [ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH -1:0] from_sn,
	//Format is {addr, reset_sig, rd_en}
	input wire [ADDR_WIDTH + `ENABLE_BIT + `RESET_SIG -1:0] from_cpu,
	input wire [ADDR_WIDTH + `ENABLE_BIT + `RESET_SIG -1:0] from_fwd,
	//Format is {rd_data, rd_data_vld, packet_len}
	input wire [DATA_WIDTH + `VLD_BIT + PLEN_WIDTH -1:0] from_ping,
	input wire [DATA_WIDTH + `VLD_BIT + PLEN_WIDTH -1:0] from_pang,
	input wire [DATA_WIDTH + `VLD_BIT + PLEN_WIDTH -1:0] from_pong,
	
	//Outputs
	//Nothing to output to snooper
	//Format is {rd_data, rd_data_vld, packet_len}
	output wire [DATA_WIDTH + `VLD_BIT + PLEN_WIDTH -1:0] to_cpu,
	output wire [DATA_WIDTH + `VLD_BIT + PLEN_WIDTH -1:0] to_fwd,
	//Format here is {addr, wr_data, wr_en, bytes_inc, reset_sig, rd_en}
	output wire [ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT -1:0] to_ping,
	output wire [ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT -1:0] to_pang,
	output wire [ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT -1:0] to_pong,
	
	//Selects
	input wire [1:0] sn_sel,
	input wire [1:0] cpu_sel,
	input wire [1:0] fwd_sel,
	
	input wire [1:0] ping_sel,
	input wire [1:0] pang_sel,
	input wire [1:0] pong_sel
);

mux3 # (DATA_WIDTH + `VLD_BIT + PLEN_WIDTH) cpu_mux (
	.A(from_ping),
	.B(from_pang),
	.C(from_pong),
	.sel(cpu_sel),
	.D(to_cpu)
);

mux3 # (DATA_WIDTH + `VLD_BIT + PLEN_WIDTH) fwd_mux (
	.A(from_ping),
	.B(from_pang),
	.C(from_pong),
	.sel(fwd_sel),
	.D(to_fwd)
);

//One agent always has exclusive control of a buffer, even though it
//doesn't use the read and write ports at the same time. Replace unused
//inputs/outputs with zeros

//Format here is {addr, wr_data, wr_en, bytes_inc, reset_sig, rd_en}
wire [ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT -1:0] from_sn_padded;
wire [ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT -1:0] from_cpu_padded;
wire [ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT -1:0] from_fwd_padded;

`localparam [DATA_WIDTH-1:0] no_wr_data = 0;
`localparam [`ENABLE_BIT-1:0] no_enable_bit = 0;
`localparam [INC_WIDTH-1:0] no_byte_inc = 0;
`localparam [`RESET_SIG-1:0] no_reset_sig = 0;

assign from_sn_padded = {from_sn, no_reset_sig, no_enable_bit};
assign from_cpu_padded = {from_cpu[ADDR_WIDTH + `RESET_SIG + `ENABLE_BIT -1:2], no_wr_data, no_byte_inc, no_enable_bit, from_cpu[1:0]};
assign from_fwd_padded = {from_fwd[ADDR_WIDTH + `RESET_SIG + `ENABLE_BIT -1:2], no_wr_data, no_byte_inc, no_enable_bit, from_fwd[1:0]};


mux3 # (ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT) ping_mux (
	.A(from_sn_padded),
	.B(from_cpu_padded),
	.C(from_fwd_padded),
	.sel(ping_sel),
	.D(to_ping)
);

mux3 # (ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT) pang_mux (
	.A(from_sn_padded),
	.B(from_cpu_padded),
	.C(from_fwd_padded),
	.sel(pang_sel),
	.D(to_pang)
);

mux3 # (ADDR_WIDTH + DATA_WIDTH + `ENABLE_BIT + INC_WIDTH + `RESET_SIG + `ENABLE_BIT) pong_mux (
	.A(from_sn_padded),
	.B(from_cpu_padded),
	.C(from_fwd_padded),
	.sel(pong_sel),
	.D(to_pong)
);

endmodule
`undef localparam
