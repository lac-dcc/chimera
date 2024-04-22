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
use ieee.std_logic_unsigned.all;

PACKAGE cpu86pack IS

constant RESET_CS_C : std_logic_vector(15 downto 0) := (others => '1'); -- FFFF:0000
constant RESET_IP_C : std_logic_vector(15 downto 0) := (others => '0'); 
constant RESET_ES_C : std_logic_vector(15 downto 0) := (others => '0');
constant RESET_SS_C : std_logic_vector(15 downto 0) := (others => '0');
constant RESET_DS_C : std_logic_vector(15 downto 0) := (others => '0');

constant RESET_VECTOR_C : std_logic_vector(19 downto 0) := (RESET_CS_C & X"0") + (X"0" & RESET_IP_C);

constant MUL_MCD_C    : std_logic_vector(4 downto 0) := "00010";  -- mul MCP
-- Serial Divider delay
-- changed later to done signal
-- You can gain 1 clk cycle, done can be asserted 1 cycle earlier
constant DIV_MCD_C  : std_logic_vector(4 downto 0) := "10011";  -- div waitstates 19!

constant ONE            : std_logic := '1';
constant ZERO           : std_logic := '0';
constant ZEROVECTOR_C   : std_logic_vector(31 downto 0) := X"00000000";  

-- Minimum value for MAX_WS="000", this result in a 2 cycle rd/wr strobe
-- Total Read cycle is 1 cycle for address setup + 2 cycles for rd/wr strobe, thus
-- minimum bus cycle is 3 clk cycles. 
constant WS_WIDTH : integer := 3;       -- 2^WS_WIDTH=MAX Waitstates
constant MAX_WS   : std_logic_vector(WS_WIDTH-1 downto 0) := "000"; -- 3 clk bus cycles   

constant DONTCARE : std_logic_vector(31 downto 0):=X"FFFFFFFF";


-- Status record containing some data and flag register
type instruction_type is record
  ireg      : std_logic_vector(7 downto 0);     -- Instruction register
  xmod      : std_logic_vector(1 downto 0);     -- mod is a reserved word
  reg       : std_logic_vector(2 downto 0);     -- between mode and rm
  rm        : std_logic_vector(2 downto 0);
  data      : std_logic_vector(15 downto 0);
  disp      : std_logic_vector(15 downto 0);
  nb        : std_logic_vector(2 downto 0);     -- Number of bytes
end record;


-- Status record containing some data and flag register
type status_out_type is record
  ax        : std_logic_vector(15 downto 0); 
  cx_one    : std_logic;                        -- '1' if CX=0001
  cx_zero   : std_logic;                        -- '1' if CX=0000   
  cl        : std_logic_vector(7 downto 0);     -- 5 bits shift/rotate counter
  flag      : std_logic_vector(15 downto 0); 
  div_err   : std_logic;                        -- Divider overflow
end record;

--------------------------------------------------------------------------------------
-- Data Path Records
--------------------------------------------------------------------------------------
type path_in_type is record
  datareg_input : std_logic_vector(6 downto 0); -- dimux(3) & w & seldreg(3)
  alu_operation : std_logic_vector(14 downto 0);-- selalua(4) & selalub(4) & aluopr(7) 
  dbus_output   : std_logic_vector(1 downto 0); -- (Odd/Even) domux setting
  segreg_input  : std_logic_vector(3 downto 0); -- simux & selsreg 
  ea_output     : std_logic_vector(9 downto 0); -- dispmux(3) & eamux(4) & [flag]&segop(2)  
end record;

-- Write Strobe Record for Data Path
type write_in_type is record
  wrd   : std_logic;                            -- Write datareg
  wralu : std_logic;                            -- Write ALU result
  wrcc  : std_logic;                            -- Write Flag register
  wrs   : std_logic;                            -- Write Segment register
  wrip  : std_logic;                            -- Write Instruction Pointer
  wrop  : std_logic;                            -- Write Segment Prefix register, Set Prefix Flag
  wrtemp: std_logic;                            -- Write to ALU_TEMP register
end record; 


constant SET_OPFLAG     : std_logic:='1';     -- Override Prefix Flag

