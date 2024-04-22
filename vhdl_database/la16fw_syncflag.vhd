--
-- This file is part of the la16fw project.
--
-- Copyright (C) 2014-2015 Gregor Anich
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity syncflag is
    generic(
        n : integer := 3
    );
    port(
        clk_input  : in std_logic;
        clk_output : in std_logic;
        input      : in std_logic;
        output     : out std_logic
    );
end syncflag;

-- http://forums.xilinx.com/t5/Implementation/Attributes-in-Asynchronous-Input-Synchronization-issue-warnings/td-p/122912
--
--  TIG="TRUE" - Specifies a timing ignore for the asynchronous input
--  IOB="FALSE" = Specifies to not place the register into the IOB allowing 
--                both synchronization registers to exist in the same slice 
--                allowing for the shortest propagation time between them
--  ASYNC_REG="TRUE" - Specifies registers will be receiving asynchronous data 
--                     input to allow for better timing simulation 
--                     characteristics
--  SHIFT_EXTRACT="NO" - Specifies to the synthesis tool to not infer an SRL
--  HBLKNM="sync_reg" - Specifies to pack both registers into the same slice

architecture behavioral of syncflag is
    signal sync : unsigned(n-1 downto 0) := (others=>'0');
    signal flag_toggle : std_logic := '0';
    signal sync_in : std_logic := '0';

    attribute TIG : string;
    attribute IOB : string;
    attribute ASYNC_REG : string;
    attribute SHIFT_EXTRACT : string;
    attribute HBLKNM : string;

    attribute TIG of sync_in : signal is "TRUE";
  --attribute ASYNC_REG of sync_in : signal is "TRUE";
    --attribute SHIFT_EXTRACT of sync : signal is "NO";
    --attribute HBLKNM of sync : signal is "sync_reg";

begin

    process (clk_input)
    begin
        if rising_edge(clk_input) then
            flag_toggle <= flag_toggle xor input;
            sync_in <= flag_toggle;
        end if;
    end process;
    
    process (clk_output)
    begin
        if rising_edge(clk_output) then
            sync <= sync(sync'high-1 downto 0) & sync_in;
        end if;
    end process;
    output <= sync(sync'high) xor sync(sync'high-1);
    
end behavioral;
