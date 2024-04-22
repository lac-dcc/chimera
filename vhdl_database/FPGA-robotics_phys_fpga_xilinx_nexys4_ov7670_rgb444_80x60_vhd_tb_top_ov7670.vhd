--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:51:22 09/21/2019
-- Design Name:   
-- Module Name:   F:/urjc/proyectos/vhdl/ov7670/v03/tb_top_ov7670.vhd
-- Project Name:  v03
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_ov7670
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
USE ieee.numeric_std.ALL;

library work;
use work.ov7670_pkg.all;
 
ENTITY tb_top_ov7670 IS
END tb_top_ov7670;
 
ARCHITECTURE tb OF tb_top_ov7670 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_ov7670
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
			
      sw0_test_cmd : in    std_logic; --if '1', step by step SCCB instructions
      -- 0: RGB444, 1: RGB555, 2: RGB565, 3: YUV, 4(others): UV-Y
      -- always RGB444 for now
      --sw13_rgbmode : in    std_logic_vector(2 downto 0);
      sw4_test_osc : in    std_logic; --if '1' show oscilloscope
      sw56_regs    : in    std_logic_vector(1 downto 0); --choose regs sccb

      btnr_test    : in    std_logic; --if sw='1', SCCB sent one by one
      btnl_oscop   : in    std_logic; --restart capture oscilloscope(after trig
		
      ov7670_sioc : OUT  std_logic;
      ov7670_siod : OUT  std_logic;
      ov7670_rst_n : OUT  std_logic;
      ov7670_pwdn : OUT  std_logic;
      ov7670_vsync : IN  std_logic;
      ov7670_href : IN  std_logic;
      ov7670_pclk : IN  std_logic;
      ov7670_xclk : OUT  std_logic;
      ov7670_d : IN  std_logic_vector(7 downto 0);

      led          : out    std_logic_vector(7 downto 0);

      vga_red      : out   std_logic_vector(3 downto 0);
      vga_green    : out   std_logic_vector(3 downto 0);
      vga_blue     : out   std_logic_vector(3 downto 0);
      vga_hsync    : out   std_logic;
      vga_vsync    : out   std_logic;

      anode7seg    : out   std_logic_vector(7 downto 0);
      seg7         : out   std_logic_vector(6 downto 0);
      
      btnc_resend  : in    std_logic
        );
    END COMPONENT;

   -- SCALING_PCLK_DIV OV7670 camera register
   constant PCLK_DIV : natural := 8; -- divided by 8
   -- SCALING_DCWCTR OV7670 camera register, vertical downsampling
   constant V_DIV : natural := 8; -- divided by 8:

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal ov7670_vsync : std_logic := '0';
   signal ov7670_href : std_logic := '0';
   signal ov7670_href_out : std_logic := '0';
   signal ov7670_pclk : std_logic := '0';
   signal ov7670_pclk_out : std_logic := '0'; --it can be divided by PCLK_DIV
   
   signal cnt_pclk_line:unsigned(10-1 downto 0) := (others=>'0');
   signal cnt_href : unsigned(10-1 downto 0) := (others=>'0');

   signal ov7670_d : std_logic_vector(7 downto 0) := (others => '0');
   signal sw0_test_cmd : std_logic :='0'; --if '1', step by step SCCB instructions
      -- 0: RGB444, 1: RGB555, 2: RGB565, 3: YUV, 4(others): UV-Y
      -- always RGB444 for now
      --sw13_rgbmode : in    std_logic_vector(2 downto 0);
   signal   sw4_test_osc : std_logic :='0'; --if '1' show oscilloscope
   signal   sw56_regs    : std_logic_vector(1 downto 0) :="11"; --choose regs sccb

   signal   btnr_test    : std_logic :='0'; --if sw='1', SCCB sent one by one
   signal   btnc_resend  : std_logic :='0';
   signal   btnl_oscop   : std_logic :='0'; --restart capture oscilloscope(after trig	
	

 	--Outputs
   signal ov7670_sioc : std_logic;
   signal ov7670_siod : std_logic;
   signal ov7670_rst_n : std_logic;
   signal ov7670_pwdn : std_logic;
   signal ov7670_xclk : std_logic;
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
   uut: top_ov7670 PORT MAP (
          rst => rst,
          clk => clk,
          sw0_test_cmd => sw0_test_cmd,
          sw4_test_osc => sw4_test_osc,
          sw56_regs    => sw56_regs,
          btnr_test    => btnr_test,
          btnl_oscop   => btnl_oscop,

          ov7670_sioc => ov7670_sioc,
          ov7670_siod => ov7670_siod,
          ov7670_rst_n => ov7670_rst_n,
          ov7670_pwdn => ov7670_pwdn,
          ov7670_vsync => ov7670_vsync,
          ov7670_href => ov7670_href_out,
          ov7670_pclk => ov7670_pclk_out,
          ov7670_xclk => ov7670_xclk,
          ov7670_d => ov7670_d,
          led => led,
          vga_red => vga_red,
          vga_green => vga_green,
          vga_blue => vga_blue,
          vga_hsync => vga_hsync,
          vga_vsync => vga_vsync,
          btnc_resend => btnc_resend
        );

   -- Clock process definitions
   clk_process :process
   begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
   end process;
 
  ov7670_pclk_process: process
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
     wait until ov7670_pclk'event and ov7670_pclk = '0';
     wait until ov7670_pclk'event and ov7670_pclk = '0';
     wait until ov7670_pclk'event and ov7670_pclk = '0';
     wait until ov7670_pclk'event and ov7670_pclk = '0';
     wait until ov7670_pclk'event and ov7670_pclk = '0';
     wait until ov7670_pclk'event and ov7670_pclk = '0';
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
         while cnt_pclk_line < 640 loop
           ov7670_d <= std_logic_vector(cnt_pclk_line(7 downto 0));
           wait for ov7670_pclk_period;
           ov7670_d <= std_logic_vector(cnt_pclk_line(8 downto 1));
           wait for ov7670_pclk_period;
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
      rst <= c_on;
      wait for 100 ns;	
      rst <= c_off;
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
