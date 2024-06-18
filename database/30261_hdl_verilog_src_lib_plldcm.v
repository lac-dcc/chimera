// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2019-08-14 by mza
// taken from info in ug382/ug615/ds162
// last updated 2021-10-27 by mza

`ifndef PLLDCM_LIB
`define PLLDCM_LIB

module dummy_dcm_diff_input #(
	parameter MULT_DIV = 10,
	parameter PERIOD = 10.0
) (
	input clock_p, clock_n,
	input reset,
	output clock_out,
	output clock_locked
);
	wire clock_raw1;
	IBUFGDS mybuf_raw1 (.I(clock_p), .IB(clock_n), .O(clock_raw1));
	wire clock_raw2;
	simpledcm_CLKGEN #(.MULTIPLY(MULT_DIV), .DIVIDE(MULT_DIV), .PERIOD(PERIOD)) mydcm (.clockin(clock_raw1), .reset(reset), .clockout(clock_raw2), .clockout180(), .locked(clock_locked));
	BUFG mybuf_raw2 (.I(clock_raw2), .O(clock_out));
endmodule

// can only be used to directly feed a DCM
//simplepll_ADV_2DCM #(.OVERALL_DIVIDE(1), .MULTIPLY(10), .DIVIDE(4), .PERIOD(20.0)) mypll (.clockin(clock50), .reset(reset), .clockout(clock), .locked()); // 50->125
module simplepll_ADV_2DCM #(
	parameter OVERALL_DIVIDE = 1,
	parameter MULTIPLY = 4,
	parameter DIVIDE = 1,
	parameter PERIOD = 10.0,
	parameter COMPENSATION = "PLL2DCM"
) (
	input clockin,
	input reset,
	output clockout,
	output locked
);
	wire fbdcm;
	PLL_ADV #(
		.SIM_DEVICE("SPARTAN6"),
		.BANDWIDTH("OPTIMIZED"), // "high", "low" or "optimized"
		.CLKFBOUT_PHASE(0.0), // phase shift (degrees) of all output clocks
		.CLKIN1_PERIOD(PERIOD), // clock period (ns) of input clock on clkin1
		.CLKIN2_PERIOD(PERIOD), // clock period (ns) of input clock on clkin2
		.DIVCLK_DIVIDE(OVERALL_DIVIDE), // division factor for all clocks (1 to 52)
		.CLKFBOUT_MULT(MULTIPLY), // multiplication factor for all output clocks
		.CLKOUT0_DIVIDE(DIVIDE), // division factor for clkout0 (1 to 128)
		.CLKOUT1_DIVIDE(1), // division factor for clkout1 (1 to 128)
		.CLKOUT2_DIVIDE(1), // division factor for clkout2 (1 to 128)
		.CLKOUT3_DIVIDE(1), // division factor for clkout3 (1 to 128)
		.CLKOUT4_DIVIDE(1), // division factor for clkout4 (1 to 128)
		.CLKOUT5_DIVIDE(1), // division factor for clkout5 (1 to 128)
		.CLKOUT0_PHASE(0.0), // phase shift (degrees) for clkout0 (0.0 to 360.0)
		.CLKOUT1_PHASE(0.0), // phase shift (degrees) for clkout1 (0.0 to 360.0)
		.CLKOUT2_PHASE(0.0), // phase shift (degrees) for clkout2 (0.0 to 360.0)
		.CLKOUT3_PHASE(0.0), // phase shift (degrees) for clkout3 (0.0 to 360.0)
		.CLKOUT4_PHASE(0.0), // phase shift (degrees) for clkout4 (0.0 to 360.0)
		.CLKOUT5_PHASE(0.0), // phase shift (degrees) for clkout5 (0.0 to 360.0)
		.CLKOUT0_DUTY_CYCLE(0.5), // duty cycle for clkout0 (0.01 to 0.99)
		.CLKOUT1_DUTY_CYCLE(0.5), // duty cycle for clkout1 (0.01 to 0.99)
		.CLKOUT2_DUTY_CYCLE(0.5), // duty cycle for clkout2 (0.01 to 0.99)
		.CLKOUT3_DUTY_CYCLE(0.5), // duty cycle for clkout3 (0.01 to 0.99)
		.CLKOUT4_DUTY_CYCLE(0.5), // duty cycle for clkout4 (0.01 to 0.99)
		.CLKOUT5_DUTY_CYCLE(0.5), // duty cycle for clkout5 (0.01 to 0.99)
		.COMPENSATION(COMPENSATION), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "INTERNAL", "EXTERNAL", "DCM2PLL", "PLL2DCM"
		.REF_JITTER(0.100) // input reference jitter (0.000 to 0.999 ui%)
	) pll_adv_inst (
		.RST(reset), // asynchronous pll reset
		.LOCKED(locked), // active high pll lock signal
		.CLKFBIN(fbdcm), // clock feedback input
		.CLKFBOUT(), // general output feedback signal
		.CLKIN1(clockin), // primary clock input
		.CLKOUT0(),
		.CLKOUT1(), //
		.CLKOUT2(), //
		.CLKOUT3(), // one of six general clock output signals
		.CLKOUT4(), // one of six general clock output signals
		.CLKOUT5(), // one of six general clock output signals
		.CLKFBDCM(fbdcm), // output feedback signal used when pll feeds a dcm
		.CLKOUTDCM0(clockout), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM1(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM2(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM3(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM4(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM5(), // one of six clock outputs to connect to the dcm
		.DO(), // dynamic reconfig data output (16-bits)
		.DRDY(), // dynamic reconfig ready output
		.CLKIN2(1'b0), // secondary clock input
		.CLKINSEL(1'b1), // selects '1' = clkin1, '0' = clkin2
		.DADDR(5'b00000), // dynamic reconfig address input (5-bits)
		.DCLK(1'b0), // dynamic reconfig clock input
		.DEN(1'b0), // dynamic reconfig enable input
		.DI(16'h0000), // dynamic reconfig data input (16-bits)
		.DWE(1'b0), // dynamic reconfig write enable input
		.REL(1'b0) // used to force the state of the PFD outputs (test only)
	);
endmodule

//simplepll_ADV #(.OVERALL_DIVIDE(1), .MULTIPLY(10), .DIVIDE(4), .PERIOD(20.0)) mypll (.clockin(clock50), .reset(reset), .clockout(clock), .locked()); // 50->125
module simplepll_ADV #(
	parameter OVERALL_DIVIDE = 1,
	parameter MULTIPLY = 4,
	parameter DIVIDE = 1,
	parameter PERIOD = 10.0,
	parameter COMPENSATION = "INTERNAL"
) (
	input clockin,
	input reset,
	output clockout,
	output locked
);
	wire fb;
	PLL_ADV #(
		.SIM_DEVICE("SPARTAN6"),
		.BANDWIDTH("OPTIMIZED"), // "high", "low" or "optimized"
		.CLKFBOUT_PHASE(0.0), // phase shift (degrees) of all output clocks
		.CLKIN1_PERIOD(PERIOD), // clock period (ns) of input clock on clkin1
		.CLKIN2_PERIOD(PERIOD), // clock period (ns) of input clock on clkin2
		.DIVCLK_DIVIDE(OVERALL_DIVIDE), // division factor for all clocks (1 to 52)
		.CLKFBOUT_MULT(MULTIPLY), // multiplication factor for all output clocks
		.CLKOUT0_DIVIDE(DIVIDE), // division factor for clkout0 (1 to 128)
		.CLKOUT1_DIVIDE(1), // division factor for clkout1 (1 to 128)
		.CLKOUT2_DIVIDE(1), // division factor for clkout2 (1 to 128)
		.CLKOUT3_DIVIDE(1), // division factor for clkout3 (1 to 128)
		.CLKOUT4_DIVIDE(1), // division factor for clkout4 (1 to 128)
		.CLKOUT5_DIVIDE(1), // division factor for clkout5 (1 to 128)
		.CLKOUT0_PHASE(0.0), // phase shift (degrees) for clkout0 (0.0 to 360.0)
		.CLKOUT1_PHASE(0.0), // phase shift (degrees) for clkout1 (0.0 to 360.0)
		.CLKOUT2_PHASE(0.0), // phase shift (degrees) for clkout2 (0.0 to 360.0)
		.CLKOUT3_PHASE(0.0), // phase shift (degrees) for clkout3 (0.0 to 360.0)
		.CLKOUT4_PHASE(0.0), // phase shift (degrees) for clkout4 (0.0 to 360.0)
		.CLKOUT5_PHASE(0.0), // phase shift (degrees) for clkout5 (0.0 to 360.0)
		.CLKOUT0_DUTY_CYCLE(0.5), // duty cycle for clkout0 (0.01 to 0.99)
		.CLKOUT1_DUTY_CYCLE(0.5), // duty cycle for clkout1 (0.01 to 0.99)
		.CLKOUT2_DUTY_CYCLE(0.5), // duty cycle for clkout2 (0.01 to 0.99)
		.CLKOUT3_DUTY_CYCLE(0.5), // duty cycle for clkout3 (0.01 to 0.99)
		.CLKOUT4_DUTY_CYCLE(0.5), // duty cycle for clkout4 (0.01 to 0.99)
		.CLKOUT5_DUTY_CYCLE(0.5), // duty cycle for clkout5 (0.01 to 0.99)
		.COMPENSATION(COMPENSATION), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "INTERNAL", "EXTERNAL", "DCM2PLL", "PLL2DCM"
		.REF_JITTER(0.100) // input reference jitter (0.000 to 0.999 ui%)
	) pll_adv_inst (
		.RST(reset), // asynchronous pll reset
		.LOCKED(locked), // active high pll lock signal
		.CLKFBIN(fb), // clock feedback input
		.CLKFBOUT(fb), // general output feedback signal
		.CLKIN1(clockin), // primary clock input
		.CLKOUT0(clockout),
		.CLKOUT1(), //
		.CLKOUT2(), //
		.CLKOUT3(), // one of six general clock output signals
		.CLKOUT4(), // one of six general clock output signals
		.CLKOUT5(), // one of six general clock output signals
		.CLKFBDCM(), // output feedback signal used when pll feeds a dcm
		.CLKOUTDCM0(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM1(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM2(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM3(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM4(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM5(), // one of six clock outputs to connect to the dcm
		.DO(), // dynamic reconfig data output (16-bits)
		.DRDY(), // dynamic reconfig ready output
		.CLKIN2(1'b0), // secondary clock input
		.CLKINSEL(1'b1), // selects '1' = clkin1, '0' = clkin2
		.DADDR(5'b00000), // dynamic reconfig address input (5-bits)
		.DCLK(1'b0), // dynamic reconfig clock input
		.DEN(1'b0), // dynamic reconfig enable input
		.DI(16'h0000), // dynamic reconfig data input (16-bits)
		.DWE(1'b0), // dynamic reconfig write enable input
		.REL(1'b0) // used to force the state of the PFD outputs (test only)
	);
endmodule

//wire rawclock125;
//simplepll_BASE #(.OVERALL_DIVIDE(1), .MULTIPLY(10), .DIVIDE0(4), .PHASE0(0.0), .PERIOD(20.0)) other (.clockin(clock50), .reset(reset), .clock0out(rawclock125), .locked(other_pll_locked)); // 50->125
//wire clock125;
//BUFG mrt (.I(rawclock125), .O(clock125));
// divclk_divide 1 to 52
// mult 1 to 64
// clkout_divide 1 to 128
module simplepll_BASE #(
	parameter
	PERIOD=10.0,
	OVERALL_DIVIDE=1,
	MULTIPLY=4,
	DIVIDE0=1, DIVIDE1=2, DIVIDE2=4, DIVIDE3=8, DIVIDE4=16, DIVIDE5=32,
	PHASE0=0.0, PHASE1=0.0, PHASE2=0.0, PHASE3=0.0, PHASE4=0.0, PHASE5=0.0,
	COMPENSATION="SYSTEM_SYNCHRONOUS"
) (
	input clockin,
	input reset,
	output clock0out,
	output clock1out,
	output clock2out,
	output clock3out,
	output clock4out,
	output clock5out,
	output locked
);
	wire fb;
	PLL_BASE #(
		.BANDWIDTH("OPTIMIZED"), // "HIGH", "LOW" or "OPTIMIZED"
		.CLKFBOUT_MULT(MULTIPLY), // Multiplication factor for all output clocks
		.CLKFBOUT_PHASE(0.0), // Phase shift (degrees) of all output clocks
		.CLKIN_PERIOD(PERIOD), // Clock period (ns) of input clock on CLKIN
		.CLKOUT0_DIVIDE(DIVIDE0), // Division factor for CLKOUT0 (1 to 128)
		.CLKOUT0_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT0 (0.01 to 0.99)
		.CLKOUT0_PHASE(PHASE0), // Phase shift (degrees) for CLKOUT0 (0.0 to 360.0)
		.CLKOUT1_DIVIDE(DIVIDE1), // Division factor for CLKOUT1 (1 to 128)
		.CLKOUT1_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT1 (0.01 to 0.99)
		.CLKOUT1_PHASE(PHASE1), // Phase shift (degrees) for CLKOUT1 (0.0 to 360.0)
		.CLKOUT2_DIVIDE(DIVIDE2), // Division factor for CLKOUT2 (1 to 128)
		.CLKOUT2_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT2 (0.01 to 0.99)
		.CLKOUT2_PHASE(PHASE2), // Phase shift (degrees) for CLKOUT2 (0.0 to 360.0)
		.CLKOUT3_DIVIDE(DIVIDE3), // Division factor for CLKOUT3 (1 to 128)
		.CLKOUT3_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT3 (0.01 to 0.99)
		.CLKOUT3_PHASE(PHASE3), // Phase shift (degrees) for CLKOUT3 (0.0 to 360.0)
		.CLKOUT4_DIVIDE(DIVIDE4), // Division factor for CLKOUT4 (1 to 128)
		.CLKOUT4_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT4 (0.01 to 0.99)
		.CLKOUT4_PHASE(PHASE4), // Phase shift (degrees) for CLKOUT4 (0.0 to 360.0)
		.CLKOUT5_DIVIDE(DIVIDE5), // Division factor for CLKOUT5 (1 to 128)
		.CLKOUT5_DUTY_CYCLE(0.5), // Duty cycle for CLKOUT5 (0.01 to 0.99)
		.CLKOUT5_PHASE(PHASE5), // Phase shift (degrees) for CLKOUT5 (0.0 to 360.0)
		.COMPENSATION(COMPENSATION), // "SYSTEM_SYNCHRONOUS",
		// "SOURCE_SYNCHRONOUS", "INTERNAL", "EXTERNAL",
		// "DCM2PLL", "PLL2DCM"
		.DIVCLK_DIVIDE(OVERALL_DIVIDE), // Division factor for all clocks (1 to 52)
		.REF_JITTER(0.100) // Input reference jitter (0.000 to 0.999 UI%)
	) PLL_BASE_inst (
		.CLKFBOUT(fb), // General output feedback signal
		.CLKOUT0(clock0out), // One of six general clock output signals
		.CLKOUT1(clock1out), // One of six general clock output signals
		.CLKOUT2(clock2out), // One of six general clock output signals
		.CLKOUT3(clock3out), // One of six general clock output signals
		.CLKOUT4(clock4out), // One of six general clock output signals
		.CLKOUT5(clock5out), // One of six general clock output signals
		.LOCKED(locked), // Active high PLL lock signal
		.CLKFBIN(fb), // Clock feedback input
		.CLKIN(clockin), // Clock input
		.RST(reset) // Asynchronous PLL reset
	);
endmodule

//	simpledcm_CLKGEN #(.MULTIPLY(), .DIVIDE(), .PERIOD()) mydcm (.clockin(), .reset(), .clockout(), .clockout180(), .locked());
// clockin: 0.5-375 MHz (ds162.pdf)
// clockout: 5-375 MHz (ds162.pdf)
// MULTIPLY: 2-256
// DIVIDE: 1-256
// clkfxdv_divide:2, 4, 8, 16, 32
module simpledcm_CLKGEN #(parameter MULTIPLY=4, DIVIDE=1, PERIOD="10.0") (
	input clockin,
	input reset,
	output clockout,
	output clockout180,
	output locked
);
	DCM_CLKGEN #(
//		.DFS_OSCILLATOR_MODE("PHASE_FREQ_LOCK"), // "The DCM has the attribute DFS_OSCILLATOR_MODE not set to PHASE_FREQ_LOCK. No phase relationship exists between the input clock and CLKFX or CLKFX180 outputs of this DCM. Data paths between these clock domains must be constrained using FROM/TO constraints" but "Module DCM_CLKGEN does not have a parameter named DFS_OSCILLATOR_MODE"
		.CLKFXDV_DIVIDE(2), // Specifies DIVIDE value for CLKFXDV.
		.CLKFX_DIVIDE(DIVIDE), // This value in conjunction with the input frequency and CLKFX_MULTIPLY
		// value determine the resultant output frequency for the CLKFX and
		// CLKFX180 outputs.
		.CLKFX_MD_MAX(0.0), // When using the DCM_CLKGEN with variable M and D values, this would
		// specify the maximum ratio of M and D used during static timing
		// analysis to ensure proper timing of the DCM output.
		.CLKFX_MULTIPLY(MULTIPLY), // This value in conjunction with the input frequency and CLKFX_DIVIDE
		// value determine the resultant output frequency for the CLKFX and
		// CLKFX180 outputs.
		.CLKIN_PERIOD(PERIOD), // This attribute specifies the source clock period which is used to
		// help the DCM adjust for the optimum CLKFX/CLKFX180 outputs and also
		// result in faster locking time.
		.STARTUP_WAIT("FALSE") // Delays configuration DONE signal until DCM LOCKED signal goes high.
		)
	DCM_CLKGEN_inst (
		.CLKFX(clockout), // 1-bit Generated output clock.
		.CLKFX180(clockout180), // 1-bit Generated output clock 180 degree out of phase from CLKFX.
		.CLKFXDV(), // 1-bit Divided output clock, Divide value derived from CLKFXDV_DIV attribute.
		// There is no phase alignment between CLKFX and CLKFXDV.
		.LOCKED(locked), // 1-bit Synchronous output from the DCM that provides the user with an indication
		// the DCM is ready for operation.
		.PROGDONE(), // 1-bit Active high output to indicate the successful re-programming of an M
		// and/or D value.
		.STATUS(), // 2-bit Clock Status lines.
		.CLKIN(clockin), // 1-bit The source clock (CLKIN) input pin provides the source clock to the DCM.
		// In the case of Free-running oscillator mode, running clock needs to be
		// connected until DCM is locked and DCM is frozen, then clock can be removed. In
		// the other modes, a free running clock needs to be provided and remain.
		.FREEZEDCM(1'b0), // 1-bit Prevents tap adjustment drift in the event of a lost CLKIN input
		.PROGCLK(1'b0), // 1-bit Clock input for M and/or D reconfiguration.
		.PROGDATA(1'b0), // 1-bit Serial data input to supply information for the reprogramming of M and/or
		// D values of the DCM. This input must be applied synchronous to the PROGCLK
		// input.
		.PROGEN(1'b0), // 1-bit Active high enable input for the reprogramming of M/D values. This input
		// must be applied synchronous to the PROGCLK input.
		.RST(reset) // 1-bit Reset pin
	);
endmodule

//	simpledcm_SP #(.MULTIPLY(), .DIVIDE(), .ALT_CLOCKOUT_DIVIDE(), .PERIOD()) mydcm (.clockin(), .reset(), .clockout(), .clockout180(), .alt_clockout(), .locked());
// MULTIPLY: 2-32
// DIVIDE: 1-32
module simpledcm_SP #(
	parameter ALT_CLOCKOUT_DIVIDE=2.0,
	parameter MULTIPLY=4,
	parameter DIVIDE=1,
	parameter PERIOD=10.0,
	parameter CLKIN_DIVIDE_BY_2 = "FALSE"
) (
	input clockin,
	input reset,
	output clockout,
	output clockout180,
	output alt_clockout,
	output locked
);
	wire fb;
//	wire clockfb_in;
//	wire clockfb_out;
//	BUFG mybufg (.I(clockfb_out), .O(clockfb_in));
	DCM_SP #(
		.CLKDV_DIVIDE(ALT_CLOCKOUT_DIVIDE), // Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
		// 7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
		.CLKFX_DIVIDE(DIVIDE), // Can be any integer from 1 to 32
		.CLKFX_MULTIPLY(MULTIPLY), // Can be any integer from 2 to 32
		.CLKIN_DIVIDE_BY_2(CLKIN_DIVIDE_BY_2), // TRUE/FALSE to enable CLKIN divide by two feature
		.CLKIN_PERIOD(PERIOD), // Specify period of input clock
		.CLKOUT_PHASE_SHIFT("NONE"), // Specify phase shift of NONE, FIXED or VARIABLE
		.CLK_FEEDBACK("1X"), // Specify clock feedback of NONE, 1X or 2X
		.DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
		// an integer from 0 to 15
		.DLL_FREQUENCY_MODE("LOW"), // HIGH or LOW frequency mode for DLL
		.DUTY_CYCLE_CORRECTION("TRUE"), // Duty cycle correction, TRUE or FALSE
		.PHASE_SHIFT(0), // Amount of fixed phase shift from -255 to 255
		.STARTUP_WAIT("FALSE") // Delay configuration DONE until DCM LOCK, TRUE/FALSE
	) DCM_SP_inst (
		.CLK0(fb), // 0 degree DCM CLK output
		.CLK180(), // 180 degree DCM CLK output
		.CLK270(), // 270 degree DCM CLK output
		.CLK2X(), // 2X DCM CLK output
		.CLK2X180(), // 2X, 180 degree DCM CLK out
		.CLK90(), // 90 degree DCM CLK output
		.CLKDV(alt_clockout), // Divided DCM CLK out (CLKDV_DIVIDE)
		.CLKFX(clockout), // DCM CLK synthesis out (M/D)
		.CLKFX180(clockout180), // 180 degree CLK synthesis out
		.LOCKED(locked), // DCM LOCK status output
		.PSDONE(), // Dynamic phase adjust done output
		.STATUS(), // 8-bit DCM status bits output
		.CLKFB(fb), // DCM clock feedback
		.CLKIN(clockin), // Clock input (from IBUFG, BUFG or DCM)
		.PSCLK(1'b0), // Dynamic phase adjust clock input
		.PSEN(1'b0), // Dynamic phase adjust enable input
		.PSINCDEC(1'b0), // Dynamic phase adjust increment/decrement
		.DSSEN(1'b0), // missing constraint in ug615
		.RST(reset) // DCM asynchronous reset input
	);
endmodule

//plldcm #(.OVERALL_DIVIDE(1), .pllmultiply(10), .plldivide(1), .pllperiod(20.0), .dcmmultiply(2), .dcmdivide(8), .dcmperiod(2.0)) kronos (.clockin(clock50), .reset(reset), .clockout(clock), .clockout180(), .locked()); // 50->125
module plldcm #(parameter OVERALL_DIVIDE=1, PLLMULTIPLY=1, PLLDIVIDE=1, PLLPERIOD=10.0, DCMMULTIPLY=1, DCMDIVIDE=1, DCMPERIOD="10.0") (
	input clockin,
	input reset,
	output clockout,
	output clockout180,
	output locked
);
	wire clockintermediate;
	wire dcmlocked;
	wire plllocked;
	assign locked = dcmlocked & plllocked;
	simplepll_ADV_2DCM #(.OVERALL_DIVIDE(OVERALL_DIVIDE), .MULTIPLY(PLLMULTIPLY), .DIVIDE(PLLDIVIDE), .PERIOD(PLLPERIOD), .COMPENSATION("PLL2DCM")) mypll (
	//simplepll_ADV #(.OVERALL_DIVIDE(OVERALL_DIVIDE), .MULTIPLY(PLLMULTIPLY), .DIVIDE(PLLDIVIDE), .PERIOD(PLLPERIOD), .COMPENSATION("DCM2PLL")) mypll (
		.clockin(clockin),
		.reset(reset),
		.clockout(clockintermediate),
		.locked(plllocked));
	simpledcm_SP #(.MULTIPLY(DCMMULTIPLY), .DIVIDE(DCMDIVIDE), .PERIOD(DCMPERIOD)) mydcm (
		.clockin(clockintermediate),
		.reset(reset),
		.clockout(clockout),
		.clockout180(clockout180),
		.locked(dcmlocked));
endmodule

module clock_select #(
	parameter N = 4,
	parameter log2_N = $clog2(N)
) (
	input [N-1:0] clock,
	input [log2_N-1:0] select,
	output clock_out
);
	wire clock_0s;
	wire clock_1s;
	BUFGMUX #(.CLK_SEL_TYPE("SYNC")) clock_sel_0s (.I0(clock[0]), .I1(clock[1]), .S(select[0]), .O(clock_0s));
	BUFGMUX #(.CLK_SEL_TYPE("SYNC")) clock_sel_1s (.I0(clock[2]), .I1(clock[3]), .S(select[0]), .O(clock_1s));
	BUFGMUX #(.CLK_SEL_TYPE("SYNC")) clock_sel_sx (.I0(clock_0s), .I1(clock_1s), .S(select[1]), .O(clock_out));
endmodule

`endif

