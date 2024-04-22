-- ****
-- T65(b) core. In an effort to merge and maintain bug fixes ....
--
--
-- Ver 303 ost(ML) July 2014
--   "magic" constants converted to vhdl types
-- Ver 300 Bugfixes by ehenciak added
-- MikeJ March 2005
-- Latest version from www.fpgaarcade.com (original www.opencores.org)
--
-- ****
--
-- 65xx compatible microprocessor core
--
-- Version : 0246
--
-- Copyright (c) 2002 Daniel Wallner (jesus@opencores.org)
--
-- All rights reserved
--
-- Redistribution and use in source and synthezised forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- Redistributions in synthesized form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- Neither the name of the author nor the names of other contributors may
-- be used to endorse or promote products derived from this software without
-- specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
--
-- Please report bugs to the author, but before you do so, please
-- make sure that this is not a derivative work and that
-- you have the latest version of this file.
--
-- The latest version of this file can be found at:
--      http://www.opencores.org/cvsweb.shtml/t65/
--
-- Limitations :
--
-- File history :
--

library IEEE;
use IEEE.std_logic_1164.all;

package T65_Pack is

  constant Flag_C : integer := 0;
  constant Flag_Z : integer := 1;
  constant Flag_I : integer := 2;
  constant Flag_D : integer := 3;
  constant Flag_B : integer := 4;
  constant Flag_1 : integer := 5;
  constant Flag_V : integer := 6;
  constant Flag_N : integer := 7;

  type T_Set_BusA_To is
  (
    Set_BusA_To_DI,
    Set_BusA_To_ABC,
    Set_BusA_To_X,
    Set_BusA_To_Y,
    Set_BusA_To_S,
    Set_BusA_To_P,
    Set_BusA_To_DONTCARE
  );
  type T_Set_Addr_To is
  (
    Set_Addr_To_S,
    Set_Addr_To_AD,
    Set_Addr_To_PBR,
    Set_Addr_To_BA
  );
  type T_Write_Data is
  (
    Write_Data_DL,
    Write_Data_ABC,
    Write_Data_X,
    Write_Data_Y,
    Write_Data_S,
    Write_Data_P,
    Write_Data_PCL,
    Write_Data_PCH,
    Write_Data_DONTCARE
  );
  type T_ALU_OP is
  (
  	ALU_OP_OR,	--"0000"
  	ALU_OP_AND,	--"0001"
  	ALU_OP_EOR,	--"0010"
  	ALU_OP_ADC,	--"0011"
  	ALU_OP_EQ1,	--"0100" EQ1 does not change N,Z flags, EQ2/3 does.
  	ALU_OP_EQ2,	--"0101"Not sure yet whats the difference between EQ2&3. They seem to do the same ALU op
  	ALU_OP_CMP,	--"0110"
  	ALU_OP_SBC,	--"0111"
  	ALU_OP_ASL,	--"1000"
  	ALU_OP_ROL,	--"1001"
  	ALU_OP_LSR,	--"1010"
  	ALU_OP_ROR,	--"1011"
  	ALU_OP_BIT,	--"1100"
  	ALU_OP_EQ3,	--"1101"
  	ALU_OP_DEC,	--"1110"
  	ALU_OP_INC,	--"1111"
  	ALU_OP_UNDEF--"----"--may be replaced with any?
  );

  component T65_MCode
  port(
    Mode                    : in  std_logic_vector(1 downto 0);      -- "00" => 6502, "01" => 65C02, "10" => 65816
    IR                      : in  std_logic_vector(7 downto 0);
    MCycle                  : in  std_logic_vector(2 downto 0);
    P                       : in  std_logic_vector(7 downto 0);
    LCycle                  : out std_logic_vector(2 downto 0);
    ALU_Op                  : out T_ALU_Op;
    Set_BusA_To             : out T_Set_BusA_To;-- DI,A,X,Y,S,P
    Set_Addr_To             : out T_Set_Addr_To;-- PC Adder,S,AD,BA
    Write_Data              : out T_Write_Data;-- DL,A,X,Y,S,P,PCL,PCH
    Jump                    : out std_logic_vector(1 downto 0); -- PC,++,DIDL,Rel
    BAAdd                   : out std_logic_vector(1 downto 0);     -- None,DB Inc,BA Add,BA Adj
    BreakAtNA               : out std_logic;
    ADAdd                   : out std_logic;
    AddY                    : out std_logic;
    PCAdd                   : out std_logic;
    Inc_S                   : out std_logic;
    Dec_S                   : out std_logic;
    LDA                     : out std_logic;
    LDP                     : out std_logic;
    LDX                     : out std_logic;
    LDY                     : out std_logic;
    LDS                     : out std_logic;
    LDDI                    : out std_logic;
    LDALU                   : out std_logic;
    LDAD                    : out std_logic;
    LDBAL                   : out std_logic;
    LDBAH                   : out std_logic;
    SaveP                   : out std_logic;
    ALUmore                 : out std_logic;
    Write                   : out std_logic
  );
  end component;

  component T65_ALU
  port(
    Mode    : in  std_logic_vector(1 downto 0);      -- "00" => 6502, "01" => 65C02, "10" => 65C816
    Op      : in  T_ALU_Op;
    BusA    : in  std_logic_vector(7 downto 0);
    BusB    : in  std_logic_vector(7 downto 0);
    P_In    : in  std_logic_vector(7 downto 0);
    P_Out   : out std_logic_vector(7 downto 0);
    Q       : out std_logic_vector(7 downto 0)
  );
  end component;

end;
