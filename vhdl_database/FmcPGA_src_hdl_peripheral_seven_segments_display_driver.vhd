library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

use work.types.all;


entity seven_segments_display_driver is
    port (
        clk_sys, rst: in std_logic;
        nums: in bcd_array_t(7 downto 0);
        anodes_n: out std_logic_vector(7 downto 0);
        segs_n: out std_logic_vector(0 to 7)
    );
end entity;


architecture Behavioral of seven_segments_display_driver is
    component frequency_divider is
        generic (
            PERIOD: integer := 100000
        );
        port (
            clk, rst: in std_logic;
            en: in std_logic;
            pulse: out std_logic
        );
    end component;

    component decoder_3_to_8 is
        port (
            addr: in std_logic_vector(2 downto 0);
            data_n: out std_logic_vector(7 downto 0)
        );
    end component;

    component seven_segments_display_decoder is
        port (
            bcd: in std_logic_vector(3 downto 0);
            en_dp: in std_logic;
            segs_n: out std_logic_vector(0 to 7)    -- 0 to 7: dp, a, b, c, d, e, f, g
        );
    end component;

    signal enable: std_logic;
    signal anode_addr_reg, anode_addr_next: std_logic_vector(2 downto 0);
    signal num_idx: natural;
begin
    freq_div: frequency_divider
        generic map (
            period => 100000
        )
        port map (
            clk => clk_sys,
            rst => rst,
            en => '1',
            pulse => enable
        );

    process (clk_sys, rst) is
    begin
        if (rst = '1') then
            anode_addr_reg <= "000";
        elsif rising_edge(clk_sys) then
            anode_addr_reg <= anode_addr_next;
        end if;
    end process;
    anode_addr_next <= anode_addr_reg when enable = '0' else
                       "000" when anode_addr_reg = "111" else
                       anode_addr_reg + 1;

    decoder: decoder_3_to_8
        port map (
            addr => anode_addr_reg,
            data_n => anodes_n
        );
    
    num_idx <= 0 when anode_addr_reg = "000" else
               1 when anode_addr_reg = "001" else
               2 when anode_addr_reg = "010" else
               3 when anode_addr_reg = "011" else
               4 when anode_addr_reg = "100" else
               5 when anode_addr_reg = "101" else
               6 when anode_addr_reg = "110" else
               7;
    seven_seg_dec: seven_segments_display_decoder
        port map (
            bcd => nums(num_idx),
            en_dp => '0',
            segs_n => segs_n
        );
end architecture;
