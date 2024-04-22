-------------------------------------------------------------------------------
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2002-2008 HT-LAB                                           --
--                                                                           --
--  Contact/bugs : http://www.ht-lab.com/misc/feedback.html                  --
--  Web          : http://www.ht-lab.com                                     --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on CPU86 must be distributed in full source code      --
--  under the same license. Contact HT-Lab for commercial applications where --
--  source-code distribution is not desirable.                               --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file "copying.txt".      --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE cpu86instr IS

-----------------------------------------------------------------------------
-- INC/DEC Word Register 
-----------------------------------------------------------------------------
constant INCREG0    : std_logic_vector(7 downto 0) := X"40";  -- Inc Register
constant INCREG1    : std_logic_vector(7 downto 0) := X"41";  
constant INCREG2    : std_logic_vector(7 downto 0) := X"42";  
constant INCREG3    : std_logic_vector(7 downto 0) := X"43";  
constant INCREG4    : std_logic_vector(7 downto 0) := X"44";  
constant INCREG5    : std_logic_vector(7 downto 0) := X"45";  
constant INCREG6    : std_logic_vector(7 downto 0) := X"46";  
constant INCREG7    : std_logic_vector(7 downto 0) := X"47";  
constant DECREG0    : std_logic_vector(7 downto 0) := X"48";  -- DEC Register
constant DECREG1    : std_logic_vector(7 downto 0) := X"49";  
constant DECREG2    : std_logic_vector(7 downto 0) := X"4A";  
constant DECREG3    : std_logic_vector(7 downto 0) := X"4B";  
constant DECREG4    : std_logic_vector(7 downto 0) := X"4C";  
constant DECREG5    : std_logic_vector(7 downto 0) := X"4D";  
constant DECREG6    : std_logic_vector(7 downto 0) := X"4E";  
constant DECREG7    : std_logic_vector(7 downto 0) := X"4F";  

-----------------------------------------------------------------------------
-- IN 
-----------------------------------------------------------------------------
constant INFIXED0   : std_logic_vector(7 downto 0) := X"E4"; -- Fixed Port Byte
constant INFIXED1   : std_logic_vector(7 downto 0) := X"E5"; -- Fixed Port Word
constant INDX0      : std_logic_vector(7 downto 0) := X"EC"; -- DX Byte
constant INDX1      : std_logic_vector(7 downto 0) := X"ED"; -- DX Word

-----------------------------------------------------------------------------
-- OUT 
-----------------------------------------------------------------------------
constant OUTFIXED0  : std_logic_vector(7 downto 0) := X"E6"; -- Fixed Port Byte
constant OUTFIXED1  : std_logic_vector(7 downto 0) := X"E7"; -- Fixed Port Word
constant OUTDX0     : std_logic_vector(7 downto 0) := X"EE"; -- DX Byte
constant OUTDX1     : std_logic_vector(7 downto 0) := X"EF"; -- DX Word

-----------------------------------------------------------------------------
-- Move Immediate to Register
-----------------------------------------------------------------------------
constant MOVI2R0    : std_logic_vector(7 downto 0) := X"B0"; -- Immediate to Register
constant MOVI2R1    : std_logic_vector(7 downto 0) := X"B1"; -- Byte
constant MOVI2R2    : std_logic_vector(7 downto 0) := X"B2";
constant MOVI2R3    : std_logic_vector(7 downto 0) := X"B3";
constant MOVI2R4    : std_logic_vector(7 downto 0) := X"B4";
constant MOVI2R5    : std_logic_vector(7 downto 0) := X"B5";
constant MOVI2R6    : std_logic_vector(7 downto 0) := X"B6";
constant MOVI2R7    : std_logic_vector(7 downto 0) := X"B7";
constant MOVI2R8    : std_logic_vector(7 downto 0) := X"B8"; -- Word
constant MOVI2R9    : std_logic_vector(7 downto 0) := X"B9";
constant MOVI2R10   : std_logic_vector(7 downto 0) := X"BA";
constant MOVI2R11   : std_logic_vector(7 downto 0) := X"BB";
constant MOVI2R12   : std_logic_vector(7 downto 0) := X"BC";
constant MOVI2R13   : std_logic_vector(7 downto 0) := X"BD";
constant MOVI2R14   : std_logic_vector(7 downto 0) := X"BE";
constant MOVI2R15   : std_logic_vector(7 downto 0) := X"BF";

