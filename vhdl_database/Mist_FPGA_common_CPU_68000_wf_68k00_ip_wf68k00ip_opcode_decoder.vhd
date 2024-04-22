----------------------------------------------------------------------
----                                                              ----
---- MC68000 compatible IP Core					                  ----
----                                                              ----
---- This file is part of the SUSKA ATARI clone project.          ----
---- http://www.experiment-s.de                                   ----
----                                                              ----
---- Description:                                                 ----
---- This model provides an opcode and bus timing compatible ip   ----
---- core compared to Motorola's MC68000 microprocessor.          ----
----                                                              ----
---- This file contains the opcode decoder.                       ----
----                                                              ----
----                                                              ----
---- Description:                                                 ----
---- Performs an instruction opcode decoding and the control      ----
---- functions for all other blocks.                              ----
---- This Opcode decoder of the 68K00 decodes already the opera-  ----
---- tions long division (signed and unsigned (DIVL) and long     ----
---- multiplication (signed and unsigned) (MULL).                 ----
----                                                              ----
----                                                              ----
---- Author(s):                                                   ----
---- - Wolfgang Foerster, wf@experiment-s.de; wf@inventronik.de   ----
----                                                              ----
----------------------------------------------------------------------
----                                                              ----
---- Copyright (C) 2006 - 2008 Wolfgang Foerster                  ----
----                                                              ----
---- This source file is free software; you can redistribute it   ----
---- and/or modify it under the terms of the GNU General Public   ----
---- License as published by the Free Software Foundation; either ----
---- version 2 of the License, or (at your option) any later      ----
---- version.                                                     ----
----                                                              ----
---- This program is distributed in the hope that it will be      ----
---- useful, but WITHOUT ANY WARRANTY; without even the implied   ----
---- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ----
---- PURPOSE.  See the GNU General Public License for more        ----
---- details.                                                     ----
----                                                              ----
---- You should have received a copy of the GNU General Public    ----
---- License along with this program; if not, write to the Free   ----
---- Software Foundation, Inc., 51 Franklin Street, Fifth Floor,  ----
---- Boston, MA 02110-1301, USA.                                  ----
----                                                              ----
----------------------------------------------------------------------
-- 
-- Revision History
-- 
-- Revision 2K6B  2006/12/24 WF
--   Initial Release.
-- Revision 2K7A  2007/05/31 WF
--   Updated all modules.
-- Revision 2K7B  2007/12/24 WF
--   See the 68K00 top level file.
-- Revision 2K8A  2008/07/14 WF
--   See the 68K00 top level file.
-- 

use work.wf68k00ip_pkg.all;

library ieee;
use ieee.std_logic_1164.all;

entity WF68K00IP_OPCODE_DECODER is
	port (
		CLK				: in bit;
		RESETn			: in bit;

		DATA_IN			: in std_logic_vector(15 downto 0);
		SBIT			: in bit;
		OV				: in std_logic; -- Overflow flag.

		-- Instruction word controls:
		IW_ADR			: in integer range 0 to 2; -- Instruction word address.
		IW_WR			: in bit; -- Instruction word write control.

		-- Further load controls (besides the first instruction word):
		FORCE_BIW2		: out bit;
		FORCE_BIW3		: out bit;
		EXT_CNT			: out integer range 0 to 2;
		DEST_EXT_CNT	: out integer range 0 to 2;

		-- System control flags:
		DR	 			: out bit;
		RM				: out bit;
		IR				: out bit;

		-- System control signals:
		OP				: out OP_68K00;
		OP_SIZE			: out OP_SIZETYPE; -- Operand size.
		OP_MODE			: out std_logic_vector(4 downto 0);
		BIW_0			: out std_logic_vector(15 downto 0);
		REGSEL_20		: out std_logic_vector(2 downto 0);
		REGSEL_119		: out std_logic_vector(2 downto 0);
		REGSEL_INDEX	: out std_logic_vector(2 downto 0);
		DATA_IMMEDIATE	: out std_logic_vector(31 downto 0);
		TRAP_VECTOR		: out std_logic_vector(3 downto 0);
		C_CODE			: out bit_vector(3 downto 0);
		MEM_SHFT		: out bit; -- Shift operations in registers ('0') or in memory ('1').
		REGLISTMASK		: out std_logic_vector(15 downto 0); -- Used in MOVEM.

		-- Bit operations:
		BITPOS_IM		: out bit; -- Immediate bit position select.
		BIT_POS			: out std_logic_vector(4 downto 0); -- The bit position.

		-- Multiplication / Division:
		DIV_MUL_32n64	: out bit;
		REG_Dlq			: out std_logic_vector(2 downto 0);
		REG_Dhr			: out std_logic_vector(2 downto 0);

		-- Traps:
		SCAN_TRAPS		: in bit;
		TRAP_ILLEGAL	: out bit;
		TRAP_1010		: out bit;
		TRAP_1111		: out bit;
		TRAP_PRIV		: out bit;
		TRAP_OP			: out bit;
		TRAP_V			: out bit;

		-- Extension word controls:
		EW_WR			: in bit; -- Write control.
		EW_ADR			: in integer range 0 to 1; -- Source extension word address.
		SRC_DESTn		: in bit; -- '1' for read operand from source, '0' store result to destination (MOVE).

		-- Extension words:
		EXWORD			: out EXWORDTYPE;
		DEST_EXWORD		: out EXWORDTYPE;

		-- Address computation stuff:
		ADR_MODE			: out std_logic_vector(2 downto 0); -- Address mode indicator.
		MOVE_D_AM			: out std_logic_vector(2 downto 0); -- Move statement destination address mode.
		EXT_DSIZE			: out D_SIZETYPE; -- Displacement size, BYTE or WORD.
		SEL_DISPLACE_BIW	: out bit; -- Select displacement from the basic instruction word BIW, when '1'.
		DISPLACE_BIW		: out std_logic_vector(31 downto 0) -- Displacement (direct encoded, 8 or 16 bit).
	);
end entity WF68K00IP_OPCODE_DECODER;
	
architecture BEHAVIOR of WF68K00IP_OPCODE_DECODER is
type BIW_TYPE is array(0 to 2) of std_logic_vector(15 downto 0);
signal BIW				: BIW_TYPE; -- Instruction word registers.
signal EXT_EN			: bit;
signal OP_I				: OP_68K00;
signal OP_SIZE_I		: OP_SIZETYPE;
signal EXWORD_REG		: EXWORDTYPE;
signal DEST_EXWORD_REG	: EXWORDTYPE;
begin
	EXTENSIONS: process(RESETn, CLK)
	-- In this process the required source and destination extension words
	-- for the operations are stored. This process works on the negative 
	-- clock edge to meet the timing requirements in conjunction with the 
	-- bus interface and the system control state machine.
	begin
		if RESETn = '0' then
			for i in 0 to 1 loop
				EXWORD_REG(i) <= (others => '0');
				DEST_EXWORD_REG(i) <= (others => '0');
			end loop;
		elsif CLK = '0' and CLK' event then
			-- The extension words are written but never initialized
			-- during the operation. This does not take any negative
			-- effect because the operations, using the extensions,
			-- overwrite the respective words during instruction
			-- load process.
			if EW_WR = '1' and SRC_DESTn = '1' then
				EXWORD_REG(EW_ADR) <= DATA_IN;
			elsif EW_WR = '1' then -- SRC_DESTn = '0'.
				DEST_EXWORD_REG(EW_ADR) <= DATA_IN;
			end if;
		end if;
	end process EXTENSIONS;
	--
	EXWORD <= EXWORD_REG;
	DEST_EXWORD <= DEST_EXWORD_REG;

	-- Copy signal to port:
	OP <= OP_I;

	-- TRAPS:
	TRAP_1010 <= '1' when SCAN_TRAPS = '1' and BIW(0)(15 downto 12) = "1010" else '0';
	TRAP_1111 <= '1' when SCAN_TRAPS = '1' and BIW(0)(15 downto 12) = "1111" else '0';
	TRAP_ILLEGAL <= '1' when SCAN_TRAPS = '1' and OP_I = ILLEGAL else '0';
	TRAP_OP <= '1' when SCAN_TRAPS = '1' and OP_I = TRAP else '0';
	TRAP_V <= '1' when SCAN_TRAPS = '1' and OP_I = TRAPV and OV = '1' else '0';
	with OP_I select
		TRAP_PRIV <= not SBIT and SCAN_TRAPS when ANDI_TO_SR | EORI_TO_SR | MOVE_TO_SR | MOVE_USP | ORI_TO_SR | RESET | RTE | STOP,
					 '0' when others;
	
	OPCODE_REG: process(RESETn, CLK)
	-- In this process the different OPCODE registers store all required information for
	-- the instruction processing. Depending on the operation, at least the Basic Instruction
	-- Word BIW(0) is stored followed by a second and third instruction word Word BIW(1) and
	-- BIW(2), if required. This process works on the negative clock edge to meet the timing
	-- requirements in conjunction with the bus interface and the system control state machine.
	begin
		if RESETn = '0' then
			BIW(0) <= (others => '0');
			BIW(1) <= (others => '0');
			BIW(2) <= (others => '0');
		elsif CLK = '0' and CLK' event then
			if IW_WR = '1' then
				BIW(IW_ADR) <= DATA_IN;
			end if;
		end if;
	end process OPCODE_REG;

	BIW_0 <= BIW(0);
	
	DR <=   To_Bit(BIW(0)(10)) when OP_I = MOVEM else
			To_Bit(BIW(0)(3)) when OP_I = MOVE_USP else
			To_Bit(BIW(0)(8)); -- Default is valid for ASL, ASR, LSL, LSR, ROL, ROR, ROXL, ROXR.
	RM <= To_Bit(BIW(0)(3)); -- Valid for SBCD, SUBX, ABCD, ADDX.
	IR <= To_Bit(BIW(0)(5)); -- Valid for ASL, ASR, LSL, LSR, ROL, ROR, ROXL, ROXR.

	-- Addressing mode:
	-- The Default is valid for ORI, ANDI, SUBI, CALLM, ADDI, EORI, CMPI, BTST, BCHG, BCLR, BSET,
	-- MOVEA, MOVE_FROM_CCR, MOVE_FROM_SR, NEGX, CLR, MOVE_TO_CCR, NEG, NOT, MOVE_TO_SR, NBCD, PEA, 
	-- TAS, TST, MULYU, MULS, DIVU, DIVS, JSR, JMP, MOVEM, LEA, CHK, ADDQ, SUBQ, OR, SUB, SUBA,
	--  CMP, CMPA, EOR, AND, ADDA, ADD, ASL, ASR, LSL, LSR, ROL, ROR, ROXL, ROXR.
	ADR_MODE <=	"100" when OP_I = ABCD or OP_I = SBCD or OP_I = ADDX or OP_I = SUBX else -- Predecrement.
				"011" when OP_I = CMPM else  -- Postincrement.
				"101" when OP_I = MOVEP else -- Address register indirect plus 16 bit displacement.
				BIW(0)(5 downto 3); 

	MOVE_D_AM <= BIW(0)(8 downto 6); -- Move statement destination address mode.

	REGSEL_20 <= BIW(0)(2 downto 0);	-- Valid for ORI, ANDI, SUBI, ADDI, EORI, CMPI, BTST, BCHG, BCLR
										-- BCLR, BSET, MOVEP, MOVEA, MOVE, MOVE_FROM_CCR, MOVE_FROM_SR,
										-- MOVE_TO_CCR,  NEGX, CLR, NEG, NOT, MOVE_TO_SR, EXT, NBCD,
										-- SWAP, PEA, TAS, TST, MULU, MULS, DIVU, DIVS, LINK, UNLK,
										-- MOVE_USP, JSR, JMP, MOVEM, LEA, CHK, ADDQ, SUBQ, DBcc, Scc,
										-- OR, SUBX, SUB, SUBA, CMPM, CMP, CMPA, EOR, ABCD, EXG, AND,
										-- ADDX, ADDA, ADD, ASL, ASR, LSL, LSR, ROL, ROR, ROXL, ROXR.
	REGSEL_119 <= BIW(0)(11 downto 9); 	-- Valid for BTST, BCHG, BCLR, BSET,MOVEP, MOVEA, MOVE, LEA,
									   	-- CHK, MULU, MULS, DIVU, DIVS, SBCD, OR, SUBX, SUB, SUBA,
									   	-- CMPM, CMP, CMPA, EOR, ABCD, EXG, AND, ADDX, ADDA, ADD.
	
	REGSEL_INDEX <= EXWORD_REG(0)(14 downto 12) when SRC_DESTn = '1' else DEST_EXWORD_REG(0)(14 downto 12);

	C_CODE <= 	To_BitVector(BIW(0)(11 downto 8)); -- Valid for Bcc, DBcc, Scc.

	OP_MODE <= 	BIW(0)(7 downto 3) when OP_I = EXG else
				"00" & BIW(0)(8 downto 6); -- Valid for EXT, OR, SUB, SUBA, CMP, CMPA, EOR, AND, ADDA, ADD.
	TRAP_VECTOR <= BIW(0)(3 downto 0); -- Valid for TRAP.

	with OP_I select
		SEL_DISPLACE_BIW <= '1' when Bcc | BRA | BSR | DBcc | MOVEP | LINK, '0' when others;
		
	DISPLACE_BIW <= x"0000" & BIW(1) when OP_I = BRA and BIW(0)(7 downto 0) = x"00" else -- Word displacement.
                    BIW(1) & BIW(2) when OP_I = BRA and BIW(0)(7 downto 0) = x"FF" else -- LONG displacement 68K20+.
					x"0000" & BIW(1) when OP_I = BSR and BIW(0)(7 downto 0) = x"00" else
                    BIW(1) & BIW(2) when OP_I = BSR and BIW(0)(7 downto 0) = x"FF" else -- LONG displacement 68K20+.
					x"0000" & BIW(1) when OP_I = Bcc and BIW(0)(7 downto 0) = x"00" else
					x"000000" & BIW(0)(7 downto 0) when OP_I = BRA or OP_I = BSR or OP_I = Bcc else
					BIW(1) & BIW(2) when OP_I = LINK and OP_SIZE_I = LONG else
					x"0000" & BIW(1);  -- Valid for DBcc, LINK, MOVEP.

	EXT_DSIZE <= 	LONG when OP_I = LINK and OP_SIZE_I = LONG else
					WORD when OP_I = DBcc or OP_I = MOVEP or OP_I = LINK else
					WORD when OP_I = BRA and BIW(0)(7 downto 0) = x"00" else
                    LONG when OP_I = BRA and BIW(0)(7 downto 0) = x"FF" else -- 68K20+.
					WORD when OP_I = BSR and BIW(0)(7 downto 0) = x"00" else
                    LONG when OP_I = BSR and BIW(0)(7 downto 0) = x"FF" else -- 68K20+.
                    LONG when OP_I = Bcc and BIW(0)(7 downto 0) = x"FF" else -- 68K20+.
					WORD when OP_I = Bcc and BIW(0)(7 downto 0) = x"00" else
					BYTE when OP_I = BRA or OP_I = BSR or OP_I = Bcc else
					WORD when BIW(0)(8 downto 6) = "101" and SRC_DESTn = '0' else -- MOVE.
                    BYTE when BIW(0)(8 downto 6) = "110" and SRC_DESTn = '0' else -- MOVE.
					WORD when BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) = "010" else
					WORD when BIW(0)(5 downto 3) = "101" else BYTE;

	-- The immediate data is modelled in a way, that not used bits are forced to zero. This requires
	-- a bit more logic but makes the CPU immune against compiler behavior concerning the writing of the
	-- none used bits in word and byte mode.
	-- The last two assignments are valid (in the respective mode) for: ADD, ADDA, AND, BTST, CHK, CMP, CMPA,
	-- DIVS, DIVU, MOVEA, MOVE_TO_CCR, MOVE_TO_SR, MULS, MULU, OR, SUB, SUBA, TST.
	DATA_IMMEDIATE <= x"0000" & x"00" & BIW(1)(7 downto 0) when OP_I = ORI_TO_CCR or OP_I = EORI_TO_CCR else
					  x"0000" & BIW(1) when OP_I = EORI_TO_SR or OP_I = ORI_TO_SR or OP_I = ANDI_TO_SR else
					  x"00000008" when (OP_I = ADDQ or OP_I = SUBQ) and BIW(0)(11 downto 9) = "000" else
					  x"0000000" & '0' & BIW(0)(11 downto 9) when OP_I = ADDQ or OP_I = SUBQ else
					  BIW(1) & BIW(2) when (OP_I = ANDI or OP_I = ADDI) and BIW(0)(7 downto 6) = "10" else -- Long.
					  BIW(1) & BIW(2) when (OP_I = CMPI or OP_I = EORI) and BIW(0)(7 downto 6) = "10" else -- Long.
					  BIW(1) & BIW(2) when (OP_I = ORI or OP_I = SUBI) and BIW(0)(7 downto 6) = "10" else -- Long.
					  x"0000" & BIW(1) when (OP_I = ANDI or OP_I = ADDI) and BIW(0)(7 downto 6) = "01" else -- Word.
					  x"0000" & BIW(1) when (OP_I = CMPI or OP_I = EORI) and BIW(0)(7 downto 6) = "01" else -- Word.
					  x"0000" & BIW(1) when (OP_I = ORI or OP_I = SUBI) and BIW(0)(7 downto 6) = "01" else -- Word.
					  x"0000" & x"00" & BIW(1)(7 downto 0) when (OP_I = ANDI or OP_I = ADDI) else -- Byte;
					  x"0000" & x"00" & BIW(1)(7 downto 0) when (OP_I = CMPI or OP_I = EORI) else -- Byte;
					  x"0000" & x"00" & BIW(1)(7 downto 0) when (OP_I = ORI or OP_I = SUBI) else -- Byte;
					  x"0000" & BIW(1) when OP_I = STOP else
					  x"000000" & BIW(0)(7 downto 0) when OP_I = MOVEQ else
					  EXWORD_REG(0) & EXWORD_REG(1) when OP_SIZE_I = LONG else
					  x"0000" & EXWORD_REG(0);

	-- Bit Position for the bit operations BCHG, BCLR, BSET, BTST:
	-- The Bit position is valid if BITPOS_IM is '1'.
	-- If BITPOS_IM is '1', the register selected by REGSEL_119 indicates the bit position.
	BITPOS_IM <= '1' when (OP_I = BCHG or OP_I = BCLR or OP_I = BSET or OP_I = BTST) and BIW(0)(8) = '0' else '0';
	BIT_POS <= BIW(1)(4 downto 0);

	-- Multiplication / Division:
    DIV_MUL_32n64 <= To_Bit(BIW(1)(10));
	REG_Dlq <= BIW(1)(14 downto 12);
	REG_Dhr <= BIW(1)(2 downto 0);


	-- This signal indicates register or memory shifting.
	MEM_SHFT <= '1' when (OP_I = ASL or OP_I = ASR) and BIW(0)(7 downto 6) = "11" else
				'1' when (OP_I = LSL or OP_I = LSR) and BIW(0)(7 downto 6) = "11" else
				'1' when (OP_I = ROTL or OP_I = ROTR) and BIW(0)(7 downto 6) = "11" else
				'1' when (OP_I = ROXL or OP_I = ROXR) and BIW(0)(7 downto 6) = "11" else '0';

	REGLISTMASK <= BIW(1);
	
	OP_SIZE <= OP_SIZE_I;
	OP_SIZE_I <= BYTE when OP_I = ABCD or OP_I = NBCD or OP_I = SBCD else
				 LONG when OP_I = ADDA and BIW(0)(8 downto 6) = "111" else
				 WORD when OP_I = ADDA and BIW(0)(8 downto 6) = "011" else
				 LONG when OP_I = BCHG and BIW(0)(5 downto 3) = "000" else
				 LONG when OP_I = BCLR and BIW(0)(5 downto 3) = "000" else
				 LONG when OP_I = BSET and BIW(0)(5 downto 3) = "000" else
				 LONG when OP_I = BTST and BIW(0)(5 downto 3) = "000" else
				 BYTE when (OP_I = BCHG or OP_I = BCLR) else -- Memory access is byte.
				 BYTE when (OP_I = BSET or OP_I = BTST) else -- Memory access is byte.
				 WORD when OP_I = CHK and BIW(0)(8 downto 7) = "11" else
				 LONG when OP_I = CHK and BIW(0)(8 downto 7) = "10" else
				 LONG when OP_I = CMPA and BIW(0)(8 downto 6) = "111" else
				 WORD when OP_I = CMPA and BIW(0)(8 downto 6) = "011" else
				 LONG when OP_I = DIVS and BIW(0)(8 downto 6) = "001" else
				 LONG when OP_I = DIVU and BIW(0)(8 downto 6) = "001" else
				 WORD when OP_I = DIVS and BIW(0)(8 downto 6) = "111" else
				 WORD when OP_I = DIVU and BIW(0)(8 downto 6) = "011" else
				 LONG when OP_I = EXTW and BIW(0)(7 downto 6) = "11" else
				 WORD when OP_I = EXTW and BIW(0)(7 downto 6) = "10" else
				 WORD when OP_I = LINK and BIW(0)(15 downto 3) = "0100111001010" else
                 LONG when OP_I = LINK and BIW(0)(15 downto 3) = "0100100000001" else
				 BYTE when OP_I = MOVE and BIW(0)(13 downto 12) = "01" else
				 WORD when OP_I = MOVE and BIW(0)(13 downto 12) = "11" else
				 LONG when OP_I = MOVE and BIW(0)(13 downto 12) = "10" else
				 WORD when OP_I = MOVEA and BIW(0)(13 downto 12) = "11" else
				 LONG when OP_I = MOVEA and BIW(0)(13 downto 12) = "10" else
				 LONG when OP_I = MOVEM and BIW(0)(6) = '1' else
				 WORD when OP_I = MOVEM and BIW(0)(6) = '0' else
				 LONG when OP_I = MOVEP and BIW(0)(8 downto 6) = "111" else
				 LONG when OP_I = MOVEP and BIW(0)(8 downto 6) = "101" else
				 WORD when OP_I = MOVEP and BIW(0)(8 downto 6) = "110" else
				 WORD when OP_I = MOVEP and BIW(0)(8 downto 6) = "100" else
				 WORD when OP_I = MOVE_FROM_CCR else 
				 WORD when OP_I = MOVE_FROM_SR else 
				 WORD when OP_I = MOVE_TO_CCR else
				 WORD when OP_I = MOVE_TO_SR else
				 LONG when OP_I = MULS and BIW(0)(8 downto 6) = "000" else
				 LONG when OP_I = MULU and BIW(0)(8 downto 6) = "000" else
				 WORD when OP_I = MULS and BIW(0)(8 downto 6) = "111" else
				 WORD when OP_I = MULU and BIW(0)(8 downto 6) = "011" else
				 LONG when OP_I = SUBA and BIW(0)(8 downto 6) = "111" else
				 WORD when OP_I = SUBA and BIW(0)(8 downto 6) = "011" else
				 BYTE when OP_I = Scc or OP_I = TAS else
				 WORD when (OP_I = ASL or OP_I = ASR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				 WORD when (OP_I = LSL or OP_I = LSR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				 WORD when (OP_I = ROTL or OP_I = ROTR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				 WORD when (OP_I = ROXL or OP_I = ROXR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				 LONG when OP_I = BSR or OP_I = PEA or OP_I = RTS else -- Long words to/from the stack.
				 -- The following three conditions are valid for the listed operations:
				 -- ADDI, ANDI, CMP, CMPI, EORI, ORI, SUBI, ADDQ, SUBQ, ADDX, NEGX, SUBX, ASR,
				 -- ASL, LSR, LSL, ROXR, ROXL, ROTR, ROTL, CLR, NEG, NOT_B, TST, CMPM, JSR.
				 BYTE when BIW(0)(7 downto 6) = "00" else
				 WORD when BIW(0)(7 downto 6) = "01" else
				 LONG when BIW(0)(7 downto 6) = "10" else LONG; -- The default is used for unsized operations LEA, MOVEQ ...

	-- The FORCE_BIW2 indicates, that an operation needs obligatory a further instruction word.
	FORCE_BIW2 <= 	'1' when OP_I = ORI_TO_CCR or OP_I = ORI_TO_SR or OP_I = ORI or OP_I = ANDI_TO_CCR else
					'1' when OP_I = ANDI_TO_SR or OP_I = ANDI or OP_I = SUBI or OP_I = ADDI or OP_I = EORI_TO_CCR else
					'1' when (OP_I = BCHG or OP_I = BCLR or OP_I = BSET or OP_I = BTST) and BIW(0)(8) = '0' else
					'1' when OP_I = EORI_TO_SR or OP_I = EORI or OP_I = CMPI else
					'1' when OP_I = MOVEP or OP_I = LINK or OP_I = STOP else
					'1' when (OP_I = DIVS or OP_I = DIVU) and BIW(0)(8 downto 6) = "001" else
					'1' when (OP_I = MULS or OP_I = MULU) and BIW(0)(8 downto 6) = "000" else
					'1' when OP_I = MOVEM or OP_I = DBcc else
					'1' when (OP_I = BRA or OP_I = BSR or OP_I = Bcc) and BIW(0)(7 downto 0) = x"00" else
                    '1' when (OP_I = BRA or OP_I = BSR or OP_I = Bcc) and BIW(0)(7 downto 0) = x"FF" else '0';

	-- The FORCE_BIW3 indicates, that an operation needs obligatory a third instruction word.
	FORCE_BIW3 <= '1' when OP_I = ORI and OP_SIZE_I = LONG else
				 '1' when OP_I = ANDI and OP_SIZE_I = LONG else
				 '1' when OP_I = SUBI and OP_SIZE_I = LONG else
				 '1' when OP_I = ADDI and OP_SIZE_I = LONG else
				 '1' when OP_I = EORI and OP_SIZE_I = LONG else
				 '1' when OP_I = CMPI and OP_SIZE_I = LONG else
				 '1' when OP_I = LINK and OP_SIZE_I = LONG else
				 '1' when (OP_I = BRA or OP_I = BSR or OP_I = Bcc) and BIW(0)(7 downto 0) = x"FF" else '0';

	-- Enables extension word fetch for the respective commands.
	EXT_EN <= 	'1' when OP_I = ADD or OP_I = ADDA or OP_I = ADDI or OP_I = ADDQ or OP_I = AND_B or OP_I = ANDI else
				'1' when (OP_I = ASL or OP_I = ASR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				'1' when (OP_I = LSL or OP_I = LSR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				'1' when (OP_I = ROXL or OP_I = ROXR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				'1' when (OP_I = ROTL or OP_I = ROTR) and BIW(0)(7 downto 6) = "11" else -- Memory Shifts.
				'1' when OP_I = BCHG or OP_I = BCLR or OP_I = BSET or OP_I = BTST or OP_I = CHK or OP_I = CLR else
				'1' when OP_I = CMP or OP_I = CMPA or OP_I = CMPI or OP_I = DIVS or OP_I = DIVU or OP_I = EOR else
				'1' when OP_I = EORI or OP_I = JMP or OP_I = JSR or OP_I = LEA or OP_I = MOVE or OP_I = MOVEA else
				'1' when OP_I = MOVE_FROM_CCR or OP_I = MOVE_TO_CCR or OP_I = MOVE_FROM_SR or OP_I = MOVE_TO_SR else
				'1' when OP_I = MOVEM or OP_I = MULS or OP_I = MULU or OP_I = NBCD or OP_I = NEG or OP_I = NEGX else
				'1' when OP_I = NOT_B or OP_I = OR_B or OP_I = ORI or OP_I = PEA or OP_I = Scc or OP_I = SUB else
				'1' when OP_I = SUBA or OP_I = SUBI or OP_I = SUBQ or OP_I = TAS or OP_I = TST else '0';

	-- If extension word fetch is enabled, this is the number of source or/and destination extensions to fetch.
	EXT_CNT <= 	2 when BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) = "100" and OP_SIZE_I = LONG and EXT_EN = '1' else
				2 when BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) = "001" and EXT_EN = '1' else
				1 when BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) = "100" and EXT_EN = '1' else
				1 when BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) = "011" and EXT_EN = '1' else
				1 when BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) = "010" and EXT_EN = '1' else
				1 when BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) = "000" and EXT_EN = '1' else
				1 when BIW(0)(5 downto 3) = "110" and EXT_EN = '1' else
				1 when BIW(0)(5 downto 3) = "101" and EXT_EN = '1' else 0;

	-- For the MOVE operation, we need a second set of extension words.
	DEST_EXT_CNT <= 2 when BIW(0)(8 downto 6) = "111" and BIW(0)(11 downto 9) = "001" and OP_I = MOVE else
					1 when BIW(0)(8 downto 6) = "111" and BIW(0)(11 downto 9) = "000" and OP_I = MOVE else
					1 when BIW(0)(8 downto 6) = "110" and OP_I = MOVE else
					1 when BIW(0)(8 downto 6) = "101" and OP_I = MOVE else 0;

	OP_DECODE: process(BIW)
	begin
		-- The default OPCODE is the ILLEGAL operation, if no of the following conditions are met.
		-- If any not used bit pattern occurs, the CPU will result in an ILLEGAL trap. An exception of
		-- this behavior is the OPCODE with the 1010 or the 1111 pattern in the four MSBs. 
		-- These lead to the respective traps.
		OP_I <= ILLEGAL;
		case BIW(0)(15 downto 12) is -- Operation code map.
			when x"0" => -- Bit manipulation / MOVEP / Immediate.
				if BIW(0)(11 downto 0) = x"03C" then
					OP_I <= ORI_TO_CCR;
				elsif BIW(0)(11 downto 0) = x"07C" then
					OP_I <= ORI_TO_SR;
				elsif BIW(0)(11 downto 0) = x"23C" then
					OP_I <= ANDI_TO_CCR;
				elsif BIW(0)(11 downto 0) = x"27C" then
					OP_I <= ANDI_TO_SR;
				elsif BIW(0)(11 downto 0) = x"A3C" then
					OP_I <= EORI_TO_CCR;
				elsif BIW(0)(11 downto 0) = x"A7C" then
					OP_I <= EORI_TO_SR;
				end if;

				case BIW(0)(5 downto 3) is -- Addressing mode.
					when "000" | "010" | "011" | "100" | "101" | "110" =>
						-- Bit operations with static bit number:
						if BIW(0)(11 downto 6) = "100000" then
							OP_I <= BTST;
						elsif BIW(0)(11 downto 6) = "100001" then
							OP_I <= BCHG;
						elsif BIW(0)(11 downto 6) = "100010" then
							OP_I <= BCLR;
						elsif BIW(0)(11 downto 6) = "100011" then
							OP_I <= BSET;
						-- Logic operations:
						elsif BIW(0)(11 downto 8) = x"0" and BIW(0)(7 downto 6) < "11" then
							OP_I <= ORI;
						elsif BIW(0)(11 downto 8) = x"2" and BIW(0)(7 downto 6) < "11" then
							OP_I <= ANDI;
						elsif BIW(0)(11 downto 8) = x"4" and BIW(0)(7 downto 6) < "11" then
							OP_I <= SUBI;
						elsif BIW(0)(11 downto 8) = x"6" and BIW(0)(7 downto 6) < "11" then
							OP_I <= ADDI;
						elsif BIW(0)(11 downto 8) = x"A" and BIW(0)(7 downto 6) < "11" then
							OP_I <= EORI;
						elsif BIW(0)(11 downto 8) = x"C" and BIW(0)(7 downto 6) < "11" then
							OP_I <= CMPI;
						-- Bit operations with dynamic bit number:
						elsif BIW(0)(8 downto 6) = "100" then
							OP_I <= BTST;
						elsif BIW(0)(8 downto 6) = "101" then
							OP_I <= BCHG;
						elsif BIW(0)(8 downto 6) = "110" then
							OP_I <= BCLR;
						elsif BIW(0)(8 downto 6) = "111" then
							OP_I <= BSET;
						end if;
					when "111" =>
						-- In the addressing mode "111" not all register selections are valid.
						-- Bit operations with static bit number:
						if BIW(0)(11 downto 6) = "100000" and BIW(0)(2 downto 0) < "100" then
							OP_I <= BTST;
						elsif BIW(0)(11 downto 6) = "100001" and BIW(0)(2 downto 0) < "010" then
							OP_I <= BCHG;
						elsif BIW(0)(11 downto 6) = "100010" and BIW(0)(2 downto 0) < "010" then
							OP_I <= BCLR;
						elsif BIW(0)(11 downto 6) = "100011" and BIW(0)(2 downto 0) < "010" then
							OP_I <= BSET;
						-- Logic operations:
						elsif BIW(0)(11 downto 8) = x"0" and BIW(0)(7 downto 6) < "11" and BIW(0)(2 downto 0) < "010" then
							OP_I <= ORI;
						elsif BIW(0)(11 downto 8) = x"2" and BIW(0)(7 downto 6) < "11" and BIW(0)(2 downto 0) < "010" then
							OP_I <= ANDI;
						elsif BIW(0)(11 downto 8) = x"4" and BIW(0)(7 downto 6) < "11" and BIW(0)(2 downto 0) < "010" then
							OP_I <= SUBI;
						elsif BIW(0)(11 downto 8) = x"6" and BIW(0)(7 downto 6) < "11" and BIW(0)(2 downto 0) < "010" then
							OP_I <= ADDI;
						elsif BIW(0)(11 downto 8) = x"A" and BIW(0)(7 downto 6) < "11" and BIW(0)(2 downto 0) < "010" then
							OP_I <= EORI;
						--elsif BIW(0)(11 downto 8) = x"C" and BIW(0)(7 downto 6) < "11" and BIW(0)(2 downto 0) < "010" then -- 68K.
						elsif BIW(0)(11 downto 8) = x"C" and BIW(0)(7 downto 6) < "11" and BIW(0)(2 downto 0) < "100" then -- 68K+
							OP_I <= CMPI;
						-- Bit operations with dynamic bit number:
						elsif BIW(0)(8 downto 6) = "100" and BIW(0)(2 downto 0) < "101" then
							OP_I <= BTST;
						elsif BIW(0)(8 downto 6) = "101" and BIW(0)(2 downto 0) < "010" then
							OP_I <= BCHG;
						elsif BIW(0)(8 downto 6) = "110" and BIW(0)(2 downto 0) < "010" then
							OP_I <= BCLR;
						elsif BIW(0)(8 downto 6) = "111" and BIW(0)(2 downto 0) < "010" then
							OP_I <= BSET;
						end if;
					when others =>
						null;
				end case;

				if BIW(0)(8 downto 6) > "011" and BIW(0)(5 downto 3) = "001" then
					OP_I <= MOVEP;
				end if;
			when x"1" => -- Move BYTE.
				if BIW(0)(8 downto 6) = "111" and BIW(0)(11 downto 9) < "010"
						and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= MOVE;
				elsif BIW(0)(8 downto 6) = "111" and BIW(0)(11 downto 9) < "010" and BIW(0)(5 downto 3) /= "001"  and BIW(0)(5 downto 3) /= "111" then
					OP_I <= MOVE;
				elsif BIW(0)(8 downto 6) /= "001" and BIW(0)(8 downto 6) /= "111" 
						and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= MOVE;
				elsif BIW(0)(8 downto 6) /= "001" and BIW(0)(8 downto 6) /= "111" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= MOVE;
				end if;
			when x"2" | x"3" => -- Move WORD or LONG.
				if BIW(0)(8 downto 6) = "111" and BIW(0)(11 downto 9) < "010" 
						and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= MOVE;
				elsif BIW(0)(8 downto 6) = "111" and BIW(0)(11 downto 9) < "010" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= MOVE;
				elsif BIW(0)(8 downto 6) = "001" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= MOVEA;
				elsif BIW(0)(8 downto 6) = "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= MOVEA;
				elsif BIW(0)(8 downto 6) /= "111" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= MOVE;
				elsif BIW(0)(8 downto 6) /= "111" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= MOVE;
				end if;
			when x"4" => -- Miscellaneous.
				if BIW(0)(11 downto 0) = x"E70" then
					OP_I <= RESET;
				elsif BIW(0)(11 downto 0) = x"E71" then
					OP_I <= NOP;
				elsif BIW(0)(11 downto 0) = x"E72" then
					OP_I <= STOP;
				elsif BIW(0)(11 downto 0) = x"E73" then
					OP_I <= RTE;
				elsif BIW(0)(11 downto 0) = x"E75" then
					OP_I <= RTS;
				elsif BIW(0)(11 downto 0) = x"E76" then
					OP_I <= TRAPV;
				elsif BIW(0)(11 downto 0) = x"E77" then
					OP_I <= RTR;
				elsif BIW(0)(11 downto 0) = x"AFA" then
					OP_I <= RESERVED;
				elsif BIW(0)(11 downto 0) = x"AFB" then
					OP_I <= RESERVED;
				elsif BIW(0)(11 downto 0) = x"AFC" then
					OP_I <= ILLEGAL;
				elsif BIW(0)(11 downto 3) = "100000001" then -- 68K20, 68K30, 68K40
					OP_I <= LINK; -- LONG.
				elsif BIW(0)(11 downto 3) = "111001010" then
					OP_I <= LINK; -- WORD.
				elsif BIW(0)(11 downto 3) = "111001011" then
					OP_I <= UNLK;
				elsif BIW(0)(11 downto 3) = "100001000" then
					OP_I <= SWAP;
				elsif BIW(0)(11 downto 4) = x"E4" then
					OP_I <= TRAP;
				elsif BIW(0)(11 downto 4) = x"E6" then
					OP_I <= MOVE_USP;
				end if;

				case BIW(0)(5 downto 3) is -- Addressing mode.
					when "000" | "010" | "011" | "100" | "101" | "110" =>
						if BIW(0)(11 downto 6) = "110001" then
							if BIW(1)(11) = '1' then
								OP_I <= DIVS; -- Long.
							else
								OP_I <= DIVU; -- Long.
							end if;
-- 68010 up stuff:
--						elsif BIW(0)(11 downto 6) = "001011" then
-- 							OP_I <= MOVE_FROM_CCR; -- 68K+ enhancement.
                        elsif BIW(0)(11 downto 6) = "000011" then
							OP_I <= MOVE_FROM_SR;
						elsif BIW(0)(11 downto 6) = "010011" then
							OP_I <= MOVE_TO_CCR;					
						elsif BIW(0)(11 downto 6) = "011011" then
							OP_I <= MOVE_TO_SR;
						elsif BIW(0)(11 downto 6) = "110000" then
							if BIW(1)(11) = '1' then
								OP_I <= MULS; -- Long.
							else
								OP_I <= MULU; -- Long.
							end if;
						elsif BIW(0)(11 downto 6) = "100000" then
							OP_I <= NBCD;
						elsif BIW(0)(11 downto 6) = "101011" then
							OP_I <= TAS;
						end if;
					when  "111" => -- Not all registers are valid for this mode.
						if BIW(0)(11 downto 6) = "110001" and BIW(0)(2 downto 0) < "101" then
							if BIW(1)(11) = '1' then
								OP_I <= DIVS; -- Long.
							else
								OP_I <= DIVU; -- Long.
							end if;
-- 68010 up stuff:
--						elsif BIW(0)(11 downto 6) = "001011" and BIW(0)(2 downto 0) < "010" then
--							OP_I <= MOVE_FROM_CCR; -- 68K+ enhancement.
						elsif BIW(0)(11 downto 6) = "000011" and BIW(0)(2 downto 0) < "010" then
							OP_I <= MOVE_FROM_SR;
						elsif BIW(0)(11 downto 6) = "010011" and BIW(0)(2 downto 0) < "101" then
							OP_I <= MOVE_TO_CCR;					
						elsif BIW(0)(11 downto 6) = "011011" and BIW(0)(2 downto 0) < "101" then
							OP_I <= MOVE_TO_SR;
						elsif BIW(0)(11 downto 6) = "110000" and BIW(0)(2 downto 0) < "101" then
							if BIW(1)(11) = '1' then
								OP_I <= MULS; -- Long.
							else
								OP_I <= MULU; -- Long.
							end if;
						elsif BIW(0)(11 downto 6) = "100000" and BIW(0)(2 downto 0) < "010" then
							OP_I <= NBCD;
						elsif BIW(0)(11 downto 6) = "101011" and BIW(0)(2 downto 0) < "010" then
							OP_I <= TAS;
						end if;
					when others =>
						null;
				end case;
							
				case BIW(0)(5 downto 3) is -- Addressing mode.
					when "010" | "101" | "110" =>
						if BIW(0)(11 downto 6) = "100001" then
							OP_I <= PEA;
						elsif BIW(0)(11 downto 6) = "111010" then
							OP_I <= JSR;
						elsif BIW(0)(11 downto 6) = "111011" then
							OP_I <= JMP;
						end if;
					when  "111" => -- Not all registers are valid for this mode.
						if BIW(0)(11 downto 6) = "100001" and BIW(0)(2 downto 0) < "100" then
							OP_I <= PEA;
						elsif BIW(0)(11 downto 6) = "111010" and BIW(0)(2 downto 0) < "100" then
							OP_I <= JSR;
						elsif BIW(0)(11 downto 6) = "111011" and BIW(0)(2 downto 0) < "100" then
							OP_I <= JMP;
						end if;
					when others =>
						null;
				end case;

				-- For the following operation codes a SIZE (BIW(0)(7 downto 6)) is not valid.
				-- For the following operation codes an addressing mode x"001" is not valid.
				if BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					case BIW(0)(11 downto 8) is
						when x"0" => OP_I <= NEGX;
						when x"2" => OP_I <= CLR;
						when x"4" => OP_I <= NEG;
						when x"6" => OP_I <= NOT_B;
						when others => null;
					end case;
				-- Not all registers are valid for the addressing mode "111":
				elsif BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					case BIW(0)(11 downto 8) is
						when x"0" => OP_I <= NEGX;
						when x"2" => OP_I <= CLR;
						when x"4" => OP_I <= NEG;
						when x"6" => OP_I <= NOT_B;
						when others => null;
					end case;
				end if;

				-- if BIW(0)(11 downto 8) = x"A" and BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) = "111" and (BIW(0)(2 downto 0) < "010" or BIW(0)(2 downto 0) = "100") then -- 68K
                if BIW(0)(11 downto 8) = x"A" and BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then -- 68K+
					case BIW(0)(7 downto 6) is
						when "01" | "10" => OP_I <= TST; -- Long or word, all addressing modes.
						when others => -- Byte: Address register direct not allowed.
							if BIW(0)(2 downto 0) /= "100" then
								OP_I <= TST;
							end if;
					end case;
				elsif BIW(0)(11 downto 8) = x"A" and BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) /= "111" then
					case BIW(0)(7 downto 6) is
						when "01" | "10" => OP_I <= TST; -- Long or word, all addressing modes.
						when others => -- Byte: Address register direct not allowed.
							if BIW(0)(5 downto 3) /= "001" then
								OP_I <= TST;
							end if;
					end case;
				end if;

				if BIW(0)(11 downto 9) = "100" and BIW(0)(5 downto 3) = "000" then
					case BIW(0)(8 downto 6) is -- Valid OPMODES for this operation code.
						when "010" | "011" => OP_I <= EXTW;
						when others => null;
					end case;
				end if;
				
				if BIW(0)(8 downto 6) = "111" then
					case BIW(0)(5 downto 3) is -- OPMODES.
						when "010" | "101" | "110" =>
							OP_I <= LEA;
						when "111" =>
							if BIW(0)(2 downto 0) < "100" then -- Not all registers are valid for this OPMODE.
								OP_I <= LEA;
							end if;
						when others => null;
					end case;
				end if;

				if BIW(0)(11) = '1' and BIW(0)(9 downto 7) = "001" then
					if BIW(0)(10) = '0' then -- Register to memory transfer.
						case BIW(0)(5 downto 3) is -- OPMODES, no postincrement addressing.
							when "010" | "100" | "101" | "110" =>
								OP_I <= MOVEM;
							when "111" =>
								if BIW(0)(2 downto 0) = "000" or BIW(0)(2 downto 0) = "001" then
									OP_I <= MOVEM;
								end if;
							when others => null;
						end case;
					else -- Memory to register transfer, no predecrement addressing.
						case BIW(0)(5 downto 3) is -- OPMODES.
							when "010" | "011" | "101" | "110" =>
								OP_I <= MOVEM;
							when "111" =>
								if BIW(0)(2 downto 0) < "100" then
									OP_I <= MOVEM;
								end if;
							when others => null;
						end case;
					end if;
				end if;
				-- The size must be "10" or "11" and the OPMODE may not be "001".
                if BIW(0)(8 downto 7) >= "10" and BIW(0)(6 downto 3) = x"7" and BIW(0)(2 downto 0) < "101" then
					OP_I <= CHK;
                elsif BIW(0)(8 downto 7) >= "10" and BIW(0)(6 downto 3) /= x"1" and BIW(0)(6 downto 3) < x"7" then
					OP_I <= CHK;
				end if;
			when x"5" => -- ADDQ / SUBQ / Scc / DBcc.
				if BIW(0)(7 downto 3) = "11001" then
					OP_I <= DBcc;
				elsif BIW(0)(7 downto 6) = "11" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= Scc;
				elsif BIW(0)(7 downto 6) = "11" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= Scc;
				--
				elsif BIW(0)(8) = '0' and BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= ADDQ;
				elsif BIW(0)(8) = '0' and (BIW(0)(7 downto 6) = "01" or BIW(0)(7 downto 6) = "10") and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ADDQ;
				elsif BIW(0)(8) = '0' and BIW(0)(7 downto 6) = "00" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ADDQ;
				--
				elsif BIW(0)(8) = '1' and BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= SUBQ;
				elsif BIW(0)(8) = '1' and (BIW(0)(7 downto 6) = "01" or BIW(0)(7 downto 6) = "10") and BIW(0)(5 downto 3) /= "111" then
					OP_I <= SUBQ;
				elsif BIW(0)(8) = '1' and BIW(0)(7 downto 6) = "00" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= SUBQ;
				end if;
			when x"6" => -- Bcc / BSR / BRA.
				if BIW(0)(11 downto 8) = x"0" then
					OP_I <= BRA;
				elsif BIW(0)(11 downto 8) = x"1" then
					OP_I <= BSR;
				else
					OP_I <= Bcc;
				end if;
			when x"7" => -- MOVEQ.
				if BIW(0)(8) = '0' then
					OP_I <= MOVEQ;
				end if;
			when x"8" => -- OR / DIV / SBCD.
				if BIW(0)(8 downto 6) = "011" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= DIVU; -- WORD.
				elsif BIW(0)(8 downto 6) = "011" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= DIVU; -- WORD.
				elsif BIW(0)(8 downto 6) = "111" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= DIVS; -- WORD.
				elsif BIW(0)(8 downto 6) = "111" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= DIVS; -- WORD.
				elsif BIW(0)(8 downto 4) = "10000" then
					OP_I <= SBCD;
				end if;
				
				case BIW(0)(8 downto 6) is
					when "000" | "001" | "010" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
							OP_I <= OR_B;
						elsif BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
							OP_I <= OR_B;
						end if;
					when "100" | "101" | "110" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
							OP_I <= OR_B;
						elsif BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
							OP_I <= OR_B;
						end if;
					when others =>
						null;
				end case;
			when x"9" => -- SUB / SUBX.
				case BIW(0)(8 downto 6) is
					when "000" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
							OP_I <= SUB;
						elsif BIW(0)(5 downto 3) /= "111" and BIW(0)(5 downto 3) /= "001" then
							OP_I <= SUB;
						end if;
					when "001" | "010" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
							OP_I <= SUB;
						elsif BIW(0)(5 downto 3) /= "111" then
							OP_I <= SUB;
						end if;
					when "100" =>
						if BIW(0)(5 downto 3) = "000" or BIW(0)(5 downto 3) = "001" then
							OP_I <= SUBX;
						elsif BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
							OP_I <= SUB;
						elsif BIW(0)(5 downto 3) /= "111" and BIW(0)(5 downto 3) /= "001" then
							OP_I <= SUB;
						end if;
					when "101" | "110"	=>
						if BIW(0)(5 downto 3) = "000" or BIW(0)(5 downto 3) = "001" then
							OP_I <= SUBX;
						elsif BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
							OP_I <= SUB;
						elsif BIW(0)(5 downto 3) /= "111" then
							OP_I <= SUB;
						end if;
					when "011" | "111" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
							OP_I <= SUBA;
						elsif BIW(0)(5 downto 3) /= "111" then
							OP_I <= SUBA;
						end if;
					when others => -- U, X, Z, W, H, L, -.
						null;
				end case;
			when x"A" => -- (1010, Unassigned, Reserved).
				OP_I <= UNIMPLEMENTED; -- Dummy.
			when x"B" => -- CMP / EOR.
				if BIW(0)(8) = '1' and BIW(0)(7 downto 6) < "11" and BIW(0)(5 downto 3) = "001" then
					OP_I <= CMPM;
				else
					case BIW(0)(8 downto 6) is -- OPMODE field.
						when "000" =>
							if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
								OP_I <= CMP;
							elsif BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
								OP_I <= CMP;
							end if;
						when "001" | "010" =>
							if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
								OP_I <= CMP;
							elsif BIW(0)(5 downto 3) /= "111" then
								OP_I <= CMP;
							end if;
						when "011" | "111" =>
							if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
								OP_I <= CMPA;
							elsif BIW(0)(5 downto 3) /= "111" then
								OP_I <= CMPA;
							end if;
						when "100" | "101" | "110" =>
							if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
								OP_I <= EOR;
							elsif BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
								OP_I <= EOR;
							end if;
						when others => -- U, X, Z, W, H, L, -.
							null;
					end case;
				end if;
			when x"C" => -- AND / MUL / ABCD / EXG.
				if BIW(0)(8 downto 4) = "10000" then
					OP_I <= ABCD;
				elsif BIW(0)(8 downto 6) = "011" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= MULU; -- WORD.
				elsif BIW(0)(8 downto 6) = "011" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= MULU; -- WORD.
				elsif BIW(0)(8 downto 6) = "111" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
					OP_I <= MULS; -- WORD.
				elsif BIW(0)(8 downto 6) = "111" and BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= MULS; -- WORD.
				elsif BIW(0)(8 downto 3) = "101000" or BIW(0)(8 downto 3) = "101001" or BIW(0)(8 downto 3) = "110001" then
					OP_I <= EXG;
				else
					case BIW(0)(8 downto 6) is -- OPMODE
						when "000" | "001" | "010" =>
							if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
								OP_I <= AND_B;
							elsif BIW(0)(5 downto 3) /= "001" and BIW(0)(5 downto 3) /= "111" then
								OP_I <= AND_B;
							end if;
						when "100" | "101" | "110" =>
							if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
								OP_I <= AND_B;
							elsif BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
								OP_I <= AND_B;
							end if;
						when others =>
							null;
					end case;
				end if;
			when x"D" => -- ADD / ADDX.
				case BIW(0)(8 downto 6) is
					when "000" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
							OP_I <= ADD;
						elsif BIW(0)(5 downto 3) /= "111" and BIW(0)(5 downto 3) /= "001" then
							OP_I <= ADD;
						end if;
					when "001" | "010" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
							OP_I <= ADD;
						elsif BIW(0)(5 downto 3) /= "111" then
							OP_I <= ADD;
						end if;
					when "100"	=>
						if BIW(0)(5 downto 3) = "000" or BIW(0)(5 downto 3) = "001" then
							OP_I <= ADDX;
						elsif BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
							OP_I <= ADD;
						elsif BIW(0)(5 downto 3) /= "111" and BIW(0)(5 downto 3) /= "001" then
							OP_I <= ADD;
						end if;
					when "101" | "110"	=>
						if BIW(0)(5 downto 3) = "000" or BIW(0)(5 downto 3) = "001" then
							OP_I <= ADDX;
						elsif BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
							OP_I <= ADD;
						elsif BIW(0)(5 downto 3) /= "111" then
							OP_I <= ADD;
						end if;
					when "011" | "111" =>
						if BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "101" then
							OP_I <= ADDA;
						elsif BIW(0)(5 downto 3) /= "111" then
							OP_I <= ADDA;
						end if;
					when others => -- U, X, Z, W, H, L, -.
						null;
				end case;
			when x"E" => -- Shift / Rotate / Bit Field.
				if BIW(0)(11 downto 6) = "000011" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= ASR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "000011" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ASR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "000111" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= ASL; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "000111" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ASL; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "001011" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= LSR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "001011" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= LSR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "001111" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= LSL; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "001111" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= LSL; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "010011" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= ROXR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "010011" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ROXR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "010111" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= ROXL; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "010111" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ROXL; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "011011" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= ROTR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "011011" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ROTR; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "011111" and BIW(0)(5 downto 3) = "111" and BIW(0)(2 downto 0) < "010" then
					OP_I <= ROTL; -- Memory shifts.
				elsif BIW(0)(11 downto 6) = "011111" and BIW(0)(5 downto 3) > "001" and BIW(0)(5 downto 3) /= "111" then
					OP_I <= ROTL; -- Memory shifts.
				elsif BIW(0)(8) = '0' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "00" then
					OP_I <= ASR; -- Register shifts.
				elsif BIW(0)(8) = '1' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "00" then
					OP_I <= ASL; -- Register shifts.
				elsif BIW(0)(8) = '0' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "01" then
					OP_I <= LSR; -- Register shifts.
				elsif BIW(0)(8) = '1' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "01" then
					OP_I <= LSL; -- Register shifts.
				elsif BIW(0)(8) = '0' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "10" then
					OP_I <= ROXR; -- Register shifts.
				elsif BIW(0)(8) = '1' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "10" then
					OP_I <= ROXL; -- Register shifts.
				elsif BIW(0)(8) = '0' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "11" then
					OP_I <= ROTR; -- Register shifts.
				elsif BIW(0)(8) = '1' and BIW(0)(7 downto 6) < "11" and BIW(0)(4 downto 3) = "11" then
					OP_I <= ROTL; -- Register shifts.
				end if;
			when x"F" => -- 1111, Coprocessor Interface / 68K40 Extensions.
				OP_I <= UNIMPLEMENTED; -- Dummy.
			when others => -- U, X, Z, W, H, L, -.
				null;
			end case;
	end process OP_DECODE;
end BEHAVIOR;
