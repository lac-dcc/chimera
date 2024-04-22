-- (C) 2012 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other
-- software and tools, and its AMPP partner logic functions, and any output
-- files any of the foregoing (including device programming or simulation
-- files), and any associated documentation or information are expressly subject
-- to the terms and conditions of the Altera Program License Subscription
-- Agreement, Altera MegaCore Function License Agreement, or other applicable
-- license agreement, including, without limitation, that your use is for the
-- sole purpose of programming logic devices manufactured by Altera and sold by
-- Altera or its authorized distributors.  Please refer to the applicable
-- agreement for further details.

library IEEE;
use IEEE.std_logic_1164.all;
use work.dspba_library_package.all;

entity dspba_delay is
    generic (
        width : natural := 8;
        depth : natural := 1;
        reset_high : std_logic := '1'
    );
    port (
        clk   : in  std_logic;
        aclr  : in  std_logic;
        ena   : in  std_logic := '1';
        xin   : in  std_logic_vector(width-1 downto 0);
        xout  : out std_logic_vector(width-1 downto 0)
    );
end dspba_delay;

architecture delay of dspba_delay is
    type delay_array is array (depth downto 0) of std_logic_vector(width-1 downto 0);
    signal delay_signals : delay_array;
begin
    delay_signals(depth) <= xin;

    delay_block: if 0 < depth generate
    begin
        delay_loop: for i in depth-1 downto 0 generate
        begin
            process(clk, aclr)
            begin
                if aclr=reset_high then
                    delay_signals(i) <= (others => '0');
                elsif clk'event and clk='1' then
                    if ena='1' then
                        delay_signals(i) <= delay_signals(i + 1);
                    end if;
                end if;
            end process;
        end generate;
    end generate;

    xout <= delay_signals(0);
end delay;
