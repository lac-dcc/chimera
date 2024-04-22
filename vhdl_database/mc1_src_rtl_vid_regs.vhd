----------------------------------------------------------------------------------------------------
-- Copyright (c) 2019 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.vid_types.all;

----------------------------------------------------------------------------------------------------
-- Video control registers.
----------------------------------------------------------------------------------------------------

entity vid_regs is
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;

    i_restart_frame : in std_logic;
    i_write_enable : in std_logic;
    i_write_addr : in std_logic_vector(2 downto 0);
    i_write_data : in std_logic_vector(23 downto 0);

    o_regs : out T_VID_REGS
  );
end vid_regs;

architecture rtl of vid_regs is
  constant C_DEFAULT_ADDR : std_logic_vector(23 downto 0) := x"000000";
  constant C_DEFAULT_XOFFS : std_logic_vector(23 downto 0) := x"000000";
  constant C_DEFAULT_XINCR : std_logic_vector(23 downto 0) := x"004000";
  constant C_DEFAULT_HSTRT : std_logic_vector(23 downto 0) := x"000000";
  constant C_DEFAULT_HSTOP : std_logic_vector(23 downto 0) := x"000000";
  constant C_DEFAULT_CMODE : std_logic_vector(23 downto 0) := x"000002";
  constant C_DEFAULT_RMODE : std_logic_vector(23 downto 0) := x"000135";

  signal s_regs : T_VID_REGS;
  signal s_next_regs : T_VID_REGS;
begin
  -- Write logic.
  s_next_regs.ADDR <= i_write_data when i_write_enable = '1' and i_write_addr = "000" else
                      C_DEFAULT_ADDR when i_restart_frame = '1' else
                      s_regs.ADDR;
  s_next_regs.XOFFS <= i_write_data when i_write_enable = '1' and i_write_addr = "001" else
                       C_DEFAULT_XOFFS when i_restart_frame = '1' else
                       s_regs.XOFFS;
  s_next_regs.XINCR <= i_write_data when i_write_enable = '1' and i_write_addr = "010" else
                       C_DEFAULT_XINCR when i_restart_frame = '1' else
                       s_regs.XINCR;
  s_next_regs.HSTRT <= i_write_data when i_write_enable = '1' and i_write_addr = "011" else
                       C_DEFAULT_HSTRT when i_restart_frame = '1' else
                       s_regs.HSTRT;
  s_next_regs.HSTOP <= i_write_data when i_write_enable = '1' and i_write_addr = "100" else
                       C_DEFAULT_HSTOP when i_restart_frame = '1' else
                       s_regs.HSTOP;
  s_next_regs.CMODE <= i_write_data when i_write_enable = '1' and i_write_addr = "101" else
                       C_DEFAULT_CMODE when i_restart_frame = '1' else
                       s_regs.CMODE;
  s_next_regs.RMODE <= i_write_data when i_write_enable = '1' and i_write_addr = "110" else
                       C_DEFAULT_RMODE when i_restart_frame = '1' else
                       s_regs.RMODE;

  -- Clocked registers.
  process(i_clk, i_rst)
  begin
    if i_rst = '1' then
      s_regs.ADDR <= C_DEFAULT_ADDR;
      s_regs.XOFFS <= C_DEFAULT_XOFFS;
      s_regs.XINCR <= C_DEFAULT_XINCR;
      s_regs.HSTRT <= C_DEFAULT_HSTRT;
      s_regs.HSTOP <= C_DEFAULT_HSTOP;
      s_regs.CMODE <= C_DEFAULT_CMODE;
      s_regs.RMODE <= C_DEFAULT_RMODE;
    elsif rising_edge(i_clk) then
      s_regs <= s_next_regs;
    end if;
  end process;

  -- Outputs.
  o_regs <= s_regs;
end rtl;
