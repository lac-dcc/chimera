--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   edge_proc.vhd
--   Takes the pixels of an image from a memory, applies a convolution of a 3x3
--   kernel and saves it in another memory
--   Repeats the process
--   if vfilter = '1' performs the vertical filter
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.ov7670_pkg.all;

entity edge_proc is
  port (
    rst      : in   std_logic;    -- FPGA reset
    clk      : in   std_logic;    -- FPGA clock
    edgefilter: in   std_logic_vector(1 downto 0);    -- 0:horizontal, 1:vertical
    -- address and pixel of original image
    orig_pxl : in   std_logic_vector(c_nb_buf-1 downto 0);   --orig img pixel
    orig_addr: out  std_logic_vector(c_nb_img_pxls-1 downto 0);--orig img addr
    -- address and pixel of processed image
    proc_we  : out  std_logic;    -- write enable
    proc_pxl : out  std_logic_vector(c_nb_buf_gray-1 downto 0);--processed pixel
    proc_addr: out  std_logic_vector(c_nb_img_pxls-1 downto 0) --address
);
end edge_proc;

architecture behav of edge_proc is

  signal  filter_on : std_logic;  -- edge filter on
  signal  vfilter   : std_logic;  -- vertical filter

  signal cnt_pxl     : unsigned(c_nb_img_pxls-1 downto 0);
  -- this is the pixel number entering, since it comes delayed from the memory
  signal pxl_in_num  : unsigned(c_nb_img_pxls-1 downto 0);
  signal end_pxl_cnt : std_logic;
  signal receiving : std_logic;

  -- pixel kernel ordering. gray leves are 8 bits
  --  p00 p01 p02
  --  p10 p11 p12
  --  p20 p21 p22
  signal p00,p01,p02: unsigned(c_nb_buf_gray-1 downto 0);
  signal p10,p11,p12: unsigned(c_nb_buf_gray-1 downto 0);
  signal p20,p21,p22: unsigned(c_nb_buf_gray-1 downto 0);

  -- sobel operations
  -- Horizontal
  signal p_22_20, p_02_00: unsigned(c_nb_buf_gray downto 0); --1bit more
  signal p_top, p_bot:   unsigned(c_nb_buf_gray+1 downto 0); --2bits more
  -- one more bit for the sign
  signal p_sobel_hor_sign: signed(c_nb_buf_gray+2 downto 0); --3bits more
  signal p_sobel_hor_abs : signed(c_nb_buf_gray+2 downto 0); --3bits more
  -- final result, same number of bits
  signal p_sobel_hor : unsigned (c_nb_buf_gray-1 downto 0); 

  -- Vertical
  signal p_22_02, p_20_00: unsigned(c_nb_buf_gray downto 0); --1bit more
  signal p_left, p_right:   unsigned(c_nb_buf_gray+1 downto 0); --2bits more
  -- one more bit for the sign
  signal p_sobel_ver_sign: signed(c_nb_buf_gray+2 downto 0); --3bits more
  signal p_sobel_ver_abs : signed(c_nb_buf_gray+2 downto 0); --3bits more
  -- final result, same number of bits
  signal p_sobel_ver : unsigned (c_nb_buf_gray-1 downto 0); 

  
  -- substract 3 because 3 pixels are out of the buffer to compute the kernel
  type buf is array(0 to c_img_cols-1-3) of unsigned (c_nb_buf_gray-1 downto 0);
  signal cirbuf1 : buf;
  signal cirbuf2 : buf;

  -- buffers' pointer
  signal buf_pt  : unsigned(c_nb_line_pxls-1 downto 0);
  -- end of the buffers count
  signal end_buf_cnt : std_logic;

  -- row and col number to avoid making divisions and multiplications
  signal rownum : unsigned(c_nb_rows-1 downto 0);
  signal colnum : unsigned(c_nb_line_pxls-1 downto 0);

  -- borders of the image
  signal last_col, last_row, first_col, first_row : std_logic;
  signal image_border : std_logic;

