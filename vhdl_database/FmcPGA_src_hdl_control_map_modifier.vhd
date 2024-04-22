library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.types.all;
use work.constants.all;


entity map_modifier is
    port (
        clk, rst: in std_logic;
        valid_target: in std_logic;
        block_p_target: in vec3i_t;
        idx_target: in int;
        write_enable: out std_logic;
        write_addr: out std_logic_vector(MAP_ADDR_RADIX - 1 downto 0);
        write_data: out std_logic_vector(BLOCK_TYPE_RADIX - 1 downto 0)
    );
end entity;


architecture Behavioral of map_modifier is
    signal valid, valid_next: std_logic;
    signal block_p, block_p_next: vec3i_t;
    signal idx, idx_next: int;
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            valid <= '0';
            block_p <= (0, 0, 0);
            idx <= 0;
        elsif rising_edge(clk) then
            valid <= valid_next;
            block_p <= block_p_next;
            idx <= idx_next;
        end if;
    end process;

    valid_next <= '0' when valid = valid_target and block_p = block_p_target and idx = idx_target else valid_target;
    block_p_next <= block_p_target;
    idx_next <= idx_target;

    write_enable <= valid;
    write_addr <= std_logic_vector(to_unsigned(block_p.x * MAPSIZE_Y * MAPSIZE_Z + block_p.y * MAPSIZE_Z + block_p.z, MAP_ADDR_RADIX));
    write_data <= std_logic_vector(to_unsigned(idx, BLOCK_TYPE_RADIX));
end architecture;
