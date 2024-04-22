--------------------------------------------------------------------------------
-- SPDX-License-Identifier: GPL-3.0-or-later
-- SPDX-FileType: SOURCE
-- SPDX-FileCopyrightText: (c) 2005-2008 Peter Wendrich (pwsoft@syntiac.com)
--------------------------------------------------------------------------------
--! @title Generic Read/Write RAM (no rAddrReg for writing)
--! @author Peter Wendrich
--! @version 0.2.0
--!
--! @copyright  (c) 2005-2008 by Peter Wendrich <pwsoft@syntiac.com>
--! <http://www.syntiac.com/fpga64.html>
--!
--! Changelog:
--!
--! - Version 0.2.0 (2016/04) by Dar (<darfpga@aol.fr>)
--!   - Remove address register when writing
-- -----------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity gen_ram is
  generic (
    dwidth : integer := 8;
    awidth : integer := 10
  );
  port (
    clk  : in  std_logic;
    we   : in  std_logic;
    addr : in  std_logic_vector((awidth - 1) downto 0);
    d    : in  std_logic_vector((dwidth - 1) downto 0);
    q    : out std_logic_vector((dwidth - 1) downto 0)
  );
end entity gen_ram;

-- -----------------------------------------------------------------------

architecture rtl of gen_ram is
  subtype addressRange is integer range 0 to ((2 ** awidth) - 1);
  type ramdef is array(addressRange) of std_logic_vector((dwidth - 1) downto 0);
  signal ram : ramdef;
begin

  -- ---------------------------------------------------------------------
  -- Memory write
  -- ---------------------------------------------------------------------
  process (clk) is
  begin
    if rising_edge(clk) then
      if (we = '1') then
        ram(to_integer(unsigned(addr))) <= d;
      end if;
    end if;
  end process;

  -- ---------------------------------------------------------------------
  -- Memory read
  -- ---------------------------------------------------------------------
  process (clk) is
  begin
    if rising_edge(clk) then
      q <= ram(to_integer(unsigned(addr)));
    end if;
  end process;

end architecture rtl;
