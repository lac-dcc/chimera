library IEEE;
use IEEE.std_logic_1164.all;


entity debounced_button is
    generic (
        PERIOD: integer := 2000 -- 20 us
    );
    port (
        clk, rst: in std_logic;
        btn_in: in std_logic;
        btn_out: out std_logic
    );
end entity;


architecture Behavioral of debounced_button is
    signal cnt, cnt_next: integer;
    signal btn, btn_next: std_logic;
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            cnt <= 0;
            btn <= '0';
        elsif rising_edge(clk) then
            cnt <= cnt_next;
            btn <= btn_next;
        end if;
    end process;
    cnt_next <= cnt + 1 when btn /= btn_in and cnt < PERIOD - 1 else 0;
    btn_next <= not btn when cnt = PERIOD - 1 else btn;

    btn_out <= btn;
end architecture;
