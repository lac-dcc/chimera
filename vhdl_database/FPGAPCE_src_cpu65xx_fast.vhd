-- -----------------------------------------------------------------------
--
--                                 FPGA 64
--
--     A fully functional commodore 64 implementation in a single FPGA
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
-- -----------------------------------------------------------------------
--
-- Table driven, cycle exact 6502/6510 core
--
-- -----------------------------------------------------------------------

-- Modified by Gregory Estrade (Torlus) to implement a HuC6280 core.
-- I tried to keep all my modifications easily noticeable
-- by marking code changes with comments starting/ending with --GE.
-- The 'T' register has been renamed to 'U', to avoid confusion with the T flag.
-- IRQ has been replaced by IRQ2

library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

-- -----------------------------------------------------------------------

-- Store Zp    (3) => fetch, cycle2, cycleEnd
-- Store Zp,x  (4) => fetch, cycle2, preWrite, cycleEnd
-- Read  Zp,x  (4) => fetch, cycle2, cycleRead, cycleRead2
-- Rmw   Zp,x  (6) => fetch, cycle2, cycleRead, cycleRead2, cycleRmw, cycleEnd
-- Store Abs   (4) => fetch, cycle2, cycle3, cycleEnd
-- Store Abs,x (5) => fetch, cycle2, cycle3, preWrite, cycleEnd
-- Rts         (6) => fetch, cycle2, cycle3, cycleRead, cycleJump, cycleIncrEnd
-- Rti         (6) => fetch, cycle2, stack1, stack2, stack3, cycleJump
-- Jsr         (6) => fetch, cycle2, .. cycle5, cycle6, cycleJump
-- Jmp abs     (-) => fetch, cycle2, .., cycleJump
-- Jmp (ind)   (-) => fetch, cycle2, .., cycleJump
-- Brk / irq   (6) => fetch, cycle2, stack2, stack3, stack4
-- -----------------------------------------------------------------------

--GE Here is the modified state machine behaviour
--GE -----------------------------------------------------------------------
--GE Read imm        (2) => opcodeFetch, cycle2
--GE Read abs        (5) => opcodeFetch, cycle2, cycle3, cyclePreReadAbs, cycleRead
--GE Read abs,X      (5) => opcodeFetch, cycle2, cycle3, cyclePreReadAbs, cycleRead
--GE Read abs,Y      (5) => opcodeFetch, cycle2, cycle3, cyclePreReadAbs, cycleRead
--GE Read zp         (4) => opcodeFetch, cycle2, cyclePreRead, cycleRead
--GE Read zp,X       (4) => opcodeFetch, cycle2, cyclePreRead, cycleRead
--GE Read (zp)       (7) => opcodeFetch, cycle2, cyclePreIndirect, cycleIndirect, cycle3, cyclePreReadAbs, cycleRead
--GE Read (zp,X)     (7) => opcodeFetch, cycle2, cyclePreIndirect, cycleIndirect, cycle3, cyclePreReadAbs, cycleRead
--GE Read (zp),Y     (7) => opcodeFetch, cycle2, cyclePreIndirect, cycleIndirect, cycle3, cyclePreReadAbs, cycleRead

--GE Write abs       (5) => opcodeFetch, cycle2, cycle3, cyclePreWrite, cycleWrite
--GE Write abs,X     (5) => opcodeFetch, cycle2, cycle3, cyclePreWrite, cycleWrite
--GE Write abs,Y     (5) => opcodeFetch, cycle2, cycle3, cyclePreWrite, cycleWrite
--GE Write zp        (4) => opcodeFetch, cycle2, cyclePreWrite, cycleWrite
--GE Write zp,X      (4) => opcodeFetch, cycle2, cyclePreWrite, cycleWrite
--GE Write (zp)      (7) => opcodeFetch, cycle2, cyclePreIndirect, cycleIndirect, cycle3, cyclePreWrite, cycleWrite
--GE Write (zp,X)    (7) => opcodeFetch, cycle2, cyclePreIndirect, cycleIndirect, cycle3, cyclePreWrite, cycleWrite
--GE Write (zp),Y    (7) => opcodeFetch, cycle2, cyclePreIndirect, cycleIndirect, cycle3, cyclePreWrite, cycleWrite

--GE Rmw abs         (7) => opcodeFetch, cycle2, cycle3, cyclePreReadAbs, cycleRead, cycleRmw, cycleWrite
--GE Rmw abs,X       (7) => opcodeFetch, cycle2, cycle3, cyclePreReadAbs, cycleRead, cycleRmw, cycleWrite
--GE Rmw zp          (6) => opcodeFetch, cycle2, cyclePreRead, cycleRead, cycleRmw, cycleWrite
--GE Rmw zp,X        (6) => opcodeFetch, cycle2, cyclePreRead, cycleRead, cycleRmw, cycleWrite

--GE Bxx rel         (2/4) => opcodeFetch, cycle2, (cycleBranchTaken, cycleEnd/cycleBranchPage)
--GE BBxn zp, rel    (6/8) => opcodeFetch, cycle2, cyclePreRead, cycleRead, cyclePreReadRel, cycleReadRel, (cycleBranchTaken, cycleEnd/cycleBranchPage)
--GE xMBn zp         (7) => opcodeFetch, cycle2, cyclePreRead, cycleRead, cycleRmw, cyclePreWrite, cycleWrite

--GE Jsr abs         (7) => opcodeFetch, cycle2, cycleStack1, cycleStack2, cycleStack3, cycleJump, cycleEnd
--GE Bsr rel         (8) => opcodeFetch, cycle2, cycleStack1, cycleStack2, cycleStack3, cyclePreBranchTaken, cycleBranchTaken, cycleEnd/cycleBranchPage

--GE Rti             (7) => opcodeFetch, cycle2, cycleStack1, cycleStack2, cycleRead, cycleJump, cycleEnd
--GE Rts             (7) => opcodeFetch, cycle2, cycleStack1, cycleStack2, cycleJump, cycleEnd, cycleEndIncr

--GE Push reg        (3) => opcodeFetch, cycle2, cycleWrite
--GE Pull reg        (4) => opcodeFetch, cycle2, cycleStack1, cycleRead
--GE -----------------------------------------------------------------------

architecture fast of cpu65xx is
-- Statemachine
	type cpuCycles is (
		opcodeFetch,  -- New opcode is read and registers updated
		cycle2,
		cycle3,
		cyclePreIndirect,
		cycleIndirect,
		cyclePreBranchTaken, --GE HuC6280 for BSR
		cycleBranchTaken,
		cycleBranchPage,
		cyclePreRead,     -- Cycle before read while doing zeropage indexed addressing.
		cyclePreReadAbs,  --GE HuC6280 hutech.txt R(ABS,ABX,ABY) takes 1 extra cycle
		cycleRead,        -- Read cycle
		cycleRead2,       -- Second read cycle after page-boundary crossing. --GE no more used
		cyclePreReadRel,  --GE 65C02/HuC6280 - for BBxn instructions
		cycleReadRel,     --GE 65C02/HuC6280 - for BBxn instructions
		cyclePreReadImm,  --GE 65C02/HuC6280 - for TST,TAM,TMA instructions
		cycleReadImm,     --GE 65C02/HuC6280 - for TST,TAM,TMA instructions
		cyclePostReadImm, --GE 65C02/HuC6280 - for TST,TAM,TMA instructions
		cycleRmw,         -- Calculate ALU output for read-modify-write instr.		
		cyclePreWrite,    -- Cycle before write when doing indexed addressing.
		cycleWrite,       -- Write cycle for zeropage or absolute addressing.
		cycleTRead,       --GE HuC6280 for T flag management
		cycleTPreWrite,
		cycleTWrite,
		cycleStack1,
		cycleStack2,
		cycleStack3,
		cycleStack4,
		cycleJump,	      -- Last cycle of Jsr, Jmp. Next fetch address is target addr.
		cycleEnd,
		cycleEndIncr,     --GE extra cycle for RTS
		
		cycleBlkPreSd,     --GE HuC6280 - Extra states for block transfer instructions
		cycleBlkSdY,
		cycleBlkSdA,
		cycleBlkSdX,
		cycleBlkRdSrcA1,
		cycleBlkRdSrcA2,
		cycleBlkRdDstA1,
		cycleBlkRdDstA2,
		cycleBlkRdLen1,
		cycleBlkRdLen2,
		cycleBlkPreTrs,
		cycleBlkTrsRd1,
		cycleBlkTrsRd2,
		cycleBlkTrsWr1,
		cycleBlkTrsWr2,
		cycleBlkTrsLoop1,
		cycleBlkTrsLoop2,
		cycleBlkPreSu,
		cycleBlkSuX,
		cycleBlkSuA,
		cycleBlkSuY
	);
	signal theCpuCycle : cpuCycles;
	signal nextCpuCycle : cpuCycles;
	signal updateRegisters : boolean;
	signal processIrq : std_logic;
	signal nmiReg: std_logic;
	signal nmiEdge: std_logic;
	signal irq1Reg : std_logic; --GE HuC6280
	signal irq2Reg : std_logic; -- Delay IRQ input with one clock cycle.
	signal tiqReg : std_logic;  --GE HuC6280
	signal soReg : std_logic; -- SO pin edge detection

-- Opcode decoding
	constant opcUpdateA    : integer := 0;
	constant opcUpdateX    : integer := 1;
	constant opcUpdateY    : integer := 2;
	constant opcUpdateS    : integer := 3;
	constant opcUpdateN    : integer := 4;
	constant opcUpdateV    : integer := 5;
	constant opcUpdateD    : integer := 6;
	constant opcUpdateI    : integer := 7;
	constant opcUpdateZ    : integer := 8;
	constant opcUpdateC    : integer := 9;

	constant opcSecondByte : integer := 10;
	constant opcAbsolute   : integer := 11;
	constant opcZeroPage   : integer := 12;
	constant opcIndirect   : integer := 13;
	constant opcStackAddr  : integer := 14; -- Push/Pop address
	constant opcStackData  : integer := 15; -- Push/Pop status/data
	constant opcJump       : integer := 16;
	constant opcBranch     : integer := 17;
	constant indexX        : integer := 18;
	constant indexY        : integer := 19;
	constant opcStackUp    : integer := 20;
	constant opcWrite      : integer := 21;
	constant opcRmw        : integer := 22;
	constant opcIncrAfter  : integer := 23; -- Insert extra cycle to increment PC (RTS)
	constant opcRti        : integer := 24;
	constant opcIRQ        : integer := 25;

	constant opcInA        : integer := 26;
	constant opcInE        : integer := 27;
	constant opcInX        : integer := 28;
	constant opcInY        : integer := 29;
	constant opcInS        : integer := 30;
	constant opcInU        : integer := 31;
	constant opcInH        : integer := 32;
	constant opcInClear    : integer := 33;
	constant aluMode1From  : integer := 34;
	--
	constant aluMode1To    : integer := 37;
	constant aluMode2From  : integer := 38;
	--
	--GE aluMode2 size has changed from 3 to 4
	constant aluMode2To    : integer := 40+1;
	--
	constant opcInCmp      : integer := 41+1;
	constant opcInCpx      : integer := 42+1;
	constant opcInCpy      : integer := 43+1;
	--GE HuC6280 specific attributes/instructions
	constant opcSetSpeed   : integer := 45;
	constant opcBbxn       : integer := 46;
	constant opcXmbn       : integer := 47;
	constant opcSwap       : integer := 48;
	constant opcUseT       : integer := 49;
	constant opcUpdateT    : integer := 50;
	constant opcImmInW     : integer := 51;
	constant opcMpr        : integer := 52;
	constant opcTst        : integer := 53;
	constant opcStn        : integer := 54;
	constant opcBlock      : integer := 55;
	
	subtype addrDef is unsigned(0 to 15);
	--
	--               is Interrupt  -----------------+
	--          instruction is RTI ----------------+|
	--    PC++ on last cycle (RTS) ---------------+||
	--                      RMW    --------------+|||
	--                     Write   -------------+||||
	--               Pop/Stack up -------------+|||||
	--                    Branch   ---------+  ||||||
	--                      Jump ----------+|  ||||||
	--            Push or Pop data -------+||  ||||||
	--            Push or Pop addr ------+|||  ||||||
	--                   Indirect  -----+||||  ||||||
	--                    ZeroPage ----+|||||  ||||||
	--                    Absolute ---+||||||  ||||||
	--              PC++ on cycle2 --+|||||||  ||||||
	--                               |AZI||JBXY|WM|||
	constant immediate : addrDef := "1000000000000000";
	constant implied   : addrDef := "0000000000000000";
	-- Zero page
	constant readZp    : addrDef := "1010000000000000";
	constant writeZp   : addrDef := "1010000000010000";
	constant rmwZp     : addrDef := "1010000000001000";
	-- Zero page indexed
	constant readZpX   : addrDef := "1010000010000000";
	constant writeZpX  : addrDef := "1010000010010000";
	constant rmwZpX    : addrDef := "1010000010001000";
	constant readZpY   : addrDef := "1010000001000000";
	constant writeZpY  : addrDef := "1010000001010000";
	constant rmwZpY    : addrDef := "1010000001001000";
	-- Zero page indirect
	constant readIndX  : addrDef := "1001000010000000";
	constant writeIndX : addrDef := "1001000010010000";
	constant rmwIndX   : addrDef := "1001000010001000";
	constant readIndY  : addrDef := "1001000001000000";
	constant writeIndY : addrDef := "1001000001010000";
	constant rmwIndY   : addrDef := "1001000001001000";
	--                               |AZI||JBXY|WM||
	-- Absolute
	constant readAbs   : addrDef := "1100000000000000";	
	constant writeAbs  : addrDef := "1100000000010000";	
	constant rmwAbs    : addrDef := "1100000000001000";	
	constant readAbsX  : addrDef := "1100000010000000";	
	constant writeAbsX : addrDef := "1100000010010000";	
	constant rmwAbsX   : addrDef := "1100000010001000";	
	constant readAbsY  : addrDef := "1100000001000000";	
	constant writeAbsY : addrDef := "1100000001010000";	
	constant rmwAbsY   : addrDef := "1100000001001000";	
	-- PHA PHP
	constant push      : addrDef := "0000010000000000";
	-- PLA PLP
	constant pop       : addrDef := "0000010000100000";
	-- Jumps
	constant jsr       : addrDef := "1000101000000000";
	constant jumpAbs   : addrDef := "1000001000000000";
	constant jumpInd   : addrDef := "1100001000000000";
	constant relative  : addrDef := "1000000100000000";
	-- Specials
	constant rts       : addrDef := "0000101000100100";
	constant rti       : addrDef := "0000111000100010";
	--GE Although BRK is a 1-byte instruction, it is processed as a 2-byte instruction (!)
	constant brk       : addrDef := "1000111000000001";
	