-- DIMUX    
constant DATAIN_IN      : std_logic_vector(2 downto 0) := "000"; 
constant EABUS_IN       : std_logic_vector(2 downto 0) := "001";
constant ALUBUS_IN      : std_logic_vector(2 downto 0) := "010";
constant MDBUS_IN       : std_logic_vector(2 downto 0) := "011";
constant ES_IN          : std_logic_vector(2 downto 0) := "100";
constant CS_IN          : std_logic_vector(2 downto 0) := "101";
constant SS_IN          : std_logic_vector(2 downto 0) := "110";
constant DS_IN          : std_logic_vector(2 downto 0) := "111";

-- SIMUX   Segment Register input Mux
constant SDATAIN_IN     : std_logic_vector(1 downto 0) := "00";
constant SEABUS_IN      : std_logic_vector(1 downto 0) := "01";  -- Effective Address
constant SALUBUS_IN     : std_logic_vector(1 downto 0) := "10";
constant SMDBUS_IN      : std_logic_vector(1 downto 0) := "11";

-- DOMUX   (Note bit 2=odd/even) 
constant ALUBUS_OUT     : std_logic_vector(1 downto 0) := "00";
constant CCBUS_OUT      : std_logic_vector(1 downto 0) := "01";
constant DIBUS_OUT      : std_logic_vector(1 downto 0) := "10";
constant IPBUS_OUT      : std_logic_vector(1 downto 0) := "11";


-- dispmux(3) & eamux(4) & poflag & segop[1:0]
-- note some bits may be dontcare!
constant NB_ES_IP       : std_logic_vector(9 downto 0) := "0000000000";     -- IPREG+NB ADDR=ES:IP 
constant NB_CS_IP       : std_logic_vector(9 downto 0) := "0000000001";
constant NB_SS_IP       : std_logic_vector(9 downto 0) := "0000000010";
constant NB_DS_IP       : std_logic_vector(9 downto 0) := "0000000011";  

constant NB_ES_EA       : std_logic_vector(9 downto 0) := "0000001000";     -- IPREG+NB ADDR=EA
constant NB_CS_EA       : std_logic_vector(9 downto 0) := "0000001001";
constant NB_SS_EA       : std_logic_vector(9 downto 0) := "0000001010";
constant NB_DS_EA       : std_logic_vector(9 downto 0) := "0000001011";
constant DISP_ES_EA     : std_logic_vector(9 downto 0) := "0010001000";     -- IPREG+DISP ADDR=EA
constant DISP_CS_EA     : std_logic_vector(9 downto 0) := "0010001001";
constant DISP_SS_EA     : std_logic_vector(9 downto 0) := "0010001010";
constant DISP_DS_EA     : std_logic_vector(9 downto 0) := "0010001011";

constant DISP_CS_IP     : std_logic_vector(9 downto 0) := "0010000001";     -- Used for Jx instructions

constant PORT_00_DX     : std_logic_vector(6 downto 0) := "0000010";        -- EAMUX IN/OUT instruction
constant PORT_00_EA     : std_logic_vector(6 downto 0) := "0000001";        -- EAMUX Segm=00 00:IP or 00:DISP

constant NB_SS_SP       : std_logic_vector(6 downto 0) := "0000100";        -- IP=IP+NBREQ, EAMUX=SS:SP , 100, 101, 110 unused
constant LD_SS_SP       : std_logic_vector(6 downto 0) := "0100100";        -- Load new IP from MDBUS & out=SS:SP   

constant LD_MD_IP       : std_logic_vector(9 downto 0) := "0100000001";     -- Load new IP from MDBUS (e.g. RET instruction)    
constant LD_CS_IP       : std_logic_vector(9 downto 0) := "0110000001";     -- Load new IP (e.g. RET instruction)   
constant EA_CS_IP       : std_logic_vector(9 downto 0) := "1000001001";     -- Load new IP (e.g. RET instruction)   
constant IPB_CS_IP      : std_logic_vector(9 downto 0) := "1110000001";     -- Select IPBUS=IPREG   

constant MD_EA2_DS      : std_logic_vector(9 downto 0) := "0100011011";     -- IP<-MD, addr=DS:EA2

-- SELALUA/B or SELDREG(2 downto 0)
constant REG_AX     : std_logic_vector(3 downto 0) := "0000";               -- W=1 Into ALUBUS A or B
constant REG_CX     : std_logic_vector(3 downto 0) := "0001";
constant REG_DX     : std_logic_vector(3 downto 0) := "0010";
constant REG_BX     : std_logic_vector(3 downto 0) := "0011";
constant REG_SP     : std_logic_vector(3 downto 0) := "0100";
constant REG_BP     : std_logic_vector(3 downto 0) := "0101";
constant REG_SI     : std_logic_vector(3 downto 0) := "0110";
constant REG_DI     : std_logic_vector(3 downto 0) := "0111";
constant REG_DATAIN : std_logic_vector(3 downto 0) := "1000";               -- Pass data_in to ALU
constant REG_MDBUS  : std_logic_vector(3 downto 0) := "1111";               -- Pass memory bus (mdbus) to ALU

