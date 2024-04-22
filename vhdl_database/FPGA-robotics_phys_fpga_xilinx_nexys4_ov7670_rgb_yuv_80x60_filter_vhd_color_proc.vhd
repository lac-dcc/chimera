--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   color_proc.vhd
--   Takes an image from a memory, applies a simple color processing 
--   and saves in another memory
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.ov7670_pkg.all;

entity color_proc is
  port (
    rst      : in   std_logic;    -- FPGA reset
    clk      : in   std_logic;    -- FPGA clock
    rgbfilter: in   std_logic_vector(2 downto 0); -- color filter to be applied
    -- address and pixel of original image
    orig_pxl : in   std_logic_vector(c_nb_buf-1 downto 0);   --orig img pixel
    orig_addr: out  std_logic_vector(c_nb_img_pxls-1 downto 0);--orig img addr
    -- address and pixel of processed image
    proc_we  : out  std_logic;    -- write enable
    proc_pxl : out  std_logic_vector(c_nb_buf-1 downto 0);  -- processed pixel 
    proc_addr: out  std_logic_vector(c_nb_img_pxls-1 downto 0) --address
);
end color_proc;

architecture behav of color_proc is

   signal cnt_pxl     : unsigned(c_nb_img_pxls-1 downto 0);
   signal cnt_pxl_proc: unsigned(c_nb_img_pxls-1 downto 0);
   signal end_pxl_cnt : std_logic;

begin

  -- memory address count
  P_mem_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_pxl       <= (others => '0');
      cnt_pxl_proc <= (others => '0');
      proc_we       <= '0';
    elsif clk'event and clk='1' then
      proc_we       <= '1';
      -- data from original memory received one clock cycle later
      cnt_pxl_proc <= cnt_pxl;
      if end_pxl_cnt = '1' then
        cnt_pxl <= (others => '0');
      else
        cnt_pxl <= cnt_pxl + 1;
      end if;
    end if;
  end process;

  end_pxl_cnt <= '1' when cnt_pxl = c_img_pxls-1 else '0';
  orig_addr   <= std_logic_vector(cnt_pxl);
  proc_addr   <= std_logic_vector(cnt_pxl_proc);

  -- Color processing.
  -- for example, Red filter will pass the color when MSB bit is one
  P_color_process: process(rgbfilter, orig_pxl)
  begin
    proc_pxl <= orig_pxl;
    -- red filter active and low level of red color
    if rgbfilter(2) = '1' and orig_pxl(c_msb_red) = '0' then
      proc_pxl <= (others=>'0');
    end if;
    -- green filter active and low level of green color
    if rgbfilter(1) = '1' and orig_pxl(c_msb_green) = '0' then
      proc_pxl <= (others=>'0');
    end if;
    -- blue filter active and low level of blue color
    if rgbfilter(0) = '1' and orig_pxl(c_msb_blue) = '0' then
      proc_pxl <= (others=>'0');
    end if;
  end process;

end behav;