--	constant        : unsigned(0 to 0) := "0";
	constant xxxxxxxx  : addrDef := "----------0---00";
	--GE 65C02/HuC6280 additional addressing modes
	--                               |AZI||JBXY|WM||
	constant readInd   : addrDef := "1001000000000000";	
	constant writeInd  : addrDef := "1001000000010000";
	constant jumpIndX  : addrDef := "1100001010000000";
	constant bsr       : addrDef := "0000100100000000"; 
	constant readImmW  : addrDef := "0000000000000000";
	constant writeImmW : addrDef := "0000000000010000";
	constant blkTrns   : addrDef := "0000000000000000";
	
	-- A = accu
	-- E = Accu | 0xEE (for ANE, LXA)
	-- X = index X
	-- Y = index Y
	-- S = Stack pointer
	-- H = indexH
	-- 
	--                                       AEXYSUHc
	constant aluInA   : unsigned(0 to 7) := "10000000";
	constant aluInE   : unsigned(0 to 7) := "01000000";
	constant aluInEXU : unsigned(0 to 7) := "01100100";
	constant aluInEU  : unsigned(0 to 7) := "01000100";
	constant aluInX   : unsigned(0 to 7) := "00100000";
	constant aluInXH  : unsigned(0 to 7) := "00100010";
	constant aluInY   : unsigned(0 to 7) := "00010000";
	constant aluInYH  : unsigned(0 to 7) := "00010010";
	constant aluInS   : unsigned(0 to 7) := "00001000";
	constant aluInU   : unsigned(0 to 7) := "00000100";
	constant aluInAX  : unsigned(0 to 7) := "10100000";
	constant aluInAXH : unsigned(0 to 7) := "10100010";
	constant aluInAU  : unsigned(0 to 7) := "10000100";
	constant aluInXU  : unsigned(0 to 7) := "00100100";
	constant aluInSU  : unsigned(0 to 7) := "00001100";
	constant aluInSet : unsigned(0 to 7) := "00000000";
	constant aluInClr : unsigned(0 to 7) := "00000001";
	constant aluInXXX : unsigned(0 to 7) := "--------";
	
	-- Most of the aluModes are just like the opcodes.
	-- aluModeInp -> input is output. calculate N and Z
	-- aluModeCmp -> Compare for CMP, CPX, CPY
	-- aluModeFlg -> input to flags needed for PLP, RTI and CLC, SEC, CLV
	-- aluModeInc -> for INC but also INX, INY
	-- aluModeDec -> for DEC but also DEX, DEY

	subtype aluMode1 is unsigned(0 to 3);
	--GE aluMode2 size has changed from 3 to 4
	subtype aluMode2 is unsigned(0 to 3);
	subtype aluMode is unsigned(0 to 10);

	-- Logic/Shift ALU
	constant aluModeInp : aluMode1 := "0000";
	constant aluModeP   : aluMode1 := "0001";
	constant aluModeInc : aluMode1 := "0010";
	constant aluModeDec : aluMode1 := "0011";
	constant aluModeFlg : aluMode1 := "0100";
	constant aluModeBit : aluMode1 := "0101";
	--GE -- 0110
	constant aluModeXmb : aluMode1 := "0110"; --GE 65C02/HuC6280 for SMBn/RMBn instructions
	-- 0111
	constant aluModeLsr : aluMode1 := "1000";
	constant aluModeRor : aluMode1 := "1001";
	constant aluModeAsl : aluMode1 := "1010";
	constant aluModeRol : aluMode1 := "1011";
	--GE -- 1100
	constant aluModeTrb : aluMode1 := "1100"; --GE 65C02/HuC6280 for TRB instruction
	--GE -- 1101
	constant aluModeTsb : aluMode1 := "1101"; --GE 65C02/HuC6280 for TSB instruction
	--GE -- 1110
	constant aluModeTma : aluMode1 := "1110"; --GE HuC6280 for TMA instruction
	constant aluModeAnc : aluMode1 := "1111";

	-- Arithmetic ALU
	--GE aluMode2 size has changed from 3 to 4
	constant aluModePss : aluMode2 := "0000";
	constant aluModeCmp : aluMode2 := "0001";
	constant aluModeAdc : aluMode2 := "0010";
	constant aluModeSbc : aluMode2 := "0011";
	constant aluModeAnd : aluMode2 := "0100";
	constant aluModeOra : aluMode2 := "0101";
	constant aluModeEor : aluMode2 := "0110";
	constant aluModeArr : aluMode2 := "0111";
	constant aluModeBbx : aluMode2 := "1000"; --GE
	constant aluModeTst : aluMode2 := "1001"; --GE
	
	constant aluInp  : aluMode := aluModeInp & aluModePss & "---";
	constant aluP    : aluMode := aluModeP   & aluModePss & "---";
	constant aluInc  : aluMode := aluModeInc & aluModePss & "---";
	constant aluDec  : aluMode := aluModeDec & aluModePss & "---";
	constant aluFlg  : aluMode := aluModeFlg & aluModePss & "---";
	constant aluBit  : aluMode := aluModeBit & aluModeAnd & "---";
	constant aluRor  : aluMode := aluModeRor & aluModePss & "---";
	constant aluLsr  : aluMode := aluModeLsr & aluModePss & "---";
	constant aluRol  : aluMode := aluModeRol & aluModePss & "---";
	constant aluAsl  : aluMode := aluModeAsl & aluModePss & "---";

	constant aluCmp  : aluMode := aluModeInp & aluModeCmp & "100";
	constant aluCpx  : aluMode := aluModeInp & aluModeCmp & "010";
	constant aluCpy  : aluMode := aluModeInp & aluModeCmp & "001";
	constant aluAdc  : aluMode := aluModeInp & aluModeAdc & "---";
	constant aluSbc  : aluMode := aluModeInp & aluModeSbc & "---";
	constant aluAnd  : aluMode := aluModeInp & aluModeAnd & "---";
	constant aluOra  : aluMode := aluModeInp & aluModeOra & "---";
	constant aluEor  : aluMode := aluModeInp & aluModeEor & "---";
	
	constant aluSlo  : aluMode := aluModeAsl & aluModeOra & "---";
	constant aluSre  : aluMode := aluModeLsr & aluModeEor & "---";
	constant aluRra  : aluMode := aluModeRor & aluModeAdc & "---";
	constant aluRla  : aluMode := aluModeRol & aluModeAnd & "---";
	constant aluDcp  : aluMode := aluModeDec & aluModeCmp & "100";
	constant aluIsc  : aluMode := aluModeInc & aluModeSbc & "---";
	constant aluAnc  : aluMode := aluModeAnc & aluModeAnd & "---";
	constant aluArr  : aluMode := aluModeRor & aluModeArr & "---";
	constant aluSbx  : aluMode := aluModeInp & aluModeCmp & "110";

	--GE additional modes
	constant aluBbx  : aluMode := aluModeInp & aluModeBbx & "---";
	constant aluXmb  : aluMode := aluModeXmb & aluModePss & "---";
	constant aluTrb  : aluMode := aluModeTrb & aluModePss & "---";
	constant aluTsb  : aluMode := aluModeTsb & aluModePss & "---";
	constant aluTst  : aluMode := aluModeBit & aluModeTst & "---";
	constant aluTma  : aluMode := aluModeTma & aluModePss & "---";
	
	constant aluXXX  : aluMode := (others => '-');


	-- Stack operations. Push/Pop/None
	constant stackInc : unsigned(0 to 0) := "0";
	constant stackDec : unsigned(0 to 0) := "1";
	constant stackXXX : unsigned(0 to 0) := "-";

	subtype decodedBitsDef is unsigned(0 to 55);
	type opcodeInfoTableDef is array(0 to 255) of decodedBitsDef;
	constant opcodeInfoTable : opcodeInfoTableDef := (
	--GE added 65C02/HuC6280 specific attributes  
	--                                     Block Transfer -----------+
	--                                                STn ----------+|
	--                                                TST ---------+||
	--                                            TAM/TMA --------+|||
	-- +------- Update register A          Immediate in W -------+||||
	-- |+------ Update register X           Update T flag ------+|||||
	-- ||+----- Update register Y              Use T flag -----+||||||
	-- |||+---- Update register S                    Swap ----+|||||||
	-- ||||       +-- Update Flags              RMBn/SMBn ---+||||||||
	-- ||||       |                             BBRn/BBSn --+|||||||||
	-- ||||      _|__                               Speed -+||||||||||
	-- ||||     /    \                                     |||||||||||
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0000" & "001100" & brk       & aluInXXX & aluP   & "00000000000", -- 00 BRK              --GE 65C02/HuC6280 updates the D flag
	  "1000" & "100010" & readIndX  & aluInU   & aluOra & "00001000000", -- 01 ORA (zp,x)
	  "0110" & "000000" & implied   & aluInY   & aluInp & "00010000000", -- 02 SXY              --GE 65C02/HuC6280
	  "0000" & "000000" & writeImmW & aluInXXX & aluXXX & "00000010010", -- 03 ST0 imm          --GE HuC6280
	  "0000" & "110010" & rmwZp     & aluInU   & aluTsb & "00000000000", -- 04 TSB zp           --GE 65C02/HuC6280
	  "1000" & "100010" & readZp    & aluInU   & aluOra & "00001000000", -- 05 ORA zp
	  "0000" & "100011" & rmwZp     & aluInU   & aluAsl & "00000000000", -- 06 ASL zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 07 RMB0 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & push      & aluInXXX & aluP   & "00000000000", -- 08 PHP
	  "1000" & "100010" & immediate & aluInU   & aluOra & "00001000000", -- 09 ORA imm
	  "1000" & "100011" & implied   & aluInA   & aluAsl & "00000000000", -- 0A ASL accu
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 0B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "110010" & rmwAbs    & aluInU   & aluTsb & "00000000000", -- 0C TSB abs          --GE 65C02/HuC6280
	  "1000" & "100010" & readAbs   & aluInU   & aluOra & "00001000000", -- 0D ORA abs
	  "0000" & "100011" & rmwAbs    & aluInU   & aluAsl & "00000000000", -- 0E ASL abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 0F BBR0 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- 10 BPL
	  "1000" & "100010" & readIndY  & aluInU   & aluOra & "00001000000", -- 11 ORA (zp),y
	  "1000" & "100010" & readInd   & aluInU   & aluOra & "00001000000", -- 12 ORA (zp)         --GE 65C02/HuC6280
	  "0000" & "000000" & writeImmW & aluInXXX & aluXXX & "00000010010", -- 13 ST1 imm          --GE HuC6280
	  "0000" & "110010" & rmwZp     & aluInU   & aluTrb & "00000000000", -- 14 TRB zp           --GE 65C02/HuC6280
	  "1000" & "100010" & readZpX   & aluInU   & aluOra & "00001000000", -- 15 ORA zp,x
	  "0000" & "100011" & rmwZpX    & aluInU   & aluAsl & "00000000000", -- 16 ASL zp,x
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 17 RMB1 zp          --GE 65C02/HuC6280
	  "0000" & "000001" & implied   & aluInClr & aluFlg & "00000000000", -- 18 CLC
	  "1000" & "100010" & readAbsY  & aluInU   & aluOra & "00001000000", -- 19 ORA abs,y
	  "1000" & "100010" & implied   & aluInA   & aluInc & "00000000000", -- 1A INC A            --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 1B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "110010" & rmwAbs    & aluInU   & aluTrb & "00000000000", -- 1C TRB abs          --GE 65C02/HuC6280
	  "1000" & "100010" & readAbsX  & aluInU   & aluOra & "00001000000", -- 1D ORA abs,x
	  "0000" & "100011" & rmwAbsX   & aluInU   & aluAsl & "00000000000", -- 1E ASL abs,x
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 1F BBR1 zp          --GE 65C02/HuC6280
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0000" & "000000" & jsr       & aluInXXX & aluXXX & "00000000000", -- 20 JSR
	  "1000" & "100010" & readIndX  & aluInU   & aluAnd & "00001000000", -- 21 AND (zp,x)
	  "1100" & "000000" & implied   & aluInX   & aluInp & "00010000000", -- 22 SAX              --GE 65C02/HuC6280
	  "0000" & "000000" & writeImmW & aluInXXX & aluXXX & "00000010010", -- 23 ST2 imm          --GE HuC6280
	  "0000" & "110010" & readZp    & aluInU   & aluBit & "00000000000", -- 24 BIT zp
	  "1000" & "100010" & readZp    & aluInU   & aluAnd & "00001000000", -- 25 AND zp
	  "0000" & "100011" & rmwZp     & aluInU   & aluRol & "00000000000", -- 26 ROL zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 27 RMB2 zp          --GE 65C02/HuC6280
	  "0000" & "111111" & pop       & aluInU   & aluFlg & "00000100000", -- 28 PLP
	  "1000" & "100010" & immediate & aluInU   & aluAnd & "00001000000", -- 29 AND imm
	  "1000" & "100011" & implied   & aluInA   & aluRol & "00000000000", -- 2A ROL accu
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 2B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "110010" & readAbs   & aluInU   & aluBit & "00000000000", -- 2C BIT abs
	  "1000" & "100010" & readAbs   & aluInU   & aluAnd & "00001000000", -- 2D AND abs
	  "0000" & "100011" & rmwAbs    & aluInU   & aluRol & "00000000000", -- 2E ROL abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 2F BBR2 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- 30 BMI
	  "1000" & "100010" & readIndY  & aluInU   & aluAnd & "00001000000", -- 31 AND (zp),y
	  "1000" & "100010" & readInd   & aluInU   & aluAnd & "00001000000", -- 32 AND (zp)         --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 33 NOP              --GE HuC6280 pcetech.txt
	  "0000" & "110010" & readZpX   & aluInU   & aluBit & "00000000000", -- 34 BIT zp,x         --GE 65C02/HuC6280
	  "1000" & "100010" & readZpX   & aluInU   & aluAnd & "00001000000", -- 35 AND zp,x
	  "0000" & "100011" & rmwZpX    & aluInU   & aluRol & "00000000000", -- 36 ROL zp,x
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 37 RMB3 zp          --GE 65C02/HuC6280
	  "0000" & "000001" & implied   & aluInSet & aluFlg & "00000000000", -- 38 SEC
	  "1000" & "100010" & readAbsY  & aluInU   & aluAnd & "00001000000", -- 39 AND abs,y
	  "1000" & "100010" & implied   & aluInA   & aluDec & "00000000000", -- 3A DEC A            --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 3B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "110010" & readAbsX  & aluInU   & aluBit & "00000000000", -- 3C BIT abs,x        --GE 65C02/HuC6280
	  "1000" & "100010" & readAbsX  & aluInU   & aluAnd & "00001000000", -- 3D AND abs,x
	  "0000" & "100011" & rmwAbsX   & aluInU   & aluRol & "00000000000", -- 3E ROL abs,x
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 3F BBR3 zp          --GE 65C02/HuC6280
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0000" & "111111" & rti       & aluInU   & aluFlg & "00000100000", -- 40 RTI
	  "1000" & "100010" & readIndX  & aluInU   & aluEor & "00001000000", -- 41 EOR (zp,x)
	  "1010" & "000000" & implied   & aluInY   & aluInp & "00010000000", -- 42 SAY              --GE 65C02/HuC6280
	  "1000" & "000000" & readImmW  & aluInA   & aluTma & "00000011000", -- 43 TMA imm          --GE HuC6280
	  "0000" & "000000" & bsr       & aluInXXX & aluXXX & "00000000000", -- 44 BSR rel          --GE HuC6280
	  "1000" & "100010" & readZp    & aluInU   & aluEor & "00001000000", -- 45 EOR zp
	  "0000" & "100011" & rmwZp     & aluInU   & aluLsr & "00000000000", -- 46 LSR zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 47 RMB4 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & push      & aluInA   & aluInp & "00000000000", -- 48 PHA
	  "1000" & "100010" & immediate & aluInU   & aluEor & "00001000000", -- 49 EOR imm
	  "1000" & "100011" & implied   & aluInA   & aluLsr & "00000000000", -- 4A LSR accu
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 4B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & jumpAbs   & aluInXXX & aluXXX & "00000000000", -- 4C JMP abs
	  "1000" & "100010" & readAbs   & aluInU   & aluEor & "00001000000", -- 4D EOR abs
	  "0000" & "100011" & rmwAbs    & aluInU   & aluLsr & "00000000000", -- 4E LSR abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 4F BBR4 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- 50 BVC
	  "1000" & "100010" & readIndY  & aluInU   & aluEor & "00001000000", -- 51 EOR (zp),y
	  "1000" & "100010" & readInd   & aluInU   & aluEor & "00001000000", -- 52 EOR (zp)         --GE 65C02/HuC6280
	  "0000" & "000000" & writeImmW & aluInA   & aluInp & "00000011000", -- 53 TAM imm          --GE HuC6280
	  "0000" & "000000" & implied   & aluInClr & aluXXX & "10000000000", -- 54 CSL              --GE HuC6280
	  "1000" & "100010" & readZpX   & aluInU   & aluEor & "00001000000", -- 55 EOR zp,x
	  "0000" & "100011" & rmwZpX    & aluInU   & aluLsr & "00000000000", -- 56 LSR zp,x
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 57 RMB5 zp          --GE 65C02/HuC6280
	  "0000" & "000100" & implied   & aluInClr & aluXXX & "00000000000", -- 58 CLI
	  "1000" & "100010" & readAbsY  & aluInU   & aluEor & "00001000000", -- 59 EOR abs,y
	  "0000" & "000000" & push      & aluInY   & aluInp & "00000000000", -- 5A PHY              --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 5B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 5C NOP              --GE HuC6280 pcetech.txt
	  "1000" & "100010" & readAbsX  & aluInU   & aluEor & "00001000000", -- 5D EOR abs,x
	  "0000" & "100011" & rmwAbsX   & aluInU   & aluLsr & "00000000000", -- 5E LSR abs,x
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 5F BBR5 zp          --GE 65C02/HuC6280
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0000" & "000000" & rts       & aluInXXX & aluXXX & "00000000000", -- 60 RTS
	  "1000" & "110011" & readIndX  & aluInU   & aluAdc & "00001000000", -- 61 ADC (zp,x)
	  "1000" & "000000" & implied   & aluInClr & aluInp & "00000000000", -- 62 CLA              --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 63 NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & writeZp   & aluInClr & aluInp & "00000000000", -- 64 STZ zp           --GE 65C02/HuC6280
	  "1000" & "110011" & readZp    & aluInU   & aluAdc & "00001000000", -- 65 ADC zp
	  "0000" & "100011" & rmwZp     & aluInU   & aluRor & "00000000000", -- 66 ROR zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 67 RMB6 zp          --GE 65C02/HuC6280
	  "1000" & "100010" & pop       & aluInU   & aluInp & "00000000000", -- 68 PLA
	  "1000" & "110011" & immediate & aluInU   & aluAdc & "00001000000", -- 69 ADC imm
	  "1000" & "100011" & implied   & aluInA   & aluRor & "00000000000", -- 6A ROR accu
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 6B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & jumpInd   & aluInXXX & aluXXX & "00000000000", -- 6C JMP indirect
	  "1000" & "110011" & readAbs   & aluInU   & aluAdc & "00001000000", -- 6D ADC abs
	  "0000" & "100011" & rmwAbs    & aluInU   & aluRor & "00000000000", -- 6E ROR abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 6F BBR6 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- 70 BVS
	  "1000" & "110011" & readIndY  & aluInU   & aluAdc & "00001000000", -- 71 ADC (zp),y
	  "1000" & "110011" & readInd   & aluInU   & aluAdc & "00001000000", -- 72 ADC (zp)         --GE 65C02/HuC6280
	  "0010" & "000000" & blkTrns   & aluInU   & aluInp & "00000000001", -- 73 TII block        --GE HuC6280
	  "0000" & "000000" & writeZpX  & aluInClr & aluInp & "00000000000", -- 74 STZ zp,x         --GE 65C02/HuC6280
	  "1000" & "110011" & readZpX   & aluInU   & aluAdc & "00001000000", -- 75 ADC zp,x
	  "0000" & "100011" & rmwZpX    & aluInU   & aluRor & "00000000000", -- 76 ROR zp,x
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 77 RMB7 zp          --GE 65C02/HuC6280
	  "0000" & "000100" & implied   & aluInSet & aluXXX & "00000000000", -- 78 SEI
	  "1000" & "110011" & readAbsY  & aluInU   & aluAdc & "00001000000", -- 79 ADC abs,y
	  "0010" & "100010" & pop       & aluInU   & aluInp & "00000000000", -- 7A PLY              --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 7B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & jumpIndX  & aluInXXX & aluXXX & "00000000000", -- 7C JMP (abs,x)      --GE 65C02/HuC6280
	  "1000" & "110011" & readAbsX  & aluInU   & aluAdc & "00001000000", -- 7D ADC abs,x
	  "0000" & "100011" & rmwAbsX   & aluInU   & aluRor & "00000000000", -- 7E ROR abs,x
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 7F BBR7 zp          --GE 65C02/HuC6280
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- 80 BRA              --GE 65C02/HuC6280
	  "0000" & "000000" & writeIndX & aluInA   & aluInp & "00000000000", -- 81 STA (zp,x)
	  "0100" & "000000" & implied   & aluInClr & aluInp & "00000000000", -- 82 CLX              --GE 65C02/HuC6280
	  "0000" & "110010" & readZp    & aluInU   & aluTst & "00000010100", -- 83 TST imm,zp       --GE 65C02/HuC6280
	  "0000" & "000000" & writeZp   & aluInY   & aluInp & "00000000000", -- 84 STY zp
	  "0000" & "000000" & writeZp   & aluInA   & aluInp & "00000000000", -- 85 STA zp
	  "0000" & "000000" & writeZp   & aluInX   & aluInp & "00000000000", -- 86 STX zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 87 SMB0 zp          --GE 65C02/HuC6280
	  "0010" & "100010" & implied   & aluInY   & aluDec & "00000000000", -- 88 DEY
	  "0000" & "110010" & immediate & aluInU   & aluBit & "00000000000", -- 89 BIT imm          --GE 65C02/HuC6280
	  "1000" & "100010" & implied   & aluInX   & aluInp & "00000000000", -- 8A TXA
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 8B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & writeAbs  & aluInY   & aluInp & "00000000000", -- 8C STY abs
	  "0000" & "000000" & writeAbs  & aluInA   & aluInp & "00000000000", -- 8D STA abs
	  "0000" & "000000" & writeAbs  & aluInX   & aluInp & "00000000000", -- 8E STX abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 8F BBS0 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- 90 BCC
	  "0000" & "000000" & writeIndY & aluInA   & aluInp & "00000000000", -- 91 STA (zp),y
	  "0000" & "000000" & writeInd  & aluInA   & aluInp & "00000000000", -- 92 STA (zp)         --GE 65C02/HuC6280
	  "0000" & "110010" & readAbs   & aluInU   & aluTst & "00000010100", -- 93 TST imm,abs      --GE 65C02/HuC6280
	  "0000" & "000000" & writeZpX  & aluInY   & aluInp & "00000000000", -- 94 STY zp,x
	  "0000" & "000000" & writeZpX  & aluInA   & aluInp & "00000000000", -- 95 STA zp,x
	  "0000" & "000000" & writeZpY  & aluInX   & aluInp & "00000000000", -- 96 STX zp,y
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- 97 SMB1 zp          --GE 65C02/HuC6280
	  "1000" & "100010" & implied   & aluInY   & aluInp & "00000000000", -- 98 TYA
	  "0000" & "000000" & writeAbsY & aluInA   & aluInp & "00000000000", -- 99 STA abs,y
	  "0001" & "000000" & implied   & aluInX   & aluInp & "00000000000", -- 9A TXS
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- 9B NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & writeAbs  & aluInClr & aluInp & "00000000000", -- 9C STZ zp,x         --GE 65C02/HuC6280
	  "0000" & "000000" & writeAbsX & aluInA   & aluInp & "00000000000", -- 9D STA abs,x
	  "0000" & "000000" & writeAbsX & aluInClr & aluInp & "00000000000", -- 9E STZ zp,x         --GE 65C02/HuC6280
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- 9F BBS1 zp          --GE 65C02/HuC6280
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0010" & "100010" & immediate & aluInU   & aluInp & "00000000000", -- A0 LDY imm
	  "1000" & "100010" & readIndX  & aluInU   & aluInp & "00000000000", -- A1 LDA (zp,x)
	  "0100" & "100010" & immediate & aluInU   & aluInp & "00000000000", -- A2 LDX imm
	  "0000" & "110010" & readZpX   & aluInU   & aluTst & "00000010100", -- A3 TST imm,zp,x     --GE 65C02/HuC6280
	  "0010" & "100010" & readZp    & aluInU   & aluInp & "00000000000", -- A4 LDY zp
	  "1000" & "100010" & readZp    & aluInU   & aluInp & "00000000000", -- A5 LDA zp
	  "0100" & "100010" & readZp    & aluInU   & aluInp & "00000000000", -- A6 LDX zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- A7 SMB2 zp          --GE 65C02/HuC6280
	  "0010" & "100010" & implied   & aluInA   & aluInp & "00000000000", -- A8 TAY
	  "1000" & "100010" & immediate & aluInU   & aluInp & "00000000000", -- A9 LDA imm
	  "0100" & "100010" & implied   & aluInA   & aluInp & "00000000000", -- AA TAX
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- AB NOP              --GE HuC6280 pcetech.txt
	  "0010" & "100010" & readAbs   & aluInU   & aluInp & "00000000000", -- AC LDY abs
	  "1000" & "100010" & readAbs   & aluInU   & aluInp & "00000000000", -- AD LDA abs
	  "0100" & "100010" & readAbs   & aluInU   & aluInp & "00000000000", -- AE LDX abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- AF BBS2 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- B0 BCS
	  "1000" & "100010" & readIndY  & aluInU   & aluInp & "00000000000", -- B1 LDA (zp),y
	  "1000" & "100010" & readInd   & aluInU   & aluInp & "00000000000", -- B2 LDA (zp)         --GE 65C02/HuC6280
	  "0000" & "110010" & readAbsX  & aluInU   & aluTst & "00000010100", -- B3 TST imm,abs,x    --GE 65C02/HuC6280
	  "0010" & "100010" & readZpX   & aluInU   & aluInp & "00000000000", -- B4 LDY zp,x
	  "1000" & "100010" & readZpX   & aluInU   & aluInp & "00000000000", -- B5 LDA zp,x
	  "0100" & "100010" & readZpY   & aluInU   & aluInp & "00000000000", -- B6 LDX zp,y
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- B7 SMB3 zp          --GE 65C02/HuC6280
	  "0000" & "010000" & implied   & aluInClr & aluFlg & "00000000000", -- B8 CLV
	  "1000" & "100010" & readAbsY  & aluInU   & aluInp & "00000000000", -- B9 LDA abs,y
	  "0100" & "100010" & implied   & aluInS   & aluInp & "00000000000", -- BA TSX
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- BB NOP              --GE HuC6280 pcetech.txt
	  "0010" & "100010" & readAbsX  & aluInU   & aluInp & "00000000000", -- BC LDY abs,x
	  "1000" & "100010" & readAbsX  & aluInU   & aluInp & "00000000000", -- BD LDA abs,x
	  "0100" & "100010" & readAbsY  & aluInU   & aluInp & "00000000000", -- BE LDX abs,y
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- BF BBS3 zp          --GE 65C02/HuC6280
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0000" & "100011" & immediate & aluInU   & aluCpy & "00000000000", -- C0 CPY imm
	  "0000" & "100011" & readIndX  & aluInU   & aluCmp & "00000000000", -- C1 CMP (zp,x)
	  "0010" & "000000" & implied   & aluInClr & aluInp & "00000000000", -- C2 CLY              --GE 65C02/HuC6280
	  "0010" & "000000" & blkTrns   & aluInU   & aluInp & "00000000001", -- C3 TDD block        --GE HuC6280
	  "0000" & "100011" & readZp    & aluInU   & aluCpy & "00000000000", -- C4 CPY zp
	  "0000" & "100011" & readZp    & aluInU   & aluCmp & "00000000000", -- C5 CMP zp
	  "0000" & "100010" & rmwZp     & aluInU   & aluDec & "00000000000", -- C6 DEC zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- C7 SMB4 zp          --GE 65C02/HuC6280
	  "0010" & "100010" & implied   & aluInY   & aluInc & "00000000000", -- C8 INY
	  "0000" & "100011" & immediate & aluInU   & aluCmp & "00000000000", -- C9 CMP imm
	  "0100" & "100010" & implied   & aluInX   & aluDec & "00000000000", -- CA DEX
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- CB NOP              --GE HuC6280 pcetech.txt
	  "0000" & "100011" & readAbs   & aluInU   & aluCpy & "00000000000", -- CC CPY abs
	  "0000" & "100011" & readAbs   & aluInU   & aluCmp & "00000000000", -- CD CMP abs
	  "0000" & "100010" & rmwAbs    & aluInU   & aluDec & "00000000000", -- CE DEC abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- CF BBS4 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- D0 BNE
	  "0000" & "100011" & readIndY  & aluInU   & aluCmp & "00000000000", -- D1 CMP (zp),y
	  "0000" & "100011" & readInd   & aluInU   & aluCmp & "00000000000", -- D2 CMP (zp)         --GE 65C02/HuC6280
	  "0010" & "000000" & blkTrns   & aluInU   & aluInp & "00000000001", -- D3 TIN block        --GE HuC6280
	  "0000" & "000000" & implied   & aluInSet & aluXXX & "10000000000", -- D4 CSH              --GE HuC6280
	  "0000" & "100011" & readZpX   & aluInU   & aluCmp & "00000000000", -- D5 CMP zp,x
	  "0000" & "100010" & rmwZpX    & aluInU   & aluDec & "00000000000", -- D6 DEC zp,x
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- D7 SMB5 zp          --GE 65C02/HuC6280
	  "0000" & "001000" & implied   & aluInClr & aluXXX & "00000000000", -- D8 CLD
	  "0000" & "100011" & readAbsY  & aluInU   & aluCmp & "00000000000", -- D9 CMP abs,y
	  "0000" & "000000" & push      & aluInX   & aluInp & "00000000000", -- DA PHX              --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- DB NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- DC NOP              --GE HuC6280 pcetech.txt
	  "0000" & "100011" & readAbsX  & aluInU   & aluCmp & "00000000000", -- DD CMP abs,x
	  "0000" & "100010" & rmwAbsX   & aluInU   & aluDec & "00000000000", -- DE DEC abs,x
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- DF BBS5 zp          --GE 65C02/HuC6280
	-- AXYS     NVDIZC    addressing  aluInput   aluMode   sBbStuimTVM
	  "0000" & "100011" & immediate & aluInU   & aluCpx & "00000000000", -- E0 CPX imm
	  "1000" & "110011" & readIndX  & aluInU   & aluSbc & "00001000000", -- E1 SBC (zp,x)
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- E2 NOP              --GE HuC6280 pcetech.txt
	  "0010" & "000000" & blkTrns   & aluInU   & aluInp & "00000000001", -- E3 TIA block        --GE HuC6280
	  "0000" & "100011" & readZp    & aluInU   & aluCpx & "00000000000", -- E4 CPX zp
	  "1000" & "110011" & readZp    & aluInU   & aluSbc & "00001000000", -- E5 SBC zp
	  "0000" & "100010" & rmwZp     & aluInU   & aluInc & "00000000000", -- E6 INC zp
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- E7 SMB6 zp          --GE 65C02/HuC6280
	  "0100" & "100010" & implied   & aluInX   & aluInc & "00000000000", -- E8 INX
	  "1000" & "110011" & immediate & aluInU   & aluSbc & "00001000000", -- E9 SBC imm
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- EA NOP
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- EB NOP              --GE HuC6280 pcetech.txt
	  "0000" & "100011" & readAbs   & aluInU   & aluCpx & "00000000000", -- EC CPX abs
	  "1000" & "110011" & readAbs   & aluInU   & aluSbc & "00001000000", -- ED SBC abs
	  "0000" & "100010" & rmwAbs    & aluInU   & aluInc & "00000000000", -- EE INC abs
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000", -- EF BBS6 zp          --GE 65C02/HuC6280
	  "0000" & "000000" & relative  & aluInXXX & aluXXX & "00000000000", -- F0 BEQ
	  "1000" & "110011" & readIndY  & aluInU   & aluSbc & "00001000000", -- F1 SBC (zp),y
	  "1000" & "110011" & readInd   & aluInU   & aluSbc & "00001000000", -- F2 SBC (zp)         --GE 65C02/HuC6280
	  "0010" & "000000" & blkTrns   & aluInU   & aluInp & "00000000001", -- F3 TAI block        --GE HuC6280
	  "0000" & "000000" & implied   & aluInSet & aluXXX & "00000100000", -- F4 SET              --GE HuC6280
	  "1000" & "110011" & readZpX   & aluInU   & aluSbc & "00001000000", -- F5 SBC zp,x
	  "0000" & "100010" & rmwZpX    & aluInU   & aluInc & "00000000000", -- F6 INC zp,x
	  "0000" & "000000" & rmwZp     & aluInU   & aluXmb & "00100000000", -- F7 SMB7 zp          --GE 65C02/HuC6280
	  "0000" & "001000" & implied   & aluInSet & aluXXX & "00000000000", -- F8 SED
	  "1000" & "110011" & readAbsY  & aluInU   & aluSbc & "00001000000", -- F9 SBC abs,y
	  "0100" & "100010" & pop       & aluInU   & aluInp & "00000000000", -- FA PLX              --GE 65C02/HuC6280
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- FB NOP              --GE HuC6280 pcetech.txt
	  "0000" & "000000" & implied   & aluInXXX & aluXXX & "00000000000", -- FC NOP              --GE HuC6280 pcetech.txt
	  "1000" & "110011" & readAbsX  & aluInU   & aluSbc & "00001000000", -- FD SBC abs,x
	  "0000" & "100010" & rmwAbsX   & aluInU   & aluInc & "00000000000", -- FE INC abs,x
	  "0000" & "000000" & readZp    & aluInU   & aluBbx & "01000000000"  -- FF BBS7 zp          --GE 65C02/HuC6280
	);
	signal opcInfo        : decodedBitsDef;
	signal nextOpcInfo    : decodedBitsDef;	-- Next opcode (decoded)
	signal nextOpcInfoReg : decodedBitsDef;	-- Next opcode (decoded) pipelined
	signal theOpcode      : unsigned(7 downto 0);
	signal nextOpcode     : unsigned(7 downto 0);

