--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:51:57 09/23/2021
-- Design Name:   
-- Module Name:   C:/Users/felipe.machado/urjc/proyectos/jderobot/ov7670x2_colorcentroid_160x120/tb_ov7670x2.vhd
-- Project Name:  ov7670x2_colorcentroid_160x120
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_ov7670x2_centroid
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

-- in some tools, functions have to be in other packages
library WORK;
use WORK.PKG_FUN.all;
 
ENTITY tb_ov7670x2 IS
END tb_ov7670x2;
 
ARCHITECTURE behavior OF tb_ov7670x2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_ov7670x2_centroid
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         ov7670_1_sioc : OUT  std_logic;
         ov7670_1_siod : OUT  std_logic;
         ov7670_1_rst_n : OUT  std_logic;
         ov7670_1_vsync : IN  std_logic;
         ov7670_1_href : IN  std_logic;
         ov7670_1_pclk : IN  std_logic;
         ov7670_1_xclk : OUT  std_logic;
         ov7670_1_pwdn : OUT  std_logic;
         ov7670_1_d : IN  std_logic_vector(7 downto 0);
         ov7670_2_sioc : OUT  std_logic;
         ov7670_2_siod : OUT  std_logic;
         ov7670_2_rst_n : OUT  std_logic;
         ov7670_2_vsync : IN  std_logic;
         ov7670_2_href : IN  std_logic;
         ov7670_2_pclk : IN  std_logic;
         ov7670_2_xclk : OUT  std_logic;
         ov7670_2_pwdn : OUT  std_logic;
         ov7670_2_d : IN  std_logic_vector(7 downto 0);
         led : OUT  std_logic_vector(7 downto 0);
         btnl_proc_ctrl_1 : IN  std_logic;
         btnr_proc_ctrl_2 : IN  std_logic;
         vga_red : OUT  std_logic_vector(3 downto 0);
         vga_green : OUT  std_logic_vector(3 downto 0);
         vga_blue : OUT  std_logic_vector(3 downto 0);
         vga_hsync : OUT  std_logic;
         vga_vsync : OUT  std_logic
        );
    END COMPONENT;

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

    -- using QQVGA
    constant c_img_cols : natural := c_cols_qqvga;
    constant c_img_rows : natural := c_rows_qqvga;

    -- number of bits to count the pixels of a line
    constant c_nb_line_pxls : natural := log2i(c_img_cols-1) + 1;

    constant c_img_pxls : natural := c_img_cols * c_img_rows;

    -- number of bits necessary to represent c_img_pxls in binary
    constant c_nb_img_pxls : natural := log2i(c_img_pxls-1) + 1;

   -- SCALING_PCLK_DIV OV7670 camera register
   constant PCLK_DIV : natural := 4; -- divided by 4 : 640/4= 160
   -- SCALING_DCWCTR OV7670 camera register, vertical downsampling
   constant V_DIV : natural := 4; -- divided by 4:
    
   constant c_clk_period  : integer := 10; -- fpga clk peridod in ns

  constant c_ov_lin_bpr     : natural := 17;
   

   signal cnt_pclk_line:unsigned(10-1 downto 0) := (others=>'0');
   signal cnt_href : unsigned(10-1 downto 0) := (others=>'0');

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal ov7670_vsync : std_logic := '0';
   signal ov7670_href : std_logic := '0';
   signal ov7670_href_out : std_logic := '0';
   signal ov7670_pclk : std_logic := '0';
   signal ov7670_pclk_out : std_logic := '0';
   signal ov7670_d : std_logic_vector(7 downto 0) := (others => '0');
   --signal ov7670_2_d : std_logic_vector(7 downto 0) := (others => '0');
   signal btnl_proc_ctrl_1 : std_logic := '0';
   signal btnr_proc_ctrl_2 : std_logic := '0';

 	--Outputs
   signal ov7670_1_sioc : std_logic;
   signal ov7670_1_siod : std_logic;
   signal ov7670_1_rst_n : std_logic;
   signal ov7670_1_xclk : std_logic;
   signal ov7670_1_pwdn : std_logic;
   signal ov7670_2_sioc : std_logic;
   signal ov7670_2_siod : std_logic;
   signal ov7670_2_rst_n : std_logic;
   signal ov7670_2_xclk : std_logic;
   signal ov7670_2_pwdn : std_logic;
   signal led : std_logic_vector(7 downto 0);
   signal vga_red : std_logic_vector(3 downto 0);
   signal vga_green : std_logic_vector(3 downto 0);
   signal vga_blue : std_logic_vector(3 downto 0);
   signal vga_hsync : std_logic;
   signal vga_vsync : std_logic;

   -- Clock period definitions
   constant clk_period : time := c_clk_period * 1 ns;
   constant ov7670_pclk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_ov7670x2_centroid PORT MAP (
          rst => rst,
          clk => clk,
          ov7670_1_sioc => ov7670_1_sioc,
          ov7670_1_siod => ov7670_1_siod,
          ov7670_1_rst_n => ov7670_1_rst_n,
          ov7670_1_vsync => ov7670_vsync,
          ov7670_1_href => ov7670_href,
          ov7670_1_pclk => ov7670_pclk_out,
          ov7670_1_xclk => ov7670_1_xclk,
          ov7670_1_pwdn => ov7670_1_pwdn,
          ov7670_1_d => ov7670_d,
          ov7670_2_sioc => ov7670_2_sioc,
          ov7670_2_siod => ov7670_2_siod,
          ov7670_2_rst_n => ov7670_2_rst_n,
          ov7670_2_vsync => ov7670_vsync,
          ov7670_2_href => ov7670_href,
          ov7670_2_pclk => ov7670_pclk_out,
          ov7670_2_xclk => ov7670_2_xclk,
          ov7670_2_pwdn => ov7670_2_pwdn,
          ov7670_2_d => ov7670_d,
          led => led,
          btnl_proc_ctrl_1 => btnl_proc_ctrl_1,
          btnr_proc_ctrl_2 => btnr_proc_ctrl_2,
          vga_red => vga_red,
          vga_green => vga_green,
          vga_blue => vga_blue,
          vga_hsync => vga_hsync,
          vga_vsync => vga_vsync
        );


   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   ov7670_1_pclk_process :process
   begin
     ov7670_pclk <= '1';
     wait for 6 ns; -- to have it not sync
     while true loop
		ov7670_pclk <= '0';
		wait for ov7670_pclk_period/2;
		ov7670_pclk <= '1';
		wait for ov7670_pclk_period/2;
     end loop;
   end process;
 
  ov7670_pclkout_process: process (ov7670_pclk)
    variable cnt_pclk2 : unsigned(c_nb_img_pxls-1 downto 0) := (others=>'0');
  begin
    if PCLK_DIV = 1 then
      ov7670_pclk_out <= ov7670_pclk;
    elsif ov7670_pclk'event and ov7670_pclk = '0' then
      if cnt_pclk2 < PCLK_DIV/2 then
        ov7670_pclk_out <= '0';
      else 
        ov7670_pclk_out <= '1';
      end if;
      if cnt_pclk2 < PCLK_DIV-1 then
        cnt_pclk2 := cnt_pclk2 + 1;
      else
        cnt_pclk2 := (others => '0');
      end if;
    end if;
  end process;

  ov7670_hrefout_cont: process (ov7670_href)
  begin
    if ov7670_href'event and ov7670_href = '0' then
      if cnt_href < V_DIV-1 then
        cnt_href <= cnt_href + 1;
      else
        cnt_href <= (others => '0');
      end if;
    end if;
  end process;


  ov7670_hrefout_process: process (ov7670_href, cnt_href)
  begin
    if V_DIV = 1 then
      ov7670_href_out <= ov7670_href;
    else
      if cnt_href = 0 then
        ov7670_href_out <= ov7670_href;
      else 
        ov7670_href_out <= '0';
      end if;
    end if;
  end process;


   line_process :process
     variable cnt_pclk : unsigned(c_nb_img_pxls-1 downto 0) := (others=>'0');
   begin
     -- wait for one line
     ov7670_href  <= '0';
     ov7670_vsync <= '0';
     ov7670_d     <= (others=> '0');
     wait until ov7670_pclk'event and ov7670_pclk = '0';
     --wait until ov7670_pclk'event and ov7670_pclk = '0';
     --wait until ov7670_pclk'event and ov7670_pclk = '0';
     --wait until ov7670_pclk'event and ov7670_pclk = '0';
     --wait until ov7670_pclk'event and ov7670_pclk = '0';
     --wait until ov7670_pclk'event and ov7670_pclk = '0';
     --wait until ov7670_pclk'event and ov7670_pclk = '0';
     wait for 784 * 2 * ov7670_pclk_period; -- one line * 2 pclk per byte
     while true loop
       ov7670_vsync <= '1';
       ov7670_href  <= '0';
       -- vsync is 3 lines
       wait for 3 * 784 * 2 * ov7670_pclk_period; -- 3 lines
       ov7670_vsync <= '0';
       -- backporch is 17 lines
       wait for c_ov_lin_bpr * 784 * 2 * ov7670_pclk_period; -- 3 lines
       for i in 0 to 480-1 loop -- visible
         ov7670_href <= '1';
         while cnt_pclk_line < (640/PCLK_DIV) loop
           ov7670_d <= std_logic_vector(cnt_pclk_line(7 downto 0));
           wait for ov7670_pclk_period * PCLK_DIV;
           ov7670_d <= std_logic_vector(cnt_pclk_line(8 downto 1));
           wait for ov7670_pclk_period * PCLK_DIV;
           cnt_pclk_line <= cnt_pclk_line + 1;
         end loop;
         ov7670_href <= '0';
         cnt_pclk_line <= (others =>'0');
         -- 144 pixel
         wait for 144 * 2 * ov7670_pclk_period;
       end loop;
       -- 10 lines of front porch
       wait for 10 * 784 * 2 * ov7670_pclk_period; -- 3 lines
     end loop;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      wait for 100 ns;
      rst <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;


END;
