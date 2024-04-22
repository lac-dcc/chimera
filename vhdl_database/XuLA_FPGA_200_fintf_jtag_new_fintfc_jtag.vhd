--**********************************************************************
-- Copyright 2013 by XESS Corp <http://www.xess.com>.
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--**********************************************************************


--**********************************************************************
-- Serial flash upload/download via JTAG.
--**********************************************************************

library IEEE, XESS;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use XESS.CommonPckg.all;
use XESS.ClkGenPckg.all;
use XESS.HostIoToSpiPckg.all;
use work.XessBoardPckg.all;

entity fintf_jtag is
  generic (
    ID_G        : std_logic_vector := "00000010";  -- The ID this module responds to.
    BASE_FREQ_G : real             := BASE_FREQ_C;  -- Base frequency in MHz.
    CLK_MUL_G   : natural          := 25;   -- Multiplier for base frequency.
    CLK_DIV_G   : natural          := 3;    -- Divider for base frequency.
    SPI_FREQ_G  : real             := 25.0  -- SPI frequency for SD card interface.
    );
  port (
    fpgaClk_i  : in  std_logic;         -- XuLA 12 MHz clock.
    flashCs_bo : out std_logic;         -- SPI chip-select.
    sclk_o     : out std_logic;         -- SPI clock line.
    mosi_o     : out std_logic;         -- SPI master output to slave input.
    miso_i     : in  std_logic          -- SPI master input from slave output.
    );
end entity;

architecture arch of fintf_jtag is
  constant FREQ_C : real      := (BASE_FREQ_G * real(CLK_MUL_G)) / real(CLK_DIV_G);
  signal clk_s    : std_logic;          -- Clock.
  signal reset_s  : std_logic := LO;    -- Active-high reset.
begin

  -- Generate 100 MHz clock from 12 MHz XuLA clock.
  u0 : ClkGen
    generic map(CLK_MUL_G => CLK_MUL_G, CLK_DIV_G => CLK_DIV_G)
    port map(i            => fpgaClk_i, o => clk_s);

  -- Generate a reset pulse to initialize the modules.
  process (clk_s)
    variable rstCnt_v : integer range 0 to 15 := 10;  -- Set length of rst pulse.
  begin
    if rising_edge(clk_s) then
      reset_s <= HI;                    -- Activate rst.
      if rstCnt_v = 0 then
        reset_s <= LO;                  -- Release rst when counter hits 0.
      else
        rstCnt_v := rstCnt_v - 1;
      end if;
    end if;
  end process;

  -- Instantiate the JTAG-to-SPI interface.
  u1 : HostIoToSpi
    generic map(
      FREQ_G        => FREQ_C,
      SPI_FREQ_G    => SPI_FREQ_G,
      DATA_LENGTH_G => 8,
      CPOL_G        => LO,
      CPHA_G        => HI,
      ID_G          => ID_G,
      SIMPLE_G      => true
      )
    port map(
      reset_i => reset_s,
      clk_i   => clk_s,
      ssel_o  => flashCs_bo,
      sck_o   => sclk_o,
      mosi_o  => mosi_o,
      miso_i  => miso_i
      );

end architecture;