-- Program counter
	signal PC : unsigned(15 downto 0); -- Program counter

-- Address generation
	type nextAddrDef is (
		nextAddrHold,
		nextAddrIncr,
		nextAddrIncrL, -- Increment low bits only (zeropage accesses)
		nextAddrIncrH, -- Increment high bits only (page-boundary)
		nextAddrDecrH, -- Decrement high bits (branch backwards)
		nextAddrPc,
		nextAddrIrq,
		nextAddrReset,
		nextAddrAbs,
		nextAddrAbsIndexed,
		nextAddrZeroPage,
		nextAddrZPIndexed,
		nextAddrStack,
		nextAddrRelative,
		nextAddrT,         --GE HuC6280 for T flag addressing
		nextAddrVDC,       --GE HuC6280 for STn instructions
		nextAddrBtSrc,     --GE HuC6280 for block transfers
		nextAddrBtDst
	);
	signal nextAddr : nextAddrDef;
	signal myAddr : unsigned(15 downto 0);
	signal myAddrIncr : unsigned(15 downto 0);
	signal myAddrIncrH : unsigned(7 downto 0);
	signal myAddrDecrH : unsigned(7 downto 0);
	signal theWe : std_logic;
	signal theOe : std_logic; --GE HuC6280

	signal irqActive : std_logic;
	
