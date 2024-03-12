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

module marlann_compute #(
	parameter integer NB = 2,
	parameter integer CODE_SIZE = 512,
	parameter integer COEFF_SIZE = 512
) (
	input         clock,
	input         reset,
	output        busy,

	input         cmd_valid,
	output        cmd_ready,
	input  [31:0] cmd_insn,

	output        mem_ren,
	output [ 7:0] mem_wen,
	output [15:0] mem_addr,
	output [63:0] mem_wdata,
	input  [63:0] mem_rdata,

	output        tick_simd,
	output        tick_nosimd
);
	integer i;

	reg [31:0] code_mem [0:CODE_SIZE-1];
	reg [64*NB-1:0] coeff_mem [0:COEFF_SIZE-1];

	reg [31:0] acc0, acc1;

	reg [16:0] VBP, LBP, SBP;
	reg [ 8:0] CBP;

	reg        mem_rd0_en;
	reg [15:0] mem_rd0_addr;

	reg        mem_rd1_en;
	reg [15:0] mem_rd1_addr;

	reg [ 7:0] mem_wr_en;
	reg [15:0] mem_wr_addr;
	reg [63:0] mem_wr_wdata;

	assign mem_ren = mem_rd0_en || mem_rd1_en;
	assign mem_wen = mem_wr_en;
	assign mem_addr = ({16{mem_rd0_en}} & mem_rd0_addr) | ({16{mem_rd1_en}} & mem_rd1_addr) | ({16{|mem_wr_en}} & mem_wr_addr);
	assign mem_wdata = mem_wr_wdata;

	wire [16:0] cmd_insn_maddr = cmd_insn[31:15];
	wire [8:0] cmd_insn_caddr = cmd_insn[14:6];
	wire [5:0] cmd_insn_opcode = cmd_insn[5:0];


	/**** staging ****/

	reg                 s1_en;
	wire [        31:0] s1_insn;
	wire                s1_stall;

	reg                 s2_en;
	reg  [        31:0] s2_insn;

	reg                 s3_en;
	reg  [        31:0] s3_insn;

	reg                 s4_en;
	reg  [        31:0] s4_insn;

	reg                 s5_en;
	reg  [        31:0] s5_insn;
	reg  [   NB*64-1:0] s5_coeff;

	reg                 s6_en;
	reg  [        31:0] s6_insn;
	reg  [     8*9-1:0] s6_max;

	reg                 s7_en;
	reg  [        31:0] s7_insn;
	reg  [     4*9-1:0] s7_max;

	reg                 s8_en;
	reg  [        31:0] s8_insn;
	wire [  NB*128-1:0] s8_prod;
	reg  [     2*9-1:0] s8_max;

	reg                 s9_en;
	reg  [        31:0] s9_insn;
	reg  [        19:0] s9_sum0;
	reg  [        19:0] s9_sum1;
	reg  [         8:0] s9_max;
	reg                 s9_maxen;

	reg                 s10_en;
	reg  [        31:0] s10_insn;


	/**** memory and max interlock ****/

	reg [9:0] memlock_res;
	reg [9:0] memlock_mask;
	reg memlock_expect;

	always @* begin
		memlock_mask = 0;

		case (s1_insn[5:0])
			/* LoadCode, LoadCoeff0, LoadCoeff1 */
			4, 5, 6: memlock_mask = 1 << 0;

			/* LdSet, LdSet0, LdSet1, LdAdd, LdAdd0, LdAdd1 */
			28, 29, 30, 32, 33, 34: begin
				memlock_mask = 1 << 4;
			end

			/* MACC, MMAX, MACCZ, MMAXZ, MMAXN */
			40, 41, 42, 43, 45: memlock_mask = 1 << 0;

			/* Store, Store0, Store1, ReLU, ReLU0, ReLU1, Save, Save0, Save1 */
			16, 17, 18, 20, 21, 22, 24, 25, 26: memlock_mask = 1 << 9;
		endcase

		if (!s1_en || reset)
			memlock_mask = 0;
	end

	reg maxlock_a;
	reg maxlock_b;
	reg maxlock_a_q;

	always @* begin
		maxlock_a = 0;
		maxlock_b = 0;

		case (s1_insn[5:0] & 6'b 1111_00)
			28, 32, 40, 44: maxlock_a = 1;
		endcase

		case (s1_insn[5:0])
			41, 43, 45, 47: maxlock_b = 1;
		endcase

		if (!s1_en || reset) begin
			maxlock_a = 0;
			maxlock_b = 0;
		end
	end

	assign s1_stall = |(memlock_res & memlock_mask) || (maxlock_b && maxlock_a_q);

	always @(posedge clock) begin
		{memlock_res, memlock_expect} <= memlock_res | (s1_stall ? 10'b 0 : memlock_mask);
		maxlock_a_q <= maxlock_a && !s1_stall;

		if (reset) begin
			memlock_res <= 0;
			memlock_expect <= 0;
			maxlock_a_q <= 0;
		end
	end

	assign cmd_ready = !s1_stall;

	assign busy = |{s1_en, s2_en, s3_en, s5_en, s6_en, s7_en, s8_en, s9_en};

`ifdef FORMAL_INIT
	reg init_cycle = 1;

	always @(posedge clock) begin
		init_cycle <= 0;
	end

	always @* begin
		if (init_cycle) begin
			restrict property (reset);
		end
	end
`endif

`ifdef FORMAL_MEMLOCK_CHECK
	always @* begin
		if (!reset) begin
			assert ((mem_rd0_en + mem_rd1_en + |mem_wr_en) < 2);
			assert ((mem_rd0_en || mem_rd1_en || mem_wr_en) == memlock_expect);
		end
	end
`endif


	/**** stage 1 ****/

	reg [31:0] s1_insn_direct;
	reg [31:0] s1_insn_codemem;
	reg s1_insn_sel;

	assign s1_insn = s1_insn_sel ? s1_insn_codemem : s1_insn_direct;

	wire [16:0] s1_insn_maddr = s1_insn[31:15];
	wire [8:0] s1_insn_caddr = s1_insn[14:6];
	wire [5:0] s1_insn_opcode = s1_insn[5:0];

	always @(posedge clock) begin
		if (!s1_stall) begin
			s1_en <= cmd_valid && cmd_ready;
			s1_insn_direct <= cmd_insn;
			s1_insn_codemem <= code_mem[cmd_insn[14:6]];
			s1_insn_sel <= cmd_insn[5:0] == 3;
		end

		if (reset) begin
			s1_en <= 0;
		end
	end


	/**** stage 2 ****/

	reg s2_tick_simd;

	always @(posedge clock) begin
		s2_en <= 0;
		s2_insn <= s1_insn;
		s2_tick_simd <= 0;

		mem_rd0_en <= 0;
		mem_rd0_addr <= 'bx;

		if (!reset && s1_en && !s1_stall) begin
			s2_en <= 1;

			case (s1_insn[5:0])
				/* LoadCode, LoadCoeff0, LoadCoeff1 */
				4, 5, 6: begin
					mem_rd0_en <= 1;
					mem_rd0_addr <= s1_insn[31:15] >> 1;
				end

				/* SetVBP, AddVBP */
				8, 9: begin
					VBP <= s1_insn[31:15] + (s1_insn[0] ? VBP : 0);
				end

				/* MACC, MMAX, MACCZ, MMAXZ, MMAXN */
				40, 41, 42, 43, 45: begin
					mem_rd0_en <= 1;
					mem_rd0_addr <= (s1_insn[31:15] + VBP) >> 1;
					s2_tick_simd <= 1;
				end
			endcase
		end
	end

	assign tick_simd = s2_tick_simd;
	assign tick_nosimd = s2_en && !tick_simd;


	/**** stage 3 ****/

	always @(posedge clock) begin
		s3_en <= 0;
		s3_insn <= s2_insn;

		if (!reset && s2_en) begin
			s3_en <= 1;
		end
	end


	/**** stage 4 ****/

	always @(posedge clock) begin
		s4_en <= 0;
		s4_insn <= s3_insn;

		if (!reset && s3_en) begin
			s4_en <= 1;
		end
	end


	/**** stage 5 ****/

	always @(posedge clock) begin
		s5_en <= 0;
		s5_insn <= s4_insn;
		s5_coeff <= coeff_mem[s4_insn[14:6] + CBP];

		if (!reset && s4_en) begin
			s5_en <= 1;

			/* SetCBP, AddCBP */
			if (s4_insn[5:0] == 14 || s4_insn[5:0] == 15) begin
				CBP <= s4_insn[14:6] + (s4_insn[0] ? CBP : 0);
			end
		end
	end


	/**** stage 6 ****/

	always @(posedge clock) begin
		s6_en <= 0;
		s6_insn <= s5_insn;

		s6_max[0*9 +: 9] <= s5_coeff[0*8 +: 8] ? $signed(mem_rdata[0*8 +: 8]) : 9'h100;
		s6_max[1*9 +: 9] <= s5_coeff[1*8 +: 8] ? $signed(mem_rdata[1*8 +: 8]) : 9'h100;
		s6_max[2*9 +: 9] <= s5_coeff[2*8 +: 8] ? $signed(mem_rdata[2*8 +: 8]) : 9'h100;
		s6_max[3*9 +: 9] <= s5_coeff[3*8 +: 8] ? $signed(mem_rdata[3*8 +: 8]) : 9'h100;
		s6_max[4*9 +: 9] <= s5_coeff[4*8 +: 8] ? $signed(mem_rdata[4*8 +: 8]) : 9'h100;
		s6_max[5*9 +: 9] <= s5_coeff[5*8 +: 8] ? $signed(mem_rdata[5*8 +: 8]) : 9'h100;
		s6_max[6*9 +: 9] <= s5_coeff[6*8 +: 8] ? $signed(mem_rdata[6*8 +: 8]) : 9'h100;
		s6_max[7*9 +: 9] <= s5_coeff[7*8 +: 8] ? $signed(mem_rdata[7*8 +: 8]) : 9'h100;

		mem_rd1_en <= 0;
		mem_rd1_addr <= 'bx;

		if (!reset && s5_en) begin
			s6_en <= 1;

			case (s5_insn[5:0])
				/* LoadCode */
				4: begin
					code_mem[s5_insn[14:6]] <= mem_rdata[31:0];
				end

				/* LoadCoeff0 */
				5: begin
					coeff_mem[s5_insn[14:6]][63:0] <= mem_rdata;
				end

				/* LoadCoeff1 */
				6: begin
					coeff_mem[s5_insn[14:6]][127:64] <= mem_rdata;
				end

				/* SetLBP, AddLBP */
				10, 11: begin
					LBP <= s5_insn[31:15] + (s5_insn[0] ? LBP : 0);
				end

				/* LdSet, LdSet0, LdSet1, LdAdd, LdAdd0, LdAdd1 */
				28, 29, 30, 32, 33, 34: begin
					mem_rd1_en <= 1;
					mem_rd1_addr <= (s5_insn[31:15] + LBP) >> 1;
				end
			endcase
		end
	end


	/**** stage 7 ****/

	always @(posedge clock) begin
		s7_en <= 0;
		s7_insn <= s6_insn;

		s7_max[0*9 +: 9] <= $signed(s6_max[0*9 +: 9]) > $signed(s6_max[1*9 +: 9]) ? s6_max[0*9 +: 9] : s6_max[1*9 +: 9];
		s7_max[1*9 +: 9] <= $signed(s6_max[2*9 +: 9]) > $signed(s6_max[3*9 +: 9]) ? s6_max[2*9 +: 9] : s6_max[3*9 +: 9];
		s7_max[2*9 +: 9] <= $signed(s6_max[4*9 +: 9]) > $signed(s6_max[5*9 +: 9]) ? s6_max[4*9 +: 9] : s6_max[5*9 +: 9];
		s7_max[3*9 +: 9] <= $signed(s6_max[6*9 +: 9]) > $signed(s6_max[7*9 +: 9]) ? s6_max[6*9 +: 9] : s6_max[7*9 +: 9];

		if (!reset && s6_en) begin
			s7_en <= 1;
		end
	end


	/**** stage 8 ****/

	wire [NB*64-1:0] mulA = {mem_rdata, mem_rdata};

	marlann_compute_mul2 mul [NB*4-1:0] (
		.clock (clock   ),
		.A     (mulA    ),
		.B     (s5_coeff),
		.X     (s8_prod )
	);

	always @(posedge clock) begin
		s8_en <= 0;
		s8_insn <= s7_insn;

		s8_max[0*9 +: 9] <= $signed(s7_max[0*9 +: 9]) > $signed(s7_max[1*9 +: 9]) ? s7_max[0*9 +: 9] : s7_max[1*9 +: 9];
		s8_max[1*9 +: 9] <= $signed(s7_max[2*9 +: 9]) > $signed(s7_max[3*9 +: 9]) ? s7_max[2*9 +: 9] : s7_max[3*9 +: 9];

		if (!reset && s7_en) begin
			s8_en <= 1;
		end
	end


	/**** stage 9 ****/

	reg [31:0] acc0zn;

	always @* begin
		acc0zn = s8_insn[1] ? 0 : acc0;
		acc0zn = s8_insn[2] ? 32'h 8000_0000 : acc0zn;
	end

	always @(posedge clock) begin
		s9_en <= 0;
		s9_insn <= s8_insn;

		s9_sum0 <= $signed(s8_prod[  0 +: 16]) + $signed(s8_prod[ 16 +: 16]) + $signed(s8_prod[ 32 +: 16]) + $signed(s8_prod[ 48 +: 16]) +
		           $signed(s8_prod[ 64 +: 16]) + $signed(s8_prod[ 80 +: 16]) + $signed(s8_prod[ 96 +: 16]) + $signed(s8_prod[112 +: 16]);

		s9_sum1 <= $signed(s8_prod[128 +: 16]) + $signed(s8_prod[144 +: 16]) + $signed(s8_prod[160 +: 16]) + $signed(s8_prod[176 +: 16]) +
		           $signed(s8_prod[192 +: 16]) + $signed(s8_prod[208 +: 16]) + $signed(s8_prod[224 +: 16]) + $signed(s8_prod[240 +: 16]);

		s9_max <= $signed(s8_max[0*9 +: 9]) > $signed(s8_max[1*9 +: 9]) ? s8_max[0*9 +: 9] : s8_max[1*9 +: 9];
		s9_maxen <= ($signed(s8_max[0*9 +: 9]) > $signed(acc0zn)) || ($signed(s8_max[1*9 +: 9]) > $signed(acc0zn));

		if (!reset && s8_en) begin
			s9_en <= 1;
		end
	end


	/**** stage 10 ****/

	reg [31:0] new_acc0_add;
	reg [31:0] new_acc1_add;

	reg [31:0] new_acc0_max;

	reg [31:0] new_acc0;
	reg [31:0] new_acc1;

	wire [31:0] acc0_shifted = $signed(acc0) >>> s9_insn[14:6];
	wire [31:0] acc1_shifted = $signed(acc1) >>> s9_insn[14:6];

	reg [7:0] acc0_saturated;
	reg [7:0] acc1_saturated;

	reg new_acc0_max_cmp;
	reg new_acc0_max_cmp_q;

	always @* begin
		new_acc0_add = s9_insn[1] ? 0 : acc0;
		new_acc1_add = s9_insn[1] || s9_insn[2] ? 0 : acc1;

		new_acc0_max = s9_insn[2] ? 32'h 8000_0000 : new_acc0_add;

		new_acc0_add = $signed(new_acc0_add) + $signed(s9_sum0);
		new_acc1_add = $signed(new_acc1_add) + $signed(s9_sum1);

		if (s9_max != 9'h 100)
			new_acc0_max = s9_maxen ? s9_max : new_acc0_max;

		new_acc0 = s9_insn[0] ? new_acc0_max : new_acc0_add;
		new_acc1 = new_acc1_add;
	end

	always @(posedge clock) begin
		s10_en <= 0;
		s10_insn <= s9_insn;

		if (!reset && s9_en) begin
			s10_en <= 1;

			/* MACC, MMAX, MMACZ, MMAXZ, MMAXN */
			if (s9_insn[5:3] == 3'b 101) begin
`ifdef FORMAL_MAXLOCK_CHECK
				if (s9_insn[0])
					assert ($stable(acc0));
`endif
				acc0 <= new_acc0;
				acc1 <= new_acc1;
			end

			/* LdSet, LdSet0 */
			if (s9_insn[5:0] == 28 || s9_insn[5:0] == 29) begin
				acc0 <= mem_rdata[31:0];
			end

			/* LdSet, LdSet1 */
			if (s9_insn[5:0] == 28 || s9_insn[5:0] == 30) begin
				acc1 <= mem_rdata[63:32];
			end

			/* LdAdd, LdAdd0 */
			if (s9_insn[5:0] == 32 || s9_insn[5:0] == 33) begin
				acc0 <= acc0 + mem_rdata[31:0];
			end

			/* LdAdd, LdAdd1 */
			if (s9_insn[5:0] == 32 || s9_insn[5:0] == 34) begin
				acc1 <= acc1 + mem_rdata[63:32];
			end
		end

		if (&acc0_shifted[31:7] == |acc0_shifted[31:7])
			acc0_saturated <= acc0_shifted[7:0];
		else
			acc0_saturated <= acc0_shifted[31] ? -128 : 127;

		if (&acc1_shifted[31:7] == |acc1_shifted[31:7])
			acc1_saturated <= acc1_shifted[7:0];
		else
			acc1_saturated <= acc1_shifted[31] ? -128 : 127;
	end


	/**** write back ****/

	reg [ 7:0] pre_mem_wr_en;
	reg [16:0] pre_mem_wr_addr;
	reg [63:0] pre_mem_wr_wdata;

	always @* begin
		if (pre_mem_wr_addr[0]) begin
			mem_wr_en = pre_mem_wr_en << 1;
			mem_wr_addr = pre_mem_wr_addr >> 1;
			mem_wr_wdata = pre_mem_wr_wdata << 8;
		end else begin
			mem_wr_en = pre_mem_wr_en;
			mem_wr_addr = pre_mem_wr_addr >> 1;
			mem_wr_wdata = pre_mem_wr_wdata;
		end
	end

	wire [5:0] s10_insn_opcode = s9_insn[5:0];

	always @(posedge clock) begin
		pre_mem_wr_en <= 0;
		pre_mem_wr_addr <= s10_insn[31:15] + SBP;
		pre_mem_wr_wdata <= {
			{8{!s10_insn[2] || !acc1_saturated[7]}} & acc1_saturated,
			{8{!s10_insn[2] || !acc0_saturated[7]}} & acc0_saturated
		};

		if (s10_en) begin
			/* Store, Store0, Store1, ReLU, ReLU0, ReLU1 */
			if (s10_insn[5:3] == 3'b 010) begin
				pre_mem_wr_en <= {!s10_insn[0], !s10_insn[1]};
			end

			/* Save, Save0, Save1 */
			if (s10_insn[5:2] == 4'b 0110) begin
				pre_mem_wr_en <= {{4{!s10_insn[0]}}, {4{!s10_insn[1]}}};
				pre_mem_wr_wdata <= {acc1, acc0};
			end

			/* SetSBP, AddSBP */
			if (s10_insn[5:0] == 12 || s10_insn[5:0] == 13) begin
				SBP <= s10_insn[31:15] + (s10_insn[0] ? SBP : 0);
			end
		end

		if (reset || !s10_en) begin
			pre_mem_wr_en <= 0;
		end
	end


	/**** trace function ****/

`ifdef TRACE
	reg trace_en;
	reg [31:0] trace_insn;
	wire [16:0] trace_maddr = trace_insn[31:15];
	wire [8:0] trace_caddr = trace_insn[14:6];
	wire [5:0] trace_opcode = trace_insn[5:0];

	reg [9*17-1:0] trace_vbp_queue;
	wire [16:0] trace_vbp = trace_vbp_queue >> (17*8);

	reg [4*17-1:0] trace_lbp_queue;
	wire [16:0] trace_lbp = trace_lbp_queue >> (17*3);

	wire [16:0] trace_sbp = SBP;

	reg [6*9-1:0] trace_cbp_queue;
	wire [8:0] trace_cbp = trace_cbp_queue >> (9*5);

	reg [31:0] trace_acc0, trace_acc1;

	wire [7:0] trace_outb0 = pre_mem_wr_wdata[7:0];
	wire [7:0] trace_outb1 = pre_mem_wr_wdata[15:8];
	wire [31:0] trace_outw0 = pre_mem_wr_wdata[31:0];
	wire [31:0] trace_outw1 = pre_mem_wr_wdata[63:32];
	wire [16:0] trace_outaddr = pre_mem_wr_addr;

	reg [6*64-1:0] trace_mdata_queue;
	wire [63:0] trace_mdata = trace_mdata_queue >> (64*5);

	reg [6*64-1:0] trace_c0data_queue;
	wire [63:0] trace_c0data = trace_c0data_queue >> (64*5);

	reg [6*64-1:0] trace_c1data_queue;
	wire [63:0] trace_c1data = trace_c1data_queue >> (64*5);

	wire [17:0] trace_maddr_plus_vbp = trace_maddr + trace_vbp;
	wire [8:0] trace_caddr_plus_cbp = trace_caddr + trace_cbp;

	always @(posedge clock) begin
		trace_en <= s10_en;
		trace_insn <= s10_insn;

		trace_vbp_queue <= {trace_vbp_queue, VBP};
		trace_lbp_queue <= {trace_lbp_queue, LBP};
		trace_cbp_queue <= {trace_cbp_queue, CBP};

		trace_mdata_queue <= {trace_mdata_queue, mem_rdata};
		trace_c0data_queue <= {trace_c0data_queue, s5_coeff[63:0]};
		trace_c1data_queue <= {trace_c1data_queue, s5_coeff[127:64]};

		trace_acc0 <= acc0;
		trace_acc1 <= acc1;

		if (!reset && trace_en) begin
			case (trace_opcode)
				 8: $display("TRACE %8t: SetVBP 0x%05x // -> 0x%05x", $time, trace_maddr, trace_vbp);
				 9: $display("TRACE %8t: AddVBP 0x%05x // -> 0x%05x", $time, trace_maddr, trace_vbp);
				10: $display("TRACE %8t: SetLBP 0x%05x // -> 0x%05x", $time, trace_maddr, trace_lbp);
				11: $display("TRACE %8t: AddLBP 0x%05x // -> 0x%05x", $time, trace_maddr, trace_lbp);
				12: $display("TRACE %8t: SetSBP 0x%05x // -> 0x%05x", $time, trace_maddr, trace_sbp);
				13: $display("TRACE %8t: AddSBP 0x%05x // -> 0x%05x", $time, trace_maddr, trace_sbp);
				14: $display("TRACE %8t: SetCBP 0x%03x // -> 0x%03x", $time, trace_caddr, trace_cbp);
				15: $display("TRACE %8t: AddCBP 0x%03x // -> 0x%03x", $time, trace_caddr, trace_cbp);

				16: $display("TRACE %8t: Store 0x%05x, 0x%03x // 0x%08x 0x%08x -> 0x%02x 0x%02x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc0, trace_acc1, trace_outb0, trace_outb1, trace_outaddr);
				17: $display("TRACE %8t: Store0 0x%05x, 0x%03x // 0x%08x -> 0x%02x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc0, trace_outb0, trace_outaddr);
				18: $display("TRACE %8t: Store1 0x%05x, 0x%03x // 0x%08x -> 0x%02x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc1, trace_outb1, trace_outaddr+1);

				20: $display("TRACE %8t: ReLU 0x%05x, 0x%03x // 0x%08x 0x%08x -> 0x%02x 0x%02x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc0, trace_acc1, trace_outb0, trace_outb1, trace_outaddr);
				21: $display("TRACE %8t: ReLU0 0x%05x, 0x%03x // 0x%08x -> 0x%02x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc0, trace_outb0, trace_outaddr);
				22: $display("TRACE %8t: ReLU1 0x%05x, 0x%03x // 0x%08x -> 0x%02x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc1, trace_outb1, trace_outaddr+1);

				24: $display("TRACE %8t: Save 0x%05x, 0x%03x // 0x%08x 0x%08x -> 0x%08x 0x%08x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc0, trace_acc1, trace_outw0, trace_outw1, trace_outaddr);
				25: $display("TRACE %8t: Save0 0x%05x, 0x%03x // 0x%08x -> 0x%08x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc0, trace_outw0, trace_outaddr);
				26: $display("TRACE %8t: Save1 0x%05x, 0x%03x // 0x%08x -> 0x%08x @ 0x%05x",
						$time, trace_maddr, trace_caddr, trace_acc1, trace_outw1, trace_outaddr+4);

				28: $display("TRACE %8t: LdSet 0x%05x // -> 0x%08x 0x%08x", $time, trace_maddr, trace_acc0, trace_acc1);
				29: $display("TRACE %8t: LdSet0 0x%05x // -> 0x%08x", $time, trace_maddr, trace_acc0);
				30: $display("TRACE %8t: LdSet1 0x%05x // -> 0x%08x", $time, trace_maddr, trace_acc1);

				32: $display("TRACE %8t: LdAdd 0x%05x // -> 0x%08x 0x%08x", $time, trace_maddr, trace_acc0, trace_acc1);
				33: $display("TRACE %8t: LdAdd0 0x%05x // -> 0x%08x", $time, trace_maddr, trace_acc0);
				34: $display("TRACE %8t: LdAdd1 0x%05x // -> 0x%08x", $time, trace_maddr, trace_acc1);

				40: $display("TRACE %8t: MACC 0x%05x, 0x%03x // 0x%016x @ 0x%05x, 0x%016x 0x%016x @ 0x%03x -> 0x%08x 0x%08x",
						$time, trace_maddr, trace_caddr, trace_mdata, trace_maddr_plus_vbp,
						trace_c0data, trace_c1data, trace_caddr_plus_cbp, trace_acc0, trace_acc1);
				41: $display("TRACE %8t: MMAX 0x%05x, 0x%03x // 0x%016x @ 0x%05x, 0x%016x 0x%016x @ 0x%03x -> 0x%08x 0x%08x",
						$time, trace_maddr, trace_caddr, trace_mdata, trace_maddr_plus_vbp,
						trace_c0data, trace_c1data, trace_caddr_plus_cbp, trace_acc0, trace_acc1);
				42: $display("TRACE %8t: MACCZ 0x%05x, 0x%03x // 0x%016x @ 0x%05x, 0x%016x 0x%016x @ 0x%03x -> 0x%08x 0x%08x",
						$time, trace_maddr, trace_caddr, trace_mdata, trace_maddr_plus_vbp,
						trace_c0data, trace_c1data, trace_caddr_plus_cbp, trace_acc0, trace_acc1);
				43: $display("TRACE %8t: MMAXZ 0x%05x, 0x%03x // 0x%016x @ 0x%05x, 0x%016x 0x%016x @ 0x%03x -> 0x%08x 0x%08x",
						$time, trace_maddr, trace_caddr, trace_mdata, trace_maddr_plus_vbp,
						trace_c0data, trace_c1data, trace_caddr_plus_cbp, trace_acc0, trace_acc1);
				45: $display("TRACE %8t: MMAXN 0x%05x, 0x%03x // 0x%016x @ 0x%05x, 0x%016x 0x%016x @ 0x%03x -> 0x%08x 0x%08x",
						$time, trace_maddr, trace_caddr, trace_mdata, trace_maddr_plus_vbp,
						trace_c0data, trace_c1data, trace_caddr_plus_cbp, trace_acc0, trace_acc1);
			endcase
			$fflush;
		end
	end
`endif
endmodule

module marlann_compute_mul2 (
	input         clock,
	input  [15:0] A, B,
	output [31:0] X
);
`ifndef SYNTHESIS
	reg [15:0] r1A, r2A, r3A;
	reg [15:0] r1B, r2B, r3B;

	always @(posedge clock) begin
		r1A <= $signed(A[7:0]) * $signed(B[7:0]);
		r1B <= $signed(A[15:8]) * $signed(B[15:8]);
		r2A <= r1A;
		r2B <= r1B;
		r3A <= r2A;
		r3B <= r2B;
	end

	assign X = {r3B, r3A};
`else
	wire [31:0] O;
	reg [31:0] Q;

	always @(posedge clock)
		Q <= O;

	assign X = Q;

`ifdef RADIANT
	MAC16 #(
		.NEG_TRIGGER              ("0b0"),

		.A_REG                    ("0b1"),
		.B_REG                    ("0b1"),
		.C_REG                    ("0b0"),
		.D_REG                    ("0b0"),

		.TOP_8x8_MULT_REG         ("0b1"),
		.BOT_8x8_MULT_REG         ("0b1"),

		.PIPELINE_16x16_MULT_REG1 ("0b1"),
		.PIPELINE_16x16_MULT_REG2 ("0b0"),

		.TOPOUTPUT_SELECT         ("0b10"),
		.TOPADDSUB_LOWERINPUT     ("0b00"),
		.TOPADDSUB_UPPERINPUT     ("0b0"),
		.TOPADDSUB_CARRYSELECT    ("0b00"),

		.BOTOUTPUT_SELECT         ("0b10"),
		.BOTADDSUB_LOWERINPUT     ("0b00"),
		.BOTADDSUB_UPPERINPUT     ("0b0"),
		.BOTADDSUB_CARRYSELECT    ("0b00"),

		.MODE_8x8                 ("0b1"),
		.A_SIGNED                 ("0b1"),
		.B_SIGNED                 ("0b1")
	) mac16 (
		/* inputs */
		.CLK        (clock     ),
		.CE         (1'b1      ),

		.A15        (A[15]     ),
		.A14        (A[14]     ),
		.A13        (A[13]     ),
		.A12        (A[12]     ),
		.A11        (A[11]     ),
		.A10        (A[10]     ),
		.A9         (A[ 9]     ),
		.A8         (A[ 8]     ),
		.A7         (A[ 7]     ),
		.A6         (A[ 6]     ),
		.A5         (A[ 5]     ),
		.A4         (A[ 4]     ),
		.A3         (A[ 3]     ),
		.A2         (A[ 2]     ),
		.A1         (A[ 1]     ),
		.A0         (A[ 0]     ),

		.B15        (B[15]     ),
		.B14        (B[14]     ),
		.B13        (B[13]     ),
		.B12        (B[12]     ),
		.B11        (B[11]     ),
		.B10        (B[10]     ),
		.B9         (B[ 9]     ),
		.B8         (B[ 8]     ),
		.B7         (B[ 7]     ),
		.B6         (B[ 6]     ),
		.B5         (B[ 5]     ),
		.B4         (B[ 4]     ),
		.B3         (B[ 3]     ),
		.B2         (B[ 2]     ),
		.B1         (B[ 1]     ),
		.B0         (B[ 0]     ),

		.C15        (1'b0      ),
		.C14        (1'b0      ),
		.C13        (1'b0      ),
		.C12        (1'b0      ),
		.C11        (1'b0      ),
		.C10        (1'b0      ),
		.C9         (1'b0      ),
		.C8         (1'b0      ),
		.C7         (1'b0      ),
		.C6         (1'b0      ),
		.C5         (1'b0      ),
		.C4         (1'b0      ),
		.C3         (1'b0      ),
		.C2         (1'b0      ),
		.C1         (1'b0      ),
		.C0         (1'b0      ),

		.D15        (1'b0      ),
		.D14        (1'b0      ),
		.D13        (1'b0      ),
		.D12        (1'b0      ),
		.D11        (1'b0      ),
		.D10        (1'b0      ),
		.D9         (1'b0      ),
		.D8         (1'b0      ),
		.D7         (1'b0      ),
		.D6         (1'b0      ),
		.D5         (1'b0      ),
		.D4         (1'b0      ),
		.D3         (1'b0      ),
		.D2         (1'b0      ),
		.D1         (1'b0      ),
		.D0         (1'b0      ),

		.AHOLD      (1'b 0     ),
		.BHOLD      (1'b 0     ),
		.CHOLD      (1'b 0     ),
		.DHOLD      (1'b 0     ),

		.IRSTTOP    (1'b 0     ),
		.IRSTBOT    (1'b 0     ),
		.ORSTTOP    (1'b 0     ),
		.ORSTBOT    (1'b 0     ),
		.OLOADTOP   (1'b 0     ),
		.OLOADBOT   (1'b 0     ),

		.ADDSUBTOP  (1'b 0     ),
		.ADDSUBBOT  (1'b 0     ),
		.OHOLDTOP   (1'b 0     ),
		.OHOLDBOT   (1'b 0     ),
		.CI         (1'b 0     ),
		.ACCUMCI    (1'b 0     ),
		.SIGNEXTIN  (1'b 0     ),

		/* outputs */
		.O31        (O[31]     ),
		.O30        (O[30]     ),
		.O29        (O[29]     ),
		.O28        (O[28]     ),
		.O27        (O[27]     ),
		.O26        (O[26]     ),
		.O25        (O[25]     ),
		.O24        (O[24]     ),
		.O23        (O[23]     ),
		.O22        (O[22]     ),
		.O21        (O[21]     ),
		.O20        (O[20]     ),
		.O19        (O[19]     ),
		.O18        (O[18]     ),
		.O17        (O[17]     ),
		.O16        (O[16]     ),
		.O15        (O[15]     ),
		.O14        (O[14]     ),
		.O13        (O[13]     ),
		.O12        (O[12]     ),
		.O11        (O[11]     ),
		.O10        (O[10]     ),
		.O9         (O[ 9]     ),
		.O8         (O[ 8]     ),
		.O7         (O[ 7]     ),
		.O6         (O[ 6]     ),
		.O5         (O[ 5]     ),
		.O4         (O[ 4]     ),
		.O3         (O[ 3]     ),
		.O2         (O[ 2]     ),
		.O1         (O[ 1]     ),
		.O0         (O[ 0]     ),

		.CO         (          ),
		.ACCUMCO    (          ),
		.SIGNEXTOUT (          )
	);
`else
	SB_MAC16 #(
		.NEG_TRIGGER              (1'b  0),

		.A_REG                    (1'b  1),
		.B_REG                    (1'b  1),
		.C_REG                    (1'b  0),
		.D_REG                    (1'b  0),

		.TOP_8x8_MULT_REG         (1'b  1),
		.BOT_8x8_MULT_REG         (1'b  1),

		.PIPELINE_16x16_MULT_REG1 (1'b  1),
		.PIPELINE_16x16_MULT_REG2 (1'b  0),

		.TOPOUTPUT_SELECT         (2'b 10),
		.TOPADDSUB_LOWERINPUT     (2'b 00),
		.TOPADDSUB_UPPERINPUT     (1'b  0),
		.TOPADDSUB_CARRYSELECT    (2'b 00),

		.BOTOUTPUT_SELECT         (2'b 10),
		.BOTADDSUB_LOWERINPUT     (2'b 00),
		.BOTADDSUB_UPPERINPUT     (1'b  0),
		.BOTADDSUB_CARRYSELECT    (2'b 00),

		.MODE_8x8                 (1'b  1),
		.A_SIGNED                 (1'b  1),
		.B_SIGNED                 (1'b  1)
	) mac16 (
		/* inputs */
		.CLK        (clock     ),
		.CE         (1'b1      ),

		.A          (A         ),
		.B          (B         ),
		.C          (16'b 0    ),
		.D          (16'b 0    ),

		.AHOLD      (1'b 0     ),
		.BHOLD      (1'b 0     ),
		.CHOLD      (1'b 0     ),
		.DHOLD      (1'b 0     ),

		.IRSTTOP    (1'b 0     ),
		.IRSTBOT    (1'b 0     ),
		.ORSTTOP    (1'b 0     ),
		.ORSTBOT    (1'b 0     ),
		.OLOADTOP   (1'b 0     ),
		.OLOADBOT   (1'b 0     ),

		.ADDSUBTOP  (1'b 0     ),
		.ADDSUBBOT  (1'b 0     ),
		.OHOLDTOP   (1'b 0     ),
		.OHOLDBOT   (1'b 0     ),
		.CI         (1'b 0     ),
		.ACCUMCI    (1'b 0     ),
		.SIGNEXTIN  (1'b 0     ),

		/* outputs */
		.O          (O         ),
		.CO         (          ),
		.ACCUMCO    (          ),
		.SIGNEXTOUT (          )
	);
`endif
`endif
endmodule