-----------------------------------------------------------------------------
-- Move Immediate to Register/memory
-----------------------------------------------------------------------------
constant MOVI2RM0   : std_logic_vector(7 downto 0) := X"C6"; 
constant MOVI2RM1   : std_logic_vector(7 downto 0) := X"C7"; -- Word

-----------------------------------------------------------------------------
-- Segment Register to Register or Memory
-----------------------------------------------------------------------------
constant MOVS2RM    : std_logic_vector(7 downto 0) := X"8C"; 

-----------------------------------------------------------------------------
-- Register or Memory to Segment Register
-----------------------------------------------------------------------------
constant MOVRM2S    : std_logic_vector(7 downto 0) := X"8E"; 

-----------------------------------------------------------------------------
-- Memory to Accumulator  ADDRL,ADDRH
-----------------------------------------------------------------------------
constant MOVM2A0    : std_logic_vector(7 downto 0) := X"A0"; 
constant MOVM2A1    : std_logic_vector(7 downto 0) := X"A1"; 

-----------------------------------------------------------------------------
-- Accumulator to Memory to Accumulator   ADDRL,ADDRH
-----------------------------------------------------------------------------
constant MOVA2M0    : std_logic_vector(7 downto 0) := X"A2"; 
constant MOVA2M1    : std_logic_vector(7 downto 0) := X"A3"; 

-----------------------------------------------------------------------------
-- Register/Memory to/from Register
-----------------------------------------------------------------------------
constant MOVRM2R0   : std_logic_vector(7 downto 0) := X"88"; 
constant MOVRM2R1   : std_logic_vector(7 downto 0) := X"89"; 
constant MOVRM2R2   : std_logic_vector(7 downto 0) := X"8A"; 
constant MOVRM2R3   : std_logic_vector(7 downto 0) := X"8B"; 

-----------------------------------------------------------------------------
-- Segment Override Prefix
-----------------------------------------------------------------------------
constant SEGOPES    : std_logic_vector(7 downto 0) := X"26";
constant SEGOPCS    : std_logic_vector(7 downto 0) := X"2E";
constant SEGOPSS    : std_logic_vector(7 downto 0) := X"36";
constant SEGOPDS    : std_logic_vector(7 downto 0) := X"3E";

-----------------------------------------------------------------------------
-- ADD/ADC/SUB/SBB/CMP/AND/OR/XOR Register/Memory to Register
-----------------------------------------------------------------------------
constant ADDRM2R0   : std_logic_vector(7 downto 0) := X"00"; 
constant ADDRM2R1   : std_logic_vector(7 downto 0) := X"01"; 
constant ADDRM2R2   : std_logic_vector(7 downto 0) := X"02"; 
constant ADDRM2R3   : std_logic_vector(7 downto 0) := X"03"; 

constant ADCRM2R0   : std_logic_vector(7 downto 0) := X"10"; 
constant ADCRM2R1   : std_logic_vector(7 downto 0) := X"11"; 
constant ADCRM2R2   : std_logic_vector(7 downto 0) := X"12"; 
constant ADCRM2R3   : std_logic_vector(7 downto 0) := X"13";

constant SUBRM2R0   : std_logic_vector(7 downto 0) := X"28"; 
constant SUBRM2R1   : std_logic_vector(7 downto 0) := X"29"; 
constant SUBRM2R2   : std_logic_vector(7 downto 0) := X"2A"; 
constant SUBRM2R3   : std_logic_vector(7 downto 0) := X"2B";

constant SBBRM2R0   : std_logic_vector(7 downto 0) := X"18"; 
constant SBBRM2R1   : std_logic_vector(7 downto 0) := X"19"; 
constant SBBRM2R2   : std_logic_vector(7 downto 0) := X"1A"; 
constant SBBRM2R3   : std_logic_vector(7 downto 0) := X"1B";

