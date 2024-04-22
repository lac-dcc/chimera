--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   vga_display.vhd
--   Displays the image on the frambuffer to the VGA
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library WORK;
use work.ov7670_pkg.all;

entity vga_display is
  Port (
    rst         : in std_logic;
    clk         : in std_logic;
    visible     : in std_logic;
    new_pxl     : in std_logic;
    hsync       : in std_logic;
    vsync       : in std_logic;
    rgbmode     : in std_logic;
    col         : in unsigned(10-1 downto 0);
    row         : in unsigned(10-1 downto 0);
    frame_pixel : in std_logic_vector(c_nb_buf-1 downto 0);
    frame_addr  : out std_logic_vector(c_nb_img_pxls-1 downto 0);
    vga_red     : out std_logic_vector(3 downto 0);
    vga_green   : out std_logic_vector(3 downto 0);
    vga_blue    : out std_logic_vector(3 downto 0)
  );
end vga_display;

architecture behav of vga_display is

  -- declared in ov7670_pkg.vhd
  -- constant c_img_cols : natural := 160;
  -- constant c_img_rows : natural := 120;

  signal addr : unsigned(c_nb_img_pxls-1 downto 0);

begin

  P_calc_addr: process(rst, clk)
  begin
    if rst = c_on then
      addr <= (others => '0');
    elsif clk'event and clk='1' then
      if row < c_img_rows then
        if col < c_img_cols then
          if new_pxl = '1' then
            --it may have a simulation problem in the last pixel of the last row
            addr <= addr + 1;
          end if;
        end if;
      else
        addr <= (others => '0');
      end if;
    end if;
  end process;

  frame_addr <= std_logic_vector(addr);

  P_display: process(visible, col, row, frame_pixel,rgbmode)
  begin
    vga_red   <= (others=>'0');
    vga_green <= (others=>'0');
    vga_blue  <= (others=>'0');
    if visible = '1' then
      vga_red   <= (others=>'0');
      vga_green <= (others=>'0');
      vga_blue  <= (others=>'0');
      if col < c_img_cols and row < c_img_rows then
          if rgbmode = '1' then
            vga_red   <= frame_pixel(c_nb_buf-1 downto c_nb_buf-c_nb_buf_red);
            vga_green <= frame_pixel(c_nb_buf-c_nb_buf_red-1 downto c_nb_buf_blue);
            vga_blue  <= frame_pixel(c_nb_buf_blue-1 downto 0);
          else
            vga_red   <= frame_pixel(7 downto 4);
            vga_green <= frame_pixel(7 downto 4);
            vga_blue  <= frame_pixel(7 downto 4);
          end if;
        --end if;
      elsif col = c_cols_qqvga2 or row = c_rows_qqvga2 then --QQVGA/2 80x60
        vga_red   <= (others=>'1');
        vga_green <= (others=>'0');
        vga_blue  <= (others=>'0');
      elsif col = c_cols_qqvga or row = c_rows_qqvga then --QQVGA 160x120
        vga_red   <= (others=>'0');
        vga_green <= (others=>'1');
        vga_blue  <= (others=>'0');
      elsif col = c_cols_qvga or row = c_rows_qvga then --QVGA 320x240
        vga_red   <= (others=>'0');
        vga_green <= (others=>'0');
        vga_blue  <= (others=>'1');
      end if;
    end if;
  end process;

end behav;
