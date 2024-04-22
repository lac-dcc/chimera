-- Copyright (c) 2010 Gregory Estrade (greg@torlus.com)
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity gen_tb is
end gen_tb;

architecture sim of gen_tb is
signal SW			: std_logic_vector(9 downto 0);
		
signal HEX0		: std_logic_vector(6 downto 0);
signal HEX1		: std_logic_vector(6 downto 0);
signal HEX2		: std_logic_vector(6 downto 0);
signal HEX3		: std_logic_vector(6 downto 0);
		
signal KEY			: std_logic_vector(3 downto 0);
				
signal LEDR		: std_logic_vector(9 downto 0);
signal LEDG		: std_logic_vector(7 downto 0);
		
signal CLOCK_27	: std_logic_vector(1 downto 0);
		
signal DRAM_ADDR	: std_logic_vector(11 downto 0);
signal DRAM_BA_0	: std_logic;
signal DRAM_BA_1	: std_logic;
signal DRAM_CAS_N	: std_logic;
signal DRAM_CKE	: std_logic;
signal DRAM_CLK	: std_logic;
signal DRAM_CS_N	: std_logic;
signal DRAM_DQ		: std_logic_vector(15 downto 0);
signal DRAM_LDQM	: std_logic;
signal DRAM_RAS_N	: std_logic;
signal DRAM_UDQM	: std_logic;
signal DRAM_WE_N	: std_logic;
		
signal FL_ADDR		: std_logic_vector(21 downto 0);
signal FL_DQ		: std_logic_vector(7 downto 0);
signal FL_OE_N		: std_logic;
signal FL_RST_N	: std_logic;
signal FL_WE_N		: std_logic;
		
signal SRAM_ADDR	: std_logic_vector(17 downto 0);
signal SRAM_CE_N	: std_logic;
signal SRAM_DQ		: std_logic_vector(15 downto 0);
signal SRAM_LB_N	: std_logic;
signal SRAM_OE_N	: std_logic;
signal SRAM_UB_N	: std_logic;
signal SRAM_WE_N	: std_logic;

signal RESET		: std_logic;

begin

-- SRAM
vram : entity work.sram_sim 
port map(
	A	=> SRAM_ADDR,
	CEn	=> SRAM_CE_N,
	OEn	=> SRAM_OE_N,
	WEn	=> SRAM_WE_N,
	UBn	=> SRAM_UB_N,
	LBn	=> SRAM_LB_N,
	DQ	=> SRAM_DQ
);

-- FLASH
flash : entity work.flash_sim
port map(
	A	=> FL_ADDR,
	OEn	=> FL_OE_N,
	D	=> FL_DQ
);

-- SDRAM
sdram : entity work.sdram_sim
port map(
	DRAM_ADDR	=> DRAM_ADDR,
	DRAM_BA_0	=> DRAM_BA_0,
	DRAM_BA_1	=> DRAM_BA_1,
	DRAM_CAS_N	=> DRAM_CAS_N,
	DRAM_CKE	=> DRAM_CKE,
	DRAM_CLK	=> DRAM_CLK,
	DRAM_CS_N	=> DRAM_CS_N,
	DRAM_DQ		=> DRAM_DQ,
	DRAM_LDQM	=> DRAM_LDQM,
	DRAM_RAS_N	=> DRAM_RAS_N,
	DRAM_UDQM	=> DRAM_UDQM,
	DRAM_WE_N	=> DRAM_WE_N
);

gen : entity work.DE1_Toplevel
port map(
	SW			=> SW,
		
	HEX0		=> HEX0,
	HEX1		=> HEX1,
	HEX2		=> HEX2,
	HEX3		=> HEX3,
		
	KEY			=> KEY,
				
	LEDR		=> LEDR,
	LEDG		=> LEDG,
		
	CLOCK_27	=> CLOCK_27,
		
	DRAM_ADDR	=> DRAM_ADDR,
	DRAM_BA_0	=> DRAM_BA_0,
	DRAM_BA_1	=> DRAM_BA_1,
	DRAM_CAS_N	=> DRAM_CAS_N,
	DRAM_CKE	=> DRAM_CKE,
	DRAM_CLK	=> DRAM_CLK,
	DRAM_CS_N	=> DRAM_CS_N,
	DRAM_DQ		=> DRAM_DQ,
	DRAM_LDQM	=> DRAM_LDQM,
	DRAM_RAS_N	=> DRAM_RAS_N,
	DRAM_UDQM	=> DRAM_UDQM,
	DRAM_WE_N	=> DRAM_WE_N,
		
	FL_ADDR		=> FL_ADDR,
	FL_DQ		=> FL_DQ,
	FL_OE_N		=> FL_OE_N,
	FL_RST_N	=> FL_RST_N,
	FL_WE_N		=> FL_WE_N,
		
	SRAM_ADDR	=> SRAM_ADDR,
	SRAM_CE_N	=> SRAM_CE_N,
	SRAM_DQ		=> SRAM_DQ,
	SRAM_LB_N	=> SRAM_LB_N,
	SRAM_OE_N	=> SRAM_OE_N,
	SRAM_UB_N	=> SRAM_UB_N,
	SRAM_WE_N	=> SRAM_WE_N
);

SW(9 downto 1) <= "000000000";
KEY <= "1111";

-- CLOCK (27 MHz)
process
begin
	CLOCK_27 <= "00";
	wait for 18.5185 ns;
	CLOCK_27 <= "11";
	wait for 18.5185 ns;
end process;

-- RESET
process
begin
--	SW(0) <= '1';
--	wait for 200 ns;
	SW(0) <= '0';
	wait;
end process;
RESET <= SW(0);

end sim;