constant CMPRM2R0   : std_logic_vector(7 downto 0) := X"38"; 
constant CMPRM2R1   : std_logic_vector(7 downto 0) := X"39"; 
constant CMPRM2R2   : std_logic_vector(7 downto 0) := X"3A"; 
constant CMPRM2R3   : std_logic_vector(7 downto 0) := X"3B";

constant ANDRM2R0   : std_logic_vector(7 downto 0) := X"20"; 
constant ANDRM2R1   : std_logic_vector(7 downto 0) := X"21"; 
constant ANDRM2R2   : std_logic_vector(7 downto 0) := X"22"; 
constant ANDRM2R3   : std_logic_vector(7 downto 0) := X"23"; 

constant ORRM2R0    : std_logic_vector(7 downto 0) := X"08"; 
constant ORRM2R1    : std_logic_vector(7 downto 0) := X"09"; 
constant ORRM2R2    : std_logic_vector(7 downto 0) := X"0A"; 
constant ORRM2R3    : std_logic_vector(7 downto 0) := X"0B";

constant XORRM2R0   : std_logic_vector(7 downto 0) := X"30"; 
constant XORRM2R1   : std_logic_vector(7 downto 0) := X"31"; 
constant XORRM2R2   : std_logic_vector(7 downto 0) := X"32"; 
constant XORRM2R3   : std_logic_vector(7 downto 0) := X"33";


-----------------------------------------------------------------------------
-- OPCODE 80,81,83, ADD/ADC/SUB/SBB/CMP/AND/OR/XOR Immediate to Reg/Mem 
-- Instruction defined in reg field
-----------------------------------------------------------------------------
constant O80I2RM    : std_logic_vector(7 downto 0) := X"80"; 
constant O81I2RM    : std_logic_vector(7 downto 0) := X"81"; 
constant O83I2RM    : std_logic_vector(7 downto 0) := X"83"; 

-----------------------------------------------------------------------------
-- ADD/ADC/SUB/SBB/CMP/AND/OR/XOR   Immediate with ACCU     
-----------------------------------------------------------------------------
constant ADDI2AX0   : std_logic_vector(7 downto 0) := X"04"; 
constant ADDI2AX1   : std_logic_vector(7 downto 0) := X"05"; 
constant ADCI2AX0   : std_logic_vector(7 downto 0) := X"14"; 
constant ADCI2AX1   : std_logic_vector(7 downto 0) := X"15"; 
constant SUBI2AX0   : std_logic_vector(7 downto 0) := X"2C"; 
constant SUBI2AX1   : std_logic_vector(7 downto 0) := X"2D"; 
constant SBBI2AX0   : std_logic_vector(7 downto 0) := X"1C"; 
constant SBBI2AX1   : std_logic_vector(7 downto 0) := X"1D"; 
constant CMPI2AX0   : std_logic_vector(7 downto 0) := X"3C"; 
constant CMPI2AX1   : std_logic_vector(7 downto 0) := X"3D"; 
constant ANDI2AX0   : std_logic_vector(7 downto 0) := X"24"; 
constant ANDI2AX1   : std_logic_vector(7 downto 0) := X"25"; 
constant ORI2AX0    : std_logic_vector(7 downto 0) := X"0C"; 
constant ORI2AX1    : std_logic_vector(7 downto 0) := X"0D"; 
constant XORI2AX0   : std_logic_vector(7 downto 0) := X"34"; 
constant XORI2AX1   : std_logic_vector(7 downto 0) := X"35"; 

-----------------------------------------------------------------------------
-- TEST (Same as AND but without returning any results)     
-----------------------------------------------------------------------------
constant TESTRMR0   : std_logic_vector(7 downto 0) := X"84"; 
constant TESTRMR1   : std_logic_vector(7 downto 0) := X"85"; 
constant TESTI2AX0  : std_logic_vector(7 downto 0) := X"A8"; 
constant TESTI2AX1  : std_logic_vector(7 downto 0) := X"A9"; 

