library IEEE;
use IEEE.std_logic_1164.all;

use work.constants.all;
use work.types.all;


entity viewport_scanner is
    port (
        clk_ppl, rst, enable: in std_logic;
        fragment_uv: out vec2i_t
    );
end entity;


architecture Behavioral of viewport_scanner is
    signal h_cnt_reg, h_cnt_next: int;
	signal v_cnt_reg, v_cnt_next: int;
begin
    process (clk_ppl, rst) is
    begin
        if rst = '1' then
            h_cnt_reg <= 0;
            v_cnt_reg <= 0;
        elsif rising_edge(clk_ppl) and enable = '1' then
            h_cnt_reg <= h_cnt_next;
            v_cnt_reg <= v_cnt_next;
        end if;
    end process;
    h_cnt_next <= 0                 when h_cnt_reg = H_REAL - 1 else
                  h_cnt_reg + 1;
    v_cnt_next <= v_cnt_reg         when h_cnt_reg /= H_REAL - 1 else
                  0                 when v_cnt_reg = V_REAL - 1 else
                  v_cnt_reg + 1;
    
    fragment_uv <= (h_cnt_reg, v_cnt_reg);
end architecture;
