/*
 *  Copyright (C) 2018  Clifford Wolf <clifford@symbioticeda.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

module marlann_memory (
	input             clock,
	input      [15:0] addr,
	input      [ 7:0] wen,
	input      [63:0] wdata,
	output reg [63:0] rdata
);
	wire [2:0] shamt = 4 - addr[1:0];
	reg [1:0] shamt_rev_q;

	wire [7:0] shifted_wen = {wen, wen} >> (shamt[1:0] * 2);
	wire [63:0] shifted_wdata = {wdata, wdata} >> (shamt[1:0] * 16);
	wire [63:0] shifted_rdata;

	wire [3:0] addr_offsets = 8'b 0000_1111 >> shamt;

	wire [13:0] addr0 = addr[15:2];
	wire [13:0] addr1 = addr0 + 1;

	marlann_memory_spram ram [3:0] (
		.clock(clock),
		.wen(shifted_wen),
		.addr({
			addr_offsets[3] ? addr1 : addr0,
			addr_offsets[2] ? addr1 : addr0,
			addr_offsets[1] ? addr1 : addr0,
			addr_offsets[0] ? addr1 : addr0
		}),
		.wdata(shifted_wdata),
		.rdata(shifted_rdata)
	);

	always @(posedge clock) begin
		shamt_rev_q <= addr[1:0];
		rdata <= {shifted_rdata, shifted_rdata} >> (shamt_rev_q * 16);
	end
endmodule

module marlann_memory_spram (
	input         clock,
	input  [ 1:0] wen,
	input  [13:0] addr,
	input  [15:0] wdata,
	output [15:0] rdata
);
`ifdef RADIANT
	(* keep *)
	SP256K spram (
		.AD(addr[13:0]),
		.DI(wdata),
		.MASKWE({{2{wen[1]}}, {2{wen[0]}}}),
		.WE(|wen),
		.CS(1'b1),
		.CK(clock),
		.STDBY(1'b0),
		.SLEEP(1'b0),
		.PWROFF_N(1'b1),
		.DO(rdata)
	);
`else
	(* keep *)
	SB_SPRAM256KA spram (
		.ADDRESS(addr[13:0]),
		.DATAIN(wdata),
		.MASKWREN({{2{wen[1]}}, {2{wen[0]}}}),
		.WREN(|wen),
		.CHIPSELECT(1'b1),
		.CLOCK(clock),
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1),
		.DATAOUT(rdata)
	);
`endif
endmodule