-- Output register
	signal doReg : unsigned(7 downto 0);
	
-- Buffer register
	signal U : unsigned(7 downto 0);
--GE Second buffer register
	signal W : unsigned(7 downto 0);

-- General registers
	signal A: unsigned(7 downto 0); -- Accumulator
	signal X: unsigned(7 downto 0); -- Index X
	signal Y: unsigned(7 downto 0); -- Index Y
	signal S: unsigned(7 downto 0); -- stack pointer

-- Status register
	signal C: std_logic; -- Carry
	signal Z: std_logic; -- Zero flag
	signal I: std_logic; -- Interrupt flag
	signal D: std_logic; -- Decimal mode
	signal V: std_logic; -- Overflow
	signal N: std_logic; -- Negative
--GE HuC6280 T flag
	signal T: std_logic;
	
--GE HuC6280 Memory paging registers
	type regArray is array(natural range <>) of unsigned(7 downto 0);
	signal MPR: regArray(0 to 7);
	signal MPRReg : unsigned(7 downto 0);
--GE HuC6280 High Speed Mode register
	signal speed : std_logic;
--GE HuC6280 for ST0,ST1,ST2
	signal vdcAddr : std_logic;
--GE HuC6280 for block transfer instructions
	signal btSrc : unsigned(15 downto 0);
	signal btDst : unsigned(15 downto 0);
	signal btLen : unsigned(15 downto 0);
	signal btAlt : std_logic;
	
-- ALU
	-- ALU input
	signal aluInput : unsigned(7 downto 0);
	signal aluCmpInput : unsigned(7 downto 0);
	-- ALU output
	signal aluRegisterOut : unsigned(7 downto 0);
	signal aluRmwOut : unsigned(7 downto 0);
	signal aluC : std_logic;
	signal aluZ : std_logic;
	signal aluV : std_logic;
	signal aluN : std_logic;
	signal aluT : std_logic; --GE HuC6280
	signal aluD : std_logic; --GE
	-- Pipeline registers
	signal aluInputReg : unsigned(7 downto 0);
	signal aluCmpInputReg : unsigned(7 downto 0);
	signal aluRmwReg : unsigned(7 downto 0);
	signal aluNineReg : unsigned(7 downto 0);
	signal aluCReg : std_logic;
	signal aluZReg : std_logic;
	signal aluVReg : std_logic;
	signal aluNReg : std_logic;
	signal aluTReg : std_logic; --GE HuC6280
	signal aluDReg : std_logic; --GE

-- Indexing
	signal indexOut : unsigned(8 downto 0);

	signal nvtbdizc : unsigned(7 downto 0); --GE for debug
	
begin
processAluInput: process(clk, opcInfo, A, X, Y, U, S, W, T) --GE HuC6280 added W,T
		variable temp : unsigned(7 downto 0);
	begin
		temp := (others => '1');
		if opcInfo(opcInA) = '1' then
			temp := temp and A;
		end if;
		if opcInfo(opcInE) = '1' then
			temp := temp and (A or X"EE");
		end if;
		if opcInfo(opcInX) = '1' then
			temp := temp and X;
		end if;
		if opcInfo(opcInY) = '1' then
			temp := temp and Y;
		end if;
		if opcInfo(opcInS) = '1' then
			temp := temp and S;
		end if;
		if opcInfo(opcInU) = '1' then
			temp := temp and U;
		end if;
		if opcInfo(opcInClear) = '1' then
			temp := (others => '0');
		end if;
		if rising_edge(clk) then
			aluInputReg <= temp;
		end if;

		aluInput <= temp;
		if pipelineAluMux then
			aluInput <= aluInputReg;
		end if;
	end process;

