library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


package types is
    -- radix
    constant DISP_RAM_ADDR_RADIX: natural := 17;
    constant BLOCK_TYPE_RADIX: natural := 5;
    constant TEXTURE_ADDR_RADIX: natural := 13;
    constant TEXTURE_IDX_ADDR_RADIX: natural := 8;
    constant TEXTURE_TYPE_RADIX: natural := 5;
    constant MAP_ADDR_RADIX: natural := 17;
    constant INT_RADIX: natural := 22;

    -- int
    subtype int is integer range -2 ** (INT_RADIX - 1) to 2 ** (INT_RADIX - 1) - 1;

    -- vec2i_t
    type vec2i_t is record
        x: int;
        y: int;
    end record;
    function "+"(v1, v2: vec2i_t) return vec2i_t;

    -- vec3i_t
    type vec3i_t is record
        x: int;
        y: int;
        z: int;
    end record;
    function "+"(v1, v2: vec3i_t) return vec3i_t;
    function "-"(v1, v2: vec3i_t) return vec3i_t;
    function "*"(v: vec3i_t; s: int) return vec3i_t;
    function "/"(v: vec3i_t; s: int) return vec3i_t;
    function length_2(v: vec3i_t) return int;
    function length_mht(v: vec3i_t) return int;
    function cross(v1, v2: vec3i_t) return vec3i_t;

    -- direction
    subtype dir_t is integer range 0 to 3;
    subtype surface_t is integer range 0 to 6;

    -- color
    subtype color_int is integer; -- range 0 to 65535;    -- 0 to 255, but to prevent overflow when blending
    type color_t is record
        r: color_int;
        g: color_int;
        b: color_int;
        a: color_int;
    end record;
    function to_color(data: std_logic_vector(31 downto 0)) return color_t;
    function "+"(c1, c2: color_t) return color_t;
    function "-"(c1, c2: color_t) return color_t;
    function "*"(c: color_t; s: int) return color_t;
    function "/"(c: color_t; s: int) return color_t;
    function is_opaque(c: color_t) return boolean;
    function blend_color(fore, back: color_t) return color_t;

    -- vga
    type color_vga_t is record  -- 0 to 15
        r: std_logic_vector(3 downto 0);
        g: std_logic_vector(3 downto 0);
        b: std_logic_vector(3 downto 0);
    end record;

    type vga_t is record
        hsync_n, vsync_n: std_logic;
        color: color_vga_t;
    end record;

    -- gamepad
    type gamepad_data_t is record
        id: std_logic_vector(7 downto 0);
        f_select, L3, R3, f_start, up, right, down, left: std_logic;
        L2, R2, L1, R1, triangle, circle, cross, square: std_logic;
        pss_rx, pss_ry, pss_lx, pss_ly: integer;
    end record;
    constant PSS_RES: int := 256;
    constant PSS_MIDDLE: int := 128;
    constant PSS_DEADZONE_RADIUS: int := 2;

    -- bcd
    subtype bcd_t is std_logic_vector(3 downto 0);
    type bcd_array_t is array (natural range <>) of bcd_t;
end package;


package body types is
    function "+"(v1, v2: vec2i_t) return vec2i_t is
    begin
        return vec2i_t'(v1.x + v2.x, v1.y + v2.y);
    end function;

    function "+"(v1, v2: vec3i_t) return vec3i_t is
    begin
        return vec3i_t'(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z);
    end function;

    function "-"(v1, v2: vec3i_t) return vec3i_t is
    begin
        return vec3i_t'(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z);
    end function;

    function "*"(v: vec3i_t; s: int) return vec3i_t is
    begin
        return vec3i_t'(v.x * s, v.y * s, v.z * s);
    end function;

    function "/"(v: vec3i_t; s: int) return vec3i_t is
    begin
        return vec3i_t'(v.x / s, v.y / s, v.z / s);
    end function;

    function length_2(v: vec3i_t) return int is
    begin
        return v.x * v.x + v.y * v.y + v.z * v.z;
    end function;

    function length_mht(v: vec3i_t) return int is
    begin
        return abs(v.x) + abs(v.y) + abs(v.z);
    end function;

    function cross(v1, v2: vec3i_t) return vec3i_t is
    begin
        return vec3i_t'(
            v1.y * v2.z - v1.z * v2.y,
            v1.z * v2.x - v1.x * v2.z,
            v1.x * v2.y - v1.y * v2.x
        );
    end function;

    function to_color(data: std_logic_vector(31 downto 0)) return color_t is
    begin
        return color_t'(
            to_integer(unsigned(data(31 downto 24))),
            to_integer(unsigned(data(23 downto 16))),
            to_integer(unsigned(data(15 downto 8))),
            to_integer(unsigned(data(7 downto 0)))
        );
    end function;

    function "+"(c1, c2: color_t) return color_t is
    begin
        return color_t'(c1.r + c2.r, c1.g + c2.g, c1.b + c2.b, c1.a + c2.a);
    end function;

    function "-"(c1, c2: color_t) return color_t is
    begin
        return color_t'(c1.r - c2.r, c1.g - c2.g, c1.b - c2.b, c1.a - c2.a);
    end function;

    function "*"(c: color_t; s: int) return color_t is
    begin
        return color_t'(c.r * s, c.g * s, c.b * s, c.a * s);
    end function;

    function "/"(c: color_t; s: int) return color_t is
    begin
        return color_t'(c.r / s, c.g / s, c.b / s, c.a / s);
    end function;
    
    function is_opaque(c: color_t) return boolean is
    begin
        return c.a >= 255;
    end function;

    function blend_color(fore, back: color_t) return color_t is
        variable alpha, beta: color_int;
    begin
        alpha := fore.a;
        beta := 255 - fore.a;
        return color_t'(
            (fore.r * alpha + back.r * beta) / 255,
            (fore.g * alpha + back.g * beta) / 255,
            (fore.b * alpha + back.b * beta) / 255,
            alpha + back.a * beta / 255
        );
    end function;
end package body;
