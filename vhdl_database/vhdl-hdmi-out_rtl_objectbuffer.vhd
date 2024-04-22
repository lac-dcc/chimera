-- author: Furkan Cayci, 2018
-- description: object buffer that holds the objects to display
--    object locations can be controlled from upper level
--    example contains a wall, a rectanble box and a round ball

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity objectbuffer is
    generic (
        OBJECT_SIZE : natural := 16;
        PIXEL_SIZE : natural := 24;
        RES_X : natural := 1280;
        RES_Y : natural := 720
    );
    port (
        video_active       : in  std_logic;
        pixel_x, pixel_y   : in  std_logic_vector(OBJECT_SIZE-1 downto 0);
        object1x, object1y : in  std_logic_vector(OBJECT_SIZE-1 downto 0);
        object2x, object2y : in  std_logic_vector(OBJECT_SIZE-1 downto 0);
        backgrnd_rgb       : in  std_logic_vector(PIXEL_SIZE-1 downto 0);
        rgb                : out std_logic_vector(PIXEL_SIZE-1 downto 0)
    );
end objectbuffer;

architecture rtl of objectbuffer is
    -- create a 5 pixel vertical wall
    constant WALL_X_L: integer := 60;
    constant WALL_X_R: integer := 65;

    -- 1st object is a vertical box 48x8 pixel
    constant BOX_SIZE_X: integer :=  8;
    constant BOX_SIZE_Y: integer := 48;
    -- x, y coordinates of the box
    signal box_x_l : unsigned (OBJECT_SIZE-1 downto 0);
    signal box_y_t : unsigned (OBJECT_SIZE-1 downto 0);
    signal box_x_r : unsigned (OBJECT_SIZE-1 downto 0);
    signal box_y_b : unsigned (OBJECT_SIZE-1 downto 0);

    -- 2nd object is a ball
    constant BALL_SIZE: integer:=8;
    type rom_type is array (0 to 7) of std_logic_vector(7 downto 0);

    constant BALL_ROM: rom_type := (
        "00111100", --   ****
        "01111110", --  ******
        "11111111", -- ********
        "11111111", -- ********
        "11111111", -- ********
        "11111111", -- ********
        "01111110", --  ******
        "00111100"  --   ****
    );

    signal rom_addr, rom_col: unsigned(0 to 2);
    signal rom_bit: std_logic;
    -- x, y coordinates of the ball
    signal ball_x_l : unsigned(OBJECT_SIZE-1 downto 0);
    signal ball_y_t : unsigned(OBJECT_SIZE-1 downto 0);
    signal ball_x_r : unsigned(OBJECT_SIZE-1 downto 0);
    signal ball_y_b : unsigned(OBJECT_SIZE-1 downto 0);

    -- signals that holds the x, y coordinates
    signal pix_x, pix_y: unsigned (OBJECT_SIZE-1 downto 0);

    signal wall_on, box_on, square_ball_on, ball_on: std_logic;
    signal wall_rgb, box_rgb, ball_rgb: std_logic_vector(23 downto 0);

begin

    pix_x <= unsigned(pixel_x);
    pix_y <= unsigned(pixel_y);

    -- draw wall and color
    wall_on <= '1' when WALL_X_L<=pix_x and pix_x<=WALL_X_R else '0';
    wall_rgb <= x"0000FF"; -- blue

    -- draw box and color
    -- calculate the coordinates
    box_x_l <= unsigned(object1x);
    box_y_t <= unsigned(object1y);
    box_x_r <= box_x_l + BOX_SIZE_X - 1;
    box_y_b <= box_y_t + BOX_SIZE_Y - 1;
    box_on <= '1' when box_x_l<=pix_x and pix_x<=box_x_r and
                       box_y_t<=pix_y and pix_y<=box_y_b else
              '0';
    -- box rgb output
    box_rgb <= x"00FF00"; --green

    -- draw ball and color
    -- calculate the coordinates
    ball_x_l <= unsigned(object2x);
    ball_y_t <= unsigned(object2y);
    ball_x_r <= ball_x_l + BALL_SIZE - 1;
    ball_y_b <= ball_y_t + BALL_SIZE - 1;

    square_ball_on <= '1' when ball_x_l<=pix_x and pix_x<=ball_x_r and
                               ball_y_t<=pix_y and pix_y<=ball_y_b else
                      '0';
    -- map current pixel location to ROM addr/col
    rom_addr <= pix_y(2 downto 0) - ball_y_t(2 downto 0);
    rom_col <= pix_x(2 downto 0) - ball_x_l(2 downto 0);
    rom_bit <= BALL_ROM(to_integer(rom_addr))(to_integer(rom_col));
    -- pixel within ball
    ball_on <= '1' when square_ball_on='1' and rom_bit='1' else '0';
    -- ball rgb output
    ball_rgb <= x"FF0000";   -- red

    -- display the image based on who is active
    -- note that the order is important
    process(video_active, wall_on, box_on, wall_rgb, box_rgb, ball_rgb, backgrnd_rgb, ball_on) is
    begin
        if video_active='0' then
            rgb <= x"000000"; --blank
        else
            if wall_on='1' then
                rgb <= wall_rgb;
            elsif ball_on='1' then
                rgb <= ball_rgb;
            elsif box_on='1' then
                rgb <= box_rgb;
            else
                rgb <= backgrnd_rgb; -- x"FFFF00"; -- yellow background
            end if;
        end if;
    end process;

end rtl;