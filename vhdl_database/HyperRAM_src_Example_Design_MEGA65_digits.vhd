library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;

library work;
use work.video_modes_pkg.all;

-- Latency 3 clock cycles.

entity digits is
   generic (
      G_FONT_FILE   : string;
      G_DIGITS_SIZE : integer;
      G_VIDEO_MODE  : video_modes_t
   );
   port (
      clk_i    : in  std_logic;
      digits_i : in  std_logic_vector(G_DIGITS_SIZE-1 downto 0);
      pix_x_i  : in  std_logic_vector(G_VIDEO_MODE.PIX_SIZE-1 downto 0);
      pix_y_i  : in  std_logic_vector(G_VIDEO_MODE.PIX_SIZE-1 downto 0);
      pixel_o  : out std_logic_vector(7 downto 0)
   );
end entity digits;

architecture synthesis of digits is

   -- Number of rows of text on screen
   constant NUM_ROWS : integer := G_DIGITS_SIZE / 16;

   -- Define positioning of text on screen
   constant TEXT_CHAR_X : integer := 14;
   constant TEXT_CHAR_Y : integer := 2;

   constant DIGITS_CHAR_X : integer := TEXT_CHAR_X+8;
   constant DIGITS_CHAR_Y : integer := TEXT_CHAR_Y;

   -- A single character bitmap is defined by 8x8 = 64 bits.
   subtype bitmap_t is std_logic_vector(63 downto 0);

   -- Define colours
   constant PIXEL_BLACK : std_logic_vector(7 downto 0) := B"000_000_00";
   constant PIXEL_DARK  : std_logic_vector(7 downto 0) := B"001_001_01";
   constant PIXEL_GREY  : std_logic_vector(7 downto 0) := B"010_010_01";
   constant PIXEL_LIGHT : std_logic_vector(7 downto 0) := B"100_100_10";
   constant PIXEL_WHITE : std_logic_vector(7 downto 0) := B"111_111_11";

   type txt_t is array (0 to 7*NUM_ROWS-1) of character;
   constant txt : txt_t := " ERR-HI" &
                           " ERR-LO" &
                           "FAST-HI" &
                           "FAST-LO" &
                           "SLOW-HI" &
                           "SLOW-LO" &
                           " EXP-HI" &
                           " EXP-LO" &
                           "ADDR-HI" &
                           "ADDR-LO" &
                           "READ-HI" &
                           "READ-LO";

   -- Stage 0
   signal black_0        : std_logic;
   signal char_col_0     : integer range 0 to G_VIDEO_MODE.H_MAX/16-1;
   signal char_row_0     : integer range 0 to G_VIDEO_MODE.V_MAX/16-1;
   signal pix_col_0      : integer range 0 to 7;
   signal pix_row_0      : integer range 0 to 7;
   signal nibble_index_0 : integer range 0 to 4*NUM_ROWS-1;
   signal txt_offset_0   : integer range 0 to 7*NUM_ROWS-1;

   -- Stage 1
   signal black_1        : std_logic;
   signal char_col_1     : integer range 0 to G_VIDEO_MODE.H_MAX/16-1;
   signal char_row_1     : integer range 0 to G_VIDEO_MODE.V_MAX/16-1;
   signal pix_col_1      : integer range 0 to 7;
   signal pix_row_1      : integer range 0 to 7;
   signal nibble_1       : std_logic_vector(3 downto 0);
   signal char_nibble_1  : std_logic_vector(7 downto 0);
   signal char_txt_1     : std_logic_vector(7 downto 0);
   signal char_1         : std_logic_vector(7 downto 0);

   -- Stage 2
   signal black_2        : std_logic;
   signal bitmap_2       : bitmap_t;
   signal char_col_2     : integer range 0 to G_VIDEO_MODE.H_MAX/16-1;
   signal char_row_2     : integer range 0 to G_VIDEO_MODE.V_MAX/16-1;
   signal pix_col_2      : integer range 0 to 7;
   signal pix_row_2      : integer range 0 to 7;
   signal bitmap_index_2 : integer range 0 to 63;
   signal pix_2          : std_logic;

   -- Stage 3
   signal pixel_3        : std_logic_vector(7 downto 0);