processCmpInput: process(clk, opcInfo, A, X, Y)
		variable temp : unsigned(7 downto 0);
	begin
		temp := (others => '1');
		if opcInfo(opcInCmp) = '1' then
			temp := temp and A;
		end if;
		if opcInfo(opcInCpx) = '1' then
			temp := temp and X;
		end if;
		if opcInfo(opcInCpy) = '1' then
			temp := temp and Y;
		end if;
		if rising_edge(clk) then
			aluCmpInputReg <= temp;
		end if;

		aluCmpInput <= temp;
		if pipelineAluMux then
			aluCmpInput <= aluCmpInputReg;
		end if;
	end process;

	-- ALU consists of two parts
	-- Read-Modify-Write or index instructions: INC/DEC/ASL/LSR/ROR/ROL 
	-- Accumulator instructions: ADC, SBC, EOR, AND, EOR, ORA
	-- Some instructions are both RMW and accumulator so for most
	-- instructions the rmw results are routed through accu alu too.
processAlu: process(clk, opcInfo, aluInput, aluCmpInput, A, U, irqActive, N, V, D, I, Z, C, W, T, MPR, MPRReg) --GE added W,T,MPR,MPRReg
		variable lowBits: unsigned(5 downto 0);
		variable nineBits: unsigned(8 downto 0);
		variable rmwBits: unsigned(8 downto 0);
		
		variable varC : std_logic;
		variable varZ : std_logic;
		variable varV : std_logic;
		variable varN : std_logic;
		variable varT : std_logic; --GE
		variable varD : std_logic; --GE
		
		variable Acc  : unsigned(7 downto 0); --GE holds either A or W register (for T flag addressing)
	begin
		lowBits := (others => '-');
		nineBits := (others => '-');
		rmwBits := (others => '-');
		varV := aluInput(6); -- Default for BIT / PLP / RTI

		-- Shift unit
		case opcInfo(aluMode1From to aluMode1To) is
		when aluModeInp =>
			rmwBits := C & aluInput;
		when aluModeP =>
			--GE HuC6280 the T flag is reset by BRK/PHP
			--GE but IRQs preserve it, so there'll be something to change/add here
			--GE rmwBits := C & N & V & '0' & (not irqActive) & D & I & Z & C;
			if irqActive = '1' then
				rmwBits := C & N & V & T & '0' & D & I & Z & C;
			else
				rmwBits := C & N & V & '0' & '1' & D & I & Z & C;
			end if;
		when aluModeInc =>
			rmwBits := C & (aluInput + 1);
		when aluModeDec =>
			rmwBits := C & (aluInput - 1);
		when aluModeAsl =>
			rmwBits := aluInput & "0";
		when aluModeFlg =>
			rmwBits := aluInput(0) & aluInput;
		when aluModeLsr =>
			rmwBits := aluInput(0) & "0" & aluInput(7 downto 1);
		when aluModeRol =>
			rmwBits := aluInput & C;
		when aluModeRoR =>
			rmwBits := aluInput(0) & C & aluInput(7 downto 1);
		when aluModeAnc =>
			rmwBits := (aluInput(7) and A(7)) & aluInput;
		when aluModeXmb => --GE
			if W(7) = '1' then
				-- SMBn
				case W(6 downto 4) is
				when "000" => rmwBits := C & (aluInput or "00000001");
				when "001" => rmwBits := C & (aluInput or "00000010");
				when "010" => rmwBits := C & (aluInput or "00000100");
				when "011" => rmwBits := C & (aluInput or "00001000");
				when "100" => rmwBits := C & (aluInput or "00010000");
				when "101" => rmwBits := C & (aluInput or "00100000");
				when "110" => rmwBits := C & (aluInput or "01000000");
				when "111" => rmwBits := C & (aluInput or "10000000");
				when others => rmwBits := C & aluInput;
				end case;
			else
				-- RMBn
				case W(6 downto 4) is
				when "000" => rmwBits := C & (aluInput and "11111110");
				when "001" => rmwBits := C & (aluInput and "11111101");
				when "010" => rmwBits := C & (aluInput and "11111011");
				when "011" => rmwBits := C & (aluInput and "11110111");
				when "100" => rmwBits := C & (aluInput and "11101111");
				when "101" => rmwBits := C & (aluInput and "11011111");
				when "110" => rmwBits := C & (aluInput and "10111111");
				when "111" => rmwBits := C & (aluInput and "01111111");
				when others => rmwBits := C & aluInput;
				end case;
			end if;
		when aluModeTrb => --GE
			rmwBits := C & (aluInput and not A);
		when aluModeTsb => --GE
			rmwBits := C & (aluInput or A);		
		when aluModeTma => --GE
			rmwBits := C & MPRReg;
			if W(0) = '1' then
				rmwBits := C & MPR(0);
			elsif W(1) = '1' then
				rmwBits := C & MPR(1);
			elsif W(2) = '1' then
				rmwBits := C & MPR(2);
			elsif W(3) = '1' then
				rmwBits := C & MPR(3);
			elsif W(4) = '1' then
				rmwBits := C & MPR(4);
			elsif W(5) = '1' then
				rmwBits := C & MPR(5);
			elsif W(6) = '1' then
				rmwBits := C & MPR(6);
			elsif W(7) = '1' then
				rmwBits := C & MPR(7);
			end if;
		when others =>
			rmwBits := C & aluInput;
		end case;

		if T = '1' and opcInfo(opcUseT) = '1' then --GE HuC6280 T flag addressing
			Acc := W;
		else
			Acc := A;
		end if;
		-- ALU
		case opcInfo(aluMode2From to aluMode2To) is
		when aluModeAdc =>
			lowBits := ("0" & Acc(3 downto 0) & rmwBits(8)) + ("0" & rmwBits(3 downto 0) & "1");
			ninebits := ("0" & Acc) + ("0" & rmwBits(7 downto 0)) + (B"00000000" & rmwBits(8));
		when aluModeSbc =>
			lowBits := ("0" & Acc(3 downto 0) & rmwBits(8)) + ("0" & (not rmwBits(3 downto 0)) & "1");
			ninebits := ("0" & Acc) + ("0" & (not rmwBits(7 downto 0))) + (B"00000000" & rmwBits(8));
		when aluModeCmp =>
			ninebits := ("0" & aluCmpInput) + ("0" & (not rmwBits(7 downto 0))) + "000000001";
		when aluModeAnd =>
			ninebits := rmwBits(8) & (Acc and rmwBits(7 downto 0));
		when aluModeTst => --GE
			ninebits := rmwBits(8) & (W and rmwBits(7 downto 0));
		when aluModeEor =>
			ninebits := rmwBits(8) & (Acc xor rmwBits(7 downto 0));
		when aluModeOra =>
			ninebits := rmwBits(8) & (Acc or rmwBits(7 downto 0));
		when aluModeBbx => --GE
			case W(6 downto 4) is
			when "000" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "00000001");
			when "001" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "00000010");
			when "010" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "00000100");
			when "011" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "00001000");
			when "100" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "00010000");
			when "101" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "00100000");
			when "110" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "01000000");
			when "111" => ninebits := rmwBits(8) & (rmwBits(7 downto 0) and "10000000");
			when others => ninebits := rmwBits;
			end case;
		when others =>
			ninebits := rmwBits;
		end case;

		if (opcInfo(aluMode1From to aluMode1To) = aluModeFlg) then
			varZ := rmwBits(1);
		elsif (opcInfo(aluMode1From to aluMode1To) = aluModeTrb)	--GE Mednafen/ArchaicPixels.com and TGEmu/Hu-GO!
		or (opcInfo(aluMode1From to aluMode1To) = aluModeTsb) then	--GE hold different information about Z flag handling in this case
			if (aluInput and Acc) = x"00" then
				varZ := '1';
			else
				varZ := '0';
			end if;
		elsif ninebits(7 downto 0) = X"00" then
			varZ := '1';
		else
			varZ := '0';
		end if;

		case opcInfo(aluMode2From to aluMode2To) is
		when aluModeAdc =>
			-- decimal mode low bits correction, is done after setting Z flag.
			if D = '1' then
				if lowBits(5 downto 1) > 9 then
					ninebits(3 downto 0) := ninebits(3 downto 0) + 6;
					if lowBits(5) = '0'  then
						ninebits(8 downto 4) := ninebits(8 downto 4) + 1;
					end if;
				end if;
			end if;
		when others =>
			null;
		end case;

		if (opcInfo(aluMode1From to aluMode1To) = aluModeBit)
		or (opcInfo(aluMode1From to aluMode1To) = aluModeFlg) then
			varN := rmwBits(7);
		else
			varN := nineBits(7);
		end if;
		varC := ninebits(8);
		if opcInfo(aluMode2From to aluMode2To) = aluModeArr then
			varC := aluInput(7);
			varV := aluInput(7) xor aluInput(6);
		end if;

		case opcInfo(aluMode2From to aluMode2To) is
		when aluModeAdc =>
			-- decimal mode high bits correction, is done after setting Z and N flags
			varV := (Acc(7) xor ninebits(7)) and (rmwBits(7) xor ninebits(7));
			if D = '1' then
				varV := V; --GE pcetech.txt
				if ninebits(8 downto 4) > 9 then
					ninebits(8 downto 4) := ninebits(8 downto 4) + 6;
					varC := '1';
				end if;
			end if;
		when aluModeSbc =>
			varV := (Acc(7) xor ninebits(7)) and ((not rmwBits(7)) xor ninebits(7));
			if D = '1' then
				varV := V; --GE pcetech.txt
				-- Check for borrow (lower 4 bits)
				if lowBits(5) = '0' then
					ninebits(3 downto 0) := ninebits(3 downto 0) - 6;
				end if;
				-- Check for borrow (upper 4 bits)
				if ninebits(8) = '0' then
					ninebits(8 downto 4) := ninebits(8 downto 4) - 6;
				end if;
			end if;
		when aluModeArr =>
			if D = '1' then
				if (("0" & aluInput(3 downto 0)) + ("0000" & aluInput(0))) > 5 then
					ninebits(3 downto 0) := ninebits(3 downto 0) + 6;
				end if;
				if (("0" & aluInput(7 downto 4)) + ("0000" & aluInput(4))) > 5 then
					ninebits(8 downto 4) := ninebits(8 downto 4) + 6;
					varC := '1';
				else
					varC := '0';
				end if;
			end if;
		when others =>
			null;
		end case;

		--GE HuC6280 T flag
		varT := '0';
		if opcInfo(opcUpdateT) = '1' then
			varT := aluInput(5);
		end if;
		
		--GE 65C02/HuC6280 Unlike the 6502, interrupts clear the D flag to prevent side-effects
		varD := aluInput(3);
		if opcInfo(opcIRQ) = '1' then
			varD := '0';
		end if;
		
		if rising_edge(clk) then
			aluRmwReg <= rmwBits(7 downto 0);
			aluNineReg <= ninebits(7 downto 0);
			aluCReg <= varC;
			aluZReg <= varZ;
			aluVReg <= varV;
			aluNReg <= varN;
			aluTReg <= varT; --GE
			aluDReg <= varD; --GE
		end if;

		aluRmwOut <= rmwBits(7 downto 0);
		aluRegisterOut <= ninebits(7 downto 0);
		aluC <= varC;
		aluZ <= varZ;
		aluV <= varV;
		aluN <= varN;
		aluT <= varT; --GE
		aluD <= varD; --GE
		if pipelineAluOut then
			aluRmwOut <= aluRmwReg;
			aluRegisterOut <= aluNineReg;
			aluC <= aluCReg;
			aluZ <= aluZReg;
			aluV <= aluVReg;
			aluN <= aluNReg;
			aluT <= aluTReg; --GE
			aluD <= aluDReg; --GE
		end if;
	end process;

calcInterrupt: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				if theCpuCycle = cycleStack4
				or reset = '1' then
					nmiReg <= '1';
				end if;

				if nextCpuCycle /= cycleBranchTaken
				and nextCpuCycle /= opcodeFetch then
					irq1Reg <= irq1_n; --GE HuC6280
					irq2Reg <= irq2_n;
					tiqReg <= tiq_n; --GE HuC6280
					nmiEdge <= nmi_n;
					if (nmiEdge = '1') and (nmi_n = '0') then
						nmiReg <= '0';
					end if;
				end if;
				-- The 'or opcInfo(opcSetI)' prevents NMI immediately after BRK or IRQ.
				-- Presumably this is done in the real 6502/6510 to prevent a double IRQ.
				--GE processIrq <= not ((nmiReg and (irq2Reg or I)) or opcInfo(opcIRQ));
				--GE HuC6280 - Here, the highest priority IRQ will be handled, masking the others until it has been processed,
				--GE provided that the corresponding inputs are still held low when it happens.
				--GE Not sure *at all* about this behaviour...
				processIrq <= not ((nmiReg and ((irq1Reg and irq2Reg and tiqReg) or I)) or opcInfo(opcIRQ)); --GE HuC6280
			end if;
		end if;
	end process;

calcNextOpcode: process(clk, di, reset, processIrq)
		variable myNextOpcode : unsigned(7 downto 0);
	begin
		-- Next opcode is read from input unless a reset or IRQ is pending.
		myNextOpcode := di;
		if reset = '1' then
			myNextOpcode := X"4C";
		elsif processIrq = '1' then
			myNextOpcode := X"00";
		end if;
		
		nextOpcode <= myNextOpcode;
	end process;

	nextOpcInfo <= opcodeInfoTable(to_integer(nextOpcode));
	process(clk)
	begin
		if rising_edge(clk) then
			nextOpcInfoReg <= nextOpcInfo;
		end if;
	end process;

	-- Read bits and flags from opcodeInfoTable and store in opcInfo.
	-- This info is used to control the execution of the opcode.
calcOpcInfo: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				if (reset = '1') or (theCpuCycle = opcodeFetch) then
					opcInfo <= nextOpcInfo;
					if pipelineOpcode then
						opcInfo <= nextOpcInfoReg;
					end if;
				end if;
			end if;
		end if;
	end process;

