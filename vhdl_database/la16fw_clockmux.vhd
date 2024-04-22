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


entity clockmux is
    generic(
        n_log2 : integer := 2
    );
    port(
        clk_ctl : in std_logic; -- control clock
        clk_sel : in std_logic_vector(n_log2-1 downto 0);
        clk_in  : in std_logic_vector(2**n_log2-1 downto 0);
        clk_out : out std_logic
    );
end clockmux;


architecture behavioral of clockmux is

    type state_t is(
        idle, -- no clock active
        start, -- switch on clock
        stop, -- switch off clock
        active -- clk_out active
    );
    subtype vector_t is std_logic_vector(2**n_log2-1 downto 0);
    
    signal state : state_t := idle;
    signal cur_clk_sel : unsigned(n_log2-1 downto 0);
    signal clk_run_set : vector_t := (others=>'0');
    signal clk_run_get : vector_t;
    signal clk_running_set : vector_t := (others=>'0');
    signal clk_running_get : vector_t;
    signal clk_in_gated : vector_t;

    -- FIXME: which signal needs TIG so it's ignored that cur_clk_sel switches the clk_out signal?
    attribute TIG : string;
    attribute TIG of clk_in : signal is "TRUE";

begin

    gen : for i in 0 to 2**n_log2-1 generate
    begin
        signal_run_inst : entity work.syncsignal
            generic map(
                negedge => true --shift on neg edge
            )
            port map(
                clk_output => clk_in(i),
                input      => clk_run_set(i),
                output     => clk_run_get(i)
            );
        signal_running_inst : entity work.syncsignal
            generic map(
                negedge => true --shift on neg edge
            )
            port map(
                clk_output => clk_ctl,
                input      => clk_running_set(i),
                output     => clk_running_get(i)
            );
        clk_running_set(i) <= clk_run_get(i);
        --clk_in_gated(i) <= clk_in(i) and clk_run_get(i);
        clk_in_gated(i) <= clk_in(i) when (clk_run_get(i) = '1') else '0';
    end generate gen;
    
    clk_out <= clk_in_gated(to_integer(cur_clk_sel));

    process(clk_ctl)
    begin
    
        if rising_edge(clk_ctl) then
            if (state = idle) then
                cur_clk_sel <= unsigned(clk_sel);
                clk_run_set(to_integer(unsigned(clk_sel))) <= '1';
                state <= start;
            elsif (state = start) then
                if (clk_running_get(to_integer(cur_clk_sel)) = '1') then
                    state <= active;
                end if;
            elsif (state = stop) then
                if (clk_running_get(to_integer(cur_clk_sel)) = '0') then
                    state <= idle;
                end if;
            elsif (state = active) then
                if (unsigned(clk_sel) /= cur_clk_sel) then
                    state <= stop;
                    clk_run_set(to_integer(cur_clk_sel)) <= '0';
                end if;
            end if;
        end if;
        
    end process;
    
end behavioral;
