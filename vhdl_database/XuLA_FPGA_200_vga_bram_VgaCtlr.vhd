------------------------------------------------------------------------------
-- VgaCtlr.vhd - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 2005-2006 DRI Technologies (Proprietorship)             **
-- ** All rights reserved.                                                  **
-- **                         www.dritech.net                               **
-- ** DRI TECHNOLOGIES IS PROVIDING THIS DESIGN,CODE,OR INFORMATION "AS IS".**
-- ** DRI TECHNOLOGIES EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH     **
-- ** RESPECT TO THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT      **
-- ** LIMITED TO ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION **
-- ** IS FREE FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF            **
-- ** MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, AND YOU ARE     **
-- ** RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR         **
-- ** IMPLEMENTATION.                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          VgaCtlr.vhd
-- Version:           1.00
-- Date:              FRI Oct. 6, 2006
-- Author:            Massoud Shakeri
-- VHDL Standard:     VHDL'93
-- Description:       A Character Generator which can display 80x50 characters
--                    each in 8x8 pixels in black/white. It reads a RAM and ROM
--                    which are dual-port and are connected to OPB bus of
--                    MicroBlaze.
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   Clk signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "Reset", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   Clk enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package VgaCtlrPckg is

  component VgaCtlr
    port (
      Reset   : in  std_logic;                      -- reset
      Clk     : in  std_logic;                      -- 50 MHZ Clk
      Hsync_n : out std_logic;                      -- horizontal (line) sync
      Vsync_n : out std_logic;                      -- vertical (frame) sync
      Rgb     : out std_logic_vector(2 downto 0);   -- red,green,blue colors
      RamAddr : out std_logic_vector(11 downto 0);  -- address to video RAM
      RamData : in  std_logic_vector(7 downto 0);   -- data from video RAM
      RomAddr : out std_logic_vector(11 downto 0);  -- address to ROM
      RomData : in  std_logic_vector(7 downto 0)    -- data from ROM
      );
  end component;

end package;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VgaCtlr is
  port (
    Reset   : in  std_logic;                      -- reset
    Clk     : in  std_logic;                      -- 50 MHZ Clk
    Hsync_n : out std_logic;                      -- horizontal (line) sync
    Vsync_n : out std_logic;                      -- vertical (frame) sync
    Rgb     : out std_logic_vector(2 downto 0);   -- red,green,blue colors
    RamAddr : out std_logic_vector(11 downto 0);  -- address to video RAM
    RamData : in  std_logic_vector(7 downto 0);   -- data from video RAM
    RomAddr : out std_logic_vector(11 downto 0);  -- address to ROM
    RomData : in  std_logic_vector(7 downto 0)    -- data from ROM
    );
end entity VgaCtlr;

architecture VgaCtlr_arch of VgaCtlr is
  component Mux is
    generic (
      C_LEN : integer := 32
      );
    port (
      Mux_in : in  std_logic_vector(0 to C_LEN-1);
      Sel    : in  integer range 0 to C_LEN-1;
      Z      : out std_logic
      );
  end component;
  signal horiz_cnt   : unsigned(10 downto 0);  -- horizontal pixel counter
  signal vert_cnt    : unsigned(9 downto 0);   -- vertical line counter
  signal chr_cnt     : unsigned(11 downto 0);  -- character counter, 12 bit character number
  signal chr_bak_cnt : unsigned(11 downto 0);  -- character counter which stores start of character lines
  signal pixels_reg  : std_logic_vector(7 downto 0);  -- byte register for 4 pixels
  signal blank       : std_logic;       -- video blanking signal
  signal sblank      : std_logic;       -- synchronized video blanking signal
  signal pixel       : std_logic;       -- output, current pixel
  signal clk_25      : std_logic;       -- the 25Mhz Clk for pixels.
