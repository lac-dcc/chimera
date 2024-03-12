module ibex_alu (
	operator_i,
	operand_a_i,
	operand_b_i,
	instr_first_cycle_i,
	multdiv_operand_a_i,
	multdiv_operand_b_i,
	multdiv_sel_i,
	imd_val_q_i,
	imd_val_d_o,
	imd_val_we_o,
	adder_result_o,
	adder_result_ext_o,
	result_o,
	comparison_result_o,
	is_equal_result_o
);
	localparam integer ibex_pkg_RV32BNone = 0;
	parameter integer RV32B = ibex_pkg_RV32BNone;
	input wire [5:0] operator_i;
	input wire [31:0] operand_a_i;
	input wire [31:0] operand_b_i;
	input wire instr_first_cycle_i;
	input wire [32:0] multdiv_operand_a_i;
	input wire [32:0] multdiv_operand_b_i;
	input wire multdiv_sel_i;
	input wire [63:0] imd_val_q_i;
	output reg [63:0] imd_val_d_o;
	output reg [1:0] imd_val_we_o;
	output wire [31:0] adder_result_o;
	output wire [33:0] adder_result_ext_o;
	output reg [31:0] result_o;
	output wire comparison_result_o;
	output wire is_equal_result_o;
	wire [31:0] operand_a_rev;
	wire [32:0] operand_b_neg;
	generate
		genvar k;
		for (k = 0; k < 32; k = k + 1) begin : gen_rev_operand_a
			assign operand_a_rev[k] = operand_a_i[31 - k];
		end
	endgenerate
	reg adder_op_b_negate;
	wire [32:0] adder_in_a;
	reg [32:0] adder_in_b;
	wire [31:0] adder_result;
	localparam [5:0] ibex_pkg_ALU_EQ = 23;
	localparam [5:0] ibex_pkg_ALU_GE = 21;
	localparam [5:0] ibex_pkg_ALU_GEU = 22;
	localparam [5:0] ibex_pkg_ALU_LT = 19;
	localparam [5:0] ibex_pkg_ALU_LTU = 20;
	localparam [5:0] ibex_pkg_ALU_MAX = 27;
	localparam [5:0] ibex_pkg_ALU_MAXU = 28;
	localparam [5:0] ibex_pkg_ALU_MIN = 25;
	localparam [5:0] ibex_pkg_ALU_MINU = 26;
	localparam [5:0] ibex_pkg_ALU_NE = 24;
	localparam [5:0] ibex_pkg_ALU_SLT = 37;
	localparam [5:0] ibex_pkg_ALU_SLTU = 38;
	localparam [5:0] ibex_pkg_ALU_SUB = 1;
	always @(*) begin
		adder_op_b_negate = 1'b0;
		case (operator_i)
			ibex_pkg_ALU_SUB, ibex_pkg_ALU_EQ, ibex_pkg_ALU_NE, ibex_pkg_ALU_GE, ibex_pkg_ALU_GEU, ibex_pkg_ALU_LT, ibex_pkg_ALU_LTU, ibex_pkg_ALU_SLT, ibex_pkg_ALU_SLTU, ibex_pkg_ALU_MIN, ibex_pkg_ALU_MINU, ibex_pkg_ALU_MAX, ibex_pkg_ALU_MAXU: adder_op_b_negate = 1'b1;
			default:
				;
		endcase
	end
	assign adder_in_a = (multdiv_sel_i ? multdiv_operand_a_i : {operand_a_i, 1'b1});
	assign operand_b_neg = {operand_b_i, 1'b0} ^ {33 {1'b1}};
	always @(*)
		case (1'b1)
			multdiv_sel_i: adder_in_b = multdiv_operand_b_i;
			adder_op_b_negate: adder_in_b = operand_b_neg;
			default: adder_in_b = {operand_b_i, 1'b0};
		endcase
	assign adder_result_ext_o = $unsigned(adder_in_a) + $unsigned(adder_in_b);
	assign adder_result = adder_result_ext_o[32:1];
	assign adder_result_o = adder_result;
	wire is_equal;
	reg is_greater_equal;
	reg cmp_signed;
	always @(*)
		case (operator_i)
			ibex_pkg_ALU_GE, ibex_pkg_ALU_LT, ibex_pkg_ALU_SLT, ibex_pkg_ALU_MIN, ibex_pkg_ALU_MAX: cmp_signed = 1'b1;
			default: cmp_signed = 1'b0;
		endcase
	assign is_equal = adder_result == 32'b00000000000000000000000000000000;
	assign is_equal_result_o = is_equal;
	always @(*)
		if ((operand_a_i[31] ^ operand_b_i[31]) == 1'b0)
			is_greater_equal = adder_result[31] == 1'b0;
		else
			is_greater_equal = operand_a_i[31] ^ cmp_signed;
	reg cmp_result;
	always @(*)
		case (operator_i)
			ibex_pkg_ALU_EQ: cmp_result = is_equal;
			ibex_pkg_ALU_NE: cmp_result = ~is_equal;
			ibex_pkg_ALU_GE, ibex_pkg_ALU_GEU, ibex_pkg_ALU_MAX, ibex_pkg_ALU_MAXU: cmp_result = is_greater_equal;
			ibex_pkg_ALU_LT, ibex_pkg_ALU_LTU, ibex_pkg_ALU_MIN, ibex_pkg_ALU_MINU, ibex_pkg_ALU_SLT, ibex_pkg_ALU_SLTU: cmp_result = ~is_greater_equal;
			default: cmp_result = is_equal;
		endcase
	assign comparison_result_o = cmp_result;
	reg shift_left;
	wire shift_ones;
	wire shift_arith;
	wire shift_funnel;
	wire shift_sbmode;
	reg [5:0] shift_amt;
	wire [5:0] shift_amt_compl;
	reg [31:0] shift_operand;
	reg [32:0] shift_result_ext;
	reg unused_shift_result_ext;
	reg [31:0] shift_result;
	reg [31:0] shift_result_rev;
	wire bfp_op;
	wire [4:0] bfp_len;
	wire [4:0] bfp_off;
	wire [31:0] bfp_mask;
	wire [31:0] bfp_mask_rev;
	wire [31:0] bfp_result;
	localparam [5:0] ibex_pkg_ALU_BFP = 49;
	assign bfp_op = (RV32B != ibex_pkg_RV32BNone ? operator_i == ibex_pkg_ALU_BFP : 1'b0);
	assign bfp_len = {~(|operand_b_i[27:24]), operand_b_i[27:24]};
	assign bfp_off = operand_b_i[20:16];
	assign bfp_mask = (RV32B != ibex_pkg_RV32BNone ? ~(32'hffffffff << bfp_len) : {32 {1'sb0}});
	generate
		genvar i;
		for (i = 0; i < 32; i = i + 1) begin : gen_rev_bfp_mask
			assign bfp_mask_rev[i] = bfp_mask[31 - i];
		end
	endgenerate
	assign bfp_result = (RV32B != ibex_pkg_RV32BNone ? (~shift_result & operand_a_i) | ((operand_b_i & bfp_mask) << bfp_off) : {32 {1'sb0}});
	wire [1:1] sv2v_tmp_86907;
	assign sv2v_tmp_86907 = operand_b_i[5] & shift_funnel;
	always @(*) shift_amt[5] = sv2v_tmp_86907;
	assign shift_amt_compl = 32 - operand_b_i[4:0];
	always @(*)
		if (bfp_op)
			shift_amt[4:0] = bfp_off;
		else
			shift_amt[4:0] = (instr_first_cycle_i ? (operand_b_i[5] && shift_funnel ? shift_amt_compl[4:0] : operand_b_i[4:0]) : (operand_b_i[5] && shift_funnel ? operand_b_i[4:0] : shift_amt_compl[4:0]));
	localparam [5:0] ibex_pkg_ALU_SBCLR = 44;
	localparam [5:0] ibex_pkg_ALU_SBINV = 45;
	localparam [5:0] ibex_pkg_ALU_SBSET = 43;
	assign shift_sbmode = (RV32B != ibex_pkg_RV32BNone ? ((operator_i == ibex_pkg_ALU_SBSET) | (operator_i == ibex_pkg_ALU_SBCLR)) | (operator_i == ibex_pkg_ALU_SBINV) : 1'b0);
	localparam [5:0] ibex_pkg_ALU_FSL = 41;
	localparam [5:0] ibex_pkg_ALU_FSR = 42;
	localparam [5:0] ibex_pkg_ALU_ROL = 14;
	localparam [5:0] ibex_pkg_ALU_ROR = 13;
	localparam [5:0] ibex_pkg_ALU_SLL = 10;
	localparam [5:0] ibex_pkg_ALU_SLO = 12;
	always @(*) begin
		case (operator_i)
			ibex_pkg_ALU_SLL: shift_left = 1'b1;
			ibex_pkg_ALU_SLO, ibex_pkg_ALU_BFP: shift_left = (RV32B != ibex_pkg_RV32BNone ? 1'b1 : 1'b0);
			ibex_pkg_ALU_ROL: shift_left = (RV32B != ibex_pkg_RV32BNone ? instr_first_cycle_i : 0);
			ibex_pkg_ALU_ROR: shift_left = (RV32B != ibex_pkg_RV32BNone ? ~instr_first_cycle_i : 0);
			ibex_pkg_ALU_FSL: shift_left = (RV32B != ibex_pkg_RV32BNone ? (shift_amt[5] ? ~instr_first_cycle_i : instr_first_cycle_i) : 1'b0);
			ibex_pkg_ALU_FSR: shift_left = (RV32B != ibex_pkg_RV32BNone ? (shift_amt[5] ? instr_first_cycle_i : ~instr_first_cycle_i) : 1'b0);
			default: shift_left = 1'b0;
		endcase
		if (shift_sbmode)
			shift_left = 1'b1;
	end
	localparam [5:0] ibex_pkg_ALU_SRA = 8;
	assign shift_arith = operator_i == ibex_pkg_ALU_SRA;
	localparam [5:0] ibex_pkg_ALU_SRO = 11;
	assign shift_ones = (RV32B != ibex_pkg_RV32BNone ? (operator_i == ibex_pkg_ALU_SLO) | (operator_i == ibex_pkg_ALU_SRO) : 1'b0);
	assign shift_funnel = (RV32B != ibex_pkg_RV32BNone ? (operator_i == ibex_pkg_ALU_FSL) | (operator_i == ibex_pkg_ALU_FSR) : 1'b0);
	always @(*) begin
		if (RV32B == ibex_pkg_RV32BNone)
			shift_operand = (shift_left ? operand_a_rev : operand_a_i);
		else
			case (1'b1)
				bfp_op: shift_operand = bfp_mask_rev;
				shift_sbmode: shift_operand = 32'h80000000;
				default: shift_operand = (shift_left ? operand_a_rev : operand_a_i);
			endcase
		shift_result_ext = $unsigned($signed({shift_ones | (shift_arith & shift_operand[31]), shift_operand}) >>> shift_amt[4:0]);
		shift_result = shift_result_ext[31:0];
		unused_shift_result_ext = shift_result_ext[32];
		begin : sv2v_autoblock_6
			reg [31:0] i;
			for (i = 0; i < 32; i = i + 1)
				shift_result_rev[i] = shift_result[31 - i];
		end
		shift_result = (shift_left ? shift_result_rev : shift_result);
	end
	wire bwlogic_or;
	wire bwlogic_and;
	wire [31:0] bwlogic_operand_b;
	wire [31:0] bwlogic_or_result;
	wire [31:0] bwlogic_and_result;
	wire [31:0] bwlogic_xor_result;
	reg [31:0] bwlogic_result;
	reg bwlogic_op_b_negate;
	localparam [5:0] ibex_pkg_ALU_ANDN = 7;
	localparam [5:0] ibex_pkg_ALU_CMIX = 40;
	localparam [5:0] ibex_pkg_ALU_ORN = 6;
	localparam [5:0] ibex_pkg_ALU_XNOR = 5;
	always @(*)
		case (operator_i)
			ibex_pkg_ALU_XNOR, ibex_pkg_ALU_ORN, ibex_pkg_ALU_ANDN: bwlogic_op_b_negate = (RV32B != ibex_pkg_RV32BNone ? 1'b1 : 1'b0);
			ibex_pkg_ALU_CMIX: bwlogic_op_b_negate = (RV32B != ibex_pkg_RV32BNone ? ~instr_first_cycle_i : 1'b0);
			default: bwlogic_op_b_negate = 1'b0;
		endcase
	assign bwlogic_operand_b = (bwlogic_op_b_negate ? operand_b_neg[32:1] : operand_b_i);
	assign bwlogic_or_result = operand_a_i | bwlogic_operand_b;
	assign bwlogic_and_result = operand_a_i & bwlogic_operand_b;
	assign bwlogic_xor_result = operand_a_i ^ bwlogic_operand_b;
	localparam [5:0] ibex_pkg_ALU_OR = 3;
	assign bwlogic_or = (operator_i == ibex_pkg_ALU_OR) | (operator_i == ibex_pkg_ALU_ORN);
	localparam [5:0] ibex_pkg_ALU_AND = 4;
	assign bwlogic_and = (operator_i == ibex_pkg_ALU_AND) | (operator_i == ibex_pkg_ALU_ANDN);
	always @(*)
		case (1'b1)
			bwlogic_or: bwlogic_result = bwlogic_or_result;
			bwlogic_and: bwlogic_result = bwlogic_and_result;
			default: bwlogic_result = bwlogic_xor_result;
		endcase
	wire [5:0] bitcnt_result;
	wire [31:0] minmax_result;
	reg [31:0] pack_result;
	wire [31:0] sext_result;
	reg [31:0] singlebit_result;
	reg [31:0] rev_result;
	reg [31:0] shuffle_result;
	reg [31:0] butterfly_result;
	reg [31:0] invbutterfly_result;
	reg [31:0] clmul_result;
	reg [31:0] multicycle_result;
	localparam [5:0] ibex_pkg_ALU_BDEP = 48;
	localparam [5:0] ibex_pkg_ALU_BEXT = 47;
	localparam [5:0] ibex_pkg_ALU_CLMULH = 52;
	localparam [5:0] ibex_pkg_ALU_CLMULR = 51;
	localparam [5:0] ibex_pkg_ALU_CLZ = 34;
	localparam [5:0] ibex_pkg_ALU_CMOV = 39;
	localparam [5:0] ibex_pkg_ALU_CRC32C_B = 54;
	localparam [5:0] ibex_pkg_ALU_CRC32C_H = 56;
	localparam [5:0] ibex_pkg_ALU_CRC32C_W = 58;
	localparam [5:0] ibex_pkg_ALU_CRC32_B = 53;
	localparam [5:0] ibex_pkg_ALU_CRC32_H = 55;
	localparam [5:0] ibex_pkg_ALU_CRC32_W = 57;
	localparam [5:0] ibex_pkg_ALU_CTZ = 35;
	localparam [5:0] ibex_pkg_ALU_GORC = 16;
	localparam [5:0] ibex_pkg_ALU_PACKH = 31;
	localparam [5:0] ibex_pkg_ALU_PACKU = 30;
	localparam [5:0] ibex_pkg_ALU_SEXTB = 32;
	localparam [5:0] ibex_pkg_ALU_UNSHFL = 18;
	localparam integer ibex_pkg_RV32BFull = 2;
	generate
		if (RV32B != ibex_pkg_RV32BNone) begin : g_alu_rvb
			wire zbe_op;
			wire bitcnt_ctz;
			wire bitcnt_clz;
			wire bitcnt_cz;
			reg [31:0] bitcnt_bits;
			wire [31:0] bitcnt_mask_op;
			reg [31:0] bitcnt_bit_mask;
			reg [191:0] bitcnt_partial;
			wire [31:0] bitcnt_partial_lsb_d;
			wire [31:0] bitcnt_partial_msb_d;
			assign bitcnt_ctz = operator_i == ibex_pkg_ALU_CTZ;
			assign bitcnt_clz = operator_i == ibex_pkg_ALU_CLZ;
			assign bitcnt_cz = bitcnt_ctz | bitcnt_clz;
			assign bitcnt_result = bitcnt_partial[0+:6];
			assign bitcnt_mask_op = (bitcnt_clz ? operand_a_rev : operand_a_i);
			always @(*) begin
				bitcnt_bit_mask = bitcnt_mask_op;
				bitcnt_bit_mask = bitcnt_bit_mask | (bitcnt_bit_mask << 1);
				bitcnt_bit_mask = bitcnt_bit_mask | (bitcnt_bit_mask << 2);
				bitcnt_bit_mask = bitcnt_bit_mask | (bitcnt_bit_mask << 4);
				bitcnt_bit_mask = bitcnt_bit_mask | (bitcnt_bit_mask << 8);
				bitcnt_bit_mask = bitcnt_bit_mask | (bitcnt_bit_mask << 16);
				bitcnt_bit_mask = ~bitcnt_bit_mask;
			end
			assign zbe_op = (operator_i == ibex_pkg_ALU_BEXT) | (operator_i == ibex_pkg_ALU_BDEP);
			always @(*)
				case (1'b1)
					zbe_op: bitcnt_bits = operand_b_i;
					bitcnt_cz: bitcnt_bits = bitcnt_bit_mask & ~bitcnt_mask_op;
					default: bitcnt_bits = operand_a_i;
				endcase
			always @(*) begin
				bitcnt_partial = {32 {6'b000000}};
				begin : sv2v_autoblock_7
					reg [31:0] i;
					for (i = 1; i < 32; i = i + 2)
						bitcnt_partial[(31 - i) * 6+:6] = {5'h00, bitcnt_bits[i]} + {5'h00, bitcnt_bits[i - 1]};
				end
				begin : sv2v_autoblock_8
					reg [31:0] i;
					for (i = 3; i < 32; i = i + 4)
						bitcnt_partial[(31 - i) * 6+:6] = bitcnt_partial[(33 - i) * 6+:6] + bitcnt_partial[(31 - i) * 6+:6];
				end
				begin : sv2v_autoblock_9
					reg [31:0] i;
					for (i = 7; i < 32; i = i + 8)
						bitcnt_partial[(31 - i) * 6+:6] = bitcnt_partial[(35 - i) * 6+:6] + bitcnt_partial[(31 - i) * 6+:6];
				end
				begin : sv2v_autoblock_10
					reg [31:0] i;
					for (i = 15; i < 32; i = i + 16)
						bitcnt_partial[(31 - i) * 6+:6] = bitcnt_partial[(39 - i) * 6+:6] + bitcnt_partial[(31 - i) * 6+:6];
				end
				bitcnt_partial[0+:6] = bitcnt_partial[96+:6] + bitcnt_partial[0+:6];
				bitcnt_partial[48+:6] = bitcnt_partial[96+:6] + bitcnt_partial[48+:6];
				begin : sv2v_autoblock_11
					reg [31:0] i;
					for (i = 11; i < 32; i = i + 8)
						bitcnt_partial[(31 - i) * 6+:6] = bitcnt_partial[(35 - i) * 6+:6] + bitcnt_partial[(31 - i) * 6+:6];
				end
				begin : sv2v_autoblock_12
					reg [31:0] i;
					for (i = 5; i < 32; i = i + 4)
						bitcnt_partial[(31 - i) * 6+:6] = bitcnt_partial[(33 - i) * 6+:6] + bitcnt_partial[(31 - i) * 6+:6];
				end
				bitcnt_partial[186+:6] = {5'h00, bitcnt_bits[0]};
				begin : sv2v_autoblock_13
					reg [31:0] i;
					for (i = 2; i < 32; i = i + 2)
						bitcnt_partial[(31 - i) * 6+:6] = bitcnt_partial[(32 - i) * 6+:6] + {5'h00, bitcnt_bits[i]};
				end
			end
			assign minmax_result = (cmp_result ? operand_a_i : operand_b_i);
			wire packu;
			wire packh;
			assign packu = operator_i == ibex_pkg_ALU_PACKU;
			assign packh = operator_i == ibex_pkg_ALU_PACKH;
			always @(*)
				case (1'b1)
					packu: pack_result = {operand_b_i[31:16], operand_a_i[31:16]};
					packh: pack_result = {16'h0000, operand_b_i[7:0], operand_a_i[7:0]};
					default: pack_result = {operand_b_i[15:0], operand_a_i[15:0]};
				endcase
			assign sext_result = (operator_i == ibex_pkg_ALU_SEXTB ? {{24 {operand_a_i[7]}}, operand_a_i[7:0]} : {{16 {operand_a_i[15]}}, operand_a_i[15:0]});
			always @(*)
				case (operator_i)
					ibex_pkg_ALU_SBSET: singlebit_result = operand_a_i | shift_result;
					ibex_pkg_ALU_SBCLR: singlebit_result = operand_a_i & ~shift_result;
					ibex_pkg_ALU_SBINV: singlebit_result = operand_a_i ^ shift_result;
					default: singlebit_result = {31'h00000000, shift_result[0]};
				endcase
			wire [4:0] zbp_shift_amt;
			wire gorc_op;
			assign gorc_op = operator_i == ibex_pkg_ALU_GORC;
			assign zbp_shift_amt[2:0] = (RV32B == ibex_pkg_RV32BFull ? shift_amt[2:0] : {3 {&shift_amt[2:0]}});
			assign zbp_shift_amt[4:3] = (RV32B == ibex_pkg_RV32BFull ? shift_amt[4:3] : {2 {&shift_amt[4:3]}});
			always @(*) begin
				rev_result = operand_a_i;
				if (zbp_shift_amt[0])
					rev_result = ((gorc_op ? rev_result : 32'h00000000) | ((rev_result & 32'h55555555) << 1)) | ((rev_result & 32'haaaaaaaa) >> 1);
				if (zbp_shift_amt[1])
					rev_result = ((gorc_op ? rev_result : 32'h00000000) | ((rev_result & 32'h33333333) << 2)) | ((rev_result & 32'hcccccccc) >> 2);
				if (zbp_shift_amt[2])
					rev_result = ((gorc_op ? rev_result : 32'h00000000) | ((rev_result & 32'h0f0f0f0f) << 4)) | ((rev_result & 32'hf0f0f0f0) >> 4);
				if (zbp_shift_amt[3])
					rev_result = ((gorc_op & (RV32B == ibex_pkg_RV32BFull) ? rev_result : 32'h00000000) | ((rev_result & 32'h00ff00ff) << 8)) | ((rev_result & 32'hff00ff00) >> 8);
				if (zbp_shift_amt[4])
					rev_result = ((gorc_op & (RV32B == ibex_pkg_RV32BFull) ? rev_result : 32'h00000000) | ((rev_result & 32'h0000ffff) << 16)) | ((rev_result & 32'hffff0000) >> 16);
			end
			wire crc_hmode;
			wire crc_bmode;
			wire [31:0] clmul_result_rev;
			if (RV32B == ibex_pkg_RV32BFull) begin : gen_alu_rvb_full
				localparam [127:0] SHUFFLE_MASK_L = {32'h00ff0000, 32'h0f000f00, 32'h30303030, 32'h44444444};
				localparam [127:0] SHUFFLE_MASK_R = {32'h0000ff00, 32'h00f000f0, 32'h0c0c0c0c, 32'h22222222};
				localparam [127:0] FLIP_MASK_L = {32'h22001100, 32'h00440000, 32'h44110000, 32'h11000000};
				localparam [127:0] FLIP_MASK_R = {32'h00880044, 32'h00002200, 32'h00008822, 32'h00000088};
				wire [31:0] SHUFFLE_MASK_NOT [0:3];
				for (i = 0; i < 4; i = i + 1) begin : gen_shuffle_mask_not
					assign SHUFFLE_MASK_NOT[i] = ~(SHUFFLE_MASK_L[(3 - i) * 32+:32] | SHUFFLE_MASK_R[(3 - i) * 32+:32]);
				end
				wire shuffle_flip;
				assign shuffle_flip = operator_i == ibex_pkg_ALU_UNSHFL;
				reg [3:0] shuffle_mode;
				always @(*) begin
					shuffle_result = operand_a_i;
					if (shuffle_flip) begin
						shuffle_mode[3] = shift_amt[0];
						shuffle_mode[2] = shift_amt[1];
						shuffle_mode[1] = shift_amt[2];
						shuffle_mode[0] = shift_amt[3];
					end
					else
						shuffle_mode = shift_amt[3:0];
					if (shuffle_flip)
						shuffle_result = ((((((((shuffle_result & 32'h88224411) | ((shuffle_result << 6) & FLIP_MASK_L[96+:32])) | ((shuffle_result >> 6) & FLIP_MASK_R[96+:32])) | ((shuffle_result << 9) & FLIP_MASK_L[64+:32])) | ((shuffle_result >> 9) & FLIP_MASK_R[64+:32])) | ((shuffle_result << 15) & FLIP_MASK_L[32+:32])) | ((shuffle_result >> 15) & FLIP_MASK_R[32+:32])) | ((shuffle_result << 21) & FLIP_MASK_L[0+:32])) | ((shuffle_result >> 21) & FLIP_MASK_R[0+:32]);
					if (shuffle_mode[3])
						shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[0]) | (((shuffle_result << 8) & SHUFFLE_MASK_L[96+:32]) | ((shuffle_result >> 8) & SHUFFLE_MASK_R[96+:32]));
					if (shuffle_mode[2])
						shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[1]) | (((shuffle_result << 4) & SHUFFLE_MASK_L[64+:32]) | ((shuffle_result >> 4) & SHUFFLE_MASK_R[64+:32]));
					if (shuffle_mode[1])
						shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[2]) | (((shuffle_result << 2) & SHUFFLE_MASK_L[32+:32]) | ((shuffle_result >> 2) & SHUFFLE_MASK_R[32+:32]));
					if (shuffle_mode[0])
						shuffle_result = (shuffle_result & SHUFFLE_MASK_NOT[3]) | (((shuffle_result << 1) & SHUFFLE_MASK_L[0+:32]) | ((shuffle_result >> 1) & SHUFFLE_MASK_R[0+:32]));
					if (shuffle_flip)
						shuffle_result = ((((((((shuffle_result & 32'h88224411) | ((shuffle_result << 6) & FLIP_MASK_L[96+:32])) | ((shuffle_result >> 6) & FLIP_MASK_R[96+:32])) | ((shuffle_result << 9) & FLIP_MASK_L[64+:32])) | ((shuffle_result >> 9) & FLIP_MASK_R[64+:32])) | ((shuffle_result << 15) & FLIP_MASK_L[32+:32])) | ((shuffle_result >> 15) & FLIP_MASK_R[32+:32])) | ((shuffle_result << 21) & FLIP_MASK_L[0+:32])) | ((shuffle_result >> 21) & FLIP_MASK_R[0+:32]);
				end
				reg [191:0] bitcnt_partial_q;
				for (i = 0; i < 32; i = i + 1) begin : gen_bitcnt_reg_in_lsb
					assign bitcnt_partial_lsb_d[i] = bitcnt_partial[(31 - i) * 6];
				end
				for (i = 0; i < 16; i = i + 1) begin : gen_bitcnt_reg_in_b1
					assign bitcnt_partial_msb_d[i] = bitcnt_partial[((31 - ((2 * i) + 1)) * 6) + 1];
				end
				for (i = 0; i < 8; i = i + 1) begin : gen_bitcnt_reg_in_b2
					assign bitcnt_partial_msb_d[16 + i] = bitcnt_partial[((31 - ((4 * i) + 3)) * 6) + 2];
				end
				for (i = 0; i < 4; i = i + 1) begin : gen_bitcnt_reg_in_b3
					assign bitcnt_partial_msb_d[24 + i] = bitcnt_partial[((31 - ((8 * i) + 7)) * 6) + 3];
				end
				for (i = 0; i < 2; i = i + 1) begin : gen_bitcnt_reg_in_b4
					assign bitcnt_partial_msb_d[28 + i] = bitcnt_partial[((31 - ((16 * i) + 15)) * 6) + 4];
				end
				assign bitcnt_partial_msb_d[30] = bitcnt_partial[5];
				assign bitcnt_partial_msb_d[31] = 1'b0;
				always @(*) begin
					bitcnt_partial_q = {32 {6'b000000}};
					begin : sv2v_autoblock_14
						reg [31:0] i;
						for (i = 0; i < 32; i = i + 1)
							begin : gen_bitcnt_reg_out_lsb
								bitcnt_partial_q[(31 - i) * 6] = imd_val_q_i[32 + i];
							end
					end
					begin : sv2v_autoblock_15
						reg [31:0] i;
						for (i = 0; i < 16; i = i + 1)
							begin : gen_bitcnt_reg_out_b1
								bitcnt_partial_q[((31 - ((2 * i) + 1)) * 6) + 1] = imd_val_q_i[i];
							end
					end
					begin : sv2v_autoblock_16
						reg [31:0] i;
						for (i = 0; i < 8; i = i + 1)
							begin : gen_bitcnt_reg_out_b2
								bitcnt_partial_q[((31 - ((4 * i) + 3)) * 6) + 2] = imd_val_q_i[16 + i];
							end
					end
					begin : sv2v_autoblock_17
						reg [31:0] i;
						for (i = 0; i < 4; i = i + 1)
							begin : gen_bitcnt_reg_out_b3
								bitcnt_partial_q[((31 - ((8 * i) + 7)) * 6) + 3] = imd_val_q_i[24 + i];
							end
					end
					begin : sv2v_autoblock_18
						reg [31:0] i;
						for (i = 0; i < 2; i = i + 1)
							begin : gen_bitcnt_reg_out_b4
								bitcnt_partial_q[((31 - ((16 * i) + 15)) * 6) + 4] = imd_val_q_i[28 + i];
							end
					end
					bitcnt_partial_q[5] = imd_val_q_i[30];
				end
				wire [31:0] butterfly_mask_l [0:4];
				wire [31:0] butterfly_mask_r [0:4];
				wire [31:0] butterfly_mask_not [0:4];
				wire [31:0] lrotc_stage [0:4];
				genvar stg;
				for (stg = 0; stg < 5; stg = stg + 1) begin : gen_butterfly_ctrl_stage
					genvar seg;
					for (seg = 0; seg < (2 ** stg); seg = seg + 1) begin : gen_butterfly_ctrl
						assign lrotc_stage[stg][((2 * (16 >> stg)) * (seg + 1)) - 1:(2 * (16 >> stg)) * seg] = {{16 >> stg {1'b0}}, {16 >> stg {1'b1}}} << bitcnt_partial_q[((32 - ((16 >> stg) * ((2 * seg) + 1))) * 6) + ($clog2(16 >> stg) >= 0 ? $clog2(16 >> stg) : ($clog2(16 >> stg) + ($clog2(16 >> stg) >= 0 ? $clog2(16 >> stg) + 1 : 1 - $clog2(16 >> stg))) - 1)-:($clog2(16 >> stg) >= 0 ? $clog2(16 >> stg) + 1 : 1 - $clog2(16 >> stg))];
						assign butterfly_mask_l[stg][((16 >> stg) * ((2 * seg) + 2)) - 1:(16 >> stg) * ((2 * seg) + 1)] = ~lrotc_stage[stg][((16 >> stg) * ((2 * seg) + 2)) - 1:(16 >> stg) * ((2 * seg) + 1)];
						assign butterfly_mask_r[stg][((16 >> stg) * ((2 * seg) + 1)) - 1:(16 >> stg) * (2 * seg)] = ~lrotc_stage[stg][((16 >> stg) * ((2 * seg) + 2)) - 1:(16 >> stg) * ((2 * seg) + 1)];
						assign butterfly_mask_l[stg][((16 >> stg) * ((2 * seg) + 1)) - 1:(16 >> stg) * (2 * seg)] = {((((16 >> stg) * ((2 * seg) + 1)) - 1) >= ((16 >> stg) * (2 * seg)) ? ((((16 >> stg) * ((2 * seg) + 1)) - 1) - ((16 >> stg) * (2 * seg))) + 1 : (((16 >> stg) * (2 * seg)) - (((16 >> stg) * ((2 * seg) + 1)) - 1)) + 1) {1'sb0}};
						assign butterfly_mask_r[stg][((16 >> stg) * ((2 * seg) + 2)) - 1:(16 >> stg) * ((2 * seg) + 1)] = {((((16 >> stg) * ((2 * seg) + 2)) - 1) >= ((16 >> stg) * ((2 * seg) + 1)) ? ((((16 >> stg) * ((2 * seg) + 2)) - 1) - ((16 >> stg) * ((2 * seg) + 1))) + 1 : (((16 >> stg) * ((2 * seg) + 1)) - (((16 >> stg) * ((2 * seg) + 2)) - 1)) + 1) {1'sb0}};
					end
				end
				for (stg = 0; stg < 5; stg = stg + 1) begin : gen_butterfly_not
					assign butterfly_mask_not[stg] = ~(butterfly_mask_l[stg] | butterfly_mask_r[stg]);
				end
				always @(*) begin
					butterfly_result = operand_a_i;
					butterfly_result = ((butterfly_result & butterfly_mask_not[0]) | ((butterfly_result & butterfly_mask_l[0]) >> 16)) | ((butterfly_result & butterfly_mask_r[0]) << 16);
					butterfly_result = ((butterfly_result & butterfly_mask_not[1]) | ((butterfly_result & butterfly_mask_l[1]) >> 8)) | ((butterfly_result & butterfly_mask_r[1]) << 8);
					butterfly_result = ((butterfly_result & butterfly_mask_not[2]) | ((butterfly_result & butterfly_mask_l[2]) >> 4)) | ((butterfly_result & butterfly_mask_r[2]) << 4);
					butterfly_result = ((butterfly_result & butterfly_mask_not[3]) | ((butterfly_result & butterfly_mask_l[3]) >> 2)) | ((butterfly_result & butterfly_mask_r[3]) << 2);
					butterfly_result = ((butterfly_result & butterfly_mask_not[4]) | ((butterfly_result & butterfly_mask_l[4]) >> 1)) | ((butterfly_result & butterfly_mask_r[4]) << 1);
					butterfly_result = butterfly_result & operand_b_i;
				end
				always @(*) begin
					invbutterfly_result = operand_a_i & operand_b_i;
					invbutterfly_result = ((invbutterfly_result & butterfly_mask_not[4]) | ((invbutterfly_result & butterfly_mask_l[4]) >> 1)) | ((invbutterfly_result & butterfly_mask_r[4]) << 1);
					invbutterfly_result = ((invbutterfly_result & butterfly_mask_not[3]) | ((invbutterfly_result & butterfly_mask_l[3]) >> 2)) | ((invbutterfly_result & butterfly_mask_r[3]) << 2);
					invbutterfly_result = ((invbutterfly_result & butterfly_mask_not[2]) | ((invbutterfly_result & butterfly_mask_l[2]) >> 4)) | ((invbutterfly_result & butterfly_mask_r[2]) << 4);
					invbutterfly_result = ((invbutterfly_result & butterfly_mask_not[1]) | ((invbutterfly_result & butterfly_mask_l[1]) >> 8)) | ((invbutterfly_result & butterfly_mask_r[1]) << 8);
					invbutterfly_result = ((invbutterfly_result & butterfly_mask_not[0]) | ((invbutterfly_result & butterfly_mask_l[0]) >> 16)) | ((invbutterfly_result & butterfly_mask_r[0]) << 16);
				end
				wire clmul_rmode;
				wire clmul_hmode;
				reg [31:0] clmul_op_a;
				reg [31:0] clmul_op_b;
				wire [31:0] operand_b_rev;
				wire [31:0] clmul_and_stage [0:31];
				wire [31:0] clmul_xor_stage1 [0:15];
				wire [31:0] clmul_xor_stage2 [0:7];
				wire [31:0] clmul_xor_stage3 [0:3];
				wire [31:0] clmul_xor_stage4 [0:1];
				wire [31:0] clmul_result_raw;
				for (i = 0; i < 32; i = i + 1) begin : gen_rev_operand_b
					assign operand_b_rev[i] = operand_b_i[31 - i];
				end
				assign clmul_rmode = operator_i == ibex_pkg_ALU_CLMULR;
				assign clmul_hmode = operator_i == ibex_pkg_ALU_CLMULH;
				localparam [31:0] CRC32_POLYNOMIAL = 32'h04c11db7;
				localparam [31:0] CRC32_MU_REV = 32'hf7011641;
				localparam [31:0] CRC32C_POLYNOMIAL = 32'h1edc6f41;
				localparam [31:0] CRC32C_MU_REV = 32'hdea713f1;
				wire crc_op;
				wire crc_cpoly;
				reg [31:0] crc_operand;
				wire [31:0] crc_poly;
				wire [31:0] crc_mu_rev;
				assign crc_op = (((((operator_i == ibex_pkg_ALU_CRC32C_W) | (operator_i == ibex_pkg_ALU_CRC32_W)) | (operator_i == ibex_pkg_ALU_CRC32C_H)) | (operator_i == ibex_pkg_ALU_CRC32_H)) | (operator_i == ibex_pkg_ALU_CRC32C_B)) | (operator_i == ibex_pkg_ALU_CRC32_B);
				assign crc_cpoly = ((operator_i == ibex_pkg_ALU_CRC32C_W) | (operator_i == ibex_pkg_ALU_CRC32C_H)) | (operator_i == ibex_pkg_ALU_CRC32C_B);
				assign crc_hmode = (operator_i == ibex_pkg_ALU_CRC32_H) | (operator_i == ibex_pkg_ALU_CRC32C_H);
				assign crc_bmode = (operator_i == ibex_pkg_ALU_CRC32_B) | (operator_i == ibex_pkg_ALU_CRC32C_B);
				assign crc_poly = (crc_cpoly ? CRC32C_POLYNOMIAL : CRC32_POLYNOMIAL);
				assign crc_mu_rev = (crc_cpoly ? CRC32C_MU_REV : CRC32_MU_REV);
				always @(*)
					case (1'b1)
						crc_bmode: crc_operand = {operand_a_i[7:0], 24'h000000};
						crc_hmode: crc_operand = {operand_a_i[15:0], 16'h0000};
						default: crc_operand = operand_a_i;
					endcase
				always @(*)
					if (crc_op) begin
						clmul_op_a = (instr_first_cycle_i ? crc_operand : imd_val_q_i[32+:32]);
						clmul_op_b = (instr_first_cycle_i ? crc_mu_rev : crc_poly);
					end
					else begin
						clmul_op_a = (clmul_rmode | clmul_hmode ? operand_a_rev : operand_a_i);
						clmul_op_b = (clmul_rmode | clmul_hmode ? operand_b_rev : operand_b_i);
					end
				for (i = 0; i < 32; i = i + 1) begin : gen_clmul_and_op
					assign clmul_and_stage[i] = (clmul_op_b[i] ? clmul_op_a << i : {32 {1'sb0}});
				end
				for (i = 0; i < 16; i = i + 1) begin : gen_clmul_xor_op_l1
					assign clmul_xor_stage1[i] = clmul_and_stage[2 * i] ^ clmul_and_stage[(2 * i) + 1];
				end
				for (i = 0; i < 8; i = i + 1) begin : gen_clmul_xor_op_l2
					assign clmul_xor_stage2[i] = clmul_xor_stage1[2 * i] ^ clmul_xor_stage1[(2 * i) + 1];
				end
				for (i = 0; i < 4; i = i + 1) begin : gen_clmul_xor_op_l3
					assign clmul_xor_stage3[i] = clmul_xor_stage2[2 * i] ^ clmul_xor_stage2[(2 * i) + 1];
				end
				for (i = 0; i < 2; i = i + 1) begin : gen_clmul_xor_op_l4
					assign clmul_xor_stage4[i] = clmul_xor_stage3[2 * i] ^ clmul_xor_stage3[(2 * i) + 1];
				end
				assign clmul_result_raw = clmul_xor_stage4[0] ^ clmul_xor_stage4[1];
				for (i = 0; i < 32; i = i + 1) begin : gen_rev_clmul_result
					assign clmul_result_rev[i] = clmul_result_raw[31 - i];
				end
				always @(*)
					case (1'b1)
						clmul_rmode: clmul_result = clmul_result_rev;
						clmul_hmode: clmul_result = {1'b0, clmul_result_rev[31:1]};
						default: clmul_result = clmul_result_raw;
					endcase
			end
			else begin : gen_alu_rvb_notfull
				wire [31:0] unused_imd_val_q_1;
				assign unused_imd_val_q_1 = imd_val_q_i[0+:32];
				wire [32:1] sv2v_tmp_8C42B;
				assign sv2v_tmp_8C42B = {32 {1'sb0}};
				always @(*) shuffle_result = sv2v_tmp_8C42B;
				wire [32:1] sv2v_tmp_B0AD4;
				assign sv2v_tmp_B0AD4 = {32 {1'sb0}};
				always @(*) butterfly_result = sv2v_tmp_B0AD4;
				wire [32:1] sv2v_tmp_AFC2C;
				assign sv2v_tmp_AFC2C = {32 {1'sb0}};
				always @(*) invbutterfly_result = sv2v_tmp_AFC2C;
				wire [32:1] sv2v_tmp_3A741;
				assign sv2v_tmp_3A741 = {32 {1'sb0}};
				always @(*) clmul_result = sv2v_tmp_3A741;
				assign bitcnt_partial_lsb_d = {32 {1'sb0}};
				assign bitcnt_partial_msb_d = {32 {1'sb0}};
				assign clmul_result_rev = {32 {1'sb0}};
				assign crc_bmode = 1'b0;
				assign crc_hmode = 1'b0;
			end
			always @(*)
				case (operator_i)
					ibex_pkg_ALU_CMOV: begin
						multicycle_result = (operand_b_i == 32'h00000000 ? operand_a_i : imd_val_q_i[32+:32]);
						imd_val_d_o = {operand_a_i, 32'h00000000};
						if (instr_first_cycle_i)
							imd_val_we_o = 2'b01;
						else
							imd_val_we_o = 2'b00;
					end
					ibex_pkg_ALU_CMIX: begin
						multicycle_result = imd_val_q_i[32+:32] | bwlogic_and_result;
						imd_val_d_o = {bwlogic_and_result, 32'h00000000};
						if (instr_first_cycle_i)
							imd_val_we_o = 2'b01;
						else
							imd_val_we_o = 2'b00;
					end
					ibex_pkg_ALU_FSR, ibex_pkg_ALU_FSL, ibex_pkg_ALU_ROL, ibex_pkg_ALU_ROR: begin
						if (shift_amt[4:0] == 5'h00)
							multicycle_result = (shift_amt[5] ? operand_a_i : imd_val_q_i[32+:32]);
						else
							multicycle_result = imd_val_q_i[32+:32] | shift_result;
						imd_val_d_o = {shift_result, 32'h00000000};
						if (instr_first_cycle_i)
							imd_val_we_o = 2'b01;
						else
							imd_val_we_o = 2'b00;
					end
					ibex_pkg_ALU_CRC32_W, ibex_pkg_ALU_CRC32C_W, ibex_pkg_ALU_CRC32_H, ibex_pkg_ALU_CRC32C_H, ibex_pkg_ALU_CRC32_B, ibex_pkg_ALU_CRC32C_B:
						if (RV32B == ibex_pkg_RV32BFull) begin
							case (1'b1)
								crc_bmode: multicycle_result = clmul_result_rev ^ (operand_a_i >> 8);
								crc_hmode: multicycle_result = clmul_result_rev ^ (operand_a_i >> 16);
								default: multicycle_result = clmul_result_rev;
							endcase
							imd_val_d_o = {clmul_result_rev, 32'h00000000};
							if (instr_first_cycle_i)
								imd_val_we_o = 2'b01;
							else
								imd_val_we_o = 2'b00;
						end
						else begin
							imd_val_d_o = {operand_a_i, 32'h00000000};
							imd_val_we_o = 2'b00;
							multicycle_result = {32 {1'sb0}};
						end
					ibex_pkg_ALU_BEXT, ibex_pkg_ALU_BDEP:
						if (RV32B == ibex_pkg_RV32BFull) begin
							multicycle_result = (operator_i == ibex_pkg_ALU_BDEP ? butterfly_result : invbutterfly_result);
							imd_val_d_o = {bitcnt_partial_lsb_d, bitcnt_partial_msb_d};
							if (instr_first_cycle_i)
								imd_val_we_o = 2'b11;
							else
								imd_val_we_o = 2'b00;
						end
						else begin
							imd_val_d_o = {operand_a_i, 32'h00000000};
							imd_val_we_o = 2'b00;
							multicycle_result = {32 {1'sb0}};
						end
					default: begin
						imd_val_d_o = {operand_a_i, 32'h00000000};
						imd_val_we_o = 2'b00;
						multicycle_result = {32 {1'sb0}};
					end
				endcase
		end
		else begin : g_no_alu_rvb
			wire [63:0] unused_imd_val_q;
			assign unused_imd_val_q = imd_val_q_i;
			wire [31:0] unused_butterfly_result;
			assign unused_butterfly_result = butterfly_result;
			wire [31:0] unused_invbutterfly_result;
			assign unused_invbutterfly_result = invbutterfly_result;
			assign bitcnt_result = {6 {1'sb0}};
			assign minmax_result = {32 {1'sb0}};
			wire [32:1] sv2v_tmp_68181;
			assign sv2v_tmp_68181 = {32 {1'sb0}};
			always @(*) pack_result = sv2v_tmp_68181;
			assign sext_result = {32 {1'sb0}};
			wire [32:1] sv2v_tmp_D756E;
			assign sv2v_tmp_D756E = {32 {1'sb0}};
			always @(*) singlebit_result = sv2v_tmp_D756E;
			wire [32:1] sv2v_tmp_BAAB3;
			assign sv2v_tmp_BAAB3 = {32 {1'sb0}};
			always @(*) rev_result = sv2v_tmp_BAAB3;
			wire [32:1] sv2v_tmp_8C42B;
			assign sv2v_tmp_8C42B = {32 {1'sb0}};
			always @(*) shuffle_result = sv2v_tmp_8C42B;
			wire [32:1] sv2v_tmp_B0AD4;
			assign sv2v_tmp_B0AD4 = {32 {1'sb0}};
			always @(*) butterfly_result = sv2v_tmp_B0AD4;
			wire [32:1] sv2v_tmp_AFC2C;
			assign sv2v_tmp_AFC2C = {32 {1'sb0}};
			always @(*) invbutterfly_result = sv2v_tmp_AFC2C;
			wire [32:1] sv2v_tmp_3A741;
			assign sv2v_tmp_3A741 = {32 {1'sb0}};
			always @(*) clmul_result = sv2v_tmp_3A741;
			wire [32:1] sv2v_tmp_172E8;
			assign sv2v_tmp_172E8 = {32 {1'sb0}};
			always @(*) multicycle_result = sv2v_tmp_172E8;
			wire [64:1] sv2v_tmp_CAB3F;
			assign sv2v_tmp_CAB3F = {2 {32'b00000000000000000000000000000000}};
			always @(*) imd_val_d_o = sv2v_tmp_CAB3F;
			wire [2:1] sv2v_tmp_B65CC;
			assign sv2v_tmp_B65CC = {2 {1'b0}};
			always @(*) imd_val_we_o = sv2v_tmp_B65CC;
		end
	endgenerate
	localparam [5:0] ibex_pkg_ALU_ADD = 0;
	localparam [5:0] ibex_pkg_ALU_CLMUL = 50;
	localparam [5:0] ibex_pkg_ALU_GREV = 15;
	localparam [5:0] ibex_pkg_ALU_PACK = 29;
	localparam [5:0] ibex_pkg_ALU_PCNT = 36;
	localparam [5:0] ibex_pkg_ALU_SBEXT = 46;
	localparam [5:0] ibex_pkg_ALU_SEXTH = 33;
	localparam [5:0] ibex_pkg_ALU_SHFL = 17;
	localparam [5:0] ibex_pkg_ALU_SRL = 9;
	localparam [5:0] ibex_pkg_ALU_XOR = 2;
	always @(*) begin
		result_o = {32 {1'sb0}};
		case (operator_i)
			ibex_pkg_ALU_XOR, ibex_pkg_ALU_XNOR, ibex_pkg_ALU_OR, ibex_pkg_ALU_ORN, ibex_pkg_ALU_AND, ibex_pkg_ALU_ANDN: result_o = bwlogic_result;
			ibex_pkg_ALU_ADD, ibex_pkg_ALU_SUB: result_o = adder_result;
			ibex_pkg_ALU_SLL, ibex_pkg_ALU_SRL, ibex_pkg_ALU_SRA, ibex_pkg_ALU_SLO, ibex_pkg_ALU_SRO: result_o = shift_result;
			ibex_pkg_ALU_SHFL, ibex_pkg_ALU_UNSHFL: result_o = shuffle_result;
			ibex_pkg_ALU_EQ, ibex_pkg_ALU_NE, ibex_pkg_ALU_GE, ibex_pkg_ALU_GEU, ibex_pkg_ALU_LT, ibex_pkg_ALU_LTU, ibex_pkg_ALU_SLT, ibex_pkg_ALU_SLTU: result_o = {31'h00000000, cmp_result};
			ibex_pkg_ALU_MIN, ibex_pkg_ALU_MAX, ibex_pkg_ALU_MINU, ibex_pkg_ALU_MAXU: result_o = minmax_result;
			ibex_pkg_ALU_CLZ, ibex_pkg_ALU_CTZ, ibex_pkg_ALU_PCNT: result_o = {26'h0000000, bitcnt_result};
			ibex_pkg_ALU_PACK, ibex_pkg_ALU_PACKH, ibex_pkg_ALU_PACKU: result_o = pack_result;
			ibex_pkg_ALU_SEXTB, ibex_pkg_ALU_SEXTH: result_o = sext_result;
			ibex_pkg_ALU_CMIX, ibex_pkg_ALU_CMOV, ibex_pkg_ALU_FSL, ibex_pkg_ALU_FSR, ibex_pkg_ALU_ROL, ibex_pkg_ALU_ROR, ibex_pkg_ALU_CRC32_W, ibex_pkg_ALU_CRC32C_W, ibex_pkg_ALU_CRC32_H, ibex_pkg_ALU_CRC32C_H, ibex_pkg_ALU_CRC32_B, ibex_pkg_ALU_CRC32C_B, ibex_pkg_ALU_BEXT, ibex_pkg_ALU_BDEP: result_o = multicycle_result;
			ibex_pkg_ALU_SBSET, ibex_pkg_ALU_SBCLR, ibex_pkg_ALU_SBINV, ibex_pkg_ALU_SBEXT: result_o = singlebit_result;
			ibex_pkg_ALU_GREV, ibex_pkg_ALU_GORC: result_o = rev_result;
			ibex_pkg_ALU_BFP: result_o = bfp_result;
			ibex_pkg_ALU_CLMUL, ibex_pkg_ALU_CLMULR, ibex_pkg_ALU_CLMULH: result_o = clmul_result;
			default:
				;
		endcase
	end
	wire unused_shift_amt_compl;
	assign unused_shift_amt_compl = shift_amt_compl[5];
endmodule
module ibex_branch_predict (
	clk_i,
	rst_ni,
	fetch_rdata_i,
	fetch_pc_i,
	fetch_valid_i,
	predict_branch_taken_o,
	predict_branch_pc_o
);
	input wire clk_i;
	input wire rst_ni;
	input wire [31:0] fetch_rdata_i;
	input wire [31:0] fetch_pc_i;
	input wire fetch_valid_i;
	output wire predict_branch_taken_o;
	output wire [31:0] predict_branch_pc_o;
	wire [31:0] imm_j_type;
	wire [31:0] imm_b_type;
	wire [31:0] imm_cj_type;
	wire [31:0] imm_cb_type;
	reg [31:0] branch_imm;
	wire [31:0] instr;
	wire instr_j;
	wire instr_b;
	wire instr_cj;
	wire instr_cb;
	wire instr_b_taken;
	assign instr = fetch_rdata_i;
	assign imm_j_type = {{12 {instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
	assign imm_b_type = {{19 {instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
	assign imm_cj_type = {{20 {instr[12]}}, instr[12], instr[8], instr[10:9], instr[6], instr[7], instr[2], instr[11], instr[5:3], 1'b0};
	assign imm_cb_type = {{23 {instr[12]}}, instr[12], instr[6:5], instr[2], instr[11:10], instr[4:3], 1'b0};
	localparam [6:0] ibex_pkg_OPCODE_BRANCH = 7'h63;
	assign instr_b = instr[6:0] == ibex_pkg_OPCODE_BRANCH;
	localparam [6:0] ibex_pkg_OPCODE_JAL = 7'h6f;
	assign instr_j = instr[6:0] == ibex_pkg_OPCODE_JAL;
	assign instr_cb = (instr[1:0] == 2'b01) & ((instr[15:13] == 3'b110) | (instr[15:13] == 3'b111));
	assign instr_cj = (instr[1:0] == 2'b01) & ((instr[15:13] == 3'b101) | (instr[15:13] == 3'b001));
	always @(*) begin
		branch_imm = imm_b_type;
		case (1'b1)
			instr_j: branch_imm = imm_j_type;
			instr_b: branch_imm = imm_b_type;
			instr_cj: branch_imm = imm_cj_type;
			instr_cb: branch_imm = imm_cb_type;
			default:
				;
		endcase
	end
	assign instr_b_taken = (instr_b & imm_b_type[31]) | (instr_cb & imm_cb_type[31]);
	assign predict_branch_taken_o = fetch_valid_i & ((instr_j | instr_cj) | instr_b_taken);
	assign predict_branch_pc_o = fetch_pc_i + branch_imm;
endmodule
module ibex_compressed_decoder (
	clk_i,
	rst_ni,
	valid_i,
	instr_i,
	instr_o,
	is_compressed_o,
	illegal_instr_o
);
	input wire clk_i;
	input wire rst_ni;
	input wire valid_i;
	input wire [31:0] instr_i;
	output reg [31:0] instr_o;
	output wire is_compressed_o;
	output reg illegal_instr_o;
	wire unused_valid;
	assign unused_valid = valid_i;
	localparam [6:0] ibex_pkg_OPCODE_BRANCH = 7'h63;
	localparam [6:0] ibex_pkg_OPCODE_JAL = 7'h6f;
	localparam [6:0] ibex_pkg_OPCODE_JALR = 7'h67;
	localparam [6:0] ibex_pkg_OPCODE_LOAD = 7'h03;
	localparam [6:0] ibex_pkg_OPCODE_LUI = 7'h37;
	localparam [6:0] ibex_pkg_OPCODE_OP = 7'h33;
	localparam [6:0] ibex_pkg_OPCODE_OP_IMM = 7'h13;
	localparam [6:0] ibex_pkg_OPCODE_STORE = 7'h23;
	always @(*) begin
		instr_o = instr_i;
		illegal_instr_o = 1'b0;
		case (instr_i[1:0])
			2'b00:
				case (instr_i[15:13])
					3'b000: begin
						instr_o = {2'b00, instr_i[10:7], instr_i[12:11], instr_i[5], instr_i[6], 2'b00, 5'h02, 3'b000, 2'b01, instr_i[4:2], {ibex_pkg_OPCODE_OP_IMM}};
						if (instr_i[12:5] == 8'b00000000)
							illegal_instr_o = 1'b1;
					end
					3'b010: instr_o = {5'b00000, instr_i[5], instr_i[12:10], instr_i[6], 2'b00, 2'b01, instr_i[9:7], 3'b010, 2'b01, instr_i[4:2], {ibex_pkg_OPCODE_LOAD}};
					3'b110: instr_o = {5'b00000, instr_i[5], instr_i[12], 2'b01, instr_i[4:2], 2'b01, instr_i[9:7], 3'b010, instr_i[11:10], instr_i[6], 2'b00, {ibex_pkg_OPCODE_STORE}};
					3'b001, 3'b011, 3'b100, 3'b101, 3'b111: illegal_instr_o = 1'b1;
					default: illegal_instr_o = 1'b1;
				endcase
			2'b01:
				case (instr_i[15:13])
					3'b000: instr_o = {{6 {instr_i[12]}}, instr_i[12], instr_i[6:2], instr_i[11:7], 3'b000, instr_i[11:7], {ibex_pkg_OPCODE_OP_IMM}};
					3'b001, 3'b101: instr_o = {instr_i[12], instr_i[8], instr_i[10:9], instr_i[6], instr_i[7], instr_i[2], instr_i[11], instr_i[5:3], {9 {instr_i[12]}}, 4'b0000, ~instr_i[15], {ibex_pkg_OPCODE_JAL}};
					3'b010: instr_o = {{6 {instr_i[12]}}, instr_i[12], instr_i[6:2], 5'b00000, 3'b000, instr_i[11:7], {ibex_pkg_OPCODE_OP_IMM}};
					3'b011: begin
						instr_o = {{15 {instr_i[12]}}, instr_i[6:2], instr_i[11:7], {ibex_pkg_OPCODE_LUI}};
						if (instr_i[11:7] == 5'h02)
							instr_o = {{3 {instr_i[12]}}, instr_i[4:3], instr_i[5], instr_i[2], instr_i[6], 4'b0000, 5'h02, 3'b000, 5'h02, {ibex_pkg_OPCODE_OP_IMM}};
						if ({instr_i[12], instr_i[6:2]} == 6'b000000)
							illegal_instr_o = 1'b1;
					end
					3'b100:
						case (instr_i[11:10])
							2'b00, 2'b01: begin
								instr_o = {1'b0, instr_i[10], 5'b00000, instr_i[6:2], 2'b01, instr_i[9:7], 3'b101, 2'b01, instr_i[9:7], {ibex_pkg_OPCODE_OP_IMM}};
								if (instr_i[12] == 1'b1)
									illegal_instr_o = 1'b1;
							end
							2'b10: instr_o = {{6 {instr_i[12]}}, instr_i[12], instr_i[6:2], 2'b01, instr_i[9:7], 3'b111, 2'b01, instr_i[9:7], {ibex_pkg_OPCODE_OP_IMM}};
							2'b11:
								case ({instr_i[12], instr_i[6:5]})
									3'b000: instr_o = {2'b01, 5'b00000, 2'b01, instr_i[4:2], 2'b01, instr_i[9:7], 3'b000, 2'b01, instr_i[9:7], {ibex_pkg_OPCODE_OP}};
									3'b001: instr_o = {7'b0000000, 2'b01, instr_i[4:2], 2'b01, instr_i[9:7], 3'b100, 2'b01, instr_i[9:7], {ibex_pkg_OPCODE_OP}};
									3'b010: instr_o = {7'b0000000, 2'b01, instr_i[4:2], 2'b01, instr_i[9:7], 3'b110, 2'b01, instr_i[9:7], {ibex_pkg_OPCODE_OP}};
									3'b011: instr_o = {7'b0000000, 2'b01, instr_i[4:2], 2'b01, instr_i[9:7], 3'b111, 2'b01, instr_i[9:7], {ibex_pkg_OPCODE_OP}};
									3'b100, 3'b101, 3'b110, 3'b111: illegal_instr_o = 1'b1;
									default: illegal_instr_o = 1'b1;
								endcase
							default: illegal_instr_o = 1'b1;
						endcase
					3'b110, 3'b111: instr_o = {{4 {instr_i[12]}}, instr_i[6:5], instr_i[2], 5'b00000, 2'b01, instr_i[9:7], 2'b00, instr_i[13], instr_i[11:10], instr_i[4:3], instr_i[12], {ibex_pkg_OPCODE_BRANCH}};
					default: illegal_instr_o = 1'b1;
				endcase
			2'b10:
				case (instr_i[15:13])
					3'b000: begin
						instr_o = {7'b0000000, instr_i[6:2], instr_i[11:7], 3'b001, instr_i[11:7], {ibex_pkg_OPCODE_OP_IMM}};
						if (instr_i[12] == 1'b1)
							illegal_instr_o = 1'b1;
					end
					3'b010: begin
						instr_o = {4'b0000, instr_i[3:2], instr_i[12], instr_i[6:4], 2'b00, 5'h02, 3'b010, instr_i[11:7], ibex_pkg_OPCODE_LOAD};
						if (instr_i[11:7] == 5'b00000)
							illegal_instr_o = 1'b1;
					end
					3'b100:
						if (instr_i[12] == 1'b0) begin
							if (instr_i[6:2] != 5'b00000)
								instr_o = {7'b0000000, instr_i[6:2], 5'b00000, 3'b000, instr_i[11:7], {ibex_pkg_OPCODE_OP}};
							else begin
								instr_o = {12'b000000000000, instr_i[11:7], 3'b000, 5'b00000, {ibex_pkg_OPCODE_JALR}};
								if (instr_i[11:7] == 5'b00000)
									illegal_instr_o = 1'b1;
							end
						end
						else if (instr_i[6:2] != 5'b00000)
							instr_o = {7'b0000000, instr_i[6:2], instr_i[11:7], 3'b000, instr_i[11:7], {ibex_pkg_OPCODE_OP}};
						else if (instr_i[11:7] == 5'b00000)
							instr_o = 32'h00100073;
						else
							instr_o = {12'b000000000000, instr_i[11:7], 3'b000, 5'b00001, {ibex_pkg_OPCODE_JALR}};
					3'b110: instr_o = {4'b0000, instr_i[8:7], instr_i[12], instr_i[6:2], 5'h02, 3'b010, instr_i[11:9], 2'b00, {ibex_pkg_OPCODE_STORE}};
					3'b001, 3'b011, 3'b101, 3'b111: illegal_instr_o = 1'b1;
					default: illegal_instr_o = 1'b1;
				endcase
			2'b11:
				;
			default: illegal_instr_o = 1'b1;
		endcase
	end
	assign is_compressed_o = instr_i[1:0] != 2'b11;
endmodule
module ibex_controller (
	clk_i,
	rst_ni,
	ctrl_busy_o,
	illegal_insn_i,
	ecall_insn_i,
	mret_insn_i,
	dret_insn_i,
	wfi_insn_i,
	ebrk_insn_i,
	csr_pipe_flush_i,
	instr_valid_i,
	instr_i,
	instr_compressed_i,
	instr_is_compressed_i,
	instr_bp_taken_i,
	instr_fetch_err_i,
	instr_fetch_err_plus2_i,
	pc_id_i,
	instr_valid_clear_o,
	id_in_ready_o,
	controller_run_o,
	instr_req_o,
	pc_set_o,
	pc_set_spec_o,
	pc_mux_o,
	nt_branch_mispredict_o,
	exc_pc_mux_o,
	exc_cause_o,
	lsu_addr_last_i,
	load_err_i,
	store_err_i,
	wb_exception_o,
	branch_set_i,
	branch_set_spec_i,
	branch_not_set_i,
	jump_set_i,
	csr_mstatus_mie_i,
	irq_pending_i,
	irqs_i,
	irq_nm_i,
	nmi_mode_o,
	debug_req_i,
	debug_cause_o,
	debug_csr_save_o,
	debug_mode_o,
	debug_single_step_i,
	debug_ebreakm_i,
	debug_ebreaku_i,
	trigger_match_i,
	csr_save_if_o,
	csr_save_id_o,
	csr_save_wb_o,
	csr_restore_mret_id_o,
	csr_restore_dret_id_o,
	csr_save_cause_o,
	csr_mtval_o,
	priv_mode_i,
	csr_mstatus_tw_i,
	stall_id_i,
	stall_wb_i,
	flush_id_o,
	ready_wb_i,
	perf_jump_o,
	perf_tbranch_o
);
	parameter [0:0] WritebackStage = 0;
	parameter [0:0] BranchPredictor = 0;
	input wire clk_i;
	input wire rst_ni;
	output reg ctrl_busy_o;
	input wire illegal_insn_i;
	input wire ecall_insn_i;
	input wire mret_insn_i;
	input wire dret_insn_i;
	input wire wfi_insn_i;
	input wire ebrk_insn_i;
	input wire csr_pipe_flush_i;
	input wire instr_valid_i;
	input wire [31:0] instr_i;
	input wire [15:0] instr_compressed_i;
	input wire instr_is_compressed_i;
	input wire instr_bp_taken_i;
	input wire instr_fetch_err_i;
	input wire instr_fetch_err_plus2_i;
	input wire [31:0] pc_id_i;
	output wire instr_valid_clear_o;
	output wire id_in_ready_o;
	output reg controller_run_o;
	output reg instr_req_o;
	output reg pc_set_o;
	output reg pc_set_spec_o;
	output reg [2:0] pc_mux_o;
	output reg nt_branch_mispredict_o;
	output reg [1:0] exc_pc_mux_o;
	output reg [5:0] exc_cause_o;
	input wire [31:0] lsu_addr_last_i;
	input wire load_err_i;
	input wire store_err_i;
	output wire wb_exception_o;
	input wire branch_set_i;
	input wire branch_set_spec_i;
	input wire branch_not_set_i;
	input wire jump_set_i;
	input wire csr_mstatus_mie_i;
	input wire irq_pending_i;
	input wire [17:0] irqs_i;
	input wire irq_nm_i;
	output wire nmi_mode_o;
	input wire debug_req_i;
	output reg [2:0] debug_cause_o;
	output reg debug_csr_save_o;
	output wire debug_mode_o;
	input wire debug_single_step_i;
	input wire debug_ebreakm_i;
	input wire debug_ebreaku_i;
	input wire trigger_match_i;
	output reg csr_save_if_o;
	output reg csr_save_id_o;
	output reg csr_save_wb_o;
	output reg csr_restore_mret_id_o;
	output reg csr_restore_dret_id_o;
	output reg csr_save_cause_o;
	output reg [31:0] csr_mtval_o;
	input wire [1:0] priv_mode_i;
	input wire csr_mstatus_tw_i;
	input wire stall_id_i;
	input wire stall_wb_i;
	output wire flush_id_o;
	input wire ready_wb_i;
	output reg perf_jump_o;
	output reg perf_tbranch_o;
	reg [3:0] ctrl_fsm_cs;
	reg [3:0] ctrl_fsm_ns;
	reg nmi_mode_q;
	reg nmi_mode_d;
	reg debug_mode_q;
	reg debug_mode_d;
	reg load_err_q;
	wire load_err_d;
	reg store_err_q;
	wire store_err_d;
	reg exc_req_q;
	wire exc_req_d;
	reg illegal_insn_q;
	wire illegal_insn_d;
	reg instr_fetch_err_prio;
	reg illegal_insn_prio;
	reg ecall_insn_prio;
	reg ebrk_insn_prio;
	reg store_err_prio;
	reg load_err_prio;
	wire stall;
	reg halt_if;
	reg retain_id;
	reg flush_id;
	wire illegal_dret;
	wire illegal_umode;
	wire exc_req_lsu;
	wire special_req_all;
	wire special_req_branch;
	wire enter_debug_mode;
	wire ebreak_into_debug;
	wire handle_irq;
	reg [3:0] mfip_id;
	wire unused_irq_timer;
	wire ecall_insn;
	wire mret_insn;
	wire dret_insn;
	wire wfi_insn;
	wire ebrk_insn;
	wire csr_pipe_flush;
	wire instr_fetch_err;
	assign load_err_d = load_err_i;
	assign store_err_d = store_err_i;
	assign ecall_insn = ecall_insn_i & instr_valid_i;
	assign mret_insn = mret_insn_i & instr_valid_i;
	assign dret_insn = dret_insn_i & instr_valid_i;
	assign wfi_insn = wfi_insn_i & instr_valid_i;
	assign ebrk_insn = ebrk_insn_i & instr_valid_i;
	assign csr_pipe_flush = csr_pipe_flush_i & instr_valid_i;
	assign instr_fetch_err = instr_fetch_err_i & instr_valid_i;
	assign illegal_dret = dret_insn & ~debug_mode_q;
	localparam [1:0] ibex_pkg_PRIV_LVL_M = 2'b11;
	assign illegal_umode = (priv_mode_i != ibex_pkg_PRIV_LVL_M) & (mret_insn | (csr_mstatus_tw_i & wfi_insn));
	localparam [3:0] FLUSH = 6;
	assign illegal_insn_d = ((illegal_insn_i | illegal_dret) | illegal_umode) & (ctrl_fsm_cs != FLUSH);
	assign exc_req_d = (((ecall_insn | ebrk_insn) | illegal_insn_d) | instr_fetch_err) & (ctrl_fsm_cs != FLUSH);
	assign exc_req_lsu = store_err_i | load_err_i;
	assign special_req_all = ((((mret_insn | dret_insn) | wfi_insn) | csr_pipe_flush) | exc_req_d) | exc_req_lsu;
	assign special_req_branch = instr_fetch_err & (ctrl_fsm_cs != FLUSH);
	generate
		if (WritebackStage) begin : g_wb_exceptions
			always @(*) begin
				instr_fetch_err_prio = 0;
				illegal_insn_prio = 0;
				ecall_insn_prio = 0;
				ebrk_insn_prio = 0;
				store_err_prio = 0;
				load_err_prio = 0;
				if (store_err_q)
					store_err_prio = 1'b1;
				else if (load_err_q)
					load_err_prio = 1'b1;
				else if (instr_fetch_err)
					instr_fetch_err_prio = 1'b1;
				else if (illegal_insn_q)
					illegal_insn_prio = 1'b1;
				else if (ecall_insn)
					ecall_insn_prio = 1'b1;
				else if (ebrk_insn)
					ebrk_insn_prio = 1'b1;
			end
			assign wb_exception_o = ((load_err_q | store_err_q) | load_err_i) | store_err_i;
		end
		else begin : g_no_wb_exceptions
			always @(*) begin
				instr_fetch_err_prio = 0;
				illegal_insn_prio = 0;
				ecall_insn_prio = 0;
				ebrk_insn_prio = 0;
				store_err_prio = 0;
				load_err_prio = 0;
				if (instr_fetch_err)
					instr_fetch_err_prio = 1'b1;
				else if (illegal_insn_q)
					illegal_insn_prio = 1'b1;
				else if (ecall_insn)
					ecall_insn_prio = 1'b1;
				else if (ebrk_insn)
					ebrk_insn_prio = 1'b1;
				else if (store_err_q)
					store_err_prio = 1'b1;
				else if (load_err_q)
					load_err_prio = 1'b1;
			end
			assign wb_exception_o = 1'b0;
		end
	endgenerate
	assign enter_debug_mode = ((debug_req_i | (debug_single_step_i & instr_valid_i)) | trigger_match_i) & ~debug_mode_q;
	localparam [1:0] ibex_pkg_PRIV_LVL_U = 2'b00;
	assign ebreak_into_debug = (priv_mode_i == ibex_pkg_PRIV_LVL_M ? debug_ebreakm_i : (priv_mode_i == ibex_pkg_PRIV_LVL_U ? debug_ebreaku_i : 1'b0));
	assign handle_irq = (~debug_mode_q & ~nmi_mode_q) & (irq_nm_i | (irq_pending_i & csr_mstatus_mie_i));
	always @(*) begin : gen_mfip_id
		if (irqs_i[14])
			mfip_id = 4'd14;
		else if (irqs_i[13])
			mfip_id = 4'd13;
		else if (irqs_i[12])
			mfip_id = 4'd12;
		else if (irqs_i[11])
			mfip_id = 4'd11;
		else if (irqs_i[10])
			mfip_id = 4'd10;
		else if (irqs_i[9])
			mfip_id = 4'd9;
		else if (irqs_i[8])
			mfip_id = 4'd8;
		else if (irqs_i[7])
			mfip_id = 4'd7;
		else if (irqs_i[6])
			mfip_id = 4'd6;
		else if (irqs_i[5])
			mfip_id = 4'd5;
		else if (irqs_i[4])
			mfip_id = 4'd4;
		else if (irqs_i[3])
			mfip_id = 4'd3;
		else if (irqs_i[2])
			mfip_id = 4'd2;
		else if (irqs_i[1])
			mfip_id = 4'd1;
		else
			mfip_id = 4'd0;
	end
	assign unused_irq_timer = irqs_i[16];
	localparam [3:0] BOOT_SET = 1;
	localparam [3:0] DBG_TAKEN_ID = 9;
	localparam [3:0] DBG_TAKEN_IF = 8;
	localparam [3:0] DECODE = 5;
	localparam [3:0] FIRST_FETCH = 4;
	localparam [3:0] IRQ_TAKEN = 7;
	localparam [3:0] RESET = 0;
	localparam [3:0] SLEEP = 3;
	localparam [3:0] WAIT_SLEEP = 2;
	localparam [2:0] ibex_pkg_DBG_CAUSE_EBREAK = 3'h1;
	localparam [2:0] ibex_pkg_DBG_CAUSE_HALTREQ = 3'h3;
	localparam [2:0] ibex_pkg_DBG_CAUSE_STEP = 3'h4;
	localparam [2:0] ibex_pkg_DBG_CAUSE_TRIGGER = 3'h2;
	localparam [5:0] ibex_pkg_EXC_CAUSE_BREAKPOINT = {1'b0, 5'd3};
	localparam [5:0] ibex_pkg_EXC_CAUSE_ECALL_MMODE = {1'b0, 5'd11};
	localparam [5:0] ibex_pkg_EXC_CAUSE_ECALL_UMODE = {1'b0, 5'd8};
	localparam [5:0] ibex_pkg_EXC_CAUSE_ILLEGAL_INSN = {1'b0, 5'd2};
	localparam [5:0] ibex_pkg_EXC_CAUSE_INSN_ADDR_MISA = {1'b0, 5'd0};
	localparam [5:0] ibex_pkg_EXC_CAUSE_INSTR_ACCESS_FAULT = {1'b0, 5'd1};
	localparam [5:0] ibex_pkg_EXC_CAUSE_IRQ_EXTERNAL_M = {1'b1, 5'd11};
	localparam [5:0] ibex_pkg_EXC_CAUSE_IRQ_NM = {1'b1, 5'd31};
	localparam [5:0] ibex_pkg_EXC_CAUSE_IRQ_SOFTWARE_M = {1'b1, 5'd3};
	localparam [5:0] ibex_pkg_EXC_CAUSE_IRQ_TIMER_M = {1'b1, 5'd7};
	localparam [5:0] ibex_pkg_EXC_CAUSE_LOAD_ACCESS_FAULT = {1'b0, 5'd5};
	localparam [5:0] ibex_pkg_EXC_CAUSE_STORE_ACCESS_FAULT = {1'b0, 5'd7};
	localparam [1:0] ibex_pkg_EXC_PC_DBD = 2;
	localparam [1:0] ibex_pkg_EXC_PC_DBG_EXC = 3;
	localparam [1:0] ibex_pkg_EXC_PC_EXC = 0;
	localparam [1:0] ibex_pkg_EXC_PC_IRQ = 1;
	localparam [2:0] ibex_pkg_PC_BOOT = 0;
	localparam [2:0] ibex_pkg_PC_DRET = 4;
	localparam [2:0] ibex_pkg_PC_ERET = 3;
	localparam [2:0] ibex_pkg_PC_EXC = 2;
	localparam [2:0] ibex_pkg_PC_JUMP = 1;
	function automatic [5:0] sv2v_cast_6;
		input reg [5:0] inp;
		sv2v_cast_6 = inp;
	endfunction
	always @(*) begin
		instr_req_o = 1'b1;
		csr_save_if_o = 1'b0;
		csr_save_id_o = 1'b0;
		csr_save_wb_o = 1'b0;
		csr_restore_mret_id_o = 1'b0;
		csr_restore_dret_id_o = 1'b0;
		csr_save_cause_o = 1'b0;
		csr_mtval_o = {32 {1'sb0}};
		pc_mux_o = ibex_pkg_PC_BOOT;
		pc_set_o = 1'b0;
		pc_set_spec_o = 1'b0;
		nt_branch_mispredict_o = 1'b0;
		exc_pc_mux_o = ibex_pkg_EXC_PC_IRQ;
		exc_cause_o = ibex_pkg_EXC_CAUSE_INSN_ADDR_MISA;
		ctrl_fsm_ns = ctrl_fsm_cs;
		ctrl_busy_o = 1'b1;
		halt_if = 1'b0;
		retain_id = 1'b0;
		flush_id = 1'b0;
		debug_csr_save_o = 1'b0;
		debug_cause_o = ibex_pkg_DBG_CAUSE_EBREAK;
		debug_mode_d = debug_mode_q;
		nmi_mode_d = nmi_mode_q;
		perf_tbranch_o = 1'b0;
		perf_jump_o = 1'b0;
		controller_run_o = 1'b0;
		case (ctrl_fsm_cs)
			RESET: begin
				instr_req_o = 1'b0;
				pc_mux_o = ibex_pkg_PC_BOOT;
				pc_set_o = 1'b1;
				pc_set_spec_o = 1'b1;
				ctrl_fsm_ns = BOOT_SET;
			end
			BOOT_SET: begin
				instr_req_o = 1'b1;
				pc_mux_o = ibex_pkg_PC_BOOT;
				pc_set_o = 1'b1;
				pc_set_spec_o = 1'b1;
				ctrl_fsm_ns = FIRST_FETCH;
			end
			WAIT_SLEEP: begin
				ctrl_busy_o = 1'b0;
				instr_req_o = 1'b0;
				halt_if = 1'b1;
				flush_id = 1'b1;
				ctrl_fsm_ns = SLEEP;
			end
			SLEEP: begin
				instr_req_o = 1'b0;
				halt_if = 1'b1;
				flush_id = 1'b1;
				if ((((irq_nm_i || irq_pending_i) || debug_req_i) || debug_mode_q) || debug_single_step_i)
					ctrl_fsm_ns = FIRST_FETCH;
				else
					ctrl_busy_o = 1'b0;
			end
			FIRST_FETCH: begin
				if (id_in_ready_o)
					ctrl_fsm_ns = DECODE;
				if (handle_irq) begin
					ctrl_fsm_ns = IRQ_TAKEN;
					halt_if = 1'b1;
				end
				if (enter_debug_mode) begin
					ctrl_fsm_ns = DBG_TAKEN_IF;
					halt_if = 1'b1;
				end
			end
			DECODE: begin
				controller_run_o = 1'b1;
				pc_mux_o = ibex_pkg_PC_JUMP;
				if (special_req_all) begin
					retain_id = 1'b1;
					if (ready_wb_i | wb_exception_o)
						ctrl_fsm_ns = FLUSH;
				end
				if (!special_req_branch) begin
					if (branch_set_i || jump_set_i) begin
						pc_set_o = (BranchPredictor ? ~instr_bp_taken_i : 1'b1);
						perf_tbranch_o = branch_set_i;
						perf_jump_o = jump_set_i;
					end
					if (BranchPredictor)
						if (instr_bp_taken_i & branch_not_set_i)
							nt_branch_mispredict_o = 1'b1;
				end
				if ((branch_set_spec_i || jump_set_i) && !special_req_branch)
					pc_set_spec_o = (BranchPredictor ? ~instr_bp_taken_i : 1'b1);
				if ((enter_debug_mode || handle_irq) && stall)
					halt_if = 1'b1;
				if (!stall && !special_req_all)
					if (enter_debug_mode) begin
						ctrl_fsm_ns = DBG_TAKEN_IF;
						halt_if = 1'b1;
					end
					else if (handle_irq) begin
						ctrl_fsm_ns = IRQ_TAKEN;
						halt_if = 1'b1;
					end
			end
			IRQ_TAKEN: begin
				pc_mux_o = ibex_pkg_PC_EXC;
				exc_pc_mux_o = ibex_pkg_EXC_PC_IRQ;
				if (handle_irq) begin
					pc_set_o = 1'b1;
					pc_set_spec_o = 1'b1;
					csr_save_if_o = 1'b1;
					csr_save_cause_o = 1'b1;
					if (irq_nm_i && !nmi_mode_q) begin
						exc_cause_o = ibex_pkg_EXC_CAUSE_IRQ_NM;
						nmi_mode_d = 1'b1;
					end
					else if (irqs_i[14-:15] != 15'b000000000000000)
						exc_cause_o = sv2v_cast_6({2'b11, mfip_id});
					else if (irqs_i[15])
						exc_cause_o = ibex_pkg_EXC_CAUSE_IRQ_EXTERNAL_M;
					else if (irqs_i[17])
						exc_cause_o = ibex_pkg_EXC_CAUSE_IRQ_SOFTWARE_M;
					else
						exc_cause_o = ibex_pkg_EXC_CAUSE_IRQ_TIMER_M;
				end
				ctrl_fsm_ns = DECODE;
			end
			DBG_TAKEN_IF: begin
				pc_mux_o = ibex_pkg_PC_EXC;
				exc_pc_mux_o = ibex_pkg_EXC_PC_DBD;
				if ((debug_single_step_i || debug_req_i) || trigger_match_i) begin
					flush_id = 1'b1;
					pc_set_o = 1'b1;
					pc_set_spec_o = 1'b1;
					csr_save_if_o = 1'b1;
					debug_csr_save_o = 1'b1;
					csr_save_cause_o = 1'b1;
					if (trigger_match_i)
						debug_cause_o = ibex_pkg_DBG_CAUSE_TRIGGER;
					else if (debug_single_step_i)
						debug_cause_o = ibex_pkg_DBG_CAUSE_STEP;
					else
						debug_cause_o = ibex_pkg_DBG_CAUSE_HALTREQ;
					debug_mode_d = 1'b1;
				end
				ctrl_fsm_ns = DECODE;
			end
			DBG_TAKEN_ID: begin
				flush_id = 1'b1;
				pc_mux_o = ibex_pkg_PC_EXC;
				pc_set_o = 1'b1;
				pc_set_spec_o = 1'b1;
				exc_pc_mux_o = ibex_pkg_EXC_PC_DBD;
				if (ebreak_into_debug && !debug_mode_q) begin
					csr_save_cause_o = 1'b1;
					csr_save_id_o = 1'b1;
					debug_csr_save_o = 1'b1;
					debug_cause_o = ibex_pkg_DBG_CAUSE_EBREAK;
				end
				debug_mode_d = 1'b1;
				ctrl_fsm_ns = DECODE;
			end
			FLUSH: begin
				halt_if = 1'b1;
				flush_id = 1'b1;
				ctrl_fsm_ns = DECODE;
				if ((exc_req_q || store_err_q) || load_err_q) begin
					pc_set_o = 1'b1;
					pc_set_spec_o = 1'b1;
					pc_mux_o = ibex_pkg_PC_EXC;
					exc_pc_mux_o = (debug_mode_q ? ibex_pkg_EXC_PC_DBG_EXC : ibex_pkg_EXC_PC_EXC);
					if (WritebackStage) begin : g_writeback_mepc_save
						csr_save_id_o = ~(store_err_q | load_err_q);
						csr_save_wb_o = store_err_q | load_err_q;
					end
					else begin : g_no_writeback_mepc_save
						csr_save_id_o = 1'b0;
					end
					csr_save_cause_o = 1'b1;
					case (1'b1)
						instr_fetch_err_prio: begin
							exc_cause_o = ibex_pkg_EXC_CAUSE_INSTR_ACCESS_FAULT;
							csr_mtval_o = (instr_fetch_err_plus2_i ? pc_id_i + 32'd2 : pc_id_i);
						end
						illegal_insn_prio: begin
							exc_cause_o = ibex_pkg_EXC_CAUSE_ILLEGAL_INSN;
							csr_mtval_o = (instr_is_compressed_i ? {16'b0000000000000000, instr_compressed_i} : instr_i);
						end
						ecall_insn_prio: exc_cause_o = (priv_mode_i == ibex_pkg_PRIV_LVL_M ? ibex_pkg_EXC_CAUSE_ECALL_MMODE : ibex_pkg_EXC_CAUSE_ECALL_UMODE);
						ebrk_insn_prio:
							if (debug_mode_q | ebreak_into_debug) begin
								pc_set_o = 1'b0;
								pc_set_spec_o = 1'b0;
								csr_save_id_o = 1'b0;
								csr_save_cause_o = 1'b0;
								ctrl_fsm_ns = DBG_TAKEN_ID;
								flush_id = 1'b0;
							end
							else
								exc_cause_o = ibex_pkg_EXC_CAUSE_BREAKPOINT;
						store_err_prio: begin
							exc_cause_o = ibex_pkg_EXC_CAUSE_STORE_ACCESS_FAULT;
							csr_mtval_o = lsu_addr_last_i;
						end
						load_err_prio: begin
							exc_cause_o = ibex_pkg_EXC_CAUSE_LOAD_ACCESS_FAULT;
							csr_mtval_o = lsu_addr_last_i;
						end
						default:
							;
					endcase
				end
				else if (mret_insn) begin
					pc_mux_o = ibex_pkg_PC_ERET;
					pc_set_o = 1'b1;
					pc_set_spec_o = 1'b1;
					csr_restore_mret_id_o = 1'b1;
					if (nmi_mode_q)
						nmi_mode_d = 1'b0;
				end
				else if (dret_insn) begin
					pc_mux_o = ibex_pkg_PC_DRET;
					pc_set_o = 1'b1;
					pc_set_spec_o = 1'b1;
					debug_mode_d = 1'b0;
					csr_restore_dret_id_o = 1'b1;
				end
				else if (wfi_insn)
					ctrl_fsm_ns = WAIT_SLEEP;
				else if (csr_pipe_flush && handle_irq)
					ctrl_fsm_ns = IRQ_TAKEN;
				if (enter_debug_mode && !(ebrk_insn_prio && ebreak_into_debug))
					ctrl_fsm_ns = DBG_TAKEN_IF;
			end
			default: begin
				instr_req_o = 1'b0;
				ctrl_fsm_ns = RESET;
			end
		endcase
	end
	assign flush_id_o = flush_id;
	assign debug_mode_o = debug_mode_q;
	assign nmi_mode_o = nmi_mode_q;
	assign stall = stall_id_i | stall_wb_i;
	assign id_in_ready_o = (~stall & ~halt_if) & ~retain_id;
	assign instr_valid_clear_o = ~(stall | retain_id) | flush_id;
	always @(posedge clk_i or negedge rst_ni) begin : update_regs
		if (!rst_ni) begin
			ctrl_fsm_cs <= RESET;
			nmi_mode_q <= 1'b0;
			debug_mode_q <= 1'b0;
			load_err_q <= 1'b0;
			store_err_q <= 1'b0;
			exc_req_q <= 1'b0;
			illegal_insn_q <= 1'b0;
		end
		else begin
			ctrl_fsm_cs <= ctrl_fsm_ns;
			nmi_mode_q <= nmi_mode_d;
			debug_mode_q <= debug_mode_d;
			load_err_q <= load_err_d;
			store_err_q <= store_err_d;
			exc_req_q <= exc_req_d;
			illegal_insn_q <= illegal_insn_d;
		end
	end
endmodule
module ibex_core (
	clk,
	rst_ni,
	test_en_i,
	hart_id_i,
	boot_addr_i,
	instr_req_o,
	instr_gnt_i,
	instr_rvalid_i,
	instr_addr_o,
	instr_rdata_i,
	instr_err_i,
	data_req_o,
	data_gnt_i,
	data_rvalid_i,
	data_we_o,
	data_be_o,
	data_addr_o,
	data_wdata_o,
	data_rdata_i,
	data_err_i,
	irq_software_i,
	irq_timer_i,
	irq_external_i,
	irq_fast_i,
	irq_nm_i,
	debug_req_i,
	fetch_enable_i,
	alert_minor_o,
	alert_major_o,
	core_sleep_o
);
	parameter [0:0] PMPEnable = 1'b0;
	parameter [31:0] PMPGranularity = 0;
	parameter [31:0] PMPNumRegions = 4;
	parameter [31:0] MHPMCounterNum = 0;
	parameter [31:0] MHPMCounterWidth = 40;
	parameter [0:0] RV32E = 1'b0;
	localparam integer ibex_pkg_RV32MFast = 2;
	parameter integer RV32M = ibex_pkg_RV32MFast;
	localparam integer ibex_pkg_RV32BNone = 0;
	parameter integer RV32B = ibex_pkg_RV32BNone;
	localparam integer ibex_pkg_RegFileFF = 0;
	parameter integer RegFile = ibex_pkg_RegFileFF;
	parameter [0:0] BranchTargetALU = 1'b0;
	parameter [0:0] WritebackStage = 1'b0;
	parameter [0:0] ICache = 1'b0;
	parameter [0:0] ICacheECC = 1'b0;
	parameter [0:0] BranchPredictor = 1'b0;
	parameter [0:0] DbgTriggerEn = 1'b0;
	parameter [31:0] DbgHwBreakNum = 1;
	parameter [0:0] SecureIbex = 1'b0;
	parameter [31:0] DmHaltAddr = 32'h1a110800;
	parameter [31:0] DmExceptionAddr = 32'h1a110808;
	input wire clk;
	input wire rst_ni;
	input wire test_en_i;
	input wire [31:0] hart_id_i;
	input wire [31:0] boot_addr_i;
	output wire instr_req_o;
	input wire instr_gnt_i;
	input wire instr_rvalid_i;
	output wire [31:0] instr_addr_o;
	input wire [31:0] instr_rdata_i;
	input wire instr_err_i;
	output wire data_req_o;
	input wire data_gnt_i;
	input wire data_rvalid_i;
	output wire data_we_o;
	output wire [3:0] data_be_o;
	output wire [31:0] data_addr_o;
	output wire [31:0] data_wdata_o;
	input wire [31:0] data_rdata_i;
	input wire data_err_i;
	input wire irq_software_i;
	input wire irq_timer_i;
	input wire irq_external_i;
	input wire [14:0] irq_fast_i;
	input wire irq_nm_i;
	input wire debug_req_i;
	input wire fetch_enable_i;
	output wire alert_minor_o;
	output wire alert_major_o;
	output wire core_sleep_o;
	localparam [31:0] PMP_NUM_CHAN = 2;
	localparam [0:0] DataIndTiming = SecureIbex;
	localparam [0:0] DummyInstructions = SecureIbex;
	localparam [0:0] PCIncrCheck = SecureIbex;
	localparam [0:0] ShadowCSR = SecureIbex;
	localparam [0:0] SpecBranch = PMPEnable & (PMPNumRegions == 16);
	localparam [0:0] RegFileECC = SecureIbex;
	localparam [31:0] RegFileDataWidth = (RegFileECC ? 39 : 32);
	wire dummy_instr_id;
	wire instr_valid_id;
	wire instr_new_id;
	wire [31:0] instr_rdata_id;
	wire [31:0] instr_rdata_alu_id;
	wire [15:0] instr_rdata_c_id;
	wire instr_is_compressed_id;
	wire instr_perf_count_id;
	wire instr_bp_taken_id;
	wire instr_fetch_err;
	wire instr_fetch_err_plus2;
	wire illegal_c_insn_id;
	wire [31:0] pc_if;
	wire [31:0] pc_id;
	wire [31:0] pc_wb;
	wire [67:0] imd_val_d_ex;
	wire [67:0] imd_val_q_ex;
	wire [1:0] imd_val_we_ex;
	wire data_ind_timing;
	wire dummy_instr_en;
	wire [2:0] dummy_instr_mask;
	wire dummy_instr_seed_en;
	wire [31:0] dummy_instr_seed;
	wire icache_enable;
	wire icache_inval;
	wire pc_mismatch_alert;
	wire csr_shadow_err;
	wire instr_first_cycle_id;
	wire instr_valid_clear;
	wire pc_set;
	wire pc_set_spec;
	wire nt_branch_mispredict;
	wire [2:0] pc_mux_id;
	wire [1:0] exc_pc_mux_id;
	wire [5:0] exc_cause;
	wire lsu_load_err;
	wire lsu_store_err;
	wire lsu_addr_incr_req;
	wire [31:0] lsu_addr_last;
	wire [31:0] branch_target_ex;
	wire branch_decision;
	wire ctrl_busy;
	wire if_busy;
	wire lsu_busy;
	wire core_busy_d;
	reg core_busy_q;
	wire [4:0] rf_raddr_a;
	wire [31:0] rf_rdata_a;
	wire [4:0] rf_raddr_b;
	wire [31:0] rf_rdata_b;
	wire rf_ren_a;
	wire rf_ren_b;
	wire [4:0] rf_waddr_wb;
	wire [31:0] rf_wdata_wb;
	wire [31:0] rf_wdata_fwd_wb;
	wire [31:0] rf_wdata_lsu;
	wire rf_we_wb;
	wire rf_we_lsu;
	wire [4:0] rf_waddr_id;
	wire [31:0] rf_wdata_id;
	wire rf_we_id;
	wire rf_rd_a_wb_match;
	wire rf_rd_b_wb_match;
	wire [5:0] alu_operator_ex;
	wire [31:0] alu_operand_a_ex;
	wire [31:0] alu_operand_b_ex;
	wire [31:0] bt_a_operand;
	wire [31:0] bt_b_operand;
	wire [31:0] alu_adder_result_ex;
	wire [31:0] result_ex;
	wire mult_en_ex;
	wire div_en_ex;
	wire mult_sel_ex;
	wire div_sel_ex;
	wire [1:0] multdiv_operator_ex;
	wire [1:0] multdiv_signed_mode_ex;
	wire [31:0] multdiv_operand_a_ex;
	wire [31:0] multdiv_operand_b_ex;
	wire multdiv_ready_id;
	wire csr_access;
	wire [1:0] csr_op;
	wire csr_op_en;
	wire [11:0] csr_addr;
	wire [31:0] csr_rdata;
	wire [31:0] csr_wdata;
	wire illegal_csr_insn_id;
	wire lsu_we;
	wire [1:0] lsu_type;
	wire lsu_sign_ext;
	wire lsu_req;
	wire [31:0] lsu_wdata;
	wire lsu_req_done;
	wire id_in_ready;
	wire ex_valid;
	wire lsu_resp_valid;
	wire lsu_resp_err;
	wire instr_req_int;
	wire en_wb;
	wire [1:0] instr_type_wb;
	wire ready_wb;
	wire rf_write_wb;
	wire outstanding_load_wb;
	wire outstanding_store_wb;
	wire irq_pending;
	wire nmi_mode;
	wire [17:0] irqs;
	wire csr_mstatus_mie;
	wire [31:0] csr_mepc;
	wire [31:0] csr_depc;
	wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 34) + (((PMPNumRegions - 1) * 34) - 1) : (PMPNumRegions * 34) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 34 : 0)] csr_pmp_addr;
	wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 6) + (((PMPNumRegions - 1) * 6) - 1) : (PMPNumRegions * 6) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 6 : 0)] csr_pmp_cfg;
	wire [0:PMP_NUM_CHAN - 1] pmp_req_err;
	wire instr_req_out;
	wire data_req_out;
	wire csr_save_if;
	wire csr_save_id;
	wire csr_save_wb;
	wire csr_restore_mret_id;
	wire csr_restore_dret_id;
	wire csr_save_cause;
	wire csr_mtvec_init;
	wire [31:0] csr_mtvec;
	wire [31:0] csr_mtval;
	wire csr_mstatus_tw;
	wire [1:0] priv_mode_id;
	wire [1:0] priv_mode_if;
	wire [1:0] priv_mode_lsu;
	wire debug_mode;
	wire [2:0] debug_cause;
	wire debug_csr_save;
	wire debug_single_step;
	wire debug_ebreakm;
	wire debug_ebreaku;
	wire trigger_match;
	wire instr_id_done;
	wire instr_done_wb;
	wire perf_instr_ret_wb;
	wire perf_instr_ret_compressed_wb;
	wire perf_iside_wait;
	wire perf_dside_wait;
	wire perf_mul_wait;
	wire perf_div_wait;
	wire perf_jump;
	wire perf_branch;
	wire perf_tbranch;
	wire perf_load;
	wire perf_store;
	wire illegal_insn_id;
	wire unused_illegal_insn_id;
	wire clk_o;
	wire clock_en;
	assign core_busy_d = (ctrl_busy | if_busy) | lsu_busy;
	always @(posedge clk or negedge rst_ni)
		if (!rst_ni)
			core_busy_q <= 1'b0;
		else
			core_busy_q <= core_busy_d;
	reg fetch_enable_q;
	always @(posedge clk or negedge rst_ni)
		if (!rst_ni)
			fetch_enable_q <= 1'b0;
		else if (fetch_enable_i)
			fetch_enable_q <= 1'b1;
	assign clock_en = fetch_enable_q & (((core_busy_q | debug_req_i) | irq_pending) | irq_nm_i);
	assign core_sleep_o = ~clock_en;
	prim_clock_gating core_clock_gate_i(
		.clk_i(clk),
		.en_i(clock_en),
		.test_en_i(test_en_i),
		.clk_o(clk_o)
	);
	localparam [31:0] ibex_pkg_PMP_I = 0;
	ibex_if_stage #(
		.DmHaltAddr(DmHaltAddr),
		.DmExceptionAddr(DmExceptionAddr),
		.DummyInstructions(DummyInstructions),
		.ICache(ICache),
		.ICacheECC(ICacheECC),
		.PCIncrCheck(PCIncrCheck),
		.BranchPredictor(BranchPredictor)
	) if_stage_i(
		.clk_i(clk_o),
		.rst_ni(rst_ni),
		.boot_addr_i(boot_addr_i),
		.req_i(instr_req_int),
		.instr_req_o(instr_req_out),
		.instr_addr_o(instr_addr_o),
		.instr_gnt_i(instr_gnt_i),
		.instr_rvalid_i(instr_rvalid_i),
		.instr_rdata_i(instr_rdata_i),
		.instr_err_i(instr_err_i),
		.instr_pmp_err_i(pmp_req_err[ibex_pkg_PMP_I]),
		.instr_valid_id_o(instr_valid_id),
		.instr_new_id_o(instr_new_id),
		.instr_rdata_id_o(instr_rdata_id),
		.instr_rdata_alu_id_o(instr_rdata_alu_id),
		.instr_rdata_c_id_o(instr_rdata_c_id),
		.instr_is_compressed_id_o(instr_is_compressed_id),
		.instr_bp_taken_o(instr_bp_taken_id),
		.instr_fetch_err_o(instr_fetch_err),
		.instr_fetch_err_plus2_o(instr_fetch_err_plus2),
		.illegal_c_insn_id_o(illegal_c_insn_id),
		.dummy_instr_id_o(dummy_instr_id),
		.pc_if_o(pc_if),
		.pc_id_o(pc_id),
		.instr_valid_clear_i(instr_valid_clear),
		.pc_set_i(pc_set),
		.pc_set_spec_i(pc_set_spec),
		.pc_mux_i(pc_mux_id),
		.nt_branch_mispredict_i(nt_branch_mispredict),
		.exc_pc_mux_i(exc_pc_mux_id),
		.exc_cause(exc_cause),
		.dummy_instr_en_i(dummy_instr_en),
		.dummy_instr_mask_i(dummy_instr_mask),
		.dummy_instr_seed_en_i(dummy_instr_seed_en),
		.dummy_instr_seed_i(dummy_instr_seed),
		.icache_enable_i(icache_enable),
		.icache_inval_i(icache_inval),
		.branch_target_ex_i(branch_target_ex),
		.csr_mepc_i(csr_mepc),
		.csr_depc_i(csr_depc),
		.csr_mtvec_i(csr_mtvec),
		.csr_mtvec_init_o(csr_mtvec_init),
		.id_in_ready_i(id_in_ready),
		.pc_mismatch_alert_o(pc_mismatch_alert),
		.if_busy_o(if_busy)
	);
	assign perf_iside_wait = id_in_ready & ~instr_valid_id;
	assign instr_req_o = instr_req_out & ~pmp_req_err[ibex_pkg_PMP_I];
	ibex_id_stage #(
		.RV32E(RV32E),
		.RV32M(RV32M),
		.RV32B(RV32B),
		.BranchTargetALU(BranchTargetALU),
		.DataIndTiming(DataIndTiming),
		.SpecBranch(SpecBranch),
		.WritebackStage(WritebackStage),
		.BranchPredictor(BranchPredictor)
	) id_stage_i(
		.clk_i(clk_o),
		.rst_ni(rst_ni),
		.ctrl_busy_o(ctrl_busy),
		.illegal_insn_o(illegal_insn_id),
		.instr_valid_i(instr_valid_id),
		.instr_rdata_i(instr_rdata_id),
		.instr_rdata_alu_i(instr_rdata_alu_id),
		.instr_rdata_c_i(instr_rdata_c_id),
		.instr_is_compressed_i(instr_is_compressed_id),
		.instr_bp_taken_i(instr_bp_taken_id),
		.branch_decision_i(branch_decision),
		.instr_first_cycle_id_o(instr_first_cycle_id),
		.instr_valid_clear_o(instr_valid_clear),
		.id_in_ready_o(id_in_ready),
		.instr_req_o(instr_req_int),
		.pc_set_o(pc_set),
		.pc_set_spec_o(pc_set_spec),
		.pc_mux_o(pc_mux_id),
		.nt_branch_mispredict_o(nt_branch_mispredict),
		.exc_pc_mux_o(exc_pc_mux_id),
		.exc_cause_o(exc_cause),
		.icache_inval_o(icache_inval),
		.instr_fetch_err_i(instr_fetch_err),
		.instr_fetch_err_plus2_i(instr_fetch_err_plus2),
		.illegal_c_insn_i(illegal_c_insn_id),
		.pc_id_i(pc_id),
		.ex_valid_i(ex_valid),
		.lsu_resp_valid_i(lsu_resp_valid),
		.alu_operator_ex_o(alu_operator_ex),
		.alu_operand_a_ex_o(alu_operand_a_ex),
		.alu_operand_b_ex_o(alu_operand_b_ex),
		.imd_val_q_ex_o(imd_val_q_ex),
		.imd_val_d_ex_i(imd_val_d_ex),
		.imd_val_we_ex_i(imd_val_we_ex),
		.bt_a_operand_o(bt_a_operand),
		.bt_b_operand_o(bt_b_operand),
		.mult_en_ex_o(mult_en_ex),
		.div_en_ex_o(div_en_ex),
		.mult_sel_ex_o(mult_sel_ex),
		.div_sel_ex_o(div_sel_ex),
		.multdiv_operator_ex_o(multdiv_operator_ex),
		.multdiv_signed_mode_ex_o(multdiv_signed_mode_ex),
		.multdiv_operand_a_ex_o(multdiv_operand_a_ex),
		.multdiv_operand_b_ex_o(multdiv_operand_b_ex),
		.multdiv_ready_id_o(multdiv_ready_id),
		.csr_access_o(csr_access),
		.csr_op_o(csr_op),
		.csr_op_en_o(csr_op_en),
		.csr_save_if_o(csr_save_if),
		.csr_save_id_o(csr_save_id),
		.csr_save_wb_o(csr_save_wb),
		.csr_restore_mret_id_o(csr_restore_mret_id),
		.csr_restore_dret_id_o(csr_restore_dret_id),
		.csr_save_cause_o(csr_save_cause),
		.csr_mtval_o(csr_mtval),
		.priv_mode_i(priv_mode_id),
		.csr_mstatus_tw_i(csr_mstatus_tw),
		.illegal_csr_insn_i(illegal_csr_insn_id),
		.data_ind_timing_i(data_ind_timing),
		.lsu_req_o(lsu_req),
		.lsu_we_o(lsu_we),
		.lsu_type_o(lsu_type),
		.lsu_sign_ext_o(lsu_sign_ext),
		.lsu_wdata_o(lsu_wdata),
		.lsu_req_done_i(lsu_req_done),
		.lsu_addr_incr_req_i(lsu_addr_incr_req),
		.lsu_addr_last_i(lsu_addr_last),
		.lsu_load_err_i(lsu_load_err),
		.lsu_store_err_i(lsu_store_err),
		.csr_mstatus_mie_i(csr_mstatus_mie),
		.irq_pending_i(irq_pending),
		.irqs_i(irqs),
		.irq_nm_i(irq_nm_i),
		.nmi_mode_o(nmi_mode),
		.debug_mode_o(debug_mode),
		.debug_cause_o(debug_cause),
		.debug_csr_save_o(debug_csr_save),
		.debug_req_i(debug_req_i),
		.debug_single_step_i(debug_single_step),
		.debug_ebreakm_i(debug_ebreakm),
		.debug_ebreaku_i(debug_ebreaku),
		.trigger_match_i(trigger_match),
		.result_ex_i(result_ex),
		.csr_rdata_i(csr_rdata),
		.rf_raddr_a_o(rf_raddr_a),
		.rf_rdata_a_i(rf_rdata_a),
		.rf_raddr_b_o(rf_raddr_b),
		.rf_rdata_b_i(rf_rdata_b),
		.rf_ren_a_o(rf_ren_a),
		.rf_ren_b_o(rf_ren_b),
		.rf_waddr_id_o(rf_waddr_id),
		.rf_wdata_id_o(rf_wdata_id),
		.rf_we_id_o(rf_we_id),
		.rf_rd_a_wb_match_o(rf_rd_a_wb_match),
		.rf_rd_b_wb_match_o(rf_rd_b_wb_match),
		.rf_waddr_wb_i(rf_waddr_wb),
		.rf_wdata_fwd_wb_i(rf_wdata_fwd_wb),
		.rf_write_wb_i(rf_write_wb),
		.en_wb_o(en_wb),
		.instr_type_wb_o(instr_type_wb),
		.instr_perf_count_id_o(instr_perf_count_id),
		.ready_wb_i(ready_wb),
		.outstanding_load_wb_i(outstanding_load_wb),
		.outstanding_store_wb_i(outstanding_store_wb),
		.perf_jump_o(perf_jump),
		.perf_branch_o(perf_branch),
		.perf_tbranch_o(perf_tbranch),
		.perf_dside_wait_o(perf_dside_wait),
		.perf_mul_wait_o(perf_mul_wait),
		.perf_div_wait_o(perf_div_wait),
		.instr_id_done_o(instr_id_done)
	);
	assign unused_illegal_insn_id = illegal_insn_id;
	ibex_ex_block #(
		.RV32M(RV32M),
		.RV32B(RV32B),
		.BranchTargetALU(BranchTargetALU)
	) ex_block_i(
		.clk_i(clk_o),
		.rst_ni(rst_ni),
		.alu_operator_i(alu_operator_ex),
		.alu_operand_a_i(alu_operand_a_ex),
		.alu_operand_b_i(alu_operand_b_ex),
		.alu_instr_first_cycle_i(instr_first_cycle_id),
		.bt_a_operand_i(bt_a_operand),
		.bt_b_operand_i(bt_b_operand),
		.multdiv_operator_i(multdiv_operator_ex),
		.mult_en_i(mult_en_ex),
		.div_en_i(div_en_ex),
		.mult_sel_i(mult_sel_ex),
		.div_sel_i(div_sel_ex),
		.multdiv_signed_mode_i(multdiv_signed_mode_ex),
		.multdiv_operand_a_i(multdiv_operand_a_ex),
		.multdiv_operand_b_i(multdiv_operand_b_ex),
		.multdiv_ready_id_i(multdiv_ready_id),
		.data_ind_timing_i(data_ind_timing),
		.imd_val_we_o(imd_val_we_ex),
		.imd_val_d_o(imd_val_d_ex),
		.imd_val_q_i(imd_val_q_ex),
		.alu_adder_result_ex_o(alu_adder_result_ex),
		.result_ex_o(result_ex),
		.branch_target_o(branch_target_ex),
		.branch_decision_o(branch_decision),
		.ex_valid_o(ex_valid)
	);
	localparam [31:0] ibex_pkg_PMP_D = 1;
	assign data_req_o = data_req_out & ~pmp_req_err[ibex_pkg_PMP_D];
	assign lsu_resp_err = lsu_load_err | lsu_store_err;
	ibex_load_store_unit load_store_unit_i(
		.clk_i(clk_o),
		.rst_ni(rst_ni),
		.data_req_o(data_req_out),
		.data_gnt_i(data_gnt_i),
		.data_rvalid_i(data_rvalid_i),
		.data_err_i(data_err_i),
		.data_pmp_err_i(pmp_req_err[ibex_pkg_PMP_D]),
		.data_addr_o(data_addr_o),
		.data_we_o(data_we_o),
		.data_be_o(data_be_o),
		.data_wdata_o(data_wdata_o),
		.data_rdata_i(data_rdata_i),
		.lsu_we_i(lsu_we),
		.lsu_type_i(lsu_type),
		.lsu_wdata_i(lsu_wdata),
		.lsu_sign_ext_i(lsu_sign_ext),
		.lsu_rdata_o(rf_wdata_lsu),
		.lsu_rdata_valid_o(rf_we_lsu),
		.lsu_req_i(lsu_req),
		.lsu_req_done_o(lsu_req_done),
		.adder_result_ex_i(alu_adder_result_ex),
		.addr_incr_req_o(lsu_addr_incr_req),
		.addr_last_o(lsu_addr_last),
		.lsu_resp_valid_o(lsu_resp_valid),
		.load_err_o(lsu_load_err),
		.store_err_o(lsu_store_err),
		.busy_o(lsu_busy),
		.perf_load_o(perf_load),
		.perf_store_o(perf_store)
	);
	ibex_wb_stage #(.WritebackStage(WritebackStage)) wb_stage_i(
		.clk_i(clk_o),
		.rst_ni(rst_ni),
		.en_wb_i(en_wb),
		.instr_type_wb_i(instr_type_wb),
		.pc_id_i(pc_id),
		.instr_is_compressed_id_i(instr_is_compressed_id),
		.instr_perf_count_id_i(instr_perf_count_id),
		.ready_wb_o(ready_wb),
		.rf_write_wb_o(rf_write_wb),
		.outstanding_load_wb_o(outstanding_load_wb),
		.outstanding_store_wb_o(outstanding_store_wb),
		.pc_wb_o(pc_wb),
		.perf_instr_ret_wb_o(perf_instr_ret_wb),
		.perf_instr_ret_compressed_wb_o(perf_instr_ret_compressed_wb),
		.rf_waddr_id_i(rf_waddr_id),
		.rf_wdata_id_i(rf_wdata_id),
		.rf_we_id_i(rf_we_id),
		.rf_wdata_lsu_i(rf_wdata_lsu),
		.rf_we_lsu_i(rf_we_lsu),
		.rf_wdata_fwd_wb_o(rf_wdata_fwd_wb),
		.rf_waddr_wb_o(rf_waddr_wb),
		.rf_wdata_wb_o(rf_wdata_wb),
		.rf_we_wb_o(rf_we_wb),
		.lsu_resp_valid_i(lsu_resp_valid),
		.lsu_resp_err_i(lsu_resp_err),
		.instr_done_wb_o(instr_done_wb)
	);
	wire [RegFileDataWidth - 1:0] rf_wdata_wb_ecc;
	wire [RegFileDataWidth - 1:0] rf_rdata_a_ecc;
	wire [RegFileDataWidth - 1:0] rf_rdata_b_ecc;
	wire rf_ecc_err_comb;
	generate
		if (RegFileECC) begin : gen_regfile_ecc
			wire [1:0] rf_ecc_err_a;
			wire [1:0] rf_ecc_err_b;
			wire rf_ecc_err_a_id;
			wire rf_ecc_err_b_id;
			prim_secded_39_32_enc regfile_ecc_enc(
				.in(rf_wdata_wb),
				.out(rf_wdata_wb_ecc)
			);
			prim_secded_39_32_dec regfile_ecc_dec_a(
				.in(rf_rdata_a_ecc),
				.d_o(),
				.syndrome_o(),
				.err_o(rf_ecc_err_a)
			);
			prim_secded_39_32_dec regfile_ecc_dec_b(
				.in(rf_rdata_b_ecc),
				.d_o(),
				.syndrome_o(),
				.err_o(rf_ecc_err_b)
			);
			assign rf_rdata_a = rf_rdata_a_ecc[31:0];
			assign rf_rdata_b = rf_rdata_b_ecc[31:0];
			assign rf_ecc_err_a_id = (|rf_ecc_err_a & rf_ren_a) & ~rf_rd_a_wb_match;
			assign rf_ecc_err_b_id = (|rf_ecc_err_b & rf_ren_b) & ~rf_rd_b_wb_match;
			assign rf_ecc_err_comb = instr_valid_id & (rf_ecc_err_a_id | rf_ecc_err_b_id);
		end
		else begin : gen_no_regfile_ecc
			wire unused_rf_ren_a;
			wire unused_rf_ren_b;
			wire unused_rf_rd_a_wb_match;
			wire unused_rf_rd_b_wb_match;
			assign unused_rf_ren_a = rf_ren_a;
			assign unused_rf_ren_b = rf_ren_b;
			assign unused_rf_rd_a_wb_match = rf_rd_a_wb_match;
			assign unused_rf_rd_b_wb_match = rf_rd_b_wb_match;
			assign rf_wdata_wb_ecc = rf_wdata_wb;
			assign rf_rdata_a = rf_rdata_a_ecc;
			assign rf_rdata_b = rf_rdata_b_ecc;
			assign rf_ecc_err_comb = 1'b0;
		end
	endgenerate
	localparam integer ibex_pkg_RegFileFPGA = 1;
	localparam integer ibex_pkg_RegFileLatch = 2;
	generate
		if (RegFile == ibex_pkg_RegFileFF) begin : gen_regfile_ff
			ibex_register_file_ff #(
				.RV32E(RV32E),
				.DataWidth(RegFileDataWidth),
				.DummyInstructions(DummyInstructions)
			) register_file_i(
				.clk_i(clk),
				.rst_ni(rst_ni),
				.test_en_i(test_en_i),
				.dummy_instr_id_i(dummy_instr_id),
				.raddr_a_i(rf_raddr_a),
				.rdata_a_o(rf_rdata_a_ecc),
				.raddr_b_i(rf_raddr_b),
				.rdata_b_o(rf_rdata_b_ecc),
				.waddr_a_i(rf_waddr_wb),
				.wdata_a_i(rf_wdata_wb_ecc),
				.we_a_i(rf_we_wb)
			);
		end
		else if (RegFile == ibex_pkg_RegFileFPGA) begin : gen_regfile_fpga
			ibex_register_file_fpga #(
				.RV32E(RV32E),
				.DataWidth(RegFileDataWidth),
				.DummyInstructions(DummyInstructions)
			) register_file_i(
				.clk_i(clk),
				.rst_ni(rst_ni),
				.test_en_i(test_en_i),
				.dummy_instr_id_i(dummy_instr_id),
				.raddr_a_i(rf_raddr_a),
				.rdata_a_o(rf_rdata_a_ecc),
				.raddr_b_i(rf_raddr_b),
				.rdata_b_o(rf_rdata_b_ecc),
				.waddr_a_i(rf_waddr_wb),
				.wdata_a_i(rf_wdata_wb_ecc),
				.we_a_i(rf_we_wb)
			);
		end
		else if (RegFile == ibex_pkg_RegFileLatch) begin : gen_regfile_latch
			ibex_register_file_latch #(
				.RV32E(RV32E),
				.DataWidth(RegFileDataWidth),
				.DummyInstructions(DummyInstructions)
			) register_file_i(
				.clk_i(clk),
				.rst_ni(rst_ni),
				.test_en_i(test_en_i),
				.dummy_instr_id_i(dummy_instr_id),
				.raddr_a_i(rf_raddr_a),
				.rdata_a_o(rf_rdata_a_ecc),
				.raddr_b_i(rf_raddr_b),
				.rdata_b_o(rf_rdata_b_ecc),
				.waddr_a_i(rf_waddr_wb),
				.wdata_a_i(rf_wdata_wb_ecc),
				.we_a_i(rf_we_wb)
			);
		end
	endgenerate
	assign alert_minor_o = 1'b0;
	assign alert_major_o = (rf_ecc_err_comb | pc_mismatch_alert) | csr_shadow_err;
	assign csr_wdata = alu_operand_a_ex;
	function automatic [11:0] sv2v_cast_12;
		input reg [11:0] inp;
		sv2v_cast_12 = inp;
	endfunction
	assign csr_addr = sv2v_cast_12((csr_access ? alu_operand_b_ex[11:0] : 12'b000000000000));
	ibex_cs_registers #(
		.DbgTriggerEn(DbgTriggerEn),
		.DbgHwBreakNum(DbgHwBreakNum),
		.DataIndTiming(DataIndTiming),
		.DummyInstructions(DummyInstructions),
		.ShadowCSR(ShadowCSR),
		.ICache(ICache),
		.MHPMCounterNum(MHPMCounterNum),
		.MHPMCounterWidth(MHPMCounterWidth),
		.PMPEnable(PMPEnable),
		.PMPGranularity(PMPGranularity),
		.PMPNumRegions(PMPNumRegions),
		.RV32E(RV32E),
		.RV32M(RV32M)
	) cs_registers_i(
		.clk_i(clk_o),
		.rst_ni(rst_ni),
		.hart_id_i(hart_id_i),
		.priv_mode_id_o(priv_mode_id),
		.priv_mode_if_o(priv_mode_if),
		.priv_mode_lsu_o(priv_mode_lsu),
		.csr_mtvec_o(csr_mtvec),
		.csr_mtvec_init_i(csr_mtvec_init),
		.boot_addr_i(boot_addr_i),
		.csr_access_i(csr_access),
		.csr_addr_i(csr_addr),
		.csr_wdata_i(csr_wdata),
		.csr_op_i(csr_op),
		.csr_op_en_i(csr_op_en),
		.csr_rdata_o(csr_rdata),
		.irq_software_i(irq_software_i),
		.irq_timer_i(irq_timer_i),
		.irq_external_i(irq_external_i),
		.irq_fast_i(irq_fast_i),
		.nmi_mode_i(nmi_mode),
		.irq_pending_o(irq_pending),
		.irqs_o(irqs),
		.csr_mstatus_mie_o(csr_mstatus_mie),
		.csr_mstatus_tw_o(csr_mstatus_tw),
		.csr_mepc_o(csr_mepc),
		.csr_pmp_cfg_o(csr_pmp_cfg),
		.csr_pmp_addr_o(csr_pmp_addr),
		.csr_depc_o(csr_depc),
		.debug_mode_i(debug_mode),
		.debug_cause_i(debug_cause),
		.debug_csr_save_i(debug_csr_save),
		.debug_single_step_o(debug_single_step),
		.debug_ebreakm_o(debug_ebreakm),
		.debug_ebreaku_o(debug_ebreaku),
		.trigger_match_o(trigger_match),
		.pc_if_i(pc_if),
		.pc_id_i(pc_id),
		.pc_wb_i(pc_wb),
		.data_ind_timing_o(data_ind_timing),
		.dummy_instr_en_o(dummy_instr_en),
		.dummy_instr_mask_o(dummy_instr_mask),
		.dummy_instr_seed_en_o(dummy_instr_seed_en),
		.dummy_instr_seed_o(dummy_instr_seed),
		.icache_enable_o(icache_enable),
		.csr_shadow_err_o(csr_shadow_err),
		.csr_save_if_i(csr_save_if),
		.csr_save_id_i(csr_save_id),
		.csr_save_wb_i(csr_save_wb),
		.csr_restore_mret_i(csr_restore_mret_id),
		.csr_restore_dret_i(csr_restore_dret_id),
		.csr_save_cause_i(csr_save_cause),
		.csr_mcause_i(exc_cause),
		.csr_mtval_i(csr_mtval),
		.illegal_csr_insn_o(illegal_csr_insn_id),
		.instr_ret_i(perf_instr_ret_wb),
		.instr_ret_compressed_i(perf_instr_ret_compressed_wb),
		.iside_wait_i(perf_iside_wait),
		.jump_i(perf_jump),
		.branch_i(perf_branch),
		.branch_taken_i(perf_tbranch),
		.mem_load_i(perf_load),
		.mem_store_i(perf_store),
		.dside_wait_i(perf_dside_wait),
		.mul_wait_i(perf_mul_wait),
		.div_wait_i(perf_div_wait)
	);
	localparam [1:0] ibex_pkg_PMP_ACC_EXEC = 2'b00;
	localparam [1:0] ibex_pkg_PMP_ACC_READ = 2'b10;
	localparam [1:0] ibex_pkg_PMP_ACC_WRITE = 2'b01;
	generate
		if (PMPEnable) begin : g_pmp
			wire [(0 >= (PMP_NUM_CHAN - 1) ? ((2 - PMP_NUM_CHAN) * 34) + (((PMP_NUM_CHAN - 1) * 34) - 1) : (PMP_NUM_CHAN * 34) - 1):(0 >= (PMP_NUM_CHAN - 1) ? (PMP_NUM_CHAN - 1) * 34 : 0)] pmp_req_addr;
			wire [(0 >= (PMP_NUM_CHAN - 1) ? ((2 - PMP_NUM_CHAN) * 2) + (((PMP_NUM_CHAN - 1) * 2) - 1) : (PMP_NUM_CHAN * 2) - 1):(0 >= (PMP_NUM_CHAN - 1) ? (PMP_NUM_CHAN - 1) * 2 : 0)] pmp_req_type;
			wire [(0 >= (PMP_NUM_CHAN - 1) ? ((2 - PMP_NUM_CHAN) * 2) + (((PMP_NUM_CHAN - 1) * 2) - 1) : (PMP_NUM_CHAN * 2) - 1):(0 >= (PMP_NUM_CHAN - 1) ? (PMP_NUM_CHAN - 1) * 2 : 0)] pmp_priv_lvl;
			assign pmp_req_addr[(0 >= (PMP_NUM_CHAN - 1) ? ibex_pkg_PMP_I : (PMP_NUM_CHAN - 1) - ibex_pkg_PMP_I) * 34+:34] = {2'b00, instr_addr_o[31:0]};
			assign pmp_req_type[(0 >= (PMP_NUM_CHAN - 1) ? ibex_pkg_PMP_I : (PMP_NUM_CHAN - 1) - ibex_pkg_PMP_I) * 2+:2] = ibex_pkg_PMP_ACC_EXEC;
			assign pmp_priv_lvl[(0 >= (PMP_NUM_CHAN - 1) ? ibex_pkg_PMP_I : (PMP_NUM_CHAN - 1) - ibex_pkg_PMP_I) * 2+:2] = priv_mode_if;
			assign pmp_req_addr[(0 >= (PMP_NUM_CHAN - 1) ? ibex_pkg_PMP_D : (PMP_NUM_CHAN - 1) - ibex_pkg_PMP_D) * 34+:34] = {2'b00, data_addr_o[31:0]};
			assign pmp_req_type[(0 >= (PMP_NUM_CHAN - 1) ? ibex_pkg_PMP_D : (PMP_NUM_CHAN - 1) - ibex_pkg_PMP_D) * 2+:2] = (data_we_o ? ibex_pkg_PMP_ACC_WRITE : ibex_pkg_PMP_ACC_READ);
			assign pmp_priv_lvl[(0 >= (PMP_NUM_CHAN - 1) ? ibex_pkg_PMP_D : (PMP_NUM_CHAN - 1) - ibex_pkg_PMP_D) * 2+:2] = priv_mode_lsu;
			ibex_pmp #(
				.PMPGranularity(PMPGranularity),
				.PMPNumChan(PMP_NUM_CHAN),
				.PMPNumRegions(PMPNumRegions)
			) pmp_i(
				.clk_i(clk_o),
				.rst_ni(rst_ni),
				.csr_pmp_cfg_i(csr_pmp_cfg),
				.csr_pmp_addr_i(csr_pmp_addr),
				.priv_mode_i(pmp_priv_lvl),
				.pmp_req_addr_i(pmp_req_addr),
				.pmp_req_type_i(pmp_req_type),
				.pmp_req_err_o(pmp_req_err)
			);
		end
		else begin : g_no_pmp
			wire [1:0] unused_priv_lvl_if;
			wire [1:0] unused_priv_lvl_ls;
			wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 34) + (((PMPNumRegions - 1) * 34) - 1) : (PMPNumRegions * 34) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 34 : 0)] unused_csr_pmp_addr;
			wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 6) + (((PMPNumRegions - 1) * 6) - 1) : (PMPNumRegions * 6) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 6 : 0)] unused_csr_pmp_cfg;
			assign unused_priv_lvl_if = priv_mode_if;
			assign unused_priv_lvl_ls = priv_mode_lsu;
			assign unused_csr_pmp_addr = csr_pmp_addr;
			assign unused_csr_pmp_cfg = csr_pmp_cfg;
			assign pmp_req_err[ibex_pkg_PMP_I] = 1'b0;
			assign pmp_req_err[ibex_pkg_PMP_D] = 1'b0;
		end
	endgenerate
	wire unused_instr_new_id;
	wire unused_instr_done_wb;
	assign unused_instr_new_id = instr_new_id;
	assign unused_instr_done_wb = instr_done_wb;
endmodule
module ibex_counter (
	clk_i,
	rst_ni,
	counter_inc_i,
	counterh_we_i,
	counter_we_i,
	counter_val_i,
	counter_val_o
);
	parameter signed [31:0] CounterWidth = 32;
	input wire clk_i;
	input wire rst_ni;
	input wire counter_inc_i;
	input wire counterh_we_i;
	input wire counter_we_i;
	input wire [31:0] counter_val_i;
	output wire [63:0] counter_val_o;
	wire [63:0] counter;
	reg [CounterWidth - 1:0] counter_upd;
	reg [63:0] counter_load;
	reg we;
	reg [CounterWidth - 1:0] counter_d;
	always @(*) begin
		we = counter_we_i | counterh_we_i;
		counter_load[63:32] = counter[63:32];
		counter_load[31:0] = counter_val_i;
		if (counterh_we_i) begin
			counter_load[63:32] = counter_val_i;
			counter_load[31:0] = counter[31:0];
		end
		counter_upd = counter[CounterWidth - 1:0] + {{CounterWidth - 1 {1'b0}}, 1'b1};
		if (we)
			counter_d = counter_load[CounterWidth - 1:0];
		else if (counter_inc_i)
			counter_d = counter_upd[CounterWidth - 1:0];
		else
			counter_d = counter[CounterWidth - 1:0];
	end
	reg [CounterWidth - 1:0] counter_q;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			counter_q <= {CounterWidth {1'sb0}};
		else
			counter_q <= counter_d;
	generate
		if (CounterWidth < 64) begin : g_counter_narrow
			wire [63:CounterWidth] unused_counter_load;
			assign counter[CounterWidth - 1:0] = counter_q;
			assign counter[63:CounterWidth] = {(63 >= CounterWidth ? 64 - CounterWidth : CounterWidth - 62) {1'sb0}};
			assign unused_counter_load = counter_load[63:CounterWidth];
		end
		else begin : g_counter_full
			assign counter = counter_q;
		end
	endgenerate
	assign counter_val_o = counter;
endmodule
module ibex_cs_registers (
	clk_i,
	rst_ni,
	hart_id_i,
	priv_mode_id_o,
	priv_mode_if_o,
	priv_mode_lsu_o,
	csr_mstatus_tw_o,
	csr_mtvec_o,
	csr_mtvec_init_i,
	boot_addr_i,
	csr_access_i,
	csr_addr_i,
	csr_wdata_i,
	csr_op_i,
	csr_op_en_i,
	csr_rdata_o,
	irq_software_i,
	irq_timer_i,
	irq_external_i,
	irq_fast_i,
	nmi_mode_i,
	irq_pending_o,
	irqs_o,
	csr_mstatus_mie_o,
	csr_mepc_o,
	csr_pmp_cfg_o,
	csr_pmp_addr_o,
	debug_mode_i,
	debug_cause_i,
	debug_csr_save_i,
	csr_depc_o,
	debug_single_step_o,
	debug_ebreakm_o,
	debug_ebreaku_o,
	trigger_match_o,
	pc_if_i,
	pc_id_i,
	pc_wb_i,
	data_ind_timing_o,
	dummy_instr_en_o,
	dummy_instr_mask_o,
	dummy_instr_seed_en_o,
	dummy_instr_seed_o,
	icache_enable_o,
	csr_shadow_err_o,
	csr_save_if_i,
	csr_save_id_i,
	csr_save_wb_i,
	csr_restore_mret_i,
	csr_restore_dret_i,
	csr_save_cause_i,
	csr_mcause_i,
	csr_mtval_i,
	illegal_csr_insn_o,
	instr_ret_i,
	instr_ret_compressed_i,
	iside_wait_i,
	jump_i,
	branch_i,
	branch_taken_i,
	mem_load_i,
	mem_store_i,
	dside_wait_i,
	mul_wait_i,
	div_wait_i
);
	parameter [0:0] DbgTriggerEn = 0;
	parameter [31:0] DbgHwBreakNum = 1;
	parameter [0:0] DataIndTiming = 1'b0;
	parameter [0:0] DummyInstructions = 1'b0;
	parameter [0:0] ShadowCSR = 1'b0;
	parameter [0:0] ICache = 1'b0;
	parameter [31:0] MHPMCounterNum = 10;
	parameter [31:0] MHPMCounterWidth = 40;
	parameter [0:0] PMPEnable = 0;
	parameter [31:0] PMPGranularity = 0;
	parameter [31:0] PMPNumRegions = 4;
	parameter [0:0] RV32E = 0;
	localparam integer ibex_pkg_RV32MFast = 2;
	parameter integer RV32M = ibex_pkg_RV32MFast;
	input wire clk_i;
	input wire rst_ni;
	input wire [31:0] hart_id_i;
	output wire [1:0] priv_mode_id_o;
	output wire [1:0] priv_mode_if_o;
	output wire [1:0] priv_mode_lsu_o;
	output wire csr_mstatus_tw_o;
	output wire [31:0] csr_mtvec_o;
	input wire csr_mtvec_init_i;
	input wire [31:0] boot_addr_i;
	input wire csr_access_i;
	input wire [11:0] csr_addr_i;
	input wire [31:0] csr_wdata_i;
	input wire [1:0] csr_op_i;
	input csr_op_en_i;
	output wire [31:0] csr_rdata_o;
	input wire irq_software_i;
	input wire irq_timer_i;
	input wire irq_external_i;
	input wire [14:0] irq_fast_i;
	input wire nmi_mode_i;
	output wire irq_pending_o;
	output wire [17:0] irqs_o;
	output wire csr_mstatus_mie_o;
	output wire [31:0] csr_mepc_o;
	output wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 6) + (((PMPNumRegions - 1) * 6) - 1) : (PMPNumRegions * 6) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 6 : 0)] csr_pmp_cfg_o;
	output wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 34) + (((PMPNumRegions - 1) * 34) - 1) : (PMPNumRegions * 34) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 34 : 0)] csr_pmp_addr_o;
	input wire debug_mode_i;
	input wire [2:0] debug_cause_i;
	input wire debug_csr_save_i;
	output wire [31:0] csr_depc_o;
	output wire debug_single_step_o;
	output wire debug_ebreakm_o;
	output wire debug_ebreaku_o;
	output wire trigger_match_o;
	input wire [31:0] pc_if_i;
	input wire [31:0] pc_id_i;
	input wire [31:0] pc_wb_i;
	output wire data_ind_timing_o;
	output wire dummy_instr_en_o;
	output wire [2:0] dummy_instr_mask_o;
	output wire dummy_instr_seed_en_o;
	output wire [31:0] dummy_instr_seed_o;
	output wire icache_enable_o;
	output wire csr_shadow_err_o;
	input wire csr_save_if_i;
	input wire csr_save_id_i;
	input wire csr_save_wb_i;
	input wire csr_restore_mret_i;
	input wire csr_restore_dret_i;
	input wire csr_save_cause_i;
	input wire [5:0] csr_mcause_i;
	input wire [31:0] csr_mtval_i;
	output wire illegal_csr_insn_o;
	input wire instr_ret_i;
	input wire instr_ret_compressed_i;
	input wire iside_wait_i;
	input wire jump_i;
	input wire branch_i;
	input wire branch_taken_i;
	input wire mem_load_i;
	input wire mem_store_i;
	input wire dside_wait_i;
	input wire mul_wait_i;
	input wire div_wait_i;
	localparam integer ibex_pkg_RV32MNone = 0;
	localparam [31:0] RV32MEnabled = (RV32M == ibex_pkg_RV32MNone ? 0 : 1);
	localparam [31:0] PMPAddrWidth = (PMPGranularity > 0 ? 33 - PMPGranularity : 32);
	localparam [1:0] ibex_pkg_CSR_MISA_MXL = 2'd1;
	function automatic [31:0] sv2v_cast_32;
		input reg [31:0] inp;
		sv2v_cast_32 = inp;
	endfunction
	localparam [31:0] MISA_VALUE = ((((((((((0 | 4) | 0) | (sv2v_cast_32(RV32E) << 4)) | 0) | (sv2v_cast_32(!RV32E) << 8)) | (RV32MEnabled << 12)) | 0) | 0) | 1048576) | 0) | (sv2v_cast_32(ibex_pkg_CSR_MISA_MXL) << 30);
	reg [31:0] exception_pc;
	reg [1:0] priv_lvl_q;
	reg [1:0] priv_lvl_d;
	wire [5:0] mstatus_q;
	reg [5:0] mstatus_d;
	wire mstatus_err;
	reg mstatus_en;
	wire [17:0] mie_q;
	wire [17:0] mie_d;
	reg mie_en;
	wire [31:0] mscratch_q;
	reg mscratch_en;
	wire [31:0] mepc_q;
	reg [31:0] mepc_d;
	reg mepc_en;
	wire [5:0] mcause_q;
	reg [5:0] mcause_d;
	reg mcause_en;
	wire [31:0] mtval_q;
	reg [31:0] mtval_d;
	reg mtval_en;
	wire [31:0] mtvec_q;
	reg [31:0] mtvec_d;
	wire mtvec_err;
	reg mtvec_en;
	wire [17:0] mip;
	wire [31:0] dcsr_q;
	reg [31:0] dcsr_d;
	reg dcsr_en;
	wire [31:0] depc_q;
	reg [31:0] depc_d;
	reg depc_en;
	wire [31:0] dscratch0_q;
	wire [31:0] dscratch1_q;
	reg dscratch0_en;
	reg dscratch1_en;
	wire [2:0] mstack_q;
	reg [2:0] mstack_d;
	reg mstack_en;
	wire [31:0] mstack_epc_q;
	reg [31:0] mstack_epc_d;
	wire [5:0] mstack_cause_q;
	reg [5:0] mstack_cause_d;
	localparam [31:0] ibex_pkg_PMP_MAX_REGIONS = 16;
	reg [31:0] pmp_addr_rdata [0:ibex_pkg_PMP_MAX_REGIONS - 1];
	localparam [31:0] ibex_pkg_PMP_CFG_W = 8;
	wire [ibex_pkg_PMP_CFG_W - 1:0] pmp_cfg_rdata [0:ibex_pkg_PMP_MAX_REGIONS - 1];
	wire pmp_csr_err;
	wire [31:0] mcountinhibit;
	reg [MHPMCounterNum + 2:0] mcountinhibit_d;
	reg [MHPMCounterNum + 2:0] mcountinhibit_q;
	reg mcountinhibit_we;
	wire [63:0] mhpmcounter [0:31];
	reg [31:0] mhpmcounter_we;
	reg [31:0] mhpmcounterh_we;
	reg [31:0] mhpmcounter_incr;
	reg [31:0] mhpmevent [0:31];
	wire [4:0] mhpmcounter_idx;
	wire unused_mhpmcounter_we_1;
	wire unused_mhpmcounterh_we_1;
	wire unused_mhpmcounter_incr_1;
	wire [31:0] tselect_rdata;
	wire [31:0] tmatch_control_rdata;
	wire [31:0] tmatch_value_rdata;
	wire [5:0] cpuctrl_q;
	wire [5:0] cpuctrl_d;
	wire [5:0] cpuctrl_wdata;
	reg cpuctrl_we;
	wire cpuctrl_err;
	reg [31:0] csr_wdata_int;
	reg [31:0] csr_rdata_int;
	wire csr_we_int;
	wire csr_wreq;
	reg illegal_csr;
	wire illegal_csr_priv;
	wire illegal_csr_write;
	wire [7:0] unused_boot_addr;
	wire [2:0] unused_csr_addr;
	assign unused_boot_addr = boot_addr_i[7:0];
	wire [11:0] csr_addr;
	assign csr_addr = {csr_addr_i};
	assign unused_csr_addr = csr_addr[7:5];
	assign mhpmcounter_idx = csr_addr[4:0];
	assign illegal_csr_priv = csr_addr[9:8] > {priv_lvl_q};
	assign illegal_csr_write = (csr_addr[11:10] == 2'b11) && csr_wreq;
	assign illegal_csr_insn_o = csr_access_i & ((illegal_csr | illegal_csr_write) | illegal_csr_priv);
	assign mip[17] = irq_software_i;
	assign mip[16] = irq_timer_i;
	assign mip[15] = irq_external_i;
	assign mip[14-:15] = irq_fast_i;
	localparam [31:0] ibex_pkg_CSR_MEIX_BIT = 11;
	localparam [31:0] ibex_pkg_CSR_MFIX_BIT_HIGH = 30;
	localparam [31:0] ibex_pkg_CSR_MFIX_BIT_LOW = 16;
	localparam [31:0] ibex_pkg_CSR_MSIX_BIT = 3;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MIE_BIT = 3;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MPIE_BIT = 7;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MPP_BIT_HIGH = 12;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MPP_BIT_LOW = 11;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_MPRV_BIT = 17;
	localparam [31:0] ibex_pkg_CSR_MSTATUS_TW_BIT = 21;
	localparam [31:0] ibex_pkg_CSR_MTIX_BIT = 7;
	localparam [11:0] ibex_pkg_CSR_CPUCTRL = 12'h7c0;
	localparam [11:0] ibex_pkg_CSR_DCSR = 12'h7b0;
	localparam [11:0] ibex_pkg_CSR_DPC = 12'h7b1;
	localparam [11:0] ibex_pkg_CSR_DSCRATCH0 = 12'h7b2;
	localparam [11:0] ibex_pkg_CSR_DSCRATCH1 = 12'h7b3;
	localparam [11:0] ibex_pkg_CSR_MCAUSE = 12'h342;
	localparam [11:0] ibex_pkg_CSR_MCONTEXT = 12'h7a8;
	localparam [11:0] ibex_pkg_CSR_MCOUNTINHIBIT = 12'h320;
	localparam [11:0] ibex_pkg_CSR_MCYCLE = 12'hb00;
	localparam [11:0] ibex_pkg_CSR_MCYCLEH = 12'hb80;
	localparam [11:0] ibex_pkg_CSR_MEPC = 12'h341;
	localparam [11:0] ibex_pkg_CSR_MHARTID = 12'hf14;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER10 = 12'hb0a;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER10H = 12'hb8a;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER11 = 12'hb0b;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER11H = 12'hb8b;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER12 = 12'hb0c;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER12H = 12'hb8c;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER13 = 12'hb0d;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER13H = 12'hb8d;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER14 = 12'hb0e;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER14H = 12'hb8e;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER15 = 12'hb0f;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER15H = 12'hb8f;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER16 = 12'hb10;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER16H = 12'hb90;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER17 = 12'hb11;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER17H = 12'hb91;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER18 = 12'hb12;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER18H = 12'hb92;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER19 = 12'hb13;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER19H = 12'hb93;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER20 = 12'hb14;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER20H = 12'hb94;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER21 = 12'hb15;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER21H = 12'hb95;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER22 = 12'hb16;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER22H = 12'hb96;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER23 = 12'hb17;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER23H = 12'hb97;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER24 = 12'hb18;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER24H = 12'hb98;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER25 = 12'hb19;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER25H = 12'hb99;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER26 = 12'hb1a;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER26H = 12'hb9a;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER27 = 12'hb1b;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER27H = 12'hb9b;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER28 = 12'hb1c;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER28H = 12'hb9c;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER29 = 12'hb1d;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER29H = 12'hb9d;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER3 = 12'hb03;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER30 = 12'hb1e;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER30H = 12'hb9e;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER31 = 12'hb1f;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER31H = 12'hb9f;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER3H = 12'hb83;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER4 = 12'hb04;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER4H = 12'hb84;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER5 = 12'hb05;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER5H = 12'hb85;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER6 = 12'hb06;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER6H = 12'hb86;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER7 = 12'hb07;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER7H = 12'hb87;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER8 = 12'hb08;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER8H = 12'hb88;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER9 = 12'hb09;
	localparam [11:0] ibex_pkg_CSR_MHPMCOUNTER9H = 12'hb89;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT10 = 12'h32a;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT11 = 12'h32b;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT12 = 12'h32c;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT13 = 12'h32d;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT14 = 12'h32e;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT15 = 12'h32f;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT16 = 12'h330;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT17 = 12'h331;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT18 = 12'h332;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT19 = 12'h333;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT20 = 12'h334;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT21 = 12'h335;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT22 = 12'h336;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT23 = 12'h337;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT24 = 12'h338;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT25 = 12'h339;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT26 = 12'h33a;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT27 = 12'h33b;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT28 = 12'h33c;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT29 = 12'h33d;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT3 = 12'h323;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT30 = 12'h33e;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT31 = 12'h33f;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT4 = 12'h324;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT5 = 12'h325;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT6 = 12'h326;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT7 = 12'h327;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT8 = 12'h328;
	localparam [11:0] ibex_pkg_CSR_MHPMEVENT9 = 12'h329;
	localparam [11:0] ibex_pkg_CSR_MIE = 12'h304;
	localparam [11:0] ibex_pkg_CSR_MINSTRET = 12'hb02;
	localparam [11:0] ibex_pkg_CSR_MINSTRETH = 12'hb82;
	localparam [11:0] ibex_pkg_CSR_MIP = 12'h344;
	localparam [11:0] ibex_pkg_CSR_MISA = 12'h301;
	localparam [11:0] ibex_pkg_CSR_MSCRATCH = 12'h340;
	localparam [11:0] ibex_pkg_CSR_MSTATUS = 12'h300;
	localparam [11:0] ibex_pkg_CSR_MTVAL = 12'h343;
	localparam [11:0] ibex_pkg_CSR_MTVEC = 12'h305;
	localparam [11:0] ibex_pkg_CSR_PMPADDR0 = 12'h3b0;
	localparam [11:0] ibex_pkg_CSR_PMPADDR1 = 12'h3b1;
	localparam [11:0] ibex_pkg_CSR_PMPADDR10 = 12'h3ba;
	localparam [11:0] ibex_pkg_CSR_PMPADDR11 = 12'h3bb;
	localparam [11:0] ibex_pkg_CSR_PMPADDR12 = 12'h3bc;
	localparam [11:0] ibex_pkg_CSR_PMPADDR13 = 12'h3bd;
	localparam [11:0] ibex_pkg_CSR_PMPADDR14 = 12'h3be;
	localparam [11:0] ibex_pkg_CSR_PMPADDR15 = 12'h3bf;
	localparam [11:0] ibex_pkg_CSR_PMPADDR2 = 12'h3b2;
	localparam [11:0] ibex_pkg_CSR_PMPADDR3 = 12'h3b3;
	localparam [11:0] ibex_pkg_CSR_PMPADDR4 = 12'h3b4;
	localparam [11:0] ibex_pkg_CSR_PMPADDR5 = 12'h3b5;
	localparam [11:0] ibex_pkg_CSR_PMPADDR6 = 12'h3b6;
	localparam [11:0] ibex_pkg_CSR_PMPADDR7 = 12'h3b7;
	localparam [11:0] ibex_pkg_CSR_PMPADDR8 = 12'h3b8;
	localparam [11:0] ibex_pkg_CSR_PMPADDR9 = 12'h3b9;
	localparam [11:0] ibex_pkg_CSR_PMPCFG0 = 12'h3a0;
	localparam [11:0] ibex_pkg_CSR_PMPCFG1 = 12'h3a1;
	localparam [11:0] ibex_pkg_CSR_PMPCFG2 = 12'h3a2;
	localparam [11:0] ibex_pkg_CSR_PMPCFG3 = 12'h3a3;
	localparam [11:0] ibex_pkg_CSR_SCONTEXT = 12'h7aa;
	localparam [11:0] ibex_pkg_CSR_SECURESEED = 12'h7c1;
	localparam [11:0] ibex_pkg_CSR_TDATA1 = 12'h7a1;
	localparam [11:0] ibex_pkg_CSR_TDATA2 = 12'h7a2;
	localparam [11:0] ibex_pkg_CSR_TDATA3 = 12'h7a3;
	localparam [11:0] ibex_pkg_CSR_TSELECT = 12'h7a0;
	always @(*) begin
		csr_rdata_int = {32 {1'sb0}};
		illegal_csr = 1'b0;
		case (csr_addr_i)
			ibex_pkg_CSR_MHARTID: csr_rdata_int = hart_id_i;
			ibex_pkg_CSR_MSTATUS: begin
				csr_rdata_int = {32 {1'sb0}};
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_MIE_BIT] = mstatus_q[5];
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_MPIE_BIT] = mstatus_q[4];
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_MPP_BIT_HIGH:ibex_pkg_CSR_MSTATUS_MPP_BIT_LOW] = mstatus_q[3-:2];
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_MPRV_BIT] = mstatus_q[1];
				csr_rdata_int[ibex_pkg_CSR_MSTATUS_TW_BIT] = mstatus_q[0];
			end
			ibex_pkg_CSR_MISA: csr_rdata_int = MISA_VALUE;
			ibex_pkg_CSR_MIE: begin
				csr_rdata_int = {32 {1'sb0}};
				csr_rdata_int[ibex_pkg_CSR_MSIX_BIT] = mie_q[17];
				csr_rdata_int[ibex_pkg_CSR_MTIX_BIT] = mie_q[16];
				csr_rdata_int[ibex_pkg_CSR_MEIX_BIT] = mie_q[15];
				csr_rdata_int[ibex_pkg_CSR_MFIX_BIT_HIGH:ibex_pkg_CSR_MFIX_BIT_LOW] = mie_q[14-:15];
			end
			ibex_pkg_CSR_MSCRATCH: csr_rdata_int = mscratch_q;
			ibex_pkg_CSR_MTVEC: csr_rdata_int = mtvec_q;
			ibex_pkg_CSR_MEPC: csr_rdata_int = mepc_q;
			ibex_pkg_CSR_MCAUSE: csr_rdata_int = {mcause_q[5], 26'b00000000000000000000000000, mcause_q[4:0]};
			ibex_pkg_CSR_MTVAL: csr_rdata_int = mtval_q;
			ibex_pkg_CSR_MIP: begin
				csr_rdata_int = {32 {1'sb0}};
				csr_rdata_int[ibex_pkg_CSR_MSIX_BIT] = mip[17];
				csr_rdata_int[ibex_pkg_CSR_MTIX_BIT] = mip[16];
				csr_rdata_int[ibex_pkg_CSR_MEIX_BIT] = mip[15];
				csr_rdata_int[ibex_pkg_CSR_MFIX_BIT_HIGH:ibex_pkg_CSR_MFIX_BIT_LOW] = mip[14-:15];
			end
			ibex_pkg_CSR_PMPCFG0: csr_rdata_int = {pmp_cfg_rdata[3], pmp_cfg_rdata[2], pmp_cfg_rdata[1], pmp_cfg_rdata[0]};
			ibex_pkg_CSR_PMPCFG1: csr_rdata_int = {pmp_cfg_rdata[7], pmp_cfg_rdata[6], pmp_cfg_rdata[5], pmp_cfg_rdata[4]};
			ibex_pkg_CSR_PMPCFG2: csr_rdata_int = {pmp_cfg_rdata[11], pmp_cfg_rdata[10], pmp_cfg_rdata[9], pmp_cfg_rdata[8]};
			ibex_pkg_CSR_PMPCFG3: csr_rdata_int = {pmp_cfg_rdata[15], pmp_cfg_rdata[14], pmp_cfg_rdata[13], pmp_cfg_rdata[12]};
			ibex_pkg_CSR_PMPADDR0: csr_rdata_int = pmp_addr_rdata[0];
			ibex_pkg_CSR_PMPADDR1: csr_rdata_int = pmp_addr_rdata[1];
			ibex_pkg_CSR_PMPADDR2: csr_rdata_int = pmp_addr_rdata[2];
			ibex_pkg_CSR_PMPADDR3: csr_rdata_int = pmp_addr_rdata[3];
			ibex_pkg_CSR_PMPADDR4: csr_rdata_int = pmp_addr_rdata[4];
			ibex_pkg_CSR_PMPADDR5: csr_rdata_int = pmp_addr_rdata[5];
			ibex_pkg_CSR_PMPADDR6: csr_rdata_int = pmp_addr_rdata[6];
			ibex_pkg_CSR_PMPADDR7: csr_rdata_int = pmp_addr_rdata[7];
			ibex_pkg_CSR_PMPADDR8: csr_rdata_int = pmp_addr_rdata[8];
			ibex_pkg_CSR_PMPADDR9: csr_rdata_int = pmp_addr_rdata[9];
			ibex_pkg_CSR_PMPADDR10: csr_rdata_int = pmp_addr_rdata[10];
			ibex_pkg_CSR_PMPADDR11: csr_rdata_int = pmp_addr_rdata[11];
			ibex_pkg_CSR_PMPADDR12: csr_rdata_int = pmp_addr_rdata[12];
			ibex_pkg_CSR_PMPADDR13: csr_rdata_int = pmp_addr_rdata[13];
			ibex_pkg_CSR_PMPADDR14: csr_rdata_int = pmp_addr_rdata[14];
			ibex_pkg_CSR_PMPADDR15: csr_rdata_int = pmp_addr_rdata[15];
			ibex_pkg_CSR_DCSR: begin
				csr_rdata_int = dcsr_q;
				illegal_csr = ~debug_mode_i;
			end
			ibex_pkg_CSR_DPC: begin
				csr_rdata_int = depc_q;
				illegal_csr = ~debug_mode_i;
			end
			ibex_pkg_CSR_DSCRATCH0: begin
				csr_rdata_int = dscratch0_q;
				illegal_csr = ~debug_mode_i;
			end
			ibex_pkg_CSR_DSCRATCH1: begin
				csr_rdata_int = dscratch1_q;
				illegal_csr = ~debug_mode_i;
			end
			ibex_pkg_CSR_MCOUNTINHIBIT: csr_rdata_int = mcountinhibit;
			ibex_pkg_CSR_MHPMEVENT3, ibex_pkg_CSR_MHPMEVENT4, ibex_pkg_CSR_MHPMEVENT5, ibex_pkg_CSR_MHPMEVENT6, ibex_pkg_CSR_MHPMEVENT7, ibex_pkg_CSR_MHPMEVENT8, ibex_pkg_CSR_MHPMEVENT9, ibex_pkg_CSR_MHPMEVENT10, ibex_pkg_CSR_MHPMEVENT11, ibex_pkg_CSR_MHPMEVENT12, ibex_pkg_CSR_MHPMEVENT13, ibex_pkg_CSR_MHPMEVENT14, ibex_pkg_CSR_MHPMEVENT15, ibex_pkg_CSR_MHPMEVENT16, ibex_pkg_CSR_MHPMEVENT17, ibex_pkg_CSR_MHPMEVENT18, ibex_pkg_CSR_MHPMEVENT19, ibex_pkg_CSR_MHPMEVENT20, ibex_pkg_CSR_MHPMEVENT21, ibex_pkg_CSR_MHPMEVENT22, ibex_pkg_CSR_MHPMEVENT23, ibex_pkg_CSR_MHPMEVENT24, ibex_pkg_CSR_MHPMEVENT25, ibex_pkg_CSR_MHPMEVENT26, ibex_pkg_CSR_MHPMEVENT27, ibex_pkg_CSR_MHPMEVENT28, ibex_pkg_CSR_MHPMEVENT29, ibex_pkg_CSR_MHPMEVENT30, ibex_pkg_CSR_MHPMEVENT31: csr_rdata_int = mhpmevent[mhpmcounter_idx];
			ibex_pkg_CSR_MCYCLE, ibex_pkg_CSR_MINSTRET, ibex_pkg_CSR_MHPMCOUNTER3, ibex_pkg_CSR_MHPMCOUNTER4, ibex_pkg_CSR_MHPMCOUNTER5, ibex_pkg_CSR_MHPMCOUNTER6, ibex_pkg_CSR_MHPMCOUNTER7, ibex_pkg_CSR_MHPMCOUNTER8, ibex_pkg_CSR_MHPMCOUNTER9, ibex_pkg_CSR_MHPMCOUNTER10, ibex_pkg_CSR_MHPMCOUNTER11, ibex_pkg_CSR_MHPMCOUNTER12, ibex_pkg_CSR_MHPMCOUNTER13, ibex_pkg_CSR_MHPMCOUNTER14, ibex_pkg_CSR_MHPMCOUNTER15, ibex_pkg_CSR_MHPMCOUNTER16, ibex_pkg_CSR_MHPMCOUNTER17, ibex_pkg_CSR_MHPMCOUNTER18, ibex_pkg_CSR_MHPMCOUNTER19, ibex_pkg_CSR_MHPMCOUNTER20, ibex_pkg_CSR_MHPMCOUNTER21, ibex_pkg_CSR_MHPMCOUNTER22, ibex_pkg_CSR_MHPMCOUNTER23, ibex_pkg_CSR_MHPMCOUNTER24, ibex_pkg_CSR_MHPMCOUNTER25, ibex_pkg_CSR_MHPMCOUNTER26, ibex_pkg_CSR_MHPMCOUNTER27, ibex_pkg_CSR_MHPMCOUNTER28, ibex_pkg_CSR_MHPMCOUNTER29, ibex_pkg_CSR_MHPMCOUNTER30, ibex_pkg_CSR_MHPMCOUNTER31: csr_rdata_int = mhpmcounter[mhpmcounter_idx][31:0];
			ibex_pkg_CSR_MCYCLEH, ibex_pkg_CSR_MINSTRETH, ibex_pkg_CSR_MHPMCOUNTER3H, ibex_pkg_CSR_MHPMCOUNTER4H, ibex_pkg_CSR_MHPMCOUNTER5H, ibex_pkg_CSR_MHPMCOUNTER6H, ibex_pkg_CSR_MHPMCOUNTER7H, ibex_pkg_CSR_MHPMCOUNTER8H, ibex_pkg_CSR_MHPMCOUNTER9H, ibex_pkg_CSR_MHPMCOUNTER10H, ibex_pkg_CSR_MHPMCOUNTER11H, ibex_pkg_CSR_MHPMCOUNTER12H, ibex_pkg_CSR_MHPMCOUNTER13H, ibex_pkg_CSR_MHPMCOUNTER14H, ibex_pkg_CSR_MHPMCOUNTER15H, ibex_pkg_CSR_MHPMCOUNTER16H, ibex_pkg_CSR_MHPMCOUNTER17H, ibex_pkg_CSR_MHPMCOUNTER18H, ibex_pkg_CSR_MHPMCOUNTER19H, ibex_pkg_CSR_MHPMCOUNTER20H, ibex_pkg_CSR_MHPMCOUNTER21H, ibex_pkg_CSR_MHPMCOUNTER22H, ibex_pkg_CSR_MHPMCOUNTER23H, ibex_pkg_CSR_MHPMCOUNTER24H, ibex_pkg_CSR_MHPMCOUNTER25H, ibex_pkg_CSR_MHPMCOUNTER26H, ibex_pkg_CSR_MHPMCOUNTER27H, ibex_pkg_CSR_MHPMCOUNTER28H, ibex_pkg_CSR_MHPMCOUNTER29H, ibex_pkg_CSR_MHPMCOUNTER30H, ibex_pkg_CSR_MHPMCOUNTER31H: csr_rdata_int = mhpmcounter[mhpmcounter_idx][63:32];
			ibex_pkg_CSR_TSELECT: begin
				csr_rdata_int = tselect_rdata;
				illegal_csr = ~DbgTriggerEn;
			end
			ibex_pkg_CSR_TDATA1: begin
				csr_rdata_int = tmatch_control_rdata;
				illegal_csr = ~DbgTriggerEn;
			end
			ibex_pkg_CSR_TDATA2: begin
				csr_rdata_int = tmatch_value_rdata;
				illegal_csr = ~DbgTriggerEn;
			end
			ibex_pkg_CSR_TDATA3: begin
				csr_rdata_int = {32 {1'sb0}};
				illegal_csr = ~DbgTriggerEn;
			end
			ibex_pkg_CSR_MCONTEXT: begin
				csr_rdata_int = {32 {1'sb0}};
				illegal_csr = ~DbgTriggerEn;
			end
			ibex_pkg_CSR_SCONTEXT: begin
				csr_rdata_int = {32 {1'sb0}};
				illegal_csr = ~DbgTriggerEn;
			end
			ibex_pkg_CSR_CPUCTRL: csr_rdata_int = {{26 {1'b0}}, cpuctrl_q};
			ibex_pkg_CSR_SECURESEED: csr_rdata_int = {32 {1'sb0}};
			default: illegal_csr = 1'b1;
		endcase
	end
	localparam [1:0] ibex_pkg_PRIV_LVL_M = 2'b11;
	localparam [1:0] ibex_pkg_PRIV_LVL_U = 2'b00;
	localparam [3:0] ibex_pkg_XDEBUGVER_STD = 4'd4;
	function automatic [1:0] sv2v_cast_2;
		input reg [1:0] inp;
		sv2v_cast_2 = inp;
	endfunction
	always @(*) begin
		exception_pc = pc_id_i;
		priv_lvl_d = priv_lvl_q;
		mstatus_en = 1'b0;
		mstatus_d = mstatus_q;
		mie_en = 1'b0;
		mscratch_en = 1'b0;
		mepc_en = 1'b0;
		mepc_d = {csr_wdata_int[31:1], 1'b0};
		mcause_en = 1'b0;
		mcause_d = {csr_wdata_int[31], csr_wdata_int[4:0]};
		mtval_en = 1'b0;
		mtval_d = csr_wdata_int;
		mtvec_en = csr_mtvec_init_i;
		mtvec_d = (csr_mtvec_init_i ? {boot_addr_i[31:8], 6'b000000, 2'b01} : {csr_wdata_int[31:8], 6'b000000, 2'b01});
		dcsr_en = 1'b0;
		dcsr_d = dcsr_q;
		depc_d = {csr_wdata_int[31:1], 1'b0};
		depc_en = 1'b0;
		dscratch0_en = 1'b0;
		dscratch1_en = 1'b0;
		mstack_en = 1'b0;
		mstack_d[2] = mstatus_q[4];
		mstack_d[1-:2] = mstatus_q[3-:2];
		mstack_epc_d = mepc_q;
		mstack_cause_d = mcause_q;
		mcountinhibit_we = 1'b0;
		mhpmcounter_we = {32 {1'sb0}};
		mhpmcounterh_we = {32 {1'sb0}};
		cpuctrl_we = 1'b0;
		if (csr_we_int)
			case (csr_addr_i)
				ibex_pkg_CSR_MSTATUS: begin
					mstatus_en = 1'b1;
					mstatus_d = {csr_wdata_int[ibex_pkg_CSR_MSTATUS_MIE_BIT], csr_wdata_int[ibex_pkg_CSR_MSTATUS_MPIE_BIT], sv2v_cast_2(csr_wdata_int[ibex_pkg_CSR_MSTATUS_MPP_BIT_HIGH:ibex_pkg_CSR_MSTATUS_MPP_BIT_LOW]), csr_wdata_int[ibex_pkg_CSR_MSTATUS_MPRV_BIT], csr_wdata_int[ibex_pkg_CSR_MSTATUS_TW_BIT]};
					if ((mstatus_d[3-:2] != ibex_pkg_PRIV_LVL_M) && (mstatus_d[3-:2] != ibex_pkg_PRIV_LVL_U))
						mstatus_d[3-:2] = ibex_pkg_PRIV_LVL_M;
				end
				ibex_pkg_CSR_MIE: mie_en = 1'b1;
				ibex_pkg_CSR_MSCRATCH: mscratch_en = 1'b1;
				ibex_pkg_CSR_MEPC: mepc_en = 1'b1;
				ibex_pkg_CSR_MCAUSE: mcause_en = 1'b1;
				ibex_pkg_CSR_MTVAL: mtval_en = 1'b1;
				ibex_pkg_CSR_MTVEC: mtvec_en = 1'b1;
				ibex_pkg_CSR_DCSR: begin
					dcsr_d = csr_wdata_int;
					dcsr_d[31-:4] = ibex_pkg_XDEBUGVER_STD;
					if ((dcsr_d[1-:2] != ibex_pkg_PRIV_LVL_M) && (dcsr_d[1-:2] != ibex_pkg_PRIV_LVL_U))
						dcsr_d[1-:2] = ibex_pkg_PRIV_LVL_M;
					dcsr_d[8-:3] = dcsr_q[8-:3];
					dcsr_d[3] = 1'b0;
					dcsr_d[4] = 1'b0;
					dcsr_d[10] = 1'b0;
					dcsr_d[9] = 1'b0;
					dcsr_d[5] = 1'b0;
					dcsr_d[14] = 1'b0;
					dcsr_d[27-:12] = 12'h000;
					dcsr_en = 1'b1;
				end
				ibex_pkg_CSR_DPC: depc_en = 1'b1;
				ibex_pkg_CSR_DSCRATCH0: dscratch0_en = 1'b1;
				ibex_pkg_CSR_DSCRATCH1: dscratch1_en = 1'b1;
				ibex_pkg_CSR_MCOUNTINHIBIT: mcountinhibit_we = 1'b1;
				ibex_pkg_CSR_MCYCLE, ibex_pkg_CSR_MINSTRET, ibex_pkg_CSR_MHPMCOUNTER3, ibex_pkg_CSR_MHPMCOUNTER4, ibex_pkg_CSR_MHPMCOUNTER5, ibex_pkg_CSR_MHPMCOUNTER6, ibex_pkg_CSR_MHPMCOUNTER7, ibex_pkg_CSR_MHPMCOUNTER8, ibex_pkg_CSR_MHPMCOUNTER9, ibex_pkg_CSR_MHPMCOUNTER10, ibex_pkg_CSR_MHPMCOUNTER11, ibex_pkg_CSR_MHPMCOUNTER12, ibex_pkg_CSR_MHPMCOUNTER13, ibex_pkg_CSR_MHPMCOUNTER14, ibex_pkg_CSR_MHPMCOUNTER15, ibex_pkg_CSR_MHPMCOUNTER16, ibex_pkg_CSR_MHPMCOUNTER17, ibex_pkg_CSR_MHPMCOUNTER18, ibex_pkg_CSR_MHPMCOUNTER19, ibex_pkg_CSR_MHPMCOUNTER20, ibex_pkg_CSR_MHPMCOUNTER21, ibex_pkg_CSR_MHPMCOUNTER22, ibex_pkg_CSR_MHPMCOUNTER23, ibex_pkg_CSR_MHPMCOUNTER24, ibex_pkg_CSR_MHPMCOUNTER25, ibex_pkg_CSR_MHPMCOUNTER26, ibex_pkg_CSR_MHPMCOUNTER27, ibex_pkg_CSR_MHPMCOUNTER28, ibex_pkg_CSR_MHPMCOUNTER29, ibex_pkg_CSR_MHPMCOUNTER30, ibex_pkg_CSR_MHPMCOUNTER31: mhpmcounter_we[mhpmcounter_idx] = 1'b1;
				ibex_pkg_CSR_MCYCLEH, ibex_pkg_CSR_MINSTRETH, ibex_pkg_CSR_MHPMCOUNTER3H, ibex_pkg_CSR_MHPMCOUNTER4H, ibex_pkg_CSR_MHPMCOUNTER5H, ibex_pkg_CSR_MHPMCOUNTER6H, ibex_pkg_CSR_MHPMCOUNTER7H, ibex_pkg_CSR_MHPMCOUNTER8H, ibex_pkg_CSR_MHPMCOUNTER9H, ibex_pkg_CSR_MHPMCOUNTER10H, ibex_pkg_CSR_MHPMCOUNTER11H, ibex_pkg_CSR_MHPMCOUNTER12H, ibex_pkg_CSR_MHPMCOUNTER13H, ibex_pkg_CSR_MHPMCOUNTER14H, ibex_pkg_CSR_MHPMCOUNTER15H, ibex_pkg_CSR_MHPMCOUNTER16H, ibex_pkg_CSR_MHPMCOUNTER17H, ibex_pkg_CSR_MHPMCOUNTER18H, ibex_pkg_CSR_MHPMCOUNTER19H, ibex_pkg_CSR_MHPMCOUNTER20H, ibex_pkg_CSR_MHPMCOUNTER21H, ibex_pkg_CSR_MHPMCOUNTER22H, ibex_pkg_CSR_MHPMCOUNTER23H, ibex_pkg_CSR_MHPMCOUNTER24H, ibex_pkg_CSR_MHPMCOUNTER25H, ibex_pkg_CSR_MHPMCOUNTER26H, ibex_pkg_CSR_MHPMCOUNTER27H, ibex_pkg_CSR_MHPMCOUNTER28H, ibex_pkg_CSR_MHPMCOUNTER29H, ibex_pkg_CSR_MHPMCOUNTER30H, ibex_pkg_CSR_MHPMCOUNTER31H: mhpmcounterh_we[mhpmcounter_idx] = 1'b1;
				ibex_pkg_CSR_CPUCTRL: cpuctrl_we = 1'b1;
				default:
					;
			endcase
		case (1'b1)
			csr_save_cause_i: begin
				case (1'b1)
					csr_save_if_i: exception_pc = pc_if_i;
					csr_save_id_i: exception_pc = pc_id_i;
					csr_save_wb_i: exception_pc = pc_wb_i;
					default:
						;
				endcase
				priv_lvl_d = ibex_pkg_PRIV_LVL_M;
				if (debug_csr_save_i) begin
					dcsr_d[1-:2] = priv_lvl_q;
					dcsr_d[8-:3] = debug_cause_i;
					dcsr_en = 1'b1;
					depc_d = exception_pc;
					depc_en = 1'b1;
				end
				else if (!debug_mode_i) begin
					mtval_en = 1'b1;
					mtval_d = csr_mtval_i;
					mstatus_en = 1'b1;
					mstatus_d[5] = 1'b0;
					mstatus_d[4] = mstatus_q[5];
					mstatus_d[3-:2] = priv_lvl_q;
					mepc_en = 1'b1;
					mepc_d = exception_pc;
					mcause_en = 1'b1;
					mcause_d = {csr_mcause_i};
					mstack_en = 1'b1;
				end
			end
			csr_restore_dret_i: priv_lvl_d = dcsr_q[1-:2];
			csr_restore_mret_i: begin
				priv_lvl_d = mstatus_q[3-:2];
				mstatus_en = 1'b1;
				mstatus_d[5] = mstatus_q[4];
				if (nmi_mode_i) begin
					mstatus_d[4] = mstack_q[2];
					mstatus_d[3-:2] = mstack_q[1-:2];
					mepc_en = 1'b1;
					mepc_d = mstack_epc_q;
					mcause_en = 1'b1;
					mcause_d = mstack_cause_q;
				end
				else begin
					mstatus_d[4] = 1'b1;
					mstatus_d[3-:2] = ibex_pkg_PRIV_LVL_U;
				end
			end
			default:
				;
		endcase
	end
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			priv_lvl_q <= ibex_pkg_PRIV_LVL_M;
		else
			priv_lvl_q <= priv_lvl_d;
	assign priv_mode_id_o = priv_lvl_q;
	assign priv_mode_if_o = priv_lvl_d;
	assign priv_mode_lsu_o = (mstatus_q[1] ? mstatus_q[3-:2] : priv_lvl_q);
	localparam [1:0] ibex_pkg_CSR_OP_CLEAR = 3;
	localparam [1:0] ibex_pkg_CSR_OP_READ = 0;
	localparam [1:0] ibex_pkg_CSR_OP_SET = 2;
	localparam [1:0] ibex_pkg_CSR_OP_WRITE = 1;
	always @(*)
		case (csr_op_i)
			ibex_pkg_CSR_OP_WRITE: csr_wdata_int = csr_wdata_i;
			ibex_pkg_CSR_OP_SET: csr_wdata_int = csr_wdata_i | csr_rdata_o;
			ibex_pkg_CSR_OP_CLEAR: csr_wdata_int = ~csr_wdata_i & csr_rdata_o;
			ibex_pkg_CSR_OP_READ: csr_wdata_int = csr_wdata_i;
			default: csr_wdata_int = csr_wdata_i;
		endcase
	assign csr_wreq = csr_op_en_i & |{csr_op_i == ibex_pkg_CSR_OP_WRITE, csr_op_i == ibex_pkg_CSR_OP_SET, csr_op_i == ibex_pkg_CSR_OP_CLEAR};
	assign csr_we_int = csr_wreq & ~illegal_csr_insn_o;
	assign csr_rdata_o = csr_rdata_int;
	assign csr_mepc_o = mepc_q;
	assign csr_depc_o = depc_q;
	assign csr_mtvec_o = mtvec_q;
	assign csr_mstatus_mie_o = mstatus_q[5];
	assign csr_mstatus_tw_o = mstatus_q[0];
	assign debug_single_step_o = dcsr_q[2];
	assign debug_ebreakm_o = dcsr_q[15];
	assign debug_ebreaku_o = dcsr_q[12];
	assign irqs_o = mip & mie_q;
	assign irq_pending_o = |irqs_o;
	localparam [5:0] MSTATUS_RST_VAL = {1'b0, 1'b1, ibex_pkg_PRIV_LVL_U, 1'b0, 1'b0};
	ibex_csr #(
		.Width(6),
		.ShadowCopy(ShadowCSR),
		.ResetValue({MSTATUS_RST_VAL})
	) u_mstatus_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i({mstatus_d}),
		.wr_en_i(mstatus_en),
		.rd_data_o(mstatus_q),
		.rd_error_o(mstatus_err)
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_mepc_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(mepc_d),
		.wr_en_i(mepc_en),
		.rd_data_o(mepc_q),
		.rd_error_o()
	);
	assign mie_d[17] = csr_wdata_int[ibex_pkg_CSR_MSIX_BIT];
	assign mie_d[16] = csr_wdata_int[ibex_pkg_CSR_MTIX_BIT];
	assign mie_d[15] = csr_wdata_int[ibex_pkg_CSR_MEIX_BIT];
	assign mie_d[14-:15] = csr_wdata_int[ibex_pkg_CSR_MFIX_BIT_HIGH:ibex_pkg_CSR_MFIX_BIT_LOW];
	ibex_csr #(
		.Width(18),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_mie_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i({mie_d}),
		.wr_en_i(mie_en),
		.rd_data_o(mie_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_mscratch_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(csr_wdata_int),
		.wr_en_i(mscratch_en),
		.rd_data_o(mscratch_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(6),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_mcause_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(mcause_d),
		.wr_en_i(mcause_en),
		.rd_data_o(mcause_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_mtval_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(mtval_d),
		.wr_en_i(mtval_en),
		.rd_data_o(mtval_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(ShadowCSR),
		.ResetValue(32'd1)
	) u_mtvec_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(mtvec_d),
		.wr_en_i(mtvec_en),
		.rd_data_o(mtvec_q),
		.rd_error_o(mtvec_err)
	);
	localparam [2:0] ibex_pkg_DBG_CAUSE_NONE = 3'h0;
	localparam [31:0] DCSR_RESET_VAL = {ibex_pkg_XDEBUGVER_STD, 12'b000000000000, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, ibex_pkg_DBG_CAUSE_NONE, 1'b0, 1'b0, 1'b0, 1'b0, ibex_pkg_PRIV_LVL_M};
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue({DCSR_RESET_VAL})
	) u_dcsr_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i({dcsr_d}),
		.wr_en_i(dcsr_en),
		.rd_data_o(dcsr_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_depc_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(depc_d),
		.wr_en_i(depc_en),
		.rd_data_o(depc_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_dscratch0_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(csr_wdata_int),
		.wr_en_i(dscratch0_en),
		.rd_data_o(dscratch0_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_dscratch1_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(csr_wdata_int),
		.wr_en_i(dscratch1_en),
		.rd_data_o(dscratch1_q),
		.rd_error_o()
	);
	localparam [2:0] MSTACK_RESET_VAL = {1'b1, ibex_pkg_PRIV_LVL_U};
	ibex_csr #(
		.Width(3),
		.ShadowCopy(1'b0),
		.ResetValue({MSTACK_RESET_VAL})
	) u_mstack_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i({mstack_d}),
		.wr_en_i(mstack_en),
		.rd_data_o(mstack_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(32),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_mstack_epc_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(mstack_epc_d),
		.wr_en_i(mstack_en),
		.rd_data_o(mstack_epc_q),
		.rd_error_o()
	);
	ibex_csr #(
		.Width(6),
		.ShadowCopy(1'b0),
		.ResetValue('0)
	) u_mstack_cause_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i(mstack_cause_d),
		.wr_en_i(mstack_en),
		.rd_data_o(mstack_cause_q),
		.rd_error_o()
	);
	localparam [11:0] ibex_pkg_CSR_OFF_PMP_ADDR = 12'h3b0;
	localparam [11:0] ibex_pkg_CSR_OFF_PMP_CFG = 12'h3a0;
	localparam [1:0] ibex_pkg_PMP_MODE_NA4 = 2'b10;
	localparam [1:0] ibex_pkg_PMP_MODE_NAPOT = 2'b11;
	localparam [1:0] ibex_pkg_PMP_MODE_OFF = 2'b00;
	localparam [1:0] ibex_pkg_PMP_MODE_TOR = 2'b01;
	generate
		if (PMPEnable) begin : g_pmp_registers
			wire [5:0] pmp_cfg [0:PMPNumRegions - 1];
			reg [5:0] pmp_cfg_wdata [0:PMPNumRegions - 1];
			wire [PMPAddrWidth - 1:0] pmp_addr [0:PMPNumRegions - 1];
			wire [PMPNumRegions - 1:0] pmp_cfg_we;
			wire [PMPNumRegions - 1:0] pmp_cfg_err;
			wire [PMPNumRegions - 1:0] pmp_addr_we;
			wire [PMPNumRegions - 1:0] pmp_addr_err;
			genvar i;
			for (i = 0; i < ibex_pkg_PMP_MAX_REGIONS; i = i + 1) begin : g_exp_rd_data
				if (i < PMPNumRegions) begin : g_implemented_regions
					assign pmp_cfg_rdata[i] = {pmp_cfg[i][5], 2'b00, pmp_cfg[i][4-:2], pmp_cfg[i][2], pmp_cfg[i][1], pmp_cfg[i][0]};
					if (PMPGranularity == 0) begin : g_pmp_g0
						wire [PMPAddrWidth:1] sv2v_tmp_D3A6A;
						assign sv2v_tmp_D3A6A = pmp_addr[i];
						always @(*) pmp_addr_rdata[i] = sv2v_tmp_D3A6A;
					end
					else if (PMPGranularity == 1) begin : g_pmp_g1
						always @(*) begin
							pmp_addr_rdata[i] = pmp_addr[i];
							if ((pmp_cfg[i][4-:2] == ibex_pkg_PMP_MODE_OFF) || (pmp_cfg[i][4-:2] == ibex_pkg_PMP_MODE_TOR))
								pmp_addr_rdata[i][PMPGranularity - 1:0] = {PMPGranularity {1'sb0}};
						end
					end
					else begin : g_pmp_g2
						always @(*) begin
							pmp_addr_rdata[i] = {pmp_addr[i], {PMPGranularity - 1 {1'b1}}};
							if ((pmp_cfg[i][4-:2] == ibex_pkg_PMP_MODE_OFF) || (pmp_cfg[i][4-:2] == ibex_pkg_PMP_MODE_TOR))
								pmp_addr_rdata[i][PMPGranularity - 1:0] = {PMPGranularity {1'sb0}};
						end
					end
				end
				else begin : g_other_regions
					assign pmp_cfg_rdata[i] = {ibex_pkg_PMP_CFG_W {1'sb0}};
					wire [32:1] sv2v_tmp_313D8;
					assign sv2v_tmp_313D8 = {32 {1'sb0}};
					always @(*) pmp_addr_rdata[i] = sv2v_tmp_313D8;
				end
			end
			for (i = 0; i < PMPNumRegions; i = i + 1) begin : g_pmp_csrs
				assign pmp_cfg_we[i] = (csr_we_int & ~pmp_cfg[i][5]) & (csr_addr == (ibex_pkg_CSR_OFF_PMP_CFG + (i[11:0] >> 2)));
				wire [1:1] sv2v_tmp_12AC7;
				assign sv2v_tmp_12AC7 = csr_wdata_int[((i % 4) * ibex_pkg_PMP_CFG_W) + 7];
				always @(*) pmp_cfg_wdata[i][5] = sv2v_tmp_12AC7;
				always @(*)
					case (csr_wdata_int[((i % 4) * ibex_pkg_PMP_CFG_W) + 3+:2])
						2'b00: pmp_cfg_wdata[i][4-:2] = ibex_pkg_PMP_MODE_OFF;
						2'b01: pmp_cfg_wdata[i][4-:2] = ibex_pkg_PMP_MODE_TOR;
						2'b10: pmp_cfg_wdata[i][4-:2] = (PMPGranularity == 0 ? ibex_pkg_PMP_MODE_NA4 : ibex_pkg_PMP_MODE_OFF);
						2'b11: pmp_cfg_wdata[i][4-:2] = ibex_pkg_PMP_MODE_NAPOT;
						default: pmp_cfg_wdata[i][4-:2] = ibex_pkg_PMP_MODE_OFF;
					endcase
				wire [1:1] sv2v_tmp_B1072;
				assign sv2v_tmp_B1072 = csr_wdata_int[((i % 4) * ibex_pkg_PMP_CFG_W) + 2];
				always @(*) pmp_cfg_wdata[i][2] = sv2v_tmp_B1072;
				wire [1:1] sv2v_tmp_CFE62;
				assign sv2v_tmp_CFE62 = &csr_wdata_int[(i % 4) * ibex_pkg_PMP_CFG_W+:2];
				always @(*) pmp_cfg_wdata[i][1] = sv2v_tmp_CFE62;
				wire [1:1] sv2v_tmp_FD795;
				assign sv2v_tmp_FD795 = csr_wdata_int[(i % 4) * ibex_pkg_PMP_CFG_W];
				always @(*) pmp_cfg_wdata[i][0] = sv2v_tmp_FD795;
				ibex_csr #(
					.Width(6),
					.ShadowCopy(ShadowCSR),
					.ResetValue('0)
				) u_pmp_cfg_csr(
					.clk_i(clk_i),
					.rst_ni(rst_ni),
					.wr_data_i({pmp_cfg_wdata[i]}),
					.wr_en_i(pmp_cfg_we[i]),
					.rd_data_o(pmp_cfg[i]),
					.rd_error_o(pmp_cfg_err[i])
				);
				if (i < (PMPNumRegions - 1)) begin : g_lower
					assign pmp_addr_we[i] = ((csr_we_int & ~pmp_cfg[i][5]) & (~pmp_cfg[i + 1][5] | (pmp_cfg[i + 1][4-:2] != ibex_pkg_PMP_MODE_TOR))) & (csr_addr == (ibex_pkg_CSR_OFF_PMP_ADDR + i[11:0]));
				end
				else begin : g_upper
					assign pmp_addr_we[i] = (csr_we_int & ~pmp_cfg[i][5]) & (csr_addr == (ibex_pkg_CSR_OFF_PMP_ADDR + i[11:0]));
				end
				ibex_csr #(
					.Width(PMPAddrWidth),
					.ShadowCopy(ShadowCSR),
					.ResetValue('0)
				) u_pmp_addr_csr(
					.clk_i(clk_i),
					.rst_ni(rst_ni),
					.wr_data_i(csr_wdata_int[31-:PMPAddrWidth]),
					.wr_en_i(pmp_addr_we[i]),
					.rd_data_o(pmp_addr[i]),
					.rd_error_o(pmp_addr_err[i])
				);
				assign csr_pmp_cfg_o[(0 >= (PMPNumRegions - 1) ? i : (PMPNumRegions - 1) - i) * 6+:6] = pmp_cfg[i];
				assign csr_pmp_addr_o[(0 >= (PMPNumRegions - 1) ? i : (PMPNumRegions - 1) - i) * 34+:34] = {pmp_addr_rdata[i], 2'b00};
			end
			assign pmp_csr_err = |pmp_cfg_err | |pmp_addr_err;
		end
		else begin : g_no_pmp_tieoffs
			genvar i;
			for (i = 0; i < ibex_pkg_PMP_MAX_REGIONS; i = i + 1) begin : g_rdata
				wire [32:1] sv2v_tmp_313D8;
				assign sv2v_tmp_313D8 = {32 {1'sb0}};
				always @(*) pmp_addr_rdata[i] = sv2v_tmp_313D8;
				assign pmp_cfg_rdata[i] = {ibex_pkg_PMP_CFG_W {1'sb0}};
			end
			for (i = 0; i < PMPNumRegions; i = i + 1) begin : g_outputs
				function automatic [5:0] sv2v_cast_6;
					input reg [5:0] inp;
					sv2v_cast_6 = inp;
				endfunction
				assign csr_pmp_cfg_o[(0 >= (PMPNumRegions - 1) ? i : (PMPNumRegions - 1) - i) * 6+:6] = sv2v_cast_6(1'b0);
				assign csr_pmp_addr_o[(0 >= (PMPNumRegions - 1) ? i : (PMPNumRegions - 1) - i) * 34+:34] = {34 {1'sb0}};
			end
			assign pmp_csr_err = 1'b0;
		end
	endgenerate
	always @(*) begin : mcountinhibit_update
		if (mcountinhibit_we == 1'b1)
			mcountinhibit_d = {csr_wdata_int[MHPMCounterNum + 2:2], 1'b0, csr_wdata_int[0]};
		else
			mcountinhibit_d = mcountinhibit_q;
	end
	always @(*) begin : gen_mhpmcounter_incr
		begin : sv2v_autoblock_7
			reg [31:0] i;
			for (i = 0; i < 32; i = i + 1)
				begin : gen_mhpmcounter_incr_inactive
					mhpmcounter_incr[i] = 1'b0;
				end
		end
		mhpmcounter_incr[0] = 1'b1;
		mhpmcounter_incr[1] = 1'b0;
		mhpmcounter_incr[2] = instr_ret_i;
		mhpmcounter_incr[3] = dside_wait_i;
		mhpmcounter_incr[4] = iside_wait_i;
		mhpmcounter_incr[5] = mem_load_i;
		mhpmcounter_incr[6] = mem_store_i;
		mhpmcounter_incr[7] = jump_i;
		mhpmcounter_incr[8] = branch_i;
		mhpmcounter_incr[9] = branch_taken_i;
		mhpmcounter_incr[10] = instr_ret_compressed_i;
		mhpmcounter_incr[11] = mul_wait_i;
		mhpmcounter_incr[12] = div_wait_i;
	end
	always @(*) begin : gen_mhpmevent
		begin : sv2v_autoblock_8
			reg signed [31:0] i;
			for (i = 0; i < 32; i = i + 1)
				begin : gen_mhpmevent_active
					mhpmevent[i] = {32 {1'sb0}};
					mhpmevent[i][i] = 1'b1;
				end
		end
		mhpmevent[1] = {32 {1'sb0}};
		begin : sv2v_autoblock_9
			reg [31:0] i;
			for (i = 3 + MHPMCounterNum; i < 32; i = i + 1)
				begin : gen_mhpmevent_inactive
					mhpmevent[i] = {32 {1'sb0}};
				end
		end
	end
	ibex_counter #(.CounterWidth(64)) mcycle_counter_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.counter_inc_i(mhpmcounter_incr[0] & ~mcountinhibit[0]),
		.counterh_we_i(mhpmcounterh_we[0]),
		.counter_we_i(mhpmcounter_we[0]),
		.counter_val_i(csr_wdata_int),
		.counter_val_o(mhpmcounter[0])
	);
	ibex_counter #(.CounterWidth(64)) minstret_counter_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.counter_inc_i(mhpmcounter_incr[2] & ~mcountinhibit[2]),
		.counterh_we_i(mhpmcounterh_we[2]),
		.counter_we_i(mhpmcounter_we[2]),
		.counter_val_i(csr_wdata_int),
		.counter_val_o(mhpmcounter[2])
	);
	assign mhpmcounter[1] = {64 {1'sb0}};
	assign unused_mhpmcounter_we_1 = mhpmcounter_we[1];
	assign unused_mhpmcounterh_we_1 = mhpmcounterh_we[1];
	assign unused_mhpmcounter_incr_1 = mhpmcounter_incr[1];
	generate
		genvar cnt;
		for (cnt = 0; cnt < 29; cnt = cnt + 1) begin : gen_cntrs
			if (cnt < MHPMCounterNum) begin : gen_imp
				ibex_counter #(.CounterWidth(MHPMCounterWidth)) mcounters_variable_i(
					.clk_i(clk_i),
					.rst_ni(rst_ni),
					.counter_inc_i(mhpmcounter_incr[cnt + 3] & ~mcountinhibit[cnt + 3]),
					.counterh_we_i(mhpmcounterh_we[cnt + 3]),
					.counter_we_i(mhpmcounter_we[cnt + 3]),
					.counter_val_i(csr_wdata_int),
					.counter_val_o(mhpmcounter[cnt + 3])
				);
			end
			else begin : gen_unimp
				assign mhpmcounter[cnt + 3] = {64 {1'sb0}};
			end
		end
	endgenerate
	generate
		if (MHPMCounterNum < 29) begin : g_mcountinhibit_reduced
			wire [(29 - MHPMCounterNum) - 1:0] unused_mhphcounter_we;
			wire [(29 - MHPMCounterNum) - 1:0] unused_mhphcounterh_we;
			wire [(29 - MHPMCounterNum) - 1:0] unused_mhphcounter_incr;
			assign mcountinhibit = {{29 - MHPMCounterNum {1'b1}}, mcountinhibit_q};
			assign unused_mhphcounter_we = mhpmcounter_we[31:MHPMCounterNum + 3];
			assign unused_mhphcounterh_we = mhpmcounterh_we[31:MHPMCounterNum + 3];
			assign unused_mhphcounter_incr = mhpmcounter_incr[31:MHPMCounterNum + 3];
		end
		else begin : g_mcountinhibit_full
			assign mcountinhibit = mcountinhibit_q;
		end
	endgenerate
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			mcountinhibit_q <= {((MHPMCounterNum + 2) >= 0 ? MHPMCounterNum + 3 : 1 - (MHPMCounterNum + 2)) {1'sb0}};
		else
			mcountinhibit_q <= mcountinhibit_d;
	generate
		if (DbgTriggerEn) begin : gen_trigger_regs
			localparam [31:0] DbgHwNumLen = (DbgHwBreakNum > 1 ? $clog2(DbgHwBreakNum) : 1);
			wire [DbgHwNumLen - 1:0] tselect_d;
			wire [DbgHwNumLen - 1:0] tselect_q;
			wire tmatch_control_d;
			wire [DbgHwBreakNum - 1:0] tmatch_control_q;
			wire [31:0] tmatch_value_d;
			wire [31:0] tmatch_value_q [0:DbgHwBreakNum - 1];
			wire tselect_we;
			wire [DbgHwBreakNum - 1:0] tmatch_control_we;
			wire [DbgHwBreakNum - 1:0] tmatch_value_we;
			wire [DbgHwBreakNum - 1:0] trigger_match;
			assign tselect_we = (csr_we_int & debug_mode_i) & (csr_addr_i == ibex_pkg_CSR_TSELECT);
			genvar i;
			for (i = 0; i < DbgHwBreakNum; i = i + 1) begin : g_dbg_tmatch_we
				assign tmatch_control_we[i] = (((i[DbgHwNumLen - 1:0] == tselect_q) & csr_we_int) & debug_mode_i) & (csr_addr_i == ibex_pkg_CSR_TDATA1);
				assign tmatch_value_we[i] = (((i[DbgHwNumLen - 1:0] == tselect_q) & csr_we_int) & debug_mode_i) & (csr_addr_i == ibex_pkg_CSR_TDATA2);
			end
			assign tselect_d = (csr_wdata_int < DbgHwBreakNum ? csr_wdata_int[DbgHwNumLen - 1:0] : DbgHwBreakNum - 1);
			assign tmatch_control_d = csr_wdata_int[2];
			assign tmatch_value_d = csr_wdata_int[31:0];
			ibex_csr #(
				.Width(DbgHwNumLen),
				.ShadowCopy(1'b0),
				.ResetValue('0)
			) u_tselect_csr(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.wr_data_i(tselect_d),
				.wr_en_i(tselect_we),
				.rd_data_o(tselect_q),
				.rd_error_o()
			);
			for (i = 0; i < DbgHwBreakNum; i = i + 1) begin : g_dbg_tmatch_reg
				ibex_csr #(
					.Width(1),
					.ShadowCopy(1'b0),
					.ResetValue('0)
				) u_tmatch_control_csr(
					.clk_i(clk_i),
					.rst_ni(rst_ni),
					.wr_data_i(tmatch_control_d),
					.wr_en_i(tmatch_control_we[i]),
					.rd_data_o(tmatch_control_q[i]),
					.rd_error_o()
				);
				ibex_csr #(
					.Width(32),
					.ShadowCopy(1'b0),
					.ResetValue('0)
				) u_tmatch_value_csr(
					.clk_i(clk_i),
					.rst_ni(rst_ni),
					.wr_data_i(tmatch_value_d),
					.wr_en_i(tmatch_value_we[i]),
					.rd_data_o(tmatch_value_q[i]),
					.rd_error_o()
				);
			end
			localparam [31:0] TSelectRdataPadlen = (DbgHwNumLen >= 32 ? 0 : 32 - DbgHwNumLen);
			assign tselect_rdata = {{TSelectRdataPadlen {1'b0}}, tselect_q};
			assign tmatch_control_rdata = {4'h2, 1'b1, 6'h00, 1'b0, 1'b0, 1'b0, 2'b00, 4'h1, 1'b0, 4'h0, 1'b1, 1'b0, 1'b0, 1'b1, tmatch_control_q[tselect_q], 1'b0, 1'b0};
			assign tmatch_value_rdata = tmatch_value_q[tselect_q];
			for (i = 0; i < DbgHwBreakNum; i = i + 1) begin : g_dbg_trigger_match
				assign trigger_match[i] = tmatch_control_q[i] & (pc_if_i[31:0] == tmatch_value_q[i]);
			end
			assign trigger_match_o = |trigger_match;
		end
		else begin : gen_no_trigger_regs
			assign tselect_rdata = 'b0;
			assign tmatch_control_rdata = 'b0;
			assign tmatch_value_rdata = 'b0;
			assign trigger_match_o = 'b0;
		end
	endgenerate
	assign cpuctrl_wdata = csr_wdata_int[5:0];
	generate
		if (DataIndTiming) begin : gen_dit
			assign cpuctrl_d[1] = cpuctrl_wdata[1];
		end
		else begin : gen_no_dit
			wire unused_dit;
			assign unused_dit = cpuctrl_wdata[1];
			assign cpuctrl_d[1] = 1'b0;
		end
	endgenerate
	assign data_ind_timing_o = cpuctrl_q[1];
	generate
		if (DummyInstructions) begin : gen_dummy
			assign cpuctrl_d[2] = cpuctrl_wdata[2];
			assign cpuctrl_d[5-:3] = cpuctrl_wdata[5-:3];
			assign dummy_instr_seed_en_o = csr_we_int && (csr_addr == ibex_pkg_CSR_SECURESEED);
			assign dummy_instr_seed_o = csr_wdata_int;
		end
		else begin : gen_no_dummy
			wire unused_dummy_en;
			wire [2:0] unused_dummy_mask;
			assign unused_dummy_en = cpuctrl_wdata[2];
			assign unused_dummy_mask = cpuctrl_wdata[5-:3];
			assign cpuctrl_d[2] = 1'b0;
			assign cpuctrl_d[5-:3] = 3'b000;
			assign dummy_instr_seed_en_o = 1'b0;
			assign dummy_instr_seed_o = {32 {1'sb0}};
		end
	endgenerate
	assign dummy_instr_en_o = cpuctrl_q[2];
	assign dummy_instr_mask_o = cpuctrl_q[5-:3];
	generate
		if (ICache) begin : gen_icache_enable
			assign cpuctrl_d[0] = cpuctrl_wdata[0];
		end
		else begin : gen_no_icache
			wire unused_icen;
			assign unused_icen = cpuctrl_wdata[0];
			assign cpuctrl_d[0] = 1'b0;
		end
	endgenerate
	assign icache_enable_o = cpuctrl_q[0];
	ibex_csr #(
		.Width(6),
		.ShadowCopy(ShadowCSR),
		.ResetValue('0)
	) u_cpuctrl_csr(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.wr_data_i({cpuctrl_d}),
		.wr_en_i(cpuctrl_we),
		.rd_data_o(cpuctrl_q),
		.rd_error_o(cpuctrl_err)
	);
	assign csr_shadow_err_o = ((mstatus_err | mtvec_err) | pmp_csr_err) | cpuctrl_err;
endmodule
module ibex_csr (
	clk_i,
	rst_ni,
	wr_data_i,
	wr_en_i,
	rd_data_o,
	rd_error_o
);
	parameter [31:0] Width = 32;
	parameter [0:0] ShadowCopy = 1'b0;
	parameter [Width - 1:0] ResetValue = 1'sb0;
	input wire clk_i;
	input wire rst_ni;
	input wire [Width - 1:0] wr_data_i;
	input wire wr_en_i;
	output wire [Width - 1:0] rd_data_o;
	output wire rd_error_o;
	reg [Width - 1:0] rdata_q;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			rdata_q <= ResetValue;
		else if (wr_en_i)
			rdata_q <= wr_data_i;
	assign rd_data_o = rdata_q;
	generate
		if (ShadowCopy) begin : gen_shadow
			reg [Width - 1:0] shadow_q;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					shadow_q <= ~ResetValue;
				else if (wr_en_i)
					shadow_q <= ~wr_data_i;
			assign rd_error_o = rdata_q != ~shadow_q;
		end
		else begin : gen_no_shadow
			assign rd_error_o = 1'b0;
		end
	endgenerate
endmodule
module ibex_decoder (
	clk_i,
	rst_ni,
	illegal_insn_o,
	ebrk_insn_o,
	mret_insn_o,
	dret_insn_o,
	ecall_insn_o,
	wfi_insn_o,
	jump_set_o,
	branch_taken_i,
	icache_inval_o,
	instr_first_cycle_i,
	instr_rdata_i,
	instr_rdata_alu_i,
	illegal_c_insn_i,
	imm_a_mux_sel_o,
	imm_b_mux_sel_o,
	bt_a_mux_sel_o,
	bt_b_mux_sel_o,
	imm_i_type_o,
	imm_s_type_o,
	imm_b_type_o,
	imm_u_type_o,
	imm_j_type_o,
	zimm_rs1_type_o,
	rf_wdata_sel_o,
	rf_we_o,
	rf_raddr_a_o,
	rf_raddr_b_o,
	rf_waddr_o,
	rf_ren_a_o,
	rf_ren_b_o,
	alu_operator_o,
	alu_op_a_mux_sel_o,
	alu_op_b_mux_sel_o,
	alu_multicycle_o,
	mult_en_o,
	div_en_o,
	mult_sel_o,
	div_sel_o,
	multdiv_operator_o,
	multdiv_signed_mode_o,
	csr_access_o,
	csr_op_o,
	data_req_o,
	data_we_o,
	data_type_o,
	data_sign_extension_o,
	jump_in_dec_o,
	branch_in_dec_o
);
	parameter [0:0] RV32E = 0;
	localparam integer ibex_pkg_RV32MFast = 2;
	parameter integer RV32M = ibex_pkg_RV32MFast;
	localparam integer ibex_pkg_RV32BNone = 0;
	parameter integer RV32B = ibex_pkg_RV32BNone;
	parameter [0:0] BranchTargetALU = 0;
	input wire clk_i;
	input wire rst_ni;
	output wire illegal_insn_o;
	output reg ebrk_insn_o;
	output reg mret_insn_o;
	output reg dret_insn_o;
	output reg ecall_insn_o;
	output reg wfi_insn_o;
	output reg jump_set_o;
	input wire branch_taken_i;
	output reg icache_inval_o;
	input wire instr_first_cycle_i;
	input wire [31:0] instr_rdata_i;
	input wire [31:0] instr_rdata_alu_i;
	input wire illegal_c_insn_i;
	output reg imm_a_mux_sel_o;
	output reg [2:0] imm_b_mux_sel_o;
	output reg [1:0] bt_a_mux_sel_o;
	output reg [2:0] bt_b_mux_sel_o;
	output wire [31:0] imm_i_type_o;
	output wire [31:0] imm_s_type_o;
	output wire [31:0] imm_b_type_o;
	output wire [31:0] imm_u_type_o;
	output wire [31:0] imm_j_type_o;
	output wire [31:0] zimm_rs1_type_o;
	output reg rf_wdata_sel_o;
	output wire rf_we_o;
	output wire [4:0] rf_raddr_a_o;
	output wire [4:0] rf_raddr_b_o;
	output wire [4:0] rf_waddr_o;
	output reg rf_ren_a_o;
	output reg rf_ren_b_o;
	output reg [5:0] alu_operator_o;
	output reg [1:0] alu_op_a_mux_sel_o;
	output reg alu_op_b_mux_sel_o;
	output reg alu_multicycle_o;
	output wire mult_en_o;
	output wire div_en_o;
	output reg mult_sel_o;
	output reg div_sel_o;
	output reg [1:0] multdiv_operator_o;
	output reg [1:0] multdiv_signed_mode_o;
	output reg csr_access_o;
	output reg [1:0] csr_op_o;
	output reg data_req_o;
	output reg data_we_o;
	output reg [1:0] data_type_o;
	output reg data_sign_extension_o;
	output reg jump_in_dec_o;
	output reg branch_in_dec_o;
	reg illegal_insn;
	wire illegal_reg_rv32e;
	reg csr_illegal;
	reg rf_we;
	wire [31:0] instr;
	wire [31:0] instr_alu;
	wire [9:0] unused_instr_alu;
	wire [4:0] instr_rs1;
	wire [4:0] instr_rs2;
	wire [4:0] instr_rs3;
	wire [4:0] instr_rd;
	reg use_rs3_d;
	reg use_rs3_q;
	reg [1:0] csr_op;
	reg [6:0] opcode;
	reg [6:0] opcode_alu;
	assign instr = instr_rdata_i;
	assign instr_alu = instr_rdata_alu_i;
	assign imm_i_type_o = {{20 {instr[31]}}, instr[31:20]};
	assign imm_s_type_o = {{20 {instr[31]}}, instr[31:25], instr[11:7]};
	assign imm_b_type_o = {{19 {instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
	assign imm_u_type_o = {instr[31:12], 12'b000000000000};
	assign imm_j_type_o = {{12 {instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
	assign zimm_rs1_type_o = {27'b000000000000000000000000000, instr_rs1};
	generate
		if (RV32B != ibex_pkg_RV32BNone) begin : gen_rs3_flop
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					use_rs3_q <= 1'b0;
				else
					use_rs3_q <= use_rs3_d;
		end
		else begin : gen_no_rs3_flop
			wire [1:1] sv2v_tmp_66FD5;
			assign sv2v_tmp_66FD5 = use_rs3_d;
			always @(*) use_rs3_q = sv2v_tmp_66FD5;
		end
	endgenerate
	assign instr_rs1 = instr[19:15];
	assign instr_rs2 = instr[24:20];
	assign instr_rs3 = instr[31:27];
	assign rf_raddr_a_o = (use_rs3_q & ~instr_first_cycle_i ? instr_rs3 : instr_rs1);
	assign rf_raddr_b_o = instr_rs2;
	assign instr_rd = instr[11:7];
	assign rf_waddr_o = instr_rd;
	localparam [1:0] ibex_pkg_OP_A_REG_A = 0;
	localparam [0:0] ibex_pkg_OP_B_REG_B = 0;
	generate
		if (RV32E) begin : gen_rv32e_reg_check_active
			assign illegal_reg_rv32e = ((rf_raddr_a_o[4] & (alu_op_a_mux_sel_o == ibex_pkg_OP_A_REG_A)) | (rf_raddr_b_o[4] & (alu_op_b_mux_sel_o == ibex_pkg_OP_B_REG_B))) | (rf_waddr_o[4] & rf_we);
		end
		else begin : gen_rv32e_reg_check_inactive
			assign illegal_reg_rv32e = 1'b0;
		end
	endgenerate
	localparam [1:0] ibex_pkg_CSR_OP_CLEAR = 3;
	localparam [1:0] ibex_pkg_CSR_OP_READ = 0;
	localparam [1:0] ibex_pkg_CSR_OP_SET = 2;
	always @(*) begin : csr_operand_check
		csr_op_o = csr_op;
		if (((csr_op == ibex_pkg_CSR_OP_SET) || (csr_op == ibex_pkg_CSR_OP_CLEAR)) && (instr_rs1 == {5 {1'sb0}}))
			csr_op_o = ibex_pkg_CSR_OP_READ;
	end
	localparam [1:0] ibex_pkg_CSR_OP_WRITE = 1;
	localparam [1:0] ibex_pkg_MD_OP_DIV = 2;
	localparam [1:0] ibex_pkg_MD_OP_MULH = 1;
	localparam [1:0] ibex_pkg_MD_OP_MULL = 0;
	localparam [1:0] ibex_pkg_MD_OP_REM = 3;
	localparam [6:0] ibex_pkg_OPCODE_AUIPC = 7'h17;
	localparam [6:0] ibex_pkg_OPCODE_BRANCH = 7'h63;
	localparam [6:0] ibex_pkg_OPCODE_JAL = 7'h6f;
	localparam [6:0] ibex_pkg_OPCODE_JALR = 7'h67;
	localparam [6:0] ibex_pkg_OPCODE_LOAD = 7'h03;
	localparam [6:0] ibex_pkg_OPCODE_LUI = 7'h37;
	localparam [6:0] ibex_pkg_OPCODE_MISC_MEM = 7'h0f;
	localparam [6:0] ibex_pkg_OPCODE_OP = 7'h33;
	localparam [6:0] ibex_pkg_OPCODE_OP_IMM = 7'h13;
	localparam [6:0] ibex_pkg_OPCODE_STORE = 7'h23;
	localparam [6:0] ibex_pkg_OPCODE_SYSTEM = 7'h73;
	localparam [0:0] ibex_pkg_RF_WD_CSR = 1;
	localparam [0:0] ibex_pkg_RF_WD_EX = 0;
	localparam integer ibex_pkg_RV32BBalanced = 1;
	localparam integer ibex_pkg_RV32BFull = 2;
	localparam integer ibex_pkg_RV32MNone = 0;
	always @(*) begin
		jump_in_dec_o = 1'b0;
		jump_set_o = 1'b0;
		branch_in_dec_o = 1'b0;
		icache_inval_o = 1'b0;
		multdiv_operator_o = ibex_pkg_MD_OP_MULL;
		multdiv_signed_mode_o = 2'b00;
		rf_wdata_sel_o = ibex_pkg_RF_WD_EX;
		rf_we = 1'b0;
		rf_ren_a_o = 1'b0;
		rf_ren_b_o = 1'b0;
		csr_access_o = 1'b0;
		csr_illegal = 1'b0;
		csr_op = ibex_pkg_CSR_OP_READ;
		data_we_o = 1'b0;
		data_type_o = 2'b00;
		data_sign_extension_o = 1'b0;
		data_req_o = 1'b0;
		illegal_insn = 1'b0;
		ebrk_insn_o = 1'b0;
		mret_insn_o = 1'b0;
		dret_insn_o = 1'b0;
		ecall_insn_o = 1'b0;
		wfi_insn_o = 1'b0;
		opcode = instr[6:0];
		case (opcode)
			ibex_pkg_OPCODE_JAL: begin
				jump_in_dec_o = 1'b1;
				if (instr_first_cycle_i) begin
					rf_we = BranchTargetALU;
					jump_set_o = 1'b1;
				end
				else
					rf_we = 1'b1;
			end
			ibex_pkg_OPCODE_JALR: begin
				jump_in_dec_o = 1'b1;
				if (instr_first_cycle_i) begin
					rf_we = BranchTargetALU;
					jump_set_o = 1'b1;
				end
				else
					rf_we = 1'b1;
				if (instr[14:12] != 3'b000)
					illegal_insn = 1'b1;
				rf_ren_a_o = 1'b1;
			end
			ibex_pkg_OPCODE_BRANCH: begin
				branch_in_dec_o = 1'b1;
				case (instr[14:12])
					3'b000, 3'b001, 3'b100, 3'b101, 3'b110, 3'b111: illegal_insn = 1'b0;
					default: illegal_insn = 1'b1;
				endcase
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
			end
			ibex_pkg_OPCODE_STORE: begin
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				data_req_o = 1'b1;
				data_we_o = 1'b1;
				if (instr[14])
					illegal_insn = 1'b1;
				case (instr[13:12])
					2'b00: data_type_o = 2'b10;
					2'b01: data_type_o = 2'b01;
					2'b10: data_type_o = 2'b00;
					default: illegal_insn = 1'b1;
				endcase
			end
			ibex_pkg_OPCODE_LOAD: begin
				rf_ren_a_o = 1'b1;
				data_req_o = 1'b1;
				data_type_o = 2'b00;
				data_sign_extension_o = ~instr[14];
				case (instr[13:12])
					2'b00: data_type_o = 2'b10;
					2'b01: data_type_o = 2'b01;
					2'b10: begin
						data_type_o = 2'b00;
						if (instr[14])
							illegal_insn = 1'b1;
					end
					default: illegal_insn = 1'b1;
				endcase
			end
			ibex_pkg_OPCODE_LUI: rf_we = 1'b1;
			ibex_pkg_OPCODE_AUIPC: rf_we = 1'b1;
			ibex_pkg_OPCODE_OP_IMM: begin
				rf_ren_a_o = 1'b1;
				rf_we = 1'b1;
				case (instr[14:12])
					3'b000, 3'b010, 3'b011, 3'b100, 3'b110, 3'b111: illegal_insn = 1'b0;
					3'b001:
						case (instr[31:27])
							5'b00000: illegal_insn = (instr[26:25] == 2'b00 ? 1'b0 : 1'b1);
							5'b00100, 5'b01001, 5'b00101, 5'b01101: illegal_insn = (RV32B != ibex_pkg_RV32BNone ? 1'b0 : 1'b1);
							5'b00001:
								if (instr[26] == 1'b0)
									illegal_insn = (RV32B == ibex_pkg_RV32BFull ? 1'b0 : 1'b1);
								else
									illegal_insn = 1'b1;
							5'b01100:
								case (instr[26:20])
									7'b0000000, 7'b0000001, 7'b0000010, 7'b0000100, 7'b0000101: illegal_insn = (RV32B != ibex_pkg_RV32BNone ? 1'b0 : 1'b1);
									7'b0010000, 7'b0010001, 7'b0010010, 7'b0011000, 7'b0011001, 7'b0011010: illegal_insn = (RV32B == ibex_pkg_RV32BFull ? 1'b0 : 1'b1);
									default: illegal_insn = 1'b1;
								endcase
							default: illegal_insn = 1'b1;
						endcase
					3'b101:
						if (instr[26])
							illegal_insn = (RV32B != ibex_pkg_RV32BNone ? 1'b0 : 1'b1);
						else
							case (instr[31:27])
								5'b00000, 5'b01000: illegal_insn = (instr[26:25] == 2'b00 ? 1'b0 : 1'b1);
								5'b00100, 5'b01100, 5'b01001: illegal_insn = (RV32B != ibex_pkg_RV32BNone ? 1'b0 : 1'b1);
								5'b01101:
									if (RV32B == ibex_pkg_RV32BFull)
										illegal_insn = 1'b0;
									else
										case (instr[24:20])
											5'b11111, 5'b11000: illegal_insn = (RV32B == ibex_pkg_RV32BBalanced ? 1'b0 : 1'b1);
											default: illegal_insn = 1'b1;
										endcase
								5'b00101:
									if (RV32B == ibex_pkg_RV32BFull)
										illegal_insn = 1'b0;
									else if (instr[24:20] == 5'b00111)
										illegal_insn = (RV32B == ibex_pkg_RV32BBalanced ? 1'b0 : 1'b1);
									else
										illegal_insn = 1'b1;
								5'b00001:
									if (instr[26] == 1'b0)
										illegal_insn = (RV32B == ibex_pkg_RV32BFull ? 1'b0 : 1'b1);
									else
										illegal_insn = 1'b1;
								default: illegal_insn = 1'b1;
							endcase
					default: illegal_insn = 1'b1;
				endcase
			end
			ibex_pkg_OPCODE_OP: begin
				rf_ren_a_o = 1'b1;
				rf_ren_b_o = 1'b1;
				rf_we = 1'b1;
				if ({instr[26], instr[13:12]} == {1'b1, 2'b01})
					illegal_insn = (RV32B != ibex_pkg_RV32BNone ? 1'b0 : 1'b1);
				else
					case ({instr[31:25], instr[14:12]})
						{7'b0000000, 3'b000}, {7'b0100000, 3'b000}, {7'b0000000, 3'b010}, {7'b0000000, 3'b011}, {7'b0000000, 3'b100}, {7'b0000000, 3'b110}, {7'b0000000, 3'b111}, {7'b0000000, 3'b001}, {7'b0000000, 3'b101}, {7'b0100000, 3'b101}: illegal_insn = 1'b0;
						{7'b0100000, 3'b111}, {7'b0100000, 3'b110}, {7'b0100000, 3'b100}, {7'b0010000, 3'b001}, {7'b0010000, 3'b101}, {7'b0110000, 3'b001}, {7'b0110000, 3'b101}, {7'b0000101, 3'b100}, {7'b0000101, 3'b101}, {7'b0000101, 3'b110}, {7'b0000101, 3'b111}, {7'b0000100, 3'b100}, {7'b0100100, 3'b100}, {7'b0000100, 3'b111}, {7'b0100100, 3'b001}, {7'b0010100, 3'b001}, {7'b0110100, 3'b001}, {7'b0100100, 3'b101}, {7'b0100100, 3'b111}: illegal_insn = (RV32B != ibex_pkg_RV32BNone ? 1'b0 : 1'b1);
						{7'b0100100, 3'b110}, {7'b0000100, 3'b110}, {7'b0110100, 3'b101}, {7'b0010100, 3'b101}, {7'b0000100, 3'b001}, {7'b0000100, 3'b101}, {7'b0000101, 3'b001}, {7'b0000101, 3'b010}, {7'b0000101, 3'b011}: illegal_insn = (RV32B == ibex_pkg_RV32BFull ? 1'b0 : 1'b1);
						{7'b0000001, 3'b000}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_MULL;
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						{7'b0000001, 3'b001}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_MULH;
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						{7'b0000001, 3'b010}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_MULH;
							multdiv_signed_mode_o = 2'b01;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						{7'b0000001, 3'b011}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_MULH;
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						{7'b0000001, 3'b100}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_DIV;
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						{7'b0000001, 3'b101}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_DIV;
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						{7'b0000001, 3'b110}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_REM;
							multdiv_signed_mode_o = 2'b11;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						{7'b0000001, 3'b111}: begin
							multdiv_operator_o = ibex_pkg_MD_OP_REM;
							multdiv_signed_mode_o = 2'b00;
							illegal_insn = (RV32M == ibex_pkg_RV32MNone ? 1'b1 : 1'b0);
						end
						default: illegal_insn = 1'b1;
					endcase
			end
			ibex_pkg_OPCODE_MISC_MEM:
				case (instr[14:12])
					3'b000: rf_we = 1'b0;
					3'b001: begin
						jump_in_dec_o = 1'b1;
						rf_we = 1'b0;
						if (instr_first_cycle_i) begin
							jump_set_o = 1'b1;
							icache_inval_o = 1'b1;
						end
					end
					default: illegal_insn = 1'b1;
				endcase
			ibex_pkg_OPCODE_SYSTEM:
				if (instr[14:12] == 3'b000) begin
					case (instr[31:20])
						12'h000: ecall_insn_o = 1'b1;
						12'h001: ebrk_insn_o = 1'b1;
						12'h302: mret_insn_o = 1'b1;
						12'h7b2: dret_insn_o = 1'b1;
						12'h105: wfi_insn_o = 1'b1;
						default: illegal_insn = 1'b1;
					endcase
					if ((instr_rs1 != 5'b00000) || (instr_rd != 5'b00000))
						illegal_insn = 1'b1;
				end
				else begin
					csr_access_o = 1'b1;
					rf_wdata_sel_o = ibex_pkg_RF_WD_CSR;
					rf_we = 1'b1;
					if (~instr[14])
						rf_ren_a_o = 1'b1;
					case (instr[13:12])
						2'b01: csr_op = ibex_pkg_CSR_OP_WRITE;
						2'b10: csr_op = ibex_pkg_CSR_OP_SET;
						2'b11: csr_op = ibex_pkg_CSR_OP_CLEAR;
						default: csr_illegal = 1'b1;
					endcase
					illegal_insn = csr_illegal;
				end
			default: illegal_insn = 1'b1;
		endcase
		if (illegal_c_insn_i)
			illegal_insn = 1'b1;
		if (illegal_insn) begin
			rf_we = 1'b0;
			data_req_o = 1'b0;
			data_we_o = 1'b0;
			jump_in_dec_o = 1'b0;
			jump_set_o = 1'b0;
			branch_in_dec_o = 1'b0;
			csr_access_o = 1'b0;
		end
	end
	localparam [5:0] ibex_pkg_ALU_ADD = 0;
	localparam [5:0] ibex_pkg_ALU_AND = 4;
	localparam [5:0] ibex_pkg_ALU_ANDN = 7;
	localparam [5:0] ibex_pkg_ALU_BDEP = 48;
	localparam [5:0] ibex_pkg_ALU_BEXT = 47;
	localparam [5:0] ibex_pkg_ALU_BFP = 49;
	localparam [5:0] ibex_pkg_ALU_CLMUL = 50;
	localparam [5:0] ibex_pkg_ALU_CLMULH = 52;
	localparam [5:0] ibex_pkg_ALU_CLMULR = 51;
	localparam [5:0] ibex_pkg_ALU_CLZ = 34;
	localparam [5:0] ibex_pkg_ALU_CMIX = 40;
	localparam [5:0] ibex_pkg_ALU_CMOV = 39;
	localparam [5:0] ibex_pkg_ALU_CRC32C_B = 54;
	localparam [5:0] ibex_pkg_ALU_CRC32C_H = 56;
	localparam [5:0] ibex_pkg_ALU_CRC32C_W = 58;
	localparam [5:0] ibex_pkg_ALU_CRC32_B = 53;
	localparam [5:0] ibex_pkg_ALU_CRC32_H = 55;
	localparam [5:0] ibex_pkg_ALU_CRC32_W = 57;
	localparam [5:0] ibex_pkg_ALU_CTZ = 35;
	localparam [5:0] ibex_pkg_ALU_EQ = 23;
	localparam [5:0] ibex_pkg_ALU_FSL = 41;
	localparam [5:0] ibex_pkg_ALU_FSR = 42;
	localparam [5:0] ibex_pkg_ALU_GE = 21;
	localparam [5:0] ibex_pkg_ALU_GEU = 22;
	localparam [5:0] ibex_pkg_ALU_GORC = 16;
	localparam [5:0] ibex_pkg_ALU_GREV = 15;
	localparam [5:0] ibex_pkg_ALU_LT = 19;
	localparam [5:0] ibex_pkg_ALU_LTU = 20;
	localparam [5:0] ibex_pkg_ALU_MAX = 27;
	localparam [5:0] ibex_pkg_ALU_MAXU = 28;
	localparam [5:0] ibex_pkg_ALU_MIN = 25;
	localparam [5:0] ibex_pkg_ALU_MINU = 26;
	localparam [5:0] ibex_pkg_ALU_NE = 24;
	localparam [5:0] ibex_pkg_ALU_OR = 3;
	localparam [5:0] ibex_pkg_ALU_ORN = 6;
	localparam [5:0] ibex_pkg_ALU_PACK = 29;
	localparam [5:0] ibex_pkg_ALU_PACKH = 31;
	localparam [5:0] ibex_pkg_ALU_PACKU = 30;
	localparam [5:0] ibex_pkg_ALU_PCNT = 36;
	localparam [5:0] ibex_pkg_ALU_ROL = 14;
	localparam [5:0] ibex_pkg_ALU_ROR = 13;
	localparam [5:0] ibex_pkg_ALU_SBCLR = 44;
	localparam [5:0] ibex_pkg_ALU_SBEXT = 46;
	localparam [5:0] ibex_pkg_ALU_SBINV = 45;
	localparam [5:0] ibex_pkg_ALU_SBSET = 43;
	localparam [5:0] ibex_pkg_ALU_SEXTB = 32;
	localparam [5:0] ibex_pkg_ALU_SEXTH = 33;
	localparam [5:0] ibex_pkg_ALU_SHFL = 17;
	localparam [5:0] ibex_pkg_ALU_SLL = 10;
	localparam [5:0] ibex_pkg_ALU_SLO = 12;
	localparam [5:0] ibex_pkg_ALU_SLT = 37;
	localparam [5:0] ibex_pkg_ALU_SLTU = 38;
	localparam [5:0] ibex_pkg_ALU_SRA = 8;
	localparam [5:0] ibex_pkg_ALU_SRL = 9;
	localparam [5:0] ibex_pkg_ALU_SRO = 11;
	localparam [5:0] ibex_pkg_ALU_SUB = 1;
	localparam [5:0] ibex_pkg_ALU_UNSHFL = 18;
	localparam [5:0] ibex_pkg_ALU_XNOR = 5;
	localparam [5:0] ibex_pkg_ALU_XOR = 2;
	localparam [0:0] ibex_pkg_IMM_A_Z = 0;
	localparam [0:0] ibex_pkg_IMM_A_ZERO = 1;
	localparam [2:0] ibex_pkg_IMM_B_B = 2;
	localparam [2:0] ibex_pkg_IMM_B_I = 0;
	localparam [2:0] ibex_pkg_IMM_B_INCR_PC = 5;
	localparam [2:0] ibex_pkg_IMM_B_J = 4;
	localparam [2:0] ibex_pkg_IMM_B_S = 1;
	localparam [2:0] ibex_pkg_IMM_B_U = 3;
	localparam [1:0] ibex_pkg_OP_A_CURRPC = 2;
	localparam [1:0] ibex_pkg_OP_A_IMM = 3;
	localparam [0:0] ibex_pkg_OP_B_IMM = 1;
	always @(*) begin
		alu_operator_o = ibex_pkg_ALU_SLTU;
		alu_op_a_mux_sel_o = ibex_pkg_OP_A_IMM;
		alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
		imm_a_mux_sel_o = ibex_pkg_IMM_A_ZERO;
		imm_b_mux_sel_o = ibex_pkg_IMM_B_I;
		bt_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
		bt_b_mux_sel_o = ibex_pkg_IMM_B_I;
		opcode_alu = instr_alu[6:0];
		use_rs3_d = 1'b0;
		alu_multicycle_o = 1'b0;
		mult_sel_o = 1'b0;
		div_sel_o = 1'b0;
		case (opcode_alu)
			ibex_pkg_OPCODE_JAL: begin
				if (BranchTargetALU) begin
					bt_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
					bt_b_mux_sel_o = ibex_pkg_IMM_B_J;
				end
				if (instr_first_cycle_i && !BranchTargetALU) begin
					alu_op_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
					imm_b_mux_sel_o = ibex_pkg_IMM_B_J;
					alu_operator_o = ibex_pkg_ALU_ADD;
				end
				else begin
					alu_op_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
					imm_b_mux_sel_o = ibex_pkg_IMM_B_INCR_PC;
					alu_operator_o = ibex_pkg_ALU_ADD;
				end
			end
			ibex_pkg_OPCODE_JALR: begin
				if (BranchTargetALU) begin
					bt_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
					bt_b_mux_sel_o = ibex_pkg_IMM_B_I;
				end
				if (instr_first_cycle_i && !BranchTargetALU) begin
					alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
					imm_b_mux_sel_o = ibex_pkg_IMM_B_I;
					alu_operator_o = ibex_pkg_ALU_ADD;
				end
				else begin
					alu_op_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
					imm_b_mux_sel_o = ibex_pkg_IMM_B_INCR_PC;
					alu_operator_o = ibex_pkg_ALU_ADD;
				end
			end
			ibex_pkg_OPCODE_BRANCH: begin
				case (instr_alu[14:12])
					3'b000: alu_operator_o = ibex_pkg_ALU_EQ;
					3'b001: alu_operator_o = ibex_pkg_ALU_NE;
					3'b100: alu_operator_o = ibex_pkg_ALU_LT;
					3'b101: alu_operator_o = ibex_pkg_ALU_GE;
					3'b110: alu_operator_o = ibex_pkg_ALU_LTU;
					3'b111: alu_operator_o = ibex_pkg_ALU_GEU;
					default:
						;
				endcase
				if (BranchTargetALU) begin
					bt_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
					bt_b_mux_sel_o = (branch_taken_i ? ibex_pkg_IMM_B_B : ibex_pkg_IMM_B_INCR_PC);
				end
				if (instr_first_cycle_i) begin
					alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_REG_B;
				end
				else begin
					alu_op_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
					imm_b_mux_sel_o = (branch_taken_i ? ibex_pkg_IMM_B_B : ibex_pkg_IMM_B_INCR_PC);
					alu_operator_o = ibex_pkg_ALU_ADD;
				end
			end
			ibex_pkg_OPCODE_STORE: begin
				alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
				alu_op_b_mux_sel_o = ibex_pkg_OP_B_REG_B;
				alu_operator_o = ibex_pkg_ALU_ADD;
				if (!instr_alu[14]) begin
					imm_b_mux_sel_o = ibex_pkg_IMM_B_S;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
				end
			end
			ibex_pkg_OPCODE_LOAD: begin
				alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
				alu_operator_o = ibex_pkg_ALU_ADD;
				alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
				imm_b_mux_sel_o = ibex_pkg_IMM_B_I;
			end
			ibex_pkg_OPCODE_LUI: begin
				alu_op_a_mux_sel_o = ibex_pkg_OP_A_IMM;
				alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
				imm_a_mux_sel_o = ibex_pkg_IMM_A_ZERO;
				imm_b_mux_sel_o = ibex_pkg_IMM_B_U;
				alu_operator_o = ibex_pkg_ALU_ADD;
			end
			ibex_pkg_OPCODE_AUIPC: begin
				alu_op_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
				alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
				imm_b_mux_sel_o = ibex_pkg_IMM_B_U;
				alu_operator_o = ibex_pkg_ALU_ADD;
			end
			ibex_pkg_OPCODE_OP_IMM: begin
				alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
				alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
				imm_b_mux_sel_o = ibex_pkg_IMM_B_I;
				case (instr_alu[14:12])
					3'b000: alu_operator_o = ibex_pkg_ALU_ADD;
					3'b010: alu_operator_o = ibex_pkg_ALU_SLT;
					3'b011: alu_operator_o = ibex_pkg_ALU_SLTU;
					3'b100: alu_operator_o = ibex_pkg_ALU_XOR;
					3'b110: alu_operator_o = ibex_pkg_ALU_OR;
					3'b111: alu_operator_o = ibex_pkg_ALU_AND;
					3'b001:
						if (RV32B != ibex_pkg_RV32BNone)
							case (instr_alu[31:27])
								5'b00000: alu_operator_o = ibex_pkg_ALU_SLL;
								5'b00100: alu_operator_o = ibex_pkg_ALU_SLO;
								5'b01001: alu_operator_o = ibex_pkg_ALU_SBCLR;
								5'b00101: alu_operator_o = ibex_pkg_ALU_SBSET;
								5'b01101: alu_operator_o = ibex_pkg_ALU_SBINV;
								5'b00001:
									if (instr_alu[26] == 0)
										alu_operator_o = ibex_pkg_ALU_SHFL;
								5'b01100:
									case (instr_alu[26:20])
										7'b0000000: alu_operator_o = ibex_pkg_ALU_CLZ;
										7'b0000001: alu_operator_o = ibex_pkg_ALU_CTZ;
										7'b0000010: alu_operator_o = ibex_pkg_ALU_PCNT;
										7'b0000100: alu_operator_o = ibex_pkg_ALU_SEXTB;
										7'b0000101: alu_operator_o = ibex_pkg_ALU_SEXTH;
										7'b0010000:
											if (RV32B == ibex_pkg_RV32BFull) begin
												alu_operator_o = ibex_pkg_ALU_CRC32_B;
												alu_multicycle_o = 1'b1;
											end
										7'b0010001:
											if (RV32B == ibex_pkg_RV32BFull) begin
												alu_operator_o = ibex_pkg_ALU_CRC32_H;
												alu_multicycle_o = 1'b1;
											end
										7'b0010010:
											if (RV32B == ibex_pkg_RV32BFull) begin
												alu_operator_o = ibex_pkg_ALU_CRC32_W;
												alu_multicycle_o = 1'b1;
											end
										7'b0011000:
											if (RV32B == ibex_pkg_RV32BFull) begin
												alu_operator_o = ibex_pkg_ALU_CRC32C_B;
												alu_multicycle_o = 1'b1;
											end
										7'b0011001:
											if (RV32B == ibex_pkg_RV32BFull) begin
												alu_operator_o = ibex_pkg_ALU_CRC32C_H;
												alu_multicycle_o = 1'b1;
											end
										7'b0011010:
											if (RV32B == ibex_pkg_RV32BFull) begin
												alu_operator_o = ibex_pkg_ALU_CRC32C_W;
												alu_multicycle_o = 1'b1;
											end
										default:
											;
									endcase
								default:
									;
							endcase
						else
							alu_operator_o = ibex_pkg_ALU_SLL;
					3'b101:
						if (RV32B != ibex_pkg_RV32BNone) begin
							if (instr_alu[26] == 1'b1) begin
								alu_operator_o = ibex_pkg_ALU_FSR;
								alu_multicycle_o = 1'b1;
								if (instr_first_cycle_i)
									use_rs3_d = 1'b1;
								else
									use_rs3_d = 1'b0;
							end
							else
								case (instr_alu[31:27])
									5'b00000: alu_operator_o = ibex_pkg_ALU_SRL;
									5'b01000: alu_operator_o = ibex_pkg_ALU_SRA;
									5'b00100: alu_operator_o = ibex_pkg_ALU_SRO;
									5'b01001: alu_operator_o = ibex_pkg_ALU_SBEXT;
									5'b01100: begin
										alu_operator_o = ibex_pkg_ALU_ROR;
										alu_multicycle_o = 1'b1;
									end
									5'b01101: alu_operator_o = ibex_pkg_ALU_GREV;
									5'b00101: alu_operator_o = ibex_pkg_ALU_GORC;
									5'b00001:
										if (RV32B == ibex_pkg_RV32BFull)
											if (instr_alu[26] == 1'b0)
												alu_operator_o = ibex_pkg_ALU_UNSHFL;
									default:
										;
								endcase
						end
						else if (instr_alu[31:27] == 5'b00000)
							alu_operator_o = ibex_pkg_ALU_SRL;
						else if (instr_alu[31:27] == 5'b01000)
							alu_operator_o = ibex_pkg_ALU_SRA;
					default:
						;
				endcase
			end
			ibex_pkg_OPCODE_OP: begin
				alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
				alu_op_b_mux_sel_o = ibex_pkg_OP_B_REG_B;
				if (instr_alu[26]) begin
					if (RV32B != ibex_pkg_RV32BNone)
						case ({instr_alu[26:25], instr_alu[14:12]})
							{2'b11, 3'b001}: begin
								alu_operator_o = ibex_pkg_ALU_CMIX;
								alu_multicycle_o = 1'b1;
								if (instr_first_cycle_i)
									use_rs3_d = 1'b1;
								else
									use_rs3_d = 1'b0;
							end
							{2'b11, 3'b101}: begin
								alu_operator_o = ibex_pkg_ALU_CMOV;
								alu_multicycle_o = 1'b1;
								if (instr_first_cycle_i)
									use_rs3_d = 1'b1;
								else
									use_rs3_d = 1'b0;
							end
							{2'b10, 3'b001}: begin
								alu_operator_o = ibex_pkg_ALU_FSL;
								alu_multicycle_o = 1'b1;
								if (instr_first_cycle_i)
									use_rs3_d = 1'b1;
								else
									use_rs3_d = 1'b0;
							end
							{2'b10, 3'b101}: begin
								alu_operator_o = ibex_pkg_ALU_FSR;
								alu_multicycle_o = 1'b1;
								if (instr_first_cycle_i)
									use_rs3_d = 1'b1;
								else
									use_rs3_d = 1'b0;
							end
							default:
								;
						endcase
				end
				else
					case ({instr_alu[31:25], instr_alu[14:12]})
						{7'b0000000, 3'b000}: alu_operator_o = ibex_pkg_ALU_ADD;
						{7'b0100000, 3'b000}: alu_operator_o = ibex_pkg_ALU_SUB;
						{7'b0000000, 3'b010}: alu_operator_o = ibex_pkg_ALU_SLT;
						{7'b0000000, 3'b011}: alu_operator_o = ibex_pkg_ALU_SLTU;
						{7'b0000000, 3'b100}: alu_operator_o = ibex_pkg_ALU_XOR;
						{7'b0000000, 3'b110}: alu_operator_o = ibex_pkg_ALU_OR;
						{7'b0000000, 3'b111}: alu_operator_o = ibex_pkg_ALU_AND;
						{7'b0000000, 3'b001}: alu_operator_o = ibex_pkg_ALU_SLL;
						{7'b0000000, 3'b101}: alu_operator_o = ibex_pkg_ALU_SRL;
						{7'b0100000, 3'b101}: alu_operator_o = ibex_pkg_ALU_SRA;
						{7'b0010000, 3'b001}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_SLO;
						{7'b0010000, 3'b101}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_SRO;
						{7'b0110000, 3'b001}:
							if (RV32B != ibex_pkg_RV32BNone) begin
								alu_operator_o = ibex_pkg_ALU_ROL;
								alu_multicycle_o = 1'b1;
							end
						{7'b0110000, 3'b101}:
							if (RV32B != ibex_pkg_RV32BNone) begin
								alu_operator_o = ibex_pkg_ALU_ROR;
								alu_multicycle_o = 1'b1;
							end
						{7'b0000101, 3'b100}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_MIN;
						{7'b0000101, 3'b101}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_MAX;
						{7'b0000101, 3'b110}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_MINU;
						{7'b0000101, 3'b111}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_MAXU;
						{7'b0000100, 3'b100}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_PACK;
						{7'b0100100, 3'b100}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_PACKU;
						{7'b0000100, 3'b111}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_PACKH;
						{7'b0100000, 3'b100}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_XNOR;
						{7'b0100000, 3'b110}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_ORN;
						{7'b0100000, 3'b111}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_ANDN;
						{7'b0100100, 3'b001}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_SBCLR;
						{7'b0010100, 3'b001}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_SBSET;
						{7'b0110100, 3'b001}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_SBINV;
						{7'b0100100, 3'b101}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_SBEXT;
						{7'b0100100, 3'b111}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_BFP;
						{7'b0110100, 3'b101}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_GREV;
						{7'b0010100, 3'b101}:
							if (RV32B != ibex_pkg_RV32BNone)
								alu_operator_o = ibex_pkg_ALU_GORC;
						{7'b0000100, 3'b001}:
							if (RV32B == ibex_pkg_RV32BFull)
								alu_operator_o = ibex_pkg_ALU_SHFL;
						{7'b0000100, 3'b101}:
							if (RV32B == ibex_pkg_RV32BFull)
								alu_operator_o = ibex_pkg_ALU_UNSHFL;
						{7'b0000101, 3'b001}:
							if (RV32B == ibex_pkg_RV32BFull)
								alu_operator_o = ibex_pkg_ALU_CLMUL;
						{7'b0000101, 3'b010}:
							if (RV32B == ibex_pkg_RV32BFull)
								alu_operator_o = ibex_pkg_ALU_CLMULR;
						{7'b0000101, 3'b011}:
							if (RV32B == ibex_pkg_RV32BFull)
								alu_operator_o = ibex_pkg_ALU_CLMULH;
						{7'b0100100, 3'b110}:
							if (RV32B == ibex_pkg_RV32BFull) begin
								alu_operator_o = ibex_pkg_ALU_BDEP;
								alu_multicycle_o = 1'b1;
							end
						{7'b0000100, 3'b110}:
							if (RV32B == ibex_pkg_RV32BFull) begin
								alu_operator_o = ibex_pkg_ALU_BEXT;
								alu_multicycle_o = 1'b1;
							end
						{7'b0000001, 3'b000}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							mult_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						{7'b0000001, 3'b001}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							mult_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						{7'b0000001, 3'b010}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							mult_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						{7'b0000001, 3'b011}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							mult_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						{7'b0000001, 3'b100}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							div_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						{7'b0000001, 3'b101}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							div_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						{7'b0000001, 3'b110}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							div_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						{7'b0000001, 3'b111}: begin
							alu_operator_o = ibex_pkg_ALU_ADD;
							div_sel_o = (RV32M == ibex_pkg_RV32MNone ? 1'b0 : 1'b1);
						end
						default:
							;
					endcase
			end
			ibex_pkg_OPCODE_MISC_MEM:
				case (instr_alu[14:12])
					3'b000: begin
						alu_operator_o = ibex_pkg_ALU_ADD;
						alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
						alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
					end
					3'b001:
						if (BranchTargetALU) begin
							bt_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
							bt_b_mux_sel_o = ibex_pkg_IMM_B_INCR_PC;
						end
						else begin
							alu_op_a_mux_sel_o = ibex_pkg_OP_A_CURRPC;
							alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
							imm_b_mux_sel_o = ibex_pkg_IMM_B_INCR_PC;
							alu_operator_o = ibex_pkg_ALU_ADD;
						end
					default:
						;
				endcase
			ibex_pkg_OPCODE_SYSTEM:
				if (instr_alu[14:12] == 3'b000) begin
					alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
				end
				else begin
					alu_op_b_mux_sel_o = ibex_pkg_OP_B_IMM;
					imm_a_mux_sel_o = ibex_pkg_IMM_A_Z;
					imm_b_mux_sel_o = ibex_pkg_IMM_B_I;
					if (instr_alu[14])
						alu_op_a_mux_sel_o = ibex_pkg_OP_A_IMM;
					else
						alu_op_a_mux_sel_o = ibex_pkg_OP_A_REG_A;
				end
			default:
				;
		endcase
	end
	assign mult_en_o = (illegal_insn ? 1'b0 : mult_sel_o);
	assign div_en_o = (illegal_insn ? 1'b0 : div_sel_o);
	assign illegal_insn_o = illegal_insn | illegal_reg_rv32e;
	assign rf_we_o = rf_we & ~illegal_reg_rv32e;
	assign unused_instr_alu = {instr_alu[19:15], instr_alu[11:7]};
endmodule
module ibex_dummy_instr (
	clk_i,
	rst_ni,
	dummy_instr_en_i,
	dummy_instr_mask_i,
	dummy_instr_seed_en_i,
	dummy_instr_seed_i,
	fetch_valid_i,
	id_in_ready_i,
	insert_dummy_instr_o,
	dummy_instr_data_o
);
	input wire clk_i;
	input wire rst_ni;
	input wire dummy_instr_en_i;
	input wire [2:0] dummy_instr_mask_i;
	input wire dummy_instr_seed_en_i;
	input wire [31:0] dummy_instr_seed_i;
	input wire fetch_valid_i;
	input wire id_in_ready_i;
	output wire insert_dummy_instr_o;
	output wire [31:0] dummy_instr_data_o;
	localparam [31:0] TIMEOUT_CNT_W = 5;
	localparam [31:0] OP_W = 5;
	localparam [31:0] LFSR_OUT_W = ((2 + OP_W) + OP_W) + TIMEOUT_CNT_W;
	wire [(((2 + OP_W) + OP_W) + TIMEOUT_CNT_W) - 1:0] lfsr_data;
	wire [TIMEOUT_CNT_W - 1:0] dummy_cnt_incr;
	wire [TIMEOUT_CNT_W - 1:0] dummy_cnt_threshold;
	wire [TIMEOUT_CNT_W - 1:0] dummy_cnt_d;
	reg [TIMEOUT_CNT_W - 1:0] dummy_cnt_q;
	wire dummy_cnt_en;
	wire lfsr_en;
	wire [LFSR_OUT_W - 1:0] lfsr_state;
	wire insert_dummy_instr;
	reg [6:0] dummy_set;
	reg [2:0] dummy_opcode;
	wire [31:0] dummy_instr;
	reg [31:0] dummy_instr_seed_q;
	wire [31:0] dummy_instr_seed_d;
	assign lfsr_en = insert_dummy_instr & id_in_ready_i;
	assign dummy_instr_seed_d = dummy_instr_seed_q ^ dummy_instr_seed_i;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			dummy_instr_seed_q <= {32 {1'sb0}};
		else if (dummy_instr_seed_en_i)
			dummy_instr_seed_q <= dummy_instr_seed_d;
	prim_lfsr #(
		.LfsrDw(32),
		.StateOutDw(LFSR_OUT_W)
	) lfsr_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.seed_en_i(dummy_instr_seed_en_i),
		.seed_i(dummy_instr_seed_d),
		.lfsr_en_i(lfsr_en),
		.entropy_i('0),
		.state_o(lfsr_state)
	);
	function automatic [(((2 + OP_W) + OP_W) + TIMEOUT_CNT_W) - 1:0] sv2v_cast_4AF33;
		input reg [(((2 + OP_W) + OP_W) + TIMEOUT_CNT_W) - 1:0] inp;
		sv2v_cast_4AF33 = inp;
	endfunction
	assign lfsr_data = sv2v_cast_4AF33(lfsr_state);
	assign dummy_cnt_threshold = lfsr_data[TIMEOUT_CNT_W - 1-:TIMEOUT_CNT_W] & {dummy_instr_mask_i, {TIMEOUT_CNT_W - 3 {1'b1}}};
	assign dummy_cnt_incr = dummy_cnt_q + {{TIMEOUT_CNT_W - 1 {1'b0}}, 1'b1};
	assign dummy_cnt_d = (insert_dummy_instr ? {TIMEOUT_CNT_W {1'sb0}} : dummy_cnt_incr);
	assign dummy_cnt_en = (dummy_instr_en_i & id_in_ready_i) & (fetch_valid_i | insert_dummy_instr);
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			dummy_cnt_q <= {TIMEOUT_CNT_W {1'sb0}};
		else if (dummy_cnt_en)
			dummy_cnt_q <= dummy_cnt_d;
	assign insert_dummy_instr = dummy_instr_en_i & (dummy_cnt_q == dummy_cnt_threshold);
	localparam [1:0] DUMMY_ADD = 2'b00;
	localparam [1:0] DUMMY_AND = 2'b11;
	localparam [1:0] DUMMY_DIV = 2'b10;
	localparam [1:0] DUMMY_MUL = 2'b01;
	always @(*)
		case (lfsr_data[2 + (OP_W + (OP_W + (TIMEOUT_CNT_W - 1)))-:((2 + (OP_W + (OP_W + (TIMEOUT_CNT_W - 1)))) >= (OP_W + (OP_W + TIMEOUT_CNT_W)) ? ((2 + (OP_W + (OP_W + (TIMEOUT_CNT_W - 1)))) - (OP_W + (OP_W + TIMEOUT_CNT_W))) + 1 : ((OP_W + (OP_W + TIMEOUT_CNT_W)) - (2 + (OP_W + (OP_W + (TIMEOUT_CNT_W - 1))))) + 1)])
			DUMMY_ADD: begin
				dummy_set = 7'b0000000;
				dummy_opcode = 3'b000;
			end
			DUMMY_MUL: begin
				dummy_set = 7'b0000001;
				dummy_opcode = 3'b000;
			end
			DUMMY_DIV: begin
				dummy_set = 7'b0000001;
				dummy_opcode = 3'b100;
			end
			DUMMY_AND: begin
				dummy_set = 7'b0000000;
				dummy_opcode = 3'b111;
			end
			default: begin
				dummy_set = 7'b0000000;
				dummy_opcode = 3'b000;
			end
		endcase
	assign dummy_instr = {dummy_set, lfsr_data[OP_W + (OP_W + (TIMEOUT_CNT_W - 1))-:((OP_W + (OP_W + (TIMEOUT_CNT_W - 1))) >= (OP_W + TIMEOUT_CNT_W) ? ((OP_W + (OP_W + (TIMEOUT_CNT_W - 1))) - (OP_W + TIMEOUT_CNT_W)) + 1 : ((OP_W + TIMEOUT_CNT_W) - (OP_W + (OP_W + (TIMEOUT_CNT_W - 1)))) + 1)], lfsr_data[OP_W + (TIMEOUT_CNT_W - 1)-:((OP_W + (TIMEOUT_CNT_W - 1)) >= TIMEOUT_CNT_W ? ((OP_W + (TIMEOUT_CNT_W - 1)) - TIMEOUT_CNT_W) + 1 : (TIMEOUT_CNT_W - (OP_W + (TIMEOUT_CNT_W - 1))) + 1)], dummy_opcode, 5'h00, 7'h33};
	assign insert_dummy_instr_o = insert_dummy_instr;
	assign dummy_instr_data_o = dummy_instr;
endmodule
module ibex_ex_block (
	clk_i,
	rst_ni,
	alu_operator_i,
	alu_operand_a_i,
	alu_operand_b_i,
	alu_instr_first_cycle_i,
	bt_a_operand_i,
	bt_b_operand_i,
	multdiv_operator_i,
	mult_en_i,
	div_en_i,
	mult_sel_i,
	div_sel_i,
	multdiv_signed_mode_i,
	multdiv_operand_a_i,
	multdiv_operand_b_i,
	multdiv_ready_id_i,
	data_ind_timing_i,
	imd_val_we_o,
	imd_val_d_o,
	imd_val_q_i,
	alu_adder_result_ex_o,
	result_ex_o,
	branch_target_o,
	branch_decision_o,
	ex_valid_o
);
	localparam integer ibex_pkg_RV32MFast = 2;
	parameter integer RV32M = ibex_pkg_RV32MFast;
	localparam integer ibex_pkg_RV32BNone = 0;
	parameter integer RV32B = ibex_pkg_RV32BNone;
	parameter [0:0] BranchTargetALU = 0;
	input wire clk_i;
	input wire rst_ni;
	input wire [5:0] alu_operator_i;
	input wire [31:0] alu_operand_a_i;
	input wire [31:0] alu_operand_b_i;
	input wire alu_instr_first_cycle_i;
	input wire [31:0] bt_a_operand_i;
	input wire [31:0] bt_b_operand_i;
	input wire [1:0] multdiv_operator_i;
	input wire mult_en_i;
	input wire div_en_i;
	input wire mult_sel_i;
	input wire div_sel_i;
	input wire [1:0] multdiv_signed_mode_i;
	input wire [31:0] multdiv_operand_a_i;
	input wire [31:0] multdiv_operand_b_i;
	input wire multdiv_ready_id_i;
	input wire data_ind_timing_i;
	output wire [1:0] imd_val_we_o;
	output wire [67:0] imd_val_d_o;
	input wire [67:0] imd_val_q_i;
	output wire [31:0] alu_adder_result_ex_o;
	output wire [31:0] result_ex_o;
	output wire [31:0] branch_target_o;
	output wire branch_decision_o;
	output wire ex_valid_o;
	wire [31:0] alu_result;
	wire [31:0] multdiv_result;
	wire [32:0] multdiv_alu_operand_b;
	wire [32:0] multdiv_alu_operand_a;
	wire [33:0] alu_adder_result_ext;
	wire alu_cmp_result;
	wire alu_is_equal_result;
	wire multdiv_valid;
	wire multdiv_sel;
	wire [63:0] alu_imd_val_q;
	wire [63:0] alu_imd_val_d;
	wire [1:0] alu_imd_val_we;
	wire [67:0] multdiv_imd_val_d;
	wire [1:0] multdiv_imd_val_we;
	localparam integer ibex_pkg_RV32MNone = 0;
	generate
		if (RV32M != ibex_pkg_RV32MNone) begin : gen_multdiv_m
			assign multdiv_sel = mult_sel_i | div_sel_i;
		end
		else begin : gen_multdiv_no_m
			assign multdiv_sel = 1'b0;
		end
	endgenerate
	assign imd_val_d_o[34+:34] = (multdiv_sel ? multdiv_imd_val_d[34+:34] : {2'b00, alu_imd_val_d[32+:32]});
	assign imd_val_d_o[0+:34] = (multdiv_sel ? multdiv_imd_val_d[0+:34] : {2'b00, alu_imd_val_d[0+:32]});
	assign imd_val_we_o = (multdiv_sel ? multdiv_imd_val_we : alu_imd_val_we);
	assign alu_imd_val_q = {imd_val_q_i[65-:32], imd_val_q_i[31-:32]};
	assign result_ex_o = (multdiv_sel ? multdiv_result : alu_result);
	assign branch_decision_o = alu_cmp_result;
	generate
		if (BranchTargetALU) begin : g_branch_target_alu
			wire [32:0] bt_alu_result;
			wire unused_bt_carry;
			assign bt_alu_result = bt_a_operand_i + bt_b_operand_i;
			assign unused_bt_carry = bt_alu_result[32];
			assign branch_target_o = bt_alu_result[31:0];
		end
		else begin : g_no_branch_target_alu
			wire [31:0] unused_bt_a_operand;
			wire [31:0] unused_bt_b_operand;
			assign unused_bt_a_operand = bt_a_operand_i;
			assign unused_bt_b_operand = bt_b_operand_i;
			assign branch_target_o = alu_adder_result_ex_o;
		end
	endgenerate
	ibex_alu #(.RV32B(RV32B)) alu_i(
		.operator_i(alu_operator_i),
		.operand_a_i(alu_operand_a_i),
		.operand_b_i(alu_operand_b_i),
		.instr_first_cycle_i(alu_instr_first_cycle_i),
		.imd_val_q_i(alu_imd_val_q),
		.imd_val_we_o(alu_imd_val_we),
		.imd_val_d_o(alu_imd_val_d),
		.multdiv_operand_a_i(multdiv_alu_operand_a),
		.multdiv_operand_b_i(multdiv_alu_operand_b),
		.multdiv_sel_i(multdiv_sel),
		.adder_result_o(alu_adder_result_ex_o),
		.adder_result_ext_o(alu_adder_result_ext),
		.result_o(alu_result),
		.comparison_result_o(alu_cmp_result),
		.is_equal_result_o(alu_is_equal_result)
	);
	localparam integer ibex_pkg_RV32MSingleCycle = 3;
	localparam integer ibex_pkg_RV32MSlow = 1;
	generate
		if (RV32M == ibex_pkg_RV32MSlow) begin : gen_multdiv_slow
			ibex_multdiv_slow multdiv_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.mult_en_i(mult_en_i),
				.div_en_i(div_en_i),
				.mult_sel_i(mult_sel_i),
				.div_sel_i(div_sel_i),
				.operator_i(multdiv_operator_i),
				.signed_mode_i(multdiv_signed_mode_i),
				.op_a_i(multdiv_operand_a_i),
				.op_b_i(multdiv_operand_b_i),
				.alu_adder_ext_i(alu_adder_result_ext),
				.alu_adder_i(alu_adder_result_ex_o),
				.equal_to_zero_i(alu_is_equal_result),
				.data_ind_timing_i(data_ind_timing_i),
				.valid_o(multdiv_valid),
				.alu_operand_a_o(multdiv_alu_operand_a),
				.alu_operand_b_o(multdiv_alu_operand_b),
				.imd_val_q_i(imd_val_q_i),
				.imd_val_d_o(multdiv_imd_val_d),
				.imd_val_we_o(multdiv_imd_val_we),
				.multdiv_ready_id_i(multdiv_ready_id_i),
				.multdiv_result_o(multdiv_result)
			);
		end
		else if ((RV32M == ibex_pkg_RV32MFast) || (RV32M == ibex_pkg_RV32MSingleCycle)) begin : gen_multdiv_fast
			ibex_multdiv_fast #(.RV32M(RV32M)) multdiv_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.mult_en_i(mult_en_i),
				.div_en_i(div_en_i),
				.mult_sel_i(mult_sel_i),
				.div_sel_i(div_sel_i),
				.operator_i(multdiv_operator_i),
				.signed_mode_i(multdiv_signed_mode_i),
				.op_a_i(multdiv_operand_a_i),
				.op_b_i(multdiv_operand_b_i),
				.alu_operand_a_o(multdiv_alu_operand_a),
				.alu_operand_b_o(multdiv_alu_operand_b),
				.alu_adder_ext_i(alu_adder_result_ext),
				.alu_adder_i(alu_adder_result_ex_o),
				.equal_to_zero_i(alu_is_equal_result),
				.data_ind_timing_i(data_ind_timing_i),
				.imd_val_q_i(imd_val_q_i),
				.imd_val_d_o(multdiv_imd_val_d),
				.imd_val_we_o(multdiv_imd_val_we),
				.multdiv_ready_id_i(multdiv_ready_id_i),
				.valid_o(multdiv_valid),
				.multdiv_result_o(multdiv_result)
			);
		end
	endgenerate
	assign ex_valid_o = (multdiv_sel ? multdiv_valid : ~(|alu_imd_val_we));
endmodule
module ibex_fetch_fifo (
	clk_i,
	rst_ni,
	clear_i,
	busy_o,
	in_valid_i,
	in_addr_i,
	in_rdata_i,
	in_err_i,
	out_valid_o,
	out_ready_i,
	out_addr_o,
	out_addr_next_o,
	out_rdata_o,
	out_err_o,
	out_err_plus2_o
);
	parameter [31:0] NUM_REQS = 2;
	input wire clk_i;
	input wire rst_ni;
	input wire clear_i;
	output wire [NUM_REQS - 1:0] busy_o;
	input wire in_valid_i;
	input wire [31:0] in_addr_i;
	input wire [31:0] in_rdata_i;
	input wire in_err_i;
	output reg out_valid_o;
	input wire out_ready_i;
	output wire [31:0] out_addr_o;
	output wire [31:0] out_addr_next_o;
	output reg [31:0] out_rdata_o;
	output reg out_err_o;
	output reg out_err_plus2_o;
	localparam [31:0] DEPTH = NUM_REQS + 1;
	wire [(DEPTH * 32) - 1:0] rdata_d;
	reg [(DEPTH * 32) - 1:0] rdata_q;
	wire [DEPTH - 1:0] err_d;
	reg [DEPTH - 1:0] err_q;
	wire [DEPTH - 1:0] valid_d;
	reg [DEPTH - 1:0] valid_q;
	wire [DEPTH - 1:0] lowest_free_entry;
	wire [DEPTH - 1:0] valid_pushed;
	wire [DEPTH - 1:0] valid_popped;
	wire [DEPTH - 1:0] entry_en;
	wire pop_fifo;
	wire [31:0] rdata;
	wire [31:0] rdata_unaligned;
	wire err;
	wire err_unaligned;
	wire err_plus2;
	wire valid;
	wire valid_unaligned;
	wire aligned_is_compressed;
	wire unaligned_is_compressed;
	wire addr_incr_two;
	wire [31:1] instr_addr_next;
	wire [31:1] instr_addr_d;
	reg [31:1] instr_addr_q;
	wire instr_addr_en;
	wire unused_addr_in;
	assign rdata = (valid_q[0] ? rdata_q[0+:32] : in_rdata_i);
	assign err = (valid_q[0] ? err_q[0] : in_err_i);
	assign valid = valid_q[0] | in_valid_i;
	assign rdata_unaligned = (valid_q[1] ? {rdata_q[47-:16], rdata[31:16]} : {in_rdata_i[15:0], rdata[31:16]});
	assign err_unaligned = (valid_q[1] ? (err_q[1] & ~unaligned_is_compressed) | err_q[0] : (valid_q[0] & err_q[0]) | (in_err_i & (~valid_q[0] | ~unaligned_is_compressed)));
	assign err_plus2 = (valid_q[1] ? err_q[1] & ~err_q[0] : (in_err_i & valid_q[0]) & ~err_q[0]);
	assign valid_unaligned = (valid_q[1] ? 1'b1 : valid_q[0] & in_valid_i);
	assign unaligned_is_compressed = (rdata[17:16] != 2'b11) & ~err;
	assign aligned_is_compressed = (rdata[1:0] != 2'b11) & ~err;
	always @(*)
		if (out_addr_o[1]) begin
			out_rdata_o = rdata_unaligned;
			out_err_o = err_unaligned;
			out_err_plus2_o = err_plus2;
			if (unaligned_is_compressed)
				out_valid_o = valid;
			else
				out_valid_o = valid_unaligned;
		end
		else begin
			out_rdata_o = rdata;
			out_err_o = err;
			out_err_plus2_o = 1'b0;
			out_valid_o = valid;
		end
	assign instr_addr_en = clear_i | (out_ready_i & out_valid_o);
	assign addr_incr_two = (instr_addr_q[1] ? unaligned_is_compressed : aligned_is_compressed);
	assign instr_addr_next = instr_addr_q[31:1] + {29'd0, ~addr_incr_two, addr_incr_two};
	assign instr_addr_d = (clear_i ? in_addr_i[31:1] : instr_addr_next);
	always @(posedge clk_i)
		if (instr_addr_en)
			instr_addr_q <= instr_addr_d;
	assign out_addr_next_o = {instr_addr_next, 1'b0};
	assign out_addr_o = {instr_addr_q, 1'b0};
	assign unused_addr_in = in_addr_i[0];
	assign busy_o = valid_q[DEPTH - 1:DEPTH - NUM_REQS];
	assign pop_fifo = (out_ready_i & out_valid_o) & (~aligned_is_compressed | out_addr_o[1]);
	generate
		genvar i;
		for (i = 0; i < (DEPTH - 1); i = i + 1) begin : g_fifo_next
			if (i == 0) begin : g_ent0
				assign lowest_free_entry[i] = ~valid_q[i];
			end
			else begin : g_ent_others
				assign lowest_free_entry[i] = ~valid_q[i] & valid_q[i - 1];
			end
			assign valid_pushed[i] = (in_valid_i & lowest_free_entry[i]) | valid_q[i];
			assign valid_popped[i] = (pop_fifo ? valid_pushed[i + 1] : valid_pushed[i]);
			assign valid_d[i] = valid_popped[i] & ~clear_i;
			assign entry_en[i] = (valid_pushed[i + 1] & pop_fifo) | ((in_valid_i & lowest_free_entry[i]) & ~pop_fifo);
			assign rdata_d[i * 32+:32] = (valid_q[i + 1] ? rdata_q[(i + 1) * 32+:32] : in_rdata_i);
			assign err_d[i] = (valid_q[i + 1] ? err_q[i + 1] : in_err_i);
		end
	endgenerate
	assign lowest_free_entry[DEPTH - 1] = ~valid_q[DEPTH - 1] & valid_q[DEPTH - 2];
	assign valid_pushed[DEPTH - 1] = valid_q[DEPTH - 1] | (in_valid_i & lowest_free_entry[DEPTH - 1]);
	assign valid_popped[DEPTH - 1] = (pop_fifo ? 1'b0 : valid_pushed[DEPTH - 1]);
	assign valid_d[DEPTH - 1] = valid_popped[DEPTH - 1] & ~clear_i;
	assign entry_en[DEPTH - 1] = in_valid_i & lowest_free_entry[DEPTH - 1];
	assign rdata_d[(DEPTH - 1) * 32+:32] = in_rdata_i;
	assign err_d[DEPTH - 1] = in_err_i;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			valid_q <= {DEPTH {1'sb0}};
		else
			valid_q <= valid_d;
	generate
		for (i = 0; i < DEPTH; i = i + 1) begin : g_fifo_regs
			always @(posedge clk_i)
				if (entry_en[i]) begin
					rdata_q[i * 32+:32] <= rdata_d[i * 32+:32];
					err_q[i] <= err_d[i];
				end
		end
	endgenerate
endmodule
module ibex_icache (
	clk_i,
	rst_ni,
	req_i,
	branch_i,
	branch_spec_i,
	addr_i,
	ready_i,
	valid_o,
	rdata_o,
	addr_o,
	err_o,
	err_plus2_o,
	instr_req_o,
	instr_gnt_i,
	instr_addr_o,
	instr_rdata_i,
	instr_err_i,
	instr_pmp_err_i,
	instr_rvalid_i,
	icache_enable_i,
	icache_inval_i,
	busy_o
);
	parameter [31:0] BusWidth = 32;
	parameter [31:0] CacheSizeBytes = 4096;
	parameter [0:0] ICacheECC = 1'b0;
	parameter [31:0] LineSize = 64;
	parameter [31:0] NumWays = 2;
	parameter [0:0] SpecRequest = 1'b0;
	parameter [0:0] BranchCache = 1'b0;
	input wire clk_i;
	input wire rst_ni;
	input wire req_i;
	input wire branch_i;
	input wire branch_spec_i;
	input wire [31:0] addr_i;
	input wire ready_i;
	output wire valid_o;
	output wire [31:0] rdata_o;
	output wire [31:0] addr_o;
	output wire err_o;
	output wire err_plus2_o;
	output wire instr_req_o;
	input wire instr_gnt_i;
	output wire [31:0] instr_addr_o;
	input wire [BusWidth - 1:0] instr_rdata_i;
	input wire instr_err_i;
	input wire instr_pmp_err_i;
	input wire instr_rvalid_i;
	input wire icache_enable_i;
	input wire icache_inval_i;
	output wire busy_o;
	localparam [31:0] ADDR_W = 32;
	localparam [31:0] NUM_FB = 4;
	localparam [31:0] FB_THRESHOLD = NUM_FB - 2;
	localparam [31:0] LINE_SIZE_ECC = (ICacheECC ? LineSize + 8 : LineSize);
	localparam [31:0] LINE_SIZE_BYTES = LineSize / 8;
	localparam [31:0] LINE_W = $clog2(LINE_SIZE_BYTES);
	localparam [31:0] BUS_BYTES = BusWidth / 8;
	localparam [31:0] BUS_W = $clog2(BUS_BYTES);
	localparam [31:0] LINE_BEATS = LINE_SIZE_BYTES / BUS_BYTES;
	localparam [31:0] LINE_BEATS_W = $clog2(LINE_BEATS);
	localparam [31:0] NUM_LINES = (CacheSizeBytes / NumWays) / LINE_SIZE_BYTES;
	localparam [31:0] INDEX_W = $clog2(NUM_LINES);
	localparam [31:0] INDEX_HI = (INDEX_W + LINE_W) - 1;
	localparam [31:0] TAG_SIZE = ((ADDR_W - INDEX_W) - LINE_W) + 1;
	localparam [31:0] TAG_SIZE_ECC = (ICacheECC ? TAG_SIZE + 6 : TAG_SIZE);
	localparam [31:0] OUTPUT_BEATS = BUS_BYTES / 2;
	wire [ADDR_W - 1:0] lookup_addr_aligned;
	wire [ADDR_W - 1:0] prefetch_addr_d;
	reg [ADDR_W - 1:0] prefetch_addr_q;
	wire prefetch_addr_en;
	wire branch_suppress;
	wire lookup_throttle;
	wire lookup_req_ic0;
	wire [ADDR_W - 1:0] lookup_addr_ic0;
	wire [INDEX_W - 1:0] lookup_index_ic0;
	wire fill_req_ic0;
	wire [INDEX_W - 1:0] fill_index_ic0;
	wire [TAG_SIZE - 1:0] fill_tag_ic0;
	wire [LineSize - 1:0] fill_wdata_ic0;
	wire lookup_grant_ic0;
	wire lookup_actual_ic0;
	wire fill_grant_ic0;
	wire tag_req_ic0;
	wire [INDEX_W - 1:0] tag_index_ic0;
	wire [NumWays - 1:0] tag_banks_ic0;
	wire tag_write_ic0;
	wire [TAG_SIZE_ECC - 1:0] tag_wdata_ic0;
	wire data_req_ic0;
	wire [INDEX_W - 1:0] data_index_ic0;
	wire [NumWays - 1:0] data_banks_ic0;
	wire data_write_ic0;
	wire [LINE_SIZE_ECC - 1:0] data_wdata_ic0;
	wire [TAG_SIZE_ECC - 1:0] tag_rdata_ic1 [0:NumWays - 1];
	wire [LINE_SIZE_ECC - 1:0] data_rdata_ic1 [0:NumWays - 1];
	reg [LINE_SIZE_ECC - 1:0] hit_data_ic1;
	reg lookup_valid_ic1;
	reg [ADDR_W - 1:INDEX_HI + 1] lookup_addr_ic1;
	wire [NumWays - 1:0] tag_match_ic1;
	wire tag_hit_ic1;
	wire [NumWays - 1:0] tag_invalid_ic1;
	wire [NumWays - 1:0] lowest_invalid_way_ic1;
	wire [NumWays - 1:0] round_robin_way_ic1;
	reg [NumWays - 1:0] round_robin_way_q;
	wire [NumWays - 1:0] sel_way_ic1;
	wire ecc_err_ic1;
	wire ecc_write_req;
	wire [NumWays - 1:0] ecc_write_ways;
	wire [INDEX_W - 1:0] ecc_write_index;
	wire gnt_or_pmp_err;
	wire gnt_not_pmp_err;
	reg [1:0] fb_fill_level;
	wire fill_cache_new;
	wire fill_new_alloc;
	wire fill_spec_req;
	wire fill_spec_done;
	wire fill_spec_hold;
	wire [(NUM_FB * NUM_FB) - 1:0] fill_older_d;
	reg [(NUM_FB * NUM_FB) - 1:0] fill_older_q;
	wire [NUM_FB - 1:0] fill_alloc_sel;
	wire [NUM_FB - 1:0] fill_alloc;
	wire [NUM_FB - 1:0] fill_busy_d;
	reg [NUM_FB - 1:0] fill_busy_q;
	wire [NUM_FB - 1:0] fill_done;
	reg [NUM_FB - 1:0] fill_in_ic1;
	wire [NUM_FB - 1:0] fill_stale_d;
	reg [NUM_FB - 1:0] fill_stale_q;
	wire [NUM_FB - 1:0] fill_cache_d;
	reg [NUM_FB - 1:0] fill_cache_q;
	wire [NUM_FB - 1:0] fill_hit_ic1;
	wire [NUM_FB - 1:0] fill_hit_d;
	reg [NUM_FB - 1:0] fill_hit_q;
	wire [(LINE_BEATS_W >= 0 ? (NUM_FB * (LINE_BEATS_W + 1)) - 1 : (NUM_FB * (1 - LINE_BEATS_W)) + (LINE_BEATS_W - 1)):(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W)] fill_ext_cnt_d;
	reg [(LINE_BEATS_W >= 0 ? (NUM_FB * (LINE_BEATS_W + 1)) - 1 : (NUM_FB * (1 - LINE_BEATS_W)) + (LINE_BEATS_W - 1)):(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W)] fill_ext_cnt_q;
	wire [NUM_FB - 1:0] fill_ext_hold_d;
	reg [NUM_FB - 1:0] fill_ext_hold_q;
	wire [NUM_FB - 1:0] fill_ext_done;
	wire [(LINE_BEATS_W >= 0 ? (NUM_FB * (LINE_BEATS_W + 1)) - 1 : (NUM_FB * (1 - LINE_BEATS_W)) + (LINE_BEATS_W - 1)):(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W)] fill_rvd_cnt_d;
	reg [(LINE_BEATS_W >= 0 ? (NUM_FB * (LINE_BEATS_W + 1)) - 1 : (NUM_FB * (1 - LINE_BEATS_W)) + (LINE_BEATS_W - 1)):(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W)] fill_rvd_cnt_q;
	wire [NUM_FB - 1:0] fill_rvd_done;
	wire [NUM_FB - 1:0] fill_ram_done_d;
	reg [NUM_FB - 1:0] fill_ram_done_q;
	wire [NUM_FB - 1:0] fill_out_grant;
	wire [(LINE_BEATS_W >= 0 ? (NUM_FB * (LINE_BEATS_W + 1)) - 1 : (NUM_FB * (1 - LINE_BEATS_W)) + (LINE_BEATS_W - 1)):(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W)] fill_out_cnt_d;
	reg [(LINE_BEATS_W >= 0 ? (NUM_FB * (LINE_BEATS_W + 1)) - 1 : (NUM_FB * (1 - LINE_BEATS_W)) + (LINE_BEATS_W - 1)):(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W)] fill_out_cnt_q;
	wire [NUM_FB - 1:0] fill_out_done;
	wire [NUM_FB - 1:0] fill_ext_req;
	wire [NUM_FB - 1:0] fill_rvd_exp;
	wire [NUM_FB - 1:0] fill_ram_req;
	wire [NUM_FB - 1:0] fill_out_req;
	wire [NUM_FB - 1:0] fill_data_sel;
	wire [NUM_FB - 1:0] fill_data_reg;
	wire [NUM_FB - 1:0] fill_data_hit;
	wire [NUM_FB - 1:0] fill_data_rvd;
	wire [(NUM_FB * LINE_BEATS_W) - 1:0] fill_ext_off;
	wire [(NUM_FB * LINE_BEATS_W) - 1:0] fill_rvd_off;
	wire [(LINE_BEATS_W >= 0 ? (NUM_FB * (LINE_BEATS_W + 1)) - 1 : (NUM_FB * (1 - LINE_BEATS_W)) + (LINE_BEATS_W - 1)):(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W)] fill_rvd_beat;
	wire [NUM_FB - 1:0] fill_ext_arb;
	wire [NUM_FB - 1:0] fill_ram_arb;
	wire [NUM_FB - 1:0] fill_out_arb;
	wire [NUM_FB - 1:0] fill_rvd_arb;
	wire [NUM_FB - 1:0] fill_entry_en;
	wire [NUM_FB - 1:0] fill_addr_en;
	wire [NUM_FB - 1:0] fill_way_en;
	wire [(NUM_FB * LINE_BEATS) - 1:0] fill_data_en;
	wire [(NUM_FB * LINE_BEATS) - 1:0] fill_err_d;
	reg [(NUM_FB * LINE_BEATS) - 1:0] fill_err_q;
	reg [ADDR_W - 1:0] fill_addr_q [0:NUM_FB - 1];
	reg [NumWays - 1:0] fill_way_q [0:NUM_FB - 1];
	wire [LineSize - 1:0] fill_data_d [0:NUM_FB - 1];
	reg [LineSize - 1:0] fill_data_q [0:NUM_FB - 1];
	reg [ADDR_W - 1:BUS_W] fill_ext_req_addr;
	reg [ADDR_W - 1:0] fill_ram_req_addr;
	reg [NumWays - 1:0] fill_ram_req_way;
	reg [LineSize - 1:0] fill_ram_req_data;
	reg [LineSize - 1:0] fill_out_data;
	reg [LINE_BEATS - 1:0] fill_out_err;
	wire instr_req;
	wire [ADDR_W - 1:BUS_W] instr_addr;
	wire skid_complete_instr;
	wire skid_ready;
	wire output_compressed;
	wire skid_valid_d;
	reg skid_valid_q;
	wire skid_en;
	wire [15:0] skid_data_d;
	reg [15:0] skid_data_q;
	reg skid_err_q;
	wire output_valid;
	wire addr_incr_two;
	wire output_addr_en;
	wire [ADDR_W - 1:1] output_addr_d;
	reg [ADDR_W - 1:1] output_addr_q;
	reg [15:0] output_data_lo;
	reg [15:0] output_data_hi;
	wire data_valid;
	wire output_ready;
	wire [LineSize - 1:0] line_data;
	wire [LINE_BEATS - 1:0] line_err;
	reg [31:0] line_data_muxed;
	reg line_err_muxed;
	wire [31:0] output_data;
	wire output_err;
	wire start_inval;
	wire inval_done;
	reg reset_inval_q;
	wire inval_prog_d;
	reg inval_prog_q;
	wire [INDEX_W - 1:0] inval_index_d;
	reg [INDEX_W - 1:0] inval_index_q;
	assign lookup_addr_aligned = {lookup_addr_ic0[ADDR_W - 1:LINE_W], {LINE_W {1'b0}}};
	assign prefetch_addr_d = (lookup_grant_ic0 ? lookup_addr_aligned + {{(ADDR_W - LINE_W) - 1 {1'b0}}, 1'b1, {LINE_W {1'b0}}} : addr_i);
	assign prefetch_addr_en = branch_i | lookup_grant_ic0;
	always @(posedge clk_i)
		if (prefetch_addr_en)
			prefetch_addr_q <= prefetch_addr_d;
	assign lookup_throttle = fb_fill_level > FB_THRESHOLD[1:0];
	assign lookup_req_ic0 = ((req_i & ~&fill_busy_q) & (branch_i | ~lookup_throttle)) & ~ecc_write_req;
	assign lookup_addr_ic0 = (branch_spec_i ? addr_i : prefetch_addr_q);
	assign lookup_index_ic0 = lookup_addr_ic0[INDEX_HI:LINE_W];
	assign fill_req_ic0 = |fill_ram_req;
	assign fill_index_ic0 = fill_ram_req_addr[INDEX_HI:LINE_W];
	assign fill_tag_ic0 = {~inval_prog_q & ~ecc_write_req, fill_ram_req_addr[ADDR_W - 1:INDEX_HI + 1]};
	assign fill_wdata_ic0 = fill_ram_req_data;
	assign branch_suppress = branch_spec_i & ~branch_i;
	assign lookup_grant_ic0 = lookup_req_ic0 & ~branch_suppress;
	assign fill_grant_ic0 = ((fill_req_ic0 & (~lookup_req_ic0 | branch_suppress)) & ~inval_prog_q) & ~ecc_write_req;
	assign lookup_actual_ic0 = ((lookup_grant_ic0 & icache_enable_i) & ~inval_prog_q) & ~start_inval;
	assign tag_req_ic0 = ((lookup_req_ic0 | fill_req_ic0) | inval_prog_q) | ecc_write_req;
	assign tag_index_ic0 = (inval_prog_q ? inval_index_q : (ecc_write_req ? ecc_write_index : (fill_grant_ic0 ? fill_index_ic0 : lookup_index_ic0)));
	assign tag_banks_ic0 = (ecc_write_req ? ecc_write_ways : (fill_grant_ic0 ? fill_ram_req_way : {NumWays {1'b1}}));
	assign tag_write_ic0 = (fill_grant_ic0 | inval_prog_q) | ecc_write_req;
	assign data_req_ic0 = lookup_req_ic0 | fill_req_ic0;
	assign data_index_ic0 = tag_index_ic0;
	assign data_banks_ic0 = tag_banks_ic0;
	assign data_write_ic0 = tag_write_ic0;
	generate
		if (ICacheECC) begin : gen_ecc_wdata
			wire [21:0] tag_ecc_input_padded;
			wire [27:0] tag_ecc_output_padded;
			wire [22 - TAG_SIZE:0] tag_ecc_output_unused;
			assign tag_ecc_input_padded = {{22 - TAG_SIZE {1'b0}}, fill_tag_ic0};
			assign tag_ecc_output_unused = tag_ecc_output_padded[21:TAG_SIZE - 1];
			prim_secded_28_22_enc tag_ecc_enc(
				.in(tag_ecc_input_padded),
				.out(tag_ecc_output_padded)
			);
			assign tag_wdata_ic0 = {tag_ecc_output_padded[27:22], tag_ecc_output_padded[TAG_SIZE - 1:0]};
			prim_secded_72_64_enc data_ecc_enc(
				.in(fill_wdata_ic0),
				.out(data_wdata_ic0)
			);
		end
		else begin : gen_noecc_wdata
			assign tag_wdata_ic0 = fill_tag_ic0;
			assign data_wdata_ic0 = fill_wdata_ic0;
		end
	endgenerate
	generate
		genvar way;
		for (way = 0; way < NumWays; way = way + 1) begin : gen_rams
			prim_ram_1p #(
				.Width(TAG_SIZE_ECC),
				.Depth(NUM_LINES),
				.DataBitsPerMask(TAG_SIZE_ECC)
			) tag_bank(
				.clk_i(clk_i),
				.req_i(tag_req_ic0 & tag_banks_ic0[way]),
				.write_i(tag_write_ic0),
				.wmask_i({TAG_SIZE_ECC {1'b1}}),
				.addr_i(tag_index_ic0),
				.wdata_i(tag_wdata_ic0),
				.rdata_o(tag_rdata_ic1[way])
			);
			prim_ram_1p #(
				.Width(LINE_SIZE_ECC),
				.Depth(NUM_LINES),
				.DataBitsPerMask(LINE_SIZE_ECC)
			) data_bank(
				.clk_i(clk_i),
				.req_i(data_req_ic0 & data_banks_ic0[way]),
				.write_i(data_write_ic0),
				.wmask_i({LINE_SIZE_ECC {1'b1}}),
				.addr_i(data_index_ic0),
				.wdata_i(data_wdata_ic0),
				.rdata_o(data_rdata_ic1[way])
			);
		end
	endgenerate
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			lookup_valid_ic1 <= 1'b0;
		else
			lookup_valid_ic1 <= lookup_actual_ic0;
	always @(posedge clk_i)
		if (lookup_grant_ic0) begin
			lookup_addr_ic1 <= lookup_addr_ic0[ADDR_W - 1:INDEX_HI + 1];
			fill_in_ic1 <= fill_alloc_sel;
		end
	generate
		for (way = 0; way < NumWays; way = way + 1) begin : gen_tag_match
			assign tag_match_ic1[way] = tag_rdata_ic1[way][TAG_SIZE - 1:0] == {1'b1, lookup_addr_ic1[ADDR_W - 1:INDEX_HI + 1]};
			assign tag_invalid_ic1[way] = ~tag_rdata_ic1[way][TAG_SIZE - 1];
		end
	endgenerate
	assign tag_hit_ic1 = |tag_match_ic1;
	always @(*) begin
		hit_data_ic1 = 'b0;
		begin : sv2v_autoblock_1
			reg signed [31:0] way;
			for (way = 0; way < NumWays; way = way + 1)
				if (tag_match_ic1[way])
					hit_data_ic1 = hit_data_ic1 | data_rdata_ic1[way];
		end
	end
	assign lowest_invalid_way_ic1[0] = tag_invalid_ic1[0];
	assign round_robin_way_ic1[0] = round_robin_way_q[NumWays - 1];
	generate
		for (way = 1; way < NumWays; way = way + 1) begin : gen_lowest_way
			assign lowest_invalid_way_ic1[way] = tag_invalid_ic1[way] & ~|tag_invalid_ic1[way - 1:0];
			assign round_robin_way_ic1[way] = round_robin_way_q[way - 1];
		end
	endgenerate
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			round_robin_way_q <= {{NumWays - 1 {1'b0}}, 1'b1};
		else if (lookup_valid_ic1)
			round_robin_way_q <= round_robin_way_ic1;
	assign sel_way_ic1 = (|tag_invalid_ic1 ? lowest_invalid_way_ic1 : round_robin_way_q);
	generate
		if (ICacheECC) begin : gen_data_ecc_checking
			wire [NumWays - 1:0] tag_err_ic1;
			wire [1:0] data_err_ic1;
			wire ecc_correction_write_d;
			reg ecc_correction_write_q;
			wire [NumWays - 1:0] ecc_correction_ways_d;
			reg [NumWays - 1:0] ecc_correction_ways_q;
			reg [INDEX_W - 1:0] lookup_index_ic1;
			reg [INDEX_W - 1:0] ecc_correction_index_q;
			for (way = 0; way < NumWays; way = way + 1) begin : gen_tag_ecc
				wire [1:0] tag_err_bank_ic1;
				wire [27:0] tag_rdata_padded_ic1;
				assign tag_rdata_padded_ic1 = {tag_rdata_ic1[way][TAG_SIZE_ECC - 1-:6], {22 - TAG_SIZE {1'b0}}, tag_rdata_ic1[way][TAG_SIZE - 1:0]};
				prim_secded_28_22_dec data_ecc_dec(
					.in(tag_rdata_padded_ic1),
					.d_o(),
					.syndrome_o(),
					.err_o(tag_err_bank_ic1)
				);
				assign tag_err_ic1[way] = |tag_err_bank_ic1;
			end
			prim_secded_72_64_dec data_ecc_dec(
				.in(hit_data_ic1),
				.d_o(),
				.syndrome_o(),
				.err_o(data_err_ic1)
			);
			assign ecc_err_ic1 = lookup_valid_ic1 & (|data_err_ic1 | |tag_err_ic1);
			assign ecc_correction_ways_d = {NumWays {|tag_err_ic1}} | (tag_match_ic1 & {NumWays {|data_err_ic1}});
			assign ecc_correction_write_d = ecc_err_ic1;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					ecc_correction_write_q <= 1'b0;
				else
					ecc_correction_write_q <= ecc_correction_write_d;
			always @(posedge clk_i)
				if (lookup_grant_ic0)
					lookup_index_ic1 <= lookup_addr_ic0[INDEX_HI-:INDEX_W];
			always @(posedge clk_i)
				if (ecc_err_ic1) begin
					ecc_correction_ways_q <= ecc_correction_ways_d;
					ecc_correction_index_q <= lookup_index_ic1;
				end
			assign ecc_write_req = ecc_correction_write_q;
			assign ecc_write_ways = ecc_correction_ways_q;
			assign ecc_write_index = ecc_correction_index_q;
		end
		else begin : gen_no_data_ecc
			assign ecc_err_ic1 = 1'b0;
			assign ecc_write_req = 1'b0;
			assign ecc_write_ways = {NumWays {1'sb0}};
			assign ecc_write_index = {INDEX_W {1'sb0}};
		end
	endgenerate
	generate
		if (BranchCache) begin : gen_caching_logic
			localparam [31:0] CACHE_AHEAD = 2;
			localparam [31:0] CACHE_CNT_W = (CACHE_AHEAD == 1 ? 1 : 2);
			wire cache_cnt_dec;
			wire [CACHE_CNT_W - 1:0] cache_cnt_d;
			reg [CACHE_CNT_W - 1:0] cache_cnt_q;
			assign cache_cnt_dec = lookup_grant_ic0 & |cache_cnt_q;
			assign cache_cnt_d = (branch_i ? CACHE_AHEAD[CACHE_CNT_W - 1:0] : cache_cnt_q - {{CACHE_CNT_W - 1 {1'b0}}, cache_cnt_dec});
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					cache_cnt_q <= {CACHE_CNT_W {1'sb0}};
				else
					cache_cnt_q <= cache_cnt_d;
			assign fill_cache_new = (((branch_i | |cache_cnt_q) & icache_enable_i) & ~icache_inval_i) & ~inval_prog_q;
		end
		else begin : gen_cache_all
			assign fill_cache_new = (icache_enable_i & ~start_inval) & ~inval_prog_q;
		end
	endgenerate
	always @(*) begin
		fb_fill_level = {2 {1'sb0}};
		begin : sv2v_autoblock_2
			reg signed [31:0] i;
			for (i = 0; i < NUM_FB; i = i + 1)
				if (fill_busy_q[i] & ~fill_stale_q[i])
					fb_fill_level = fb_fill_level + {1'b0, 1'b1};
		end
	end
	assign gnt_or_pmp_err = instr_gnt_i | instr_pmp_err_i;
	assign gnt_not_pmp_err = instr_gnt_i & ~instr_pmp_err_i;
	assign fill_new_alloc = lookup_grant_ic0;
	assign fill_spec_req = (SpecRequest | branch_i) & ~|fill_ext_req;
	assign fill_spec_done = fill_spec_req & gnt_not_pmp_err;
	assign fill_spec_hold = fill_spec_req & ~gnt_or_pmp_err;
	generate
		genvar fb;
		for (fb = 0; fb < NUM_FB; fb = fb + 1) begin : gen_fbs
			if (fb == 0) begin : gen_fb_zero
				assign fill_alloc_sel[fb] = ~fill_busy_q[fb];
			end
			else begin : gen_fb_rest
				assign fill_alloc_sel[fb] = ~fill_busy_q[fb] & &fill_busy_q[fb - 1:0];
			end
			assign fill_alloc[fb] = fill_alloc_sel[fb] & fill_new_alloc;
			assign fill_busy_d[fb] = fill_alloc[fb] | (fill_busy_q[fb] & ~fill_done[fb]);
			assign fill_older_d[fb * NUM_FB+:NUM_FB] = (fill_alloc[fb] ? fill_busy_q : fill_older_q[fb * NUM_FB+:NUM_FB]) & ~fill_done;
			assign fill_done[fb] = ((((fill_ram_done_q[fb] | fill_hit_q[fb]) | ~fill_cache_q[fb]) | |fill_err_q[fb * LINE_BEATS+:LINE_BEATS]) & ((fill_out_done[fb] | fill_stale_q[fb]) | branch_i)) & fill_rvd_done[fb];
			assign fill_stale_d[fb] = fill_busy_q[fb] & (branch_i | fill_stale_q[fb]);
			assign fill_cache_d[fb] = (fill_alloc[fb] & fill_cache_new) | (((fill_cache_q[fb] & fill_busy_q[fb]) & icache_enable_i) & ~icache_inval_i);
			assign fill_hit_ic1[fb] = ((lookup_valid_ic1 & fill_in_ic1[fb]) & tag_hit_ic1) & ~ecc_err_ic1;
			assign fill_hit_d[fb] = fill_hit_ic1[fb] | (fill_hit_q[fb] & fill_busy_q[fb]);
			assign fill_ext_req[fb] = fill_busy_q[fb] & ~fill_ext_done[fb];
			assign fill_ext_cnt_d[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] = (fill_alloc[fb] ? {{LINE_BEATS_W {1'b0}}, fill_spec_done} : fill_ext_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] + {{LINE_BEATS_W {1'b0}}, fill_ext_arb[fb] & gnt_not_pmp_err});
			assign fill_ext_hold_d[fb] = (fill_alloc[fb] & fill_spec_hold) | (fill_ext_arb[fb] & ~gnt_or_pmp_err);
			assign fill_ext_done[fb] = ((((fill_ext_cnt_q[(fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W : LINE_BEATS_W - LINE_BEATS_W)] | fill_hit_ic1[fb]) | fill_hit_q[fb]) | fill_err_q[(fb * LINE_BEATS) + fill_ext_off[fb * LINE_BEATS_W+:LINE_BEATS_W]]) | (~fill_cache_q[fb] & (branch_i | fill_stale_q[fb]))) & ~fill_ext_hold_q[fb];
			assign fill_rvd_exp[fb] = fill_busy_q[fb] & ~fill_rvd_done[fb];
			assign fill_rvd_cnt_d[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] = (fill_alloc[fb] ? {(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W) {1'sb0}} : fill_rvd_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] + {{LINE_BEATS_W {1'b0}}, fill_rvd_arb[fb]});
			assign fill_rvd_done[fb] = fill_ext_done[fb] & (fill_rvd_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] == fill_ext_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)]);
			assign fill_out_req[fb] = ((fill_busy_q[fb] & ~fill_stale_q[fb]) & ~fill_out_done[fb]) & ((((fill_hit_ic1[fb] | fill_hit_q[fb]) | fill_err_q[(fb * LINE_BEATS) + fill_out_cnt_q[(LINE_BEATS_W >= 0 ? (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W - 1 : LINE_BEATS_W - (LINE_BEATS_W - 1)) : (((fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W - 1 : LINE_BEATS_W - (LINE_BEATS_W - 1))) + LINE_BEATS_W) - 1)-:LINE_BEATS_W]]) | (fill_rvd_beat[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] > fill_out_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)])) | fill_rvd_arb[fb]);
			assign fill_out_grant[fb] = fill_out_arb[fb] & output_ready;
			assign fill_out_cnt_d[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] = (fill_alloc[fb] ? {1'b0, lookup_addr_ic0[LINE_W - 1:BUS_W]} : fill_out_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] + {{LINE_BEATS_W {1'b0}}, fill_out_grant[fb]});
			assign fill_out_done[fb] = fill_out_cnt_q[(fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W : LINE_BEATS_W - LINE_BEATS_W)];
			assign fill_ram_req[fb] = ((((fill_busy_q[fb] & fill_rvd_cnt_q[(fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W : LINE_BEATS_W - LINE_BEATS_W)]) & ~fill_hit_q[fb]) & fill_cache_q[fb]) & ~|fill_err_q[fb * LINE_BEATS+:LINE_BEATS]) & ~fill_ram_done_q[fb];
			assign fill_ram_done_d[fb] = fill_ram_arb[fb] | (fill_ram_done_q[fb] & fill_busy_q[fb]);
			assign fill_rvd_beat[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] = {1'b0, fill_addr_q[fb][LINE_W - 1:BUS_W]} + fill_rvd_cnt_q[(LINE_BEATS_W >= 0 ? (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? (LINE_BEATS_W >= 0 ? LINE_BEATS_W : (LINE_BEATS_W + (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) - 1) : LINE_BEATS_W - (LINE_BEATS_W >= 0 ? LINE_BEATS_W : (LINE_BEATS_W + (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) - 1)) : (((fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? (LINE_BEATS_W >= 0 ? LINE_BEATS_W : (LINE_BEATS_W + (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) - 1) : LINE_BEATS_W - (LINE_BEATS_W >= 0 ? LINE_BEATS_W : (LINE_BEATS_W + (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) - 1))) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) - 1)-:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)];
			assign fill_ext_off[fb * LINE_BEATS_W+:LINE_BEATS_W] = fill_addr_q[fb][LINE_W - 1:BUS_W] + fill_ext_cnt_q[(LINE_BEATS_W >= 0 ? (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W - 1 : LINE_BEATS_W - (LINE_BEATS_W - 1)) : (((fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W - 1 : LINE_BEATS_W - (LINE_BEATS_W - 1))) + LINE_BEATS_W) - 1)-:LINE_BEATS_W];
			assign fill_rvd_off[fb * LINE_BEATS_W+:LINE_BEATS_W] = fill_rvd_beat[(LINE_BEATS_W >= 0 ? (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W - 1 : LINE_BEATS_W - (LINE_BEATS_W - 1)) : (((fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)) + (LINE_BEATS_W >= 0 ? LINE_BEATS_W - 1 : LINE_BEATS_W - (LINE_BEATS_W - 1))) + LINE_BEATS_W) - 1)-:LINE_BEATS_W];
			assign fill_ext_arb[fb] = fill_ext_req[fb] & ~|(fill_ext_req & fill_older_q[fb * NUM_FB+:NUM_FB]);
			assign fill_ram_arb[fb] = (fill_ram_req[fb] & fill_grant_ic0) & ~|(fill_ram_req & fill_older_q[fb * NUM_FB+:NUM_FB]);
			assign fill_data_sel[fb] = ~|(((fill_busy_q & ~fill_out_done) & ~fill_stale_q) & fill_older_q[fb * NUM_FB+:NUM_FB]);
			assign fill_out_arb[fb] = fill_out_req[fb] & fill_data_sel[fb];
			assign fill_rvd_arb[fb] = (instr_rvalid_i & fill_rvd_exp[fb]) & ~|(fill_rvd_exp & fill_older_q[fb * NUM_FB+:NUM_FB]);
			assign fill_data_reg[fb] = (((fill_busy_q[fb] & ~fill_stale_q[fb]) & ~fill_out_done[fb]) & fill_data_sel[fb]) & (((fill_rvd_beat[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] > fill_out_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)]) | fill_hit_q[fb]) | |fill_err_q[fb * LINE_BEATS+:LINE_BEATS]);
			assign fill_data_hit[fb] = (fill_busy_q[fb] & fill_hit_ic1[fb]) & fill_data_sel[fb];
			assign fill_data_rvd[fb] = ((((((fill_busy_q[fb] & fill_rvd_arb[fb]) & ~fill_hit_q[fb]) & ~fill_hit_ic1[fb]) & ~fill_stale_q[fb]) & ~fill_out_done[fb]) & (fill_rvd_beat[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] == fill_out_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)])) & fill_data_sel[fb];
			assign fill_entry_en[fb] = fill_alloc[fb] | fill_busy_q[fb];
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni) begin
					fill_busy_q[fb] <= 1'b0;
					fill_older_q[fb * NUM_FB+:NUM_FB] <= {NUM_FB {1'sb0}};
					fill_stale_q[fb] <= 1'b0;
					fill_cache_q[fb] <= 1'b0;
					fill_hit_q[fb] <= 1'b0;
					fill_ext_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] <= {(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W) {1'sb0}};
					fill_ext_hold_q[fb] <= 1'b0;
					fill_rvd_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] <= {(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W) {1'sb0}};
					fill_ram_done_q[fb] <= 1'b0;
					fill_out_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] <= {(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W) {1'sb0}};
				end
				else if (fill_entry_en[fb]) begin
					fill_busy_q[fb] <= fill_busy_d[fb];
					fill_older_q[fb * NUM_FB+:NUM_FB] <= fill_older_d[fb * NUM_FB+:NUM_FB];
					fill_stale_q[fb] <= fill_stale_d[fb];
					fill_cache_q[fb] <= fill_cache_d[fb];
					fill_hit_q[fb] <= fill_hit_d[fb];
					fill_ext_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] <= fill_ext_cnt_d[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)];
					fill_ext_hold_q[fb] <= fill_ext_hold_d[fb];
					fill_rvd_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] <= fill_rvd_cnt_d[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)];
					fill_ram_done_q[fb] <= fill_ram_done_d[fb];
					fill_out_cnt_q[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)] <= fill_out_cnt_d[(LINE_BEATS_W >= 0 ? 0 : LINE_BEATS_W) + (fb * (LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W))+:(LINE_BEATS_W >= 0 ? LINE_BEATS_W + 1 : 1 - LINE_BEATS_W)];
				end
			assign fill_addr_en[fb] = fill_alloc[fb];
			assign fill_way_en[fb] = lookup_valid_ic1 & fill_in_ic1[fb];
			always @(posedge clk_i)
				if (fill_addr_en[fb])
					fill_addr_q[fb] <= lookup_addr_ic0;
			always @(posedge clk_i)
				if (fill_way_en[fb])
					fill_way_q[fb] <= sel_way_ic1;
			assign fill_data_d[fb] = (fill_hit_ic1[fb] ? hit_data_ic1[LineSize - 1:0] : {LINE_BEATS {instr_rdata_i}});
			genvar b;
			for (b = 0; b < LINE_BEATS; b = b + 1) begin : gen_data_buf
				assign fill_err_d[(fb * LINE_BEATS) + b] = (((((instr_pmp_err_i & fill_alloc[fb]) & fill_spec_req) & (lookup_addr_ic0[LINE_W - 1:BUS_W] == b[LINE_BEATS_W - 1:0])) | ((instr_pmp_err_i & fill_ext_arb[fb]) & (fill_ext_off[fb * LINE_BEATS_W+:LINE_BEATS_W] == b[LINE_BEATS_W - 1:0]))) | ((fill_rvd_arb[fb] & instr_err_i) & (fill_rvd_off[fb * LINE_BEATS_W+:LINE_BEATS_W] == b[LINE_BEATS_W - 1:0]))) | (fill_busy_q[fb] & fill_err_q[(fb * LINE_BEATS) + b]);
				always @(posedge clk_i or negedge rst_ni)
					if (!rst_ni)
						fill_err_q[(fb * LINE_BEATS) + b] <= 1'b0;
					else if (fill_entry_en[fb])
						fill_err_q[(fb * LINE_BEATS) + b] <= fill_err_d[(fb * LINE_BEATS) + b];
				assign fill_data_en[(fb * LINE_BEATS) + b] = fill_hit_ic1[fb] | ((fill_rvd_arb[fb] & ~fill_hit_q[fb]) & (fill_rvd_off[fb * LINE_BEATS_W+:LINE_BEATS_W] == b[LINE_BEATS_W - 1:0]));
				always @(posedge clk_i)
					if (fill_data_en[(fb * LINE_BEATS) + b])
						fill_data_q[fb][b * BusWidth+:BusWidth] <= fill_data_d[fb][b * BusWidth+:BusWidth];
			end
		end
	endgenerate
	always @(*) begin
		fill_ext_req_addr = {((ADDR_W - 1) >= BUS_W ? ((ADDR_W - 1) - BUS_W) + 1 : (BUS_W - (ADDR_W - 1)) + 1) {1'sb0}};
		begin : sv2v_autoblock_3
			reg signed [31:0] i;
			for (i = 0; i < NUM_FB; i = i + 1)
				if (fill_ext_arb[i])
					fill_ext_req_addr = fill_ext_req_addr | {fill_addr_q[i][ADDR_W - 1:LINE_W], fill_ext_off[i * LINE_BEATS_W+:LINE_BEATS_W]};
		end
	end
	always @(*) begin
		fill_ram_req_addr = {ADDR_W {1'sb0}};
		fill_ram_req_way = {NumWays {1'sb0}};
		fill_ram_req_data = {LineSize {1'sb0}};
		begin : sv2v_autoblock_4
			reg signed [31:0] i;
			for (i = 0; i < NUM_FB; i = i + 1)
				if (fill_ram_arb[i]) begin
					fill_ram_req_addr = fill_ram_req_addr | fill_addr_q[i];
					fill_ram_req_way = fill_ram_req_way | fill_way_q[i];
					fill_ram_req_data = fill_ram_req_data | fill_data_q[i];
				end
		end
	end
	always @(*) begin
		fill_out_data = {LineSize {1'sb0}};
		fill_out_err = {LINE_BEATS {1'sb0}};
		begin : sv2v_autoblock_5
			reg signed [31:0] i;
			for (i = 0; i < NUM_FB; i = i + 1)
				if (fill_data_reg[i]) begin
					fill_out_data = fill_out_data | fill_data_q[i];
					fill_out_err = fill_out_err | (fill_err_q[i * LINE_BEATS+:LINE_BEATS] & ~{LINE_BEATS {fill_hit_q[i]}});
				end
		end
	end
	assign instr_req = ((SpecRequest | branch_i) & lookup_grant_ic0) | |fill_ext_req;
	assign instr_addr = (|fill_ext_req ? fill_ext_req_addr : lookup_addr_ic0[ADDR_W - 1:BUS_W]);
	assign instr_req_o = instr_req;
	assign instr_addr_o = {instr_addr[ADDR_W - 1:BUS_W], {BUS_W {1'b0}}};
	assign line_data = (|fill_data_hit ? hit_data_ic1[LineSize - 1:0] : fill_out_data);
	assign line_err = (|fill_data_hit ? {LINE_BEATS {1'b0}} : fill_out_err);
	always @(*) begin
		line_data_muxed = {32 {1'sb0}};
		line_err_muxed = 1'b0;
		begin : sv2v_autoblock_6
			reg signed [31:0] i;
			for (i = 0; i < LINE_BEATS; i = i + 1)
				if ((output_addr_q[LINE_W - 1:BUS_W] + {{LINE_BEATS_W - 1 {1'b0}}, skid_valid_q}) == i[LINE_BEATS_W - 1:0]) begin
					line_data_muxed = line_data_muxed | line_data[i * 32+:32];
					line_err_muxed = line_err_muxed | line_err[i];
				end
		end
	end
	assign output_data = (|fill_data_rvd ? instr_rdata_i : line_data_muxed);
	assign output_err = (|fill_data_rvd ? instr_err_i : line_err_muxed);
	assign data_valid = |fill_out_arb;
	assign skid_data_d = output_data[31:16];
	assign skid_en = data_valid & (ready_i | skid_ready);
	always @(posedge clk_i)
		if (skid_en) begin
			skid_data_q <= skid_data_d;
			skid_err_q <= output_err;
		end
	assign skid_complete_instr = skid_valid_q & ((skid_data_q[1:0] != 2'b11) | skid_err_q);
	assign skid_ready = (output_addr_q[1] & ~skid_valid_q) & (~output_compressed | output_err);
	assign output_ready = (ready_i | skid_ready) & ~skid_complete_instr;
	assign output_compressed = rdata_o[1:0] != 2'b11;
	assign skid_valid_d = (branch_i ? 1'b0 : (skid_valid_q ? ~(ready_i & ((skid_data_q[1:0] != 2'b11) | skid_err_q)) : ((output_addr_q[1] & (~output_compressed | output_err)) | (((~output_addr_q[1] & output_compressed) & ~output_err) & ready_i)) & data_valid));
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			skid_valid_q <= 1'b0;
		else
			skid_valid_q <= skid_valid_d;
	assign output_valid = skid_complete_instr | (data_valid & (((~output_addr_q[1] | skid_valid_q) | output_err) | (output_data[17:16] != 2'b11)));
	assign output_addr_en = branch_i | (ready_i & valid_o);
	assign addr_incr_two = output_compressed & ~err_o;
	assign output_addr_d = (branch_i ? addr_i[31:1] : output_addr_q[31:1] + {29'd0, ~addr_incr_two, addr_incr_two});
	always @(posedge clk_i)
		if (output_addr_en)
			output_addr_q <= output_addr_d;
	always @(*) begin
		output_data_lo = {16 {1'sb0}};
		begin : sv2v_autoblock_7
			reg signed [31:0] i;
			for (i = 0; i < OUTPUT_BEATS; i = i + 1)
				if (output_addr_q[BUS_W - 1:1] == i[BUS_W - 2:0])
					output_data_lo = output_data_lo | output_data[i * 16+:16];
		end
	end
	always @(*) begin
		output_data_hi = {16 {1'sb0}};
		begin : sv2v_autoblock_8
			reg signed [31:0] i;
			for (i = 0; i < (OUTPUT_BEATS - 1); i = i + 1)
				if (output_addr_q[BUS_W - 1:1] == i[BUS_W - 2:0])
					output_data_hi = output_data_hi | output_data[(i + 1) * 16+:16];
		end
		if (&output_addr_q[BUS_W - 1:1])
			output_data_hi = output_data_hi | output_data[15:0];
	end
	assign valid_o = output_valid;
	assign rdata_o = {output_data_hi, (skid_valid_q ? skid_data_q : output_data_lo)};
	assign addr_o = {output_addr_q, 1'b0};
	assign err_o = (skid_valid_q & skid_err_q) | (~skid_complete_instr & output_err);
	assign err_plus2_o = skid_valid_q & ~skid_err_q;
	assign start_inval = (~reset_inval_q | icache_inval_i) & ~inval_prog_q;
	assign inval_prog_d = start_inval | (inval_prog_q & ~inval_done);
	assign inval_done = &inval_index_q;
	assign inval_index_d = (start_inval ? {INDEX_W {1'sb0}} : inval_index_q + {{INDEX_W - 1 {1'b0}}, 1'b1});
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			inval_prog_q <= 1'b0;
			reset_inval_q <= 1'b0;
		end
		else begin
			inval_prog_q <= inval_prog_d;
			reset_inval_q <= 1'b1;
		end
	always @(posedge clk_i)
		if (inval_prog_d)
			inval_index_q <= inval_index_d;
	assign busy_o = inval_prog_q | |(fill_busy_q & ~fill_rvd_done);
endmodule
module ibex_id_stage (
	clk_i,
	rst_ni,
	ctrl_busy_o,
	illegal_insn_o,
	instr_valid_i,
	instr_rdata_i,
	instr_rdata_alu_i,
	instr_rdata_c_i,
	instr_is_compressed_i,
	instr_bp_taken_i,
	instr_req_o,
	instr_first_cycle_id_o,
	instr_valid_clear_o,
	id_in_ready_o,
	icache_inval_o,
	branch_decision_i,
	pc_set_o,
	pc_set_spec_o,
	pc_mux_o,
	nt_branch_mispredict_o,
	exc_pc_mux_o,
	exc_cause_o,
	illegal_c_insn_i,
	instr_fetch_err_i,
	instr_fetch_err_plus2_i,
	pc_id_i,
	ex_valid_i,
	lsu_resp_valid_i,
	alu_operator_ex_o,
	alu_operand_a_ex_o,
	alu_operand_b_ex_o,
	imd_val_we_ex_i,
	imd_val_d_ex_i,
	imd_val_q_ex_o,
	bt_a_operand_o,
	bt_b_operand_o,
	mult_en_ex_o,
	div_en_ex_o,
	mult_sel_ex_o,
	div_sel_ex_o,
	multdiv_operator_ex_o,
	multdiv_signed_mode_ex_o,
	multdiv_operand_a_ex_o,
	multdiv_operand_b_ex_o,
	multdiv_ready_id_o,
	csr_access_o,
	csr_op_o,
	csr_op_en_o,
	csr_save_if_o,
	csr_save_id_o,
	csr_save_wb_o,
	csr_restore_mret_id_o,
	csr_restore_dret_id_o,
	csr_save_cause_o,
	csr_mtval_o,
	priv_mode_i,
	csr_mstatus_tw_i,
	illegal_csr_insn_i,
	data_ind_timing_i,
	lsu_req_o,
	lsu_we_o,
	lsu_type_o,
	lsu_sign_ext_o,
	lsu_wdata_o,
	lsu_req_done_i,
	lsu_addr_incr_req_i,
	lsu_addr_last_i,
	csr_mstatus_mie_i,
	irq_pending_i,
	irqs_i,
	irq_nm_i,
	nmi_mode_o,
	lsu_load_err_i,
	lsu_store_err_i,
	debug_mode_o,
	debug_cause_o,
	debug_csr_save_o,
	debug_req_i,
	debug_single_step_i,
	debug_ebreakm_i,
	debug_ebreaku_i,
	trigger_match_i,
	result_ex_i,
	csr_rdata_i,
	rf_raddr_a_o,
	rf_rdata_a_i,
	rf_raddr_b_o,
	rf_rdata_b_i,
	rf_ren_a_o,
	rf_ren_b_o,
	rf_waddr_id_o,
	rf_wdata_id_o,
	rf_we_id_o,
	rf_rd_a_wb_match_o,
	rf_rd_b_wb_match_o,
	rf_waddr_wb_i,
	rf_wdata_fwd_wb_i,
	rf_write_wb_i,
	en_wb_o,
	instr_type_wb_o,
	instr_perf_count_id_o,
	ready_wb_i,
	outstanding_load_wb_i,
	outstanding_store_wb_i,
	perf_jump_o,
	perf_branch_o,
	perf_tbranch_o,
	perf_dside_wait_o,
	perf_mul_wait_o,
	perf_div_wait_o,
	instr_id_done_o
);
	parameter [0:0] RV32E = 0;
	localparam integer ibex_pkg_RV32MFast = 2;
	parameter integer RV32M = ibex_pkg_RV32MFast;
	localparam integer ibex_pkg_RV32BNone = 0;
	parameter integer RV32B = ibex_pkg_RV32BNone;
	parameter [0:0] DataIndTiming = 1'b0;
	parameter [0:0] BranchTargetALU = 0;
	parameter [0:0] SpecBranch = 0;
	parameter [0:0] WritebackStage = 0;
	parameter [0:0] BranchPredictor = 0;
	input wire clk_i;
	input wire rst_ni;
	output wire ctrl_busy_o;
	output wire illegal_insn_o;
	input wire instr_valid_i;
	input wire [31:0] instr_rdata_i;
	input wire [31:0] instr_rdata_alu_i;
	input wire [15:0] instr_rdata_c_i;
	input wire instr_is_compressed_i;
	input wire instr_bp_taken_i;
	output wire instr_req_o;
	output wire instr_first_cycle_id_o;
	output wire instr_valid_clear_o;
	output wire id_in_ready_o;
	output wire icache_inval_o;
	input wire branch_decision_i;
	output wire pc_set_o;
	output wire pc_set_spec_o;
	output wire [2:0] pc_mux_o;
	output wire nt_branch_mispredict_o;
	output wire [1:0] exc_pc_mux_o;
	output wire [5:0] exc_cause_o;
	input wire illegal_c_insn_i;
	input wire instr_fetch_err_i;
	input wire instr_fetch_err_plus2_i;
	input wire [31:0] pc_id_i;
	input wire ex_valid_i;
	input wire lsu_resp_valid_i;
	output wire [5:0] alu_operator_ex_o;
	output wire [31:0] alu_operand_a_ex_o;
	output wire [31:0] alu_operand_b_ex_o;
	input wire [1:0] imd_val_we_ex_i;
	input wire [67:0] imd_val_d_ex_i;
	output wire [67:0] imd_val_q_ex_o;
	output reg [31:0] bt_a_operand_o;
	output reg [31:0] bt_b_operand_o;
	output wire mult_en_ex_o;
	output wire div_en_ex_o;
	output wire mult_sel_ex_o;
	output wire div_sel_ex_o;
	output wire [1:0] multdiv_operator_ex_o;
	output wire [1:0] multdiv_signed_mode_ex_o;
	output wire [31:0] multdiv_operand_a_ex_o;
	output wire [31:0] multdiv_operand_b_ex_o;
	output wire multdiv_ready_id_o;
	output wire csr_access_o;
	output wire [1:0] csr_op_o;
	output wire csr_op_en_o;
	output wire csr_save_if_o;
	output wire csr_save_id_o;
	output wire csr_save_wb_o;
	output wire csr_restore_mret_id_o;
	output wire csr_restore_dret_id_o;
	output wire csr_save_cause_o;
	output wire [31:0] csr_mtval_o;
	input wire [1:0] priv_mode_i;
	input wire csr_mstatus_tw_i;
	input wire illegal_csr_insn_i;
	input wire data_ind_timing_i;
	output wire lsu_req_o;
	output wire lsu_we_o;
	output wire [1:0] lsu_type_o;
	output wire lsu_sign_ext_o;
	output wire [31:0] lsu_wdata_o;
	input wire lsu_req_done_i;
	input wire lsu_addr_incr_req_i;
	input wire [31:0] lsu_addr_last_i;
	input wire csr_mstatus_mie_i;
	input wire irq_pending_i;
	input wire [17:0] irqs_i;
	input wire irq_nm_i;
	output wire nmi_mode_o;
	input wire lsu_load_err_i;
	input wire lsu_store_err_i;
	output wire debug_mode_o;
	output wire [2:0] debug_cause_o;
	output wire debug_csr_save_o;
	input wire debug_req_i;
	input wire debug_single_step_i;
	input wire debug_ebreakm_i;
	input wire debug_ebreaku_i;
	input wire trigger_match_i;
	input wire [31:0] result_ex_i;
	input wire [31:0] csr_rdata_i;
	output wire [4:0] rf_raddr_a_o;
	input wire [31:0] rf_rdata_a_i;
	output wire [4:0] rf_raddr_b_o;
	input wire [31:0] rf_rdata_b_i;
	output wire rf_ren_a_o;
	output wire rf_ren_b_o;
	output wire [4:0] rf_waddr_id_o;
	output reg [31:0] rf_wdata_id_o;
	output wire rf_we_id_o;
	output wire rf_rd_a_wb_match_o;
	output wire rf_rd_b_wb_match_o;
	input wire [4:0] rf_waddr_wb_i;
	input wire [31:0] rf_wdata_fwd_wb_i;
	input wire rf_write_wb_i;
	output wire en_wb_o;
	output wire [1:0] instr_type_wb_o;
	output wire instr_perf_count_id_o;
	input wire ready_wb_i;
	input wire outstanding_load_wb_i;
	input wire outstanding_store_wb_i;
	output wire perf_jump_o;
	output reg perf_branch_o;
	output wire perf_tbranch_o;
	output wire perf_dside_wait_o;
	output wire perf_mul_wait_o;
	output wire perf_div_wait_o;
	output wire instr_id_done_o;
	wire illegal_insn_dec;
	wire ebrk_insn;
	wire mret_insn_dec;
	wire dret_insn_dec;
	wire ecall_insn_dec;
	wire wfi_insn_dec;
	wire wb_exception;
	wire branch_in_dec;
	reg branch_spec;
	wire branch_set_spec;
	wire branch_set;
	reg branch_set_d;
	reg branch_not_set;
	wire branch_taken;
	wire jump_in_dec;
	wire jump_set_dec;
	reg jump_set;
	wire instr_first_cycle;
	wire instr_executing;
	wire instr_done;
	wire controller_run;
	wire stall_ld_hz;
	wire stall_mem;
	reg stall_multdiv;
	reg stall_branch;
	reg stall_jump;
	wire stall_id;
	wire stall_wb;
	wire flush_id;
	wire multicycle_done;
	wire [31:0] imm_i_type;
	wire [31:0] imm_s_type;
	wire [31:0] imm_b_type;
	wire [31:0] imm_u_type;
	wire [31:0] imm_j_type;
	wire [31:0] zimm_rs1_type;
	wire [31:0] imm_a;
	reg [31:0] imm_b;
	wire rf_wdata_sel;
	wire rf_we_dec;
	reg rf_we_raw;
	wire rf_ren_a;
	wire rf_ren_b;
	assign rf_ren_a_o = rf_ren_a;
	assign rf_ren_b_o = rf_ren_b;
	wire [31:0] rf_rdata_a_fwd;
	wire [31:0] rf_rdata_b_fwd;
	wire [5:0] alu_operator;
	wire [1:0] alu_op_a_mux_sel;
	wire [1:0] alu_op_a_mux_sel_dec;
	wire alu_op_b_mux_sel;
	wire alu_op_b_mux_sel_dec;
	wire alu_multicycle_dec;
	reg stall_alu;
	reg [67:0] imd_val_q;
	wire [1:0] bt_a_mux_sel;
	wire [2:0] bt_b_mux_sel;
	wire imm_a_mux_sel;
	wire [2:0] imm_b_mux_sel;
	wire [2:0] imm_b_mux_sel_dec;
	wire mult_en_id;
	wire mult_en_dec;
	wire div_en_id;
	wire div_en_dec;
	wire multdiv_en_dec;
	wire [1:0] multdiv_operator;
	wire [1:0] multdiv_signed_mode;
	wire lsu_we;
	wire [1:0] lsu_type;
	wire lsu_sign_ext;
	wire lsu_req;
	wire lsu_req_dec;
	wire data_req_allowed;
	reg csr_pipe_flush;
	reg [31:0] alu_operand_a;
	wire [31:0] alu_operand_b;
	localparam [1:0] ibex_pkg_OP_A_FWD = 1;
	assign alu_op_a_mux_sel = (lsu_addr_incr_req_i ? ibex_pkg_OP_A_FWD : alu_op_a_mux_sel_dec);
	localparam [0:0] ibex_pkg_OP_B_IMM = 1;
	assign alu_op_b_mux_sel = (lsu_addr_incr_req_i ? ibex_pkg_OP_B_IMM : alu_op_b_mux_sel_dec);
	localparam [2:0] ibex_pkg_IMM_B_INCR_ADDR = 6;
	assign imm_b_mux_sel = (lsu_addr_incr_req_i ? ibex_pkg_IMM_B_INCR_ADDR : imm_b_mux_sel_dec);
	localparam [0:0] ibex_pkg_IMM_A_Z = 0;
	assign imm_a = (imm_a_mux_sel == ibex_pkg_IMM_A_Z ? zimm_rs1_type : {32 {1'sb0}});
	localparam [1:0] ibex_pkg_OP_A_CURRPC = 2;
	localparam [1:0] ibex_pkg_OP_A_IMM = 3;
	localparam [1:0] ibex_pkg_OP_A_REG_A = 0;
	always @(*) begin : alu_operand_a_mux
		case (alu_op_a_mux_sel)
			ibex_pkg_OP_A_REG_A: alu_operand_a = rf_rdata_a_fwd;
			ibex_pkg_OP_A_FWD: alu_operand_a = lsu_addr_last_i;
			ibex_pkg_OP_A_CURRPC: alu_operand_a = pc_id_i;
			ibex_pkg_OP_A_IMM: alu_operand_a = imm_a;
			default: alu_operand_a = pc_id_i;
		endcase
	end
	localparam [2:0] ibex_pkg_IMM_B_B = 2;
	localparam [2:0] ibex_pkg_IMM_B_I = 0;
	localparam [2:0] ibex_pkg_IMM_B_INCR_PC = 5;
	localparam [2:0] ibex_pkg_IMM_B_J = 4;
	localparam [2:0] ibex_pkg_IMM_B_S = 1;
	localparam [2:0] ibex_pkg_IMM_B_U = 3;
	generate
		if (BranchTargetALU) begin : g_btalu_muxes
			always @(*) begin : bt_operand_a_mux
				case (bt_a_mux_sel)
					ibex_pkg_OP_A_REG_A: bt_a_operand_o = rf_rdata_a_fwd;
					ibex_pkg_OP_A_CURRPC: bt_a_operand_o = pc_id_i;
					default: bt_a_operand_o = pc_id_i;
				endcase
			end
			always @(*) begin : bt_immediate_b_mux
				case (bt_b_mux_sel)
					ibex_pkg_IMM_B_I: bt_b_operand_o = imm_i_type;
					ibex_pkg_IMM_B_B: bt_b_operand_o = imm_b_type;
					ibex_pkg_IMM_B_J: bt_b_operand_o = imm_j_type;
					ibex_pkg_IMM_B_INCR_PC: bt_b_operand_o = (instr_is_compressed_i ? 32'h00000002 : 32'h00000004);
					default: bt_b_operand_o = (instr_is_compressed_i ? 32'h00000002 : 32'h00000004);
				endcase
			end
			always @(*) begin : immediate_b_mux
				case (imm_b_mux_sel)
					ibex_pkg_IMM_B_I: imm_b = imm_i_type;
					ibex_pkg_IMM_B_S: imm_b = imm_s_type;
					ibex_pkg_IMM_B_U: imm_b = imm_u_type;
					ibex_pkg_IMM_B_INCR_PC: imm_b = (instr_is_compressed_i ? 32'h00000002 : 32'h00000004);
					ibex_pkg_IMM_B_INCR_ADDR: imm_b = 32'h00000004;
					default: imm_b = 32'h00000004;
				endcase
			end
		end
		else begin : g_nobtalu
			wire [1:0] unused_a_mux_sel;
			wire [2:0] unused_b_mux_sel;
			assign unused_a_mux_sel = bt_a_mux_sel;
			assign unused_b_mux_sel = bt_b_mux_sel;
			wire [32:1] sv2v_tmp_456A8;
			assign sv2v_tmp_456A8 = {32 {1'sb0}};
			always @(*) bt_a_operand_o = sv2v_tmp_456A8;
			wire [32:1] sv2v_tmp_EDBFD;
			assign sv2v_tmp_EDBFD = {32 {1'sb0}};
			always @(*) bt_b_operand_o = sv2v_tmp_EDBFD;
			always @(*) begin : immediate_b_mux
				case (imm_b_mux_sel)
					ibex_pkg_IMM_B_I: imm_b = imm_i_type;
					ibex_pkg_IMM_B_S: imm_b = imm_s_type;
					ibex_pkg_IMM_B_B: imm_b = imm_b_type;
					ibex_pkg_IMM_B_U: imm_b = imm_u_type;
					ibex_pkg_IMM_B_J: imm_b = imm_j_type;
					ibex_pkg_IMM_B_INCR_PC: imm_b = (instr_is_compressed_i ? 32'h00000002 : 32'h00000004);
					ibex_pkg_IMM_B_INCR_ADDR: imm_b = 32'h00000004;
					default: imm_b = 32'h00000004;
				endcase
			end
		end
	endgenerate
	assign alu_operand_b = (alu_op_b_mux_sel == ibex_pkg_OP_B_IMM ? imm_b : rf_rdata_b_fwd);
	generate
		genvar i;
		for (i = 0; i < 2; i = i + 1) begin : gen_intermediate_val_reg
			always @(posedge clk_i or negedge rst_ni) begin : intermediate_val_reg
				if (!rst_ni)
					imd_val_q[(1 - i) * 34+:34] <= {34 {1'sb0}};
				else if (imd_val_we_ex_i[i])
					imd_val_q[(1 - i) * 34+:34] <= imd_val_d_ex_i[(1 - i) * 34+:34];
			end
		end
	endgenerate
	assign imd_val_q_ex_o = imd_val_q;
	assign rf_we_id_o = (rf_we_raw & instr_executing) & ~illegal_csr_insn_i;
	localparam [0:0] ibex_pkg_RF_WD_CSR = 1;
	localparam [0:0] ibex_pkg_RF_WD_EX = 0;
	always @(*) begin : rf_wdata_id_mux
		case (rf_wdata_sel)
			ibex_pkg_RF_WD_EX: rf_wdata_id_o = result_ex_i;
			ibex_pkg_RF_WD_CSR: rf_wdata_id_o = csr_rdata_i;
			default: rf_wdata_id_o = result_ex_i;
		endcase
	end
	ibex_decoder #(
		.RV32E(RV32E),
		.RV32M(RV32M),
		.RV32B(RV32B),
		.BranchTargetALU(BranchTargetALU)
	) decoder_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.illegal_insn_o(illegal_insn_dec),
		.ebrk_insn_o(ebrk_insn),
		.mret_insn_o(mret_insn_dec),
		.dret_insn_o(dret_insn_dec),
		.ecall_insn_o(ecall_insn_dec),
		.wfi_insn_o(wfi_insn_dec),
		.jump_set_o(jump_set_dec),
		.branch_taken_i(branch_taken),
		.icache_inval_o(icache_inval_o),
		.instr_first_cycle_i(instr_first_cycle),
		.instr_rdata_i(instr_rdata_i),
		.instr_rdata_alu_i(instr_rdata_alu_i),
		.illegal_c_insn_i(illegal_c_insn_i),
		.imm_a_mux_sel_o(imm_a_mux_sel),
		.imm_b_mux_sel_o(imm_b_mux_sel_dec),
		.bt_a_mux_sel_o(bt_a_mux_sel),
		.bt_b_mux_sel_o(bt_b_mux_sel),
		.imm_i_type_o(imm_i_type),
		.imm_s_type_o(imm_s_type),
		.imm_b_type_o(imm_b_type),
		.imm_u_type_o(imm_u_type),
		.imm_j_type_o(imm_j_type),
		.zimm_rs1_type_o(zimm_rs1_type),
		.rf_wdata_sel_o(rf_wdata_sel),
		.rf_we_o(rf_we_dec),
		.rf_raddr_a_o(rf_raddr_a_o),
		.rf_raddr_b_o(rf_raddr_b_o),
		.rf_waddr_o(rf_waddr_id_o),
		.rf_ren_a_o(rf_ren_a),
		.rf_ren_b_o(rf_ren_b),
		.alu_operator_o(alu_operator),
		.alu_op_a_mux_sel_o(alu_op_a_mux_sel_dec),
		.alu_op_b_mux_sel_o(alu_op_b_mux_sel_dec),
		.alu_multicycle_o(alu_multicycle_dec),
		.mult_en_o(mult_en_dec),
		.div_en_o(div_en_dec),
		.mult_sel_o(mult_sel_ex_o),
		.div_sel_o(div_sel_ex_o),
		.multdiv_operator_o(multdiv_operator),
		.multdiv_signed_mode_o(multdiv_signed_mode),
		.csr_access_o(csr_access_o),
		.csr_op_o(csr_op_o),
		.data_req_o(lsu_req_dec),
		.data_we_o(lsu_we),
		.data_type_o(lsu_type),
		.data_sign_extension_o(lsu_sign_ext),
		.jump_in_dec_o(jump_in_dec),
		.branch_in_dec_o(branch_in_dec)
	);
	localparam [11:0] ibex_pkg_CSR_DCSR = 12'h7b0;
	localparam [11:0] ibex_pkg_CSR_DPC = 12'h7b1;
	localparam [11:0] ibex_pkg_CSR_DSCRATCH0 = 12'h7b2;
	localparam [11:0] ibex_pkg_CSR_DSCRATCH1 = 12'h7b3;
	localparam [11:0] ibex_pkg_CSR_MIE = 12'h304;
	localparam [11:0] ibex_pkg_CSR_MSTATUS = 12'h300;
	localparam [1:0] ibex_pkg_CSR_OP_READ = 0;
	localparam [1:0] ibex_pkg_CSR_OP_SET = 2;
	localparam [1:0] ibex_pkg_CSR_OP_WRITE = 1;
	always @(*) begin : csr_pipeline_flushes
		csr_pipe_flush = 1'b0;
		if ((csr_op_en_o == 1'b1) && ((csr_op_o == ibex_pkg_CSR_OP_WRITE) || (csr_op_o == ibex_pkg_CSR_OP_SET))) begin
			if ((instr_rdata_i[31:20] == ibex_pkg_CSR_MSTATUS) || (instr_rdata_i[31:20] == ibex_pkg_CSR_MIE))
				csr_pipe_flush = 1'b1;
		end
		else if ((csr_op_en_o == 1'b1) && (csr_op_o != ibex_pkg_CSR_OP_READ))
			if ((((instr_rdata_i[31:20] == ibex_pkg_CSR_DCSR) || (instr_rdata_i[31:20] == ibex_pkg_CSR_DPC)) || (instr_rdata_i[31:20] == ibex_pkg_CSR_DSCRATCH0)) || (instr_rdata_i[31:20] == ibex_pkg_CSR_DSCRATCH1))
				csr_pipe_flush = 1'b1;
	end
	assign illegal_insn_o = instr_valid_i & (illegal_insn_dec | illegal_csr_insn_i);
	ibex_controller #(
		.WritebackStage(WritebackStage),
		.BranchPredictor(BranchPredictor)
	) controller_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.ctrl_busy_o(ctrl_busy_o),
		.illegal_insn_i(illegal_insn_o),
		.ecall_insn_i(ecall_insn_dec),
		.mret_insn_i(mret_insn_dec),
		.dret_insn_i(dret_insn_dec),
		.wfi_insn_i(wfi_insn_dec),
		.ebrk_insn_i(ebrk_insn),
		.csr_pipe_flush_i(csr_pipe_flush),
		.instr_valid_i(instr_valid_i),
		.instr_i(instr_rdata_i),
		.instr_compressed_i(instr_rdata_c_i),
		.instr_is_compressed_i(instr_is_compressed_i),
		.instr_bp_taken_i(instr_bp_taken_i),
		.instr_fetch_err_i(instr_fetch_err_i),
		.instr_fetch_err_plus2_i(instr_fetch_err_plus2_i),
		.pc_id_i(pc_id_i),
		.instr_valid_clear_o(instr_valid_clear_o),
		.id_in_ready_o(id_in_ready_o),
		.controller_run_o(controller_run),
		.instr_req_o(instr_req_o),
		.pc_set_o(pc_set_o),
		.pc_set_spec_o(pc_set_spec_o),
		.pc_mux_o(pc_mux_o),
		.nt_branch_mispredict_o(nt_branch_mispredict_o),
		.exc_pc_mux_o(exc_pc_mux_o),
		.exc_cause_o(exc_cause_o),
		.lsu_addr_last_i(lsu_addr_last_i),
		.load_err_i(lsu_load_err_i),
		.store_err_i(lsu_store_err_i),
		.wb_exception_o(wb_exception),
		.branch_set_i(branch_set),
		.branch_set_spec_i(branch_set_spec),
		.branch_not_set_i(branch_not_set),
		.jump_set_i(jump_set),
		.csr_mstatus_mie_i(csr_mstatus_mie_i),
		.irq_pending_i(irq_pending_i),
		.irqs_i(irqs_i),
		.irq_nm_i(irq_nm_i),
		.nmi_mode_o(nmi_mode_o),
		.csr_save_if_o(csr_save_if_o),
		.csr_save_id_o(csr_save_id_o),
		.csr_save_wb_o(csr_save_wb_o),
		.csr_restore_mret_id_o(csr_restore_mret_id_o),
		.csr_restore_dret_id_o(csr_restore_dret_id_o),
		.csr_save_cause_o(csr_save_cause_o),
		.csr_mtval_o(csr_mtval_o),
		.priv_mode_i(priv_mode_i),
		.csr_mstatus_tw_i(csr_mstatus_tw_i),
		.debug_mode_o(debug_mode_o),
		.debug_cause_o(debug_cause_o),
		.debug_csr_save_o(debug_csr_save_o),
		.debug_req_i(debug_req_i),
		.debug_single_step_i(debug_single_step_i),
		.debug_ebreakm_i(debug_ebreakm_i),
		.debug_ebreaku_i(debug_ebreaku_i),
		.trigger_match_i(trigger_match_i),
		.stall_id_i(stall_id),
		.stall_wb_i(stall_wb),
		.flush_id_o(flush_id),
		.ready_wb_i(ready_wb_i),
		.perf_jump_o(perf_jump_o),
		.perf_tbranch_o(perf_tbranch_o)
	);
	assign multdiv_en_dec = mult_en_dec | div_en_dec;
	assign lsu_req = (instr_executing ? data_req_allowed & lsu_req_dec : 1'b0);
	assign mult_en_id = (instr_executing ? mult_en_dec : 1'b0);
	assign div_en_id = (instr_executing ? div_en_dec : 1'b0);
	assign lsu_req_o = lsu_req;
	assign lsu_we_o = lsu_we;
	assign lsu_type_o = lsu_type;
	assign lsu_sign_ext_o = lsu_sign_ext;
	assign lsu_wdata_o = rf_rdata_b_fwd;
	assign csr_op_en_o = (csr_access_o & instr_executing) & instr_id_done_o;
	assign alu_operator_ex_o = alu_operator;
	assign alu_operand_a_ex_o = alu_operand_a;
	assign alu_operand_b_ex_o = alu_operand_b;
	assign mult_en_ex_o = mult_en_id;
	assign div_en_ex_o = div_en_id;
	assign multdiv_operator_ex_o = multdiv_operator;
	assign multdiv_signed_mode_ex_o = multdiv_signed_mode;
	assign multdiv_operand_a_ex_o = rf_rdata_a_fwd;
	assign multdiv_operand_b_ex_o = rf_rdata_b_fwd;
	generate
		if (BranchTargetALU && !DataIndTiming) begin : g_branch_set_direct
			assign branch_set = branch_set_d;
			assign branch_set_spec = branch_spec;
		end
		else begin : g_branch_set_flop
			reg branch_set_q;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					branch_set_q <= 1'b0;
				else
					branch_set_q <= branch_set_d;
			assign branch_set = (BranchTargetALU && !data_ind_timing_i ? branch_set_d : branch_set_q);
			assign branch_set_spec = (BranchTargetALU && !data_ind_timing_i ? branch_spec : branch_set_q);
		end
	endgenerate
	generate
		if (DataIndTiming) begin : g_sec_branch_taken
			reg branch_taken_q;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					branch_taken_q <= 1'b0;
				else
					branch_taken_q <= branch_decision_i;
			assign branch_taken = ~data_ind_timing_i | branch_taken_q;
		end
		else begin : g_nosec_branch_taken
			assign branch_taken = 1'b1;
		end
	endgenerate
	reg id_fsm_q;
	reg id_fsm_d;
	localparam [0:0] FIRST_CYCLE = 0;
	always @(posedge clk_i or negedge rst_ni) begin : id_pipeline_reg
		if (!rst_ni)
			id_fsm_q <= FIRST_CYCLE;
		else
			id_fsm_q <= id_fsm_d;
	end
	localparam [0:0] MULTI_CYCLE = 1;
	always @(*) begin
		id_fsm_d = id_fsm_q;
		rf_we_raw = rf_we_dec;
		stall_multdiv = 1'b0;
		stall_jump = 1'b0;
		stall_branch = 1'b0;
		stall_alu = 1'b0;
		branch_set_d = 1'b0;
		branch_spec = 1'b0;
		branch_not_set = 1'b0;
		jump_set = 1'b0;
		perf_branch_o = 1'b0;
		if (instr_executing)
			case (id_fsm_q)
				FIRST_CYCLE:
					case (1'b1)
						lsu_req_dec:
							if (!WritebackStage)
								id_fsm_d = MULTI_CYCLE;
							else if (~lsu_req_done_i)
								id_fsm_d = MULTI_CYCLE;
						multdiv_en_dec:
							if (~ex_valid_i) begin
								id_fsm_d = MULTI_CYCLE;
								rf_we_raw = 1'b0;
								stall_multdiv = 1'b1;
							end
						branch_in_dec: begin
							id_fsm_d = (data_ind_timing_i || (!BranchTargetALU && branch_decision_i) ? MULTI_CYCLE : FIRST_CYCLE);
							stall_branch = (~BranchTargetALU & branch_decision_i) | data_ind_timing_i;
							branch_set_d = branch_decision_i | data_ind_timing_i;
							if (BranchPredictor)
								branch_not_set = ~branch_decision_i;
							branch_spec = (SpecBranch ? 1'b1 : branch_decision_i);
							perf_branch_o = 1'b1;
						end
						jump_in_dec: begin
							id_fsm_d = (BranchTargetALU ? FIRST_CYCLE : MULTI_CYCLE);
							stall_jump = ~BranchTargetALU;
							jump_set = jump_set_dec;
						end
						alu_multicycle_dec: begin
							stall_alu = 1'b1;
							id_fsm_d = MULTI_CYCLE;
							rf_we_raw = 1'b0;
						end
						default: id_fsm_d = FIRST_CYCLE;
					endcase
				MULTI_CYCLE: begin
					if (multdiv_en_dec)
						rf_we_raw = rf_we_dec & ex_valid_i;
					if (multicycle_done & ready_wb_i)
						id_fsm_d = FIRST_CYCLE;
					else begin
						stall_multdiv = multdiv_en_dec;
						stall_branch = branch_in_dec;
						stall_jump = jump_in_dec;
					end
				end
				default: id_fsm_d = FIRST_CYCLE;
			endcase
	end
	assign multdiv_ready_id_o = ready_wb_i;
	assign stall_id = ((((stall_ld_hz | stall_mem) | stall_multdiv) | stall_jump) | stall_branch) | stall_alu;
	assign instr_done = (~stall_id & ~flush_id) & instr_executing;
	assign instr_first_cycle = instr_valid_i & (id_fsm_q == FIRST_CYCLE);
	assign instr_first_cycle_id_o = instr_first_cycle;
	localparam [1:0] ibex_pkg_WB_INSTR_LOAD = 0;
	localparam [1:0] ibex_pkg_WB_INSTR_OTHER = 2;
	localparam [1:0] ibex_pkg_WB_INSTR_STORE = 1;
	generate
		if (WritebackStage) begin : gen_stall_mem
			wire rf_rd_a_wb_match;
			wire rf_rd_b_wb_match;
			wire rf_rd_a_hz;
			wire rf_rd_b_hz;
			wire outstanding_memory_access;
			wire instr_kill;
			assign multicycle_done = (lsu_req_dec ? ~stall_mem : ex_valid_i);
			assign outstanding_memory_access = (outstanding_load_wb_i | outstanding_store_wb_i) & ~lsu_resp_valid_i;
			assign data_req_allowed = ~outstanding_memory_access;
			assign instr_kill = (instr_fetch_err_i | wb_exception) | ~controller_run;
			assign instr_executing = ((instr_valid_i & ~instr_kill) & ~stall_ld_hz) & ~outstanding_memory_access;
			assign stall_mem = instr_valid_i & (outstanding_memory_access | (lsu_req_dec & ~lsu_req_done_i));
			assign rf_rd_a_wb_match = (rf_waddr_wb_i == rf_raddr_a_o) & |rf_raddr_a_o;
			assign rf_rd_b_wb_match = (rf_waddr_wb_i == rf_raddr_b_o) & |rf_raddr_b_o;
			assign rf_rd_a_wb_match_o = rf_rd_a_wb_match;
			assign rf_rd_b_wb_match_o = rf_rd_b_wb_match;
			assign rf_rd_a_hz = rf_rd_a_wb_match & rf_ren_a;
			assign rf_rd_b_hz = rf_rd_b_wb_match & rf_ren_b;
			assign rf_rdata_a_fwd = (rf_rd_a_wb_match & rf_write_wb_i ? rf_wdata_fwd_wb_i : rf_rdata_a_i);
			assign rf_rdata_b_fwd = (rf_rd_b_wb_match & rf_write_wb_i ? rf_wdata_fwd_wb_i : rf_rdata_b_i);
			assign stall_ld_hz = outstanding_load_wb_i & (rf_rd_a_hz | rf_rd_b_hz);
			assign instr_type_wb_o = (~lsu_req_dec ? ibex_pkg_WB_INSTR_OTHER : (lsu_we ? ibex_pkg_WB_INSTR_STORE : ibex_pkg_WB_INSTR_LOAD));
			assign instr_id_done_o = en_wb_o & ready_wb_i;
			assign stall_wb = en_wb_o & ~ready_wb_i;
			assign perf_dside_wait_o = (instr_valid_i & ~instr_kill) & (outstanding_memory_access | stall_ld_hz);
		end
		else begin : gen_no_stall_mem
			assign multicycle_done = (lsu_req_dec ? lsu_resp_valid_i : ex_valid_i);
			assign data_req_allowed = instr_first_cycle;
			assign stall_mem = instr_valid_i & (lsu_req_dec & (~lsu_resp_valid_i | instr_first_cycle));
			assign stall_ld_hz = 1'b0;
			assign instr_executing = (instr_valid_i & ~instr_fetch_err_i) & controller_run;
			assign rf_rdata_a_fwd = rf_rdata_a_i;
			assign rf_rdata_b_fwd = rf_rdata_b_i;
			assign rf_rd_a_wb_match_o = 1'b0;
			assign rf_rd_b_wb_match_o = 1'b0;
			wire unused_data_req_done_ex;
			wire [4:0] unused_rf_waddr_wb;
			wire unused_rf_write_wb;
			wire unused_outstanding_load_wb;
			wire unused_outstanding_store_wb;
			wire unused_wb_exception;
			wire [31:0] unused_rf_wdata_fwd_wb;
			assign unused_data_req_done_ex = lsu_req_done_i;
			assign unused_rf_waddr_wb = rf_waddr_wb_i;
			assign unused_rf_write_wb = rf_write_wb_i;
			assign unused_outstanding_load_wb = outstanding_load_wb_i;
			assign unused_outstanding_store_wb = outstanding_store_wb_i;
			assign unused_wb_exception = wb_exception;
			assign unused_rf_wdata_fwd_wb = rf_wdata_fwd_wb_i;
			assign instr_type_wb_o = ibex_pkg_WB_INSTR_OTHER;
			assign stall_wb = 1'b0;
			assign perf_dside_wait_o = (instr_executing & lsu_req_dec) & ~lsu_resp_valid_i;
			assign instr_id_done_o = instr_done;
		end
	endgenerate
	assign instr_perf_count_id_o = (((~ebrk_insn & ~ecall_insn_dec) & ~illegal_insn_dec) & ~illegal_csr_insn_i) & ~instr_fetch_err_i;
	assign en_wb_o = instr_done;
	assign perf_mul_wait_o = stall_multdiv & mult_en_dec;
	assign perf_div_wait_o = stall_multdiv & div_en_dec;
endmodule
module ibex_if_stage (
	clk_i,
	rst_ni,
	boot_addr_i,
	req_i,
	instr_req_o,
	instr_addr_o,
	instr_gnt_i,
	instr_rvalid_i,
	instr_rdata_i,
	instr_err_i,
	instr_pmp_err_i,
	instr_valid_id_o,
	instr_new_id_o,
	instr_rdata_id_o,
	instr_rdata_alu_id_o,
	instr_rdata_c_id_o,
	instr_is_compressed_id_o,
	instr_bp_taken_o,
	instr_fetch_err_o,
	instr_fetch_err_plus2_o,
	illegal_c_insn_id_o,
	dummy_instr_id_o,
	pc_if_o,
	pc_id_o,
	instr_valid_clear_i,
	pc_set_i,
	pc_set_spec_i,
	pc_mux_i,
	nt_branch_mispredict_i,
	exc_pc_mux_i,
	exc_cause,
	dummy_instr_en_i,
	dummy_instr_mask_i,
	dummy_instr_seed_en_i,
	dummy_instr_seed_i,
	icache_enable_i,
	icache_inval_i,
	branch_target_ex_i,
	csr_mepc_i,
	csr_depc_i,
	csr_mtvec_i,
	csr_mtvec_init_o,
	id_in_ready_i,
	pc_mismatch_alert_o,
	if_busy_o
);
	parameter [31:0] DmHaltAddr = 32'h1a110800;
	parameter [31:0] DmExceptionAddr = 32'h1a110808;
	parameter [0:0] DummyInstructions = 1'b0;
	parameter [0:0] ICache = 1'b0;
	parameter [0:0] ICacheECC = 1'b0;
	parameter [0:0] PCIncrCheck = 1'b0;
	parameter [0:0] BranchPredictor = 1'b0;
	input wire clk_i;
	input wire rst_ni;
	input wire [31:0] boot_addr_i;
	input wire req_i;
	output wire instr_req_o;
	output wire [31:0] instr_addr_o;
	input wire instr_gnt_i;
	input wire instr_rvalid_i;
	input wire [31:0] instr_rdata_i;
	input wire instr_err_i;
	input wire instr_pmp_err_i;
	output wire instr_valid_id_o;
	output wire instr_new_id_o;
	output reg [31:0] instr_rdata_id_o;
	output reg [31:0] instr_rdata_alu_id_o;
	output reg [15:0] instr_rdata_c_id_o;
	output reg instr_is_compressed_id_o;
	output wire instr_bp_taken_o;
	output reg instr_fetch_err_o;
	output reg instr_fetch_err_plus2_o;
	output reg illegal_c_insn_id_o;
	output reg dummy_instr_id_o;
	output wire [31:0] pc_if_o;
	output reg [31:0] pc_id_o;
	input wire instr_valid_clear_i;
	input wire pc_set_i;
	input wire pc_set_spec_i;
	input wire [2:0] pc_mux_i;
	input wire nt_branch_mispredict_i;
	input wire [1:0] exc_pc_mux_i;
	input wire [5:0] exc_cause;
	input wire dummy_instr_en_i;
	input wire [2:0] dummy_instr_mask_i;
	input wire dummy_instr_seed_en_i;
	input wire [31:0] dummy_instr_seed_i;
	input wire icache_enable_i;
	input wire icache_inval_i;
	input wire [31:0] branch_target_ex_i;
	input wire [31:0] csr_mepc_i;
	input wire [31:0] csr_depc_i;
	input wire [31:0] csr_mtvec_i;
	output wire csr_mtvec_init_o;
	input wire id_in_ready_i;
	output wire pc_mismatch_alert_o;
	output wire if_busy_o;
	wire instr_valid_id_d;
	reg instr_valid_id_q;
	wire instr_new_id_d;
	reg instr_new_id_q;
	wire prefetch_busy;
	wire branch_req;
	wire branch_spec;
	wire predicted_branch;
	reg [31:0] fetch_addr_n;
	wire unused_fetch_addr_n0;
	wire fetch_valid;
	wire fetch_ready;
	wire [31:0] fetch_rdata;
	wire [31:0] fetch_addr;
	wire fetch_err;
	wire fetch_err_plus2;
	wire if_instr_valid;
	wire [31:0] if_instr_rdata;
	wire [31:0] if_instr_addr;
	wire if_instr_err;
	reg [31:0] exc_pc;
	wire [5:0] irq_id;
	wire unused_irq_bit;
	wire if_id_pipe_reg_we;
	wire stall_dummy_instr;
	wire [31:0] instr_out;
	wire instr_is_compressed_out;
	wire illegal_c_instr_out;
	wire instr_err_out;
	wire predict_branch_taken;
	wire [31:0] predict_branch_pc;
	wire [2:0] pc_mux_internal;
	wire [7:0] unused_boot_addr;
	wire [7:0] unused_csr_mtvec;
	assign unused_boot_addr = boot_addr_i[7:0];
	assign unused_csr_mtvec = csr_mtvec_i[7:0];
	assign irq_id = {exc_cause};
	assign unused_irq_bit = irq_id[5];
	localparam [1:0] ibex_pkg_EXC_PC_DBD = 2;
	localparam [1:0] ibex_pkg_EXC_PC_DBG_EXC = 3;
	localparam [1:0] ibex_pkg_EXC_PC_EXC = 0;
	localparam [1:0] ibex_pkg_EXC_PC_IRQ = 1;
	always @(*) begin : exc_pc_mux
		case (exc_pc_mux_i)
			ibex_pkg_EXC_PC_EXC: exc_pc = {csr_mtvec_i[31:8], 8'h00};
			ibex_pkg_EXC_PC_IRQ: exc_pc = {csr_mtvec_i[31:8], 1'b0, irq_id[4:0], 2'b00};
			ibex_pkg_EXC_PC_DBD: exc_pc = DmHaltAddr;
			ibex_pkg_EXC_PC_DBG_EXC: exc_pc = DmExceptionAddr;
			default: exc_pc = {csr_mtvec_i[31:8], 8'h00};
		endcase
	end
	localparam [2:0] ibex_pkg_PC_BP = 5;
	assign pc_mux_internal = ((BranchPredictor && predict_branch_taken) && !pc_set_i ? ibex_pkg_PC_BP : pc_mux_i);
	localparam [2:0] ibex_pkg_PC_BOOT = 0;
	localparam [2:0] ibex_pkg_PC_DRET = 4;
	localparam [2:0] ibex_pkg_PC_ERET = 3;
	localparam [2:0] ibex_pkg_PC_EXC = 2;
	localparam [2:0] ibex_pkg_PC_JUMP = 1;
	always @(*) begin : fetch_addr_mux
		case (pc_mux_internal)
			ibex_pkg_PC_BOOT: fetch_addr_n = {boot_addr_i[31:8], 8'h80};
			ibex_pkg_PC_JUMP: fetch_addr_n = branch_target_ex_i;
			ibex_pkg_PC_EXC: fetch_addr_n = exc_pc;
			ibex_pkg_PC_ERET: fetch_addr_n = csr_mepc_i;
			ibex_pkg_PC_DRET: fetch_addr_n = csr_depc_i;
			ibex_pkg_PC_BP: fetch_addr_n = (BranchPredictor ? predict_branch_pc : {boot_addr_i[31:8], 8'h80});
			default: fetch_addr_n = {boot_addr_i[31:8], 8'h80};
		endcase
	end
	assign csr_mtvec_init_o = (pc_mux_i == ibex_pkg_PC_BOOT) & pc_set_i;
	generate
		if (ICache) begin : gen_icache
			ibex_icache #(.ICacheECC(ICacheECC)) icache_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.req_i(req_i),
				.branch_i(branch_req),
				.branch_spec_i(branch_spec),
				.addr_i({fetch_addr_n[31:1], 1'b0}),
				.ready_i(fetch_ready),
				.valid_o(fetch_valid),
				.rdata_o(fetch_rdata),
				.addr_o(fetch_addr),
				.err_o(fetch_err),
				.err_plus2_o(fetch_err_plus2),
				.instr_req_o(instr_req_o),
				.instr_addr_o(instr_addr_o),
				.instr_gnt_i(instr_gnt_i),
				.instr_rvalid_i(instr_rvalid_i),
				.instr_rdata_i(instr_rdata_i),
				.instr_err_i(instr_err_i),
				.instr_pmp_err_i(instr_pmp_err_i),
				.icache_enable_i(icache_enable_i),
				.icache_inval_i(icache_inval_i),
				.busy_o(prefetch_busy)
			);
			wire unused_nt_branch_mispredict;
			wire unused_predicted_branch;
			assign unused_nt_branch_mispredict = nt_branch_mispredict_i;
			assign unused_predicted_branch = predicted_branch;
		end
		else begin : gen_prefetch_buffer
			ibex_prefetch_buffer #(.BranchPredictor(BranchPredictor)) prefetch_buffer_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.req_i(req_i),
				.branch_i(branch_req),
				.branch_spec_i(branch_spec),
				.predicted_branch_i(predicted_branch),
				.branch_mispredict_i(nt_branch_mispredict_i),
				.addr_i({fetch_addr_n[31:1], 1'b0}),
				.ready_i(fetch_ready),
				.valid_o(fetch_valid),
				.rdata_o(fetch_rdata),
				.addr_o(fetch_addr),
				.err_o(fetch_err),
				.err_plus2_o(fetch_err_plus2),
				.instr_req_o(instr_req_o),
				.instr_addr_o(instr_addr_o),
				.instr_gnt_i(instr_gnt_i),
				.instr_rvalid_i(instr_rvalid_i),
				.instr_rdata_i(instr_rdata_i),
				.instr_err_i(instr_err_i),
				.instr_pmp_err_i(instr_pmp_err_i),
				.busy_o(prefetch_busy)
			);
			wire unused_icen;
			wire unused_icinv;
			assign unused_icen = icache_enable_i;
			assign unused_icinv = icache_inval_i;
		end
	endgenerate
	assign unused_fetch_addr_n0 = fetch_addr_n[0];
	assign branch_req = pc_set_i | predict_branch_taken;
	assign branch_spec = pc_set_spec_i | predict_branch_taken;
	assign pc_if_o = if_instr_addr;
	assign if_busy_o = prefetch_busy;
	wire [31:0] instr_decompressed;
	wire illegal_c_insn;
	wire instr_is_compressed;
	ibex_compressed_decoder compressed_decoder_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.valid_i(fetch_valid & ~fetch_err),
		.instr_i(if_instr_rdata),
		.instr_o(instr_decompressed),
		.is_compressed_o(instr_is_compressed),
		.illegal_instr_o(illegal_c_insn)
	);
	generate
		if (DummyInstructions) begin : gen_dummy_instr
			wire insert_dummy_instr;
			wire [31:0] dummy_instr_data;
			ibex_dummy_instr dummy_instr_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.dummy_instr_en_i(dummy_instr_en_i),
				.dummy_instr_mask_i(dummy_instr_mask_i),
				.dummy_instr_seed_en_i(dummy_instr_seed_en_i),
				.dummy_instr_seed_i(dummy_instr_seed_i),
				.fetch_valid_i(fetch_valid),
				.id_in_ready_i(id_in_ready_i),
				.insert_dummy_instr_o(insert_dummy_instr),
				.dummy_instr_data_o(dummy_instr_data)
			);
			assign instr_out = (insert_dummy_instr ? dummy_instr_data : instr_decompressed);
			assign instr_is_compressed_out = (insert_dummy_instr ? 1'b0 : instr_is_compressed);
			assign illegal_c_instr_out = (insert_dummy_instr ? 1'b0 : illegal_c_insn);
			assign instr_err_out = (insert_dummy_instr ? 1'b0 : if_instr_err);
			assign stall_dummy_instr = insert_dummy_instr;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					dummy_instr_id_o <= 1'b0;
				else if (if_id_pipe_reg_we)
					dummy_instr_id_o <= insert_dummy_instr;
		end
		else begin : gen_no_dummy_instr
			wire unused_dummy_en;
			wire [2:0] unused_dummy_mask;
			wire unused_dummy_seed_en;
			wire [31:0] unused_dummy_seed;
			assign unused_dummy_en = dummy_instr_en_i;
			assign unused_dummy_mask = dummy_instr_mask_i;
			assign unused_dummy_seed_en = dummy_instr_seed_en_i;
			assign unused_dummy_seed = dummy_instr_seed_i;
			assign instr_out = instr_decompressed;
			assign instr_is_compressed_out = instr_is_compressed;
			assign illegal_c_instr_out = illegal_c_insn;
			assign instr_err_out = if_instr_err;
			assign stall_dummy_instr = 1'b0;
			wire [1:1] sv2v_tmp_253B9;
			assign sv2v_tmp_253B9 = 1'b0;
			always @(*) dummy_instr_id_o = sv2v_tmp_253B9;
		end
	endgenerate
	assign instr_valid_id_d = ((if_instr_valid & id_in_ready_i) & ~pc_set_i) | (instr_valid_id_q & ~instr_valid_clear_i);
	assign instr_new_id_d = if_instr_valid & id_in_ready_i;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			instr_valid_id_q <= 1'b0;
			instr_new_id_q <= 1'b0;
		end
		else begin
			instr_valid_id_q <= instr_valid_id_d;
			instr_new_id_q <= instr_new_id_d;
		end
	assign instr_valid_id_o = instr_valid_id_q;
	assign instr_new_id_o = instr_new_id_q;
	assign if_id_pipe_reg_we = instr_new_id_d;
	always @(posedge clk_i)
		if (if_id_pipe_reg_we) begin
			instr_rdata_id_o <= instr_out;
			instr_rdata_alu_id_o <= instr_out;
			instr_fetch_err_o <= instr_err_out;
			instr_fetch_err_plus2_o <= fetch_err_plus2;
			instr_rdata_c_id_o <= if_instr_rdata[15:0];
			instr_is_compressed_id_o <= instr_is_compressed_out;
			illegal_c_insn_id_o <= illegal_c_instr_out;
			pc_id_o <= pc_if_o;
		end
	generate
		if (PCIncrCheck) begin : g_secure_pc
			wire [31:0] prev_instr_addr_incr;
			reg prev_instr_seq_q;
			wire prev_instr_seq_d;
			assign prev_instr_seq_d = ((prev_instr_seq_q | instr_new_id_d) & ~branch_req) & ~stall_dummy_instr;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					prev_instr_seq_q <= 1'b0;
				else
					prev_instr_seq_q <= prev_instr_seq_d;
			assign prev_instr_addr_incr = pc_id_o + (instr_is_compressed_id_o && !instr_fetch_err_o ? 32'd2 : 32'd4);
			assign pc_mismatch_alert_o = prev_instr_seq_q & (pc_if_o != prev_instr_addr_incr);
		end
		else begin : g_no_secure_pc
			assign pc_mismatch_alert_o = 1'b0;
		end
	endgenerate
	generate
		if (BranchPredictor) begin : g_branch_predictor
			reg [31:0] instr_skid_data_q;
			reg [31:0] instr_skid_addr_q;
			reg instr_skid_bp_taken_q;
			reg instr_skid_valid_q;
			wire instr_skid_valid_d;
			wire instr_skid_en;
			reg instr_bp_taken_q;
			wire instr_bp_taken_d;
			wire predict_branch_taken_raw;
			always @(posedge clk_i)
				if (if_id_pipe_reg_we)
					instr_bp_taken_q <= instr_bp_taken_d;
			assign instr_skid_en = (predicted_branch & ~id_in_ready_i) & ~instr_skid_valid_q;
			assign instr_skid_valid_d = ((instr_skid_valid_q & ~id_in_ready_i) & ~stall_dummy_instr) | instr_skid_en;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					instr_skid_valid_q <= 1'b0;
				else
					instr_skid_valid_q <= instr_skid_valid_d;
			always @(posedge clk_i)
				if (instr_skid_en) begin
					instr_skid_bp_taken_q <= predict_branch_taken;
					instr_skid_data_q <= fetch_rdata;
					instr_skid_addr_q <= fetch_addr;
				end
			ibex_branch_predict branch_predict_i(
				.clk_i(clk_i),
				.rst_ni(rst_ni),
				.fetch_rdata_i(fetch_rdata),
				.fetch_pc_i(fetch_addr),
				.fetch_valid_i(fetch_valid),
				.predict_branch_taken_o(predict_branch_taken_raw),
				.predict_branch_pc_o(predict_branch_pc)
			);
			assign predict_branch_taken = (predict_branch_taken_raw & ~instr_skid_valid_q) & ~fetch_err;
			assign predicted_branch = predict_branch_taken & ~pc_set_i;
			assign if_instr_valid = fetch_valid | instr_skid_valid_q;
			assign if_instr_rdata = (instr_skid_valid_q ? instr_skid_data_q : fetch_rdata);
			assign if_instr_addr = (instr_skid_valid_q ? instr_skid_addr_q : fetch_addr);
			assign if_instr_err = ~instr_skid_valid_q & fetch_err;
			assign instr_bp_taken_d = (instr_skid_valid_q ? instr_skid_bp_taken_q : predict_branch_taken);
			assign fetch_ready = (id_in_ready_i & ~stall_dummy_instr) & ~instr_skid_valid_q;
			assign instr_bp_taken_o = instr_bp_taken_q;
		end
		else begin : g_no_branch_predictor
			assign instr_bp_taken_o = 1'b0;
			assign predict_branch_taken = 1'b0;
			assign predicted_branch = 1'b0;
			assign predict_branch_pc = 32'b00000000000000000000000000000000;
			assign if_instr_valid = fetch_valid;
			assign if_instr_rdata = fetch_rdata;
			assign if_instr_addr = fetch_addr;
			assign if_instr_err = fetch_err;
			assign fetch_ready = id_in_ready_i & ~stall_dummy_instr;
		end
	endgenerate
endmodule
module ibex_load_store_unit (
	clk_i,
	rst_ni,
	data_req_o,
	data_gnt_i,
	data_rvalid_i,
	data_err_i,
	data_pmp_err_i,
	data_addr_o,
	data_we_o,
	data_be_o,
	data_wdata_o,
	data_rdata_i,
	lsu_we_i,
	lsu_type_i,
	lsu_wdata_i,
	lsu_sign_ext_i,
	lsu_rdata_o,
	lsu_rdata_valid_o,
	lsu_req_i,
	adder_result_ex_i,
	addr_incr_req_o,
	addr_last_o,
	lsu_req_done_o,
	lsu_resp_valid_o,
	load_err_o,
	store_err_o,
	busy_o,
	perf_load_o,
	perf_store_o
);
	input wire clk_i;
	input wire rst_ni;
	output reg data_req_o;
	input wire data_gnt_i;
	input wire data_rvalid_i;
	input wire data_err_i;
	input wire data_pmp_err_i;
	output wire [31:0] data_addr_o;
	output wire data_we_o;
	output wire [3:0] data_be_o;
	output wire [31:0] data_wdata_o;
	input wire [31:0] data_rdata_i;
	input wire lsu_we_i;
	input wire [1:0] lsu_type_i;
	input wire [31:0] lsu_wdata_i;
	input wire lsu_sign_ext_i;
	output wire [31:0] lsu_rdata_o;
	output wire lsu_rdata_valid_o;
	input wire lsu_req_i;
	input wire [31:0] adder_result_ex_i;
	output reg addr_incr_req_o;
	output wire [31:0] addr_last_o;
	output wire lsu_req_done_o;
	output wire lsu_resp_valid_o;
	output wire load_err_o;
	output wire store_err_o;
	output wire busy_o;
	output reg perf_load_o;
	output reg perf_store_o;
	wire [31:0] data_addr;
	wire [31:0] data_addr_w_aligned;
	reg [31:0] addr_last_q;
	reg addr_update;
	reg ctrl_update;
	reg rdata_update;
	reg [31:8] rdata_q;
	reg [1:0] rdata_offset_q;
	reg [1:0] data_type_q;
	reg data_sign_ext_q;
	reg data_we_q;
	wire [1:0] data_offset;
	reg [3:0] data_be;
	reg [31:0] data_wdata;
	reg [31:0] data_rdata_ext;
	reg [31:0] rdata_w_ext;
	reg [31:0] rdata_h_ext;
	reg [31:0] rdata_b_ext;
	wire split_misaligned_access;
	reg handle_misaligned_q;
	reg handle_misaligned_d;
	reg pmp_err_q;
	reg pmp_err_d;
	reg lsu_err_q;
	reg lsu_err_d;
	wire data_or_pmp_err;
	reg [2:0] ls_fsm_cs;
	reg [2:0] ls_fsm_ns;
	assign data_addr = adder_result_ex_i;
	assign data_offset = data_addr[1:0];
	always @(*)
		case (lsu_type_i)
			2'b00:
				if (!handle_misaligned_q)
					case (data_offset)
						2'b00: data_be = 4'b1111;
						2'b01: data_be = 4'b1110;
						2'b10: data_be = 4'b1100;
						2'b11: data_be = 4'b1000;
						default: data_be = 4'b1111;
					endcase
				else
					case (data_offset)
						2'b00: data_be = 4'b0000;
						2'b01: data_be = 4'b0001;
						2'b10: data_be = 4'b0011;
						2'b11: data_be = 4'b0111;
						default: data_be = 4'b1111;
					endcase
			2'b01:
				if (!handle_misaligned_q)
					case (data_offset)
						2'b00: data_be = 4'b0011;
						2'b01: data_be = 4'b0110;
						2'b10: data_be = 4'b1100;
						2'b11: data_be = 4'b1000;
						default: data_be = 4'b1111;
					endcase
				else
					data_be = 4'b0001;
			2'b10, 2'b11:
				case (data_offset)
					2'b00: data_be = 4'b0001;
					2'b01: data_be = 4'b0010;
					2'b10: data_be = 4'b0100;
					2'b11: data_be = 4'b1000;
					default: data_be = 4'b1111;
				endcase
			default: data_be = 4'b1111;
		endcase
	always @(*)
		case (data_offset)
			2'b00: data_wdata = lsu_wdata_i[31:0];
			2'b01: data_wdata = {lsu_wdata_i[23:0], lsu_wdata_i[31:24]};
			2'b10: data_wdata = {lsu_wdata_i[15:0], lsu_wdata_i[31:16]};
			2'b11: data_wdata = {lsu_wdata_i[7:0], lsu_wdata_i[31:8]};
			default: data_wdata = lsu_wdata_i[31:0];
		endcase
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			rdata_q <= {24 {1'sb0}};
		else if (rdata_update)
			rdata_q <= data_rdata_i[31:8];
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			rdata_offset_q <= 2'h0;
			data_type_q <= 2'h0;
			data_sign_ext_q <= 1'b0;
			data_we_q <= 1'b0;
		end
		else if (ctrl_update) begin
			rdata_offset_q <= data_offset;
			data_type_q <= lsu_type_i;
			data_sign_ext_q <= lsu_sign_ext_i;
			data_we_q <= lsu_we_i;
		end
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni)
			addr_last_q <= {32 {1'sb0}};
		else if (addr_update)
			addr_last_q <= data_addr;
	always @(*)
		case (rdata_offset_q)
			2'b00: rdata_w_ext = data_rdata_i[31:0];
			2'b01: rdata_w_ext = {data_rdata_i[7:0], rdata_q[31:8]};
			2'b10: rdata_w_ext = {data_rdata_i[15:0], rdata_q[31:16]};
			2'b11: rdata_w_ext = {data_rdata_i[23:0], rdata_q[31:24]};
			default: rdata_w_ext = data_rdata_i[31:0];
		endcase
	always @(*)
		case (rdata_offset_q)
			2'b00:
				if (!data_sign_ext_q)
					rdata_h_ext = {16'h0000, data_rdata_i[15:0]};
				else
					rdata_h_ext = {{16 {data_rdata_i[15]}}, data_rdata_i[15:0]};
			2'b01:
				if (!data_sign_ext_q)
					rdata_h_ext = {16'h0000, data_rdata_i[23:8]};
				else
					rdata_h_ext = {{16 {data_rdata_i[23]}}, data_rdata_i[23:8]};
			2'b10:
				if (!data_sign_ext_q)
					rdata_h_ext = {16'h0000, data_rdata_i[31:16]};
				else
					rdata_h_ext = {{16 {data_rdata_i[31]}}, data_rdata_i[31:16]};
			2'b11:
				if (!data_sign_ext_q)
					rdata_h_ext = {16'h0000, data_rdata_i[7:0], rdata_q[31:24]};
				else
					rdata_h_ext = {{16 {data_rdata_i[7]}}, data_rdata_i[7:0], rdata_q[31:24]};
			default: rdata_h_ext = {16'h0000, data_rdata_i[15:0]};
		endcase
	always @(*)
		case (rdata_offset_q)
			2'b00:
				if (!data_sign_ext_q)
					rdata_b_ext = {24'h000000, data_rdata_i[7:0]};
				else
					rdata_b_ext = {{24 {data_rdata_i[7]}}, data_rdata_i[7:0]};
			2'b01:
				if (!data_sign_ext_q)
					rdata_b_ext = {24'h000000, data_rdata_i[15:8]};
				else
					rdata_b_ext = {{24 {data_rdata_i[15]}}, data_rdata_i[15:8]};
			2'b10:
				if (!data_sign_ext_q)
					rdata_b_ext = {24'h000000, data_rdata_i[23:16]};
				else
					rdata_b_ext = {{24 {data_rdata_i[23]}}, data_rdata_i[23:16]};
			2'b11:
				if (!data_sign_ext_q)
					rdata_b_ext = {24'h000000, data_rdata_i[31:24]};
				else
					rdata_b_ext = {{24 {data_rdata_i[31]}}, data_rdata_i[31:24]};
			default: rdata_b_ext = {24'h000000, data_rdata_i[7:0]};
		endcase
	always @(*)
		case (data_type_q)
			2'b00: data_rdata_ext = rdata_w_ext;
			2'b01: data_rdata_ext = rdata_h_ext;
			2'b10, 2'b11: data_rdata_ext = rdata_b_ext;
			default: data_rdata_ext = rdata_w_ext;
		endcase
	assign split_misaligned_access = ((lsu_type_i == 2'b00) && (data_offset != 2'b00)) || ((lsu_type_i == 2'b01) && (data_offset == 2'b11));
	localparam [2:0] IDLE = 0;
	localparam [2:0] WAIT_GNT = 3;
	localparam [2:0] WAIT_GNT_MIS = 1;
	localparam [2:0] WAIT_RVALID_MIS = 2;
	localparam [2:0] WAIT_RVALID_MIS_GNTS_DONE = 4;
	always @(*) begin
		ls_fsm_ns = ls_fsm_cs;
		data_req_o = 1'b0;
		addr_incr_req_o = 1'b0;
		handle_misaligned_d = handle_misaligned_q;
		pmp_err_d = pmp_err_q;
		lsu_err_d = lsu_err_q;
		addr_update = 1'b0;
		ctrl_update = 1'b0;
		rdata_update = 1'b0;
		perf_load_o = 1'b0;
		perf_store_o = 1'b0;
		case (ls_fsm_cs)
			IDLE: begin
				pmp_err_d = 1'b0;
				if (lsu_req_i) begin
					data_req_o = 1'b1;
					pmp_err_d = data_pmp_err_i;
					lsu_err_d = 1'b0;
					perf_load_o = ~lsu_we_i;
					perf_store_o = lsu_we_i;
					if (data_gnt_i) begin
						ctrl_update = 1'b1;
						addr_update = 1'b1;
						handle_misaligned_d = split_misaligned_access;
						ls_fsm_ns = (split_misaligned_access ? WAIT_RVALID_MIS : IDLE);
					end
					else
						ls_fsm_ns = (split_misaligned_access ? WAIT_GNT_MIS : WAIT_GNT);
				end
			end
			WAIT_GNT_MIS: begin
				data_req_o = 1'b1;
				if (data_gnt_i || pmp_err_q) begin
					addr_update = 1'b1;
					ctrl_update = 1'b1;
					handle_misaligned_d = 1'b1;
					ls_fsm_ns = WAIT_RVALID_MIS;
				end
			end
			WAIT_RVALID_MIS: begin
				data_req_o = 1'b1;
				addr_incr_req_o = 1'b1;
				if (data_rvalid_i || pmp_err_q) begin
					pmp_err_d = data_pmp_err_i;
					lsu_err_d = data_err_i | pmp_err_q;
					rdata_update = ~data_we_q;
					ls_fsm_ns = (data_gnt_i ? IDLE : WAIT_GNT);
					addr_update = data_gnt_i & ~(data_err_i | pmp_err_q);
					handle_misaligned_d = ~data_gnt_i;
				end
				else if (data_gnt_i) begin
					ls_fsm_ns = WAIT_RVALID_MIS_GNTS_DONE;
					handle_misaligned_d = 1'b0;
				end
			end
			WAIT_GNT: begin
				addr_incr_req_o = handle_misaligned_q;
				data_req_o = 1'b1;
				if (data_gnt_i || pmp_err_q) begin
					ctrl_update = 1'b1;
					addr_update = ~lsu_err_q;
					ls_fsm_ns = IDLE;
					handle_misaligned_d = 1'b0;
				end
			end
			WAIT_RVALID_MIS_GNTS_DONE: begin
				addr_incr_req_o = 1'b1;
				if (data_rvalid_i) begin
					pmp_err_d = data_pmp_err_i;
					lsu_err_d = data_err_i;
					addr_update = ~data_err_i;
					rdata_update = ~data_we_q;
					ls_fsm_ns = IDLE;
				end
			end
			default: ls_fsm_ns = IDLE;
		endcase
	end
	assign lsu_req_done_o = (lsu_req_i | (ls_fsm_cs != IDLE)) & (ls_fsm_ns == IDLE);
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			ls_fsm_cs <= IDLE;
			handle_misaligned_q <= 1'b0;
			pmp_err_q <= 1'b0;
			lsu_err_q <= 1'b0;
		end
		else begin
			ls_fsm_cs <= ls_fsm_ns;
			handle_misaligned_q <= handle_misaligned_d;
			pmp_err_q <= pmp_err_d;
			lsu_err_q <= lsu_err_d;
		end
	assign data_or_pmp_err = (lsu_err_q | data_err_i) | pmp_err_q;
	assign lsu_resp_valid_o = (data_rvalid_i | pmp_err_q) & (ls_fsm_cs == IDLE);
	assign lsu_rdata_valid_o = (((ls_fsm_cs == IDLE) & data_rvalid_i) & ~data_or_pmp_err) & ~data_we_q;
	assign lsu_rdata_o = data_rdata_ext;
	assign data_addr_w_aligned = {data_addr[31:2], 2'b00};
	assign data_addr_o = data_addr_w_aligned;
	assign data_wdata_o = data_wdata;
	assign data_we_o = lsu_we_i;
	assign data_be_o = data_be;
	assign addr_last_o = addr_last_q;
	assign load_err_o = (data_or_pmp_err & ~data_we_q) & lsu_resp_valid_o;
	assign store_err_o = (data_or_pmp_err & data_we_q) & lsu_resp_valid_o;
	assign busy_o = ls_fsm_cs != IDLE;
endmodule
module ibex_multdiv_fast (
	clk_i,
	rst_ni,
	mult_en_i,
	div_en_i,
	mult_sel_i,
	div_sel_i,
	operator_i,
	signed_mode_i,
	op_a_i,
	op_b_i,
	alu_adder_ext_i,
	alu_adder_i,
	equal_to_zero_i,
	data_ind_timing_i,
	alu_operand_a_o,
	alu_operand_b_o,
	imd_val_q_i,
	imd_val_d_o,
	imd_val_we_o,
	multdiv_ready_id_i,
	multdiv_result_o,
	valid_o
);
	localparam integer ibex_pkg_RV32MFast = 2;
	parameter integer RV32M = ibex_pkg_RV32MFast;
	input wire clk_i;
	input wire rst_ni;
	input wire mult_en_i;
	input wire div_en_i;
	input wire mult_sel_i;
	input wire div_sel_i;
	input wire [1:0] operator_i;
	input wire [1:0] signed_mode_i;
	input wire [31:0] op_a_i;
	input wire [31:0] op_b_i;
	input wire [33:0] alu_adder_ext_i;
	input wire [31:0] alu_adder_i;
	input wire equal_to_zero_i;
	input wire data_ind_timing_i;
	output reg [32:0] alu_operand_a_o;
	output reg [32:0] alu_operand_b_o;
	input wire [67:0] imd_val_q_i;
	output wire [67:0] imd_val_d_o;
	output wire [1:0] imd_val_we_o;
	input wire multdiv_ready_id_i;
	output wire [31:0] multdiv_result_o;
	output wire valid_o;
	wire signed [34:0] mac_res_signed;
	wire [34:0] mac_res_ext;
	reg [33:0] accum;
	reg sign_a;
	reg sign_b;
	reg mult_valid;
	wire signed_mult;
	reg [33:0] mac_res_d;
	reg [33:0] op_remainder_d;
	wire [33:0] mac_res;
	wire div_sign_a;
	wire div_sign_b;
	reg is_greater_equal;
	wire div_change_sign;
	wire rem_change_sign;
	wire [31:0] one_shift;
	wire [31:0] op_denominator_q;
	reg [31:0] op_numerator_q;
	reg [31:0] op_quotient_q;
	reg [31:0] op_denominator_d;
	reg [31:0] op_numerator_d;
	reg [31:0] op_quotient_d;
	wire [31:0] next_remainder;
	wire [32:0] next_quotient;
	wire [31:0] res_adder_h;
	reg div_valid;
	reg [4:0] div_counter_q;
	reg [4:0] div_counter_d;
	wire multdiv_en;
	reg mult_hold;
	reg div_hold;
	reg div_by_zero_d;
	reg div_by_zero_q;
	wire mult_en_internal;
	wire div_en_internal;
	reg [2:0] md_state_q;
	reg [2:0] md_state_d;
	wire unused_mult_sel_i;
	assign unused_mult_sel_i = mult_sel_i;
	assign mult_en_internal = mult_en_i & ~mult_hold;
	assign div_en_internal = div_en_i & ~div_hold;
	localparam [2:0] MD_IDLE = 0;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			div_counter_q <= {5 {1'sb0}};
			md_state_q <= MD_IDLE;
			op_numerator_q <= {32 {1'sb0}};
			op_quotient_q <= {32 {1'sb0}};
			div_by_zero_q <= 1'b0;
		end
		else if (div_en_internal) begin
			div_counter_q <= div_counter_d;
			op_numerator_q <= op_numerator_d;
			op_quotient_q <= op_quotient_d;
			md_state_q <= md_state_d;
			div_by_zero_q <= div_by_zero_d;
		end
	assign multdiv_en = mult_en_internal | div_en_internal;
	assign imd_val_d_o[34+:34] = (div_sel_i ? op_remainder_d : mac_res_d);
	assign imd_val_we_o[0] = multdiv_en;
	assign imd_val_d_o[0+:34] = {2'b00, op_denominator_d};
	assign imd_val_we_o[1] = div_en_internal;
	assign op_denominator_q = imd_val_q_i[31-:32];
	wire [1:0] unused_imd_val;
	assign unused_imd_val = imd_val_q_i[33-:2];
	wire unused_mac_res_ext;
	assign unused_mac_res_ext = mac_res_ext[34];
	assign signed_mult = signed_mode_i != 2'b00;
	assign multdiv_result_o = (div_sel_i ? imd_val_q_i[65-:32] : mac_res_d[31:0]);
	localparam [1:0] AHBH = 3;
	localparam [1:0] AHBL = 2;
	localparam [1:0] ALBH = 1;
	localparam [1:0] ALBL = 0;
	localparam [0:0] MULH = 1;
	localparam [0:0] MULL = 0;
	localparam [1:0] ibex_pkg_MD_OP_MULL = 0;
	localparam integer ibex_pkg_RV32MSingleCycle = 3;
	generate
		if (RV32M == ibex_pkg_RV32MSingleCycle) begin : gen_mult_single_cycle
			reg mult_state_q;
			reg mult_state_d;
			wire signed [33:0] mult1_res;
			wire signed [33:0] mult2_res;
			wire signed [33:0] mult3_res;
			wire [33:0] mult1_res_uns;
			wire [33:32] unused_mult1_res_uns;
			wire [15:0] mult1_op_a;
			wire [15:0] mult1_op_b;
			wire [15:0] mult2_op_a;
			wire [15:0] mult2_op_b;
			reg [15:0] mult3_op_a;
			reg [15:0] mult3_op_b;
			wire mult1_sign_a;
			wire mult1_sign_b;
			wire mult2_sign_a;
			wire mult2_sign_b;
			reg mult3_sign_a;
			reg mult3_sign_b;
			reg [33:0] summand1;
			reg [33:0] summand2;
			reg [33:0] summand3;
			assign mult1_res = $signed({mult1_sign_a, mult1_op_a}) * $signed({mult1_sign_b, mult1_op_b});
			assign mult2_res = $signed({mult2_sign_a, mult2_op_a}) * $signed({mult2_sign_b, mult2_op_b});
			assign mult3_res = $signed({mult3_sign_a, mult3_op_a}) * $signed({mult3_sign_b, mult3_op_b});
			assign mac_res_signed = ($signed(summand1) + $signed(summand2)) + $signed(summand3);
			assign mult1_res_uns = $unsigned(mult1_res);
			assign mac_res_ext = $unsigned(mac_res_signed);
			assign mac_res = mac_res_ext[33:0];
			wire [1:1] sv2v_tmp_1E8D3;
			assign sv2v_tmp_1E8D3 = signed_mode_i[0] & op_a_i[31];
			always @(*) sign_a = sv2v_tmp_1E8D3;
			wire [1:1] sv2v_tmp_3B65C;
			assign sv2v_tmp_3B65C = signed_mode_i[1] & op_b_i[31];
			always @(*) sign_b = sv2v_tmp_3B65C;
			assign mult1_sign_a = 1'b0;
			assign mult1_sign_b = 1'b0;
			assign mult1_op_a = op_a_i[15:0];
			assign mult1_op_b = op_b_i[15:0];
			assign mult2_sign_a = 1'b0;
			assign mult2_sign_b = sign_b;
			assign mult2_op_a = op_a_i[15:0];
			assign mult2_op_b = op_b_i[31:16];
			wire [18:1] sv2v_tmp_4D45D;
			assign sv2v_tmp_4D45D = imd_val_q_i[67-:18];
			always @(*) accum[17:0] = sv2v_tmp_4D45D;
			wire [16:1] sv2v_tmp_D5F47;
			assign sv2v_tmp_D5F47 = {16 {signed_mult & imd_val_q_i[67]}};
			always @(*) accum[33:18] = sv2v_tmp_D5F47;
			always @(*) begin
				mult3_sign_a = sign_a;
				mult3_sign_b = 1'b0;
				mult3_op_a = op_a_i[31:16];
				mult3_op_b = op_b_i[15:0];
				summand1 = {18'h00000, mult1_res_uns[31:16]};
				summand2 = $unsigned(mult2_res);
				summand3 = $unsigned(mult3_res);
				mac_res_d = {2'b00, mac_res[15:0], mult1_res_uns[15:0]};
				mult_valid = mult_en_i;
				mult_state_d = MULL;
				mult_hold = 1'b0;
				case (mult_state_q)
					MULL:
						if (operator_i != ibex_pkg_MD_OP_MULL) begin
							mac_res_d = mac_res;
							mult_valid = 1'b0;
							mult_state_d = MULH;
						end
						else
							mult_hold = ~multdiv_ready_id_i;
					MULH: begin
						mult3_sign_a = sign_a;
						mult3_sign_b = sign_b;
						mult3_op_a = op_a_i[31:16];
						mult3_op_b = op_b_i[31:16];
						mac_res_d = mac_res;
						summand1 = {34 {1'sb0}};
						summand2 = accum;
						summand3 = mult3_res;
						mult_state_d = MULL;
						mult_valid = 1'b1;
						mult_hold = ~multdiv_ready_id_i;
					end
					default: mult_state_d = MULL;
				endcase
			end
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					mult_state_q <= MULL;
				else if (mult_en_internal)
					mult_state_q <= mult_state_d;
			assign unused_mult1_res_uns = mult1_res_uns[33:32];
		end
		else begin : gen_mult_fast
			reg [15:0] mult_op_a;
			reg [15:0] mult_op_b;
			reg [1:0] mult_state_q;
			reg [1:0] mult_state_d;
			assign mac_res_signed = ($signed({sign_a, mult_op_a}) * $signed({sign_b, mult_op_b})) + $signed(accum);
			assign mac_res_ext = $unsigned(mac_res_signed);
			assign mac_res = mac_res_ext[33:0];
			always @(*) begin
				mult_op_a = op_a_i[15:0];
				mult_op_b = op_b_i[15:0];
				sign_a = 1'b0;
				sign_b = 1'b0;
				accum = imd_val_q_i[34+:34];
				mac_res_d = mac_res;
				mult_state_d = mult_state_q;
				mult_valid = 1'b0;
				mult_hold = 1'b0;
				case (mult_state_q)
					ALBL: begin
						mult_op_a = op_a_i[15:0];
						mult_op_b = op_b_i[15:0];
						sign_a = 1'b0;
						sign_b = 1'b0;
						accum = {34 {1'sb0}};
						mac_res_d = mac_res;
						mult_state_d = ALBH;
					end
					ALBH: begin
						mult_op_a = op_a_i[15:0];
						mult_op_b = op_b_i[31:16];
						sign_a = 1'b0;
						sign_b = signed_mode_i[1] & op_b_i[31];
						accum = {18'b000000000000000000, imd_val_q_i[65-:16]};
						if (operator_i == ibex_pkg_MD_OP_MULL)
							mac_res_d = {2'b00, mac_res[15:0], imd_val_q_i[49-:16]};
						else
							mac_res_d = mac_res;
						mult_state_d = AHBL;
					end
					AHBL: begin
						mult_op_a = op_a_i[31:16];
						mult_op_b = op_b_i[15:0];
						sign_a = signed_mode_i[0] & op_a_i[31];
						sign_b = 1'b0;
						if (operator_i == ibex_pkg_MD_OP_MULL) begin
							accum = {18'b000000000000000000, imd_val_q_i[65-:16]};
							mac_res_d = {2'b00, mac_res[15:0], imd_val_q_i[49-:16]};
							mult_valid = 1'b1;
							mult_state_d = ALBL;
							mult_hold = ~multdiv_ready_id_i;
						end
						else begin
							accum = imd_val_q_i[34+:34];
							mac_res_d = mac_res;
							mult_state_d = AHBH;
						end
					end
					AHBH: begin
						mult_op_a = op_a_i[31:16];
						mult_op_b = op_b_i[31:16];
						sign_a = signed_mode_i[0] & op_a_i[31];
						sign_b = signed_mode_i[1] & op_b_i[31];
						accum[17:0] = imd_val_q_i[67-:18];
						accum[33:18] = {16 {signed_mult & imd_val_q_i[67]}};
						mac_res_d = mac_res;
						mult_valid = 1'b1;
						mult_state_d = ALBL;
						mult_hold = ~multdiv_ready_id_i;
					end
					default: mult_state_d = ALBL;
				endcase
			end
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					mult_state_q <= ALBL;
				else if (mult_en_internal)
					mult_state_q <= mult_state_d;
		end
	endgenerate
	assign res_adder_h = alu_adder_ext_i[32:1];
	wire [1:0] unused_alu_adder_ext;
	assign unused_alu_adder_ext = {alu_adder_ext_i[33], alu_adder_ext_i[0]};
	assign next_remainder = (is_greater_equal ? res_adder_h[31:0] : imd_val_q_i[65-:32]);
	assign next_quotient = (is_greater_equal ? {1'b0, op_quotient_q} | {1'b0, one_shift} : {1'b0, op_quotient_q});
	assign one_shift = {31'b0000000000000000000000000000000, 1'b1} << div_counter_q;
	always @(*)
		if ((imd_val_q_i[65] ^ op_denominator_q[31]) == 1'b0)
			is_greater_equal = res_adder_h[31] == 1'b0;
		else
			is_greater_equal = imd_val_q_i[65];
	assign div_sign_a = op_a_i[31] & signed_mode_i[0];
	assign div_sign_b = op_b_i[31] & signed_mode_i[1];
	assign div_change_sign = (div_sign_a ^ div_sign_b) & ~div_by_zero_q;
	assign rem_change_sign = div_sign_a;
	localparam [2:0] MD_ABS_A = 1;
	localparam [2:0] MD_ABS_B = 2;
	localparam [2:0] MD_CHANGE_SIGN = 5;
	localparam [2:0] MD_COMP = 3;
	localparam [2:0] MD_FINISH = 6;
	localparam [2:0] MD_LAST = 4;
	localparam [1:0] ibex_pkg_MD_OP_DIV = 2;
	always @(*) begin
		div_counter_d = div_counter_q - 5'h01;
		op_remainder_d = imd_val_q_i[34+:34];
		op_quotient_d = op_quotient_q;
		md_state_d = md_state_q;
		op_numerator_d = op_numerator_q;
		op_denominator_d = op_denominator_q;
		alu_operand_a_o = {32'h00000000, 1'b1};
		alu_operand_b_o = {~op_b_i, 1'b1};
		div_valid = 1'b0;
		div_hold = 1'b0;
		div_by_zero_d = div_by_zero_q;
		case (md_state_q)
			MD_IDLE: begin
				if (operator_i == ibex_pkg_MD_OP_DIV) begin
					op_remainder_d = {34 {1'sb1}};
					md_state_d = (!data_ind_timing_i && equal_to_zero_i ? MD_FINISH : MD_ABS_A);
					div_by_zero_d = equal_to_zero_i;
				end
				else begin
					op_remainder_d = {2'b00, op_a_i};
					md_state_d = (!data_ind_timing_i && equal_to_zero_i ? MD_FINISH : MD_ABS_A);
				end
				alu_operand_a_o = {32'h00000000, 1'b1};
				alu_operand_b_o = {~op_b_i, 1'b1};
				div_counter_d = 5'd31;
			end
			MD_ABS_A: begin
				op_quotient_d = {32 {1'sb0}};
				op_numerator_d = (div_sign_a ? alu_adder_i : op_a_i);
				md_state_d = MD_ABS_B;
				div_counter_d = 5'd31;
				alu_operand_a_o = {32'h00000000, 1'b1};
				alu_operand_b_o = {~op_a_i, 1'b1};
			end
			MD_ABS_B: begin
				op_remainder_d = {33'h000000000, op_numerator_q[31]};
				op_denominator_d = (div_sign_b ? alu_adder_i : op_b_i);
				md_state_d = MD_COMP;
				div_counter_d = 5'd31;
				alu_operand_a_o = {32'h00000000, 1'b1};
				alu_operand_b_o = {~op_b_i, 1'b1};
			end
			MD_COMP: begin
				op_remainder_d = {1'b0, next_remainder[31:0], op_numerator_q[div_counter_d]};
				op_quotient_d = next_quotient[31:0];
				md_state_d = (div_counter_q == 5'd1 ? MD_LAST : MD_COMP);
				alu_operand_a_o = {imd_val_q_i[65-:32], 1'b1};
				alu_operand_b_o = {~op_denominator_q[31:0], 1'b1};
			end
			MD_LAST: begin
				if (operator_i == ibex_pkg_MD_OP_DIV)
					op_remainder_d = {1'b0, next_quotient};
				else
					op_remainder_d = {2'b00, next_remainder[31:0]};
				alu_operand_a_o = {imd_val_q_i[65-:32], 1'b1};
				alu_operand_b_o = {~op_denominator_q[31:0], 1'b1};
				md_state_d = MD_CHANGE_SIGN;
			end
			MD_CHANGE_SIGN: begin
				md_state_d = MD_FINISH;
				if (operator_i == ibex_pkg_MD_OP_DIV)
					op_remainder_d = (div_change_sign ? {2'h0, alu_adder_i} : imd_val_q_i[34+:34]);
				else
					op_remainder_d = (rem_change_sign ? {2'h0, alu_adder_i} : imd_val_q_i[34+:34]);
				alu_operand_a_o = {32'h00000000, 1'b1};
				alu_operand_b_o = {~imd_val_q_i[65-:32], 1'b1};
			end
			MD_FINISH: begin
				md_state_d = MD_IDLE;
				div_hold = ~multdiv_ready_id_i;
				div_valid = 1'b1;
			end
			default: md_state_d = MD_IDLE;
		endcase
	end
	assign valid_o = mult_valid | div_valid;
endmodule
module ibex_multdiv_slow (
	clk_i,
	rst_ni,
	mult_en_i,
	div_en_i,
	mult_sel_i,
	div_sel_i,
	operator_i,
	signed_mode_i,
	op_a_i,
	op_b_i,
	alu_adder_ext_i,
	alu_adder_i,
	equal_to_zero_i,
	data_ind_timing_i,
	alu_operand_a_o,
	alu_operand_b_o,
	imd_val_q_i,
	imd_val_d_o,
	imd_val_we_o,
	multdiv_ready_id_i,
	multdiv_result_o,
	valid_o
);
	input wire clk_i;
	input wire rst_ni;
	input wire mult_en_i;
	input wire div_en_i;
	input wire mult_sel_i;
	input wire div_sel_i;
	input wire [1:0] operator_i;
	input wire [1:0] signed_mode_i;
	input wire [31:0] op_a_i;
	input wire [31:0] op_b_i;
	input wire [33:0] alu_adder_ext_i;
	input wire [31:0] alu_adder_i;
	input wire equal_to_zero_i;
	input wire data_ind_timing_i;
	output reg [32:0] alu_operand_a_o;
	output reg [32:0] alu_operand_b_o;
	input wire [67:0] imd_val_q_i;
	output wire [67:0] imd_val_d_o;
	output wire [1:0] imd_val_we_o;
	input wire multdiv_ready_id_i;
	output wire [31:0] multdiv_result_o;
	output wire valid_o;
	reg [2:0] md_state_q;
	reg [2:0] md_state_d;
	wire [32:0] accum_window_q;
	reg [32:0] accum_window_d;
	wire unused_imd_val0;
	wire [1:0] unused_imd_val1;
	wire [32:0] res_adder_l;
	wire [32:0] res_adder_h;
	reg [4:0] multdiv_count_q;
	reg [4:0] multdiv_count_d;
	reg [32:0] op_b_shift_q;
	reg [32:0] op_b_shift_d;
	reg [32:0] op_a_shift_q;
	reg [32:0] op_a_shift_d;
	wire [32:0] op_a_ext;
	wire [32:0] op_b_ext;
	wire [32:0] one_shift;
	wire [32:0] op_a_bw_pp;
	wire [32:0] op_a_bw_last_pp;
	wire [31:0] b_0;
	wire sign_a;
	wire sign_b;
	wire [32:0] next_quotient;
	wire [31:0] next_remainder;
	wire [31:0] op_numerator_q;
	reg [31:0] op_numerator_d;
	wire is_greater_equal;
	wire div_change_sign;
	wire rem_change_sign;
	reg div_by_zero_d;
	reg div_by_zero_q;
	reg multdiv_hold;
	wire multdiv_en;
	assign res_adder_l = alu_adder_ext_i[32:0];
	assign res_adder_h = alu_adder_ext_i[33:1];
	assign imd_val_d_o[34+:34] = {1'b0, accum_window_d};
	assign imd_val_we_o[0] = ~multdiv_hold;
	assign accum_window_q = imd_val_q_i[66-:33];
	assign unused_imd_val0 = imd_val_q_i[67];
	assign imd_val_d_o[0+:34] = {2'b00, op_numerator_d};
	assign imd_val_we_o[1] = multdiv_en;
	assign op_numerator_q = imd_val_q_i[31-:32];
	assign unused_imd_val1 = imd_val_q_i[33-:2];
	localparam [2:0] MD_ABS_A = 1;
	localparam [2:0] MD_ABS_B = 2;
	localparam [2:0] MD_CHANGE_SIGN = 5;
	localparam [2:0] MD_IDLE = 0;
	localparam [2:0] MD_LAST = 4;
	localparam [1:0] ibex_pkg_MD_OP_DIV = 2;
	localparam [1:0] ibex_pkg_MD_OP_MULH = 1;
	localparam [1:0] ibex_pkg_MD_OP_MULL = 0;
	localparam [1:0] ibex_pkg_MD_OP_REM = 3;
	always @(*) begin
		alu_operand_a_o = accum_window_q;
		case (operator_i)
			ibex_pkg_MD_OP_MULL: alu_operand_b_o = op_a_bw_pp;
			ibex_pkg_MD_OP_MULH: alu_operand_b_o = (md_state_q == MD_LAST ? op_a_bw_last_pp : op_a_bw_pp);
			ibex_pkg_MD_OP_DIV, ibex_pkg_MD_OP_REM:
				case (md_state_q)
					MD_IDLE: begin
						alu_operand_a_o = {32'h00000000, 1'b1};
						alu_operand_b_o = {~op_b_i, 1'b1};
					end
					MD_ABS_A: begin
						alu_operand_a_o = {32'h00000000, 1'b1};
						alu_operand_b_o = {~op_a_i, 1'b1};
					end
					MD_ABS_B: begin
						alu_operand_a_o = {32'h00000000, 1'b1};
						alu_operand_b_o = {~op_b_i, 1'b1};
					end
					MD_CHANGE_SIGN: begin
						alu_operand_a_o = {32'h00000000, 1'b1};
						alu_operand_b_o = {~accum_window_q[31:0], 1'b1};
					end
					default: begin
						alu_operand_a_o = {accum_window_q[31:0], 1'b1};
						alu_operand_b_o = {~op_b_shift_q[31:0], 1'b1};
					end
				endcase
			default: begin
				alu_operand_a_o = accum_window_q;
				alu_operand_b_o = {~op_b_shift_q[31:0], 1'b1};
			end
		endcase
	end
	assign b_0 = {32 {op_b_shift_q[0]}};
	assign op_a_bw_pp = {~(op_a_shift_q[32] & op_b_shift_q[0]), op_a_shift_q[31:0] & b_0};
	assign op_a_bw_last_pp = {op_a_shift_q[32] & op_b_shift_q[0], ~(op_a_shift_q[31:0] & b_0)};
	assign sign_a = op_a_i[31] & signed_mode_i[0];
	assign sign_b = op_b_i[31] & signed_mode_i[1];
	assign op_a_ext = {sign_a, op_a_i};
	assign op_b_ext = {sign_b, op_b_i};
	assign is_greater_equal = (accum_window_q[31] == op_b_shift_q[31] ? ~res_adder_h[31] : accum_window_q[31]);
	assign one_shift = {32'b00000000000000000000000000000000, 1'b1} << multdiv_count_q;
	assign next_remainder = (is_greater_equal ? res_adder_h[31:0] : accum_window_q[31:0]);
	assign next_quotient = (is_greater_equal ? op_a_shift_q | one_shift : op_a_shift_q);
	assign div_change_sign = (sign_a ^ sign_b) & ~div_by_zero_q;
	assign rem_change_sign = sign_a;
	localparam [2:0] MD_COMP = 3;
	localparam [2:0] MD_FINISH = 6;
	always @(*) begin
		multdiv_count_d = multdiv_count_q;
		accum_window_d = accum_window_q;
		op_b_shift_d = op_b_shift_q;
		op_a_shift_d = op_a_shift_q;
		op_numerator_d = op_numerator_q;
		md_state_d = md_state_q;
		multdiv_hold = 1'b0;
		div_by_zero_d = div_by_zero_q;
		if (mult_sel_i || div_sel_i)
			case (md_state_q)
				MD_IDLE: begin
					case (operator_i)
						ibex_pkg_MD_OP_MULL: begin
							op_a_shift_d = op_a_ext << 1;
							accum_window_d = {~(op_a_ext[32] & op_b_i[0]), op_a_ext[31:0] & {32 {op_b_i[0]}}};
							op_b_shift_d = op_b_ext >> 1;
							md_state_d = (!data_ind_timing_i && ((op_b_ext >> 1) == 0) ? MD_LAST : MD_COMP);
						end
						ibex_pkg_MD_OP_MULH: begin
							op_a_shift_d = op_a_ext;
							accum_window_d = {1'b1, ~(op_a_ext[32] & op_b_i[0]), op_a_ext[31:1] & {31 {op_b_i[0]}}};
							op_b_shift_d = op_b_ext >> 1;
							md_state_d = MD_COMP;
						end
						ibex_pkg_MD_OP_DIV: begin
							accum_window_d = {33 {1'b1}};
							md_state_d = (!data_ind_timing_i && equal_to_zero_i ? MD_FINISH : MD_ABS_A);
							div_by_zero_d = equal_to_zero_i;
						end
						ibex_pkg_MD_OP_REM: begin
							accum_window_d = op_a_ext;
							md_state_d = (!data_ind_timing_i && equal_to_zero_i ? MD_FINISH : MD_ABS_A);
						end
						default:
							;
					endcase
					multdiv_count_d = 5'd31;
				end
				MD_ABS_A: begin
					op_a_shift_d = {33 {1'sb0}};
					op_numerator_d = (sign_a ? alu_adder_i : op_a_i);
					md_state_d = MD_ABS_B;
				end
				MD_ABS_B: begin
					accum_window_d = {32'h00000000, op_numerator_q[31]};
					op_b_shift_d = (sign_b ? {1'b0, alu_adder_i} : {1'b0, op_b_i});
					md_state_d = MD_COMP;
				end
				MD_COMP: begin
					multdiv_count_d = multdiv_count_q - 5'h01;
					case (operator_i)
						ibex_pkg_MD_OP_MULL: begin
							accum_window_d = res_adder_l;
							op_a_shift_d = op_a_shift_q << 1;
							op_b_shift_d = op_b_shift_q >> 1;
							md_state_d = ((!data_ind_timing_i && (op_b_shift_d == 0)) || (multdiv_count_q == 5'd1) ? MD_LAST : MD_COMP);
						end
						ibex_pkg_MD_OP_MULH: begin
							accum_window_d = res_adder_h;
							op_a_shift_d = op_a_shift_q;
							op_b_shift_d = op_b_shift_q >> 1;
							md_state_d = (multdiv_count_q == 5'd1 ? MD_LAST : MD_COMP);
						end
						ibex_pkg_MD_OP_DIV, ibex_pkg_MD_OP_REM: begin
							accum_window_d = {next_remainder[31:0], op_numerator_q[multdiv_count_d]};
							op_a_shift_d = next_quotient;
							md_state_d = (multdiv_count_q == 5'd1 ? MD_LAST : MD_COMP);
						end
						default:
							;
					endcase
				end
				MD_LAST:
					case (operator_i)
						ibex_pkg_MD_OP_MULL: begin
							accum_window_d = res_adder_l;
							md_state_d = MD_IDLE;
							multdiv_hold = ~multdiv_ready_id_i;
						end
						ibex_pkg_MD_OP_MULH: begin
							accum_window_d = res_adder_l;
							md_state_d = MD_IDLE;
							md_state_d = MD_IDLE;
							multdiv_hold = ~multdiv_ready_id_i;
						end
						ibex_pkg_MD_OP_DIV: begin
							accum_window_d = next_quotient;
							md_state_d = MD_CHANGE_SIGN;
						end
						ibex_pkg_MD_OP_REM: begin
							accum_window_d = {1'b0, next_remainder[31:0]};
							md_state_d = MD_CHANGE_SIGN;
						end
						default:
							;
					endcase
				MD_CHANGE_SIGN: begin
					md_state_d = MD_FINISH;
					case (operator_i)
						ibex_pkg_MD_OP_DIV: accum_window_d = (div_change_sign ? {1'b0, alu_adder_i} : accum_window_q);
						ibex_pkg_MD_OP_REM: accum_window_d = (rem_change_sign ? {1'b0, alu_adder_i} : accum_window_q);
						default:
							;
					endcase
				end
				MD_FINISH: begin
					md_state_d = MD_IDLE;
					multdiv_hold = ~multdiv_ready_id_i;
				end
				default: md_state_d = MD_IDLE;
			endcase
	end
	assign multdiv_en = (mult_en_i | div_en_i) & ~multdiv_hold;
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			multdiv_count_q <= 5'h00;
			op_b_shift_q <= 33'h000000000;
			op_a_shift_q <= 33'h000000000;
			md_state_q <= MD_IDLE;
			div_by_zero_q <= 1'b0;
		end
		else if (multdiv_en) begin
			multdiv_count_q <= multdiv_count_d;
			op_b_shift_q <= op_b_shift_d;
			op_a_shift_q <= op_a_shift_d;
			md_state_q <= md_state_d;
			div_by_zero_q <= div_by_zero_d;
		end
	assign valid_o = (md_state_q == MD_FINISH) | ((md_state_q == MD_LAST) & ((operator_i == ibex_pkg_MD_OP_MULL) | (operator_i == ibex_pkg_MD_OP_MULH)));
	assign multdiv_result_o = (div_en_i ? accum_window_q[31:0] : res_adder_l[31:0]);
endmodule
module ibex_pmp (
	clk_i,
	rst_ni,
	csr_pmp_cfg_i,
	csr_pmp_addr_i,
	priv_mode_i,
	pmp_req_addr_i,
	pmp_req_type_i,
	pmp_req_err_o
);
	parameter [31:0] PMPGranularity = 0;
	parameter [31:0] PMPNumChan = 2;
	parameter [31:0] PMPNumRegions = 4;
	input wire clk_i;
	input wire rst_ni;
	input wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 6) + (((PMPNumRegions - 1) * 6) - 1) : (PMPNumRegions * 6) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 6 : 0)] csr_pmp_cfg_i;
	input wire [(0 >= (PMPNumRegions - 1) ? ((2 - PMPNumRegions) * 34) + (((PMPNumRegions - 1) * 34) - 1) : (PMPNumRegions * 34) - 1):(0 >= (PMPNumRegions - 1) ? (PMPNumRegions - 1) * 34 : 0)] csr_pmp_addr_i;
	input wire [(0 >= (PMPNumChan - 1) ? ((2 - PMPNumChan) * 2) + (((PMPNumChan - 1) * 2) - 1) : (PMPNumChan * 2) - 1):(0 >= (PMPNumChan - 1) ? (PMPNumChan - 1) * 2 : 0)] priv_mode_i;
	input wire [(0 >= (PMPNumChan - 1) ? ((2 - PMPNumChan) * 34) + (((PMPNumChan - 1) * 34) - 1) : (PMPNumChan * 34) - 1):(0 >= (PMPNumChan - 1) ? (PMPNumChan - 1) * 34 : 0)] pmp_req_addr_i;
	input wire [(0 >= (PMPNumChan - 1) ? ((2 - PMPNumChan) * 2) + (((PMPNumChan - 1) * 2) - 1) : (PMPNumChan * 2) - 1):(0 >= (PMPNumChan - 1) ? (PMPNumChan - 1) * 2 : 0)] pmp_req_type_i;
	output wire [0:PMPNumChan - 1] pmp_req_err_o;
	wire [33:0] region_start_addr [0:PMPNumRegions - 1];
	wire [33:PMPGranularity + 2] region_addr_mask [0:PMPNumRegions - 1];
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_match_gt;
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_match_lt;
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_match_eq;
	reg [(PMPNumChan * PMPNumRegions) - 1:0] region_match_all;
	wire [(PMPNumChan * PMPNumRegions) - 1:0] region_perm_check;
	reg [PMPNumChan - 1:0] access_fault;
	localparam [1:0] ibex_pkg_PMP_MODE_NAPOT = 2'b11;
	localparam [1:0] ibex_pkg_PMP_MODE_TOR = 2'b01;
	generate
		genvar r;
		for (r = 0; r < PMPNumRegions; r = r + 1) begin : g_addr_exp
			if (r == 0) begin : g_entry0
				assign region_start_addr[r] = (csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 4-:2] == ibex_pkg_PMP_MODE_TOR ? 34'h000000000 : csr_pmp_addr_i[(0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 34+:34]);
			end
			else begin : g_oth
				assign region_start_addr[r] = (csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 4-:2] == ibex_pkg_PMP_MODE_TOR ? csr_pmp_addr_i[(0 >= (PMPNumRegions - 1) ? r - 1 : (PMPNumRegions - 1) - (r - 1)) * 34+:34] : csr_pmp_addr_i[(0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 34+:34]);
			end
			genvar b;
			for (b = PMPGranularity + 2; b < 34; b = b + 1) begin : g_bitmask
				if (b == 2) begin : g_bit0
					assign region_addr_mask[r][b] = csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 4-:2] != ibex_pkg_PMP_MODE_NAPOT;
				end
				else begin : g_others
					assign region_addr_mask[r][b] = (csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 4-:2] != ibex_pkg_PMP_MODE_NAPOT) | ~&csr_pmp_addr_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 34) + ((b - 1) >= (PMPGranularity + 1) ? b - 1 : ((b - 1) + ((b - 1) >= (PMPGranularity + 1) ? ((b - 1) - (PMPGranularity + 1)) + 1 : ((PMPGranularity + 1) - (b - 1)) + 1)) - 1)-:((b - 1) >= (PMPGranularity + 1) ? ((b - 1) - (PMPGranularity + 1)) + 1 : ((PMPGranularity + 1) - (b - 1)) + 1)];
				end
			end
		end
	endgenerate
	localparam [1:0] ibex_pkg_PMP_ACC_EXEC = 2'b00;
	localparam [1:0] ibex_pkg_PMP_ACC_READ = 2'b10;
	localparam [1:0] ibex_pkg_PMP_ACC_WRITE = 2'b01;
	localparam [1:0] ibex_pkg_PMP_MODE_NA4 = 2'b10;
	localparam [1:0] ibex_pkg_PMP_MODE_OFF = 2'b00;
	localparam [1:0] ibex_pkg_PRIV_LVL_M = 2'b11;
	generate
		genvar c;
		for (c = 0; c < PMPNumChan; c = c + 1) begin : g_access_check
			for (r = 0; r < PMPNumRegions; r = r + 1) begin : g_regions
				assign region_match_eq[(c * PMPNumRegions) + r] = (pmp_req_addr_i[((0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 34) + (33 >= (PMPGranularity + 2) ? 33 : (33 + (33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)) - 1)-:(33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)] & region_addr_mask[r]) == (region_start_addr[r][33:PMPGranularity + 2] & region_addr_mask[r]);
				assign region_match_gt[(c * PMPNumRegions) + r] = pmp_req_addr_i[((0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 34) + (33 >= (PMPGranularity + 2) ? 33 : (33 + (33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)) - 1)-:(33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)] > region_start_addr[r][33:PMPGranularity + 2];
				assign region_match_lt[(c * PMPNumRegions) + r] = pmp_req_addr_i[((0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 34) + (33 >= (PMPGranularity + 2) ? 33 : (33 + (33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)) - 1)-:(33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)] < csr_pmp_addr_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 34) + (33 >= (PMPGranularity + 2) ? 33 : (33 + (33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)) - 1)-:(33 >= (PMPGranularity + 2) ? 34 - (PMPGranularity + 2) : PMPGranularity - 30)];
				always @(*) begin
					region_match_all[(c * PMPNumRegions) + r] = 1'b0;
					case (csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 4-:2])
						ibex_pkg_PMP_MODE_OFF: region_match_all[(c * PMPNumRegions) + r] = 1'b0;
						ibex_pkg_PMP_MODE_NA4: region_match_all[(c * PMPNumRegions) + r] = region_match_eq[(c * PMPNumRegions) + r];
						ibex_pkg_PMP_MODE_NAPOT: region_match_all[(c * PMPNumRegions) + r] = region_match_eq[(c * PMPNumRegions) + r];
						ibex_pkg_PMP_MODE_TOR: region_match_all[(c * PMPNumRegions) + r] = (region_match_eq[(c * PMPNumRegions) + r] | region_match_gt[(c * PMPNumRegions) + r]) & region_match_lt[(c * PMPNumRegions) + r];
						default: region_match_all[(c * PMPNumRegions) + r] = 1'b0;
					endcase
				end
				assign region_perm_check[(c * PMPNumRegions) + r] = (((pmp_req_type_i[(0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 2+:2] == ibex_pkg_PMP_ACC_EXEC) & csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 2]) | ((pmp_req_type_i[(0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 2+:2] == ibex_pkg_PMP_ACC_WRITE) & csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 1])) | ((pmp_req_type_i[(0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 2+:2] == ibex_pkg_PMP_ACC_READ) & csr_pmp_cfg_i[(0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6]);
			end
			always @(*) begin
				access_fault[c] = priv_mode_i[(0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 2+:2] != ibex_pkg_PRIV_LVL_M;
				begin : sv2v_autoblock_1
					reg signed [31:0] r;
					for (r = PMPNumRegions - 1; r >= 0; r = r - 1)
						if (region_match_all[(c * PMPNumRegions) + r])
							access_fault[c] = (priv_mode_i[(0 >= (PMPNumChan - 1) ? c : (PMPNumChan - 1) - c) * 2+:2] == ibex_pkg_PRIV_LVL_M ? csr_pmp_cfg_i[((0 >= (PMPNumRegions - 1) ? r : (PMPNumRegions - 1) - r) * 6) + 5] & ~region_perm_check[(c * PMPNumRegions) + r] : ~region_perm_check[(c * PMPNumRegions) + r]);
				end
			end
			assign pmp_req_err_o[c] = access_fault[c];
		end
	endgenerate
endmodule
module ibex_prefetch_buffer (
	clk_i,
	rst_ni,
	req_i,
	branch_i,
	branch_spec_i,
	predicted_branch_i,
	branch_mispredict_i,
	addr_i,
	ready_i,
	valid_o,
	rdata_o,
	addr_o,
	err_o,
	err_plus2_o,
	instr_req_o,
	instr_gnt_i,
	instr_addr_o,
	instr_rdata_i,
	instr_err_i,
	instr_pmp_err_i,
	instr_rvalid_i,
	busy_o
);
	parameter [0:0] BranchPredictor = 1'b0;
	input wire clk_i;
	input wire rst_ni;
	input wire req_i;
	input wire branch_i;
	input wire branch_spec_i;
	input wire predicted_branch_i;
	input wire branch_mispredict_i;
	input wire [31:0] addr_i;
	input wire ready_i;
	output wire valid_o;
	output wire [31:0] rdata_o;
	output wire [31:0] addr_o;
	output wire err_o;
	output wire err_plus2_o;
	output wire instr_req_o;
	input wire instr_gnt_i;
	output wire [31:0] instr_addr_o;
	input wire [31:0] instr_rdata_i;
	input wire instr_err_i;
	input wire instr_pmp_err_i;
	input wire instr_rvalid_i;
	output wire busy_o;
	localparam [31:0] NUM_REQS = 2;
	wire branch_suppress;
	wire valid_new_req;
	wire valid_req;
	wire valid_req_d;
	reg valid_req_q;
	wire discard_req_d;
	reg discard_req_q;
	wire gnt_or_pmp_err;
	wire rvalid_or_pmp_err;
	wire [NUM_REQS - 1:0] rdata_outstanding_n;
	wire [NUM_REQS - 1:0] rdata_outstanding_s;
	reg [NUM_REQS - 1:0] rdata_outstanding_q;
	wire [NUM_REQS - 1:0] branch_discard_n;
	wire [NUM_REQS - 1:0] branch_discard_s;
	reg [NUM_REQS - 1:0] branch_discard_q;
	wire [NUM_REQS - 1:0] rdata_pmp_err_n;
	wire [NUM_REQS - 1:0] rdata_pmp_err_s;
	reg [NUM_REQS - 1:0] rdata_pmp_err_q;
	wire [NUM_REQS - 1:0] rdata_outstanding_rev;
	wire [31:0] stored_addr_d;
	reg [31:0] stored_addr_q;
	wire stored_addr_en;
	wire [31:0] fetch_addr_d;
	reg [31:0] fetch_addr_q;
	wire fetch_addr_en;
	wire [31:0] branch_mispredict_addr;
	wire [31:0] instr_addr;
	wire [31:0] instr_addr_w_aligned;
	wire instr_or_pmp_err;
	wire fifo_valid;
	wire [31:0] fifo_addr;
	wire fifo_ready;
	wire fifo_clear;
	wire [NUM_REQS - 1:0] fifo_busy;
	wire valid_raw;
	wire [31:0] addr_next;
	wire branch_or_mispredict;
	assign busy_o = |rdata_outstanding_q | instr_req_o;
	assign branch_or_mispredict = branch_i | branch_mispredict_i;
	assign instr_or_pmp_err = instr_err_i | rdata_pmp_err_q[0];
	assign fifo_clear = branch_or_mispredict;
	generate
		genvar i;
		for (i = 0; i < NUM_REQS; i = i + 1) begin : gen_rd_rev
			assign rdata_outstanding_rev[i] = rdata_outstanding_q[(NUM_REQS - 1) - i];
		end
	endgenerate
	assign fifo_ready = ~&(fifo_busy | rdata_outstanding_rev);
	ibex_fetch_fifo #(.NUM_REQS(NUM_REQS)) fifo_i(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.clear_i(fifo_clear),
		.busy_o(fifo_busy),
		.in_valid_i(fifo_valid),
		.in_addr_i(fifo_addr),
		.in_rdata_i(instr_rdata_i),
		.in_err_i(instr_or_pmp_err),
		.out_valid_o(valid_raw),
		.out_ready_i(ready_i),
		.out_rdata_o(rdata_o),
		.out_addr_o(addr_o),
		.out_addr_next_o(addr_next),
		.out_err_o(err_o),
		.out_err_plus2_o(err_plus2_o)
	);
	assign branch_suppress = branch_spec_i & ~branch_i;
	assign valid_new_req = ((~branch_suppress & req_i) & (fifo_ready | branch_or_mispredict)) & ~rdata_outstanding_q[NUM_REQS - 1];
	assign valid_req = valid_req_q | valid_new_req;
	assign gnt_or_pmp_err = instr_gnt_i | instr_pmp_err_i;
	assign rvalid_or_pmp_err = rdata_outstanding_q[0] & (instr_rvalid_i | rdata_pmp_err_q[0]);
	assign valid_req_d = valid_req & ~gnt_or_pmp_err;
	assign discard_req_d = valid_req_q & (branch_or_mispredict | discard_req_q);
	assign stored_addr_en = (valid_new_req & ~valid_req_q) & ~gnt_or_pmp_err;
	assign stored_addr_d = instr_addr;
	always @(posedge clk_i)
		if (stored_addr_en)
			stored_addr_q <= stored_addr_d;
	generate
		if (BranchPredictor) begin : g_branch_predictor
			reg [31:0] branch_mispredict_addr_q;
			wire branch_mispredict_addr_en;
			assign branch_mispredict_addr_en = branch_i & predicted_branch_i;
			always @(posedge clk_i)
				if (branch_mispredict_addr_en)
					branch_mispredict_addr_q <= addr_next;
			assign branch_mispredict_addr = branch_mispredict_addr_q;
		end
		else begin : g_no_branch_predictor
			wire unused_predicted_branch;
			wire [31:0] unused_addr_next;
			assign unused_predicted_branch = predicted_branch_i;
			assign unused_addr_next = addr_next;
			assign branch_mispredict_addr = {32 {1'sb0}};
		end
	endgenerate
	assign fetch_addr_en = branch_or_mispredict | (valid_new_req & ~valid_req_q);
	assign fetch_addr_d = (branch_i ? addr_i : (branch_mispredict_i ? {branch_mispredict_addr[31:2], 2'b00} : {fetch_addr_q[31:2], 2'b00})) + {{29 {1'b0}}, valid_new_req & ~valid_req_q, 2'b00};
	always @(posedge clk_i)
		if (fetch_addr_en)
			fetch_addr_q <= fetch_addr_d;
	assign instr_addr = (valid_req_q ? stored_addr_q : (branch_spec_i ? addr_i : (branch_mispredict_i ? branch_mispredict_addr : fetch_addr_q)));
	assign instr_addr_w_aligned = {instr_addr[31:2], 2'b00};
	generate
		for (i = 0; i < NUM_REQS; i = i + 1) begin : g_outstanding_reqs
			if (i == 0) begin : g_req0
				assign rdata_outstanding_n[i] = (valid_req & gnt_or_pmp_err) | rdata_outstanding_q[i];
				assign branch_discard_n[i] = (((valid_req & gnt_or_pmp_err) & discard_req_d) | (branch_or_mispredict & rdata_outstanding_q[i])) | branch_discard_q[i];
				assign rdata_pmp_err_n[i] = ((valid_req & ~rdata_outstanding_q[i]) & instr_pmp_err_i) | rdata_pmp_err_q[i];
			end
			else begin : g_reqtop
				assign rdata_outstanding_n[i] = ((valid_req & gnt_or_pmp_err) & rdata_outstanding_q[i - 1]) | rdata_outstanding_q[i];
				assign branch_discard_n[i] = ((((valid_req & gnt_or_pmp_err) & discard_req_d) & rdata_outstanding_q[i - 1]) | (branch_or_mispredict & rdata_outstanding_q[i])) | branch_discard_q[i];
				assign rdata_pmp_err_n[i] = (((valid_req & ~rdata_outstanding_q[i]) & instr_pmp_err_i) & rdata_outstanding_q[i - 1]) | rdata_pmp_err_q[i];
			end
		end
	endgenerate
	assign rdata_outstanding_s = (rvalid_or_pmp_err ? {1'b0, rdata_outstanding_n[NUM_REQS - 1:1]} : rdata_outstanding_n);
	assign branch_discard_s = (rvalid_or_pmp_err ? {1'b0, branch_discard_n[NUM_REQS - 1:1]} : branch_discard_n);
	assign rdata_pmp_err_s = (rvalid_or_pmp_err ? {1'b0, rdata_pmp_err_n[NUM_REQS - 1:1]} : rdata_pmp_err_n);
	assign fifo_valid = rvalid_or_pmp_err & ~branch_discard_q[0];
	assign fifo_addr = (branch_mispredict_i ? branch_mispredict_addr : addr_i);
	always @(posedge clk_i or negedge rst_ni)
		if (!rst_ni) begin
			valid_req_q <= 1'b0;
			discard_req_q <= 1'b0;
			rdata_outstanding_q <= 'b0;
			branch_discard_q <= 'b0;
			rdata_pmp_err_q <= 'b0;
		end
		else begin
			valid_req_q <= valid_req_d;
			discard_req_q <= discard_req_d;
			rdata_outstanding_q <= rdata_outstanding_s;
			branch_discard_q <= branch_discard_s;
			rdata_pmp_err_q <= rdata_pmp_err_s;
		end
	assign instr_req_o = valid_req;
	assign instr_addr_o = instr_addr_w_aligned;
	assign valid_o = valid_raw & ~branch_mispredict_i;
endmodule
module ibex_register_file_ff (
	clk_i,
	rst_ni,
	test_en_i,
	dummy_instr_id_i,
	raddr_a_i,
	rdata_a_o,
	raddr_b_i,
	rdata_b_o,
	waddr_a_i,
	wdata_a_i,
	we_a_i
);
	parameter [0:0] RV32E = 0;
	parameter [31:0] DataWidth = 32;
	parameter [0:0] DummyInstructions = 0;
	input wire clk_i;
	input wire rst_ni;
	input wire test_en_i;
	input wire dummy_instr_id_i;
	input wire [4:0] raddr_a_i;
	output wire [DataWidth - 1:0] rdata_a_o;
	input wire [4:0] raddr_b_i;
	output wire [DataWidth - 1:0] rdata_b_o;
	input wire [4:0] waddr_a_i;
	input wire [DataWidth - 1:0] wdata_a_i;
	input wire we_a_i;
	localparam [31:0] ADDR_WIDTH = (RV32E ? 4 : 5);
	localparam [31:0] NUM_WORDS = 2 ** ADDR_WIDTH;
	wire [(NUM_WORDS * DataWidth) - 1:0] rf_reg;
	reg [((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) * DataWidth) + (DataWidth - 1) : ((3 - NUM_WORDS) * DataWidth) + (((NUM_WORDS - 1) * DataWidth) - 1)):((NUM_WORDS - 1) >= 1 ? DataWidth : (NUM_WORDS - 1) * DataWidth)] rf_reg_q;
	reg [NUM_WORDS - 1:1] we_a_dec;
	function automatic [4:0] sv2v_cast_5;
		input reg [4:0] inp;
		sv2v_cast_5 = inp;
	endfunction
	always @(*) begin : we_a_decoder
		begin : sv2v_autoblock_2
			reg [31:0] i;
			for (i = 1; i < NUM_WORDS; i = i + 1)
				we_a_dec[i] = (waddr_a_i == sv2v_cast_5(i) ? we_a_i : 1'b0);
		end
	end
	generate
		genvar i;
		for (i = 1; i < NUM_WORDS; i = i + 1) begin : g_rf_flops
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					rf_reg_q[((NUM_WORDS - 1) >= 1 ? i : 1 - (i - (NUM_WORDS - 1))) * DataWidth+:DataWidth] <= {DataWidth {1'sb0}};
				else if (we_a_dec[i])
					rf_reg_q[((NUM_WORDS - 1) >= 1 ? i : 1 - (i - (NUM_WORDS - 1))) * DataWidth+:DataWidth] <= wdata_a_i;
		end
	endgenerate
	generate
		if (DummyInstructions) begin : g_dummy_r0
			wire we_r0_dummy;
			reg [DataWidth - 1:0] rf_r0_q;
			assign we_r0_dummy = we_a_i & dummy_instr_id_i;
			always @(posedge clk_i or negedge rst_ni)
				if (!rst_ni)
					rf_r0_q <= {DataWidth {1'sb0}};
				else if (we_r0_dummy)
					rf_r0_q <= wdata_a_i;
			assign rf_reg[0+:DataWidth] = (dummy_instr_id_i ? rf_r0_q : {DataWidth {1'sb0}});
		end
		else begin : g_normal_r0
			wire unused_dummy_instr_id;
			assign unused_dummy_instr_id = dummy_instr_id_i;
			assign rf_reg[0+:DataWidth] = {DataWidth {1'sb0}};
		end
	endgenerate
	assign rf_reg[DataWidth * (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1) - (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS) - 1))+:DataWidth * ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)] = rf_reg_q[DataWidth * ((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1) - (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS) - 1) : ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1)) : 1 - (((NUM_WORDS - 1) >= 1 ? ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1) - (((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS) - 1) : ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : ((NUM_WORDS - 1) + ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)) - 1)) - (NUM_WORDS - 1)))+:DataWidth * ((NUM_WORDS - 1) >= 1 ? NUM_WORDS - 1 : 3 - NUM_WORDS)];
	assign rdata_a_o = rf_reg[raddr_a_i * DataWidth+:DataWidth];
	assign rdata_b_o = rf_reg[raddr_b_i * DataWidth+:DataWidth];
	wire unused_test_en;
	assign unused_test_en = test_en_i;
endmodule
module ibex_register_file_fpga (
	clk_i,
	rst_ni,
	test_en_i,
	dummy_instr_id_i,
	raddr_a_i,
	rdata_a_o,
	raddr_b_i,
	rdata_b_o,
	waddr_a_i,
	wdata_a_i,
	we_a_i
);
	parameter [0:0] RV32E = 0;
	parameter [31:0] DataWidth = 32;
	parameter [0:0] DummyInstructions = 0;
	input wire clk_i;
	input wire rst_ni;
	input wire test_en_i;
	input wire dummy_instr_id_i;
	input wire [4:0] raddr_a_i;
	output wire [DataWidth - 1:0] rdata_a_o;
	input wire [4:0] raddr_b_i;
	output wire [DataWidth - 1:0] rdata_b_o;
	input wire [4:0] waddr_a_i;
	input wire [DataWidth - 1:0] wdata_a_i;
	input wire we_a_i;
	localparam signed [31:0] ADDR_WIDTH = (RV32E ? 4 : 5);
	localparam signed [31:0] NUM_WORDS = 2 ** ADDR_WIDTH;
	reg [DataWidth - 1:0] mem [0:NUM_WORDS - 1];
	wire we;
	assign rdata_a_o = (raddr_a_i == {5 {1'sb0}} ? {DataWidth {1'sb0}} : mem[raddr_a_i]);
	assign rdata_b_o = (raddr_b_i == {5 {1'sb0}} ? {DataWidth {1'sb0}} : mem[raddr_b_i]);
	assign we = (waddr_a_i == {5 {1'sb0}} ? 1'b0 : we_a_i);
	always @(posedge clk_i) begin : sync_write
		if (we == 1'b1)
			mem[waddr_a_i] <= wdata_a_i;
	end
	wire unused_rst_ni;
	assign unused_rst_ni = rst_ni;
	wire unused_dummy_instr;
	assign unused_dummy_instr = dummy_instr_id_i;
	wire unused_test_en;
	assign unused_test_en = test_en_i;
endmodule
module ibex_register_file_latch (
	clk_i,
	rst_ni,
	test_en_i,
	dummy_instr_id_i,
	raddr_a_i,
	rdata_a_o,
	raddr_b_i,
	rdata_b_o,
	waddr_a_i,
	wdata_a_i,
	we_a_i
);
	parameter [0:0] RV32E = 0;
	parameter [31:0] DataWidth = 32;
	parameter [0:0] DummyInstructions = 0;
	input wire clk_i;
	input wire rst_ni;
	input wire test_en_i;
	input wire dummy_instr_id_i;
	input wire [4:0] raddr_a_i;
	output wire [DataWidth - 1:0] rdata_a_o;
	input wire [4:0] raddr_b_i;
	output wire [DataWidth - 1:0] rdata_b_o;
	input wire [4:0] waddr_a_i;
	input wire [DataWidth - 1:0] wdata_a_i;
	input wire we_a_i;
	localparam [31:0] ADDR_WIDTH = (RV32E ? 4 : 5);
	localparam [31:0] NUM_WORDS = 2 ** ADDR_WIDTH;
	reg [DataWidth - 1:0] mem [0:NUM_WORDS - 1];
	reg [NUM_WORDS - 1:1] waddr_onehot_a;
	wire [NUM_WORDS - 1:1] mem_clocks;
	reg [DataWidth - 1:0] wdata_a_q;
	wire [ADDR_WIDTH - 1:0] raddr_a_int;
	wire [ADDR_WIDTH - 1:0] raddr_b_int;
	wire [ADDR_WIDTH - 1:0] waddr_a_int;
	assign raddr_a_int = raddr_a_i[ADDR_WIDTH - 1:0];
	assign raddr_b_int = raddr_b_i[ADDR_WIDTH - 1:0];
	assign waddr_a_int = waddr_a_i[ADDR_WIDTH - 1:0];
	wire clk_int;
	assign rdata_a_o = mem[raddr_a_int];
	assign rdata_b_o = mem[raddr_b_int];
	prim_clock_gating cg_we_global(
		.clk_i(clk_i),
		.en_i(we_a_i),
		.test_en_i(test_en_i),
		.clk_o(clk_int)
	);
	always @(posedge clk_int or negedge rst_ni) begin : sample_wdata
		if (!rst_ni)
			wdata_a_q <= {DataWidth {1'sb0}};
		else if (we_a_i)
			wdata_a_q <= wdata_a_i;
	end
	function automatic signed [4:0] sv2v_cast_5_signed;
		input reg signed [4:0] inp;
		sv2v_cast_5_signed = inp;
	endfunction
	always @(*) begin : wad
		begin : sv2v_autoblock_5
			reg signed [31:0] i;
			for (i = 1; i < NUM_WORDS; i = i + 1)
				begin : wad_word_iter
					if (we_a_i && (waddr_a_int == sv2v_cast_5_signed(i)))
						waddr_onehot_a[i] = 1'b1;
					else
						waddr_onehot_a[i] = 1'b0;
				end
		end
	end
	generate
		genvar x;
		for (x = 1; x < NUM_WORDS; x = x + 1) begin : gen_cg_word_iter
			prim_clock_gating cg_i(
				.clk_i(clk_int),
				.en_i(waddr_onehot_a[x]),
				.test_en_i(test_en_i),
				.clk_o(mem_clocks[x])
			);
		end
	endgenerate
	generate
		genvar i;
		for (i = 1; i < NUM_WORDS; i = i + 1) begin : g_rf_latches
			always @(*)
				if (mem_clocks[i])
					mem[i] = wdata_a_q;
		end
	endgenerate
	generate
		if (DummyInstructions) begin : g_dummy_r0
			wire we_r0_dummy;
			wire r0_clock;
			reg [DataWidth - 1:0] mem_r0;
			assign we_r0_dummy = we_a_i & dummy_instr_id_i;
			prim_clock_gating cg_i(
				.clk_i(clk_int),
				.en_i(we_r0_dummy),
				.test_en_i(test_en_i),
				.clk_o(r0_clock)
			);
			always @(*) begin : latch_wdata
				if (r0_clock)
					mem_r0 = wdata_a_q;
			end
			wire [(DataWidth >= DataWidth ? DataWidth : DataWidth):1] sv2v_tmp_22903;
			assign sv2v_tmp_22903 = (dummy_instr_id_i ? mem_r0 : {DataWidth {1'sb0}});
			always @(*) mem[0] = sv2v_tmp_22903;
		end
		else begin : g_normal_r0
			wire unused_dummy_instr_id;
			assign unused_dummy_instr_id = dummy_instr_id_i;
			wire [DataWidth:1] sv2v_tmp_F0978;
			assign sv2v_tmp_F0978 = {DataWidth {1'sb0}};
			always @(*) mem[0] = sv2v_tmp_F0978;
		end
	endgenerate
endmodule
module ibex_wb_stage (
	clk_i,
	rst_ni,
	en_wb_i,
	instr_type_wb_i,
	pc_id_i,
	instr_is_compressed_id_i,
	instr_perf_count_id_i,
	ready_wb_o,
	rf_write_wb_o,
	outstanding_load_wb_o,
	outstanding_store_wb_o,
	pc_wb_o,
	perf_instr_ret_wb_o,
	perf_instr_ret_compressed_wb_o,
	rf_waddr_id_i,
	rf_wdata_id_i,
	rf_we_id_i,
	rf_wdata_lsu_i,
	rf_we_lsu_i,
	rf_wdata_fwd_wb_o,
	rf_waddr_wb_o,
	rf_wdata_wb_o,
	rf_we_wb_o,
	lsu_resp_valid_i,
	lsu_resp_err_i,
	instr_done_wb_o
);
	parameter [0:0] WritebackStage = 1'b0;
	input wire clk_i;
	input wire rst_ni;
	input wire en_wb_i;
	input wire [1:0] instr_type_wb_i;
	input wire [31:0] pc_id_i;
	input wire instr_is_compressed_id_i;
	input wire instr_perf_count_id_i;
	output wire ready_wb_o;
	output wire rf_write_wb_o;
	output wire outstanding_load_wb_o;
	output wire outstanding_store_wb_o;
	output wire [31:0] pc_wb_o;
	output wire perf_instr_ret_wb_o;
	output wire perf_instr_ret_compressed_wb_o;
	input wire [4:0] rf_waddr_id_i;
	input wire [31:0] rf_wdata_id_i;
	input wire rf_we_id_i;
	input wire [31:0] rf_wdata_lsu_i;
	input wire rf_we_lsu_i;
	output wire [31:0] rf_wdata_fwd_wb_o;
	output wire [4:0] rf_waddr_wb_o;
	output wire [31:0] rf_wdata_wb_o;
	output wire rf_we_wb_o;
	input wire lsu_resp_valid_i;
	input wire lsu_resp_err_i;
	output wire instr_done_wb_o;
	wire [31:0] rf_wdata_wb_mux [0:1];
	wire [1:0] rf_wdata_wb_mux_we;
	localparam [1:0] ibex_pkg_WB_INSTR_LOAD = 0;
	localparam [1:0] ibex_pkg_WB_INSTR_OTHER = 2;
	localparam [1:0] ibex_pkg_WB_INSTR_STORE = 1;
	generate
		if (WritebackStage) begin : g_writeback_stage
			reg [31:0] rf_wdata_wb_q;
			reg rf_we_wb_q;
			reg [4:0] rf_waddr_wb_q;
			wire wb_done;
			reg wb_valid_q;
			reg [31:0] wb_pc_q;
			reg wb_compressed_q;
			reg wb_count_q;
			reg [1:0] wb_instr_type_q;
			wire wb_valid_d;
			assign wb_valid_d = (en_wb_i & ready_wb_o) | (wb_valid_q & ~wb_done);
			assign wb_done = (wb_instr_type_q == ibex_pkg_WB_INSTR_OTHER) | lsu_resp_valid_i;
			always @(posedge clk_i or negedge rst_ni)
				if (~rst_ni)
					wb_valid_q <= 1'b0;
				else
					wb_valid_q <= wb_valid_d;
			always @(posedge clk_i)
				if (en_wb_i) begin
					rf_we_wb_q <= rf_we_id_i;
					rf_waddr_wb_q <= rf_waddr_id_i;
					rf_wdata_wb_q <= rf_wdata_id_i;
					wb_instr_type_q <= instr_type_wb_i;
					wb_pc_q <= pc_id_i;
					wb_compressed_q <= instr_is_compressed_id_i;
					wb_count_q <= instr_perf_count_id_i;
				end
			assign rf_waddr_wb_o = rf_waddr_wb_q;
			assign rf_wdata_wb_mux[0] = rf_wdata_wb_q;
			assign rf_wdata_wb_mux_we[0] = rf_we_wb_q & wb_valid_q;
			assign ready_wb_o = ~wb_valid_q | wb_done;
			assign rf_write_wb_o = wb_valid_q & (rf_we_wb_q | (wb_instr_type_q == ibex_pkg_WB_INSTR_LOAD));
			assign outstanding_load_wb_o = wb_valid_q & (wb_instr_type_q == ibex_pkg_WB_INSTR_LOAD);
			assign outstanding_store_wb_o = wb_valid_q & (wb_instr_type_q == ibex_pkg_WB_INSTR_STORE);
			assign pc_wb_o = wb_pc_q;
			assign instr_done_wb_o = wb_valid_q & wb_done;
			assign perf_instr_ret_wb_o = (instr_done_wb_o & wb_count_q) & ~(lsu_resp_valid_i & lsu_resp_err_i);
			assign perf_instr_ret_compressed_wb_o = perf_instr_ret_wb_o & wb_compressed_q;
			assign rf_wdata_fwd_wb_o = rf_wdata_wb_q;
		end
		else begin : g_bypass_wb
			assign rf_waddr_wb_o = rf_waddr_id_i;
			assign rf_wdata_wb_mux[0] = rf_wdata_id_i;
			assign rf_wdata_wb_mux_we[0] = rf_we_id_i;
			assign perf_instr_ret_wb_o = (instr_perf_count_id_i & en_wb_i) & ~(lsu_resp_valid_i & lsu_resp_err_i);
			assign perf_instr_ret_compressed_wb_o = perf_instr_ret_wb_o & instr_is_compressed_id_i;
			assign ready_wb_o = 1'b1;
			wire unused_clk;
			wire unused_rst;
			wire [1:0] unused_instr_type_wb;
			wire [31:0] unused_pc_id;
			assign unused_clk = clk_i;
			assign unused_rst = rst_ni;
			assign unused_instr_type_wb = instr_type_wb_i;
			assign unused_pc_id = pc_id_i;
			assign outstanding_load_wb_o = 1'b0;
			assign outstanding_store_wb_o = 1'b0;
			assign pc_wb_o = {32 {1'sb0}};
			assign rf_write_wb_o = 1'b0;
			assign rf_wdata_fwd_wb_o = 32'b00000000000000000000000000000000;
			assign instr_done_wb_o = 1'b0;
		end
	endgenerate
	assign rf_wdata_wb_mux[1] = rf_wdata_lsu_i;
	assign rf_wdata_wb_mux_we[1] = rf_we_lsu_i;
	assign rf_wdata_wb_o = (rf_wdata_wb_mux_we[0] ? rf_wdata_wb_mux[0] : rf_wdata_wb_mux[1]);
	assign rf_we_wb_o = |rf_wdata_wb_mux_we;
endmodule
module prim_badbit_ram_1p (
	clk_i,
	req_i,
	write_i,
	addr_i,
	wdata_i,
	wmask_i,
	rdata_o
);
	parameter signed [31:0] Width = 32;
	parameter signed [31:0] Depth = 128;
	parameter signed [31:0] DataBitsPerMask = 1;
	parameter _sv2v_width_MemInitFile = 1;
	parameter [_sv2v_width_MemInitFile - 1:0] MemInitFile = "";
	localparam signed [31:0] Aw = $clog2(Depth);
	input wire clk_i;
	input wire req_i;
	input wire write_i;
	input wire [Aw - 1:0] addr_i;
	input wire [Width - 1:0] wdata_i;
	input wire [Width - 1:0] wmask_i;
	output wire [Width - 1:0] rdata_o;
	wire [Width - 1:0] sram_rdata;
	prim_generic_ram_1p #(
		.Width(Width),
		.Depth(Depth),
		.DataBitsPerMask(DataBitsPerMask),
		.MemInitFile(MemInitFile)
	) u_mem(
		.clk_i(clk_i),
		.req_i(req_i),
		.write_i(write_i),
		.addr_i(addr_i),
		.wdata_i(wdata_i),
		.wmask_i(wmask_i),
		.rdata_o(sram_rdata)
	);
	wire [31:0] width;
	assign width = Width;
	wire [31:0] addr;
	wire [127:0] wdata;
	wire [127:0] wmask;
	wire [127:0] rdata;
	assign addr = {{32 - Aw {1'b0}}, addr_i};
	assign wdata = {{128 - Width {1'b0}}, wdata_i};
	assign wmask = {{128 - Width {1'b0}}, wmask_i};
	assign rdata = {{128 - Width {1'b0}}, sram_rdata};
	wor [127:0] bad_bit_mask;
	assign bad_bit_mask = 128'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
	assign rdata_o = sram_rdata ^ bad_bit_mask;
endmodule
// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Example clock gating module for yosys synthesis

module prim_clock_gating (
  input  clk_i,
  input  en_i,
  input  test_en_i,
  output clk_o
);

  reg en_latch;

  always @* begin
    if (!clk_i) begin
      en_latch = en_i | test_en_i;
    end
  end
  assign clk_o = en_latch & clk_i;

endmodule
module prim_generic_clock_gating (
	clk_i,
	en_i,
	test_en_i,
	clk_o
);
	input clk_i;
	input en_i;
	input test_en_i;
	output wire clk_o;
	reg en_latch;
	always @(*)
		if (!clk_i)
			en_latch = en_i | test_en_i;
	assign clk_o = en_latch & clk_i;
endmodule
module prim_generic_ram_1p (
	clk_i,
	req_i,
	write_i,
	addr_i,
	wdata_i,
	wmask_i,
	rdata_o
);
	parameter signed [31:0] Width = 32;
	parameter signed [31:0] Depth = 128;
	parameter signed [31:0] DataBitsPerMask = 1;
	parameter _sv2v_width_MemInitFile = 1;
	parameter [_sv2v_width_MemInitFile - 1:0] MemInitFile = "";
	localparam signed [31:0] Aw = $clog2(Depth);
	input wire clk_i;
	input wire req_i;
	input wire write_i;
	input wire [Aw - 1:0] addr_i;
	input wire [Width - 1:0] wdata_i;
	input wire [Width - 1:0] wmask_i;
	output reg [Width - 1:0] rdata_o;
	localparam signed [31:0] MaskWidth = Width / DataBitsPerMask;
	reg [Width - 1:0] mem [0:Depth - 1];
	wire [MaskWidth - 1:0] wmask;
	generate
		genvar k;
		for (k = 0; k < MaskWidth; k = k + 1) begin : gen_wmask
			assign wmask[k] = &wmask_i[k * DataBitsPerMask+:DataBitsPerMask];
		end
	endgenerate
	always @(posedge clk_i)
		if (req_i)
			if (write_i) begin : sv2v_autoblock_2
				reg signed [31:0] i;
				for (i = 0; i < MaskWidth; i = i + 1)
					if (wmask[i])
						mem[addr_i][i * DataBitsPerMask+:DataBitsPerMask] <= wdata_i[i * DataBitsPerMask+:DataBitsPerMask];
			end
			else
				rdata_o <= mem[addr_i];
	initial if (MemInitFile != "") begin : gen_meminit
		$display("Initializing memory %m from file '%s'.", MemInitFile);
		$readmemh(MemInitFile, mem);
	end
endmodule
module prim_lfsr (
	clk_i,
	rst_ni,
	seed_en_i,
	seed_i,
	lfsr_en_i,
	entropy_i,
	state_o
);
	parameter _sv2v_width_LfsrType = 56;
	parameter [_sv2v_width_LfsrType - 1:0] LfsrType = "GAL_XOR";
	parameter [31:0] LfsrDw = 32;
	parameter [31:0] EntropyDw = 8;
	parameter [31:0] StateOutDw = 8;
	function automatic signed [LfsrDw - 1:0] sv2v_cast_FFBD2_signed;
		input reg signed [LfsrDw - 1:0] inp;
		sv2v_cast_FFBD2_signed = inp;
	endfunction
	parameter [LfsrDw - 1:0] DefaultSeed = sv2v_cast_FFBD2_signed(1);
	parameter [LfsrDw - 1:0] CustomCoeffs = 1'sb0;
	parameter [0:0] MaxLenSVA = 1'b1;
	parameter [0:0] LockupSVA = 1'b1;
	parameter [0:0] ExtSeedSVA = 1'b1;
	input clk_i;
	input rst_ni;
	input seed_en_i;
	input [LfsrDw - 1:0] seed_i;
	input lfsr_en_i;
	input [EntropyDw - 1:0] entropy_i;
	output wire [StateOutDw - 1:0] state_o;
	localparam [31:0] GAL_XOR_LUT_OFF = 4;
	localparam [3903:0] GAL_XOR_COEFFS = {64'h0000000000000009, 64'h0000000000000012, 64'h0000000000000021, 64'h0000000000000041, 64'h000000000000008e, 64'h0000000000000108, 64'h0000000000000204, 64'h0000000000000402, 64'h0000000000000829, 64'h000000000000100d, 64'h0000000000002015, 64'h0000000000004001, 64'h0000000000008016, 64'h0000000000010004, 64'h0000000000020013, 64'h0000000000040013, 64'h0000000000080004, 64'h0000000000100002, 64'h0000000000200001, 64'h0000000000400010, 64'h000000000080000d, 64'h0000000001000004, 64'h0000000002000023, 64'h0000000004000013, 64'h0000000008000004, 64'h0000000010000002, 64'h0000000020000029, 64'h0000000040000004, 64'h0000000080000057, 64'h0000000100000029, 64'h0000000200000073, 64'h0000000400000002, 64'h000000080000003b, 64'h000000100000001f, 64'h0000002000000031, 64'h0000004000000008, 64'h000000800000001c, 64'h0000010000000004, 64'h000002000000001f, 64'h000004000000002c, 64'h0000080000000032, 64'h000010000000000d, 64'h0000200000000097, 64'h0000400000000010, 64'h000080000000005b, 64'h0001000000000038, 64'h000200000000000e, 64'h0004000000000025, 64'h0008000000000004, 64'h0010000000000023, 64'h002000000000003e, 64'h0040000000000023, 64'h008000000000004a, 64'h0100000000000016, 64'h0200000000000031, 64'h040000000000003d, 64'h0800000000000001, 64'h1000000000000013, 64'h2000000000000034, 64'h4000000000000001, 64'h800000000000000d};
	localparam [31:0] FIB_XNOR_LUT_OFF = 3;
	localparam [27887:0] FIB_XNOR_COEFFS = {168'h000000000000000000000000000000000000000006, 168'h00000000000000000000000000000000000000000c, 168'h000000000000000000000000000000000000000014, 168'h000000000000000000000000000000000000000030, 168'h000000000000000000000000000000000000000060, 168'h0000000000000000000000000000000000000000b8, 168'h000000000000000000000000000000000000000110, 168'h000000000000000000000000000000000000000240, 168'h000000000000000000000000000000000000000500, 168'h000000000000000000000000000000000000000829, 168'h00000000000000000000000000000000000000100d, 168'h000000000000000000000000000000000000002015, 168'h000000000000000000000000000000000000006000, 168'h00000000000000000000000000000000000000d008, 168'h000000000000000000000000000000000000012000, 168'h000000000000000000000000000000000000020400, 168'h000000000000000000000000000000000000040023, 168'h000000000000000000000000000000000000090000, 168'h000000000000000000000000000000000000140000, 168'h000000000000000000000000000000000000300000, 168'h000000000000000000000000000000000000420000, 168'h000000000000000000000000000000000000e10000, 168'h000000000000000000000000000000000001200000, 168'h000000000000000000000000000000000002000023, 168'h000000000000000000000000000000000004000013, 168'h000000000000000000000000000000000009000000, 168'h000000000000000000000000000000000014000000, 168'h000000000000000000000000000000000020000029, 168'h000000000000000000000000000000000048000000, 168'h000000000000000000000000000000000080200003, 168'h000000000000000000000000000000000100080000, 168'h000000000000000000000000000000000204000003, 168'h000000000000000000000000000000000500000000, 168'h000000000000000000000000000000000801000000, 168'h00000000000000000000000000000000100000001f, 168'h000000000000000000000000000000002000000031, 168'h000000000000000000000000000000004400000000, 168'h00000000000000000000000000000000a000140000, 168'h000000000000000000000000000000012000000000, 168'h0000000000000000000000000000000300000c0000, 168'h000000000000000000000000000000063000000000, 168'h0000000000000000000000000000000c0000030000, 168'h0000000000000000000000000000001b0000000000, 168'h000000000000000000000000000000300003000000, 168'h000000000000000000000000000000420000000000, 168'h000000000000000000000000000000c00000180000, 168'h000000000000000000000000000001008000000000, 168'h000000000000000000000000000003000000c00000, 168'h000000000000000000000000000006000c00000000, 168'h000000000000000000000000000009000000000000, 168'h000000000000000000000000000018003000000000, 168'h000000000000000000000000000030000000030000, 168'h000000000000000000000000000040000040000000, 168'h0000000000000000000000000000c0000600000000, 168'h000000000000000000000000000102000000000000, 168'h000000000000000000000000000200004000000000, 168'h000000000000000000000000000600003000000000, 168'h000000000000000000000000000c00000000000000, 168'h000000000000000000000000001800300000000000, 168'h000000000000000000000000003000000000000030, 168'h000000000000000000000000006000000000000000, 168'h00000000000000000000000000d800000000000000, 168'h000000000000000000000000010000400000000000, 168'h000000000000000000000000030180000000000000, 168'h000000000000000000000000060300000000000000, 168'h000000000000000000000000080400000000000000, 168'h000000000000000000000000140000028000000000, 168'h000000000000000000000000300060000000000000, 168'h000000000000000000000000410000000000000000, 168'h000000000000000000000000820000000001040000, 168'h000000000000000000000001000000800000000000, 168'h000000000000000000000003000600000000000000, 168'h000000000000000000000006018000000000000000, 168'h00000000000000000000000c000000018000000000, 168'h000000000000000000000018000000600000000000, 168'h000000000000000000000030000600000000000000, 168'h000000000000000000000040200000000000000000, 168'h0000000000000000000000c0000000060000000000, 168'h000000000000000000000110000000000000000000, 168'h000000000000000000000240000000480000000000, 168'h000000000000000000000600000000003000000000, 168'h000000000000000000000800400000000000000000, 168'h000000000000000000001800000300000000000000, 168'h000000000000000000003003000000000000000000, 168'h000000000000000000004002000000000000000000, 168'h00000000000000000000c000000000000000018000, 168'h000000000000000000010000000004000000000000, 168'h000000000000000000030000c00000000000000000, 168'h0000000000000000000600000000000000000000c0, 168'h0000000000000000000c00c0000000000000000000, 168'h000000000000000000140000000000000000000000, 168'h000000000000000000200001000000000000000000, 168'h000000000000000000400800000000000000000000, 168'h000000000000000000a00000000001400000000000, 168'h000000000000000001040000000000000000000000, 168'h000000000000000002004000000000000000000000, 168'h000000000000000005000000000028000000000000, 168'h000000000000000008000000004000000000000000, 168'h000000000000000018600000000000000000000000, 168'h000000000000000030000000000000000c00000000, 168'h000000000000000040200000000000000000000000, 168'h0000000000000000c0300000000000000000000000, 168'h000000000000000100010000000000000000000000, 168'h000000000000000200040000000000000000000000, 168'h0000000000000005000000000000000a0000000000, 168'h000000000000000800000010000000000000000000, 168'h000000000000001860000000000000000000000000, 168'h000000000000003003000000000000000000000000, 168'h000000000000004010000000000000000000000000, 168'h00000000000000a000000000140000000000000000, 168'h000000000000010080000000000000000000000000, 168'h000000000000030000000000000000000180000000, 168'h000000000000060018000000000000000000000000, 168'h0000000000000c0000000000000000300000000000, 168'h000000000000140005000000000000000000000000, 168'h000000000000200000001000000000000000000000, 168'h000000000000404000000000000000000000000000, 168'h000000000000810000000000000000000000000102, 168'h000000000001000040000000000000000000000000, 168'h000000000003000000000000006000000000000000, 168'h000000000005000000000000000000000000000000, 168'h000000000008000000004000000000000000000000, 168'h000000000018000000000000000000000000030000, 168'h000000000030000000030000000000000000000000, 168'h000000000060000000000000000000000000000000, 168'h0000000000a0000014000000000000000000000000, 168'h000000000108000000000000000000000000000000, 168'h000000000240000000000000000000000000000000, 168'h000000000600000000000c00000000000000000000, 168'h000000000800000040000000000000000000000000, 168'h000000001800000000000300000000000000000000, 168'h000000002000000000000010000000000000000000, 168'h000000004008000000000000000000000000000000, 168'h00000000c000000000000000000000000000000600, 168'h000000010000080000000000000000000000000000, 168'h000000030600000000000000000000000000000000, 168'h00000004a400000000000000000000000000000000, 168'h000000080000004000000000000000000000000000, 168'h000000180000003000000000000000000000000000, 168'h000000200001000000000000000000000000000000, 168'h000000600006000000000000000000000000000000, 168'h000000c00000000000000006000000000000000000, 168'h000001000000000000100000000000000000000000, 168'h000003000000000000006000000000000000000000, 168'h000006000000003000000000000000000000000000, 168'h000008000001000000000000000000000000000000, 168'h00001800000000000000000000000000c000000000, 168'h000020000000000001000000000000000000000000, 168'h000048000000000000000000000000000000000000, 168'h0000c0000000000000006000000000000000000000, 168'h000180000000000000000000000000000000000000, 168'h000280000000000000000000000000000005000000, 168'h00060000000c000000000000000000000000000000, 168'h000c00000000000000000000000000018000000000, 168'h001800000600000000000000000000000000000000, 168'h003000000c00000000000000000000000000000000, 168'h004000000080000000000000000000000000000000, 168'h00c000300000000000000000000000000000000000, 168'h010000400000000000000000000000000000000000, 168'h030000000000000000000006000000000000000000, 168'h0600000000000000c0000000000000000000000000, 168'h0c0060000000000000000000000000000000000000, 168'h180000006000000000000000000000000000000000, 168'h3000000000c0000000000000000000000000000000, 168'h410000000000000000000000000000000000000000, 168'ha00140000000000000000000000000000000000000};
	wire lockup;
	wire [LfsrDw - 1:0] lfsr_d;
	reg [LfsrDw - 1:0] lfsr_q;
	wire [LfsrDw - 1:0] next_lfsr_state;
	wire [LfsrDw - 1:0] coeffs;
	generate
		function automatic [63:0] sv2v_cast_64;
			input reg [63:0] inp;
			sv2v_cast_64 = inp;
		endfunction
		if (sv2v_cast_64(LfsrType) == sv2v_cast_64("GAL_XOR")) begin : gen_gal_xor
			if (CustomCoeffs > 0) begin : gen_custom
				assign coeffs = CustomCoeffs[LfsrDw - 1:0];
			end
			else begin : gen_lut
				assign coeffs = GAL_XOR_COEFFS[((60 - (LfsrDw - GAL_XOR_LUT_OFF)) * 64) + (LfsrDw - 1)-:LfsrDw];
			end
			function automatic [LfsrDw - 1:0] sv2v_cast_FFBD2;
				input reg [LfsrDw - 1:0] inp;
				sv2v_cast_FFBD2 = inp;
			endfunction
			assign next_lfsr_state = (sv2v_cast_FFBD2(entropy_i) ^ ({LfsrDw {lfsr_q[0]}} & coeffs)) ^ (lfsr_q >> 1);
			assign lockup = ~(|lfsr_q);
		end
		else begin
			function automatic [63:0] sv2v_cast_64;
				input reg [63:0] inp;
				sv2v_cast_64 = inp;
			endfunction
			if (sv2v_cast_64(LfsrType) == "FIB_XNOR") begin : gen_fib_xnor
				if (CustomCoeffs > 0) begin : gen_custom
					assign coeffs = CustomCoeffs[LfsrDw - 1:0];
				end
				else begin : gen_lut
					assign coeffs = FIB_XNOR_COEFFS[((165 - (LfsrDw - FIB_XNOR_LUT_OFF)) * 168) + (LfsrDw - 1)-:LfsrDw];
				end
				function automatic [LfsrDw - 1:0] sv2v_cast_FFBD2;
					input reg [LfsrDw - 1:0] inp;
					sv2v_cast_FFBD2 = inp;
				endfunction
				assign next_lfsr_state = sv2v_cast_FFBD2(entropy_i) ^ {lfsr_q[LfsrDw - 2:0], ~(^(lfsr_q & coeffs))};
				assign lockup = &lfsr_q;
			end
		end
	endgenerate
	assign lfsr_d = (seed_en_i ? seed_i : (lfsr_en_i && lockup ? DefaultSeed : (lfsr_en_i ? next_lfsr_state : lfsr_q)));
	assign state_o = lfsr_q[StateOutDw - 1:0];
	always @(posedge clk_i or negedge rst_ni) begin : p_reg
		if (!rst_ni)
			lfsr_q <= DefaultSeed;
		else
			lfsr_q <= lfsr_d;
	end
endmodule
module prim_ram_1p (
	clk_i,
	req_i,
	write_i,
	addr_i,
	wdata_i,
	wmask_i,
	rdata_o
);
	parameter signed [31:0] Width = 32;
	parameter signed [31:0] Depth = 128;
	parameter signed [31:0] DataBitsPerMask = 1;
	parameter _sv2v_width_MemInitFile = 1;
	parameter [_sv2v_width_MemInitFile - 1:0] MemInitFile = "";
	localparam signed [31:0] Aw = $clog2(Depth);
	input wire clk_i;
	input wire req_i;
	input wire write_i;
	input wire [Aw - 1:0] addr_i;
	input wire [Width - 1:0] wdata_i;
	input wire [Width - 1:0] wmask_i;
	output wire [Width - 1:0] rdata_o;
	localparam integer prim_pkg_ImplGeneric = 0;
	parameter integer Impl = prim_pkg_ImplGeneric;
	localparam integer prim_pkg_ImplBadbit = 2;
	generate
		if (Impl == prim_pkg_ImplBadbit) begin : gen_badbit
			prim_badbit_ram_1p #(
				.Depth(Depth),
				.Width(Width),
				.MemInitFile(MemInitFile),
				.DataBitsPerMask(DataBitsPerMask)
			) u_impl_badbit(.*);
		end
		else begin : gen_generic
			prim_generic_ram_1p #(
				.Depth(Depth),
				.Width(Width),
				.MemInitFile(MemInitFile),
				.DataBitsPerMask(DataBitsPerMask)
			) u_impl_generic(.*);
		end
	endgenerate
endmodule
module prim_secded_28_22_dec (
	in,
	d_o,
	syndrome_o,
	err_o
);
	input [27:0] in;
	output wire [21:0] d_o;
	output wire [5:0] syndrome_o;
	output wire [1:0] err_o;
	wire single_error;
	assign syndrome_o[0] = (((((((((((in[22] ^ in[0]) ^ in[1]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[6]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[20]) ^ in[21];
	assign syndrome_o[1] = (((((((((((in[23] ^ in[0]) ^ in[1]) ^ in[2]) ^ in[3]) ^ in[10]) ^ in[11]) ^ in[12]) ^ in[13]) ^ in[14]) ^ in[15]) ^ in[20]) ^ in[21];
	assign syndrome_o[2] = ((((((((((in[24] ^ in[0]) ^ in[4]) ^ in[5]) ^ in[6]) ^ in[10]) ^ in[11]) ^ in[12]) ^ in[16]) ^ in[17]) ^ in[18]) ^ in[20];
	assign syndrome_o[3] = ((((((((((in[25] ^ in[1]) ^ in[4]) ^ in[7]) ^ in[8]) ^ in[10]) ^ in[13]) ^ in[14]) ^ in[16]) ^ in[17]) ^ in[19]) ^ in[21];
	assign syndrome_o[4] = (((((((((((in[26] ^ in[2]) ^ in[5]) ^ in[7]) ^ in[9]) ^ in[11]) ^ in[13]) ^ in[15]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21];
	assign syndrome_o[5] = (((((((((((in[27] ^ in[3]) ^ in[6]) ^ in[8]) ^ in[9]) ^ in[12]) ^ in[14]) ^ in[15]) ^ in[17]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21];
	assign d_o[0] = (syndrome_o == 6'h07) ^ in[0];
	assign d_o[1] = (syndrome_o == 6'h0b) ^ in[1];
	assign d_o[2] = (syndrome_o == 6'h13) ^ in[2];
	assign d_o[3] = (syndrome_o == 6'h23) ^ in[3];
	assign d_o[4] = (syndrome_o == 6'h0d) ^ in[4];
	assign d_o[5] = (syndrome_o == 6'h15) ^ in[5];
	assign d_o[6] = (syndrome_o == 6'h25) ^ in[6];
	assign d_o[7] = (syndrome_o == 6'h19) ^ in[7];
	assign d_o[8] = (syndrome_o == 6'h29) ^ in[8];
	assign d_o[9] = (syndrome_o == 6'h31) ^ in[9];
	assign d_o[10] = (syndrome_o == 6'h0e) ^ in[10];
	assign d_o[11] = (syndrome_o == 6'h16) ^ in[11];
	assign d_o[12] = (syndrome_o == 6'h26) ^ in[12];
	assign d_o[13] = (syndrome_o == 6'h1a) ^ in[13];
	assign d_o[14] = (syndrome_o == 6'h2a) ^ in[14];
	assign d_o[15] = (syndrome_o == 6'h32) ^ in[15];
	assign d_o[16] = (syndrome_o == 6'h1c) ^ in[16];
	assign d_o[17] = (syndrome_o == 6'h2c) ^ in[17];
	assign d_o[18] = (syndrome_o == 6'h34) ^ in[18];
	assign d_o[19] = (syndrome_o == 6'h38) ^ in[19];
	assign d_o[20] = (syndrome_o == 6'h37) ^ in[20];
	assign d_o[21] = (syndrome_o == 6'h3b) ^ in[21];
	assign single_error = ^syndrome_o;
	assign err_o[0] = single_error;
	assign err_o[1] = ~single_error & |syndrome_o;
endmodule
module prim_secded_28_22_enc (
	in,
	out
);
	input [21:0] in;
	output wire [27:0] out;
	assign out[0] = in[0];
	assign out[1] = in[1];
	assign out[2] = in[2];
	assign out[3] = in[3];
	assign out[4] = in[4];
	assign out[5] = in[5];
	assign out[6] = in[6];
	assign out[7] = in[7];
	assign out[8] = in[8];
	assign out[9] = in[9];
	assign out[10] = in[10];
	assign out[11] = in[11];
	assign out[12] = in[12];
	assign out[13] = in[13];
	assign out[14] = in[14];
	assign out[15] = in[15];
	assign out[16] = in[16];
	assign out[17] = in[17];
	assign out[18] = in[18];
	assign out[19] = in[19];
	assign out[20] = in[20];
	assign out[21] = in[21];
	assign out[22] = ((((((((((in[0] ^ in[1]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[6]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[20]) ^ in[21];
	assign out[23] = ((((((((((in[0] ^ in[1]) ^ in[2]) ^ in[3]) ^ in[10]) ^ in[11]) ^ in[12]) ^ in[13]) ^ in[14]) ^ in[15]) ^ in[20]) ^ in[21];
	assign out[24] = (((((((((in[0] ^ in[4]) ^ in[5]) ^ in[6]) ^ in[10]) ^ in[11]) ^ in[12]) ^ in[16]) ^ in[17]) ^ in[18]) ^ in[20];
	assign out[25] = (((((((((in[1] ^ in[4]) ^ in[7]) ^ in[8]) ^ in[10]) ^ in[13]) ^ in[14]) ^ in[16]) ^ in[17]) ^ in[19]) ^ in[21];
	assign out[26] = ((((((((((in[2] ^ in[5]) ^ in[7]) ^ in[9]) ^ in[11]) ^ in[13]) ^ in[15]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21];
	assign out[27] = ((((((((((in[3] ^ in[6]) ^ in[8]) ^ in[9]) ^ in[12]) ^ in[14]) ^ in[15]) ^ in[17]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21];
endmodule
module prim_secded_39_32_dec (
	in,
	d_o,
	syndrome_o,
	err_o
);
	input [38:0] in;
	output wire [31:0] d_o;
	output wire [6:0] syndrome_o;
	output wire [1:0] err_o;
	wire single_error;
	assign syndrome_o[0] = ((((((((((((in[32] ^ in[2]) ^ in[3]) ^ in[7]) ^ in[8]) ^ in[14]) ^ in[15]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[23]) ^ in[24]) ^ in[28]) ^ in[29];
	assign syndrome_o[1] = (((((((((((((in[33] ^ in[3]) ^ in[6]) ^ in[8]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[17]) ^ in[19]) ^ in[21]) ^ in[25]) ^ in[27]) ^ in[29]) ^ in[30]) ^ in[31];
	assign syndrome_o[2] = (((((((((((((in[34] ^ in[0]) ^ in[5]) ^ in[7]) ^ in[9]) ^ in[10]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[16]) ^ in[22]) ^ in[23]) ^ in[26]) ^ in[27]) ^ in[31];
	assign syndrome_o[3] = (((((((((((((in[35] ^ in[0]) ^ in[1]) ^ in[4]) ^ in[6]) ^ in[9]) ^ in[11]) ^ in[12]) ^ in[14]) ^ in[22]) ^ in[23]) ^ in[25]) ^ in[28]) ^ in[29]) ^ in[30];
	assign syndrome_o[4] = (((((((((((in[36] ^ in[0]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[11]) ^ in[17]) ^ in[20]) ^ in[24]) ^ in[26]) ^ in[27]) ^ in[30];
	assign syndrome_o[5] = (((((((((((((in[37] ^ in[1]) ^ in[2]) ^ in[4]) ^ in[6]) ^ in[10]) ^ in[13]) ^ in[14]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21]) ^ in[22]) ^ in[26];
	assign syndrome_o[6] = ((((((((((((((in[38] ^ in[1]) ^ in[5]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[11]) ^ in[17]) ^ in[18]) ^ in[20]) ^ in[21]) ^ in[24]) ^ in[25]) ^ in[28]) ^ in[31];
	assign d_o[0] = (syndrome_o == 7'h1c) ^ in[0];
	assign d_o[1] = (syndrome_o == 7'h68) ^ in[1];
	assign d_o[2] = (syndrome_o == 7'h31) ^ in[2];
	assign d_o[3] = (syndrome_o == 7'h13) ^ in[3];
	assign d_o[4] = (syndrome_o == 7'h38) ^ in[4];
	assign d_o[5] = (syndrome_o == 7'h54) ^ in[5];
	assign d_o[6] = (syndrome_o == 7'h2a) ^ in[6];
	assign d_o[7] = (syndrome_o == 7'h45) ^ in[7];
	assign d_o[8] = (syndrome_o == 7'h43) ^ in[8];
	assign d_o[9] = (syndrome_o == 7'h4c) ^ in[9];
	assign d_o[10] = (syndrome_o == 7'h64) ^ in[10];
	assign d_o[11] = (syndrome_o == 7'h58) ^ in[11];
	assign d_o[12] = (syndrome_o == 7'h0e) ^ in[12];
	assign d_o[13] = (syndrome_o == 7'h26) ^ in[13];
	assign d_o[14] = (syndrome_o == 7'h29) ^ in[14];
	assign d_o[15] = (syndrome_o == 7'h07) ^ in[15];
	assign d_o[16] = (syndrome_o == 7'h25) ^ in[16];
	assign d_o[17] = (syndrome_o == 7'h52) ^ in[17];
	assign d_o[18] = (syndrome_o == 7'h61) ^ in[18];
	assign d_o[19] = (syndrome_o == 7'h23) ^ in[19];
	assign d_o[20] = (syndrome_o == 7'h70) ^ in[20];
	assign d_o[21] = (syndrome_o == 7'h62) ^ in[21];
	assign d_o[22] = (syndrome_o == 7'h2c) ^ in[22];
	assign d_o[23] = (syndrome_o == 7'h0d) ^ in[23];
	assign d_o[24] = (syndrome_o == 7'h51) ^ in[24];
	assign d_o[25] = (syndrome_o == 7'h4a) ^ in[25];
	assign d_o[26] = (syndrome_o == 7'h34) ^ in[26];
	assign d_o[27] = (syndrome_o == 7'h16) ^ in[27];
	assign d_o[28] = (syndrome_o == 7'h49) ^ in[28];
	assign d_o[29] = (syndrome_o == 7'h0b) ^ in[29];
	assign d_o[30] = (syndrome_o == 7'h1a) ^ in[30];
	assign d_o[31] = (syndrome_o == 7'h46) ^ in[31];
	assign single_error = ^syndrome_o;
	assign err_o[0] = single_error;
	assign err_o[1] = ~single_error & |syndrome_o;
endmodule
module prim_secded_39_32_enc (
	in,
	out
);
	input [31:0] in;
	output wire [38:0] out;
	assign out[0] = in[0];
	assign out[1] = in[1];
	assign out[2] = in[2];
	assign out[3] = in[3];
	assign out[4] = in[4];
	assign out[5] = in[5];
	assign out[6] = in[6];
	assign out[7] = in[7];
	assign out[8] = in[8];
	assign out[9] = in[9];
	assign out[10] = in[10];
	assign out[11] = in[11];
	assign out[12] = in[12];
	assign out[13] = in[13];
	assign out[14] = in[14];
	assign out[15] = in[15];
	assign out[16] = in[16];
	assign out[17] = in[17];
	assign out[18] = in[18];
	assign out[19] = in[19];
	assign out[20] = in[20];
	assign out[21] = in[21];
	assign out[22] = in[22];
	assign out[23] = in[23];
	assign out[24] = in[24];
	assign out[25] = in[25];
	assign out[26] = in[26];
	assign out[27] = in[27];
	assign out[28] = in[28];
	assign out[29] = in[29];
	assign out[30] = in[30];
	assign out[31] = in[31];
	assign out[32] = (((((((((((in[2] ^ in[3]) ^ in[7]) ^ in[8]) ^ in[14]) ^ in[15]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[23]) ^ in[24]) ^ in[28]) ^ in[29];
	assign out[33] = ((((((((((((in[3] ^ in[6]) ^ in[8]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[17]) ^ in[19]) ^ in[21]) ^ in[25]) ^ in[27]) ^ in[29]) ^ in[30]) ^ in[31];
	assign out[34] = ((((((((((((in[0] ^ in[5]) ^ in[7]) ^ in[9]) ^ in[10]) ^ in[12]) ^ in[13]) ^ in[15]) ^ in[16]) ^ in[22]) ^ in[23]) ^ in[26]) ^ in[27]) ^ in[31];
	assign out[35] = ((((((((((((in[0] ^ in[1]) ^ in[4]) ^ in[6]) ^ in[9]) ^ in[11]) ^ in[12]) ^ in[14]) ^ in[22]) ^ in[23]) ^ in[25]) ^ in[28]) ^ in[29]) ^ in[30];
	assign out[36] = ((((((((((in[0] ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[11]) ^ in[17]) ^ in[20]) ^ in[24]) ^ in[26]) ^ in[27]) ^ in[30];
	assign out[37] = ((((((((((((in[1] ^ in[2]) ^ in[4]) ^ in[6]) ^ in[10]) ^ in[13]) ^ in[14]) ^ in[16]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[21]) ^ in[22]) ^ in[26];
	assign out[38] = (((((((((((((in[1] ^ in[5]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[11]) ^ in[17]) ^ in[18]) ^ in[20]) ^ in[21]) ^ in[24]) ^ in[25]) ^ in[28]) ^ in[31];
endmodule
module prim_secded_72_64_dec (
	in,
	d_o,
	syndrome_o,
	err_o
);
	input [71:0] in;
	output wire [63:0] d_o;
	output wire [7:0] syndrome_o;
	output wire [1:0] err_o;
	wire single_error;
	assign syndrome_o[0] = (((((((((((((((((((((((((in[64] ^ in[0]) ^ in[1]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[6]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[11]) ^ in[12]) ^ in[13]) ^ in[14]) ^ in[15]) ^ in[16]) ^ in[17]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[57]) ^ in[58]) ^ in[61]) ^ in[62]) ^ in[63];
	assign syndrome_o[1] = (((((((((((((((((((((((((in[65] ^ in[0]) ^ in[1]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[21]) ^ in[22]) ^ in[23]) ^ in[24]) ^ in[25]) ^ in[26]) ^ in[27]) ^ in[28]) ^ in[29]) ^ in[30]) ^ in[31]) ^ in[32]) ^ in[33]) ^ in[34]) ^ in[35]) ^ in[58]) ^ in[59]) ^ in[60]) ^ in[62]) ^ in[63];
	assign syndrome_o[2] = (((((((((((((((((((((((((in[66] ^ in[0]) ^ in[6]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[21]) ^ in[22]) ^ in[23]) ^ in[24]) ^ in[25]) ^ in[36]) ^ in[37]) ^ in[38]) ^ in[39]) ^ in[40]) ^ in[41]) ^ in[42]) ^ in[43]) ^ in[44]) ^ in[45]) ^ in[56]) ^ in[57]) ^ in[59]) ^ in[60]) ^ in[63];
	assign syndrome_o[3] = (((((((((((((((((((((((((in[67] ^ in[1]) ^ in[6]) ^ in[11]) ^ in[12]) ^ in[13]) ^ in[14]) ^ in[21]) ^ in[26]) ^ in[27]) ^ in[28]) ^ in[29]) ^ in[36]) ^ in[37]) ^ in[38]) ^ in[39]) ^ in[46]) ^ in[47]) ^ in[48]) ^ in[49]) ^ in[50]) ^ in[51]) ^ in[56]) ^ in[57]) ^ in[58]) ^ in[61]) ^ in[63];
	assign syndrome_o[4] = (((((((((((((((((((((((((in[68] ^ in[2]) ^ in[7]) ^ in[11]) ^ in[15]) ^ in[16]) ^ in[17]) ^ in[22]) ^ in[26]) ^ in[30]) ^ in[31]) ^ in[32]) ^ in[36]) ^ in[40]) ^ in[41]) ^ in[42]) ^ in[46]) ^ in[47]) ^ in[48]) ^ in[52]) ^ in[53]) ^ in[54]) ^ in[56]) ^ in[58]) ^ in[59]) ^ in[61]) ^ in[62];
	assign syndrome_o[5] = (((((((((((((((((((((((((in[69] ^ in[3]) ^ in[8]) ^ in[12]) ^ in[15]) ^ in[18]) ^ in[19]) ^ in[23]) ^ in[27]) ^ in[30]) ^ in[33]) ^ in[34]) ^ in[37]) ^ in[40]) ^ in[43]) ^ in[44]) ^ in[46]) ^ in[49]) ^ in[50]) ^ in[52]) ^ in[53]) ^ in[55]) ^ in[56]) ^ in[57]) ^ in[59]) ^ in[60]) ^ in[61];
	assign syndrome_o[6] = (((((((((((((((((((((((((in[70] ^ in[4]) ^ in[9]) ^ in[13]) ^ in[16]) ^ in[18]) ^ in[20]) ^ in[24]) ^ in[28]) ^ in[31]) ^ in[33]) ^ in[35]) ^ in[38]) ^ in[41]) ^ in[43]) ^ in[45]) ^ in[47]) ^ in[49]) ^ in[51]) ^ in[52]) ^ in[54]) ^ in[55]) ^ in[56]) ^ in[59]) ^ in[60]) ^ in[61]) ^ in[62];
	assign syndrome_o[7] = (((((((((((((((((((((((((in[71] ^ in[5]) ^ in[10]) ^ in[14]) ^ in[17]) ^ in[19]) ^ in[20]) ^ in[25]) ^ in[29]) ^ in[32]) ^ in[34]) ^ in[35]) ^ in[39]) ^ in[42]) ^ in[44]) ^ in[45]) ^ in[48]) ^ in[50]) ^ in[51]) ^ in[53]) ^ in[54]) ^ in[55]) ^ in[57]) ^ in[58]) ^ in[60]) ^ in[62]) ^ in[63];
	assign d_o[0] = (syndrome_o == 8'h07) ^ in[0];
	assign d_o[1] = (syndrome_o == 8'h0b) ^ in[1];
	assign d_o[2] = (syndrome_o == 8'h13) ^ in[2];
	assign d_o[3] = (syndrome_o == 8'h23) ^ in[3];
	assign d_o[4] = (syndrome_o == 8'h43) ^ in[4];
	assign d_o[5] = (syndrome_o == 8'h83) ^ in[5];
	assign d_o[6] = (syndrome_o == 8'h0d) ^ in[6];
	assign d_o[7] = (syndrome_o == 8'h15) ^ in[7];
	assign d_o[8] = (syndrome_o == 8'h25) ^ in[8];
	assign d_o[9] = (syndrome_o == 8'h45) ^ in[9];
	assign d_o[10] = (syndrome_o == 8'h85) ^ in[10];
	assign d_o[11] = (syndrome_o == 8'h19) ^ in[11];
	assign d_o[12] = (syndrome_o == 8'h29) ^ in[12];
	assign d_o[13] = (syndrome_o == 8'h49) ^ in[13];
	assign d_o[14] = (syndrome_o == 8'h89) ^ in[14];
	assign d_o[15] = (syndrome_o == 8'h31) ^ in[15];
	assign d_o[16] = (syndrome_o == 8'h51) ^ in[16];
	assign d_o[17] = (syndrome_o == 8'h91) ^ in[17];
	assign d_o[18] = (syndrome_o == 8'h61) ^ in[18];
	assign d_o[19] = (syndrome_o == 8'ha1) ^ in[19];
	assign d_o[20] = (syndrome_o == 8'hc1) ^ in[20];
	assign d_o[21] = (syndrome_o == 8'h0e) ^ in[21];
	assign d_o[22] = (syndrome_o == 8'h16) ^ in[22];
	assign d_o[23] = (syndrome_o == 8'h26) ^ in[23];
	assign d_o[24] = (syndrome_o == 8'h46) ^ in[24];
	assign d_o[25] = (syndrome_o == 8'h86) ^ in[25];
	assign d_o[26] = (syndrome_o == 8'h1a) ^ in[26];
	assign d_o[27] = (syndrome_o == 8'h2a) ^ in[27];
	assign d_o[28] = (syndrome_o == 8'h4a) ^ in[28];
	assign d_o[29] = (syndrome_o == 8'h8a) ^ in[29];
	assign d_o[30] = (syndrome_o == 8'h32) ^ in[30];
	assign d_o[31] = (syndrome_o == 8'h52) ^ in[31];
	assign d_o[32] = (syndrome_o == 8'h92) ^ in[32];
	assign d_o[33] = (syndrome_o == 8'h62) ^ in[33];
	assign d_o[34] = (syndrome_o == 8'ha2) ^ in[34];
	assign d_o[35] = (syndrome_o == 8'hc2) ^ in[35];
	assign d_o[36] = (syndrome_o == 8'h1c) ^ in[36];
	assign d_o[37] = (syndrome_o == 8'h2c) ^ in[37];
	assign d_o[38] = (syndrome_o == 8'h4c) ^ in[38];
	assign d_o[39] = (syndrome_o == 8'h8c) ^ in[39];
	assign d_o[40] = (syndrome_o == 8'h34) ^ in[40];
	assign d_o[41] = (syndrome_o == 8'h54) ^ in[41];
	assign d_o[42] = (syndrome_o == 8'h94) ^ in[42];
	assign d_o[43] = (syndrome_o == 8'h64) ^ in[43];
	assign d_o[44] = (syndrome_o == 8'ha4) ^ in[44];
	assign d_o[45] = (syndrome_o == 8'hc4) ^ in[45];
	assign d_o[46] = (syndrome_o == 8'h38) ^ in[46];
	assign d_o[47] = (syndrome_o == 8'h58) ^ in[47];
	assign d_o[48] = (syndrome_o == 8'h98) ^ in[48];
	assign d_o[49] = (syndrome_o == 8'h68) ^ in[49];
	assign d_o[50] = (syndrome_o == 8'ha8) ^ in[50];
	assign d_o[51] = (syndrome_o == 8'hc8) ^ in[51];
	assign d_o[52] = (syndrome_o == 8'h70) ^ in[52];
	assign d_o[53] = (syndrome_o == 8'hb0) ^ in[53];
	assign d_o[54] = (syndrome_o == 8'hd0) ^ in[54];
	assign d_o[55] = (syndrome_o == 8'he0) ^ in[55];
	assign d_o[56] = (syndrome_o == 8'h7c) ^ in[56];
	assign d_o[57] = (syndrome_o == 8'had) ^ in[57];
	assign d_o[58] = (syndrome_o == 8'h9b) ^ in[58];
	assign d_o[59] = (syndrome_o == 8'h76) ^ in[59];
	assign d_o[60] = (syndrome_o == 8'he6) ^ in[60];
	assign d_o[61] = (syndrome_o == 8'h79) ^ in[61];
	assign d_o[62] = (syndrome_o == 8'hd3) ^ in[62];
	assign d_o[63] = (syndrome_o == 8'h8f) ^ in[63];
	assign single_error = ^syndrome_o;
	assign err_o[0] = single_error;
	assign err_o[1] = ~single_error & |syndrome_o;
endmodule
module prim_secded_72_64_enc (
	in,
	out
);
	input [63:0] in;
	output wire [71:0] out;
	assign out[0] = in[0];
	assign out[1] = in[1];
	assign out[2] = in[2];
	assign out[3] = in[3];
	assign out[4] = in[4];
	assign out[5] = in[5];
	assign out[6] = in[6];
	assign out[7] = in[7];
	assign out[8] = in[8];
	assign out[9] = in[9];
	assign out[10] = in[10];
	assign out[11] = in[11];
	assign out[12] = in[12];
	assign out[13] = in[13];
	assign out[14] = in[14];
	assign out[15] = in[15];
	assign out[16] = in[16];
	assign out[17] = in[17];
	assign out[18] = in[18];
	assign out[19] = in[19];
	assign out[20] = in[20];
	assign out[21] = in[21];
	assign out[22] = in[22];
	assign out[23] = in[23];
	assign out[24] = in[24];
	assign out[25] = in[25];
	assign out[26] = in[26];
	assign out[27] = in[27];
	assign out[28] = in[28];
	assign out[29] = in[29];
	assign out[30] = in[30];
	assign out[31] = in[31];
	assign out[32] = in[32];
	assign out[33] = in[33];
	assign out[34] = in[34];
	assign out[35] = in[35];
	assign out[36] = in[36];
	assign out[37] = in[37];
	assign out[38] = in[38];
	assign out[39] = in[39];
	assign out[40] = in[40];
	assign out[41] = in[41];
	assign out[42] = in[42];
	assign out[43] = in[43];
	assign out[44] = in[44];
	assign out[45] = in[45];
	assign out[46] = in[46];
	assign out[47] = in[47];
	assign out[48] = in[48];
	assign out[49] = in[49];
	assign out[50] = in[50];
	assign out[51] = in[51];
	assign out[52] = in[52];
	assign out[53] = in[53];
	assign out[54] = in[54];
	assign out[55] = in[55];
	assign out[56] = in[56];
	assign out[57] = in[57];
	assign out[58] = in[58];
	assign out[59] = in[59];
	assign out[60] = in[60];
	assign out[61] = in[61];
	assign out[62] = in[62];
	assign out[63] = in[63];
	assign out[64] = ((((((((((((((((((((((((in[0] ^ in[1]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[6]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[11]) ^ in[12]) ^ in[13]) ^ in[14]) ^ in[15]) ^ in[16]) ^ in[17]) ^ in[18]) ^ in[19]) ^ in[20]) ^ in[57]) ^ in[58]) ^ in[61]) ^ in[62]) ^ in[63];
	assign out[65] = ((((((((((((((((((((((((in[0] ^ in[1]) ^ in[2]) ^ in[3]) ^ in[4]) ^ in[5]) ^ in[21]) ^ in[22]) ^ in[23]) ^ in[24]) ^ in[25]) ^ in[26]) ^ in[27]) ^ in[28]) ^ in[29]) ^ in[30]) ^ in[31]) ^ in[32]) ^ in[33]) ^ in[34]) ^ in[35]) ^ in[58]) ^ in[59]) ^ in[60]) ^ in[62]) ^ in[63];
	assign out[66] = ((((((((((((((((((((((((in[0] ^ in[6]) ^ in[7]) ^ in[8]) ^ in[9]) ^ in[10]) ^ in[21]) ^ in[22]) ^ in[23]) ^ in[24]) ^ in[25]) ^ in[36]) ^ in[37]) ^ in[38]) ^ in[39]) ^ in[40]) ^ in[41]) ^ in[42]) ^ in[43]) ^ in[44]) ^ in[45]) ^ in[56]) ^ in[57]) ^ in[59]) ^ in[60]) ^ in[63];
	assign out[67] = ((((((((((((((((((((((((in[1] ^ in[6]) ^ in[11]) ^ in[12]) ^ in[13]) ^ in[14]) ^ in[21]) ^ in[26]) ^ in[27]) ^ in[28]) ^ in[29]) ^ in[36]) ^ in[37]) ^ in[38]) ^ in[39]) ^ in[46]) ^ in[47]) ^ in[48]) ^ in[49]) ^ in[50]) ^ in[51]) ^ in[56]) ^ in[57]) ^ in[58]) ^ in[61]) ^ in[63];
	assign out[68] = ((((((((((((((((((((((((in[2] ^ in[7]) ^ in[11]) ^ in[15]) ^ in[16]) ^ in[17]) ^ in[22]) ^ in[26]) ^ in[30]) ^ in[31]) ^ in[32]) ^ in[36]) ^ in[40]) ^ in[41]) ^ in[42]) ^ in[46]) ^ in[47]) ^ in[48]) ^ in[52]) ^ in[53]) ^ in[54]) ^ in[56]) ^ in[58]) ^ in[59]) ^ in[61]) ^ in[62];
	assign out[69] = ((((((((((((((((((((((((in[3] ^ in[8]) ^ in[12]) ^ in[15]) ^ in[18]) ^ in[19]) ^ in[23]) ^ in[27]) ^ in[30]) ^ in[33]) ^ in[34]) ^ in[37]) ^ in[40]) ^ in[43]) ^ in[44]) ^ in[46]) ^ in[49]) ^ in[50]) ^ in[52]) ^ in[53]) ^ in[55]) ^ in[56]) ^ in[57]) ^ in[59]) ^ in[60]) ^ in[61];
	assign out[70] = ((((((((((((((((((((((((in[4] ^ in[9]) ^ in[13]) ^ in[16]) ^ in[18]) ^ in[20]) ^ in[24]) ^ in[28]) ^ in[31]) ^ in[33]) ^ in[35]) ^ in[38]) ^ in[41]) ^ in[43]) ^ in[45]) ^ in[47]) ^ in[49]) ^ in[51]) ^ in[52]) ^ in[54]) ^ in[55]) ^ in[56]) ^ in[59]) ^ in[60]) ^ in[61]) ^ in[62];
	assign out[71] = ((((((((((((((((((((((((in[5] ^ in[10]) ^ in[14]) ^ in[17]) ^ in[19]) ^ in[20]) ^ in[25]) ^ in[29]) ^ in[32]) ^ in[34]) ^ in[35]) ^ in[39]) ^ in[42]) ^ in[44]) ^ in[45]) ^ in[48]) ^ in[50]) ^ in[51]) ^ in[53]) ^ in[54]) ^ in[55]) ^ in[57]) ^ in[58]) ^ in[60]) ^ in[62]) ^ in[63];
endmodule
module prim_xilinx_clock_gating (
	clk_i,
	en_i,
	test_en_i,
	clk_o
);
	input clk_i;
	input en_i;
	input test_en_i;
	output wire clk_o;
	BUFGCE u_bufgce(
		.I(clk_i),
		.CE(en_i | test_en_i),
		.O(clk_o)
	);
endmodule