begin

   --------------------------------------------------
   -- Stage 0
   --------------------------------------------------

   -- Calculate character coordinates, within 40x30
   black_0    <= '1' when pix_x_i >= G_VIDEO_MODE.H_PIXELS or pix_y_i >= G_VIDEO_MODE.V_PIXELS else '0';
   char_col_0 <= to_integer(pix_x_i(10 downto 5));
   char_row_0 <= to_integer(pix_y_i(10 downto 5));
   pix_col_0  <= to_integer(pix_x_i(4 downto 2));
   pix_row_0  <= 7 - to_integer(pix_y_i(4 downto 2));

   -- Calculate value of nibble at current position
   nibble_index_0 <= (NUM_ROWS-1 - (char_row_0 - DIGITS_CHAR_Y))*4 + 3 - (char_col_0 - DIGITS_CHAR_X);
   txt_offset_0 <= (char_row_0 - TEXT_CHAR_Y)*7 + (char_col_0 - TEXT_CHAR_X);


   --------------------------------------------------
   -- Stage 1
   --------------------------------------------------

   p_stage1 : process (clk_i)
   begin
      if rising_edge(clk_i) then
         char_txt_1 <= to_std_logic_vector(character'pos(txt(txt_offset_0)), 8);
         nibble_1   <= digits_i(4*nibble_index_0+3 downto 4*nibble_index_0);
         black_1    <= black_0;
         char_col_1 <= char_col_0;
         char_row_1 <= char_row_0;
         pix_col_1  <= pix_col_0;
         pix_row_1  <= pix_row_0;
      end if;
   end process p_stage1;

   -- Calculate character to display at current position
   char_nibble_1 <= nibble_1 + X"30" when nibble_1 < 10 else
                    nibble_1 + X"41" - 10;
   char_1 <= char_nibble_1 when char_row_1 >= DIGITS_CHAR_Y and char_row_1 < DIGITS_CHAR_Y+NUM_ROWS and
                                char_col_1 >= DIGITS_CHAR_X and char_col_1 < DIGITS_CHAR_X+4 else
             char_txt_1    when char_row_1 >= TEXT_CHAR_Y   and char_row_1 < TEXT_CHAR_Y+NUM_ROWS and
                                char_col_1 >= TEXT_CHAR_X   and char_col_1 < TEXT_CHAR_X+7 else
             X"20"; -- Fill the rest of the screen with spaces.


   --------------------------------------------------
   -- Stage 2
   --------------------------------------------------

   -- Calculate bitmap (64 bits) of digit at current position
   i_font : entity work.font
      generic map (
         G_FONT_FILE => G_FONT_FILE
      )
      port map (
         clk_i    => clk_i,
         char_i   => char_1,
         bitmap_o => bitmap_2
      ); -- i_font

   p_stage2 : process (clk_i)
   begin
      if rising_edge(clk_i) then
         black_2    <= black_1;
         char_col_2 <= char_col_1;
         char_row_2 <= char_row_1;
         pix_col_2  <= pix_col_1;
         pix_row_2  <= pix_row_1;
      end if;
   end process p_stage2;

   -- Calculate pixel at current position ('0' or '1')
   bitmap_index_2 <= pix_row_2*8 + pix_col_2;
   pix_2          <= bitmap_2(bitmap_index_2);


   --------------------------------------------------
   -- Stage 3
   --------------------------------------------------

   -- Generate pixel colour
   p_pixel : process (clk_i)
   begin
      if rising_edge(clk_i) then

         -- Set the default screen background colour
         pixel_3 <= PIXEL_GREY;

         -- Are we within the borders of the text?
         if char_row_2 >= TEXT_CHAR_Y and char_row_2 < TEXT_CHAR_Y+NUM_ROWS and
            char_col_2 >= TEXT_CHAR_X and char_col_2 < DIGITS_CHAR_X+4 then

            if pix_2 = '1' then
               pixel_3 <= PIXEL_LIGHT;   -- Text foreground colour.
            else
               pixel_3 <= PIXEL_DARK;    -- Text background colour.
            end if;
         end if;

         -- Make sure colour is black outside visible screen
         if black_2 = '1' then
            pixel_3 <= PIXEL_BLACK;
         end if;

      end if;
   end process p_pixel;

   pixel_o <= pixel_3;

end architecture synthesis;