-- 800 pixels per line,521 lines, and 60 times per second
begin
  Mux0 : Mux
    generic map (C_LEN => 8)
    port map (
      Mux_in => pixels_reg(7 downto 0),
      Sel    => to_integer(horiz_cnt(2 downto 0)),
      Z      => pixel
      );
  -- RAM & ROM addresses are not synchronized
  RamAddr <= std_logic_vector(chr_cnt(11 downto 0));
  RomAddr <= '0' & RamData(7 downto 0) & std_logic_vector(vert_cnt(2 downto 0));

  -- In Spartan-3 starter kit, Input Clk is 50MHZ, so it must be reduced to half
  -- to show 800 pixels per line(640 are visible),
  --         521 lines (only 400 are visible),
  --         and 60 times per second = 25 MHZ
  clk_PROCESS:
  process (Clk)
  begin
    if Clk'event and Clk = '1' then
      if (clk_25 = '0') then
        clk_25 <= '1';
      else
        clk_25 <= '0';
      end if;
    end if;
  end process;

  -- produces horizontal/vertical sync signals, and counts counters
  -- To reduce the number of comparators, instead of starting from zero
  -- and having two comparators for horizontal & vertical counters,
  -- it starts from another number and just checks MSB of both counters,
  -- so when MSB is 1, it means the counter is bigger than something.
  main_PROCESS :
  process(clk_25, Reset)
  begin
    if Reset = '1' then
      horiz_cnt   <= "01101110000";  -- 1024-144, Reset asynchronously clears pixel counter
      vert_cnt    <= "0110111001";      -- 512 - 71
      chr_cnt     <= (others => '0');
      chr_bak_cnt <= (others => '0');
      Hsync_n     <= '1';               -- sets horizontal sync to inactive
      Vsync_n     <= '1';
    -- horiz. pixel counter increments on rising edge of dot clk_25
    elsif (clk_25'event and clk_25 = '1') then
      -- chr_cnt is the input address of RAM, and data from RAM is the address
      -- of ROM, so it takes two Clk cyscles (with 50MHZ Clk) to have bitmap
      -- of desired character in ROM's data port.
      if blank = '0' and horiz_cnt(2 downto 0) = "110" then
        chr_cnt <= chr_cnt +1;
      end if;
      -- horiz. pixel counter rolls-over after 800 pixels
      if horiz_cnt < to_unsigned(1680, 11) then   -- 1024 +640+16
        horiz_cnt <= horiz_cnt + 1;
      else
        horiz_cnt <= "01101110000";     -- 1024-144
        vert_cnt  <= vert_cnt + 1;
        if vert_cnt(2 downto 0) /= "111" then
          chr_cnt <= chr_bak_cnt;
        else
          chr_bak_cnt <= chr_cnt;
        end if;
      end if;
      if vert_cnt >= to_unsigned(962, 10) then    -- 512 + 400+50
        vert_cnt    <= "0110111001";    -- 512 - 71
        chr_cnt     <= (others => '0');
        chr_bak_cnt <= (others => '0');
      end if;
      -- horiz. sync low in this interval to signal start of new line
      if (horiz_cnt < to_unsigned(976, 11)) then  -- 1024-48
        Hsync_n <= '0';
      else
        Hsync_n <= '1';
      end if;
      if (vert_cnt < to_unsigned(444, 10)) then   -- 512-69
        Vsync_n <= '0';
      else
        Vsync_n <= '1';
      end if;
    end if;
  end process;

  -- blank video outside of visible region: (144,72) -> (784,472)
  blank <= '1' when
           (horiz_cnt >= to_unsigned(1664, 11) or
            horiz_cnt < to_unsigned(1024, 11) or
            vert_cnt >= to_unsigned(912, 10) or
            vert_cnt < to_unsigned(512, 10)
            )
           else '0';

  -- store the blanking signal
  blank_PROCESS:
  process(clk_25, Reset)
  begin
    if Reset = '1' then
      sblank <= '1';
    elsif (clk_25'event and clk_25 = '1') then
      sblank <= blank;
    end if;
  end process;

  rgb_PROCESS:
  process(clk_25, Reset, sblank)
  begin
    if Reset = '1' or sblank = '1' then
      Rgb <= "000";                     -- blank the video on Reset
    elsif (clk_25'event and clk_25 = '1') then
      if pixel = '1' then
        Rgb <= "111";
      else
        Rgb <= "000";
      end if;
    end if;
  end process;

  pixel_PROCESS:
  process(Reset, RomData)
  begin
    -- clear the pixel register on Reset
    if Reset = '1' then
      pixels_reg <= "00000000";
    else
      pixels_reg <= RomData(7 downto 0);
    end if;
  end process;

end VgaCtlr_arch;

------------------------------------------------------------
-- Mux: - entity/architecture pair
-- Mux is a multiplexer with C_LEN inputs and 1 bit output
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mux is
  generic(C_LEN : integer := 32);
  port (
    Mux_in : in  std_logic_vector(0 to C_LEN-1);
    Sel    : in  integer range 0 to C_LEN-1;
    Z      : out std_logic);
end Mux;

architecture RTL_Mux of Mux is
begin
  process (Mux_in, Sel)
  begin
    Z <= '0';
    for I in 0 to C_LEN-1 loop
      if Sel = I then
        Z <= Mux_in(I);
      end if;
    end loop;
  end process;
end RTL_Mux;
