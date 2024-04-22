library IEEE;
use IEEE.std_logic_1164.all;

use work.types.all;
use work.constants.all;


entity inventory_register is
    port (
        clk, rst, enable: in std_logic;
        last_item, next_item: in std_logic;
        current_item: out int
    );
end entity;


architecture Behavioral of inventory_register is
    signal current_item_reg, current_item_next: int;
begin
    process (clk, rst)
    begin
        if rst = '1' then
            current_item_reg <= 0;
        elsif rising_edge(clk) and enable = '1' then
            current_item_reg <= current_item_next;
        end if;
    end process;
    
    current_item_next <=
        0                       when next_item = '1' and current_item_reg = BLOCK_TYPE - 1 else
        current_item_reg + 1    when next_item = '1' else
        BLOCK_TYPE - 1          when last_item = '1' and current_item_reg = 0 else
        current_item_reg - 1    when last_item = '1' else
        current_item_reg;

    current_item <= current_item_reg;
end architecture;
