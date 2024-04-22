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
    sw13_rgbmode : in   std_logic_vector(2 downto 0);
    dataout_test : out  std_logic_vector(11 downto 0);
    led_test     : out std_logic_vector(3 downto 0);
    data         : in   std_logic_vector (7 downto 0);
    addr         : out  std_logic_vector (c_nb_img_pxls-1 downto 0);
    dout         : out  std_logic_vector (7 downto 0);
    we           : out  std_logic
);
end ov7670_capture;

architecture Behavioral of ov7670_capture is
   signal pclk_rg1, pclk_rg2   : std_logic;  -- registered pclk
   signal href_rg1, href_rg2   : std_logic;  -- registered href
   signal vsync_rg1, vsync_rg2 : std_logic;  -- registered vsync
   signal data_rg1, data_rg2   : std_logic_vector(7 downto 0); --registered data

   signal pclk_rg3, href_rg3, vsync_rg3 : std_logic; --3rd
   signal data_rg3 : std_logic_vector(7 downto 0);  -- registered data 3rd

   -- it seems that vsync has some spurious 
   signal vsync_3up : std_logic;

   signal pclk_fall  : std_logic;

   signal cnt_byte  : std_logic; -- count to 2: 2 bytes per pixel
   signal cnt_pxl      : unsigned (c_nb_img_pxls-1 downto 0);
   -- number of pixels in the previous lines, not considering the actual line
   signal cnt_pxl_base : unsigned (c_nb_img_pxls-1 downto 0);
   signal cnt_line_pxl : unsigned (c_nb_line_pxls-1 downto 0);
   signal cnt_line_totpxls : unsigned (c_nb_line_pxls-1 downto 0);

   -- there should be 4 clks in a pclk (byte), but just in case, make 
   -- another bit to avoid overflow and go back in 0 before time
   signal cnt_clk   : unsigned (4 downto 0);
   signal cnt_pclk_max : unsigned (4 downto 0);
   signal cnt_pclk_max_freeze : unsigned (4 downto 0);

   signal cnt_05seg : unsigned (25 downto 0);
   constant c_cnt_05seg_end : natural := 50_000_000;

   signal gray  : std_logic_vector (7 downto 0);
   signal red   : std_logic_vector (2 downto 0);
   signal green : std_logic_vector (2 downto 0);
   signal blue  : std_logic_vector (1 downto 0);
   
begin

  P_clk_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_clk <= (others => '0');
      cnt_pclk_max <= (others => '0');
      led_test(0) <= '0';
    elsif clk'event and clk='1' then
      if pclk_fall = '1' then
        cnt_clk <= (others => '0');
        led_test(0) <= '1';
        cnt_pclk_max <= cnt_clk;
      else
        cnt_clk <= cnt_clk + 1;
      end if;
    end if;
  end process;

  P_cnt_05seg: process(rst, clk)
  begin
    if rst = c_on then
      cnt_pclk_max_freeze <= (others => '0');
      cnt_05seg <= (others => '0');
    elsif clk'event and clk='1' then
      if cnt_05seg = c_cnt_05seg_end then
        cnt_05seg <= (others => '0');
        cnt_pclk_max_freeze <= cnt_pclk_max;
      else
        cnt_05seg <= cnt_05seg + 1;
      end if;
    end if;
  end process;

  -- register twice all the camera inputs to synchronize
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
    end if;
  end process;

  -- since some times it is up up to 2 cycles, has to be '1' during
  -- the 3 following cycles
  vsync_3up <= vsync_rg3 and vsync_rg2 and vsync_rg1 and vsync;

  -- FPGA clock is 10ns and pclk is 40ns
  pclk_fall <= '1' when (pclk_rg2='0' and pclk_rg3='1') else '0';

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
        if pclk_fall = '1' then
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
        end if;
      else
        cnt_byte <= '0';
        cnt_line_pxl <= (others => '0');
      end if;
    end if;
  end process;

  --dataout_test <= "00" & std_logic_vector(cnt_line_totpxls); -- 2 + 10 bits
  dataout_test <= "0000000" & std_logic_vector(cnt_pclk_max_freeze); -- 7 + 5 bits

  P_save_byte: process(rst, clk)
  begin
    if rst = c_on then
      red   <= (others => '0');
      green <= (others => '0');
      blue  <= (others => '0');
    elsif clk'event and clk= '1' then
      if href_rg3 = '1' then  -- visible
        --if cnt_clk = "01" then -- I think this is the safest
        if cnt_clk(2 downto 0) = "001" then -- I think this is the safest
        --if pclk_fall = '1' then
          if cnt_byte = '0' then 
             case sw13_rgbmode is
               when "000" => -- RGB444
                 red <= data_rg3(3 downto 1);
               when "001" => -- RGB555
                 red  <= data_rg3(6 downto 4); -- 3,2 not used
                 green (2 downto 1) <= data_rg3(1 downto 0);
               when "010" => -- RGB565
                 red   <= data_rg3(7 downto 5); -- 4,3 not used
                 green <= data_rg3(2 downto 0);
               when "011" => -- YUV (gray first byte)
                 gray  <= data_rg3;
               when others =>
                 null;
             end case;
          else
             case sw13_rgbmode is
               when "000" => -- RGB444
                 green <= data_rg3(7 downto 5);
                 blue <= data_rg3(3 downto 2);
               when "001" => -- RGB555
                 green (0) <= data_rg3(7);
                 blue <= data_rg3(4 downto 3);
               when "010" => -- RGB565
                 blue <= data_rg3(4 downto 3);
               when "011" => 
                 null;
               when others => -- YUV (Y gray second byte)
                 gray  <= data_rg3;
             end case;
          end if;
        end if;
      end if;
    end if;
  end process;

  dout <= (red & green & blue) when unsigned(sw13_rgbmode) < 3 else gray;
  --dout <= std_logic_vector(cnt_pxl(7 downto 0));
  addr <= std_logic_vector(cnt_pxl);
  we <= '1' when (href_rg3 ='1' and cnt_byte='1' and cnt_clk(2 downto 0)="010") else '0';

end Behavioral;

