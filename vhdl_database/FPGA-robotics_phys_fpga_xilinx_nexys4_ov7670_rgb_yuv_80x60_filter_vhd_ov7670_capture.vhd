--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   ov7670_capture.vhd
--   
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.ov7670_pkg.all;

entity ov7670_capture is
  port (
    rst   : in   std_logic;    -- FPGA reset
    clk   : in   std_logic;    -- FPGA clock
    -- camera pclk (byte clock) (~40ns)  
    -- 2 bytes is a pixel
    pclk         : in   std_logic;    
    href         : in   std_logic;
    vsync        : in   std_logic;
    rgbmode      : in   std_logic; -- RGB444 or YUV422
    swap_r_b     : in   std_logic; -- swaps red and blue
    dataout_test : out  std_logic_vector(11 downto 0);
    led_test     : out std_logic_vector(3 downto 0);
    data         : in   std_logic_vector (7 downto 0);
    addr         : out  std_logic_vector (c_nb_img_pxls-1 downto 0);
    dout         : out  std_logic_vector (c_nb_buf-1 downto 0);
    we           : out  std_logic
);
end ov7670_capture;

architecture Behavioral of ov7670_capture is

   signal vsync_rg1, vsync_rg2, vsync_rg3 : std_logic;  -- registered vsync
   -- it seems that vsync has some spurious 
   signal vsync_3up : std_logic;

   signal href_rg1, href_rg2   : std_logic;  -- registered href
   signal href_rg3 : std_logic; --3rd

   signal pclk_rg1, pclk_rg2, pclk_rg3   : std_logic;  -- registered pclk

   signal data_rg1, data_rg2   : std_logic_vector(7 downto 0); --registered data
   signal data_rg3 : std_logic_vector(7 downto 0);  -- registered data 3rd

   signal pclk_fall  : std_logic;
   signal pclk_rise  : std_logic; -- with reg 2 and 3
   signal pclk_rise_prev  : std_logic; -- with reg 1 and 2, so in 3 is ready
   signal pclk_rise_post  : std_logic; -- after pclk_rise

   signal cnt_byte  : std_logic; -- count to 2: 2 bytes per pixel
   signal cnt_pxl      : unsigned (c_nb_img_pxls-1 downto 0);
   -- number of pixels in the previous lines, not considering the actual line
   signal cnt_pxl_base : unsigned (c_nb_img_pxls-1 downto 0);
   signal cnt_line_pxl : unsigned (c_nb_line_pxls-1 downto 0);
   signal cnt_line_totpxls : unsigned (c_nb_line_pxls-1 downto 0);

   -- indicates if the column is in the frame of the image (taking less cols)
   --signal col_inframe : std_logic;
   -- indicates if the number of pixels are in the frame of the image
   -- (taking less rows and cols)
   signal img_inframe : std_logic;
  

   -- there should be 4 clks in a pclk (byte), but just in case, make 
   -- another bit to avoid overflow and go back in 0 before time
   signal cnt_clk   : unsigned (7 downto 0);
   signal cnt_pclk_max : unsigned (7 downto 0);
   signal cnt_pclk_max_freeze : unsigned (7 downto 0);

   signal gray  : std_logic_vector (7 downto 0);
   signal red   : std_logic_vector (c_nb_buf_red-1 downto 0);
   signal green : std_logic_vector (c_nb_buf_green-1 downto 0);
   signal blue  : std_logic_vector (c_nb_buf_blue -1 downto 0);
   