begin

  -- memory address count
  P_mem_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_pxl       <= (others => '0');
      pxl_in_num    <= (others => '0');
      receiving     <= '0'; 
    elsif clk'event and clk='1' then
      receiving     <= '1'; -- starts receiving one clock cycle later
      -- data from original memory received one clock cycle later
      pxl_in_num <= cnt_pxl;
      if end_pxl_cnt = '1' then
        cnt_pxl  <= (others => '0');
      else
        cnt_pxl  <= cnt_pxl + 1;
      end if;
    end if;
  end process;

  end_pxl_cnt <= '1' when cnt_pxl = c_img_pxls-1 else '0';
  orig_addr   <= std_logic_vector(cnt_pxl);

  -- 
  -- buffer pointer, row and column count
  P_img_cnt: process(rst, clk)
  begin
    if rst = c_on then
      buf_pt   <= (others => '0');
      colnum   <= (others => '0');
      rownum   <= (others => '0');
    elsif clk'event and clk='1' then
      if receiving = '1' then
        if end_buf_cnt = '1' then
          buf_pt <= (others => '0');
        else
          buf_pt <= buf_pt + 1;
        end if;
        if last_col = '1' then
          colnum <= (others => '0');
          if last_row = '1' then
            rownum <= (others => '0');
          else
            rownum <= rownum + 1;
          end if;
        else
          colnum <= colnum + 1;
        end if;
      end if;
    end if;
  end process;

  end_buf_cnt <= '1' when (buf_pt = c_img_cols-1-3) else '0';
  first_col <= '1' when (colnum = 0) else '0';
  last_col  <= '1' when (colnum = c_img_cols-1) else '0';
  first_row <= '1' when (rownum = 0) else '0';
  last_row  <= '1' when (rownum = c_img_rows-1) else '0';
  image_border <= first_col or last_col or first_row or last_row;

  -- this can be a bram
  P_buf: process (clk)
  begin
    if clk'event and clk='1' then
      if receiving = '1' then
        cirbuf1(to_integer(buf_pt)) <= P20;
        cirbuf2(to_integer(buf_pt)) <= p10;
      end if;
    end if;
  end process;

  P_kernel: process (rst,clk)
  begin
    if rst = '1' then
      p22 <= (others => '0');
      p21 <= (others => '0');
      p20 <= (others => '0');
      p12 <= (others => '0');
      p11 <= (others => '0');
      p10 <= (others => '0');
      p02 <= (others => '0');
      p01 <= (others => '0');
      p00 <= (others => '0');
    elsif clk'event and clk='1' then
      p22 <= unsigned(orig_pxl(c_nb_buf_gray-1 downto 0));
      p21 <= p22;
      p20 <= p21;
      p12 <= cirbuf1(to_integer(buf_pt));
      p11 <= p12;
      p10 <= p11;
      p02 <= cirbuf2(to_integer(buf_pt));
      p01 <= p02;
      p00 <= p01;
    end if;
  end process;

  -- sobel processing -- check if timming is enough
  -- Horizontal |(p22 + 2xp21 + p20) - (p02 + 2xp01 + p00)|
  -- Horizontal top
  p_22_20 <= ('0' & p22) + ('0' & p20); -- p22 + p20
  p_top <= ('0' & p_22_20) + ('0' & p21 & '0'); -- (p22+p20)+ 2xp21
  -- Horizontal bottom
  p_02_00 <= ('0' & p02) + ('0' & p00); -- p02 + p00
  p_bot <= ('0' & p_02_00) + ('0' & p01 & '0'); -- (p02+p00)+ 2xp01

  p_sobel_hor_sign <= signed('0' & p_top) - signed('0' & p_bot);
  p_sobel_hor_abs <= abs (p_sobel_hor_sign); 
  p_sobel_hor <= unsigned(p_sobel_hor_abs(c_nb_buf_gray-1 downto 0)) 
                   when p_sobel_hor_abs < 255 else (others=>'1');

  -- Vertical   |(p22 + 2xp12 + p02) - (p20 + 2xp10 + p00)|
  -- Vertical right
  p_22_02 <= ('0' & p22) + ('0' & p02); -- p22 + p02
  p_right <= ('0' & p_22_02) + ('0' & p12 & '0'); -- (p22+p02)+ 2xp12
  -- Vertical left
  p_20_00 <= ('0' & p20) + ('0' & p00); -- p20 + p00
  p_left  <= ('0' & p_20_00) + ('0' & p10 & '0'); -- (p20+p00)+ 2xp10

  p_sobel_ver_sign <= signed('0' & p_right) - signed('0' & p_left);
  p_sobel_ver_abs <= abs (p_sobel_ver_sign); 
  p_sobel_ver <= unsigned(p_sobel_ver_abs(c_nb_buf_gray-1 downto 0)) 
                   when p_sobel_ver_abs < 255 else (others=>'1');


  filter_on <= edgefilter(0);
  vfilter   <= edgefilter(1);


  -- the central pixel of the kernel is one row and one pixel behind
  proc_addr  <= std_logic_vector(pxl_in_num - (c_img_cols+ 1));
  proc_we    <= receiving;
  P_pixelvalue: Process(filter_on, vfilter, image_border,
                        p_sobel_hor, p_sobel_ver)
  begin
    if filter_on = '0' then -- no filter -> central pixel of the window
      proc_pxl <= std_logic_vector(p11);
    else  -- filter ON
      if image_border = '1' then -- black pixel in image border
        proc_pxl <= (others =>'0');
      elsif vfilter = '0' then -- horizontal filter
        proc_pxl <= std_logic_vector(p_sobel_hor);
      else
        proc_pxl <= std_logic_vector(p_sobel_ver);
      end if;
    end if;
  end process;


end behav;

