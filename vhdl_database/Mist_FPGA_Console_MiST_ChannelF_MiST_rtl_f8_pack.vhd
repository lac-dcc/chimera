--------------------------------------------------------------------------------
-- Fairchild F8 CPU
--------------------------------------------------------------------------------
-- DO 8/2020
--------------------------------------------------------------------------------
-- With help from MAME F8 model

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.base_pack.ALL;

PACKAGE f8_pack IS

  TYPE type_rom IS ARRAY(0 TO 1023) OF uv8;

  --------------------------------------
  FUNCTION test_bf(op    : uv4;
                   iozcs : uv5) RETURN boolean;
  FUNCTION test_bt(op    : uv3;
                   iozcs : uv5) RETURN boolean;

  TYPE enum_len IS (S,L);
  TYPE enum_int IS (I0,IX,IY);
  TYPE enum_op IS (
    OP_NOP,OP_MOV,
    OP_ADD,OP_ADDD,OP_AND,OP_OR ,OP_XOR,OP_CMP,
    OP_SR1,OP_SL1,OP_SR4, OP_SL4,
    OP_COM,OP_LNK,OP_EDI,
    OP_INC,OP_DEC,OP_LIS,OP_TST8,OP_TST9);

  PROCEDURE aluop(op : IN enum_op; -- ALU operation
                  code : IN uv8;   -- OPCODE
                  src1 : IN uv8;   -- Source Reg 1
                  src2 : IN uv8;   -- Source Reg 2
                  iozcs_i : IN uv5; -- Flags before
                  dst  : OUT uv8; -- Result
                  dstm : OUT std_logic; -- Modified result reg
                  iozcs_o : OUT uv5; -- Flags after
                  test : OUT std_logic); -- Contitional branch test result

  --------------------------------------
  CONSTANT R0     : uint5 := 0;
  CONSTANT R1     : uint5 := 1;
  CONSTANT R2     : uint5 := 2;
  CONSTANT R3     : uint5 := 3;
  CONSTANT R4     : uint5 := 4;
  CONSTANT R5     : uint5 := 5;
  CONSTANT R6     : uint5 := 6;
  CONSTANT R7     : uint5 := 7;
  CONSTANT R8     : uint5 := 8;
  CONSTANT R9     : uint5 := 9;
  CONSTANT R10    : uint5 := 10;
  CONSTANT R11    : uint5 := 11;
  CONSTANT R12    : uint5 := 12;
  CONSTANT R13    : uint5 := 13;
  CONSTANT R14    : uint5 := 14;
  CONSTANT R15    : uint5 := 15;

  CONSTANT RACC   : uint5 := 16;

  CONSTANT WREG   : uint5 := 17;
  CONSTANT ISARU  : uint5 := 18;
  CONSTANT ISARL  : uint5 := 19;
  CONSTANT ISAR   : uint5 := 20;

  CONSTANT RISAR  : uint5 := 21;
  CONSTANT RISARP : uint5 := 22;
  CONSTANT RISARM : uint5 := 23;

  CONSTANT PORT0  : uint5 := 24;
  CONSTANT PORT1  : uint5 := 25;

  CONSTANT DATA   : uint5 := 31;

  TYPE type_microcode IS RECORD
    romc : uv5;
    len  : enum_len;
    last : uint1;
    int  : enum_int;
    op   : enum_op;
    rd   : uint5;
    rs   : uint5;
  END RECORD;
  TYPE arr_microcode IS ARRAY(natural RANGE <>) OF type_microcode;

  CONSTANT OP_RESET     : uv8 := x"2F";
  CONSTANT OP_INTERRUPT : uv8 := x"2E";

  CONSTANT ROMC_00 : uv5 :="00000";
  CONSTANT ROMC_01 : uv5 :="00001";
  CONSTANT ROMC_02 : uv5 :="00010";
  CONSTANT ROMC_03 : uv5 :="00011"; -- or 01 for cond. branches
  CONSTANT ROMC_04 : uv5 :="00100";
  CONSTANT ROMC_05 : uv5 :="00101";
  CONSTANT ROMC_06 : uv5 :="00110";
  CONSTANT ROMC_07 : uv5 :="00111";
  CONSTANT ROMC_08 : uv5 :="01000";
  CONSTANT ROMC_09 : uv5 :="01001";
  CONSTANT ROMC_0A : uv5 :="01010";
  CONSTANT ROMC_0B : uv5 :="01011";
  CONSTANT ROMC_0C : uv5 :="01100";
  CONSTANT ROMC_0D : uv5 :="01101";
  CONSTANT ROMC_0E : uv5 :="01110";
  CONSTANT ROMC_0F : uv5 :="01111";
  CONSTANT ROMC_10 : uv5 :="10000";
  CONSTANT ROMC_11 : uv5 :="10001";
  CONSTANT ROMC_12 : uv5 :="10010";
  CONSTANT ROMC_13 : uv5 :="10011";
  CONSTANT ROMC_14 : uv5 :="10100";
  CONSTANT ROMC_15 : uv5 :="10101";
  CONSTANT ROMC_16 : uv5 :="10110";
  CONSTANT ROMC_17 : uv5 :="10111";
  CONSTANT ROMC_18 : uv5 :="11000";
  CONSTANT ROMC_19 : uv5 :="11001";
  CONSTANT ROMC_1A : uv5 :="11010";
  CONSTANT ROMC_1B : uv5 :="11011";
  CONSTANT ROMC_1C : uv5 :="11100";
  CONSTANT ROMC_1D : uv5 :="11101";
  CONSTANT ROMC_1E : uv5 :="11110";
  CONSTANT ROMC_1F : uv5 :="11111";

  CONSTANT ZZ : type_microcode := (ROMC_00,S,1,I0,OP_NOP,RACC,RACC);

  -- ROMC / cycles / op / rdest / rsrc
  CONSTANT MICROCODE : arr_microcode(0 TO 256*8-1) := (
    -- ROMC CYC LAST INT ALUOP RDEST RSRC
    --  6    2   1    2   4     5     5
    (ROMC_00,S,1,I0,OP_MOV,RACC,R12),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 00 : A <= r12              : LR A,KU : Load r12
    (ROMC_00,S,1,I0,OP_MOV,RACC,R13),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 01 : A <= r13              : LR A,KL : Load r13
    (ROMC_00,S,1,I0,OP_MOV,RACC,R14),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 02 : A <= r14              : LR A,QU : Load r14
    (ROMC_00,S,1,I0,OP_MOV,RACC,R15),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 03 : A <= r15              : LR A,QL : Load r15
    (ROMC_00,S,1,I0,OP_MOV,R12,RACC),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 04 : r12 <= A              : LR KU,A : Store r12
    (ROMC_00,S,1,I0,OP_MOV,R13,RACC),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 05 : r13 <= A              : LR KL,A : Store r13
    (ROMC_00,S,1,I0,OP_MOV,R14,RACC),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 06 : r14 <= A              : LR QU,A : Store r14
    (ROMC_00,S,1,I0,OP_MOV,R15,RACC),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 07 : r15 <= A              : LR QL,A : Store r15
    (ROMC_07,L,0,I0,OP_MOV,R12,DATA),                               -- 08 : r12 <= data <= PC1U   : LR K,P  : Store stack reg.
    (ROMC_0B,L,0,I0,OP_MOV,R13,DATA),                               --      r13 <= data <= PC1L
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_15,L,0,I0,OP_MOV,DATA,R12),                               -- 09 : PC1U <= data <= r12   : LR P,K  : Load stack reg.
    (ROMC_18,L,0,I0,OP_MOV,DATA,R13),                               --      PC1L <= data <= r13
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_00,S,1,I0,OP_MOV,RACC,ISAR), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 0A : ACC <= ISAR           : LR A,IS : Store ISAR
    (ROMC_00,S,1,I0,OP_MOV,ISAR,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 0B : ISAR <= ACC           : LR IS,A : Load ISAR
    (ROMC_12,L,0,I0,OP_MOV,DATA,R13),                               -- 0C : PC1 <= PC0 PC0L <= data <= R13  : PK      : Call subroutine
    (ROMC_14,L,0,I0,OP_MOV,DATA,R12),                               --      PC0U <= data <= R12
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_17,L,0,I0,OP_MOV,DATA,R15),                               -- 0D : PC0L <= data <= R15   : LR      : Load Program Counter
    (ROMC_14,L,0,I0,OP_MOV,DATA,R14),                               --      PC0U <= data <= R14
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_06,L,0,I0,OP_MOV,R14,DATA),                               -- 0E : R14 <= data <= DC0U   : LR Q,DC : Store d count r14/15
    (ROMC_09,L,0,I0,OP_MOV,R15,DATA),                               --      R15 <= data <= DC0L
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_16,L,0,I0,OP_MOV,DATA,R14),                               -- 0F : DC0U <= data <= R14   : LR DC,Q : Load d count r14/15
    (ROMC_19,L,0,I0,OP_MOV,DATA,R15),                               --      DC0L <= data <= R15
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_16,L,0,I0,OP_MOV,DATA,R10),                               -- 10 : DC0U <= data <= R10   : LR DC,H : Load d count r10/11
    (ROMC_19,L,0,I0,OP_MOV,DATA,R11),                               --      DC0L <= data <= R11
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_06,L,0,I0,OP_MOV,R10,DATA),                               -- 11 : R10 <= data <= DC0U   : LR H,DC : Store d count r10/11
    (ROMC_09,L,0,I0,OP_MOV,R11,DATA),                               --      R11 <= data <= DC0L
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_00,S,1,I0,OP_SR1,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 12 : ACC <= ACC >> 1       : SR   1  : Shift right one
    (ROMC_00,S,1,I0,OP_SL1,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 13 : ACC <= ACC << 1       : SL   1  : Shift left one
    (ROMC_00,S,1,I0,OP_SR4,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 14 : ACC <= ACC >> 4       : SR   4  : Shift right four
    (ROMC_00,S,1,I0,OP_SL4,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 15 : ACC <= ACC << 4       : SL   4  : Shift left four
    (ROMC_02,L,0,I0,OP_MOV,RACC,DATA),                              -- 16 : ACC <= DATA <= [DC0]  : LM      : LOAD mem DC0
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_05,L,0,I0,OP_MOV,DATA,RACC),                              -- 17 : [DC] <= DATA <= ACC   : ST      : STORE  mem DC0
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_00,S,1,I0,OP_COM,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 18 : ACC <= !ACC           : COM     : Complement acc.
    (ROMC_00,S,1,I0,OP_LNK,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 19 : ACC <= ACC + carry    : LNK     : Add Carry acc.
    (ROMC_1C,S,0,IY,OP_EDI,RACC,RACC),                              -- 1A : Clear ICB             : DI      : Disable Interrupt
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_EDI,RACC,RACC),                              -- 1B : Set ICB               : EI      : Enable Interrupt
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_04,S,0,I0,OP_NOP,RACC,RACC),                              -- 1C : PC0 <= PC1            : POP     : Return from sub
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_MOV,WREG,R9),                                -- 1D : W <= R9 statusreg     : LR W,J  : Load Status reg r9
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_00,S,1,I0,OP_MOV,R9,WREG),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 1E : R9 <= W statusreg     : LR J,W  : Store Status reg r9
    (ROMC_00,S,1,I0,OP_INC,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 1F : ACC <= ACC + 1        : INC     : Increment
    (ROMC_03,L,0,I0,OP_MOV,RACC,DATA),                              -- 20 II : ACC <= IMM         : LI ii   : LOAD immediate acc.
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_AND,RACC,DATA),                              -- 21 II : ACC <= ACC & IMM   : NI   ii : AND immediate acc.
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_OR ,RACC,DATA),                              -- 22 II : ACC <= ACC | IMM   : OI   ii : OR  immediate acc.
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_XOR,RACC,DATA),                              -- 23 II : ACC <= ACC ^ IMM   : XI   ii : XOR immediate acc.
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_ADD,RACC,DATA),                              -- 24 II : ACC <= ACC + IMM   : AI   ii : ADD immediate acc.
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_CMP,RACC,DATA),                              -- 25 II : CMP (ACC,IMM)      : CI   ii : CMP immediate acc.
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_NOP,RACC,RACC),                              -- 26 II : (fetch operand)    : IN   aa : Input port aa
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --         ACC <= IOport[DB]
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_NOP,RACC,RACC),                              -- 27 II : (fetch operand)    : OUT  aa : Output port aa
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --         IOport[DB] <= ACC
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_MOV,RACC,DATA),                              -- 28 AAAA : ACC <= DATA (immediate)  : PI  aaaa : Call Subroutine
    (ROMC_0D,S,0,I0,OP_NOP,RACC,RACC),                              --           PC1 <= PC0 + 1
    (ROMC_0C,L,0,I0,OP_MOV,DATA,DATA),                              --           PC0L <= DATA (immediate)
    (ROMC_14,L,0,I0,OP_MOV,DATA,RACC),                              --           PC0U <= DATA <= ACC
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,
    (ROMC_03,L,0,I0,OP_MOV,RACC,DATA),                              -- 29 AAAA : ACC <= DATA (immediate)  : JMP aaaa : JUMP
    (ROMC_0C,L,0,I0,OP_MOV,DATA,DATA),                              --           PC0L <= DATA (immediate)
    (ROMC_14,L,0,I0,OP_MOV,DATA,RACC),                              --           PC0U <= DATA <= ACC
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,
    (ROMC_11,L,0,I0,OP_MOV,DATA,DATA),                              -- 2A AAAA : DC0U <= DATA (immediate)  : DCI aaaa : Load DC imm.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --           PC0 ++
    (ROMC_0E,L,0,I0,OP_MOV,DATA,DATA),                              --           DC0L <= DATA (immediate)
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --           PC0 ++
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,

    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 2B      : No Operation              : NOP

    (ROMC_1D,S,1,I0,OP_NOP,RACC,RACC),                              -- 2C      : DC0 <=> DC1               : XDC
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 2D      : Undefined ?               : NOP

    -- INTERRUPT (undef opcode) ---------------------------
    (ROMC_1C,L,0,I0,OP_NOP,RACC,RACC),                              -- 2E      :                           :
    (ROMC_0F,L,0,I0,OP_NOP,RACC,RACC),                              --           PC0L <= int vect low, PC1 <= PC0
    (ROMC_13,L,0,IY,OP_NOP,RACC,RACC),                              --           PC0U <= int vect high
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,

    -- RESET (undef opcode) -------------------------------
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- 2F      :
    (ROMC_08,L,0,IY,OP_NOP,RACC,RACC),                              --           PC0 <= 0 PC1 <= PC0
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_00,L,1,I0,OP_DEC,R0 ,R0 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 30 : R0 --                       : DS   R0    : Decrement  R0
    (ROMC_00,L,1,I0,OP_DEC,R1 ,R1 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 31 : R1 --                       : DS   R1    : Decrement  R1
    (ROMC_00,L,1,I0,OP_DEC,R2 ,R2 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 32 : R2 --                       : DS   R2    : Decrement  R2
    (ROMC_00,L,1,I0,OP_DEC,R3 ,R3 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 33 : R3 --                       : DS   R3    : Decrement  R3
    (ROMC_00,L,1,I0,OP_DEC,R4 ,R4 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 34 : R4 --                       : DS   R4    : Decrement  R4
    (ROMC_00,L,1,I0,OP_DEC,R5 ,R5 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 35 : R5 --                       : DS   R5    : Decrement  R5
    (ROMC_00,L,1,I0,OP_DEC,R6 ,R6 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 36 : R6 --                       : DS   R6    : Decrement  R6
    (ROMC_00,L,1,I0,OP_DEC,R7 ,R7 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 37 : R7 --                       : DS   R7    : Decrement  R7
    (ROMC_00,L,1,I0,OP_DEC,R8 ,R8 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 38 : R8 --                       : DS   R8    : Decrement  R8
    (ROMC_00,L,1,I0,OP_DEC,R9 ,R9 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 39 : R9 --                       : DS   R9    : Decrement  R9
    (ROMC_00,L,1,I0,OP_DEC,R10,R10),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 3A : R10--                       : DS   R10   : Decrement  R10
    (ROMC_00,L,1,I0,OP_DEC,R11,R11),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 3B : R11--                       : DS   R11   : Decrement  R11
    (ROMC_00,L,1,I0,OP_DEC,RISAR,RISAR),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 3C : (ISAR)--                    : DS (ISAR)  : Decrement  (ISAR)
    (ROMC_00,L,1,I0,OP_DEC,RISARP,RISARP), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 3D : (ISAR++)--                  : DS (ISAR+) : Decrement  (ISAR++)
    (ROMC_00,L,1,I0,OP_DEC,RISARM,RISARM), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 3E : (ISAR--)--                  : DS (ISAR-) : Decrement  (ISAR--)
    (ROMC_00,L,1,I0,OP_DEC,R15,R15),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,    -- 3F : R15-- <INVALID>             : DS   R15   : Decrement  R15

    (ROMC_00,S,1,I0,OP_MOV,RACC,R0 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 40 : ACC <= R0                   : LR A,R0      : LOAD    R0
    (ROMC_00,S,1,I0,OP_MOV,RACC,R1 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 41 : ACC <= R1                   : LR A,R1      : LOAD    R1
    (ROMC_00,S,1,I0,OP_MOV,RACC,R2 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 42 : ACC <= R2                   : LR A,R2      : LOAD    R2
    (ROMC_00,S,1,I0,OP_MOV,RACC,R3 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 43 : ACC <= R3                   : LR A,R3      : LOAD    R3
    (ROMC_00,S,1,I0,OP_MOV,RACC,R4 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 44 : ACC <= R4                   : LR A,R4      : LOAD    R4
    (ROMC_00,S,1,I0,OP_MOV,RACC,R5 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 45 : ACC <= R5                   : LR A,R5      : LOAD    R5
    (ROMC_00,S,1,I0,OP_MOV,RACC,R6 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 46 : ACC <= R6                   : LR A,R6      : LOAD    R6
    (ROMC_00,S,1,I0,OP_MOV,RACC,R7 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 47 : ACC <= R7                   : LR A,R7      : LOAD    R7
    (ROMC_00,S,1,I0,OP_MOV,RACC,R8 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 48 : ACC <= R8                   : LR A,R8      : LOAD    R8
    (ROMC_00,S,1,I0,OP_MOV,RACC,R9 ),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 49 : ACC <= R9                   : LR A,R9      : LOAD    R9
    (ROMC_00,S,1,I0,OP_MOV,RACC,R10),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 4A : ACC <= R10                  : LR A,R10     : LOAD    R10
    (ROMC_00,S,1,I0,OP_MOV,RACC,R11),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 4B : ACC <= R11                  : LR A,R11     : LOAD    R11
    (ROMC_00,S,1,I0,OP_MOV,RACC,RISAR),     ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 4C : ACC <= (ISAR)               : LR A,(ISAR)  : LOAD    (ISAR)
    (ROMC_00,S,1,I0,OP_MOV,RACC,RISARP),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 4D : ACC <= (ISAR++)             : LR A,(ISAR+) : LOAD    (ISAR++)
    (ROMC_00,S,1,I0,OP_MOV,RACC,RISARM),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 4E : ACC <= (ISAR--)             : LR A,(ISAR-) : LOAD    (ISAR--)
    (ROMC_00,S,1,I0,OP_MOV,RACC,R15),       ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,   -- 4F : ACC <= R15  <INVALID>       : LR A,R15     : LOAD    R15

    (ROMC_00,S,1,I0,OP_MOV,R0 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 50 : R0  <= ACC                  : LR R0 ,A     : STORE   R0
    (ROMC_00,S,1,I0,OP_MOV,R1 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 51 : R1  <= ACC                  : LR R1 ,A     : STORE   R1
    (ROMC_00,S,1,I0,OP_MOV,R2 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 52 : R2  <= ACC                  : LR R2 ,A     : STORE   R2
    (ROMC_00,S,1,I0,OP_MOV,R3 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 53 : R3  <= ACC                  : LR R3 ,A     : STORE   R3
    (ROMC_00,S,1,I0,OP_MOV,R4 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 54 : R4  <= ACC                  : LR R4 ,A     : STORE   R4
    (ROMC_00,S,1,I0,OP_MOV,R5 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 55 : R5  <= ACC                  : LR R5 ,A     : STORE   R5
    (ROMC_00,S,1,I0,OP_MOV,R6 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 56 : R6  <= ACC                  : LR R6 ,A     : STORE   R6
    (ROMC_00,S,1,I0,OP_MOV,R7 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 57 : R7  <= ACC                  : LR R7 ,A     : STORE   R7
    (ROMC_00,S,1,I0,OP_MOV,R8 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 58 : R8  <= ACC                  : LR R8 ,A     : STORE   R8
    (ROMC_00,S,1,I0,OP_MOV,R9 ,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 59 : R9  <= ACC                  : LR R9 ,A     : STORE   R9
    (ROMC_00,S,1,I0,OP_MOV,R10,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 5A : R10 <= ACC                  : LR R10,A     : STORE   R10
    (ROMC_00,S,1,I0,OP_MOV,R11,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 5B : R11 <= ACC                  : LR R11,A     : STORE   R11
    (ROMC_00,S,1,I0,OP_MOV,RISAR,RACC),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 5C : (ISAR) <= ACC               : LR (ISAR),A  : STORE   (ISAR)
    (ROMC_00,S,1,I0,OP_MOV,RISARP,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 5D : (ISAR++) <= ACC             : LR (ISAR+),A : STORE   (ISAR++)
    (ROMC_00,S,1,I0,OP_MOV,RISARM,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 5E : (ISAR--) <= ACC             : LR (ISAR-),A : STORE   (ISAR--)
    (ROMC_00,S,1,I0,OP_MOV,R15,RACC),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- 5F : R15 <= ACC  <INVALID>       : LR R15,A     : STORE   R15

    (ROMC_00,S,1,I0,OP_LIS,ISARU,R0), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 60 : ISARU <= 0                     : LISU 0    : Load ISAR upper
    (ROMC_00,S,1,I0,OP_LIS,ISARU,R1), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 61 : ISARU <= 1                     : LISU 1    : Load ISAR upper
    (ROMC_00,S,1,I0,OP_LIS,ISARU,R2), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 62 : ISARU <= 2                     : LISU 2    : Load ISAR upper
    (ROMC_00,S,1,I0,OP_LIS,ISARU,R3), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 63 : ISARU <= 3                     : LISU 3    : Load ISAR upper
    (ROMC_00,S,1,I0,OP_LIS,ISARU,R4), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 64 : ISARU <= 4                     : LISU 4    : Load ISAR upper
    (ROMC_00,S,1,I0,OP_LIS,ISARU,R5), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 65 : ISARU <= 5                     : LISU 5    : Load ISAR upper
    (ROMC_00,S,1,I0,OP_LIS,ISARU,R6), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 66 : ISARU <= 6                     : LISU 6    : Load ISAR upper
    (ROMC_00,S,1,I0,OP_LIS,ISARU,R7), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 67 : ISARU <= 7                     : LISU 7    : Load ISAR upper

    (ROMC_00,S,1,I0,OP_LIS,ISARL,R0), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 68 : ISARL <= 0                     : LISL 0    : Load ISAR lower
    (ROMC_00,S,1,I0,OP_LIS,ISARL,R1), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 69 : ISARL <= 1                     : LISL 1    : Load ISAR lower
    (ROMC_00,S,1,I0,OP_LIS,ISARL,R2), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 6A : ISARL <= 2                     : LISL 2    : Load ISAR lower
    (ROMC_00,S,1,I0,OP_LIS,ISARL,R3), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 6B : ISARL <= 3                     : LISL 3    : Load ISAR lower
    (ROMC_00,S,1,I0,OP_LIS,ISARL,R4), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 6C : ISARL <= 4                     : LISL 4    : Load ISAR lower
    (ROMC_00,S,1,I0,OP_LIS,ISARL,R5), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 6D : ISARL <= 5                     : LISL 5    : Load ISAR lower
    (ROMC_00,S,1,I0,OP_LIS,ISARL,R6), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 6E : ISARL <= 6                     : LISL 6    : Load ISAR lower
    (ROMC_00,S,1,I0,OP_LIS,ISARL,R7), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- 6F : ISARL <= 7                     : LISL 7    : Load ISAR lower

    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 70 : ACC <= 0                       : LIS 0     : Load ACC 0 / CLR ACC
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 71 : ACC <= 1                       : LIS 1     : Load ACC 1
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 72 : ACC <= 2                       : LIS 2     : Load ACC 2
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 73 : ACC <= 3                       : LIS 3     : Load ACC 3
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 74 : ACC <= 4                       : LIS 4     : Load ACC 4
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 75 : ACC <= 5                       : LIS 5     : Load ACC 5
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 76 : ACC <= 6                       : LIS 6     : Load ACC 6
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 77 : ACC <= 7                       : LIS 7     : Load ACC 7
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 78 : ACC <= 8                       : LIS 8     : Load ACC 8
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 79 : ACC <= 9                       : LIS 9     : Load ACC 9
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 7A : ACC <= 10                      : LIS 10    : Load ACC 10
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 7B : ACC <= 11                      : LIS 11    : Load ACC 11
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 7C : ACC <= 12                      : LIS 12    : Load ACC 12
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 7D : ACC <= 13                      : LIS 13    : Load ACC 13
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 7E : ACC <= 14                      : LIS 14    : Load ACC 14
    (ROMC_00,S,1,I0,OP_LIS,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,        -- 7F : ACC <= 15                      : LIS 15    : Load ACC 15

    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 80 : Test 0                         : Bcc  0    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 81 : Test 1                         : Bcc  1    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 82 : Test 2                         : Bcc  2    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 83 : Test 3                         : Bcc  3    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 84 : Test 4                         : Bcc  4    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 85 : Test 5                         : Bcc  5    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 86 : Test 6                         : Bcc  6    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST8,RACC,RACC),                             -- 87 : Test 7                         : Bcc  7    : Branch cond.
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_02,L,0,I0,OP_ADD,RACC,DATA),                              -- 88 : ACC = ACC + [DC0] , DC0++      : AM      : Add Binary mem
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_02,L,0,I0,OP_ADDD,RACC,DATA),                             -- 89 : ACC = ACC +D [DC0] , DC0++     : AMD     : Add Decimal mem
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_02,L,0,I0,OP_AND,RACC,DATA),                              -- 8A : ACC = ACC AND [DC0] , DC0++    : NM      : AND mem
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_02,L,0,I0,OP_OR ,RACC,DATA),                              -- 8B : ACC = ACC OR [DC0] , DC0++     : OM      : OR mem
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_02,L,0,I0,OP_XOR,RACC,DATA),                              -- 8C : ACC = ACC XOR [DC0] , DC0++    : XM      : XOR mem
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_02,L,0,I0,OP_CMP,RACC,DATA),                              -- 8D : CMP(ACC,[DC0])      , DC0++    : CM      : CMP mem
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_0A,L,0,I0,OP_MOV,DATA,RACC),                              -- 8E : DC = DC + ACC (signed)         : ADC     : Add Data counter
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              -- 8F aa : Test  ISARL, PC +2 or +imm  : BR7 aa  : Branch if ISARlo/=7
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 90 aa :                             :  BF 0   : Branch if negative
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 91 aa :                             :  BF 1   : Branch if no carry
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 92 aa :                             :  BF 2   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 93 aa :                             :  BF 3   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 94 aa :                             :  BF 4   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 95 aa :                             :  BF 5   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 96 aa :                             :  BF 6   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 97 aa :                             :  BF 7   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 98 aa :                             :  BF 8   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 99 aa :                             :  BF 9   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 9A aa :                             :  BF A   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 9B aa :                             :  BF B   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 9C aa :                             :  BF C   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 9D aa :                             :  BF D   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 9E aa :                             :  BF E   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_TST9,RACC,RACC),                             -- 9F aa :                             :  BF F   : Branch if
    (ROMC_03,S,0,I0,OP_NOP,RACC,RACC),                              --      Test, change PC0 + 2 or +imm
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_1C,S,0,I0,OP_MOV,RACC,PORT0),                             -- A0 : ACC <= IOPORT[0]               : INS  0  : Input port 0
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_MOV,RACC,PORT1),                             -- A1 : ACC <= IOPORT[1]               : INS  1  : Input port 1
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_1C,L,0,I0,OP_LIS,DATA,R2),                                -- A2 : DATA <= IOPPORTNUM             : INS  2  : Input port 2
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R3),                                -- A3 : DATA <= IOPPORTNUM             : INS  3  : Input port 3
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R4),                                -- A4 : DATA <= IOPPORTNUM             : INS  4  : Input port 4
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R5),                                -- A5 : DATA <= IOPPORTNUM             : INS  5  : Input port 5
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R6),                                -- A6 : DATA <= IOPPORTNUM             : INS  6  : Input port 6
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R7),                                -- A7 : DATA <= IOPPORTNUM             : INS  7  : Input port 7
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R8),                                -- A8 : DATA <= IOPPORTNUM             : INS  8  : Input port 8
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R9),                                -- A9 : DATA <= IOPPORTNUM             : INS  9  : Input port 9
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R10),                               -- AA : DATA <= IOPPORTNUM             : INS  10 : Input port 10
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R11),                               -- AB : DATA <= IOPPORTNUM             : INS  11 : Input port 11
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R12),                               -- AC : DATA <= IOPPORTNUM             : INS  12 : Input port 12
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R13),                               -- AD : DATA <= IOPPORTNUM             : INS  13 : Input port 13
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R14),                               -- AE : DATA <= IOPPORTNUM             : INS  14 : Input port 14
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R15),                               -- AF : DATA <= IOPPORTNUM             : INS  15 : Input port 15
    (ROMC_1B,L,0,I0,OP_MOV,RACC,DATA),                              --      DB <= DATA ioport
    (ROMC_00,S,1,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_1C,S,0,I0,OP_MOV,PORT0,RACC),                             -- B0 : IOPORT[0] <= ACC               : OUTS 0  : Output port 0
    (ROMC_00,S,0,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_MOV,PORT1,RACC),                             -- B1 : IOPORT[1] <= ACC               : OUTS 1  : Output port 1
    (ROMC_00,S,0,I0,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R2),                                -- B2 : DATA <= IOPPORTNUM             : OUTS 2  : Output port 2
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R3),                                -- B3 : DATA <= IOPPORTNUM             : OUTS 3  : Output port 3
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R4),                                -- B4 : DATA <= IOPPORTNUM             : OUTS 4  : Output port 4
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R5),                                -- B5 : DATA <= IOPPORTNUM             : OUTS 5  : Output port 5
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R6),                                -- B6 : DATA <= IOPPORTNUM             : OUTS 6  : Output port 6
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R7),                                -- B7 : DATA <= IOPPORTNUM             : OUTS 7  : Output port 7
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R8),                                -- B8 : DATA <= IOPPORTNUM             : OUTS 8  : Output port 8
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R9),                                -- B9 : DATA <= IOPPORTNUM             : OUTS 9  : Output port 9
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R10),                               -- BA : DATA <= IOPPORTNUM             : OUTS 10 : Output port 10
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R11),                               -- BB : DATA <= IOPPORTNUM             : OUTS 11 : Output port 11
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R12),                               -- BC : DATA <= IOPPORTNUM             : OUTS 12 : Output port 12
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R13),                               -- BD : DATA <= IOPPORTNUM             : OUTS 13 : Output port 13
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R14),                               -- BE : DATA <= IOPPORTNUM             : OUTS 14 : Output port 14
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,L,0,I0,OP_LIS,DATA,R15),                               -- BF : DATA <= IOPPORTNUM             : OUTS 15 : Output port 15
    (ROMC_1A,L,0,I0,OP_MOV,DATA,RACC),                              --      DATA ioport <= DB
    (ROMC_00,S,1,IX,OP_NOP,RACC,RACC), ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_00,S,1,I0,OP_ADD,RACC,R0 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C0 : ACC <= ACC + R0                : AS R0    : ADD binary R0
    (ROMC_00,S,1,I0,OP_ADD,RACC,R1 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C1 : ACC <= ACC + R1                : AS R1    : ADD binary R1
    (ROMC_00,S,1,I0,OP_ADD,RACC,R2 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C2 : ACC <= ACC + R2                : AS R2    : ADD binary R2
    (ROMC_00,S,1,I0,OP_ADD,RACC,R3 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C3 : ACC <= ACC + R3                : AS R3    : ADD binary R3
    (ROMC_00,S,1,I0,OP_ADD,RACC,R4 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C4 : ACC <= ACC + R4                : AS R4    : ADD binary R4
    (ROMC_00,S,1,I0,OP_ADD,RACC,R5 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C5 : ACC <= ACC + R5                : AS R5    : ADD binary R5
    (ROMC_00,S,1,I0,OP_ADD,RACC,R6 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C6 : ACC <= ACC + R6                : AS R6    : ADD binary R6
    (ROMC_00,S,1,I0,OP_ADD,RACC,R7 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C7 : ACC <= ACC + R7                : AS R7    : ADD binary R7
    (ROMC_00,S,1,I0,OP_ADD,RACC,R8 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C8 : ACC <= ACC + R8                : AS R8    : ADD binary R8
    (ROMC_00,S,1,I0,OP_ADD,RACC,R9 ),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- C9 : ACC <= ACC + R9                : AS R9    : ADD binary R9
    (ROMC_00,S,1,I0,OP_ADD,RACC,R10),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- CA : ACC <= ACC + R10               : AS R10   : ADD binary R10
    (ROMC_00,S,1,I0,OP_ADD,RACC,R11),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- CB : ACC <= ACC + R11               : AS R11   : ADD binary R11
    (ROMC_00,S,1,I0,OP_ADD,RACC,RISAR),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- CC : ACC <= ACC + (ISAR)            : AS R12   : ADD binary (ISAR)
    (ROMC_00,S,1,I0,OP_ADD,RACC,RISARP), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- CD : ACC <= ACC + (ISAR++)          : AS R13   : ADD binary (ISAR++)
    (ROMC_00,S,1,I0,OP_ADD,RACC,RISARM), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- CE : ACC <= ACC + (ISAR--)          : AS R14   : ADD binary (ISAR--)
    (ROMC_00,S,1,I0,OP_ADD,RACC,R15),    ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- CF : ACC <= ACC + R15 <INVALIDE>    : AS R15   : Invalid

    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D0 : ACC <= ACC + R0                : ASD R0   : ADD decimal R0
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R0 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D1 : ACC <= ACC + R1                : ASD R1   : ADD decimal R1
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R1 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D2 : ACC <= ACC + R2                : ASD R2   : ADD decimal R2
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R2 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D3 : ACC <= ACC + R3                : ASD R3   : ADD decimal R3
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R3 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D4 : ACC <= ACC + R4                : ASD R4   : ADD decimal R4
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R4 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D5 : ACC <= ACC + R5                : ASD R5   : ADD decimal R5
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R5 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D6 : ACC <= ACC + R6                : ASD R6   : ADD decimal R6
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R6 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D7 : ACC <= ACC + R7                : ASD R7   : ADD decimal R7
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R7 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D8 : ACC <= ACC + R8                : ASD R8   : ADD decimal R8
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R8 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- D9 : ACC <= ACC + R9                : ASD R9   : ADD decimal R9
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R9 ),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- DA : ACC <= ACC + R10               : ASD R10  : ADD decimal R10
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R10),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- DB : ACC <= ACC + R11               : ASD R11  : ADD decimal R11
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R11),   ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- DC : ACC <= ACC + (ISAR)            : ASD R12  : ADD decimal (ISAR)
    (ROMC_00,S,1,I0,OP_ADDD,RACC,RISAR), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- DD : ACC <= ACC + (ISAR++)          : ASD R13  : ADD decimal (ISAR++)
    (ROMC_00,S,1,I0,OP_ADDD,RACC,RISARP), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- DE : ACC <= ACC + (ISAR--)          : ASD R14  : ADD decimal (ISAR--)
    (ROMC_00,S,1,I0,OP_ADDD,RACC,RISARM),  ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
    (ROMC_1C,S,0,I0,OP_NOP,RACC,RACC),                              -- DF : ACC <= ACC + R15 <INVALIDE>    : ASD R15  : Invalid
    (ROMC_00,S,1,I0,OP_ADDD,RACC,R15),     ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,

    (ROMC_00,S,1,I0,OP_XOR,RACC,R0 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E0 : ACC <= ACC XOR R0              : XS R0    : XOR R0
    (ROMC_00,S,1,I0,OP_XOR,RACC,R1 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E1 : ACC <= ACC XOR R1              : XS R1    : XOR R1
    (ROMC_00,S,1,I0,OP_XOR,RACC,R2 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E2 : ACC <= ACC XOR R2              : XS R2    : XOR R2
    (ROMC_00,S,1,I0,OP_XOR,RACC,R3 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E3 : ACC <= ACC XOR R3              : XS R3    : XOR R3
    (ROMC_00,S,1,I0,OP_XOR,RACC,R4 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E4 : ACC <= ACC XOR R4              : XS R4    : XOR R4
    (ROMC_00,S,1,I0,OP_XOR,RACC,R5 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E5 : ACC <= ACC XOR R5              : XS R5    : XOR R5
    (ROMC_00,S,1,I0,OP_XOR,RACC,R6 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E6 : ACC <= ACC XOR R6              : XS R6    : XOR R6
    (ROMC_00,S,1,I0,OP_XOR,RACC,R7 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E7 : ACC <= ACC XOR R7              : XS R7    : XOR R7
    (ROMC_00,S,1,I0,OP_XOR,RACC,R8 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E8 : ACC <= ACC XOR R8              : XS R8    : XOR R8
    (ROMC_00,S,1,I0,OP_XOR,RACC,R9 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- E9 : ACC <= ACC XOR R9              : XS R9    : XOR R9
    (ROMC_00,S,1,I0,OP_XOR,RACC,R10), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- EA : ACC <= ACC XOR R10             : XS R10   : XOR R10
    (ROMC_00,S,1,I0,OP_XOR,RACC,R11), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- EB : ACC <= ACC XOR R11             : XS R11   : XOR R11
    (ROMC_00,S,1,I0,OP_XOR,RACC,RISAR), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,       -- EC : ACC <= ACC XOR (ISAR)          : XS R12   : XOR (ISAR)
    (ROMC_00,S,1,I0,OP_XOR,RACC,RISARP), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- ED : ACC <= ACC XOR (ISAR++)        : XS R13   : XOR (ISAR++)
    (ROMC_00,S,1,I0,OP_XOR,RACC,RISARM), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- EE : ACC <= ACC XOR (ISAR--)        : XS R14   : XOR (ISAR--)
    (ROMC_00,S,1,I0,OP_XOR,RACC,R15), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- EF : ACC <= ACC XOR R15  <INVALIDE> : XS R15   : Invalid

    (ROMC_00,S,1,I0,OP_AND,RACC,R0 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F0 : ACC <= ACC AND R0              : NS R0    : AND R0
    (ROMC_00,S,1,I0,OP_AND,RACC,R1 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F1 : ACC <= ACC AND R1              : NS R1    : AND R1
    (ROMC_00,S,1,I0,OP_AND,RACC,R2 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F2 : ACC <= ACC AND R2              : NS R2    : AND R2
    (ROMC_00,S,1,I0,OP_AND,RACC,R3 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F3 : ACC <= ACC AND R3              : NS R3    : AND R3
    (ROMC_00,S,1,I0,OP_AND,RACC,R4 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F4 : ACC <= ACC AND R4              : NS R4    : AND R4
    (ROMC_00,S,1,I0,OP_AND,RACC,R5 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F5 : ACC <= ACC AND R5              : NS R5    : AND R5
    (ROMC_00,S,1,I0,OP_AND,RACC,R6 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F6 : ACC <= ACC AND R6              : NS R6    : AND R6
    (ROMC_00,S,1,I0,OP_AND,RACC,R7 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F7 : ACC <= ACC AND R7              : NS R7    : AND R7
    (ROMC_00,S,1,I0,OP_AND,RACC,R8 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F8 : ACC <= ACC AND R8              : NS R8    : AND R8
    (ROMC_00,S,1,I0,OP_AND,RACC,R9 ), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- F9 : ACC <= ACC AND R9              : NS R9    : AND R9
    (ROMC_00,S,1,I0,OP_AND,RACC,R10), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- FA : ACC <= ACC AND R10             : NS R10   : AND R10
    (ROMC_00,S,1,I0,OP_AND,RACC,R11), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,         -- FB : ACC <= ACC AND R11             : NS R11   : AND R11
    (ROMC_00,S,1,I0,OP_AND,RACC,RISAR), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,       -- FC : ACC <= ACC AND (ISAR)          : NS R12   : AND (ISAR)
    (ROMC_00,S,1,I0,OP_AND,RACC,RISARP), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- FD : ACC <= ACC AND (ISAR++)        : NS R13   : AND (ISAR++)
    (ROMC_00,S,1,I0,OP_AND,RACC,RISARM), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,      -- FE : ACC <= ACC AND (ISAR--)        : NS R14   : AND (ISAR--)
    (ROMC_00,S,1,I0,OP_AND,RACC,R15), ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ          -- FF : ACC <= ACC AND R15 <INVALIDE>  : NS R15   : Invalid
    );

  TYPE arr_string12 IS ARRAY(natural RANGE <>) OF string(1 TO 12);
  CONSTANT OPTXT : arr_string12(0 TO 255) :=(
    "LR A,KU     ", "LR A,KL     ", "LR A,QU     ", "LR A,QL     ", -- 00
    "LR KU,A     ", "LR KL,A     ", "LR QU,A     ", "LR QL,A     ",
    "LR K,P      ", "LR P,K      ", "LR A,IS     ", "LR IS,A     ",
    "PK          ", "LR          ", "LR Q,DC     ", "LR DC,Q     ",
    "LR DC,H     ", "LR H,DC     ", "SR   1      ", "SL   1      ", -- 10
    "SR   4      ", "SL   4      ", "LM          ", "ST          ",
    "COM         ", "LNK         ", "DI          ", "EI          ",
    "POP         ", "LR W,J      ", "LR J,W      ", "INC         ",
    "LI   ii     ", "NI   ii     ", "OI   ii     ", "XI   ii     ", -- 20
    "AI   ii     ", "CI   ii     ", "IN   aa     ", "OUT  aa     ",
    "PI  aaaa    ", "JMP aaaa    ", "DCI aaaa    ", "NOP         ",
    "XDC         ", "NOP         ", "<INTERRUPT> ", "<RESET>     ",
    "DEC  R0     ", "DEC  R1     ", "DEC  R2     ", "DEC  R3     ", -- 30
    "DEC  R4     ", "DEC  R5     ", "DEC  R6     ", "DEC  R7     ",
    "DEC  R8     ", "DEC  R9     ", "DEC  R10    ", "DEC  R11    ",
    "DEC (ISAR)  ", "DEC  (ISAR+)", "DEC  (ISAR-)", "Invalid     ",
    "LR A,R0     ", "LR A,R1     ", "LR A,R2     ", "LR A,R3     ", -- 40
    "LR A,R4     ", "LR A,R5     ", "LR A,R6     ", "LR A,R7     ",
    "LR A,R8     ", "LR A,R9     ", "LR A,R10    ", "LR A,R11    ",
    "LR A,(ISAR) ", "LR A,(ISAR+)", "LR A,(ISAR-)", "Invalid     ",
    "LR R0 ,A    ", "LR R1 ,A    ", "LR R2 ,A    ", "LR R3 ,A    ", -- 50
    "LR R4 ,A    ", "LR R5 ,A    ", "LR R6 ,A    ", "LR R7 ,A    ",
    "LR R8 ,A    ", "LR R9 ,A    ", "LR R10,A    ", "LR R11,A    ",
    "LR (ISAR),A ", "LR (ISAR+),A", "LR (ISAR-),A", "Invalid     ",
    "LISU 0      ", "LISU 1      ", "LISU 2      ", "LISU 3      ", -- 60
    "LISU 4      ", "LISU 5      ", "LISU 6      ", "LISU 7      ",
    "LISL 0      ", "LISL 1      ", "LISL 2      ", "LISL 3      ",
    "LISL 4      ", "LISL 5      ", "LISL 6      ", "LISL 7      ",
    "LIS 0       ", "LIS 1       ", "LIS 2       ", "LIS 3       ", -- 70
    "LIS 4       ", "LIS 5       ", "LIS 6       ", "LIS 7       ",
    "LIS 8       ", "LIS 9       ", "LIS 10      ", "LIS 11      ",
    "LIS 12      ", "LIS 13      ", "LIS 14      ", "LIS 15      ",
    "BT   0 aa   ", "BT   1 aa   ", "BT   2 aa   ", "BT   3 aa   ", -- 80
    "BT   4 aa   ", "BT   5 aa   ", "BT   6 aa   ", "BT   7 aa   ",
    "AM          ", "AMD         ", "NM          ", "OM          ",
    "XM          ", "CM          ", "ADC         ", "BR7 aa      ",
    "BF 0   aa   ", "BF 1   aa   ", "BF 2   aa   ", "BF 3   aa   ", -- 90
    "BF 4   aa   ", "BF 5   aa   ", "BF 6   aa   ", "BF 7   aa   ",
    "BF 8   aa   ", "BF 9   aa   ", "BF A   aa   ", "BF B   aa   ",
    "BF C   aa   ", "BF D   aa   ", "BF E   aa   ", "BF F   aa   ",
    "INS  0      ", "INS  1      ", "INS  2      ", "INS  3      ", -- A0
    "INS  4      ", "INS  5      ", "INS  6      ", "INS  7      ",
    "INS  8      ", "INS  9      ", "INS  10     ", "INS  11     ",
    "INS  12     ", "INS  13     ", "INS  14     ", "INS  15     ",
    "OUTS 0      ", "OUTS 1      ", "OUTS 2      ", "OUTS 3      ", -- B0
    "OUTS 4      ", "OUTS 5      ", "OUTS 6      ", "OUTS 7      ",
    "OUTS 8      ", "OUTS 9      ", "OUTS 10     ", "OUTS 11     ",
    "OUTS 12     ", "OUTS 13     ", "OUTS 14     ", "OUTS 15     ",
    "AS R0       ", "AS R1       ", "AS R2       ", "AS R3       ", -- C0
    "AS R4       ", "AS R5       ", "AS R6       ", "AS R7       ",
    "AS R8       ", "AS R9       ", "AS R10      ", "AS R11      ",
    "AS  (ISAR)  ", "AS  (ISAR+) ", "AS  (ISAR-) ", "Invalid     ",
    "ASD R0      ", "ASD R1      ", "ASD R2      ", "ASD R3      ", -- D0
    "ASD R4      ", "ASD R5      ", "ASD R6      ", "ASD R7      ",
    "ASD R8      ", "ASD R9      ", "ASD R10     ", "ASD R11     ",
    "ASD (ISAR)  ", "ASD (ISAR+) ", "ASD (ISAR-) ", "Invalid     ",
    "XOR R0      ", "XOR R1      ", "XOR R2      ", "XOR R3      ", -- E0
    "XOR R4      ", "XOR R5      ", "XOR R6      ", "XOR R7      ",
    "XOR R8      ", "XOR R9      ", "XOR R10     ", "XOR R11     ",
    "XOR (ISAR)  ", "XOR (ISAR+) ", "XOR (ISAR-) ", "Invalid     ",
    "AND R0      ", "AND R1      ", "AND R2      ", "AND R3      ", -- F0
    "AND R4      ", "AND R5      ", "AND R6      ", "AND R7      ",
    "AND R8      ", "AND R9      ", "AND R10     ", "AND R11     ",
    "AND (ISAR)  ", "AND (ISAR+) ", "AND (ISAR-) ", "Invalid     ");

  TYPE arr_ilen IS ARRAY(natural RANGE <>) OF uint3;
  CONSTANT ILEN : arr_ilen(0 TO 255) :=(
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,1,  --00
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,1,  --10
    2,2,2,2,    2,2,2,2,    3,3,3,1,    1,1,0,0,  --20
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,0,  --30
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,0,  --40
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,0,  --50
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,1,  --60
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,1,  --70
    2,2,2,2,    2,2,2,2,    1,1,1,1,    1,1,1,2,  --80
    2,2,2,2,    2,2,2,2,    2,2,2,2,    2,2,2,2,  --90
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,1,  --A0
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,1,  --B0
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,0,  --C0
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,0,  --D0
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,0,  --E0
    1,1,1,1,    1,1,1,1,    1,1,1,1,    1,1,1,0); --F0

END PACKAGE;

--##############################################################################
PACKAGE BODY f8_pack IS
  FUNCTION test_bf(op    : uv4;
                   iozcs : uv5) RETURN boolean IS
  BEGIN
    CASE op IS
      WHEN "0000" => -- Unconditional Branch
        RETURN true;
      WHEN "0001" => -- Branch on negative
        RETURN (iozcs(0)='0');
      WHEN "0010" => -- Branch if no carry
        RETURN (iozcs(1)='0');
      WHEN "0011" => -- Branch if no carry & negative
        RETURN (iozcs(1)='0' AND iozcs(0)='0');
      WHEN "0100" => -- Branch if not zero
        RETURN (iozcs(2)='0');
      WHEN "0101" => -- Same as T=1
        RETURN (iozcs(0)='0');
      WHEN "0110" => -- Branch if no carry & no zero
        RETURN (iozcs(1)='0' AND iozcs(2)='0');
      WHEN "0111" => -- Same as T=3
        RETURN (iozcs(1)='0' AND iozcs(0)='0');
      WHEN "1000" => -- Branch if no overflow
        RETURN (iozcs(3)='0');
      WHEN "1001" => -- Branch if negative & no overflow
        RETURN (iozcs(3)='0' AND iozcs(0)='0');
      WHEN "1010" => -- Branch if no overflow and no carry
        RETURN (iozcs(3)='0' AND iozcs(1)='0');
      WHEN "1011" => -- Branch if no overflow, no carry and negative
        RETURN (iozcs(3)='0' AND iozcs(1)='0' AND iozcs(0)='0');
      WHEN "1100" => -- Branch if no overflow and no zero
        RETURN (iozcs(3)='0' AND iozcs(2)='0');
      WHEN "1101" => -- Same as T=9
        RETURN (iozcs(3)='0' AND iozcs(0)='0');
      WHEN "1110" => -- Branch if no overflow no carry and not zero
        RETURN (iozcs(3)='0' AND iozcs(1)='0' AND iozcs(0)='0');
      WHEN OTHERS => -- Same as T=B
        RETURN (iozcs(3)='0' AND iozcs(1)='0' AND iozcs(0)='0');
    END CASE;
  END FUNCTION;

  FUNCTION test_bt(op    : uv3;
                   iozcs : uv5) RETURN boolean IS
  BEGIN
    CASE op IS
      WHEN "000" => -- No branch
        RETURN false;
      WHEN "001" => -- Branch if positive
        RETURN (iozcs(0)='1');
      WHEN "010" => -- Branch if carry
        RETURN (iozcs(1)='1');
      WHEN "011" => -- Branch if positive or carry
        RETURN (iozcs(0)='1' OR iozcs(1)='1');
      WHEN "100" => -- Branch if zero
        RETURN (iozcs(2)='1');
      WHEN "101" => -- Same as T=1
        RETURN (iozcs(0)='1');
      WHEN "110" => -- Branch if zero or carry
        RETURN (iozcs(2)='1' OR iozcs(1)='1');
      WHEN OTHERS => -- Same as T=3
        RETURN (iozcs(0)='1' OR iozcs(1)='1');
    END CASE;
  END FUNCTION;


  PROCEDURE aluop(op : IN enum_op; -- ALU operation
                  code : IN uv8;   -- OPCODE
                  src1 : IN uv8;   -- Source Reg 1 / Destination reg
                  src2 : IN uv8;   -- Source Reg 2
                  iozcs_i : IN uv5; -- Flags before
                  dst  : OUT uv8; -- Result
                  dstm : OUT std_logic; -- Modified result reg
                  iozcs_o : OUT uv5; -- Flags after
                  test : OUT std_logic) IS -- Contitional branch test result
    VARIABLE dst_v : uv8;
    VARIABLE dst9_v : uv9;
    VARIABLE tc_v,tic_v : boolean;
  BEGIN

    iozcs_o:=iozcs_i;
    dstm:='0';
    test:='0';

    CASE op IS
      WHEN OP_ADD => -- Binary Add
        dst9_v:=('0' & src1) + ('0' & src2);
        iozcs_o(0):=NOT dst9_v(7);
        iozcs_o(1):=dst9_v(8);
        iozcs_o(2):=to_std_logic(dst9_v(7 DOWNTO 0)=x"00");
        iozcs_o(3):=(src1(7) XOR dst9_v(7)) AND (src2(7) XOR dst9_v(7));
        dstm:='1';
        dst_v:=dst9_v(7 DOWNTO 0);

      WHEN OP_ADDD => -- Decimal Add
        dst9_v:=('0' & src1) + ('0' & src2);
        iozcs_o(0):=NOT dst9_v(7);
        iozcs_o(1):=dst9_v(8);
        iozcs_o(2):=to_std_logic(dst9_v(7 DOWNTO 0)=x"00");
        iozcs_o(3):=(src1(7) XOR dst9_v(7)) AND (src2(7) XOR dst9_v(7));

        tc_v :=(((('0' & src1) + ('0' & src2)) AND "111110000") > "011110000");
        tic_v:=(('0' & src1(3 DOWNTO 0)) + ('0' & src2(3 DOWNTO 0))> "01111");

        dst_v:=src1 + src2;
        IF NOT tc_v AND NOT tic_v THEN
          dst_v:=((dst_v + x"A0") AND x"F0") + ((dst_v + x"0A") AND x"0F");
        ELSIF NOT tc_v AND tic_v THEN
          dst_v:=((dst_v + x"A0") AND x"F0") + (dst_v AND x"0F");
        ELSIF tc_v AND NOT tic_v THEN
          dst_v:=(dst_v AND x"F0") + ((dst_v + x"0A") AND x"0F");
        END IF;
        dstm:='1';

      WHEN OP_CMP => -- Compare
        dst9_v:=(('0' & NOT src1) + ('0' & src2)) + 1;
        iozcs_o(0):=NOT dst9_v(7);
        iozcs_o(1):=dst9_v(8);
        iozcs_o(2):=to_std_logic(dst9_v(7 DOWNTO 0)=x"00");
        iozcs_o(3):=(NOT src1(7) XOR dst9_v(7)) AND (src2(7) XOR dst9_v(7));
        dstm:='0';

      WHEN OP_AND => -- AND
        dst_v:=src1 AND src2;
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_OR => -- OR
        dst_v:=src1 OR src2;
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_XOR => -- XOR
        dst_v:=src1 XOR src2;
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_DEC => -- DECREMENT : ADD FF
        dst9_v:=('0' & src1) + ('0' & x"FF");
        iozcs_o(0):=NOT dst9_v(7);
        iozcs_o(1):=dst9_v(8);
        iozcs_o(2):=to_std_logic(dst9_v(7 DOWNTO 0)=x"00");
        iozcs_o(3):=(src1(7) XOR dst9_v(7)) AND (NOT dst9_v(7));
        dstm:='1';
        dst_v:=dst9_v(7 DOWNTO 0);

      WHEN OP_SL1 => -- SHIFT LEFT  1
        dst_v:=src1(6 DOWNTO 0) & '0';
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_SL4 => -- SHIFT LEFT  4
        dst_v:=src1(3 DOWNTO 0) & x"0";
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_SR1 => -- SHIFT RIGHT 1
        dst_v:='0' & src1(7 DOWNTO 1);
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_SR4 => -- SHIFT RIGHT 4
        dst_v:=x"0" & src1(7 DOWNTO 4);
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_COM => -- COM. Complement
        dst_v:=NOT src1;
        iozcs_o(0):=NOT dst_v(7);
        iozcs_o(1):='0';
        iozcs_o(2):=to_std_logic(dst_v=x"00");
        iozcs_o(3):='0';
        dstm:='1';

      WHEN OP_LNK => -- LNK. Add carry to acc.
        dst9_v:=('0' & src1) + ('0' & iozcs_i(1));
        iozcs_o(0):=NOT dst9_v(7);
        iozcs_o(1):=dst9_v(8);
        iozcs_o(2):=to_std_logic(dst9_v(7 DOWNTO 0)=x"00");
        iozcs_o(3):=(src1(7) XOR dst9_v(7)) AND dst9_v(7);
        dstm:='1';
        dst_v:=dst9_v(7 DOWNTO 0);

      WHEN OP_INC => -- INC Increment
        dst9_v:=('0' & src1) + 1;
        iozcs_o(0):=NOT dst9_v(7);
        iozcs_o(1):=dst9_v(8);
        iozcs_o(2):=to_std_logic(dst9_v(7 DOWNTO 0)=x"00");
        iozcs_o(3):=(src1(7) XOR dst9_v(7)) AND dst9_v(7);
        dstm:='1';
        dst_v:=dst9_v(7 DOWNTO 0);

      WHEN OP_EDI => -- Enable / Disable ICB
        iozcs_o(4):=code(0);

      WHEN OP_LIS => -- Load immediate acc.
        dst_v:=x"0" & code(3 DOWNTO 0);
        dstm:='1';

      WHEN OP_TST8 => -- 8x conditional branches
        test:=to_std_logic(test_bt(code(2 DOWNTO 0),iozcs_i));

      WHEN OP_TST9 => -- 9x conditional branches
        test:=to_std_logic(test_bf(code(3 DOWNTO 0),iozcs_i));
        dstm:='0';

      WHEN OP_NOP =>
        dstm:='0';

      WHEN OP_MOV => 
        dst_v:=src2;
        dstm:='1';

    END CASE;

    dst:=dst_v;
  END PROCEDURE;


END PACKAGE BODY;