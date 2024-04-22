------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai, Ch. V. Kalyani
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
--------------------------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.mem_ASIC_components.all;
use ahir.types.all;
use ahir.utilities.all;

-- Entity to instantiate different available memory cuts based on the 
-- address_width and data_width generics passed.
entity dpmem_selector is
	generic(address_width: integer:=8; data_width: integer:=8);
	port (ADDR_0 : in std_logic_vector(address_width-1 downto 0 );
		ADDR_1 : in std_logic_vector(address_width-1 downto 0 );
		ENABLE_0_BAR : in std_logic;
		ENABLE_1_BAR : in std_logic;
		WRITE_0_BAR : in std_logic;
		WRITE_1_BAR : in std_logic;
		DATAIN_0  : in std_logic_vector(data_width-1 downto 0);
		DATAIN_1  : in std_logic_vector(data_width-1 downto 0);
		DATAOUT_0  : out std_logic_vector(data_width-1 downto 0);
		DATAOUT_1  : out std_logic_vector(data_width-1 downto 0);
		CLK, RESET: in std_logic);
end entity dpmem_selector;

architecture StructGen of dpmem_selector is
	signal TIE_HIGH, TIE_LOW: std_logic;
        signal TIE_LOW_2, TIE_HIGH_2: std_logic_vector(1 downto 0);
        signal TIE_LOW_3: std_logic_vector(2 downto 0);
        signal TIE_LOW_4: std_logic_vector(3 downto 0);
begin
	TIE_HIGH <= '1';
	TIE_LOW <= '0';
	TIE_LOW_2 <= (others => '0');
	TIE_HIGH_2 <= (others => '1');
	TIE_LOW_3 <= (others => '0');
	TIE_LOW_4 <= (others => '0');
  dpram_5X4_gen: if (address_width = 5) and (data_width = 4) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(3 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(3 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(4 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(4 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: dpram_5X4
   port map (AB => ADDR_0, A2 => ADDR_1, CE1 => CLK, CE2 => CLK, WEBB => WRITE_0_BAR, WEB2 => WRITE_1_BAR, OEB1 => TIE_LOW, OEB2 => TIE_LOW, CSB1 => ENABLE_0_BAR, CSB2 => ENABLE_1_BAR, I1 => DATAIN_0, I2 => DATAIN_1, O1 => DATAOUT_0, O2 => DATAOUT_1);
         end block;
  end generate dpram_5X4_gen;
  obc11_dpram_4X8_gen: if (address_width = 4) and (data_width = 8) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(7 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(7 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(3 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(3 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: obc11_dpram_4X8
   port map (AB => ADDR_0, A2 => ADDR_1, CE1 => CLK, CE2 => CLK, WEBB => WRITE_0_BAR, WEB2 => WRITE_1_BAR, OEB1 => TIE_LOW, OEB2 => TIE_LOW, CSB1 => ENABLE_0_BAR, CSB2 => ENABLE_1_BAR, I1 => DATAIN_0, I2 => DATAIN_1, O1 => DATAOUT_0, O2 => DATAOUT_1);
         end block;
  end generate obc11_dpram_4X8_gen;
  dpram_5X8_gen: if (address_width = 5) and (data_width = 8) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(7 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(7 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(4 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(4 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: dpram_5X8
   port map (AB => ADDR_0, A2 => ADDR_1, CE1 => CLK, CE2 => CLK, WEBB => WRITE_0_BAR, WEB2 => WRITE_1_BAR, OEB1 => TIE_LOW, OEB2 => TIE_LOW, CSB1 => ENABLE_0_BAR, CSB2 => ENABLE_1_BAR, I1 => DATAIN_0, I2 => DATAIN_1, O1 => DATAOUT_0, O2 => DATAOUT_1);
         end block;
  end generate dpram_5X8_gen;
end StructGen;

