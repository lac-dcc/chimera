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


entity input_shiftreg is
    port(
        clk       : in std_logic;
        shift_in  : in std_logic;
        data_in   : in std_logic_vector(15 downto 0);
        shift_out : in std_logic;
        data_out  : out std_logic_vector(15 downto 0)
    );
end input_shiftreg;


architecture behavioral of input_shiftreg is

    subtype vector16_t is std_logic_vector(15 downto 0);
    type vector16_arr_t is array (natural range <>) of vector16_t;
    
    signal shiftreg      : vector16_arr_t(15 downto 0);
    signal vector16_null : vector16_t;

begin

    vector16_null <= (others=>'0');
    data_out <= shiftreg(0);

    process(clk)
    begin
        if (rising_edge(clk)) then
            if (shift_in = '1') then
                -- shift input data into shift regs (msb is first sample)
                for i in 0 to 15 loop
                    shiftreg(i) <= shiftreg(i)(14 downto 0) & data_in(i);
                end loop;
            elsif (shift_out = '1') then
                shiftreg <= vector16_null & shiftreg(15 downto 1);
            end if;
        end if;
    end process;
    
end behavioral;
