/*
 -- ============================================================================
 -- FILE NAME	: decoder.v
 -- DESCRIPTION : 命令デコーダ
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 新規作成
 -- ============================================================================
*/

/********** 共通ヘッダファイル **********/
`include "nettype.h"
`include "global_config.h"
`include "stddef.h"

/********** 個別ヘッダファイル **********/
`include "isa.h"
`include "cpu.h"

/********** モジュール **********/
module decoder (
	/********** IF/IDパイプラインレジスタ **********/
	input  wire [`WordAddrBus]	 if_pc,			 // プログラムカウンタ
	input  wire [`WordDataBus]	 if_insn,		 // 命令
	input  wire					 if_en,			 // パイプラインデータの有効
	/********** GPRインタフェース **********/
	input  wire [`WordDataBus]	 gpr_rd_data_0, // 読み出しデータ 0
	input  wire [`WordDataBus]	 gpr_rd_data_1, // 読み出しデータ 1
	output wire [`RegAddrBus]	 gpr_rd_addr_0, // 読み出しアドレス 0
	output wire [`RegAddrBus]	 gpr_rd_addr_1, // 読み出しアドレス 1
	/********** フォワーディング **********/
	// IDステージからのフォワーディング
	input  wire					 id_en,			// パイプラインデータの有効
	input  wire [`RegAddrBus]	 id_dst_addr,	// 書き込みアドレス
	input  wire					 id_gpr_we_,	// 書き込み有効
	input  wire [`MemOpBus]		 id_mem_op,		// メモリオペレーション
	// EXステージからのフォワーディング
	input  wire					 ex_en,			// パイプラインデータの有効
	input  wire [`RegAddrBus]	 ex_dst_addr,	// 書き込みアドレス
	input  wire					 ex_gpr_we_,	// 書き込み有効
	input  wire [`WordDataBus]	 ex_fwd_data,	// フォワーディングデータ
	// MEMステージからのフォワーディング
	input  wire [`WordDataBus]	 mem_fwd_data,	// フォワーディングデータ
	/********** 制御レジスタインタフェース **********/
	input  wire [`CpuExeModeBus] exe_mode,		// 実行モード
	input  wire [`WordDataBus]	 creg_rd_data,	// 読み出しデータ
	output wire [`RegAddrBus]	 creg_rd_addr,	// 読み出しアドレス
	/********** デコード結果 **********/
	output reg	[`AluOpBus]		 alu_op,		// ALUオペレーション
	output reg	[`WordDataBus]	 alu_in_0,		// ALU入力 0
	output reg	[`WordDataBus]	 alu_in_1,		// ALU入力 1
	output reg	[`WordAddrBus]	 br_addr,		// 分岐アドレス
	output reg					 br_taken,		// 分岐の成立
	output reg					 br_flag,		// 分岐フラグ
	output reg	[`MemOpBus]		 mem_op,		// メモリオペレーション
	output wire [`WordDataBus]	 mem_wr_data,	// メモリ書き込みデータ
	output reg	[`CtrlOpBus]	 ctrl_op,		// 制御オペレーション
	output reg	[`RegAddrBus]	 dst_addr,		// 汎用レジスタ書き込みアドレス
	output reg					 gpr_we_,		// 汎用レジスタ書き込み有効
	output reg	[`IsaExpBus]	 exp_code,		// 例外コード
	output reg					 ld_hazard		// ロードハザード
);

	/********** 命令フィールド **********/
	wire [`IsaOpBus]	op		= if_insn[`IsaOpLoc];	  // オペコード
	wire [`RegAddrBus]	ra_addr = if_insn[`IsaRaAddrLoc]; // Raアドレス
	wire [`RegAddrBus]	rb_addr = if_insn[`IsaRbAddrLoc]; // Rbアドレス
	wire [`RegAddrBus]	rc_addr = if_insn[`IsaRcAddrLoc]; // Rcアドレス
	wire [`IsaImmBus]	imm		= if_insn[`IsaImmLoc];	  // 即値
	/********** 即値 **********/
	// 符号拡張
	wire [`WordDataBus] imm_s = {{`ISA_EXT_W{imm[`ISA_IMM_MSB]}}, imm};
	// ゼロ拡張
	wire [`WordDataBus] imm_u = {{`ISA_EXT_W{1'b0}}, imm};
	/********** レジスタの読み出しアドレス **********/
	assign gpr_rd_addr_0 = ra_addr; // 汎用レジスタ読み出しアドレス 0
	assign gpr_rd_addr_1 = rb_addr; // 汎用レジスタ読み出しアドレス 1
	assign creg_rd_addr	 = ra_addr; // 制御レジスタ読み出しアドレス
	/********** 汎用レジスタの読み出しデータ **********/
	reg			[`WordDataBus]	ra_data;						  // 符号なしRa
	wire signed [`WordDataBus]	s_ra_data = $signed(ra_data);	  // 符号付きRa
	reg			[`WordDataBus]	rb_data;						  // 符号なしRb
	wire signed [`WordDataBus]	s_rb_data = $signed(rb_data);	  // 符号付きRb
	assign mem_wr_data = rb_data; // メモリ書き込みデータ
	/********** アドレス **********/
	wire [`WordAddrBus] ret_addr  = if_pc + 1'b1;					 // 戻り番地
	wire [`WordAddrBus] br_target = if_pc + imm_s[`WORD_ADDR_MSB:0]; // 分岐先
	wire [`WordAddrBus] jr_target = ra_data[`WordAddrLoc];		   // ジャンプ先

	/********** フォワーディング **********/
	always @(*) begin
		/* Raレジスタ */
		if ((id_en == `ENABLE) && (id_gpr_we_ == `ENABLE_) && 
			(id_dst_addr == ra_addr)) begin
			ra_data = ex_fwd_data;	 // EXステージからのフォワーディング
		end else if ((ex_en == `ENABLE) && (ex_gpr_we_ == `ENABLE_) && 
					 (ex_dst_addr == ra_addr)) begin
			ra_data = mem_fwd_data;	 // MEMステージからのフォワーディング
		end else begin
			ra_data = gpr_rd_data_0; // レジスタファイルからの読み出し
		end
		/* Rbレジスタ */
		if ((id_en == `ENABLE) && (id_gpr_we_ == `ENABLE_) && 
			(id_dst_addr == rb_addr)) begin
			rb_data = ex_fwd_data;	 // EXステージからのフォワーディング
		end else if ((ex_en == `ENABLE) && (ex_gpr_we_ == `ENABLE_) && 
					 (ex_dst_addr == rb_addr)) begin
			rb_data = mem_fwd_data;	 // MEMステージからのフォワーディング
		end else begin
			rb_data = gpr_rd_data_1; // レジスタファイルからの読み出し
		end
	end

	/********** ロードハザードの検出 **********/
	always @(*) begin
		if ((id_en == `ENABLE) && (id_mem_op == `MEM_OP_LDW) &&
			((id_dst_addr == ra_addr) || (id_dst_addr == rb_addr))) begin
			ld_hazard = `ENABLE;  // ロードハザード
		end else begin
			ld_hazard = `DISABLE; // ハザードなし
		end
	end

	/********** 命令のデコード **********/
	always @(*) begin
		/* デフォルト値 */
		alu_op	 = `ALU_OP_NOP;
		alu_in_0 = ra_data;
		alu_in_1 = rb_data;
		br_taken = `DISABLE;
		br_flag	 = `DISABLE;
		br_addr	 = {`WORD_ADDR_W{1'b0}};
		mem_op	 = `MEM_OP_NOP;
		ctrl_op	 = `CTRL_OP_NOP;
		dst_addr = rb_addr;
		gpr_we_	 = `DISABLE_;
		exp_code = `ISA_EXP_NO_EXP;
		/* オペコードの判定 */
		if (if_en == `ENABLE) begin
			case (op)
				/* 論理演算命令 */
				`ISA_OP_ANDR  : begin // レジスタ同士の論理積
					alu_op	 = `ALU_OP_AND;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ANDI  : begin // レジスタと即値の論理積
					alu_op	 = `ALU_OP_AND;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ORR	  : begin // レジスタ同士の論理和
					alu_op	 = `ALU_OP_OR;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ORI	  : begin // レジスタと即値の論理和
					alu_op	 = `ALU_OP_OR;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_XORR  : begin // レジスタ同士の排他的論理和
					alu_op	 = `ALU_OP_XOR;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_XORI  : begin // レジスタと即値の排他的論理和
					alu_op	 = `ALU_OP_XOR;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				/* 算術演算命令 */
				`ISA_OP_ADDSR : begin // レジスタ同士の符号付き加算
					alu_op	 = `ALU_OP_ADDS;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ADDSI : begin // レジスタと即値の符号付き加算
					alu_op	 = `ALU_OP_ADDS;
					alu_in_1 = imm_s;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ADDUR : begin // レジスタ同士の符号なし加算
					alu_op	 = `ALU_OP_ADDU;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_ADDUI : begin // レジスタと即値の符号なし加算
					alu_op	 = `ALU_OP_ADDU;
					alu_in_1 = imm_s;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SUBSR : begin // レジスタ同士の符号付き減算
					alu_op	 = `ALU_OP_SUBS;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SUBUR : begin // レジスタ同士の符号なし減算
					alu_op	 = `ALU_OP_SUBU;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				/* シフト命令 */
				`ISA_OP_SHRLR : begin // レジスタ同士の論理右シフト
					alu_op	 = `ALU_OP_SHRL;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SHRLI : begin // レジスタと即値の論理右シフト
					alu_op	 = `ALU_OP_SHRL;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SHLLR : begin // レジスタ同士の論理左シフト
					alu_op	 = `ALU_OP_SHLL;
					dst_addr = rc_addr;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_SHLLI : begin // レジスタと即値の論理左シフト
					alu_op	 = `ALU_OP_SHLL;
					alu_in_1 = imm_u;
					gpr_we_	 = `ENABLE_;
				end
				/* 分岐命令 */
				`ISA_OP_BE	  : begin // レジスタ同士の符号付き比較（Ra == Rb）
					br_addr	 = br_target;
					br_taken = (ra_data == rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_BNE	  : begin // レジスタ同士の符号付き比較（Ra != Rb）
					br_addr	 = br_target;
					br_taken = (ra_data != rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_BSGT  : begin // レジスタ同士の符号付き比較（Ra < Rb）
					br_addr	 = br_target;
					br_taken = (s_ra_data < s_rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_BUGT  : begin // レジスタ同士の符号なし比較（Ra < Rb）
					br_addr	 = br_target;
					br_taken = (ra_data < rb_data) ? `ENABLE : `DISABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_JMP	  : begin // 無条件分岐
					br_addr	 = jr_target;
					br_taken = `ENABLE;
					br_flag	 = `ENABLE;
				end
				`ISA_OP_CALL  : begin // コール
					alu_in_0 = {ret_addr, {`BYTE_OFFSET_W{1'b0}}};
					br_addr	 = jr_target;
					br_taken = `ENABLE;
					br_flag	 = `ENABLE;
					dst_addr = `REG_ADDR_W'd31;
					gpr_we_	 = `ENABLE_;
				end
				/* メモリアクセス命令 */
				`ISA_OP_LDW	  : begin // ワード読み出し
					alu_op	 = `ALU_OP_ADDU;
					alu_in_1 = imm_s;
					mem_op	 = `MEM_OP_LDW;
					gpr_we_	 = `ENABLE_;
				end
				`ISA_OP_STW	  : begin // ワード書き込み
					alu_op	 = `ALU_OP_ADDU;
					alu_in_1 = imm_s;
					mem_op	 = `MEM_OP_STW;
				end
				/* システムコール命令 */
				`ISA_OP_TRAP  : begin // トラップ
					exp_code = `ISA_EXP_TRAP;
				end
				/* 特権命令 */
				`ISA_OP_RDCR  : begin // 制御レジスタの読み出し
					if (exe_mode == `CPU_KERNEL_MODE) begin
						alu_in_0 = creg_rd_data;
						gpr_we_	 = `ENABLE_;
					end else begin
						exp_code = `ISA_EXP_PRV_VIO;
					end
				end
				`ISA_OP_WRCR  : begin // 制御レジスタへの書き込み
					if (exe_mode == `CPU_KERNEL_MODE) begin
						ctrl_op	 = `CTRL_OP_WRCR;
					end else begin
						exp_code = `ISA_EXP_PRV_VIO;
					end
				end
				`ISA_OP_EXRT  : begin // 例外からの復帰
					if (exe_mode == `CPU_KERNEL_MODE) begin
						ctrl_op	 = `CTRL_OP_EXRT;
					end else begin
						exp_code = `ISA_EXP_PRV_VIO;
					end
				end
				/* その他の命令 */
				default		  : begin // 未定義命令
					exp_code = `ISA_EXP_UNDEF_INSN;
				end
			endcase
		end
	end

endmodule
