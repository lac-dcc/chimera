// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

`define MSG_REQ		1'b1
`define MSG_RESP	1'b0

`define CMD_PA	4'b0000
`define CMD_CL	4'b0001
`define CMD_W		4'b0010
`define CMD_R		4'b0011
`define CMD_S		4'b0100
`define CMD_F		4'b0101
`define CMD_IN	4'b0110
`define CMD_CPD	4'b1000
`define CMD_CPR	4'b1001
`define CMD_CPF	4'b1010
`define CMD_CPS	4'b1011

`define CMD_EN	4'b0001
`define CMD_OK	4'b0010
`define CMD_PE	4'b0011
`define CMD_NO	4'b0100

module iobus(
	input clk_sys,
	input clk_uart,
	input rxd,
	output txd,

	output zg,
	input zw,

	input rcl,

	output dpa,

	input rs,
	input rf,
	input rok,
	input rpe,
	input rqb,
	input rpn,
	input [0:3] rnb,
	input [0:15] rad,
	input [0:15] rdt,

	output dw,
	output dr,
	output din,
	output dok,
	output den,
	output dpe,
	output dpn,
	output [0:3] dnb,
	output [0:15] dad,
	output [0:15] ddt,

	input [0:15] w,
	input [0:3] rotary_pos,
	input [0:9] indicators,

	output [0:3] rotary_out,
	output rotary_trig,
	output [0:15] keys,
	output keys_trig,
	output [0:3] fn,
	output fn_v,
	output fn_trig
);

	parameter CLK_UART_HZ;
	parameter UART_BAUD;

	// --- UART --------------------------------------------------------------

	wire uart_tx_ready;
	wire uart_rx_ready;
	wire uart_tx_send;
	wire [0:7] uart_rx_byte;
	wire [0:7] uart_tx_byte;

	uart #(
		.baud(UART_BAUD),
		.clk_speed(CLK_UART_HZ)
	) UART_IOB(
		.clk(clk_uart),
		.rx_byte(uart_rx_byte),
		.rx_ready(uart_rx_ready),
		.rxd(rxd),
		.send(uart_tx_send),
		.tx_byte(uart_tx_byte),
		.tx_ready(uart_tx_ready),
		.txd(txd)
	);

	// -----------------------------------------------------------------------
	// --- TO FPGA -----------------------------------------------------------
	// -----------------------------------------------------------------------

	// --- Message receiver --------------------------------------------------

	wire rx_ready;
	wire rx_r, rx_w, rx_in, rx_pa, rx_ok, rx_pe, rx_en;
	wire rx_cpd, rx_cpr, rx_cpf, rx_cps;
	wire [0:7] rx_a1;
	wire [0:15] rx_a2;
	wire [0:15] rx_a3;

	msg_rx MSG_RX(
		.clk_sys(clk_sys),
		.data_in(uart_rx_byte),
		.data_in_ready(uart_rx_ready),
		.ready(rx_ready),
		.r(rx_r),
		.w(rx_w),
		.in(rx_in),
		.pa(rx_pa),
		.ok(rx_ok),
		.pe(rx_pe),
		.en(rx_en),
		.cpd(rx_cpd),
		.cpr(rx_cpr),
		.cpf(rx_cpf),
		.cps(rx_cps),
		.a1(rx_a1),
		.a2(rx_a2),
		.a3(rx_a3)
	);

	// --- PA interrupt driver -----------------------------------------------

	assign dpa = rx_ready & rx_pa;

	// --- CP input driver ---------------------------------------------------

	drv_cp_in DRV_CP_IN(
		.ready(rx_ready),
		.cpd(rx_cpd),
		.cpr(rx_cpr),
		.cpf(rx_cpf),
		.a1(rx_a1),
		.a3(rx_a3),
		.rotary_out(rotary_out),
		.rotary_trig(rotary_trig),
		.keys(keys),
		.keys_trig(keys_trig),
		.fn(fn),
		.fn_v(fn_v),
		.fn_trig(fn_trig)
	);

	// --- CP output driver --------------------------------------------------

	wire send_cp = rx_ready & rx_cps;

	// --- Bus timeout -------------------------------------------------------

	reg [0:4] timeout_cnt = 5'b0;

	always @ (posedge clk_sys) begin
		if (rok) begin
			timeout_cnt <= 5'd0;
		end else if (dw | dr | din) begin
			if (timeout_cnt != 5'b11111) begin
				timeout_cnt <= timeout_cnt + 1'd1;
			end
		end else begin
			timeout_cnt <= 5'd0;
		end
	end

	wire timeout = (timeout_cnt == 5'b11111);

	// --- Bus request driver ------------------------------------------------

	wire [0:15] ddt_req;

	drv_bus_req DRV_BUS_REQ(
		.clk_sys(clk_sys),
		.ready(rx_ready),
		.r(rx_r),
		.w(rx_w),
		.in(rx_in),
		.a1(rx_a1),
		.a2(rx_a2),
		.a3(rx_a3),
		.zw(zw),
		.zg(zg),
		.ans_any(rok | timeout),
		.dw(dw),
		.dr(dr),
		.din(din),
		.dpn(dpn),
		.dnb(dnb),
		.dad(dad),
		.ddt(ddt_req)
	);

	// --- Bus response driver -----------------------------------------------

	wire io_req = (rs | rf) & ~rad[15];
	wire [0:15] ddt_resp;

	drv_bus_resp DRV_BUS_RESP(
		.clk_sys(clk_sys),
		.ready(rx_ready),
		.ok(rx_ok),
		.en(rx_en),
		.pe(rx_pe),
		.a3(rx_a3),
		.req(io_req),
		.dok(dok),
		.den(den),
		.dpe(dpe),
		.ddt(ddt_resp)
	);

	// -----------------------------------------------------------------------
	// --- FROM FPGA ---------------------------------------------------------
	// -----------------------------------------------------------------------

	// --- Bus command encoder -----------------------------------------------

	wire [0:7] enc_cmd;

	msg_cmd_enc MSG_CMD_ENC(
		.cmd(enc_cmd),
		.f(rf),
		.s(rs),
		.r(dr),
		.w(dw),
		.in(din),
		.ok(rok),
		.timeout(timeout),
		.pe(rpe)
	);

	// --- Bus receiver ------------------------------------------------------

	wire send_req = io_req;
	wire send_resp = (rok | timeout) & (dw | dr | din);

	wire tx_ena_bus;
	wire tx_trig_bus;
	wire [0:7] tx_bus_cmd;
	wire [0:7] tx_bus_a1;
	wire [0:15] tx_bus_a2;
	wire [0:15] tx_bus_a3;

	recv_bus RECV_BUS(
		.clk_sys(clk_sys),
		.send_req(send_req),
		.send_resp(send_resp),
		.tx_ena_bus(tx_ena_bus),
		.tx_trig_bus(tx_trig_bus),
		.rqb(rqb),
		.rpn(rpn),
		.rnb(rnb),
		.rad(rad),
		.rdt(rdt),
		.enc_cmd(enc_cmd),
		.tx_bus_cmd(tx_bus_cmd),
		.tx_bus_a1(tx_bus_a1),
		.tx_bus_a2(tx_bus_a2),
		.tx_bus_a3(tx_bus_a3)
	);

	// --- CP status receiver ------------------------------------------------

	wire tx_ena_cp;
	wire tx_trig_cp;
	wire [0:7] tx_cp_cmd;
	wire [0:15] tx_cp_a2;
	wire [0:15] tx_cp_a3;

	recv_cp RECV_CP(
		.clk_sys(clk_sys),
		.send_cp(send_cp),
		.tx_ena_cp(tx_ena_cp),
		.w(w),
		.indicators(indicators),
		.rotary_pos(rotary_pos),
		.tx_trig_cp(tx_trig_cp),
		.tx_cp_cmd(tx_cp_cmd),
		.tx_cp_a2(tx_cp_a2),
		.tx_cp_a3(tx_cp_a3)
	);

	// --- Reset receiver ----------------------------------------------------

	wire tx_ena_cl;
	wire tx_trig_cl;
	wire [0:7] tx_reset_cmd;

	recv_cl RECV_CL(
		.clk_sys(clk_sys),
		.rcl(rcl),
		.tx_ena_cl(tx_ena_cl),
		.tx_trig_cl(tx_trig_cl),
		.tx_reset_cmd(tx_reset_cmd)
	);

	// --- Mesage sender -----------------------------------------------------

	wire [0:7] tx_cmd = tx_bus_cmd | tx_cp_cmd | tx_reset_cmd;
	wire [0:7]  tx_a1 = tx_bus_a1;
	wire [0:15] tx_a2 = tx_bus_a2 | tx_cp_a2;
	wire [0:15] tx_a3 = tx_bus_a3 | tx_cp_a3;

	msg_tx MSG_TX(
		.clk_sys(clk_sys),
		.uart_data(uart_tx_byte),
		.uart_send(uart_tx_send),
		.uart_ready(uart_tx_ready),
		.trig({tx_trig_cl, tx_trig_cp, tx_trig_bus}),
		.ena({tx_ena_cl, tx_ena_cp, tx_ena_bus}),
		.cmd(tx_cmd),
		.a1(tx_a1),
		.a2(tx_a2),
		.a3(tx_a3)
	);

	// -----------------------------------------------------------------------

	assign ddt = ddt_req | ddt_resp;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