-----------------------------------------------------------------------------
-- NOT/TEST F6/F7 Shared Instructions 
-- TEST regfield=000  
-- NOT  regfield=010    
-- MUL  regfield=100
-- IMUL regfield=101
-- DIV  regfield=110
-- IDIV regfield=111
-----------------------------------------------------------------------------
constant F6INSTR    : std_logic_vector(7 downto 0) := X"F6";    -- Byte
constant F7INSTR    : std_logic_vector(7 downto 0) := X"F7";    -- Word

-----------------------------------------------------------------------------
-- Carry Flag CLC/CMC/STC       
-----------------------------------------------------------------------------
constant CLC        : std_logic_vector(7 downto 0) := X"F8"; 
constant CMC        : std_logic_vector(7 downto 0) := X"F5"; 
constant STC        : std_logic_vector(7 downto 0) := X"F9"; 
constant CLD        : std_logic_vector(7 downto 0) := X"FC"; 
constant STDx       : std_logic_vector(7 downto 0) := X"FD";    
constant CLI        : std_logic_vector(7 downto 0) := X"FA"; 
constant STI        : std_logic_vector(7 downto 0) := X"FB"; 

-----------------------------------------------------------------------------
-- 8080 Instruction LAHF/SAHF       
-----------------------------------------------------------------------------
constant LAHF       : std_logic_vector(7 downto 0) := X"9F"; 
constant SAHF       : std_logic_vector(7 downto 0) := X"9E"; 

-----------------------------------------------------------------------------
-- Conditional Jumps Jxxx       
-----------------------------------------------------------------------------
constant JZ         : std_logic_vector(7 downto 0) := X"74"; 
constant JL         : std_logic_vector(7 downto 0) := X"7C"; 
constant JLE        : std_logic_vector(7 downto 0) := X"7E"; 
constant JB         : std_logic_vector(7 downto 0) := X"72"; 
constant JBE        : std_logic_vector(7 downto 0) := X"76"; 
constant JP         : std_logic_vector(7 downto 0) := X"7A"; 
constant JO         : std_logic_vector(7 downto 0) := X"70"; 
constant JS         : std_logic_vector(7 downto 0) := X"78"; 
constant JNE        : std_logic_vector(7 downto 0) := X"75"; 
constant JNL        : std_logic_vector(7 downto 0) := X"7D"; 
constant JNLE       : std_logic_vector(7 downto 0) := X"7F"; 
constant JNB        : std_logic_vector(7 downto 0) := X"73"; 
constant JNBE       : std_logic_vector(7 downto 0) := X"77"; 
constant JNP        : std_logic_vector(7 downto 0) := X"7B"; 
constant JNO        : std_logic_vector(7 downto 0) := X"71"; 
constant JNS        : std_logic_vector(7 downto 0) := X"79"; 

constant JMPS       : std_logic_vector(7 downto 0) := X"EB";        -- Short Jump within segment , SignExt DISPL
constant JMP        : std_logic_vector(7 downto 0) := X"E9";        -- Long Jump within segment, No SignExt DISPL
constant JMPDIS     : std_logic_vector(7 downto 0) := X"EA";        -- Jump Inter Segment (CS:IP given)

-----------------------------------------------------------------------------
-- Push/Pop Flags       
-----------------------------------------------------------------------------
constant PUSHF      : std_logic_vector(7 downto 0) := X"9C"; 
constant POPF       : std_logic_vector(7 downto 0) := X"9D"; 

-----------------------------------------------------------------------------
-- PUSH Register    
-----------------------------------------------------------------------------
constant PUSHAX     : std_logic_vector(7 downto 0) := X"50"; 
constant PUSHCX     : std_logic_vector(7 downto 0) := X"51"; 
constant PUSHDX     : std_logic_vector(7 downto 0) := X"52"; 
constant PUSHBX     : std_logic_vector(7 downto 0) := X"53"; 
constant PUSHSP     : std_logic_vector(7 downto 0) := X"54"; 
constant PUSHBP     : std_logic_vector(7 downto 0) := X"55"; 
constant PUSHSI     : std_logic_vector(7 downto 0) := X"56"; 
constant PUSHDI     : std_logic_vector(7 downto 0) := X"57"; 

