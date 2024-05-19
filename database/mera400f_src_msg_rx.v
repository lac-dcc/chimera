// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module msg_rx(
	input clk_sys,

	input [0:7] data_in,
	input data_in_ready,

	output reg ready,
	output reg r,
	output reg w,
	output reg in,
	output reg pa,
	output reg ok,
	output reg pe,
	output reg en,
	output reg cpd,
	output reg cpr,
	output reg cpf,
	output reg cps,
	output reg [0:7] a1,
	output reg [0:15] a2,
	output reg [0:15] a3
);

	reg [0:7] tcmd;
	reg [0:7] ta1;
	reg [0:15] ta2;
	reg [0:15] ta3;
	wire [1:3] arg = tcmd[5:7];

	// --- Decoder -----------------------------------------------------------

	wire xr, xw, xin, xpa, xok, xpe, xen, xcpd, xcpr, xcpf, xcps;

	msg_cmd_dec MSG_CMD_DEC(
		.cmd(tcmd),
		.r(xr),
		.w(xw),
		.in(xin),
		.pa(xpa),
		.ok(xok),
		.pe(xpe),
		.en(xen),
		.cpd(xcpd),
		.cpr(xcpr),
		.cpf(xcpf),
		.cps(xcps)
	);

	// --- Receiver ----------------------------------------------------------

	localparam IDLE = 4'd0;
	localparam ARG  = 4'd1;
	localparam A1   = 4'd2;
	localparam A2H  = 4'd3;
	localparam A2L  = 4'd4;
	localparam A3H  = 4'd5;
	localparam A3L  = 4'd6;
	localparam DONE	= 4'd7;

	reg [0:2] state = IDLE;

	always @ (posedge clk_sys) begin

		ready <= 0;

		case (state)

			IDLE: begin
				if (data_in_ready) begin
					tcmd <= data_in;
					state <= ARG;
				end
			end

			ARG: begin
				if (arg[1]) state <= A1;
				else if (arg[2]) state <= A2H;
				else if (arg[3]) state <= A3H;
				else state <= DONE;
			end

			A1: begin
				if (data_in_ready) begin
					ta1 <= data_in;
					if (arg[2]) state <= A2H;
					else if (arg[3]) state <= A3H;
					else state <= DONE;
				end
			end

			A2H: begin
				if (data_in_ready) begin
					ta2[0:7] <= data_in;
					state <= A2L;
				end
			end

			A2L: begin
				if (data_in_ready) begin
					ta2[8:15] <= data_in;
					if (arg[3]) state <= A3H;
					else state <= DONE;
				end
			end

			A3H: begin
				if (data_in_ready) begin
					ta3[0:7] <= data_in;
					state <= A3L;
				end
			end

			A3L: begin
				if (data_in_ready) begin
					ta3[8:15] <= data_in;
					state <= DONE;
				end
			end

			DONE: begin
				{ r, w, in, pa, ok, pe, en } <= { xr, xw, xin, xpa, xok, xpe, xen };
				{ cpd, cpr, cpf, cps } <= { xcpd, xcpr, xcpf, xcps };
				a1 <= ta1;
				a2 <= ta2;
				a3 <= ta3;
				ready <= 1;
				state <= IDLE;
			end

		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
