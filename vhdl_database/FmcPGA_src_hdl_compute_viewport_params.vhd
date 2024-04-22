library IEEE;
use IEEE.std_logic_1164.all;

use work.constants.all;
use work.types.all;


entity viewport_params is
    port (
        p_pos: in vec3i_t;
        p_angle: in vec2i_t;
        vp_origin, vp_u, vp_v: out vec3i_t;
        towards_h: out vec2i_t
    );
end entity;


architecture Behavioral of viewport_params is
    component angle_to_lookat_relative is
        port (
            angle: in vec2i_t;
            lookat_rel: out vec3i_t;
            lookat_h_rel: out vec2i_t
        );
    end component;

    signal lookat_rel: vec3i_t;
    signal lookat_h_rel: vec2i_t;
begin
    atlr: angle_to_lookat_relative port map (
        angle => p_angle,
        lookat_rel => lookat_rel,
        lookat_h_rel => lookat_h_rel
    );
    
    vp_u <= vec3i_t'(lookat_h_rel.y, -lookat_h_rel.x, 0);
    vp_v <= cross(vp_u, lookat_rel) / ANGLE_RADIUS;

    vp_origin <= p_pos + (
        lookat_rel
        - vp_u * H_REAL / 2 / ANGLE_RADIUS
        + vp_v * V_REAL / 2 / ANGLE_RADIUS
    ) * LOOKAT_REL_FAC;

    towards_h <= lookat_h_rel;
end architecture;

-- Viewport Coordinate System Base Vectors
--      ^ v
--      |
--      +----> u
-- Origin is at the top left of the viewport
-- and |u| = |v| = ANGLE_RADIUS