constant PUSHES     : std_logic_vector(7 downto 0) := X"06"; 
constant PUSHCS     : std_logic_vector(7 downto 0) := X"0E";           
constant PUSHSS     : std_logic_vector(7 downto 0) := X"16"; 
constant PUSHDS     : std_logic_vector(7 downto 0) := X"1E"; 

-----------------------------------------------------------------------------
-- Pop Register     
-----------------------------------------------------------------------------
constant POPAX      : std_logic_vector(7 downto 0) := X"58"; 
constant POPCX      : std_logic_vector(7 downto 0) := X"59"; 
constant POPDX      : std_logic_vector(7 downto 0) := X"5A"; 
constant POPBX      : std_logic_vector(7 downto 0) := X"5B"; 
constant POPSP      : std_logic_vector(7 downto 0) := X"5C"; 
constant POPBP      : std_logic_vector(7 downto 0) := X"5D"; 
constant POPSI      : std_logic_vector(7 downto 0) := X"5E"; 
constant POPDI      : std_logic_vector(7 downto 0) := X"5F"; 

constant POPES      : std_logic_vector(7 downto 0) := X"07"; 
constant POPSS      : std_logic_vector(7 downto 0) := X"17"; 
constant POPDS      : std_logic_vector(7 downto 0) := X"1F"; 

constant POPRM      : std_logic_vector(7 downto 0) := X"8F"; 

-----------------------------------------------------------------------------
-- Exchange Register    
-----------------------------------------------------------------------------
constant XCHGW      : std_logic_vector(7 downto 0) := X"86"; 
constant XCHGB      : std_logic_vector(7 downto 0) := X"87"; 

constant XCHGAX     : std_logic_vector(7 downto 0) := X"90"; 
constant XCHGCX     : std_logic_vector(7 downto 0) := X"91"; 
constant XCHGDX     : std_logic_vector(7 downto 0) := X"92"; 
constant XCHGBX     : std_logic_vector(7 downto 0) := X"93"; 
constant XCHGSP     : std_logic_vector(7 downto 0) := X"94"; 
constant XCHGBP     : std_logic_vector(7 downto 0) := X"95"; 
constant XCHGSI     : std_logic_vector(7 downto 0) := X"96"; 
constant XCHGDI     : std_logic_vector(7 downto 0) := X"97"; 

-----------------------------------------------------------------------------
-- Load Effective Address       
-----------------------------------------------------------------------------
constant LEA        : std_logic_vector(7 downto 0) := X"8D"; 
constant LDS        : std_logic_vector(7 downto 0) := X"C5"; 
constant LES        : std_logic_vector(7 downto 0) := X"C4"; 

-----------------------------------------------------------------------------
-- Convert Instructions     
-----------------------------------------------------------------------------
constant CBW        : std_logic_vector(7 downto 0) := X"98"; 
constant CWD        : std_logic_vector(7 downto 0) := X"99"; 
constant AAS        : std_logic_vector(7 downto 0) := X"3F"; 
constant DAS        : std_logic_vector(7 downto 0) := X"2F"; 
constant AAA        : std_logic_vector(7 downto 0) := X"37"; 
constant DAA        : std_logic_vector(7 downto 0) := X"27"; 

constant AAM        : std_logic_vector(7 downto 0) := X"D4"; 
constant AAD        : std_logic_vector(7 downto 0) := X"D5"; 

constant XLAT       : std_logic_vector(7 downto 0) := X"D7"; 

-----------------------------------------------------------------------------
-- Misc Instructions    
-----------------------------------------------------------------------------
constant NOP        : std_logic_vector(7 downto 0) := X"90";    -- No Operation
constant HLT        : std_logic_vector(7 downto 0) := X"F4";    -- Halt Instruction, wait NMI, INTR, Reset