calcTheOpcode:	process(clk)
	begin	
		if rising_edge(clk) then
			if enable = '1' then
				if theCpuCycle = opcodeFetch then
					irqActive <= '0';
					if processIrq = '1' then
						irqActive <= '1';
					end if;
					-- Fetch opcode
					theOpcode <= nextOpcode;
				end if;
			end if;
		end if;
	end process;
	
-- -----------------------------------------------------------------------
-- State machine
-- -----------------------------------------------------------------------
	process(enable, theCpuCycle, opcInfo)
	begin
		updateRegisters <= false;
		if enable = '1' then
			if opcInfo(opcRti) = '1' then
				if theCpuCycle = cycleRead then
					updateRegisters <= true;
				end if;
			elsif theCpuCycle = cycleBlkSuY --GE
			or theCpuCycle = cycleBlkSuA
			then
				updateRegisters <= true;
			elsif theCpuCycle = opcodeFetch then
				updateRegisters <= true;
			end if;
		end if;
	end process;

	debugOpcode <= theOpcode;
	process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				theCpuCycle <= nextCpuCycle;
			end if;
			if reset = '1' then
				theCpuCycle <= cycle2;
			end if;				
		end if;			
	end process;

	-- Determine the next cpu cycle. After the last cycle we always
	-- go to opcodeFetch to get the next opcode.
calcNextCpuCycle: process(theCpuCycle, opcInfo, theOpcode, indexOut, U, N, V, C, Z, aluZ, T, btLen)
	begin
		nextCpuCycle <= opcodeFetch;

		case theCpuCycle is
		when opcodeFetch =>
			nextCpuCycle <= cycle2;
		when cycle2 =>
			if opcInfo(opcBlock) = '1' then --GE fpr block transfers
				nextCpuCycle <= cycleBlkPreSd;
			elsif opcInfo(opcImmInW) = '1' then --GE for TST,TAM,TMA
				nextCpuCycle <= cyclePreReadImm;
			elsif opcInfo(opcBranch) = '1' then
				if opcInfo(opcStackAddr) = '1' then --GE HuC6280 for BSR
					nextCpuCycle <= cycleStack1;
				else
					if (N = theOpcode(5) and theOpcode(7 downto 6) = "00")
					or (V = theOpcode(5) and theOpcode(7 downto 6) = "01")
					or (C = theOpcode(5) and theOpcode(7 downto 6) = "10")
					or (theOpcode(4) = '0' and theOpcode(7 downto 6) = "10") --GE 65C02/HuC6280 BRA
					or (Z = theOpcode(5) and theOpcode(7 downto 6) = "11") then
						-- Branch condition is true
						nextCpuCycle <= cycleBranchTaken;
					end if;		
				end if;
			elsif (opcInfo(opcStackUp) = '1') then
				nextCpuCycle <= cycleStack1;
			elsif opcInfo(opcStackAddr) = '1'
			and opcInfo(opcStackData) = '1' then
				nextCpuCycle <= cycleStack2;
			elsif opcInfo(opcStackAddr) = '1' then
				nextCpuCycle <= cycleStack1;
			elsif opcInfo(opcStackData) = '1' then
				nextCpuCycle <= cycleWrite;
			elsif opcInfo(opcAbsolute) = '1' then
				nextCpuCycle <= cycle3;
			elsif opcInfo(opcIndirect) = '1' then
				--GE HuC6280 hutech.txt R(IND,INX,INY) takes 1 extra cycle
				--GE if opcInfo(indexX) = '1' then
					nextCpuCycle <= cyclePreIndirect;			
				--GE else
				--GE 	nextCpuCycle <= cycleIndirect;
				--GE end if;					
			elsif opcInfo(opcZeroPage) = '1' then
				if opcInfo(opcWrite) = '1' then
					--GE HuC6280 hutech.txt - W(ZPG,ZPX) takes 4 cycles
					--GE if (opcInfo(indexX) = '1')
					--GE or (opcInfo(indexY) = '1') then
						nextCpuCycle <= cyclePreWrite;
					--GE else						
					--GE 	nextCpuCycle <= cycleWrite;
					--GE end if;						
				else
					--GE HuC6280 hutech.txt - R(ZPG,ZPX) takes 4 cycles
					--GE if (opcInfo(indexX) = '1')
					--GE or (opcInfo(indexY) = '1') then
						nextCpuCycle <= cyclePreRead;
					--GE else						
					--GE 	nextCpuCycle <= cycleRead2;
					--GE end if;						
				end if;					
			elsif opcInfo(opcJump) = '1' then
				nextCpuCycle <= cycleJump;
			elsif opcInfo(opcSetSpeed) = '1' then --GE
				-- Insert extra cycle
				nextCpuCycle <= cycleEnd;
			elsif opcInfo(opcSwap) = '1' then --GE
				-- Insert extra cycle
				nextCpuCycle <= cycleEnd;			
			elsif opcInfo(opcUseT) = '1' and T = '1' then --GE for immediate with T flag
				nextCpuCycle <= cycleTRead;
			end if;
		when cycle3 =>
			--GE nextCpuCycle <= cycleRead;
			nextCpuCycle <= cyclePreReadAbs; --GE HuC6280 hutech.txt R(ABS,ABX,ABY) takes 1 extra cycle
			if opcInfo(opcWrite) = '1' then
				--GE if (opcInfo(indexX) = '1')
				--GE or (opcInfo(indexY) = '1') then
					nextCpuCycle <= cyclePreWrite; --GE HuC6280 hutech.txt W(ABS,ABX,ABY) takes 1 extra cycle
				--GE else						
				--GE 	nextCpuCycle <= cycleWrite;
				--GE end if;					
			end if;
			--GE if (opcInfo(opcIndirect) = '1')
			--GE and (opcInfo(indexX) = '1') then
			--GE 	if opcInfo(opcWrite) = '1' then
			--GE 		nextCpuCycle <= cycleWrite;
			--GE 	else					
			--GE 		nextCpuCycle <= cycleRead2;
			--GE 	end if;
			--GE end if;
			if (opcInfo(opcIndirect) = '1')		--GE
			and opcInfo(opcWrite) = '1' then	--GE
				nextCpuCycle <= cyclePreWrite;	--GE
			end if;								--GE
		when cyclePreIndirect =>			
			nextCpuCycle <= cycleIndirect;
		when cycleIndirect =>
			nextCpuCycle <= cycle3;
			
		when cyclePreBranchTaken => --GE HuC6280 for BSR
			nextCpuCycle <= cycleBranchTaken;
			
		when cycleBranchTaken =>
			--GE HuC6280 add 1 extra cycle anyway
			nextCpuCycle <= cycleEnd; --GE
			if indexOut(8) /= U(7) then
				-- Page boundary crossing during branch.
				nextCpuCycle <= cycleBranchPage;
			end if;
		when cyclePreRead =>
			if opcInfo(opcZeroPage) = '1' then
				--GE HuC6280 just to remove cycleRead2 from the main state machine
				--GE nextCpuCycle <= cycleRead2;
				nextCpuCycle <= cycleRead; --GE
			end if;
		when cycleRead =>
			if opcInfo(opcUseT) = '1' and T = '1' then --GE
				nextCpuCycle <= cycleTRead;
			elsif opcInfo(opcJump) = '1' then
				nextCpuCycle <= cycleJump;
			--GE HuC6280 - no penalty for page crossing
			--GE elsif indexOut(8) = '1' then
			--GE	-- Page boundary crossing while indexed addressing.
			--GE 	nextCpuCycle <= cycleRead2;
			elsif opcInfo(opcRmw) = '1' then
				nextCpuCycle <= cycleRmw;
				--GE HuC6280 - no extra cycle for indexed addressing
				--GE if opcInfo(indexX) = '1'
				--GE or opcInfo(indexY) = '1' then
				--GE 	-- 6510 needs extra cycle for indexed addressing
				--GE 	-- combined with RMW indexing
				--GE 	nextCpuCycle <= cycleRead2;
				--GE end if;
			elsif opcInfo(opcBbxn) = '1' then --GE
				nextCpuCycle <= cyclePreReadRel;
			end if;											
		when cycleRead2 =>
			if opcInfo(opcRmw) = '1' then
				nextCpuCycle <= cycleRmw;
			end if;							
		when cyclePreReadAbs => --GE
			nextCpuCycle <= cycleRead;
		
		when cyclePreReadRel => --GE
			nextCpuCycle <= cycleReadRel;			
		when cycleReadRel => --GE
			if aluZ = not theOpcode(7) then
				nextCpuCycle <= cycleBranchTaken;
			end if;

		when cyclePreReadImm => --GE
			nextCpuCycle <= cycleReadImm;
		when cycleReadImm => --GE
			if opcInfo(opcTst) = '1' then
				nextCpuCycle <= cyclePostReadImm;
			end if;
			if opcInfo(opcWrite) = '1' then
				nextCpuCycle <= cyclePostReadImm;
			end if;
			
		when cyclePostReadImm => --GE
			if opcInfo(opcAbsolute) = '1' then
				nextCpuCycle <= cycle3;
			elsif opcInfo(opcZeroPage) = '1' then
				nextCpuCycle <= cyclePreRead;
			end if;
		
		when cycleRmw =>
			nextCpuCycle <= cycleWrite;
			if opcInfo(opcXmbn) = '1' then		--GE RMBn/SMBn instructions are zp-RMW instructions
				nextCpuCycle <= cyclePreWrite;	--GE but take an extra cycle
			end if;								--GE
		when cyclePreWrite =>
			nextCpuCycle <= cycleWrite;
		when cycleStack1 =>
			nextCpuCycle <= cycleRead;
			if opcInfo(opcStackAddr) = '1' then
				nextCpuCycle <= cycleStack2;
			end if;				
		when cycleStack2 =>
			nextCpuCycle <= cycleStack3;
			if opcInfo(opcRti) = '1' then
				nextCpuCycle <= cycleRead;
			end if;
			if opcInfo(opcStackData) = '0'
			and opcInfo(opcStackUp) = '1' then
				nextCpuCycle <= cycleJump;
			end if;
		when cycleStack3 =>
			nextCpuCycle <= cycleRead;
			if opcInfo(opcBranch) = '1' then --GE HuC6280 for BSR
				nextCpuCycle <= cyclePreBranchTaken;
			elsif opcInfo(opcStackData) = '0'
			or opcInfo(opcStackUp) = '1' then
				nextCpuCycle <= cycleJump;
			elsif opcInfo(opcStackAddr) = '1' then
				nextCpuCycle <= cycleStack4;				
			end if;
		when cycleStack4 =>
			nextCpuCycle <= cycleRead;
		when cycleJump =>
			--GE HuC6280 extra cycle required in all cases
			--GE if opcInfo(opcIncrAfter) = '1' then
			--GE 	-- Insert extra cycle
				nextCpuCycle <= cycleEnd;
			--GE end if;				

		when cycleEnd => --GE
			if opcInfo(opcIncrAfter) = '1' then --GE for RTS instruction
				-- Insert extra cycle
				nextCpuCycle <= cycleEndIncr;
			end if;				
			
		when cycleTRead => --GE
			nextCpuCycle <= cycleTPreWrite;

		when cycleTPreWrite => --GE
			nextCpuCycle <= cycleTWrite;
		
		--GE HuC6280 - cycles dedicated to block transfer instructions
		when cycleBlkPreSd =>
			nextCpuCycle <= cycleBlkSdY;
		when cycleBlkSdY =>
			nextCpuCycle <= cycleBlkSdA;
		when cycleBlkSdA =>
			nextCpuCycle <= cycleBlkSdX;
		when cycleBlkSdX =>
			nextCpuCycle <= cycleBlkRdSrcA1;
		when cycleBlkRdSrcA1 =>
			nextCpuCycle <= cycleBlkRdSrcA2;
		when cycleBlkRdSrcA2 =>
			nextCpuCycle <= cycleBlkRdDstA1;
		when cycleBlkRdDstA1 =>
			nextCpuCycle <= cycleBlkRdDstA2;
		when cycleBlkRdDstA2 =>
			nextCpuCycle <= cycleBlkRdLen1;
		when cycleBlkRdLen1 =>
			nextCpuCycle <= cycleBlkRdLen2;
		when cycleBlkRdLen2 =>
			nextCpuCycle <= cycleBlkPreTrs;
		when cycleBlkPreTrs =>
			nextCpuCycle <= cycleBlkTrsRd1;
		when cycleBlkTrsRd1 =>
			nextCpuCycle <= cycleBlkTrsRd2;
		when cycleBlkTrsRd2 =>
			nextCpuCycle <= cycleBlkTrsWr1;
		when cycleBlkTrsWr1 =>
			nextCpuCycle <= cycleBlkTrsWr2;
		when cycleBlkTrsWr2 =>
			nextCpuCycle <= cycleBlkTrsLoop1;
		when cycleBlkTrsLoop1 =>
			nextCpuCycle <= cycleBlkTrsLoop2;
		when cycleBlkTrsLoop2 =>
			if btLen = x"0000" then
				nextCpuCycle <= cycleBlkPreSu;
			else
				nextCpuCycle <= cycleBlkTrsRd1;
			end if;
		when cycleBlkPreSu =>
			nextCpuCycle <= cycleBlkSuX;
		when cycleBlkSuX =>
			nextCpuCycle <= cycleBlkSuA;
		when cycleBlkSuA =>
			nextCpuCycle <= cycleBlkSuY;
		
		when others =>
			null;
		end case;
	end process;		

