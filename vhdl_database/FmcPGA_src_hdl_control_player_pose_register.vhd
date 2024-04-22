library IEEE;
use IEEE.std_logic_1164.all;

use work.types.all;


-- This module is only used to avoid update the pose infomation during one frame.
entity player_pose_register is
    port (
        clk, rst: in std_logic;
        update_sync: in std_logic;
        p_pos_in: in vec3i_t;
        p_angle_in: in vec2i_t;
        p_pos: out vec3i_t;
        p_angle: out vec2i_t
    );
end entity;


architecture Behavioral of player_pose_register is
    signal pos_reg, pos_next: vec3i_t;
    signal angle_reg, angle_next: vec2i_t;
begin
    process (clk, rst) is
    begin
        if rst = '1' then
            pos_reg <= p_pos_in; -- (0, 0, 0);
            angle_reg <= p_angle_in; -- (0, 0);
        elsif rising_edge(clk) then
            pos_reg <= pos_next;
            angle_reg <= angle_next;
        end if;
    end process;
    
    pos_next <= p_pos_in when update_sync = '1' else pos_reg;
    angle_next <= p_angle_in when update_sync = '1' else angle_reg;
    
    p_pos <= pos_reg;
    p_angle <= angle_reg;
end architecture;