-- Only for SELALUB
constant REG_CONST1 : std_logic_vector(3 downto 0) := "1001";               -- Used for INC/DEC function, W=0/1
constant REG_CONST2 : std_logic_vector(3 downto 0) := "1010";               -- Used for POP/PUSH function W=1

-- W+SELDREG 
constant REG_AH     : std_logic_vector(3 downto 0) := "0100";               -- W=1 SELDREG=AH


---------------------------------------------------------------
-- ALU Operations 
-- Use ireg(5 downto 3) / modrm(5 downto 3) / ireg(3 downto 0)
-- Constants for 
---------------------------------------------------------------
constant ALU_ADD    : std_logic_vector(6 downto 0) := "0000000";
constant ALU_OR     : std_logic_vector(6 downto 0) := "0000001";        
constant ALU_ADC    : std_logic_vector(6 downto 0) := "0000010";        
constant ALU_SBB    : std_logic_vector(6 downto 0) := "0000011";
constant ALU_AND    : std_logic_vector(6 downto 0) := "0000100";
constant ALU_SUB    : std_logic_vector(6 downto 0) := "0000101";
constant ALU_XOR    : std_logic_vector(6 downto 0) := "0000110";
constant ALU_CMP    : std_logic_vector(6 downto 0) := "0000111";        -- See also ALU_CMPS
constant ALU_TEST0  : std_logic_vector(6 downto 0) := "0001000";             
constant ALU_TEST1  : std_logic_vector(6 downto 0) := "0001101";             

-- Random assignment, these can be changed.
constant ALU_PUSH   : std_logic_vector(6 downto 0) := "0001001";        -- Used for PUSH (SUB)
constant ALU_POP    : std_logic_vector(6 downto 0) := "0001010";        -- Used for POP  (ADD)
constant ALU_REGL   : std_logic_vector(6 downto 0) := "0001011";        -- alureg(15..0)  (latched alu_busb)
constant ALU_REGH   : std_logic_vector(6 downto 0) := "0111011";        -- alureg(31..16) (latched alu_busa)
constant ALU_PASSA  : std_logic_vector(6 downto 0) := "0001100";        -- abus_s only
constant ALU_TEMP   : std_logic_vector(6 downto 0) := "1111001";        -- Used to select temp/scratchpad register (80186 only)

-- CONST & instr.irg(3 downto 0)
constant ALU_SAHF   : std_logic_vector(6 downto 0) := "0001110";        -- AH -> Flags

-- CONST & instr.irg(3 downto 0)
constant ALU_LAHF   : std_logic_vector(6 downto 0) := "0001111";        -- Flags->ALUBUS (->AH)

-- CONSTANT & instr.ireg(1) & modrm.reg(5 downto 3) 
-- CONSTANT=001
constant ALU_ROL1   : std_logic_vector(6 downto 0) := "0010000";        -- count=1
constant ALU_ROR1   : std_logic_vector(6 downto 0) := "0010001";        
constant ALU_RCL1   : std_logic_vector(6 downto 0) := "0010010";    
constant ALU_RCR1   : std_logic_vector(6 downto 0) := "0010011";    
constant ALU_SHL1   : std_logic_vector(6 downto 0) := "0010100";    
constant ALU_SHR1   : std_logic_vector(6 downto 0) := "0010101";    
constant ALU_SAR1   : std_logic_vector(6 downto 0) := "0010111";
constant ALU_ROL    : std_logic_vector(6 downto 0) := "0011000";        -- Count in CL  
constant ALU_ROR    : std_logic_vector(6 downto 0) := "0011001";    
constant ALU_RCL    : std_logic_vector(6 downto 0) := "0011010";    
constant ALU_RCR    : std_logic_vector(6 downto 0) := "0011011";    
constant ALU_SHL    : std_logic_vector(6 downto 0) := "0011100";    
constant ALU_SHR    : std_logic_vector(6 downto 0) := "0011101";    
constant ALU_SAR    : std_logic_vector(6 downto 0) := "0011111";
    
