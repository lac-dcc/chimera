--------------------------------------------------------------------------------
-- 
-- SGS2650 CPU
--------------------------------------------------------------------------------

-- Package :
-- - ALU operations
-- - Instruction decode

--------------------------------------------------------------------------------
-- DO 4/2018
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- This design can be used for any purpose.
-- Please send any bug report or remark to : dev@temlib.org
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.base_pack.ALL;

PACKAGE sgs2650_pack IS
  TYPE enum_fmt IS (
    Z,    -- 1  Register Zero, register in [1:0]
    I,    -- 2 Immediate, register in [1:0]
    R,    -- 2 Relative, register in [1:0]
    A,    -- 3 Absolute, non branch, register in [1:0]
    B,    -- 3 Absolute, branch instruction
    C,    -- 3 (LDPL/STPL)
    E,    -- 1 Misc, implicit
    EI,   -- 2 Immediate, no register
    ER,   -- 2 Relative, no register
    EB);  -- 3 Absolute, branch, no register

  TYPE enum_ins IS (
    STR,  -- STR_  : Z.RA : Store
    LDP,  -- LDPL  : C    : Load program status lower from memory (2650-B)
    STP,  -- STPL  : C    : Store program status lower to memory  (2650-B)
    SPS,  -- SPSU  : E    : Store program status upper
          -- SPSL  : E    : Store program status lower
    LPS,  -- LPSU  : E    : Load program status, upper
          -- LPSL  : E    : Load program status, lower
    CPPS, -- CPSU  : EI   : Clear program status Upper, Masked
          -- CPSL  : EI   : Clear program status Lower, Masked
          -- PPSU  : EI   : Preset program status Upper, Masked
          -- PPSL  : EI   : Preset program status Lower, Masked
    TPS,  -- TPSU  : EI   : Test Program Status Upper, Masked
          -- TPSL  : EI   : Test Program Status Lower, Masked
    
    ALU,  -- LOD_  : ZIRA : Load
          -- EOR_  : ZIRA : Exclusive Or
          -- IOR_  : ZIRA : Or
          -- AND_  : ZIRA : And
          -- ADD_  : ZIRA : Add
          -- SUB_  : ZIRA : Sub
          -- COM_  : ZIRA : Compare
    ROT,  -- RRR   : Z    : Rotate Register Right
          -- RRL   : Z    : Rotate Register Left
    TMI,  -- TMI   :  I   : Test Under Mask, Immediate
    DAR,  -- DAR   : Z    : Decimal Adjust Register
    
    BSTF, -- BST_  :   RB : Branch to Sub on Condition True
          -- BSF_  :   RB : Branch to Sub on Condition false
    HALT, -- HALT  : E    : Halt, enter wait state
    
    IO ,  -- REDE  :  I   : Read Extended
          -- REDD  : Z    : Read Data
          -- REDC  : Z    : Read Control
          -- WRTC  : Z    : Write Control
          -- WRTE  :  I   : Write Extended
          -- WRTD  : Z    : Write Data
    BCTF, -- BCT_  :   RB : Branch on Condition True
          -- BCF_  :   RB : Branch on Condition False
    BRN,  -- BRN_  :   RB : Branch on Register non-zero
    BIDR, -- BIR_  :   RB : Branch on Incrementing Register
          -- BDR_  :   RB : Branch on Decrementing Register
    BXA,  -- BXA   : EB   : Branch indexed absolute, unconditional
    ZBRR, -- ZBRR  : ER   : Zero Branch, Relative, unconditional
    
    BSN,  -- BSN_  :   RB : Branch to sub on non-zero reg
    BSXA, -- BSXA  : EB   : Branch to Sub indexed absolute unconditional
    ZBSR, -- ZBSR  : ER   : Zero branch to sub relative unconditional
    
    RET   -- RETC  : Z    : Return from Subroutine, Conditional
          -- RETE  : Z    : Return from Sub and Enable Int, Conditional
    );
  
  TYPE type_deco IS RECORD
    dis    : string(1 TO 7);       -- TRACE : Instruction
    fmt    : enum_fmt;             -- Instruction format (addressing mode)
    ins    : enum_ins;             -- Instruction type
    len    : natural RANGE 1 TO 3; -- Instruction lenght
    cycles : natural RANGE 0 TO 4; -- Instruction time
  END RECORD;
  TYPE arr_deco IS ARRAY (natural RANGE <>) OF type_deco;
  
  CONSTANT opcodes:arr_deco(0 TO 255):=(
    ("LODZ R0", Z,ALU ,1,2), -- 00  <Invalid>
    ("LODZ R1", Z,ALU ,1,2), -- 01 Load, Register Zero (1 cycle -B)
    ("LODZ R2", Z,ALU ,1,2), -- 02 Load, Register Zero (1 cycle -B)
    ("LODZ R3", Z,ALU ,1,2), -- 03 Load, Register Zero (1 cycle -B)
    ("LODI R0", I,ALU ,2,2), -- 04 Load, Immediate
    ("LODI R1", I,ALU ,2,2), -- 05 Load, Immediate
    ("LODI R2", I,ALU ,2,2), -- 06 Load, Immediate
    ("LODI R3", I,ALU ,2,2), -- 07 Load, Immediate
    ("LODR R0", R,ALU ,2,3), -- 08 Load, Relative
    ("LODR R1", R,ALU ,2,3), -- 09 Load, Relative
    ("LODR R2", R,ALU ,2,3), -- 0A Load, Relative
    ("LODR R3", R,ALU ,2,3), -- 0B Load, Relative
    ("LODA R0", A,ALU ,3,4), -- 0C Load, Absolute
    ("LODA R1", A,ALU ,3,4), -- 0D Load, Absolute
    ("LODA R2", A,ALU ,3,4), -- 0E Load, Absolute
    ("LODA R3", A,ALU ,3,4), -- 0F Load, Absolute
    ("LDPL   ", C,LDP ,3,4), -- 10 Load program status lower from mem (-B)
    ("STPL   ", C,STP ,3,4), -- 11 Store program status lower to mem (-B)
    ("SPSU   ", E,SPS ,1,2), -- 12 Store program status upper
    ("SPSL   ", E,SPS ,1,2), -- 13 Store program status lower
    ("RETC  =", Z,RET ,1,3), -- 14 Return from Subroutine, Conditional
    ("RETC  >", Z,RET ,1,3), -- 15 Return from Subroutine, Conditional
    ("RETC  <", Z,RET ,1,3), -- 16 Return from Subroutine, Conditional
    ("RETC  *", Z,RET ,1,3), -- 17 Return from Subroutine, Conditional
    ("BCTR  =", R,BCTF,2,3), -- 18 Branch on Condition True, Relative
    ("BCTR  >", R,BCTF,2,3), -- 19 Branch on Condition True, Relative
    ("BCTR  <", R,BCTF,2,3), -- 1A Branch on Condition True, Relative
    ("BCTR  *", R,BCTF,2,3), -- 1B Branch on Condition True, Relative
    ("BCTA  =", B,BCTF,3,3), -- 1C Branch on Condition True, Absolute
    ("BCTA  >", B,BCTF,3,3), -- 1D Branch on Condition True, Absolute
    ("BCTA  <", B,BCTF,3,3), -- 1E Branch on Condition True, Absolute
    ("BCTA  *", B,BCTF,3,3), -- 1F Branch on Condition True, Absolute
    ("EORZ R0", Z,ALU ,1,2), -- 20 Exclusive Or, Register Zero (1 cycle -B)
    ("EORZ R1", Z,ALU ,1,2), -- 21 Exclusive Or, Register Zero (1 cycle -B)
    ("EORZ R2", Z,ALU ,1,2), -- 22 Exclusive Or, Register Zero (1 cycle -B)
    ("EORZ R3", Z,ALU ,1,2), -- 23 Exclusive Or, Register Zero (1 cycle -B)
    ("EORI R0", I,ALU ,2,2), -- 24 Exclusive Or, Immediate
    ("EORI R1", I,ALU ,2,2), -- 25 Exclusive Or, Immediate
    ("EORI R2", I,ALU ,2,2), -- 26 Exclusive Or, Immediate
    ("EORI R3", I,ALU ,2,2), -- 27 Exclusive Or, Immediate
    ("EORR R0", R,ALU ,2,3), -- 28 Exclusive Or, Relative
    ("EORR R1", R,ALU ,2,3), -- 29 Exclusive Or, Relative
    ("EORR R2", R,ALU ,2,3), -- 2A Exclusive Or, Relative
    ("EORR R3", R,ALU ,2,3), -- 2B Exclusive Or, Relative
    ("EORA R0", A,ALU ,3,4), -- 2C Exclusive Or, Absolute
    ("EORA R1", A,ALU ,3,4), -- 2D Exclusive Or, Absolute
    ("EORA R2", A,ALU ,3,4), -- 2E Exclusive Or, Absolute
    ("EORA R3", A,ALU ,3,4), -- 2F Exclusive Or, Absolute
    ("REDC R0", Z,IO  ,1,2), -- 30 Read Control
    ("REDC R1", Z,IO  ,1,2), -- 31 Read Control
    ("REDC R2", Z,IO  ,1,2), -- 32 Read Control
    ("REDC R3", Z,IO  ,1,2), -- 33 Read Control
    ("RETE  =", Z,RET ,1,3), -- 34 Return from Sub and Enable Int, Conditional
    ("RETE  >", Z,RET ,1,3), -- 35 Return from Sub and Enable Int, Conditional
    ("RETE  <", Z,RET ,1,3), -- 36 Return from Sub and Enable Int, Conditional
    ("RETE  *", Z,RET ,1,3), -- 37 Return from Sub and Enable Int, Conditional
    ("BSTR  =", R,BSTF,2,3), -- 38 Branch to Sub on Condition True, Relative
    ("BSTR  >", R,BSTF,2,3), -- 39 Branch to Sub on Condition True, Relative
    ("BSTR  <", R,BSTF,2,3), -- 3A Branch to Sub on Condition True, Relative
    ("BSTR  *", R,BSTF,2,3), -- 3B Branch to Sub on Condition True, Relative
    ("BSTA  =", B,BSTF,3,3), -- 3C Branch to Sub on Condition True, Absolute
    ("BSTA  >", B,BSTF,3,3), -- 3D Branch to Sub on Condition True, Absolute
    ("BSTA  <", B,BSTF,3,3), -- 3E Branch to Sub on Condition True, Absolute
    ("BSTA  *", B,BSTF,3,3), -- 3F Branch to Sub on Condition True, Absolute
    ("HALT   ", E,HALT,1,2), -- 40 Halt, enter wait state
    ("ANDZ R1", Z,ALU ,1,2), -- 41 And, Register Zero (1 cycle -B)
    ("ANDZ R2", Z,ALU ,1,2), -- 42 And, Register Zero (1 cycle -B)
    ("ANDZ R3", Z,ALU ,1,2), -- 43 And, Register Zero (1 cycle -B)
    ("ANDI R0", I,ALU ,2,2), -- 44 And, Immediate
    ("ANDI R1", I,ALU ,2,2), -- 45 And, Immediate
    ("ANDI R2", I,ALU ,2,2), -- 46 And, Immediate
    ("ANDI R3", I,ALU ,2,2), -- 47 And, Immediate
    ("ANDR R0", R,ALU ,2,3), -- 48 And, Relative
    ("ANDR R1", R,ALU ,2,3), -- 49 And, Relative
    ("ANDR R2", R,ALU ,2,3), -- 4A And, Relative
    ("ANDR R3", R,ALU ,2,3), -- 4B And, Relative
    ("ANDA R0", A,ALU ,3,4), -- 4C And, Absolute
    ("ANDA R1", A,ALU ,3,4), -- 4D And, Absolute
    ("ANDA R2", A,ALU ,3,4), -- 4E And, Absolute
    ("ANDA R3", A,ALU ,3,4), -- 4F And, Absolute
    ("RRR  R0", Z,ROT ,1,2), -- 50 Rotate Register Right
    ("RRR  R1", Z,ROT ,1,2), -- 51 Rotate Register Right
    ("RRR  R2", Z,ROT ,1,2), -- 52 Rotate Register Right
    ("RRR  R3", Z,ROT ,1,2), -- 53 Rotate Register Right
    ("REDE R0", I,IO  ,2,3), -- 54 Read Extended
    ("REDE R1", I,IO  ,2,3), -- 55 Read Extended
    ("REDE R2", I,IO  ,2,3), -- 56 Read Extended
    ("REDE R3", I,IO  ,2,3), -- 57 Read Extended
    ("BRNR R0", R,BRN ,2,3), -- 58 Branch on Register non-zero, Relative
    ("BRNR R1", R,BRN ,2,3), -- 59 Branch on Register non-zero, Relative
    ("BRNR R2", R,BRN ,2,3), -- 5A Branch on Register non-zero, Relative
    ("BRNR R3", R,BRN ,2,3), -- 5B Branch on Register non-zero, Relative
    ("BRNA R0", B,BRN ,3,3), -- 5C Branch on Register non-zero, Absolute
    ("BRNA R1", B,BRN ,3,3), -- 5D Branch on Register non-zero, Absolute
    ("BRNA R2", B,BRN ,3,3), -- 5E Branch on Register non-zero, Absolute
    ("BRNA R3", B,BRN ,3,3), -- 5F Branch on Register non-zero, Absolute
    ("IORZ R0", Z,ALU ,1,2), -- 60 Or, Register Zero (1 cycle -B)
    ("IORZ R1", Z,ALU ,1,2), -- 61 Or, Register Zero (1 cycle -B)
    ("IORZ R2", Z,ALU ,1,2), -- 62 Or, Register Zero (1 cycle -B)
    ("IORZ R3", Z,ALU ,1,2), -- 63 Or, Register Zero (1 cycle -B)
    ("IORI R0", I,ALU ,2,2), -- 64 Or, Immediate
    ("IORI R1", I,ALU ,2,2), -- 65 Or, Immediate
    ("IORI R2", I,ALU ,2,2), -- 66 Or, Immediate
    ("IORI R3", I,ALU ,2,2), -- 67 Or, Immediate
    ("IORR R0", R,ALU ,2,3), -- 68 Or, Relative
    ("IORR R1", R,ALU ,2,3), -- 69 Or, Relative
    ("IORR R2", R,ALU ,2,3), -- 6A Or, Relative
    ("IORR R3", R,ALU ,2,3), -- 6B Or, Relative
    ("IORA R0", A,ALU ,3,4), -- 6C Or, Absolute
    ("IORA R1", A,ALU ,3,4), -- 6D Or, Absolute
    ("IORA R2", A,ALU ,3,4), -- 6E Or, Absolute
    ("IORA R3", A,ALU ,3,4), -- 6F Or, Absolute
    ("REDD R0", Z,IO  ,1,2), -- 70 Read Data
    ("REDD R1", Z,IO  ,1,2), -- 71 Read Data
    ("REDD R2", Z,IO  ,1,2), -- 72 Read Data
    ("REDD R3", Z,IO  ,1,2), -- 73 Read Data
    ("CPSU   ",EI,CPPS,2,3), -- 74 Clear program status Upper, Masked
    ("CPSL   ",EI,CPPS,2,3), -- 75 Clear program status Lower, Masked
    ("PPSU   ",EI,CPPS,2,3), -- 76 Preset program status Upper, Masked
    ("PPSL   ",EI,CPPS,2,3), -- 77 Preset program status Lower, Masked
    ("BSNR R0", R,BSN ,2,3), -- 78 Branch to sub on non-zero reg, Relative
    ("BSNR R1", R,BSN ,2,3), -- 79 Branch to sub on non-zero reg, Relative
    ("BSNR R2", R,BSN ,2,3), -- 7A Branch to sub on non-zero reg, Relative
    ("BSNR R3", R,BSN ,2,3), -- 7B Branch to sub on non-zero reg, Relative
    ("BSNA R0", B,BSN ,3,3), -- 7C Branch to sub on non-zero reg, Absolute
    ("BSNA R1", B,BSN ,3,3), -- 7D Branch to sub on non-zero reg, Absolute
    ("BSNA R2", B,BSN ,3,3), -- 7E Branch to sub on non-zero reg, Absolute
    ("BSNA R3", B,BSN ,3,3), -- 7F Branch to sub on non-zero reg, Absolute
    ("ADDZ R0", Z,ALU ,1,2), -- 80 Add, Register Zero (1 cycle -B)
    ("ADDZ R1", Z,ALU ,1,2), -- 81 Add, Register Zero (1 cycle -B)
    ("ADDZ R2", Z,ALU ,1,2), -- 82 Add, Register Zero (1 cycle -B)
    ("ADDZ R3", Z,ALU ,1,2), -- 83 Add, Register Zero (1 cycle -B)
    ("ADDI R0", I,ALU ,2,2), -- 84 Add, Immediate
    ("ADDI R1", I,ALU ,2,2), -- 85 Add, Immediate
    ("ADDI R2", I,ALU ,2,2), -- 86 Add, Immediate
    ("ADDI R3", I,ALU ,2,2), -- 87 Add, Immediate
    ("ADDR R0", R,ALU ,2,3), -- 88 Add, Relative
    ("ADDR R1", R,ALU ,2,3), -- 89 Add, Relative
    ("ADDR R2", R,ALU ,2,3), -- 8A Add, Relative
    ("ADDR R3", R,ALU ,2,3), -- 8B Add, Relative
    ("ADDA R0", A,ALU ,3,4), -- 8C Add, Absolute
    ("ADDA R1", A,ALU ,3,4), -- 8D Add, Absolute
    ("ADDA R2", A,ALU ,3,4), -- 8E Add, Absolute
    ("ADDA R3", A,ALU ,3,4), -- 8F Add, Absolute
    ("INVALID", E,LPS ,1,2), -- 90 <Invalid>
    ("INVALID", E,LPS ,1,2), -- 91 <Invalid>
    ("LPSU   ", E,LPS ,1,2), -- 92 Load program status, upper
    ("LPSL   ", E,LPS ,1,2), -- 93 Load program status, lower
    ("DAR  R0", Z,DAR ,1,3), -- 94 Decimal Adjust Register
    ("DAR  R1", Z,DAR ,1,3), -- 95 Decimal Adjust Register
    ("DAR  R2", Z,DAR ,1,3), -- 96 Decimal Adjust Register
    ("DAR  R3", Z,DAR ,1,3), -- 97 Decimal Adjust Register
    ("BCFR  =", R,BCTF,2,3), -- 98 Branch on Condition False, Relative
    ("BCFR  >", R,BCTF,2,3), -- 99 Branch on Condition False, Relative
    ("BCFR  <", R,BCTF,2,3), -- 9A Branch on Condition False, Relative
    ("ZBRR   ",ER,ZBRR,2,3), -- 9B Zero Branch, Relative, unconditional
    ("BCFA  =", B,BCTF,3,3), -- 9C Branch on Condition False, Absolute
    ("BCFA  >", B,BCTF,3,3), -- 9D Branch on Condition False, Absolute
    ("BCFA  <", B,BCTF,3,3), -- 9E Branch on Condition False, Absolute
    ("BXA  R3",EB,BXA ,3,3), -- 9F Branch indexed absolute, unconditional
    ("SUBZ R0", Z,ALU ,1,2), -- A0 Subtract, Register Zero (1 cycle -B)
    ("SUBZ R1", Z,ALU ,1,2), -- A1 Subtract, Register Zero (1 cycle -B)
    ("SUBZ R2", Z,ALU ,1,2), -- A2 Subtract, Register Zero (1 cycle -B)
    ("SUBZ R3", Z,ALU ,1,2), -- A3 Subtract, Register Zero (1 cycle -B)
    ("SUBI R0", I,ALU ,2,2), -- A4 Subtract, Immediate
    ("SUBI R1", I,ALU ,2,2), -- A5 Subtract, Immediate
    ("SUBI R2", I,ALU ,2,2), -- A6 Subtract, Immediate
    ("SUBI R3", I,ALU ,2,2), -- A7 Subtract, Immediate
    ("SUBR R0", R,ALU ,2,3), -- A8 Subtract, Relative
    ("SUBR R1", R,ALU ,2,3), -- A9 Subtract, Relative
    ("SUBR R2", R,ALU ,2,3), -- AA Subtract, Relative
    ("SUBR R3", R,ALU ,2,3), -- AB Subtract, Relative
    ("SUBA R0", A,ALU ,3,4), -- AC Subtract, Absolute
    ("SUBA R1", A,ALU ,3,4), -- AD Subtract, Absolute
    ("SUBA R2", A,ALU ,3,4), -- AE Subtract, Absolute
    ("SUBA R3", A,ALU ,3,4), -- AF Subtract, Absolute
    ("WRTC R0", Z,IO  ,1,2), -- B0 Write Control
    ("WRTC R1", Z,IO  ,1,2), -- B1 Write Control
    ("WRTC R2", Z,IO  ,1,2), -- B2 Write Control
    ("WRTC R3", Z,IO  ,1,2), -- B3 Write Control
    ("TPSU   ",EI,TPS ,2,3), -- B4 Test Program Status Upper, Masked
    ("TPSL   ",EI,TPS ,2,3), -- B5 Test Program Status Lower, Masked
    ("INVALID",EI,TPS ,2,3), -- B6 <Invalid>
    ("INVALID",EI,TPS ,2,3), -- B7 <Invalid>
    ("BSFR  0", R,BSTF,2,3), -- B8 Branch to Sub on Condition false, Relative
    ("BSFR  1", R,BSTF,2,3), -- B9 Branch to Sub on Condition false, Relative
    ("BSFR  2", R,BSTF,2,3), -- BA Branch to Sub on Condition false, Relative
    ("ZBSR   ",ER,ZBSR,2,3), -- BB Zero branch to sub relative unconditional
    ("BSFA  0", B,BSTF,3,3), -- BC Branch to Sub on Condition false, Absolute
    ("BSFA  1", B,BSTF,3,3), -- BD Branch to Sub on Condition false, Absolute
    ("BSFA  2", B,BSTF,3,3), -- BE Branch to Sub on Condition false, Absolute
    ("BSXA   ",EB,BSXA,3,3), -- BF Branch to Sub indexed absolute unconditional
    ("NOP    ", Z,STR ,1,2), -- C0 No Operation
    ("STRZ R1", Z,STR ,1,2), -- C1 Store, Register Zero (1 cycle -B)
    ("STRZ R2", Z,STR ,1,2), -- C2 Store, Register Zero (1 cycle -B)
    ("STRZ R3", Z,STR ,1,2), -- C3 Store, Register Zero (1 cycle -B)
    ("INVALID", I,STR ,2,2), -- C4 <Invalid>
    ("INVALID", I,STR ,2,2), -- C5 <Invalid>
    ("INVALID", I,STR ,2,2), -- C6 <Invalid>
    ("INVALID", I,STR ,2,2), -- C7 <Invalid>
    ("STRR R0", R,STR ,2,3), -- C8 Store, Relative
    ("STRR R1", R,STR ,2,3), -- C9 Store, Relative
    ("STRR R2", R,STR ,2,3), -- CA Store, Relative
    ("STRR R3", R,STR ,2,3), -- CB Store, Relative
    ("STRA R0", A,STR ,3,4), -- CC Store, Absolute
    ("STRA R1", A,STR ,3,4), -- CD Store, Absolute
    ("STRA R2", A,STR ,3,4), -- CE Store, Absolute
    ("STRA R3", A,STR ,3,4), -- CF Store, Absolute
    ("RRL  R0", Z,ROT ,1,2), -- D0 Rotate Register Left
    ("RRL  R1", Z,ROT ,1,2), -- D1 Rotate Register Left
    ("RRL  R2", Z,ROT ,1,2), -- D2 Rotate Register Left
    ("RRL  R3", Z,ROT ,1,2), -- D3 Rotate Register Left
    ("WRTE R0", I,IO  ,2,3), -- D4 Write Extended
    ("WRTE R1", I,IO  ,2,3), -- D5 Write Extended
    ("WRTE R2", I,IO  ,2,3), -- D6 Write Extended
    ("WRTE R3", I,IO  ,2,3), -- D7 Write Extended
    ("BIRR R0", R,BIDR,2,3), -- D8 Branch on Incrementing Register, Relative
    ("BIRR R1", R,BIDR,2,3), -- D9 Branch on Incrementing Register, Relative
    ("BIRR R2", R,BIDR,2,3), -- DA Branch on Incrementing Register, Relative
    ("BIRR R3", R,BIDR,2,3), -- DB Branch on Incrementing Register, Relative
    ("BIRA R0", B,BIDR,3,3), -- DC Branch on Incrementing Register, Absolute
    ("BIRA R1", B,BIDR,3,3), -- DD Branch on Incrementing Register, Absolute
    ("BIRA R2", B,BIDR,3,3), -- DE Branch on Incrementing Register, Absolute
    ("BIRA R3", B,BIDR,3,3), -- DF Branch on Incrementing Register, Absolute
    ("COMZ R0", Z,ALU ,1,2), -- E0 Compare, Register Zero (1 cycle -B)
    ("COMZ R1", Z,ALU ,1,2), -- E1 Compare, Register Zero (1 cycle -B)
    ("COMZ R2", Z,ALU ,1,2), -- E2 Compare, Register Zero (1 cycle -B)
    ("COMZ R3", Z,ALU ,1,2), -- E3 Compare, Register Zero (1 cycle -B)
    ("COMI R0", I,ALU ,2,2), -- E4 Compare, Immediate
    ("COMI R1", I,ALU ,2,2), -- E5 Compare, Immediate
    ("COMI R2", I,ALU ,2,2), -- E6 Compare, Immediate
    ("COMI R3", I,ALU ,2,2), -- E7 Compare, Immediate
    ("COMR R0", R,ALU ,2,3), -- E8 Compare, Relative
    ("COMR R1", R,ALU ,2,3), -- E9 Compare, Relative
    ("COMR R2", R,ALU ,2,3), -- EA Compare, Relative
    ("COMR R3", R,ALU ,2,3), -- EB Compare, Relative
    ("COMA R0", A,ALU ,3,4), -- EC Compare, Absolute
    ("COMA R1", A,ALU ,3,4), -- ED Compare, Absolute
    ("COMA R2", A,ALU ,3,4), -- EE Compare, Absolute
    ("COMA R3", A,ALU ,3,4), -- EF Compare, Absolute
    ("WRTD R0", Z,IO  ,1,2), -- F0 Write Data
    ("WRTD R1", Z,IO  ,1,2), -- F1 Write Data
    ("WRTD R2", Z,IO  ,1,2), -- F2 Write Data
    ("WRTD R3", Z,IO  ,1,2), -- F3 Write Data
    ("TMI  R0", I,TMI ,2,3), -- F4 Test Under Mask, Immediate
    ("TMI  R1", I,TMI ,2,3), -- F5 Test Under Mask, Immediate
    ("TMI  R2", I,TMI ,2,3), -- F6 Test Under Mask, Immediate
    ("TMI  R3", I,TMI ,2,3), -- F7 Test Under Mask, Immediate
    ("BDRR R0", R,BIDR,2,3), -- F8 Branch on Decrementing Register, Relative
    ("BDRR R1", R,BIDR,2,3), -- F9 Branch on Decrementing Register, Relative
    ("BDRR R2", R,BIDR,2,3), -- FA Branch on Decrementing Register, Relative
    ("BDRR R3", R,BIDR,2,3), -- FB Branch on Decrementing Register, Relative
    ("BDRA R0", B,BIDR,3,3), -- FC Branch on Decrementing Register, Absolute
    ("BDRA R1", B,BIDR,3,3), -- FD Branch on Decrementing Register, Absolute
    ("BDRA R2", B,BIDR,3,3), -- FE Branch on Decrementing Register, Absolute
    ("BDRA R3", B,BIDR,3,3)  -- FF Branch on Decrementing Register, Absolute
    );

  ------------------------------------------------      

  FUNCTION sign(v : uv8) RETURN unsigned;

  -- LOAD : 00   EOR  : 20   AND  : 40   OR   : 60
  -- ADD  : 80   SUB  : A0   STORE: C0   CMP  : EO   
  PROCEDURE op_alu(
    op   : IN  uv8;     -- opcode
    vi1  : IN  uv8;     -- Register
    vi2  : IN  uv8;     -- Parameter, reg. zero
    psli : IN  uv8;     -- Program status In
    vo   : OUT uv8;     -- Register out
    pslo : OUT uv8);    -- Program Status Out
  
  ------------------------------------------------
  PROCEDURE op_dar(
    vi   : IN  uv8;
    vo   : OUT uv8;
    psli : IN  uv8;
    pslo : OUT uv8);
  
  ------------------------------------------------
  -- RRR = 50 RRL=D0
  PROCEDURE op_rotate(
    op   : IN  uv8;
    vi   : IN  uv8;
    vo   : OUT uv8;
    psli : IN  uv8;
    pslo : OUT uv8);
  
  ------------------------------------------------
  PROCEDURE op_tmi(
    vi1  : IN  uv8;
    vi2  : IN  uv8;
    psli : IN  uv8;
    pslo : OUT uv8);
      
  ----------------------------