-----------------------------------------------------------------------------
-- Loop Instructions    
-----------------------------------------------------------------------------
constant LOOPCX     : std_logic_vector(7 downto 0) := X"E2"; 
constant LOOPZ      : std_logic_vector(7 downto 0) := X"E1"; 
constant LOOPNZ     : std_logic_vector(7 downto 0) := X"E0"; 
constant JCXZ       : std_logic_vector(7 downto 0) := X"E3"; 

-----------------------------------------------------------------------------
-- CALL Instructions    
-----------------------------------------------------------------------------
constant CALL       : std_logic_vector(7 downto 0) := X"E8";    -- Direct within Segment 
constant CALLDIS    : std_logic_vector(7 downto 0) := X"9A";    -- Direct Inter Segment 

-----------------------------------------------------------------------------
-- RET Instructions     
-----------------------------------------------------------------------------
constant RET        : std_logic_vector(7 downto 0) := X"C3";    -- Within Segment 
constant RETDIS     : std_logic_vector(7 downto 0) := X"CB";    -- Direct Inter Segment 
constant RETO       : std_logic_vector(7 downto 0) := X"C2";    -- Within Segment + Offset
constant RETDISO    : std_logic_vector(7 downto 0) := X"CA";    -- Direct Inter Segment +Offset 

-----------------------------------------------------------------------------
-- INT Instructions     
-----------------------------------------------------------------------------
constant INT        : std_logic_vector(7 downto 0) := X"CD";    -- type=second byte 
constant INT3       : std_logic_vector(7 downto 0) := X"CC";    -- type=3 
constant INTO       : std_logic_vector(7 downto 0) := X"CE";    -- type=4 
constant IRET       : std_logic_vector(7 downto 0) := X"CF";    -- Interrupt Return 

-----------------------------------------------------------------------------
-- String/Repeat Instructions       
-----------------------------------------------------------------------------
constant MOVSB      : std_logic_vector(7 downto 0) := X"A4";     
constant MOVSW      : std_logic_vector(7 downto 0) := X"A5";     
constant CMPSB      : std_logic_vector(7 downto 0) := X"A6";     
constant CMPSW      : std_logic_vector(7 downto 0) := X"A7";     
constant SCASB      : std_logic_vector(7 downto 0) := X"AE";     
constant SCASW      : std_logic_vector(7 downto 0) := X"AF";     
constant LODSB      : std_logic_vector(7 downto 0) := X"AC";     
constant LODSW      : std_logic_vector(7 downto 0) := X"AD";     
constant STOSB      : std_logic_vector(7 downto 0) := X"AA";     
constant STOSW      : std_logic_vector(7 downto 0) := X"AB";    
 
constant REPNE      : std_logic_vector(7 downto 0) := X"F2";    -- stop if zf=1
constant REPE       : std_logic_vector(7 downto 0) := X"F3";    -- stop if zf/=1 


-----------------------------------------------------------------------------
-- Shift/Rotate Instructions   
-- Operation define in MODRM REG bits
-- Note REG=110 is undefined    
-----------------------------------------------------------------------------
constant SHFTROT0   : std_logic_vector(7 downto 0) := X"D0";    
constant SHFTROT1   : std_logic_vector(7 downto 0) := X"D1";    
constant SHFTROT2   : std_logic_vector(7 downto 0) := X"D2";    
constant SHFTROT3   : std_logic_vector(7 downto 0) := X"D3";    

-----------------------------------------------------------------------------
-- FF/FE Instructions. Use regfiled to decode operation   
-- INC  reg=000  (FF/FE)
-- DEC  reg=001  (FF/FE)
-- CALL reg=010  (FF) Indirect within segment
-- CALL reg=011  (FF) Indirect Intersegment
-- JMP  reg=100  (FF) Indirect within segment
-- JMP  reg=101  (FF) Indirect Intersegment
-- PUSH reg=110  (FF)
-----------------------------------------------------------------------------
constant FEINSTR    : std_logic_vector(7 downto 0) := X"FE";    
constant FFINSTR    : std_logic_vector(7 downto 0) := X"FF";    

END cpu86instr;