-- CONST & modrm.reg(5 downto 3)/instr.ireg(5 downto 3)  
constant ALU_INC    : std_logic_vector(6 downto 0) := "0100000";        -- Increment
constant ALU_DEC    : std_logic_vector(6 downto 0) := "0100001";        -- Decrement also used for LOOP/JCXZ

constant ALU_CLRTIF : std_logic_vector(6 downto 0) := "0100010";        -- Clear TF/IF flag, used for INT
constant ALU_CMPS   : std_logic_vector(6 downto 0) := "0100111";        -- Compare String ALUREG-MDBUS
constant ALU_SCAS   : std_logic_vector(6 downto 0) := "0101111";        -- AX/AL-MDBUS, no SEXT

-- CONST & instr.irg(3 downto 0)  
constant ALU_CMC    : std_logic_vector(6 downto 0) := "0100101";        -- Complement Carry
constant ALU_CLC    : std_logic_vector(6 downto 0) := "0101000";        -- Clear Carry
constant ALU_STC    : std_logic_vector(6 downto 0) := "0101001";        -- Set Carry  
constant ALU_CLI    : std_logic_vector(6 downto 0) := "0101010";        -- Clear interrupt
constant ALU_STI    : std_logic_vector(6 downto 0) := "0101011";        -- Set Interrupt
constant ALU_CLD    : std_logic_vector(6 downto 0) := "0101100";        -- Clear Direction
constant ALU_STD    : std_logic_vector(6 downto 0) := "0101101";        -- Set Direction

-- CONST & modrm.reg(5 downto 3) 
constant ALU_TEST2  : std_logic_vector(6 downto 0) := "0110000";        -- F6/F7
constant ALU_NOT    : std_logic_vector(6 downto 0) := "0110010";        -- F6/F7
constant ALU_NEG    : std_logic_vector(6 downto 0) := "0110011";        -- F6/F7    
constant ALU_MUL    : std_logic_vector(6 downto 0) := "0110100";        -- F6/F7
constant ALU_IMUL   : std_logic_vector(6 downto 0) := "0110101";        -- F6/F7
constant ALU_DIV    : std_logic_vector(6 downto 0) := "0110110";        -- F6/F7
constant ALU_IDIV   : std_logic_vector(6 downto 0) := "0110111";        -- F6/F7
-- Second cycle write DX
constant ALU_MUL2   : std_logic_vector(6 downto 0) := "0111100";        -- F6/F7
constant ALU_IMUL2  : std_logic_vector(6 downto 0) := "0111101";        -- F6/F7
constant ALU_DIV2   : std_logic_vector(6 downto 0) := "0111110";        -- F6/F7
constant ALU_IDIV2  : std_logic_vector(6 downto 0) := "0111111";        -- F6/F7

-- CONST & instr.ireg(3 downto 0)  
constant ALU_SEXT   : std_logic_vector(6 downto 0) := "0111000";        -- Used for CBW
constant ALU_SEXTW  : std_logic_vector(6 downto 0) := "0111001";        -- Used for CWD

-- CONSTANT &  & instr.ireg(1) & instr.ireg(5 downto 3) 
constant ALU_AAM    : std_logic_vector(6 downto 0) := "1000010";
constant ALU_AAD    : std_logic_vector(6 downto 0) := "1001010";    
constant ALU_DAA    : std_logic_vector(6 downto 0) := "1001100";        
constant ALU_DAS    : std_logic_vector(6 downto 0) := "1001101";        
constant ALU_AAA    : std_logic_vector(6 downto 0) := "1001110";        
constant ALU_AAS    : std_logic_vector(6 downto 0) := "1001111";        

constant ALU_ADD_SE : std_logic_vector(6 downto 0) := "1100000";
constant ALU_OR_SE  : std_logic_vector(6 downto 0) := "1100001";        
constant ALU_ADC_SE : std_logic_vector(6 downto 0) := "1100010";        
constant ALU_SBB_SE : std_logic_vector(6 downto 0) := "1100011";
constant ALU_AND_SE : std_logic_vector(6 downto 0) := "1100100";
constant ALU_SUB_SE : std_logic_vector(6 downto 0) := "1100101";
constant ALU_XOR_SE : std_logic_vector(6 downto 0) := "1100110";
constant ALU_CMP_SE : std_logic_vector(6 downto 0) := "1100111";                            

END cpu86pack;