END PACKAGE;

--##############################################################################
PACKAGE BODY sgs2650_pack IS

  FUNCTION sign(v : uv8) RETURN unsigned IS
  BEGIN
    IF v=x"00" THEN
      RETURN "00";
    ELSIF v(7)='0' THEN
      RETURN "01";
    ELSE
      RETURN "10";
    END IF;
  END FUNCTION;

  -- LOAD : 00   EOR  : 20   AND  : 40   OR   : 60
  -- ADD  : 80   SUB  : A0   STORE: C0   CMP  : EO   
  PROCEDURE op_alu(
    op   : IN  uv8;     -- opcode
    vi1  : IN  uv8;     -- Register
    vi2  : IN  uv8;     -- Parameter, reg. zero
    psli : IN  uv8;     -- Program status In
    vo   : OUT uv8;     -- Register out
    pslo : OUT uv8) IS  -- Program Status Out
    VARIABLE vt : uv8; -- Temporary result
    ALIAS psli_c   : std_logic IS psli(0); -- Carry
    ALIAS psli_com : std_logic IS psli(1); -- Compare logical / arithmetic
    ALIAS psli_ovf : std_logic IS psli(2); -- Overflow
    ALIAS psli_wc  : std_logic IS psli(3); -- With Carry
    ALIAS psli_idc : std_logic IS psli(5); -- Inter-Digit Carry
    ALIAS psli_cc  : uv2       IS psli(7 DOWNTO 6); -- Condition Code
    ALIAS pslo_c   : std_logic IS pslo(0); -- Carry
    ALIAS pslo_com : std_logic IS pslo(1); -- Compare logical=1 / arithmetic=0
    ALIAS pslo_ovf : std_logic IS pslo(2); -- Overflow
    ALIAS pslo_wc  : std_logic IS pslo(3); -- With Carry
    ALIAS pslo_idc : std_logic IS pslo(5); -- Inter-Digit Carry
    ALIAS pslo_cc  : uv2       IS pslo(7 DOWNTO 6); -- Condition Code
    
  BEGIN
    pslo:=psli;
    vt:=vi1;
    vo:=vt;
    
    CASE op(7 DOWNTO 5) IS
      WHEN "000" => -- LOAD
        vt:=vi2;
        vo:=vt;
        
      WHEN "001" => -- EOR
        vt:=vi1 XOR vi2;
        vo:=vt;
        
      WHEN "010" => -- AND
        vt:=vi1 AND vi2;
        vo:=vt;
        
      WHEN "011" => -- OR
        vt:=vi1 OR vi2;
        vo:=vt;
        
      WHEN "100" => -- ADD
        vt:=vi1 + vi2 + ("0000000" & (psli_c AND psli_wc));
        vo:=vt;
        pslo_c  :=(vi1(7) AND vi2(7)) OR (NOT vt(7) AND (vi1(7) OR vi2(7)));
        pslo_ovf:=(vi1(7) AND vi2(7) AND NOT vt(7)) OR
                   (NOT vi1(7) AND NOT vi2(7) AND vt(7));
        pslo_idc:=to_std_logic(vt(3 DOWNTO 0)<vi1(3 DOWNTO 0));
        
      WHEN "101" => -- SUB
        vt:=vi1 - vi2 - ("0000000" & (NOT psli_c AND psli_wc));
        vo:=vt;
        pslo_c  :=NOT ((NOT vi1(7) AND vi2(7)) OR (vt(7) AND (NOT vi1(7) OR vi2(7))));
        pslo_ovf:=(vi1(7) AND NOT vi2(7) AND NOT vt(7)) OR
                   (NOT vi1(7) AND vi2(7) AND vt(7));
        pslo_idc:=to_std_logic(vt(3 DOWNTO 0)<=vi1(3 DOWNTO 0));
        
      WHEN "110" => -- STORE
        vt:=vi2;
        vo:=vt;
        
      WHEN OTHERS => -- COM
        vt:=vi1 - vi2;
        vo:=vi1;
        
        IF vt=x"00" THEN  -- =
          pslo_cc:="00";
        ELSIF psli_com='1' AND -- Unsigned <
          ((vi1(7)='0' AND vi2(7)='1') OR
             (vt(7)='1' AND NOT (vi1(7)='1' AND vi2(7)='0'))) THEN
          pslo_cc:="10";
        ELSIF psli_com='0' AND -- Signed <
           ((vi1(7)='1' AND vi2(7)='0') OR
            (vi1(7)='0' AND vi2(7)='0' AND vt(7)='1') OR
            (vi1(7)='1' AND vi2(7)='1' AND vt(7)='0')) THEN -- Signed <
          pslo_cc:="10";
        ELSE -- >
          pslo_cc:="01";
        END IF;
        
    END CASE;

    IF op(7 DOWNTO 5)/="111" THEN
      pslo_cc:=sign(vt);
    END IF;
    
  END PROCEDURE op_alu;

  ------------------------------------------------
  PROCEDURE op_dar(
    vi   : IN  uv8;
    vo   : OUT uv8;
    psli : IN  uv8;
    pslo : OUT uv8) IS
    VARIABLE vt : uv8;
    ALIAS psli_c   : std_logic IS psli(0); -- Carry
    ALIAS psli_com : std_logic IS psli(1); -- Compare logical / arithmetic
    ALIAS psli_ovf : std_logic IS psli(2); -- Overflow
    ALIAS psli_wc  : std_logic IS psli(3); -- With Carry
    ALIAS psli_idc : std_logic IS psli(5); -- Inter-Digit Carry
    ALIAS psli_cc  : uv2       IS psli(7 DOWNTO 6); -- Condition Code
    ALIAS pslo_c   : std_logic IS pslo(0); -- Carry
    ALIAS pslo_com : std_logic IS pslo(1); -- Compare logical=1 / arithmetic=0
    ALIAS pslo_ovf : std_logic IS pslo(2); -- Overflow
    ALIAS pslo_wc  : std_logic IS pslo(3); -- With Carry
    ALIAS pslo_idc : std_logic IS pslo(5); -- Inter-Digit Carry
    ALIAS pslo_cc  : uv2       IS pslo(7 DOWNTO 6); -- Condition Code
  BEGIN
    pslo:=psli;
    vt:=vi;
    IF psli_c='0' THEN
      vt:=vt+x"A0";
    END IF;
    IF psli_idc='0' THEN
      vt:=vt(7 DOWNTO 4) & (vt(3 DOWNTO 0)+x"A");
    END IF;
    pslo_cc:=sign(vt);
    vo:=vt;
    
  END PROCEDURE op_dar;
    
  ------------------------------------------------
  -- RRR = 50 RRL=D0
  PROCEDURE op_rotate(
    op   : IN  uv8;
    vi   : IN  uv8;
    vo   : OUT uv8;
    psli : IN  uv8;
    pslo : OUT uv8) IS
    VARIABLE vt : uv8;
    ALIAS psli_c   : std_logic IS psli(0); -- Carry
    ALIAS psli_wc  : std_logic IS psli(3); -- With Carry
    ALIAS pslo_c   : std_logic IS pslo(0); -- Carry
    ALIAS pslo_idc : std_logic IS pslo(5); -- Inter-Digit Carry
    ALIAS pslo_cc  : uv2       IS pslo(7 DOWNTO 6); -- Condition Code
   BEGIN
    pslo:=psli;
    IF op(7)='1' THEN
      IF psli_wc='1' THEN
        vt:=vi(6 DOWNTO 0) & psli_c;
        pslo_c:=vi(7);
        pslo_idc:=vi(4);
      ELSE
        vt:=vi(6 DOWNTO 0) & vi(7);
      END IF;
    ELSE
      IF psli_wc='1' THEN
        vt:=psli_c & vi(7 DOWNTO 1);
        pslo_c:=vi(0);
        pslo_idc:=vi(6);
      ELSE
        vt:=vi(0) & vi(7 DOWNTO 1);
      END IF;
    END IF;
    pslo_cc:=sign(vt);
    vo:=vt;
    
  END PROCEDURE op_rotate;
  
  ------------------------------------------------
  PROCEDURE op_tmi(
    vi1  : IN uv8;
    vi2  : IN uv8;
    psli : IN uv8;
    pslo : OUT uv8) IS
  BEGIN
    pslo:=psli;
    IF (vi1 AND vi2)=vi2 THEN
      pslo(7 DOWNTO 6):="00";
    ELSE
      pslo(7 DOWNTO 6):="10";
    END IF;
  END PROCEDURE op_tmi;
      
  ------------------------------------------------
  
END PACKAGE BODY sgs2650_pack;



