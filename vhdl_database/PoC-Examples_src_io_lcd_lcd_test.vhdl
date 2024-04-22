-- EMACS settings: -*-  tab-width:2  -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
--
-------------------------------------------------------------------------------
-- Description:  LCD Test Application designed for the
--               Spartan-3 Evaluation Kit.
--
-- Authors:      Thomas B. Preußer <thomas.preusser@utexas.edu>
-------------------------------------------------------------------------------
-- Copyright 2007-2014 Technische Universität Dresden - Germany
--                     Chair for VLSI-Design, Diagnostics and Architecture
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

library PoC;
use PoC.physical.all;

entity lcd_test is
  generic(
    CLOCK_FREQ : freq     := 100 MHz;
    DATA_WIDTH : positive := 8
  );
  port(
    -- Global Reset / Clock
    rst, clk : in std_logic;

    -- LCD Control Signals
    lcd_e   : out   std_logic;
    lcd_rs  : out   std_logic;
    lcd_rw  : out   std_logic;
    lcd_dat : inout std_logic_vector(7 downto 0)
  );
end entity lcd_test;


library IEEE;
use IEEE.numeric_std.all;

library PoC;
use PoC.lcd.all;

architecture rtl of lcd_test is

  ----------------------------------------------------------------------------
  -- Transmission Sequence
  type tSeq is array (natural range<>) of std_logic_vector(8 downto 0);
  constant OutSeq : tSeq := (
    '1' & lcd_functionset(DATA_WIDTH, 2, 0),  -- two line, 5x8 font
    '1' & lcd_displayctrl(true, false, false),-- on, no cursor, no blink
    "100000001",  -- Display Clear:    "00000001"
    '1' & lcd_entrymode(true, false),   -- inc, no shift
    "10000001-",  -- Return Home:      "0000001-"
    "001010000",  -- P
    "001100001",  -- a
    "001110011",  -- s
    "001110011",  -- s
    "111000000",  -- Goto 0x40
    "001010100",  -- T
    "001100101",  -- e
    "001110011",  -- s
    "001110100",  -- t
    "011011010"   -- v
  );

  signal SeqCnt : unsigned(3 downto 0) := (others => '0');
  signal Step   : std_logic;

  -- Synchronized Inputs
  signal rst_i : std_logic;

  -- LCD Connectivity
  signal rdy : std_logic;
  signal dat : std_logic_vector(7 downto 0);
  signal stb : std_logic;
  signal cmd : std_logic;

begin
  -- Synchronization of Inputs
  process(clk)
  begin
    if clk'event and clk = '1' then
      rst_i <= rst;
    end if;
  end process;

  -- Instantiate LCD Bit Level Module
  blkLCD: block
    signal lcd_rw_l  : std_logic;
    signal lcd_dat_i : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal lcd_dat_o : std_logic_vector(DATA_WIDTH-1 downto 0);
  begin
    lcd : lcd_dotmatrix
      generic map (
        CLOCK_FREQ => CLOCK_FREQ,
        DATA_WIDTH => DATA_WIDTH
      )
      port map(
        clk => clk,
        rst => rst_i,

        rdy => rdy,
        stb => stb,
        cmd => cmd,
        dat => dat,

        lcd_e     => lcd_e,
        lcd_rs    => lcd_rs,
        lcd_rw    => lcd_rw_l,
        lcd_dat_i => lcd_dat_i,
        lcd_dat_o => lcd_dat_o
      );
    lcd_rw    <= lcd_rw_l;
    lcd_dat_i <= lcd_dat(DATA_WIDTH-1 downto 0);
    process(lcd_rw_l, lcd_dat_o)
    begin
      if lcd_rw_l = '1' then
        lcd_dat <= (others => 'Z');
      else
        lcd_dat                        <= (others => '0');
        lcd_dat(7 downto 8-DATA_WIDTH) <= lcd_dat_o;
      end if;
    end process;
  end block;

  -- Sequence Counter
  process(clk)
  begin
    if clk'event and clk = '1' then
      if rst_i = '1' then
        SeqCnt <= (others => '0');
      elsif Step = '1' then
        SeqCnt <= SeqCnt + 1;
      end if;
    end if;
  end process;
  Step <= rdy when (SeqCnt and to_unsigned(OutSeq'length, SeqCnt'length))
                   /= to_unsigned(OutSeq'length, SeqCnt'length) else '0';

  -- LCD Feed
  process(SeqCnt, Step)
    variable w : std_logic_vector(8 downto 0);
  begin
    --w := OutSeq(to_integer(SeqCnt))
    w := (others => '0');
    for i in OutSeq'range loop
      if i = to_integer(SeqCnt) then
        w := w or OutSeq(i);
      end if;
    end loop;

    stb <= Step;
    cmd <= w(8);
    dat <= w(7 downto 0);
  end process;

end rtl;
