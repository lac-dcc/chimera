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

`timescale 1 ns / 1 ps

module spiflash (
	input flash_clk,
	input flash_csb,
	inout flash_io0,
	inout flash_io1,
	inout flash_io2,
	inout flash_io3
);
	reg errflag_unimplemented = 0;

	reg io0_reg = 1'bz;
	reg io1_reg = 1'bz;
	reg io2_reg = 1'bz;
	reg io3_reg = 1'bz;

	assign flash_io0 = io0_reg;
	assign flash_io1 = io1_reg;
	assign flash_io2 = io2_reg;
	assign flash_io3 = io3_reg;

	reg dtr_active = 0;
	reg qpi_active = 0;
	reg sr2_qe_bit = 0;
	reg [3:0] out_enable = 0;

	integer state = -1;
	integer crm_state = 0;
	integer cnt;

	reg [7:0] ibuf, obuf;
	reg [7:0] xfer;

	reg [7:0] data [0:(1<<24)-1];
	reg [23:0] addr;

	integer reset_detect_cnt = 0;

	always @(negedge flash_csb) begin
		reset_detect_cnt <= 8;
		if (crm_state == 0)
			dtr_active <= 0;
		state <= crm_state;
		crm_state <= 0;
		cnt <= 0;
		xfer = 8'hzz;
		out_enable = 0;
	end

	always @(posedge flash_csb) begin
		io0_reg <= 1'bz;
		io1_reg <= 1'bz;
		io2_reg <= 1'bz;
		io3_reg <= 1'bz;
		xfer <= 8'hxx;
	end

	always @(posedge flash_clk) begin
		if (flash_io0 && reset_detect_cnt >= 0) begin
			if (reset_detect_cnt == 0) begin
				state <= -1;
				dtr_active <= 0;
				qpi_active <= 0;
			end else
				reset_detect_cnt <= reset_detect_cnt - 1;
		end else
			reset_detect_cnt <= -1;
	end

	always @(flash_clk) begin
		if (!flash_csb && (flash_clk || dtr_active)) begin
			if (qpi_active) begin
				ibuf = {ibuf, flash_io3, flash_io2, flash_io1, flash_io0};
				cnt = cnt + 4;
			end else begin
				ibuf = {ibuf, flash_io0};
				cnt = cnt + 1;
			end
			if (cnt != 8 && !out_enable) begin
				xfer = 8'hzz;
			end
			if (cnt == 8) begin
				if (!out_enable)
					xfer = ibuf;
				if (state == 0) begin
					if (ibuf == 8'h 50) begin
						// Volatile SR Write Enable
						state <= -1;
					end else
					if (ibuf == 8'h 31) begin
						// Write SR2
						state <= 100;
					end else
					if (ibuf == 8'h 38) begin
						// Enter QPI Mode
						state <= -1;
						qpi_active <= 1;
					end else
					if (ibuf == 8'h EB) begin
						// Fast Read Quad I/O
						state <= 300;
					end else
					if (ibuf == 8'h FF) begin
						// Reset
						state <= -1;
					end else begin
						errflag_unimplemented <= 1;
					end
				end

				// Write SR2
				if (state == 100) begin
					sr2_qe_bit <= ibuf[1];
					state <= -1;
				end

				// DTR Fast Read Quad I/O
				if (state == 300) begin
					addr[23:16] = ibuf;
					state <= 301;
				end
				if (state == 301) begin
					addr[15:8] = ibuf;
					state <= 302;
				end
				if (state == 302) begin
					addr[7:0] = ibuf;
					state <= 303;
				end
				if (state == 303) begin
					if (ibuf == 8'h A5) begin
						crm_state <= 300;
					end else if (ibuf != 8'h FF) begin
						errflag_unimplemented <= 1;
					end
					obuf = data[addr];
					out_enable = 4'b 1111;
					addr <= addr + 1;
					state <= 304;
				end
				if (state == 304) begin
					obuf = data[addr];
					out_enable = 4'b 1111;
					addr <= addr + 1;
				end

				cnt = 0;
			end
		end
		if (!flash_csb && (!flash_clk || dtr_active)) begin
			if (out_enable && cnt == 0)
				xfer = obuf;

			if (out_enable[3]) begin
				io3_reg <= obuf[7];
				obuf = obuf << 1;
			end

			if (out_enable[2]) begin
				io2_reg <= obuf[7];
				obuf = obuf << 1;
			end

			if (out_enable[1]) begin
				io1_reg <= obuf[7];
				obuf = obuf << 1;
			end

			if (out_enable[0]) begin
				io0_reg <= obuf[7];
				obuf = obuf << 1;
			end
		end
	end
endmodule