-- -----------------------------------------------------------------------
-- U register
-- -----------------------------------------------------------------------
calcU: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				case theCpuCycle is
				when cycle2 =>
					U <= di;
				when cycleStack1 | cycleStack2 =>
					if opcInfo(opcStackUp) = '1' then
						-- Read from stack
						U <= di;
					end if;											
				when cycleIndirect | cycleRead | cycleRead2 =>
					U <= di;
				when cycleReadRel => --GE
					U <= di;
				when cyclePostReadImm => --GE
					if opcInfo(opcTst) = '1' then
						U <= di;
					end if;
				
				when cycleBlkTrsRd1 => --GE
					U <= di;

				when cycleBlkSuX => --GE				
					U <= di;
				when cycleBlkSuA => --GE
					U <= di;					
				when cycleBlkSuY => --GE
					U <= di;
					
				when others =>
					null;					
				end case;
			end if;
		end if;		
	end process;

--GE -----------------------------------------------------------------------
-- W register
--GE -----------------------------------------------------------------------
calcW: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				case theCpuCycle is
				when cycle2 =>
					W <= theOpcode;
					if opcInfo(opcSwap) = '1' then
						if opcInfo(opcUpdateA) = '1' then
							W <= A;
						else
							W <= X;
						end if;
					end if;					
				when cycleTRead =>
					W <= di;
				when cyclePreReadImm =>
					W <= di;
				when others =>
					null;					
				end case;
			end if;
		end if;		
	end process;

--GE -----------------------------------------------------------------------
-- HuC6280 block transfer registers
--GE -----------------------------------------------------------------------
calcBtSrc: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				case theCpuCycle is
				when cycleBlkRdSrcA1 =>
					btSrc(7 downto 0) <= di;
				when cycleBlkRdSrcA2 =>
					btSrc(15 downto 8) <= di;
				
				when cycleBlkTrsLoop1 =>
					case theOpcode(7 downto 4) is
						when "1111" =>
							if btAlt = '1' then
								btSrc <= btSrc + 1;
							else
								btSrc <= btSrc - 1;
							end if;
						when "1100" =>
							btSrc <= btSrc - 1;
						when others =>
							btSrc <= btSrc + 1;
					end case;
				
				when others =>
					null;					
				end case;
			end if;
		end if;		
	end process;

calcBtDst: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				case theCpuCycle is
				when cycleBlkRdDstA1 =>
					btDst(7 downto 0) <= di;
				when cycleBlkRdDstA2 =>
					btDst(15 downto 8) <= di;

				when cycleBlkTrsLoop1 =>
					case theOpcode(7 downto 4) is
						when "1110" =>
							if btAlt = '1' then
								btDst <= btDst + 1;
							else
								btDst <= btDst - 1;
							end if;
						when "1111" | "0111" =>
							btDst <= btDst + 1;							
						when "1100" =>
							btDst <= btDst - 1;
						when others =>
							null;
					end case;

				when others =>
					null;					
				end case;
			end if;
		end if;		
	end process;

calcBtLen: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				case theCpuCycle is
				when cycleBlkRdLen1 =>
					btLen(7 downto 0) <= di;
				when cycleBlkRdLen2 =>
					btLen(15 downto 8) <= di;				
				when cycleBlkTrsLoop1 =>
					btLen <= btLen - 1;
				when others =>
					null;					
				end case;
			end if;
		end if;		
	end process;

calcBtAlt: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				case theCpuCycle is
				when cycleBlkRdLen1 =>
					btAlt <= '0';
				when cycleBlkTrsWr2 =>
					btAlt <= not btAlt;
				when others =>
					null;			
				end case;
			end if;
		end if;		
	end process;

	
-- -----------------------------------------------------------------------
-- A register
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if updateRegisters then
				if theCpuCycle = cycleBlkSuY then --GE
					A <= aluRegisterOut;
				elsif opcInfo(opcUpdateA) = '1' 
				and (T = '0' or opcInfo(opcUseT) = '0') --GE HuC6280
				then
					A <= aluRegisterOut;
				end if;					
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- X register
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if updateRegisters then
				if theCpuCycle = cycleBlkSuA then --GE
					X <= aluRegisterOut;
				elsif opcInfo(opcUpdateX) = '1' then
					X <= aluRegisterOut;
					if opcInfo(opcSwap) = '1' then --GE
						if opcInfo(opcUpdateA) = '1' then
							X <= W;
						end if;
					end if;
				end if;					
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Y register
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if updateRegisters then
				if opcInfo(opcUpdateY) = '1' then
					Y <= aluRegisterOut;
					if opcInfo(opcSwap) = '1' then --GE
						Y <= W;
					end if;
				end if;					
			end if;
		end if;
	end process;
	
-- -----------------------------------------------------------------------
-- C flag
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if updateRegisters then
				if opcInfo(opcUpdateC) = '1' then
					C <= aluC;
				end if;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Z flag
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if updateRegisters then
				if opcInfo(opcUpdateZ) = '1' then
					Z <= aluZ;
				end if;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- I flag
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then --GE pcetech.txt
				I <= '1';
			elsif updateRegisters then
				if opcInfo(opcUpdateI) = '1' then
					I <= aluInput(2);
				end if;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- D flag
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then --GE pcetech.txt
				D <= '0';		
			elsif updateRegisters then
				if opcInfo(opcUpdateD) = '1' then
					--GE D <= aluInput(3);
					--GE 65C02/HuC6280 - In the original 6502, the D flag was unchanged during IRQs
					-- In the 65C02, it is cleared to prevent side effects
					D <= aluD; --GE
				end if;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- V flag
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if updateRegisters then
				if opcInfo(opcUpdateV) = '1' then
					V <= aluV;
				end if;
			end if;
			if enable = '1' then
				if soReg = '1' and so_n = '0' then
					V <= '1';
				end if;
				soReg <= so_n;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- N flag
-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if updateRegisters then
				if opcInfo(opcUpdateN) = '1' then
					N <= aluN;
				end if;
			end if;
		end if;
	end process;

--GE -----------------------------------------------------------------------
-- HuC6280 T flag
--GE -----------------------------------------------------------------------
--GE T flag is set or reset after every instruction
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then --GE pcetech.txt
				T <= '0';
			elsif updateRegisters then
				T <= aluT;
			end if;
		end if;
	end process;

--GE ---------------------------------------------------------------------
-- HuC6280 MPR register
--GE ---------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				MPR(7) <= x"00"; --GE pcetech.txt
			elsif updateRegisters then
				if opcInfo(opcMpr) = '1' and opcInfo(opcWrite) = '1' then
					if W /= x"00" then --GE pcetech.txt
						MPRReg <= aluRegisterOut;
					end if;
					if W(0) = '1' then
						MPR(0) <= aluRegisterOut;
					end if;
					if W(1) = '1' then
						MPR(1) <= aluRegisterOut;
					end if;
					if W(2) = '1' then
						MPR(2) <= aluRegisterOut;
					end if;
					if W(3) = '1' then
						MPR(3) <= aluRegisterOut;
					end if;
					if W(4) = '1' then
						MPR(4) <= aluRegisterOut;
					end if;
					if W(5) = '1' then
						MPR(5) <= aluRegisterOut;
					end if;
					if W(6) = '1' then
						MPR(6) <= aluRegisterOut;
					end if;
					if W(7) = '1' then
						MPR(7) <= aluRegisterOut;
					end if;
				end if;
			end if;
		end if;
	end process;

--GE ---------------------------------------------------------------------
-- HuC6280 High Speed Mode register
--GE ---------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				-- speed <= '0'; --GE pcetech.txt
				speed <= '1'; --GE TEMPORARY
			elsif updateRegisters then
				if opcInfo(opcSetSpeed) = '1' then
					speed <= aluRegisterOut(0);
				end if;
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Stack pointer
-- -----------------------------------------------------------------------
	process(clk)
		variable sIncDec : unsigned(7 downto 0);
		variable sInc : unsigned(7 downto 0); --GE
		variable sDec : unsigned(7 downto 0); --GE
		variable updateFlag : boolean;
		variable incrS : boolean; --GE
		variable decrS : boolean; --GE
	begin
		if rising_edge(clk) then

			sInc := S + 1;
			sDec := S - 1;
		
			if opcInfo(opcStackUp) = '1' then
				sIncDec := S + 1;
			else
				sIncDec := S - 1;
			end if;	
			
			if enable = '1' then
				updateFlag := false;			
				incrS := false;
				decrS := false;
				case nextCpuCycle is
				when cycleStack1 =>
					if (opcInfo(opcStackUp) = '1')
					or (opcInfo(opcStackData) = '1') then
						updateFlag := true;			
					end if;
				when cycleStack2 =>
					updateFlag := true;
				when cycleStack3 =>
					updateFlag := true;			
				when cycleStack4 =>
					updateFlag := true;
				when cycleRead =>
					if opcInfo(opcRti) = '1' then							
						updateFlag := true;
					end if;						
				when cycleWrite =>
					if opcInfo(opcStackData) = '1' then
						updateFlag := true;
					end if;		

				when cycleBlkSdY | cycleBlkSdA | cycleBlkSdX => --GE
					decrS := true;
				when cycleBlkPreSu | cycleBlkSuX | cycleBlkSuA => --GE
					incrS := true;
					
				when others =>
					null;					
				end case;
				if updateFlag then
					S <= sIncDec;
				end if;				
				if incrS then --GE
					S <= sInc;
				end if;
				if decrS then --GE
					S <= sDec;
				end if;
			end if;
			if updateRegisters then
				if opcInfo(opcUpdateS) = '1' then
					S <= aluRegisterOut;
				end if;					
			end if;
		end if;
	end process;

-- -----------------------------------------------------------------------
-- Data out
-- -----------------------------------------------------------------------
--calcDo: process(cpuNo, theCpuCycle, aluOut, PC, T)
calcDo: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				doReg <= aluRmwOut;
				if opcInfo(opcInH) = '1' then
					-- For illegal opcodes SHA, SHX, SHY, SHS
					doReg <= aluRmwOut and myAddrIncrH;
				end if;

				case nextCpuCycle is
				when cycleStack2 =>
					if opcInfo(opcIRQ) = '1'
					and irqActive = '0' then
						doReg <= myAddrIncr(15 downto 8);
					else
						doReg <= PC(15 downto 8);
					end if;
				when cycleStack3 =>
					doReg <= PC(7 downto 0);
				when cycleRmw =>
--					do <= T; -- Read-modify-write write old value first.
					--GE pcetech.txt - no dummy write or read of the old value
					--GE doReg <= di; -- Read-modify-write write old value first.
				when cycleTWrite => --GE
					doReg <= aluRegisterOut;
				when cyclePostReadImm => --GE
					doReg <= W;
					
				when cycleBlkSdY => --GE
					doReg <= Y;
				when cycleBlkSdA => --GE
					doReg <= A;
				when cycleBlkSdX => --GE
					doReg <= X;
				
				when others => null;
				end case;
			end if;			
		end if;
	end process;
	do <= doReg;
	


-- -----------------------------------------------------------------------
-- Write enable
-- -----------------------------------------------------------------------
calcWe: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				theWe <= '0';
				case nextCpuCycle is
				when cycleStack1 =>
					if opcInfo(opcStackUp) = '0'
					and ((opcInfo(opcStackAddr) = '0')
					or (opcInfo(opcStackData) = '1')) then
						theWe <= '1';
					end if;						
				when cycleStack2 | cycleStack3 | cycleStack4 =>
					if opcInfo(opcStackUp) = '0' then
						theWe <= '1';
					end if;						
				--GE HuC6280 hutech.txt
				--GE when cycleRmw =>
				--GE 	theWe <= '1';
				when cycleWrite =>
					theWe <= '1';
				when cycleTWrite => --GE
					theWe <= '1';
				when cyclePostReadImm => --GE
					if opcInfo(opcStn) = '1' then
						theWe <= '1';
					end if;
					
				when cycleBlkSdY | cycleBlkSdA | cycleBlkSdX => --GE
					theWe <= '1';
				when cycleBlkTrsWr2 => --GE
					theWe <= '1';
					
				when others =>
					null;
				end case;				
			end if;
		end if;							
	end process;
	we <= theWe;

--GE -----------------------------------------------------------------------
-- HuC6280 Output enable / Read Strobe
--GE -----------------------------------------------------------------------
calcOe: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
			
				theOe <= '0';
				
				case nextCpuCycle is
				when opcodeFetch => -- opcode
					theOe <= '1';
				when cycle2 =>
					theOe <= '1';
				when cycleIndirect  | cycleRead | cycleRead2 
					| cycleReadRel | cycleBlkTrsRd1 => -- U register
					theOe <= '1';
				when cyclePostReadImm => -- U register
					if opcInfo(opcTst) = '1' then
						theOe <= '1';
					end if;
				when cycleStack1 | cycleStack2 => -- U register
					if opcInfo(opcStackUp) = '1' then
						theOe <= '1';
					end if;

				when cycleTRead | cyclePreReadImm => -- W register
					theOe <= '1';

				when cycleBlkRdSrcA1 | cycleBlkRdSrcA2 => -- btSrc
					theOe <= '1';
				when cycleBlkRdDstA1 | cycleBlkRdDstA2 => -- btDst
					theOe <= '1';
				when cycleBlkRdLen1 | cycleBlkRdLen2 => -- btLen
					theOe <= '1';

				when cycleBlkSuX | cycleBlkSuA | cycleBlkSuY =>
					theOe <= '1';
					
				when cyclePreWrite => -- Address calculation
					theOe <= '1'; -- Absolute addressing
					if opcInfo(opcZeroPage) = '1'
					or opcInfo(opcXmbn) = '1' then -- ZP or relative addressing
						theOe <= '0';
					end if;

--GE /!\					
				-- when cyclePreIndirect => -- Address calculation
					-- theOe <= '1';
					-- if opcInfo(IndexX) = '1' then
						-- theOe <= '0';
					-- end if;

