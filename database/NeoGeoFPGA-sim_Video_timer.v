// NeoGeo logic definition (simulation only)
// Copyright (C) 2018 Sean Gonsalves
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

`timescale 1ns/1ns

module lspc_timer(
	input LSPC_6M,
	input RESETP,
	input [15:0] M68K_DATA,
	input WR_TIMER_HIGH,
	input WR_TIMER_LOW,
	input VMODE,
	input [2:0] TIMER_MODE,
	input TIMER_STOP,
	input [8:0] RASTERC,
	input TIMER_IRQ_EN,
	input R74_nQ,
	input BNKB,
	output D46A_OUT
);
	
	wire [15:0] REG_TIMERHIGH;
	wire [15:0] REG_TIMERLOW;
	
	
	// K31 G50 K48 K58
	FDS16bit K31(WR_TIMER_HIGH, M68K_DATA, REG_TIMERHIGH);
	
	assign L106A_OUT = L127_CO;
	C43 N50(~LSPC_6M, ~REG_TIMERHIGH[3:0], RELOAD, L106A_OUT, L76_OUT, ~RESETP, , N50_CO);
	C43 M18(~LSPC_6M, ~REG_TIMERHIGH[7:4], RELOAD, L106A_OUT, N50_CO, ~RESETP, , M18_CO);
	
	assign K29_OUT = M18_CO ^ 1'b0;	// Used for test mode
	
	C43 L51(~LSPC_6M, ~REG_TIMERHIGH[11:8], RELOAD, L106A_OUT, K29_OUT, ~RESETP, , L51_CO);
	C43 L16(~LSPC_6M, ~REG_TIMERHIGH[15:12], RELOAD, L106A_OUT, L51_CO, ~RESETP, , TIMER_CO);
	
	
	
	// K104 K68 K87 K121
	FDS16bit K104(WR_TIMER_LOW, M68K_DATA, REG_TIMERLOW);
	
	C43 L127(~LSPC_6M, ~REG_TIMERLOW[3:0], RELOAD, nTIMER_EN, nTIMER_EN, ~RESETP, , L127_CO);
	C43 M125(~LSPC_6M, ~REG_TIMERLOW[7:4], RELOAD, L127_CO, nTIMER_EN, ~RESETP, , M125_CO);
	
	assign M52_OUT = M125_CO ^ 1'b0;	// Used for test mode
	
	assign L107A_OUT = L127_CO;
	C43 M54(~LSPC_6M, ~REG_TIMERLOW[11:8], RELOAD, L107A_OUT, M52_OUT, ~RESETP, , M54_CO);
	C43 L81(~LSPC_6M, ~REG_TIMERLOW[15:12], RELOAD, L107A_OUT, M54_CO, ~RESETP, , L81_CO);
	
	
	assign L76_OUT = L81_CO ^ 1'b0;	// Used for test mode
	
	
	// Mode 0 reload pulse gen
	FDPCell E10(WR_TIMER_LOW, 1'b0, E14A_OUT, 1'b1, E10_Q, );
	FDPCell E20(~LSPC_6M, E10_Q, 1'b1, RESETP, E20_Q, E20_nQ);
	FDPCell E32(~LSPC_6M, E20_Q, 1'b1, RESETP, , E32_nQ);
	assign E14A_OUT = ~&{E20_nQ, E32_nQ};
	assign RELOAD_MODE0 = ~|{E32_nQ, ~TIMER_MODE[0], E20_nQ};
	
	// Mode 1 reload pulse gen
	FDPCell K18(R74_nQ, BNKB, RESETP, 1'b1, K18_Q, );
	FDPCell E16(LSPC_6M, K18_Q, RESETP, 1'b1, E16_Q, );
	FDPCell E36(~LSPC_6M, E16_Q, RESETP, 1'b1, E36_Q, );
	FDM E46_Q(~LSPC_6M, E36_Q, , E46_nQ);
	assign RELOAD_MODE1 = ~|{~TIMER_MODE[1], E46_nQ, E36_Q};
	
	// Mode 2 reload pulse gen and IRQ
	assign K22A_OUT = L127_CO & TIMER_CO;
	FDM E43(~LSPC_6M, K22A_OUT, , E43_nQ);
	assign RELOAD_MODE2 = TIMER_MODE[2] & K22A_OUT;
	assign D46A_OUT = ~|{~TIMER_IRQ_EN, E43_nQ};
	
	assign RELOAD = ~|{RELOAD_MODE0, RELOAD_MODE1, RELOAD_MODE2};
	
	// Stop option
	assign J257A_OUT = ~|{RASTERC[5:4]};
	assign I234_OUT = |{RASTERC[8], ~VMODE, TIMER_STOP};
	assign J238B_OUT = ~|{J257A_OUT, I234_OUT};
	FDM J69(LSPC_6M, J238B_OUT, , nTIMER_EN);

endmodule
