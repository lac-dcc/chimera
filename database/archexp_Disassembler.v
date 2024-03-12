`timescale 1ns / 1ps

`include "Constants.vh"

module Disassembler (

		input [31:0] instruction,

		output [32 * 8 - 1 : 0] text
	);

	wire [5:0] code = instruction[31:26];
	wire [4:0] rs = instruction[25:21];
	wire [4:0] rt = instruction[20:16];
	wire [4:0] rd = instruction[15:11];
	wire [4:0] shiftAmount = instruction[10:6];
	wire [5:0] function_ = instruction[5:0];
	wire [15:0] immediate = instruction[15:0];
	//wire [15:0] offset = immediate;
	wire [4:0] base = rs;
	wire [25:0] index = instruction[25:0];

	function [7:0] getDecimalFirstCharacter (
			input [4:0] decimal
		);
		getDecimalFirstCharacter =
				decimal < 5'd10 ? decimal + "0"
				: decimal < 5'd20 ? "1"
				: decimal < 5'd30 ? "2"
				: "3";
	endfunction

	function [7:0] getDecimalSecondCharacter (
			input [4:0] decimal
		);
		getDecimalSecondCharacter =
				decimal < 5'd10 ? 8'b0
				: decimal < 5'd20 ? (decimal - 5'd10) + "0"
				: decimal < 5'd30 ? (decimal - 5'd20) + "0"
				: (decimal - 5'd30) + "0";
	endfunction

	function [8 * 8 - 1 : 0] getRegisterText (
			input [4:0] register,
			input [7:0] terminator
		);
		getRegisterText =
				register < 5'd10 ? {"$", getDecimalFirstCharacter(register[4:0]), terminator, "     "}
				: {"$", getDecimalFirstCharacter(register[4:0]), getDecimalSecondCharacter(register[4:0]), terminator, "    "};
	endfunction

	function [8 * 8 - 1 : 0] getShiftAmountText (
			input [4:0] shiftAmount
		);
		getShiftAmountText =
				shiftAmount < 5'd10 ? {getDecimalFirstCharacter(shiftAmount[4:0]), "       "}
				: {getDecimalFirstCharacter(shiftAmount[4:0]), getDecimalSecondCharacter(shiftAmount[4:0]), "      "};
	endfunction

	function [7:0] getHexCharacter (
			input [3:0] hex
		);
		getHexCharacter = hex < 4'd10 ? hex + "0" : (hex - 4'd10) + "A";
	endfunction

	function [8 * 8 - 1 : 0] getImmediateText (
			input [15:0] immediate
		);
		getImmediateText = {"0x", getHexCharacter(immediate[15:12]), getHexCharacter(immediate[11:8]), getHexCharacter(immediate[7:4]), getHexCharacter(immediate[3:0]), "  "};
	endfunction

	function [8 * 8 - 1 : 0] getBaseText (
			input [4:0] base
		);
		getBaseText =
				base < 5'd10 ? {"($", getDecimalFirstCharacter(base[4:0]), ")    "}
				: {"($", getDecimalFirstCharacter(base[4:0]), getDecimalSecondCharacter(base[4:0]), ")   "};
	endfunction

	function [16 * 8 - 1 : 0] getIndexText (
			input [25:0] index
		);
		getIndexText = {"0x", getHexCharacter({2'b0, index[25:24]}), getHexCharacter(index[23:20]), getHexCharacter(index[19:16]), getHexCharacter(index[15:12]), getHexCharacter(index[11:8]), getHexCharacter(index[7:4]), getHexCharacter(index[3:0]), "       "};
	endfunction

	wire [8 * 8 - 1 : 0] spaceText = {8{" "}};
	wire [8 * 8 - 1 : 0] rsText = getRegisterText(rs[4:0], " ");
	wire [8 * 8 - 1 : 0] rsCommaText = getRegisterText(rs[4:0], ",");
	wire [8 * 8 - 1 : 0] rtText = getRegisterText(rt[4:0], " ");
	wire [8 * 8 - 1 : 0] rtCommaText = getRegisterText(rt[4:0], ",");
	wire [8 * 8 - 1 : 0] rdText = getRegisterText(rd[4:0], " ");
	wire [8 * 8 - 1 : 0] rdCommaText = getRegisterText(rd[4:0], ",");
	wire [8 * 8 - 1 : 0] shiftAmountText = getShiftAmountText(shiftAmount[4:0]);
	wire [8 * 8 - 1 : 0] immediateText = getImmediateText(immediate[15:0]);
	wire [8 * 8 - 1 : 0] offsetText = immediateText;
	wire [8 * 8 - 1 : 0] baseText = getBaseText(base[4:0]);
	wire [16 * 8 - 1 : 0] indexText = getIndexText(index[25:0]);
	wire [32 * 8 - 1 : 0] unknownText = {"<unknown", ">       ", spaceText, spaceText};

	assign text =
			instruction == 32'b0 ? {"nop     ", spaceText, spaceText, spaceText}
			: code == `CODE_R_TYPE ? (
				function_ == `FUNCTION_ADD ? {"add     ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_ADDU ? {"addu    ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_SUB ? {"sub     ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_SUBU ? {"subu    ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_AND ? {"and     ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_OR ? {"or      ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_XOR ? {"xor     ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_NOR ? {"nor     ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_SLT ? {"slt     ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_SLTU ? {"sltu    ", rdCommaText, rsCommaText, rtText}
				: function_ == `FUNCTION_SLL ? {"sll     ", rdCommaText, rtCommaText, shiftAmountText}
				: function_ == `FUNCTION_SRL ? {"srl     ", rdCommaText, rtCommaText, shiftAmountText}
				: function_ == `FUNCTION_SRA ? {"sra     ", rdCommaText, rtCommaText, shiftAmountText}
				: function_ == `FUNCTION_SLLV ? {"sllv    ", rdCommaText, rtCommaText, rsText}
				: function_ == `FUNCTION_SRLV ? {"srlv    ", rdCommaText, rtCommaText, rsText}
				: function_ == `FUNCTION_SRAV ? {"srav    ", rdCommaText, rtCommaText, rsText}
				: function_ == `FUNCTION_JR ? {"jr      ", spaceText, spaceText, spaceText}
				: unknownText
			)
			: code == `CODE_ADDI ? {"addi    ", rtCommaText, rsCommaText, immediateText}
			: code == `CODE_ADDIU ? {"addiu   ", rtCommaText, rsCommaText, immediateText}
			: code == `CODE_ANDI ? {"andi    ", rtCommaText, rsCommaText, immediateText}
			: code == `CODE_ORI ? {"ori     ", rtCommaText, rsCommaText, immediateText}
			: code == `CODE_XORI ? {"xori    ", rtCommaText, rsCommaText, immediateText}
			: code == `CODE_LUI ? {"lui     ", rtCommaText, immediateText, spaceText}
			: code == `CODE_LW ? {"lw      ", rtCommaText, offsetText, baseText}
			: code == `CODE_SW ? {"sw      ", rtCommaText, offsetText, baseText}
			: code == `CODE_BEQ ? {"beq     ", rsCommaText, rtCommaText, offsetText}
			: code == `CODE_BNE ? {"bne     ", rsCommaText, rtCommaText, offsetText}
			: code == `CODE_SLTI ? {"slti    ", rtCommaText, rsCommaText, immediateText}
			: code == `CODE_SLTIU ? {"sltiu   ", rtCommaText, rsCommaText, immediateText}
			: code == `CODE_J ? {"j       ", indexText, spaceText}
			: code == `CODE_JAL ? {"jal     ", indexText, spaceText}
			: unknownText;
endmodule