--GE /!\									
				-- when cyclePreRead => -- Address calculation
					-- if opcInfo(opcBbxn) = '1' then
						-- theOe <= '1';
					-- end if;
					
				when cyclePreReadAbs | cycleJump => -- Address calculation
					theOe <= '1';
					
				when others =>
					null;
				end case;				

			end if;
		end if;							
	end process;
	oe <= theOe;
	-- oe <= '1';

-- -----------------------------------------------------------------------
-- Program counter
-- -----------------------------------------------------------------------
calcPC: process(clk)
	begin
		if rising_edge(clk) then
			if enable = '1' then
				case theCpuCycle is
				when opcodeFetch =>
					PC <= myAddr;
				when cycle2 =>
					if irqActive = '0' then
						if opcInfo(opcSecondByte) = '1' then
							PC <= myAddrIncr;
						else							
							PC <= myAddr;
						end if;							
					end if;						
				when cycle3 =>
					if opcInfo(opcAbsolute) = '1' then
						PC <= myAddrIncr;					
					end if;
				when cyclePreReadRel => --GE
					PC <= myAddrIncr;				
				when cycleReadImm => --GE
					if opcInfo(opcTst) = '1' then
						PC <= myAddrIncr;				
					else
						PC <= myAddr;
					end if;
				when cycleBlkRdLen2 => --GE
					PC <= myAddrIncr;
					
				when others =>
					null;
				end case;
			end if;
		end if;
	end process;
	debugPc <= PC;

-- -----------------------------------------------------------------------
-- Address generation
-- -----------------------------------------------------------------------
calcNextAddr: process(theCpuCycle, opcInfo, indexOut, U, reset, T) --GE added T
	begin
		nextAddr <= nextAddrIncr;
		case theCpuCycle is
		when cycle2 =>
			if opcInfo(opcImmInW) = '1' then --GE for TST,TAM,TMA
				nextAddr <= nextAddrHold;
			elsif opcInfo(opcStackAddr) = '1' 
			or opcInfo(opcStackData) = '1' then
				nextAddr <= nextAddrStack;
			elsif opcInfo(opcAbsolute) = '1' then
				nextAddr <= nextAddrIncr;
			elsif opcInfo(opcZeroPage) = '1' then
					--GE nextAddr <= nextAddrZeroPage;				
				nextAddr <= nextAddrHold; --GE HuC6280 hutech.txt - ZPG,ZPX
			elsif opcInfo(opcIndirect) = '1' then
				--GE nextAddr <= nextAddrZeroPage;				
				nextAddr <= nextAddrHold; --GE HuC6280 hutech.txt - IND,INX,INY
			elsif opcInfo(opcUseT) = '1' and T = '1' then --GE for immediate with T flag
				nextAddr <= nextAddrT;
			elsif opcInfo(opcSecondByte) = '1' then
				nextAddr <= nextAddrIncr;
			else
				nextAddr <= nextAddrHold;
			end if;
		when cycle3 =>
			--GE Moved to cyclePreReadAbs and cyclePreWrite
			--GE if (opcInfo(opcIndirect) = '1')
			--GE and (opcInfo(indexX) = '1') then
			--GE 	nextAddr <= nextAddrAbs;
			--GE else							
			--GE	nextAddr <= nextAddrAbsIndexed;
			--GE end if;
			nextAddr <= nextAddrHold; --GE
		when cyclePreIndirect =>
			--GE HuC6280 hutech.txt - IND,INX,INY
			--GE nextAddr <= nextAddrZPIndexed;
			nextAddr <= nextAddrZeroPage;		--GE
			if opcInfo(IndexX) = '1' then		--GE
				nextAddr <= nextAddrZPIndexed;	--GE
			end if;								--GE
		when cycleIndirect =>
			nextAddr <= nextAddrIncrL;
		when cycleBranchTaken =>
			nextAddr <= nextAddrRelative;
		when cycleBranchPage =>
			if U(7) = '0' then
				nextAddr <= nextAddrIncrH;
			else				
				nextAddr <= nextAddrDecrH;
			end if;
		when cyclePreRead =>
			--GE 65C02/HuC6280 for BBxn instructions
			--GE indexOut contains the relative offset used for branching,
			--GE therefore nextAddrZeroPage must be asserted
			if opcInfo(opcBbxn) = '1' then
				nextAddr <= nextAddrZeroPage;
			else
				nextAddr <= nextAddrZPIndexed;
			end if;
		when cyclePreReadAbs => --GE
			if (opcInfo(opcIndirect) = '1')
			and (opcInfo(indexX) = '1') then
				nextAddr <= nextAddrAbs;
			else							
				nextAddr <= nextAddrAbsIndexed;
			end if;
		when cycleRead =>
			nextAddr <= nextAddrPc;
			if opcInfo(opcUseT) = '1' and T = '1' then --GE
				nextAddr <= nextAddrT;
			elsif opcInfo(opcJump) = '1' then
				-- Emulate 6510 bug, jmp(xxFF) fetches from same page.
				-- Replace with nextAddrIncr if emulating 65C02 or later cpu.
				--GE nextAddr <= nextAddrIncrL; 
				nextAddr <= nextAddrIncr; --GE
			--GE HuC6280 - no penalty for page crossing
			--GE elsif indexOut(8) = '1' then 
			--GE	nextAddr <= nextAddrIncrH;
			elsif opcInfo(opcRmw) = '1' then
				nextAddr <= nextAddrHold;
			end if;
		when cycleRead2 =>
			nextAddr <= nextAddrPc;
			if opcInfo(opcRmw) = '1' then
				nextAddr <= nextAddrHold;
			end if;
			
		when cyclePreReadRel => --GE
			nextAddr <= nextAddrHold;
		when cycleReadRel => --GE
			nextAddr <= nextAddrPc;

		when cyclePreReadImm => --GE
			nextAddr <= nextAddrIncr;
		when cycleReadImm => --GE
			nextAddr <= nextAddrHold;
			if opcInfo(opcStn) = '1' then
				nextAddr <= nextAddrVdc;
			end if;
			
		when cyclePostReadImm => --GE
			nextAddr <= nextAddrPc;
			
		when cycleRmw =>
			nextAddr <= nextAddrHold;			
		when cyclePreWrite =>
			--GE nextAddr <= nextAddrHold;			
			if (opcInfo(opcIndirect) = '1')		--GE
			and (opcInfo(indexX) = '1') then	--GE
				nextAddr <= nextAddrAbs;		--GE
			else								--GE
				nextAddr <= nextAddrAbsIndexed;	--GE
			end if;								--GE
			
			if opcInfo(opcZeroPage) = '1' then
				nextAddr <= nextAddrZPIndexed;
			--GE HuC6280 - no penalty for page crossing
			--GE elsif indexOut(8) = '1' then
			--GE	nextAddr <= nextAddrIncrH;
			end if;							

			if opcInfo(opcXmbn) = '1' then		--GE for RMBn/SMBn instructions
				nextAddr <= nextAddrHold;		--GE
			end if;								--GE
			
		when cycleWrite =>
			nextAddr <= nextAddrPc;			
		when cycleStack1 =>
			nextAddr <= nextAddrStack;
		when cycleStack2 =>
			nextAddr <= nextAddrStack;
		when cycleStack3 =>
			nextAddr <= nextAddrStack;
			if opcInfo(opcStackData) = '0' then
				nextAddr <= nextAddrPc;
			end if;				
		when cycleStack4 =>
			nextAddr <= nextAddrIrq;
		when cycleJump =>
			nextAddr <= nextAddrAbs;
		--GE when cycleEnd => --GE
		--GE	nextAddr <= nextAddrHold;
		--GE	if opcInfo(opcIncrAfter) = '1' then
		--GE		nextAddr <= nextAddrIncr;
		--GE	end if;
		when cycleEnd => --GE
			nextAddr <= nextAddrHold;
		when cycleEndIncr => --GE
			nextAddr <= nextAddrIncr;

		when cycleTRead => --GE
			nextAddr <= nextAddrHold;
			-- nextAddr <= nextAddrT;
		when cycleTPreWrite => --GE
			nextAddr <= nextAddrHold;
		when cycleTWrite => --GE
			nextAddr <= nextAddrPc;
			
		--GE HuC6280 for block transfers
		when cycleBlkPreSd | cycleBlkSdY | cycleBlkSdA =>
			nextAddr <= nextAddrStack;
		when cycleBlkSdX =>
			nextAddr <= nextAddrPc;
		when cycleBlkRdLen2 =>
			nextAddr <= nextAddrHold;
		when cycleBlkPreTrs =>
			nextAddr <= nextAddrBtSrc;
		when cycleBlkTrsRd1 =>
			nextAddr <= nextAddrHold;
		when cycleBlkTrsRd2 =>	
			nextAddr <= nextAddrBtDst;
		when cycleBlkTrsWr1 | cycleBlkTrsWr2 | cycleBlkTrsLoop1 =>
			nextAddr <= nextAddrHold;
		when cycleBlkTrsLoop2 =>
			nextAddr <= nextAddrBtSrc;
		when cycleBlkPreSu | cycleBlkSuX | cycleBlkSuA =>
			nextAddr <= nextAddrStack;
		when cycleBlkSuY =>
			nextAddr <= nextAddrPc;		
			
		when others =>
			null;
		end case;										
		if reset = '1' then
			nextAddr <= nextAddrReset;
		end if;			
	end process;
	
indexAlu: process(opcInfo, myAddr, U, X, Y)
	begin
		if opcInfo(indexX) = '1' then
			indexOut <= (B"0" & U) + (B"0" & X);
		elsif opcInfo(indexY) = '1' then
			indexOut <= (B"0" & U) + (B"0" & Y);
		elsif opcInfo(opcBranch) = '1' then			
			indexOut <= (B"0" & U) + (B"0" & myAddr(7 downto 0));
		elsif opcInfo(opcBbxn) = '1' then	--GE
			indexOut <= (B"0" & U) + (B"0" & myAddr(7 downto 0));
		else
			indexOut <= B"0" & U;
		end if;
	end process;

calcAddr: process(clk)
	begin
		if rising_edge(clk) then		
			if enable = '1' then
				vdcAddr <= '0';

				case nextAddr is
				when nextAddrIncr => myAddr <= myAddrIncr;
				when nextAddrIncrL => myAddr(7 downto 0) <= myAddrIncr(7 downto 0);
				when nextAddrIncrH => myAddr(15 downto 8) <= myAddrIncrH;
				when nextAddrDecrH => myAddr(15 downto 8) <= myAddrDecrH;
				when nextAddrPc => myAddr <= PC;
				when nextAddrIrq =>
					--GE myAddr <= X"FFFE";
					myAddr <= X"FFF6"; --GE HuC6280
					if irq1Reg = '0' then
						myAddr <= X"FFF8";
					end if;
					if tiqReg = '0' then
						myAddr <= X"FFFA";
					end if;					
					if nmiReg = '0' then
						myAddr <= X"FFFC";
					end if;
				--GE when nextAddrReset => myAddr <= X"FFFC";
				when nextAddrReset => myAddr <= X"FFFE"; --GE HuC6280
				when nextAddrAbs => myAddr <= di & U;
				--GE As extra cycles used for page crossing are now gone in absolute indexed addressing mode,
				--GE the "nextAddrIncrH" step is skipped, so the full address increment is performed here
				--GE when nextAddrAbsIndexed => myAddr <= di & indexOut(7 downto 0);
				when nextAddrAbsIndexed =>							--GE 
					if indexOut(8) = '1' then						--GE
						myAddr <= (di + 1) & indexOut(7 downto 0);	--GE
					else											--GE
						myAddr <= di & indexOut(7 downto 0);		--GE
					end if;											--GE
				--GE HuC6280 - Pages 0/1 are located at 0x2000-0x20FF/0x2100-0x21FF
				--GE when nextAddrZeroPage => myAddr <= "00000000" & di;
				--GE when nextAddrZPIndexed => myAddr <= "00000000" & indexOut(7 downto 0);
				--GE when nextAddrStack => myAddr <= "00000001" & S;

-- GE /!\
				-- when nextAddrZeroPage => myAddr <= "00100000" & di; --GE
				when nextAddrZeroPage => myAddr <= "00100000" & U;

				when nextAddrZPIndexed => myAddr <= "00100000" & indexOut(7 downto 0); --GE
				when nextAddrStack => myAddr <= "00100001" & S; --GE
				
				when nextAddrRelative => myAddr(7 downto 0) <= indexOut(7 downto 0);
				when nextAddrT => myAddr <= "00100000" & X; --GE HuC6280 T flag addressing
				when nextAddrVDC => --GE HuC6280
					vdcAddr <= '1';
					case theOpcode(5 downto 4) is
						when "00" => myAddr <= x"0000";
						when "01" => myAddr <= x"0002";
						when others => myAddr <= x"0003";
					end case;
				
				when nextAddrBtSrc => --GE HuC6280
					myAddr <= btSrc;
				when nextAddrBtDst => --GE HuC6280
					myAddr <= btDst;
		
				when others => null;
				end case;
			end if;
		end if;							
	end process;	

	myAddrIncr <= myAddr + 1;
	myAddrIncrH <= myAddr(15 downto 8) + 1;
	myAddrDecrH <= myAddr(15 downto 8) - 1;

	--GE addr <= myAddr;
	addr <= x"FF" & myAddr(12 downto 0) when vdcAddr = '1'
		else MPR(to_integer(myAddr(15 downto 13))) & myAddr(12 downto 0); --GE

	debugA <= A;
	debugX <= X;
	debugY <= Y;
	debugS <= S;

	hsm <= speed; --GE HuC6280 High Speed Mode signal

	blk <= opcInfo(opcBlock); --GE HuC6280 Block Transfer Operation
	
	nvtbdizc <= N & V & T & (not irqActive) & D & I & Z & C; --GE
	
end architecture;


