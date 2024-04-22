-----------------------------------------------------------------------
--
-- Copyright 2012 ShareBrained Technology, Inc.
--
-- This file is part of robotron-fpga.
--
-- robotron-fpga is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- robotron-fpga is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.
--
-- You should have received a copy of the GNU General
-- Public License along with robotron-fpga. If not, see
-- <http://www.gnu.org/licenses/>.
--
-----------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
 
entity sc1_tb is
end sc1_tb;

architecture behavior of sc1_tb is 

    component sc1
        port(
            clk             : in    std_logic;
            reset           : in    std_logic;
            e_sync          : in    std_logic;
            reg_cs          : in    std_logic;
            reg_data_in     : in    std_logic_vector(7 downto 0);
            rs              : in    std_logic_vector(2 downto 0);
            halt            : out   boolean;
            halt_ack        : in    boolean;
            blt_ack         : in    std_logic;
            blt_address_out : out   std_logic_vector(15 downto 0);
            read            : out   boolean;
            write           : out   boolean;
            blt_data_in     : in    std_logic_vector(7 downto 0);
            blt_data_out    : out   std_logic_vector(7 downto 0);
            en_upper        : out   boolean;
            en_lower        : out   boolean
        );
    end component;

    signal clk              : std_logic := '0';
    signal reset            : std_logic := '0';
    signal e_sync           : std_logic := '0';
    signal reg_cs           : std_logic := '0';
    signal reg_data_in      : std_logic_vector(7 downto 0) := (others => '0');
    signal rs               : std_logic_vector(2 downto 0) := (others => '0');
    signal halt             : boolean := false;
    signal halt_ack         : boolean := false;
    signal blt_ack          : std_logic := '0';
    signal blt_address_out  : std_logic_vector(15 downto 0);
    signal read             : boolean := false;
    signal write            : boolean := false;
    signal blt_data_in      : std_logic_vector(7 downto 0) := (others => '0');
    signal blt_data_out     : std_logic_vector(7 downto 0);
    signal en_upper         : boolean;
    signal en_lower         : boolean;

    constant clk_period : time := 83.333333 ns;
 
begin

    uut: sc1
        port map(
            clk => clk,
            reset => reset,
            e_sync => e_sync,
            reg_cs => reg_cs,
            reg_data_in => reg_data_in,
            rs => rs,
            halt => halt,
            halt_ack => halt_ack,
            blt_ack => blt_ack,
            blt_address_out => blt_address_out,
            read => read,
            write => write,
            blt_data_in => blt_data_in,
            blt_data_out => blt_data_out,
            en_upper => en_upper,
            en_lower => en_lower
        );

    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        
        clk <= '1';
        wait for clk_period/2;
    end process;

    stim_proc: process
    begin
        e_sync <= '1';
        
        wait until rising_edge(clk);
        rs <= "010";
        reg_data_in <= X"11";
        reg_cs <= '1';
        
        wait until rising_edge(clk);
        rs <= "011";
        reg_data_in <= X"22";
        reg_cs <= '1';
        
        wait until rising_edge(clk);
        rs <= "100";
        reg_data_in <= X"33";
        reg_cs <= '1';
        
        wait until rising_edge(clk);
        rs <= "101";
        reg_data_in <= X"44";
        reg_cs <= '1';
        
        wait until rising_edge(clk);
        rs <= "110";
        reg_data_in <= X"00";
        reg_cs <= '1';
        
        wait until rising_edge(clk);
        rs <= "111";
        reg_data_in <= X"00";
        reg_cs <= '1';
        
        wait until rising_edge(clk);
        rs <= "000";
        reg_data_in <= "00000001";
        reg_cs <= '1';
        
        wait until rising_edge(clk);
        reg_cs <= '0';
        
        wait until halt = true;
        halt_ack <= true;
        
        wait until rising_edge(clk);
        blt_ack <= '1';
        blt_data_in <= X"69";
        
        wait until halt = false;
        blt_ack <= '0';
        halt_ack <= false;

        wait;
    end process;

end;
