library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity frequency_divider is
    generic (
        PERIOD: integer := 100000
    );
    port (
        clk, rst: in std_logic;
        en: in std_logic;
        pulse: out std_logic
    );
end entity;


architecture Behavioral of frequency_divider is
    signal cnt_reg, cnt_next: integer;
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            cnt_reg <= 0;
        elsif rising_edge(clk) and en = '1' then
            cnt_reg <= cnt_next;
        end if;
    end process;
    
    cnt_next <= 0 when cnt_reg = PERIOD - 1 else cnt_reg + 1;
    pulse <= '1' when cnt_reg = PERIOD - 1 else '0';
end architecture;
