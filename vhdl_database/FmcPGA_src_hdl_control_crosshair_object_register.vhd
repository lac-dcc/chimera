library IEEE;
use IEEE.std_logic_1164.all;

use work.types.all;
use work.constants.all;


entity crosshair_object_register is
    port (
        clk, rst: in std_logic;
        update_sync: in std_logic;          -- is_crosshair = '1' and is_air = '0' and is_behind = '0'
        valid_in: in std_logic;
        block_p_sel_in: in vec3i_t;
        hit_surface_sel_in: in surface_t;
        valid_sel: out std_logic;
        block_p_sel: out vec3i_t;
        hit_surface_sel: out surface_t;
        block_p_inc: out vec3i_t
    );
end entity;


architecture Behavioral of crosshair_object_register is
    signal valid_sel_0, valid_sel_0_next: std_logic;
    signal block_p_sel_0, block_p_sel_0_next: vec3i_t;
    signal hit_surface_sel_0, hit_surface_sel_0_next: surface_t;

    signal valid_sel_1, valid_sel_1_next: std_logic;
    signal block_p_sel_1, block_p_sel_1_next: vec3i_t;
    signal hit_surface_sel_1, hit_surface_sel_1_next: surface_t;
    signal block_p_inc_1, block_p_inc_1_next: vec3i_t;
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            valid_sel_0 <= '0';
            block_p_sel_0 <= (0, 0, 0);
            hit_surface_sel_0 <= 6;

            valid_sel_1 <= '0';
            block_p_sel_1 <= (0, 0, 0);
            hit_surface_sel_1 <= 6;
            block_p_inc_1 <= (0, 0, 0);
        elsif rising_edge(clk) and update_sync = '1' then
            valid_sel_0 <= valid_sel_0_next;
            block_p_sel_0 <= block_p_sel_0_next;
            hit_surface_sel_0 <= hit_surface_sel_0_next;

            valid_sel_1 <= valid_sel_1_next;
            block_p_sel_1 <= block_p_sel_1_next;
            hit_surface_sel_1 <= hit_surface_sel_1_next;
            block_p_inc_1 <= block_p_inc_1_next;
        end if;
    end process;
    
    -- Stage 0
    valid_sel_0_next <= valid_in;
    block_p_sel_0_next <= block_p_sel_in;
    hit_surface_sel_0_next <= hit_surface_sel_in;

    -- Stage 1
    valid_sel_1_next <= valid_sel_0;
    block_p_sel_1_next <= block_p_sel_0;
    hit_surface_sel_1_next <= hit_surface_sel_0;
    block_p_inc_1_next.x <=
        block_p_sel_0.x - 1 when hit_surface_sel_0 = 0 else
        block_p_sel_0.x + 1 when hit_surface_sel_0 = 1 else
        block_p_sel_0.x;
    block_p_inc_1_next.y <=
        block_p_sel_0.y - 1 when hit_surface_sel_0 = 2 else
        block_p_sel_0.y + 1 when hit_surface_sel_0 = 3 else
        block_p_sel_0.y;
    block_p_inc_1_next.z <=
        block_p_sel_0.z - 1 when hit_surface_sel_0 = 4 else
        block_p_sel_0.z + 1 when hit_surface_sel_0 = 5 else
        block_p_sel_0.z;

    -- Outputs
    valid_sel <= valid_sel_1;
    block_p_sel <= block_p_sel_1;
    hit_surface_sel <= hit_surface_sel_1;
    block_p_inc <= block_p_inc_1;
end architecture;