begin

  P_clk_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_clk <= (others => '0');
      cnt_pclk_max <= (others => '0');
      cnt_pclk_max_freeze <= (others => '0');
      led_test(0) <= '0';
    elsif clk'event and clk='1' then
      if href_rg2 = '1' then 
        if pclk_rise = '1' then
          cnt_clk <= (others => '0');
          led_test(0) <= '1';
          cnt_pclk_max <= cnt_clk;
          cnt_pclk_max_freeze <= cnt_pclk_max;
        else
          cnt_clk <= cnt_clk + 1;
        end if;
      else
        cnt_clk <= (others => '0');
      end if;
    end if;
  end process;

  -- register 3 times all the camera inputs to synchronize
  P_reg: process(rst, clk)
  begin
    if rst = c_on then
      pclk_rg1  <= '0';
      pclk_rg2  <= '0';
      href_rg1  <= '0';
      href_rg2  <= '0';
      vsync_rg1 <= '0';
      vsync_rg2 <= '0';
      data_rg1 <= (others=>'0');
      data_rg2 <= (others=>'0');
      -- 3rd to detect falling edge
      pclk_rg3  <= '0';
      href_rg3  <= '0';
      vsync_rg3 <= '0';
      data_rg3 <= (others=>'0');
      pclk_rise_post <= '0';
    elsif clk'event and clk='1' then
      pclk_rg1  <= pclk;
      pclk_rg2  <= pclk_rg1;
      href_rg1  <= href;
      href_rg2  <= href_rg1;
      vsync_rg1 <= vsync;
      vsync_rg2 <= vsync_rg1;
      data_rg1  <= data;
      data_rg2  <= data_rg1;
      -- 3rd
      pclk_rg3  <= pclk_rg2;
      href_rg3  <= href_rg2;
      vsync_rg3 <= vsync_rg2;
      data_rg3  <= data_rg2;
      pclk_rise_post <= pclk_rise;
    end if;
  end process;

  -- since some times it is up up to 2 cycles, has to be '1' during
  -- the 3 following cycles
  vsync_3up <= vsync_rg3 and vsync_rg2 and vsync_rg1 and vsync;

  -- FPGA clock is 10ns and pclk is 40ns
  pclk_fall <= '1' when (pclk_rg2='0' and pclk_rg3='1') else '0';
  pclk_rise_prev <= '1' when (pclk_rg1='1' and pclk_rg2='0') else '0';
  pclk_rise <= '1' when (pclk_rg2='1' and pclk_rg3='0') else '0';

  -- each pixel has 2 bytes, each byte in each pclk
  -- each pixel -> 2 pclk
  P_pxl_cnt: process(rst,clk)
  begin
    if rst = c_on then
      cnt_pxl <= (others => '0');
      cnt_line_pxl <= (others => '0');
      cnt_pxl_base <= (others => '0');
      cnt_line_totpxls <= (others => '0');
      cnt_byte <= '0';
    elsif clk'event and clk='1' then
      --if vsync_rg3 = '1' then -- there are some glitches
      if vsync_3up = '1' then  -- new screen
        cnt_pxl <= (others => '0');
        cnt_pxl_base <= (others => '0');
        cnt_line_pxl <= (others => '0');
        cnt_byte <= '0';
      elsif href_rg3 = '1' then -- is zero at optical blank COM[6]
        --if img_inframe = '1' then -- not necessary
          if pclk_rise = '1' then
            if cnt_byte = '1' then
              cnt_pxl <= cnt_pxl + 1;
              cnt_line_pxl <= cnt_line_pxl + 1;
            end if;
            cnt_byte <= not cnt_byte;
          end if;
          if href_rg2 = '0' then -- will be a falling edge
            cnt_line_totpxls <= cnt_line_pxl; -- cnt_line_totpxls is to test
            -- it is not reliable to count all the pixels of a line,
            -- some lines have more other less
            cnt_pxl <= cnt_pxl_base + c_img_cols;
            cnt_pxl_base <= cnt_pxl_base + c_img_cols;
            cnt_line_pxl <= (others => '0');
          end if;
        --end if;
      else
        cnt_byte <= '0';
        cnt_line_pxl <= (others => '0');
      end if;
    end if;
  end process;

  --col_inframe <= '1' when cnt_line_pxl < c_img_cols else '0';
  img_inframe <= '1' when cnt_pxl < c_img_pxls else '0';

  --dataout_test <= "00" & std_logic_vector(cnt_line_totpxls); -- 2 + 10 bits
  dataout_test <= "0000" & std_logic_vector(cnt_pclk_max_freeze); -- 4 + 8 bits

  P_save_byte: process(rst, clk)
  begin
    if rst = c_on then
      red   <= (others => '0');
      green <= (others => '0');
      blue  <= (others => '0');
      gray  <= (others => '0');
    elsif clk'event and clk= '1' then
      if href_rg3 = '1' then  -- visible
        --if cnt_clk = "01" then -- I think this is the safest
        --if cnt_clk(2 downto 0) = "011" then -- I think this is the safest
        --if pclk_fall = '1' then
        if pclk_rise = '1' then
          if cnt_byte = '0' then 
            if rgbmode = '1' then -- RGB Mode ON
              if swap_r_b = '0' then
                red   <= data_rg3(3 downto 0);
              else
                blue <= data_rg3(3 downto 0);
              end if;
            else -- YUV (gray first byte)
              gray  <= data_rg3;
            end if;
          else
            if rgbmode = '1' then -- RGB Mode ON
              green <= data_rg3(7 downto 4);
              if swap_r_b = '0' then
                blue <= data_rg3(3 downto 0);
              else
                red <= data_rg3(3 downto 0);
              end if;
            else -- YUV 
              null; -- we dont get U or V
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;

  dout <= (red & green & blue) when (rgbmode = '1') else "0000" & gray;
  addr <= std_logic_vector(cnt_pxl);
  we <= '1' when (href_rg3 ='1' and cnt_byte='1' and pclk_rise_post='1')
            -- not necessary
            --      and col_inframe = '1' and img_inframe = '1')
         else '0';

end Behavioral;

