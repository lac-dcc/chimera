// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module mera400f(
	input clk_ext,
	// iobus
	input rxd,
	output txd,
	// ram
	output ram_ce, ram_oe, ram_we,
	output [17:0] ram_a,
	inout [15:0] ram_d,
	// display
	output [0:15] w,
	output [10:0] rotary_bus,
	output [0:9] indicators
);

	parameter CLK_EXT_HZ;

// -----------------------------------------------------------------------
// --- Clocks ------------------------------------------------------------
// -----------------------------------------------------------------------

	localparam CLK_SYS_HZ = CLK_EXT_HZ;
	localparam CLK_UART_HZ = CLK_EXT_HZ;
	wire clk_sys = clk_ext;
	wire clk_uart = clk_ext;
	wire clk_ram = clk_ext;

// -----------------------------------------------------------------------
// --- INTERFACE ---------------------------------------------------------
// -----------------------------------------------------------------------

	// signal positions on the system bus

	`define pa	0
	`define cl	1
	`define w		2
	`define r		3
	`define s		4
	`define f		5
	`define in	6
	`define ok	7
	`define en	8
	`define pe	9
	`define qb	10
	`define pn	11
	`define nb	12:15
	`define ad	16:31
	`define dt 	32:47
	`define BUS_MAX 47

	// bus drivers for CPUs and memory (receivers on CPU and memory side)

	wire [0:`BUS_MAX] cpu0r;
	wire [0:`BUS_MAX] cpu1r;
	wire [0:`BUS_MAX] memr;
	wire [0:`BUS_MAX] iobr;

	// interface reservation signals

	wire [1:4] zg;
	wire [1:4] zw;
	wire [1:4] zz;

	isk ISK(
		.clk_sys(clk_sys),
		.cpu0d(cpu0d),
		.cpu0r(cpu0r),
		.cpu1d(48'd0),
		.cpu1r(cpu1r),
		.iobd(iobd),
		.iobr(iobr),
		.memd(memd),
		.memr(memr),
		.zg(zg),
		.zw(zw),
		.zz(zz)
	);

// -----------------------------------------------------------------------
// --- CPU ---------------------------------------------------------------
// -----------------------------------------------------------------------

	// to system bus

	wire [0:`BUS_MAX] cpu0d;
	wire dmcl;
	assign cpu0d[`cl] = dcl | dmcl;

	// to control panel

	wire p0;
	wire hlt_n, p, run, _wait, irq, q, mc_0, awaria;

	cpu #(
		.CPU_NUMBER(1'b0),
		.AWP_PRESENT(1'b1),
		.INOU_USER_ILLEGAL(1'b1),
		.STOP_ON_NOMEM(1'b1),
		.LOW_MEM_WRITE_DENY(1'b0),
		.ALARM_DLY_TICKS(23'd5_000_000),
		.ALARM_TICKS(8'd3)
	) CPU0(
		.clk_sys(clk_sys),
		// power supply
		.off(off),
		.pon(pon),
		.pout(pout),
		.clm(clm),
		.clo(clo),
		// control panel
		.kl(kl),
		.panel_store(panel_store),
		.panel_fetch(panel_fetch),
		.panel_load(panel_load),
		.panel_bin(panel_bin),
		.oprq(oprq),
		.stop(stop),
		.start(start),
		.work(work),
		.mode(mode),
		.step(step),
		.stop_n(stop_n),
		.cycle(cycle),
		.wre(wre),
		.rsa(rsa),
		.rsb(rsb),
		.rsc(rsc),
		.wic(wic),
		.wac(wac),
		.war(war),
		.wir(wir),
		.wrs(wrs),
		.wrz(wrz),
		.wkb(wkb),
		.zegar(zegar),
		.p0(p0),
		.w(w),
		.hlt_n(hlt_n),
		.p(p),
		.run(run),
		._wait(_wait),
		.irq(irq),
		.q(q),
		.mc_0(mc_0),
		.awaria(awaria),
		// system bus - drivers
		.dmcl(dmcl),
		.dw(cpu0d[`w]),
		.dr(cpu0d[`r]),
		.ds(cpu0d[`s]),
		.df(cpu0d[`f]),
		.din(cpu0d[`in]),
		.dok(cpu0d[`ok]),
		.dqb(cpu0d[`qb]),
		.dpn(cpu0d[`pn]),
		.dnb(cpu0d[`nb]),
		.dad(cpu0d[`ad]),
		.ddt(cpu0d[`dt]),
		// system bus - receivers
		.rpa(cpu0r[`pa]),
		.rin(cpu0r[`in]),
		.rok(cpu0r[`ok]),
		.ren(cpu0r[`en]),
		.rpe(cpu0r[`pe]),
		.rpn(cpu0r[`pn]),
		.rdt(cpu0r[`dt]),
		// system bus reservation
		.zg(zg[1]),
		.zw(zw[1]),
		.zz(zz[1])
	);

// -----------------------------------------------------------------------
// --- P-K ---------------------------------------------------------------
// -----------------------------------------------------------------------

	wire [0:15] kl;
	wire zegar;
	wire wre, rsa, rsb, rsc;
	wire wic, wac, war, wir, wrs, wrz, wkb;
	wire panel_store, panel_fetch, panel_load, panel_bin;
	wire oprq, stop, start, work, mode, step, stop_n, cycle;
	wire dcl;

	// outputs to IOBUS
	wire [0:3] rotary_pos;
	assign rotary_bus = {wre, rsc, rsb, rsa, wic, wac, war, wir, wrs, wrz, wkb};

	pk #(
		.TIMER_CYCLE_MS(8'd10),
		.CLK_SYS_HZ(CLK_SYS_HZ)
	) PK(
		.clk_sys(clk_sys),
		.hlt_n(hlt_n),
		.off(off),
		.work(work),
		.stop(stop),
		.start(start),
		.mode(mode),
		.stop_n(stop_n),
		.p0(p0),
		.kl(kl),
		.dcl(dcl),
		.step(step),
		.fetch(panel_fetch),
		.store(panel_store),
		.cycle(cycle),
		.load(panel_load),
		.bin(panel_bin),
		.oprq(oprq),
		.zegar(zegar),
		.p(p),
		.mc_0(mc_0),
		.alarm(awaria),
		._wait(_wait),
		.irq(irq),
		.q(q),
		.run(run),
		.wre(wre),
		.rsa(rsa),
		.rsb(rsb),
		.rsc(rsc),
		.wic(wic),
		.wac(wac),
		.war(war),
		.wir(wir),
		.wrs(wrs),
		.wrz(wrz),
		.wkb(wkb),
		.indicators(indicators),
		.rotary_pos(rotary_pos),
		.rotary_in(rotary_out),
		.rotary_trig(rotary_trig),
		.keys(keys),
		.keys_trig(keys_trig),
		.fn(fn),
		.fn_v(fn_v),
		.fn_trig(fn_trig)
	);

// -----------------------------------------------------------------------
// --- IO BUS ------------------------------------------------------------
// -----------------------------------------------------------------------

	wire [0:`BUS_MAX] iobd;

	// outputs to CP
	wire [0:3] rotary_out;
	wire rotary_trig;
	wire [0:15] keys;
	wire keys_trig;
	wire [0:3] fn;
	wire fn_v;
	wire fn_trig;

	iobus #(
		.CLK_UART_HZ(CLK_UART_HZ),
		.UART_BAUD(1_000_000)
	) IOBUS(
		.clk_sys(clk_sys),
		.clk_uart(clk_uart),
		.rxd(rxd),
		.txd(txd),
		.zg(zg[4]),
		.zw(zw[4]),
		.dpa(iobd[`pa]),
		.rcl(iobr[`cl]),
		.dw(iobd[`w]),
		.dr(iobd[`r]),
		.rs(iobr[`s]),
		.rf(iobr[`f]),
		.din(iobd[`in]),
		.rok(iobr[`ok]),
		.dok(iobd[`ok]),
		.den(iobd[`en]),
		.dpe(iobd[`pe]),
		.rpe(iobr[`pe]),
		.rqb(iobr[`qb]),
		.rpn(iobr[`pn]),
		.dpn(iobd[`pn]),
		.rnb(iobr[`nb]),
		.dnb(iobd[`nb]),
		.rad(iobr[`ad]),
		.dad(iobd[`ad]),
		.rdt(iobr[`dt]),
		.ddt(iobd[`dt]),
		.w(w),
		.rotary_pos(rotary_pos),
		.indicators(indicators),
		.rotary_out(rotary_out),
		.rotary_trig(rotary_trig),
		.keys(keys),
		.keys_trig(keys_trig),
		.fn(fn),
		.fn_v(fn_v),
		.fn_trig(fn_trig)
	);

// -----------------------------------------------------------------------
// --- MEMORY ------------------------------------------------------------
// -----------------------------------------------------------------------

	wire [0:`BUS_MAX] memd;

	mem_elwro_sram MEM(
		.clk(clk_ram),
		.ram_ce(ram_ce),
		.ram_oe(ram_oe),
		.ram_we(ram_we),
		.ram_a(ram_a),
		.ram_d(ram_d),
		.reset(memr[`cl]),
		.reset_hold(memd[`cl]),
		.nb(memr[`nb]),
		.ad(memr[`ad]),
		.rdt(memr[`dt]),
		.ddt(memd[`dt]),
		.w(memr[`w]),
		.r(memr[`r]),
		.s(memr[`s]),
		.ok(memd[`ok])
	);

// -----------------------------------------------------------------------
// --- POWER SUPPLY ------------------------------------------------------
// -----------------------------------------------------------------------

	wire off, pout, pon, clo, clm;

	puks PUKS(
		.clk_sys(clk_sys),
		.rcl(cpu0r[`cl]),
		.dcl(dcl),
		.off(off),
		.pout(pout),
		.pon(pon),
		.clo(clo),
		.clm(clm)
	);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
