-- Programs 29W040 Flash through Xilinx Spartan-3 JTAG port.
-- Copyright 2006, 2010 Retromaster
--
--  This file is part of A2601.
--
--  A2601 is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License,
--  or any later version.
--
--  A2601 is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with A2601.  If not, see <http://www.gnu.org/licenses/>.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity Flash is
    port(a: inout std_logic_vector(18 downto 0);
         d: inout std_logic_vector(7 downto 0);
         oe: out std_logic;
         we: out std_logic);
end Flash;

architecture arch of Flash is

    component BSCAN_SPARTAN3
        port(capture: out std_logic;
             drck1: out std_logic;
             drck2: out std_logic;
             reset: out std_logic;
             sel1: out std_logic;
             sel2: out std_logic;
             shift: out std_logic;
             tdi: out std_logic;
             update: out std_logic;
             tdo1: in std_logic;
             tdo2: in std_logic);
    end component;

    component Core is
        port(a: inout std_logic_vector(18 downto 0);
             d: inout std_logic_vector(7 downto 0);
             ce: out std_logic;
             oe: out std_logic;
             we: out std_logic;
             capture: in std_logic;
             drck1: in std_logic;
             drck2: in std_logic;
             sel1: in std_logic;
             sel2: in std_logic;
             tdi: in std_logic;
             tdo1: out std_logic;
             tdo2: out std_logic);
    end component;

    signal capture: std_logic;
    signal drck1: std_logic;
    signal drck2: std_logic;
    signal reset: std_logic;
    signal sel1: std_logic;
    signal sel2: std_logic;
    signal shift: std_logic;
    signal tdi: std_logic;
    signal update: std_logic;
    signal tdo1: std_logic;
    signal tdo2: std_logic;

begin

    Core_inst: Core
        port map(a, d, open, oe, we, capture, drck1, drck2, sel1, sel2, tdi, tdo1, tdo2);

    BSCAN_SPARTAN3_inst : BSCAN_SPARTAN3
    port map (
        capture => capture, -- CAPTURE output from TAP controller
        drck1 => drck1, -- Data register output for USER1 functions
        drck2 => drck2, -- Data register output for USER2 functions
        reset => reset, -- Reset output from TAP controller
        sel1 => sel1, -- USER1 active output
        sel2 => sel2, -- USER2 active output
        shift => shift, -- SHIFT output from TAP controller
        tdi => tdi, -- TDI output from TAP controller
        update => update, -- UPDATE output from TAP controller
        tdo1 => tdo1, -- Data input for USER1 function
        tdo2 => tdo2 -- Data input for USER2 function
    );

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Core is
    port(a: inout std_logic_vector(18 downto 0);
         d: inout std_logic_vector(7 downto 0);
         ce: out std_logic;
         oe: out std_logic;
         we: out std_logic;
         capture: in std_logic;
         drck1: in std_logic;
         drck2: in std_logic;
         sel1: in std_logic;
         sel2: in std_logic;
         tdi: in std_logic;
         tdo1: out std_logic;
         tdo2: out std_logic);
end Core;

architecture arch of Core is

    attribute buffer_type: string;
    attribute buffer_type of drck1: signal is "BUFG";

    subtype cmd_type is std_logic_vector(3 downto 0);

    constant cmd_nop: cmd_type := "0000";
    constant cmd_program: cmd_type := "0001";
    constant cmd_read: cmd_type := "0010";
    constant cmd_erase: cmd_type := "0011";
    constant cmd_reset_adr: cmd_type := "0100";

    signal cmd: cmd_type := cmd_nop;
    signal cmd_cntr: unsigned(1 downto 0) := "00";
    signal cmd_rdy: std_logic;

    type state_type is (state_idle,
                        state_reset_adr,
                        state_program_init,
                        state_program_w1,
                        state_program_w2,
                        state_program_w3,
                        state_program_w4,
                        state_read_r,
                        state_read_s1,
                        state_read_s2,
                        state_read_s3,
                        state_read_s4,
                        state_erase_w1,
                        state_erase_w2,
                        state_erase_w3,
                        state_erase_w4,
                        state_erase_w5,
                        state_erase_w6,
                        state_erase_done);

    signal current_state: state_type := state_idle;
    signal next_state: state_type;

    signal state_clk: std_logic := '1';

    signal dshift: std_logic_vector(7 downto 0) := (others => '0');
    signal dout: std_logic_vector(7 downto 0) := (others => '0');
    signal adr: unsigned(18 downto 0) := (others => '0');

    signal oe_int: std_logic;
    signal we_int: std_logic := '1';
    signal we_toggle: std_logic;

    signal shift1: std_logic;
    signal shift2: std_logic;

