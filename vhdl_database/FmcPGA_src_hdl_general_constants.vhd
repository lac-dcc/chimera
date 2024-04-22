library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.types.all;


package constants is
    -- display constants. (dimension divided by 2)
    constant H_SYNC_PULSE: int := 96;
    constant H_BACK_PORCH: int := 48;
    constant H_ACTIVE: int := 640;
    constant H_FRONT_PORCH: int := 16;
    constant H_LINE_PERIOD: int := H_SYNC_PULSE + H_BACK_PORCH + H_ACTIVE + H_FRONT_PORCH;
    constant H_REAL: int := H_ACTIVE / 2;
    constant V_SYNC_PULSE: int := 2;
    constant V_BACK_PORCH: int := 33;
    constant V_ACTIVE: int := 480;
    constant V_FRONT_PORCH: int := 10;
    constant V_FRAME_PERIOD: int := V_SYNC_PULSE + V_BACK_PORCH + V_ACTIVE + V_FRONT_PORCH;
    constant V_REAL: int := V_ACTIVE / 2;
    
    -- block constants.
    constant TEXTURE_RES: int := 16;
    constant BLOCK_TYPE: int := 24;

    -- map constants.
    constant MAXD: int := 160000;
    constant MIND: int := 7;
    constant MAPSIZE_X: int := 64;
    constant MAPSIZE_Y: int := 64;
    constant MAPSIZE_Z: int := 32;
    function is_in_map(b: vec3i_t) return boolean;

    -- tracing constants.
    constant SKY_COLOR: color_t := color_t'(160, 224, 240, 255); -- color_t'(10, 14, 15, 15);
    constant TRACE_DIST_RAD_SQUARED: int := 24 ** 2;

    -- viewport constants.
    constant LOOKAT_REL_FAC: int := 2;
    constant CENTER_ADDR: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0) := std_logic_vector(to_unsigned(H_REAL * V_REAL / 2 + H_REAL / 2, DISP_RAM_ADDR_RADIX));   -- "01001011010100000"
    constant EOF_ADDR: std_logic_vector(DISP_RAM_ADDR_RADIX - 1 downto 0) := std_logic_vector(to_unsigned(H_REAL * V_REAL - 1, DISP_RAM_ADDR_RADIX));                   -- "10010101111111111"

    -- math constants.
    constant ANGLE_RADIUS: int := 225;
    constant ANGLE_EIGHTH: int := 158;
    constant ANGLE_QUARTER: int := ANGLE_EIGHTH * 2 + 1;
    constant ANGLE_HALF: int := ANGLE_EIGHTH * 4 + 2;
    constant ANGLE_MODULO: int := ANGLE_EIGHTH * 8 + 4;

    -- control constants.
    constant POS_STEP: int := 32;
    constant ANGLE_STEP: int := 5;

    -- time constants.
    constant PPL_FREQ: integer := 40000000;
end package;


package body constants is
    function is_in_map(b: vec3i_t) return boolean is
    begin
        return b.x >= 0 and b.x < MAPSIZE_X and b.y >= 0 and b.y < MAPSIZE_Y and b.z >= 0 and b.z < MAPSIZE_Z;
    end function;
end package body;
