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
entity spmem_selector is
	generic(address_width: integer:=8; data_width: integer:=8);
	port (ADDR : in std_logic_vector(address_width-1 downto 0 );
		CLK : in std_logic;
	        RESET: in std_logic;
		WRITE_BAR: in std_logic;
		ENABLE_BAR: in std_logic;
		DATAIN  : in std_logic_vector(data_width-1 downto 0);
		DATAOUT  : out std_logic_vector(data_width-1 downto 0));
end entity spmem_selector;

architecture StructGen of spmem_selector is

  signal TIE_HIGH, TIE_LOW: std_logic;
  signal TIE_LOW_2, TIE_HIGH_2: std_logic_vector(1 downto 0);
  signal TIE_LOW_3: std_logic_vector(2 downto 0);
  signal TIE_LOW_4: std_logic_vector(3 downto 0);

begin
  
  TIE_HIGH <= '1';
  TIE_LOW  <= '0';
  TIE_LOW_2 <= (others => '0');
  TIE_HIGH_2 <= (others => '1');
  TIE_LOW_3 <= (others => '0');
  TIE_LOW_4 <= (others => '0');
  SRAM_64X4_gen: if (address_width = 6) and (data_width = 4) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(3 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(3 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(5 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(5 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_64X4
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_64X4_gen;
  SRAM_64X32_gen: if (address_width = 6) and (data_width = 32) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(31 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(31 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(5 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(5 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_64X32
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_64X32_gen;
  SRAM_256X8_gen: if (address_width = 8) and (data_width = 8) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(7 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(7 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(7 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(7 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_256X8
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_256X8_gen;
  SRAM_256X32_gen: if (address_width = 8) and (data_width = 32) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(31 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(31 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(7 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(7 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_256X32
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_256X32_gen;
  SRAM_8192X8_gen: if (address_width = 13) and (data_width = 8) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(7 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(7 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(12 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(12 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_8192X8
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_8192X8_gen;
  SRAM_32X32_gen: if (address_width = 5) and (data_width = 32) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(31 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(31 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(4 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(4 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_32X32
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_32X32_gen;
  SRAM_128X22_gen: if (address_width = 7) and (data_width = 22) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(21 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(21 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(6 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(6 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_128X22
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_128X22_gen;
  SRAM_1024X8_gen: if (address_width = 10) and (data_width = 8) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(7 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(7 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(9 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(9 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_1024X8
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_1024X8_gen;
  SRAM_1024X64_gen: if (address_width = 10) and (data_width = 64) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(63 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(63 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(9 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(9 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_1024X64
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_1024X64_gen;
  SRAM_64X128_gen: if (address_width = 6) and (data_width = 128) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(127 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(127 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(5 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(5 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_64X128
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_64X128_gen;
  SRAM_64X67_gen: if (address_width = 6) and (data_width = 67) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(66 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(66 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(5 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(5 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_64X67
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_64X67_gen;
  SRAM_64X24_gen: if (address_width = 6) and (data_width = 24) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(23 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(23 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(5 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(5 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_64X24
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_64X24_gen;
  SRAM_64X90_gen: if (address_width = 6) and (data_width = 90) generate
     mc: block 
            signal DATA_TIE_LOW  : std_logic_vector(89 downto 0); 
            signal DATA_TIE_HIGH : std_logic_vector(89 downto 0); 
            signal ADDR_TIE_LOW  : std_logic_vector(5 downto 0); 
            signal ADDR_TIE_HIGH : std_logic_vector(5 downto 0); 
         begin 
              DATA_TIE_LOW <= (others => '0'); 
              DATA_TIE_HIGH <= (others => '1'); 
              ADDR_TIE_LOW <= (others => '0'); 
              ADDR_TIE_HIGH <= (others => '1'); 
               inst: SRAM_64X90
   port map ( A => ADDR,  CLK => CLK, WEB => WRITE_BAR, BWEB => DATA_TIE_LOW, CEB => ENABLE_BAR,  D => DATAIN, Q => DATAOUT,  SLP => TIE_LOW, SD => TIE_LOW, CEBM => TIE_HIGH, WEBM => TIE_HIGH, BWEBM => DATA_TIE_HIGH, AM => ADDR_TIE_HIGH, DM => DATA_TIE_HIGH, BIST  => TIE_LOW);
         end block;
  end generate SRAM_64X90_gen;
end StructGen;