begin

    ce <= '0';

    oe <= oe_int;
    we <= we_int;

    shift1 <= sel1 and not capture;
    shift2 <= sel2 and not capture;

    process(drck1, shift1, cmd_cntr, tdi, cmd)
    begin
        if (drck1'event and drck1 = '1') then
            if (shift1 = '1') then
                cmd <= tdi & cmd(3 downto 1);
                cmd_cntr <= cmd_cntr + 1;
            end if;
        end if;
    end process;

    cmd_rdy <= '1' when (cmd_cntr = "00") else '0';

    tdo1 <= '0';

    process(drck2, cmd_rdy)
    begin
        if (cmd_rdy <= '0') then
            we_int <= '1';
        elsif (drck2'event and drck2 = '0' and shift2 = '1' and we_toggle = '1') then
            we_int <= not we_int;
        end if;
    end process;

    process(drck2, cmd_rdy)
    begin
        if (cmd_rdy <= '0') then
            current_state <= state_idle;
            state_clk <= '1';
        elsif (drck2'event and drck2 = '1' and shift2 = '1') then
            state_clk <= not state_clk;
            if (state_clk = '0') then
                current_state <= next_state;
            else
                dout <= dshift;
            end if;
        end if;
    end process;

    process(drck2)
    begin
        if (drck2'event and drck2 = '1' and shift2 = '1') then
            if (current_state = state_read_r and state_clk = '0') then
                dshift <= d;
            else
                dshift <= tdi & dshift(7 downto 1);
            end if;
        end if;
    end process;

    process(drck2)
    begin
        if (drck2'event and drck2 = '1' and shift2 = '1' and state_clk = '0') then
            if (current_state = state_reset_adr) then
                adr <= "0000000000000000000";
            elsif (current_state = state_program_w4 or current_state = state_read_s3) then
                adr <= adr + 1;
            end if;
        end if;
    end process;

    tdo2 <= dshift(0);

    with current_state select a(11 downto 0) <=
        X"555" when state_program_w1,
        X"2AA" when state_program_w2,
        X"555" when state_program_w3,
        std_logic_vector(adr(11 downto 0)) when state_program_w4,
        std_logic_vector(adr(11 downto 0)) when state_read_r,
        X"555" when state_erase_w1,
        X"2AA" when state_erase_w2,
        X"555" when state_erase_w3,
        X"555" when state_erase_w4,
        X"2AA" when state_erase_w5,
        X"555" when state_erase_w6,
        X"001" when state_idle,
        X"000" when others;

    with current_state select a(18 downto 12) <=
        std_logic_vector(adr(18 downto 12)) when state_program_w4,
        std_logic_vector(adr(18 downto 12)) when state_read_r,
        "0000000" when others;

    with current_state select d <=
        X"AA" when state_program_w1,
        X"55" when state_program_w2,
        X"A0" when state_program_w3,
        dout when state_program_w4,
        X"AA" when state_erase_w1,
        X"55" when state_erase_w2,
        X"80" when state_erase_w3,
        X"AA" when state_erase_w4,
        X"55" when state_erase_w5,
        X"10" when state_erase_w6,
        (others => 'Z') when others;

    with current_state select we_toggle <=
        '1' when state_program_w1,
        '1' when state_program_w2,
        '1' when state_program_w3,
        '1' when state_program_w4,
        '1' when state_erase_w1,
        '1' when state_erase_w2,
        '1' when state_erase_w3,
        '1' when state_erase_w4,
        '1' when state_erase_w5,
        '1' when state_erase_w6,
        '0' when others;

    with current_state select oe_int <=
        '0' when state_read_r,
        '0' when state_idle,
        '0' when state_erase_done,
        '1' when others;

    process(current_state, cmd)
    begin
        case current_state is
            when state_idle =>
                case cmd is
                    when cmd_nop =>
                        next_state <= state_idle;
                    when cmd_program =>
                        next_state <= state_program_init;
                    when cmd_read =>
                        next_state <= state_read_r;
                    when cmd_erase =>
                        next_state <= state_erase_w1;
                    when cmd_reset_adr =>
                        next_state <= state_reset_adr;
                    when others =>
                        next_state <= state_idle;
                end case;
            when state_program_init =>
                next_state <= state_program_w1;
            when state_program_w1 =>
                next_state <= state_program_w2;
            when state_program_w2 =>
                next_state <= state_program_w3;
            when state_program_w3 =>
                next_state <= state_program_w4;
            when state_program_w4 =>
                next_state <= state_program_init;
            when state_erase_w1 =>
                next_state <= state_erase_w2;
            when state_erase_w2 =>
                next_state <= state_erase_w3;
            when state_erase_w3 =>
                next_state <= state_erase_w4;
            when state_erase_w4 =>
                next_state <= state_erase_w5;
            when state_erase_w5 =>
                next_state <= state_erase_w6;
            when state_erase_w6 =>
                next_state <= state_erase_done;
            when state_erase_done =>
                next_state <= state_erase_done;
            when state_read_r =>
                next_state <= state_read_s1;
            when state_read_s1 =>
                next_state <= state_read_s2;
            when state_read_s2 =>
                next_state <= state_read_s3;
            when state_read_s3 =>
                next_state <= state_read_s4;
            when state_read_s4 =>
                next_state <= state_read_r;
            when state_reset_adr =>
                next_state <= state_reset_adr;
        end case;
    end process;

end arch;

