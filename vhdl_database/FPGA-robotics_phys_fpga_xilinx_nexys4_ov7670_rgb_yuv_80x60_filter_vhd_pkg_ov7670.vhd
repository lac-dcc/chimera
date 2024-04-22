--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
-- 
--   constants declarations, some of them instead of generics

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- in some tools, functions have to be in other packages
library WORK;
use WORK.PKG_FUN.all;

package ov7670_pkg is

  -- c_on: indicates how the pushbuttons, switches and leds are asserted
  constant c_on        : std_logic := '1'; 
  constant c_off       : std_logic := not c_on; 

  -- constant for the 7 segment display
  constant c_anode_on  : std_logic := '0'; 
  constant c_anode_off  : std_logic := not c_anode_on; 
  constant c_seg_on  : std_logic := '0'; 
  constant c_seg_off  : std_logic := not c_seg_on; 
  
  constant c_clk_period  : integer := 10; -- fpga clk peridod in ns
  -- fpga clk frequency in MHz
  constant c_clk_freq    : integer := 1_000_000_000/c_clk_period;

  -- camera system clock:
  --     freq   :  min: 10 MHz  -- typ: 24 MHz  -- Max: 48 MHz
  --     Period : max: 100 ns   -- typ: 42 ns   -- Max: 21 ns
  -- duty cycle between 45% and 55%

  -- VGA
  constant c_cols_vga : natural := 640;
  constant c_rows_vga : natural := 480;
  -- QVGA
  constant c_cols_qvga : natural := 320;
  constant c_rows_qvga : natural := 240;
  -- QQVGA
  constant c_cols_qqvga : natural := 160;
  constant c_rows_qqvga : natural := 120;
  -- QQVGA2
  constant c_cols_qqvga2 : natural := 80;
  constant c_rows_qqvga2 : natural := 60;

  -- QQVGA2
  constant c_img_cols : natural := c_cols_qqvga2;
  constant c_img_rows : natural := c_rows_qqvga2;

  -- number of bits to count the pixels of a line
  constant c_nb_line_pxls : natural := log2i(c_img_cols-1) + 1;

  -- number of bits to count the rows of a image
  constant c_nb_rows : natural := log2i(c_img_rows-1) + 1;

  constant c_img_pxls : natural := c_img_cols * c_img_rows;

  -- number of bits necessary to represent c_img_pxls in binary
  constant c_nb_img_pxls : natural := log2i(c_img_pxls-1) + 1;


  -- number of bits for each color to keep in the memory
  constant c_nb_buf_red   : natural := 4;
  constant c_nb_buf_green : natural := 4;
  constant c_nb_buf_blue  : natural := 4;
  constant c_nb_buf : natural := c_nb_buf_red + c_nb_buf_green + c_nb_buf_blue;
  -- position of the most significant bit of each color:
  constant c_msb_blue   : natural := c_nb_buf_blue-1;
  constant c_msb_red    : natural := c_nb_buf-1;
  constant c_msb_green  : natural := c_msb_blue + c_nb_buf_green;
  -- when keeping the gray level, only 8 bits
  constant c_nb_buf_gray  : natural := 8;

---------- Pixels. 1 Pixel = 2 Pclk (horizontal, columns) -----------------|
--         Each pixel have 2 bytes (2 Pclk)
-- |                             |                |
-- |      active video           |    href        |
-- |                             |                |
-- |                             |                |
-- |<--------- 640 ------------->|<----- 144 ---->|
-- |                             |                |
-- |      c_ov_pxl_visible       | c_ov_pxl_href  |
-- |                                              |
-- |<------------- c_ov_pxl_total: 784 pixels---->|

---------- Lines (vertical) ----------------------------------------------|
-- |              |                       |              |                |
-- |   back       |      active video     |    front     |   vertical     |
-- |   porch      |                       |    porch     |   sync         |
-- |              |                       |              |                |
-- |<----17------>|<--------- 480 ------->|<--- 10------>|<------ 3  ---->|
-- |              |                       |              |                |
-- |c_ov_lin_bpr  |  c_ov_lin_visible     |c_ov_lin_fpor | c_ov_lin_sync  |
-- |              |                       |              |                |
-- |                                      |              |                |
-- |<----- c_ov_lin_sync2endvis: 497 ---->|              |                |
-- |                                                                      |
-- |<------------------------- c_ov_lin_total: 510 lines----------------->| 


  constant c_ov_pxl_visible : natural := c_img_cols;
  constant c_ov_lin_visible : natural := c_img_rows;
  constant c_ov_lin_bpr     : natural := 17;
  constant c_ov_lin_sync2endvis   : natural := 510;
  constant c_ov_lin_total   : natural := 510;


end ov7670_pkg;

