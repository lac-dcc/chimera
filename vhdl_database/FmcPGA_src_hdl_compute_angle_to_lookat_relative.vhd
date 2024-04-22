library IEEE;
use IEEE.std_logic_1164.all;

use work.constants.all;
use work.types.all;


entity angle_to_lookat_relative is
    port (
        angle: in vec2i_t;
        lookat_rel: out vec3i_t;
        lookat_h_rel: out vec2i_t
    );
end entity;


architecture Behavioral of angle_to_lookat_relative is
    component angle_to_coord is
        port (
            angle: in int;
            coord: out vec2i_t
        );
    end component;

    signal coord_h, coord_v: vec2i_t;
begin
    ac_cvt_h: angle_to_coord port map (
        angle => angle.x,
        coord => coord_h
    );

    ac_cvt_v: angle_to_coord port map (
        angle => angle.y,
        coord => coord_v
    );

    lookat_rel <= vec3i_t'(
        coord_h.x * coord_v.x / ANGLE_RADIUS,
        coord_h.y * coord_v.x / ANGLE_RADIUS,
        coord_v.y
    );

    lookat_h_rel <= coord_h;
end architecture;
