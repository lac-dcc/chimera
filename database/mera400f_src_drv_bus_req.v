// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module drv_bus_req(
	input clk_sys,
	input ready,
	input r,
	input w,
	input in,
	input [0:7] a1,
	input [0:15] a2,
	input [0:15] a3,
	input zw,
	output reg zg,
	input ans_any,
	output dw,
	output dr,
	output din,
	output dpn,
	output [0:3] dnb,
	output [0:15] dad,
	output [0:15] ddt
);

	// registered data input/output
	reg ir, iw, iin;
	reg [0:7] ia1;
	reg [0:15] ia2;
	reg [0:15] ia3;

	// request trigger
	wire req = ready & (r | w | in);

	localparam IDLE = 4'd0;
	localparam REQ  = 4'd1;
	reg [0:0] state = IDLE;

	always @ (posedge clk_sys) begin

		case (state)

			IDLE: begin
				if (req) begin
					ir <= r;
					iw <= w;
					iin <= in;
					ia1 <= a1;
					ia2 <= a2;
					ia3 <= a3;
					zg <= 1;
					state <= REQ;
				end
			end

			REQ: begin
				if (zw & ans_any) begin
					zg <= 0;
					state <= IDLE;
				end
			end

		endcase

	end

	wire zwzg = zw & zg;

	assign dw  = zwzg ? iw       :  1'd0;
	assign dr  = zwzg ? ir       :  1'd0;
	assign din = zwzg ? iin      :  1'd0;
	assign dpn = zwzg ? ia1[3]   :  1'd0;
	assign dnb = zwzg ? ia1[4:7] :  4'd0;
	assign dad = zwzg ? ia2      : 16'd0;
	assign ddt = zwzg ? ia3      : 16'd0;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
