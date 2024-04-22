------------------------------------------------------------------------------
-- Project    : Red Zombie
------------------------------------------------------------------------------
-- File       :  bm204_empty_pkg.vhd
-- Author     :  fpgakuechle
-- Company    : hobbyist
-- Created    : 2012-12
-- Last update: 2013-05-28
-- Licence     : GNU General Public License (http://www.gnu.de/documents/gpl.de.html) 
------------------------------------------------------------------------------
-- Description: 
--Video subsysten
--Video ram, character,rom, display output
--Z1013 display is 32 x 32 xharactes on a 8x8 font
--output format here is 800x600 pixel
--the z1013 display will stretched to 512x512 (ever font-element quadrupelt)
--and placed at 1st line starting at hor. pos 44
------------------------------------------------------------------------------
--Status: dimensions OK, same ghost pixels and a ghost pixel line 
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
use work.pkg_redz0mb1e.all;

entity video is
  generic(G_System : T_SYSTEM := DEV;
          G_ReadOnly :boolean := FALSE); --fixes Bild aus initialisierten videoram
  port(
    clk   : in std_logic;
    rst_i : in std_logic;
    --cpu port to video memory
    cs_ni     : in  std_logic;
    we_ni     : in  std_logic;
    data_i    : in  std_logic_vector(7 downto 0);
    data_o    : out std_logic_vector(7 downto 0);
    addr_i    : in  std_logic_vector(9 downto 0);
    --vga output
    video_clk : in  std_logic;
    red_o     : out std_logic;
    blue_o    : out std_logic;
    green_o   : out std_logic;
    vsync_o   : out std_logic;
    hsync_o   : out std_logic;
    --
    col_fg    : in  T_COLOR;
    col_bg    : in  T_COLOR);
end entity video;

architecture behave of video is

  component char_rom
    generic (
      G_System : T_SYSTEM);
    port (
      clk         : in  std_logic;
      cs_ni       : in  std_logic;
      data_o      : out std_logic_vector(7 downto 0);
      addr_char_i : in  std_logic_vector(7 downto 0);
      addr_line_i : in  std_logic_vector(2 downto 0));
  end component;

     component video_ram
     generic (
       G_System   : T_SYSTEM;
       G_READONLY : boolean);
     port (
       cpu_clk      : in  std_logic;
       cpu_cs_ni    : in  std_logic;
       cpu_we_ni    : in  std_logic;
       cpu_addr_i   : in  std_logic_vector(9 downto 0);
       cpu_data_o   : out std_logic_vector(7 downto 0);
       cpu_data_i   : in  std_logic_vector(7 downto 0);
       video_clk    : in  std_logic;
       video_cs_ni  : in  std_logic;
       video_addr_i : in  std_logic_vector(9 downto 0);
       video_data_o : out std_logic_vector(7 downto 0));
   end component;

   --readonly port to video, --(address bus character rom)
  signal vram_video_addr : std_logic_vector(9 downto 0):= (others => '0');
  signal data4crom       : std_logic_vector(7 downto 0);
  --adress pointer to character rom
  --     charcter code feeded from videoram                                                                   
  signal crom_index_high : unsigned(7 downto 0):= (others => '0'); 
  signal blank_area      : std_logic;
  
  constant C_CHAR_WIDTH  : integer := 8;
  constant C_CHAR_HEIGHT : integer := 8;

  constant C_CHAR_PER_LINE : integer := 32;
  constant C_CHAR_PER_COL  : integer := 32;

  --video 800 x 600
  --from svga signal generator 
  signal hcount_slv : std_logic_vector(10 downto 0);
  signal vcount_slv : std_logic_vector(10 downto 0);
  signal hcount : unsigned(10 downto 0);
  signal vcount : unsigned(10 downto 0);
    
  --character 
  signal CE_half : boolean := false; --true every 2nd videoclock, used for
                                     --horizontal streching
  signal row_odd : boolean := false; --true every 2nd row, used for vertival stretching
  signal col_fg_q, col_bg_q :T_COLOR;
  --colors (not used yet)

  CONSTANT C_COLOR_BG :T_COLOR := "001";   --blue
  CONSTANT C_COLOR_FG :T_COLOR := "110";   --yellow

  signal pixel_col_q : std_logic_vector(2 downto 0);
  signal pixel_bw    : std_logic;

  --a line of 8 pixels in a character
  signal char_line_q                             : std_logic_vector(7 downto 0):= (others => '0');
  
  --counting character hor. and vertical

  --row within character --(8), incrementat every line
  signal rowInChar_cnt_q, colInChar_cnt_q        : integer range 0 to 7 := 0;
  --count all characters in a row
  signal CharCol_cnt_q                           : unsigned(5 downto 0):= "100000"; --stopped
  signal CharRow_cnt_q                           : unsigned(5 downto 0):= "100000"; --stopped

  signal next_char_right : boolean;
  signal vram_video_data : std_logic_vector(7 downto 0);
  signal addr_line_slv   : std_logic_vector(2 downto 0);
  signal char_area_n     : std_logic;
begin

  char_rom_1: char_rom
     generic map (
       G_SYSTEM => DEV)
     port map (
       clk         => video_clk,
       cs_ni       => --char_area_n,
                      '0',
       data_o      => data4crom,
       addr_char_i => std_logic_vector(crom_index_high),
       addr_line_i => addr_line_slv);

   addr_line_slv <= std_logic_vector(to_unsigned(rowInChar_cnt_q,3));

   video_ram_1: video_ram
     generic map (
       G_System   => DEV,
       G_READONLY => G_READONLY)
     port map (
       cpu_clk      => clk,
       cpu_cs_ni    => cs_ni,
       cpu_we_ni    => we_ni,
       cpu_addr_i   => addr_i(9 downto 0),
       cpu_data_o   => data_o,
       cpu_data_i   => data_i,
       video_clk    => video_clk,
       video_cs_ni  => char_area_n,
       video_addr_i => vram_video_addr,
       video_data_o => vram_video_data);
   
   --read pointer to video ram
   vram_video_addr   <= std_logic_vector(CharRow_cnt_q(4 downto 0) & CharCol_cnt_q(4 downto 0));
   process(video_clk)
   begin
     if rising_edge(video_clk) then
        --horizontal
       --colInChar 
       --CharCol
       if hcount = 144 then
         CharCol_cnt_q <= (others => '0');
       elsif next_char_right and CE_half then
         if CharCol_cnt_q(5) /= '1' then   --count until 32 chars, then stop
           CharCol_cnt_q <= CharCol_cnt_q + 1;
         end if;
         char_area_n <= CharRow_cnt_q(5) or CharCol_cnt_q(5);
       end if;
       
       if hcount = 144 then
         colInChar_cnt_q <= 0;
         next_char_right <= false;
       else
         if CE_half then
           if colInChar_cnt_q = 7 then
             colInChar_cnt_q <= 0;
             next_char_right <= true;
             --character code from videoram
             crom_index_high <= unsigned(vram_video_data);
           else
             colInChar_cnt_q <= colInChar_cnt_q + 1;
             next_char_right <= FALSE;
           end if;
         end if;
       end if;
       
       --adress for crom increment
       --vertical
       --rowInChar
       if hcount = 820 then
         if vcount = 44 then
           row_odd <= false;
         else
           row_odd <= not row_odd;
         end if;
         --
         if row_odd then
           if rowInChar_cnt_q = 7 then
             rowInChar_cnt_q <= 0;
           else
             rowInChar_cnt_q <= rowInChar_cnt_q + 1;
           end if;
         end if;
       end if;
       --CharRow
       if hcount = 819 then -- was 144
         if vcount = 44 then
           rowInChar_cnt_q <= 0;
           CharRow_cnt_q   <= (others => '0');
         elsif rowInChar_cnt_q = 7 and CharRow_cnt_q(5) /= '1' and row_odd then
           CharRow_cnt_q <= CharRow_cnt_q + 1;
         end if;
       end if;  --hcount = 0
     end if;
   end process;

   --chipenable to stretch every pixel two times in every direction
   process(video_clk)
   begin
     if rising_edge(video_clk) then
       if hcount = 899 then
         CE_half <= false;
       else
         CE_half <= not CE_half;
       end if;
     end if; 
   end process;
   
   --serialize character rom
   process(video_clk)
   begin
     if rising_edge(video_clk) then
       if CE_half then                  --stretching
         if next_char_right then
           char_line_q <= data4crom;
         else
           char_line_q(7 downto 0) <= char_line_q(6 downto 0) & '0';
         end if;
       end if;
     end if;
   end process;

   pixel_bw <= char_line_q(7);
   --color the pixel
   process(video_clk)
   begin
     if rising_edge(video_clk) then
       --sync in, prevent foreground color = background_colour    
       col_bg_q <= col_bg;
       col_fg_q(2 downto 1) <= col_fg(2 downto 1);
       if col_bg = col_fg then
         col_fg_q(0) <= not col_fg(0);
       else
         col_fg_q(0) <=     col_fg(0);
       end if;
       
       --Foreground color only in visible area (32x32 characters)
       if blank_area = '0' then
         if char_area_n = '0' then
           if pixel_bw = '1' then
             pixel_col_q <= col_fg_q;
           else
             pixel_col_q <= col_bg_q;
           end if;
         else  --out of 32x32 character area
           pixel_col_q <= --col_bg_q;
                          (others => '0');  --black out of 32x32 character araea
         end if;
       else
         pixel_col_q <= (others => '0');
       end if;
     end if;
   end process;

   blue_o   <= pixel_col_q(0);
   green_o  <= pixel_col_q(1);
   red_o    <= pixel_col_q(2);

   vga_controller_800_600_i0: entity work.vga_controller_800_600
     port map (
       rst       => '0',
       pixel_clk => video_clk,
       HS        => hsync_o,
       VS        => vsync_o,
       hcount    => hcount_slv,
       vcount    => vcount_slv,
       blank     => blank_area
     );
   hcount    <= unsigned( hcount_slv);
   vcount    <= unsigned( vcount_slv);

   end architecture behave;
