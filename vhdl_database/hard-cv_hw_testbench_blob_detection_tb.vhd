--------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com>
--
-- Create Date:   16:29:52 03/15/2012
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/projects/fpga-cam/platform/papilio/SPARTCAM/blob_detection_tb.vhd
-- Project Name:  SPARTCAM
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: blob_detection
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
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY blob_detection_tb IS
END blob_detection_tb;
 
ARCHITECTURE behavior OF blob_detection_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
	component virtual_camera is
	generic(IMAGE_PATH : string ; PERIOD : time := 10ns);
	port(
		clk : in std_logic; 
		resetn : in std_logic; 
		pixel_data : out std_logic_vector(7 downto 0 ); 
		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic );
	end component;
 
    COMPONENT blob_detection
	 GENERIC(LINE_SIZE : natural := 640);
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         pixel_in_clk : IN  std_logic;
        pixel_in_hsync : IN  std_logic;
        pixel_in_vsync : IN  std_logic;
         pixel_in_data : IN  std_logic_vector(7 downto 0);
			blob_data : out std_logic_vector(7 downto 0);
				--memory_interface to copy results onpixel_in_vsync
			mem_addr : out std_logic_vector(15 downto 0);
			mem_data : inout std_logic_vector(15 downto 0);
			mem_wr : out std_logic
        );
    END COMPONENT;
    
	constant clk_period : time := 10 ns ;
	constant pclk_period : time := 40 ns ;
	
	signal clk, resetn : std_logic ;
	signal pixel_in_clk,pixel_in_hsync,pixel_in_vsync, send_blob : std_logic ;
	signal pixel_in_data, blob_data : std_logic_vector(7 downto 0 ) := (others => '0');
	signal px_count, line_count, byte_count : integer := 0 ;
	
	signal posx_0, posy_0 : std_logic_vector(9 downto 0);
	signal posx_1, posy_1 : std_logic_vector(9 downto 0);
	signal blob_label : std_logic_vector(7 downto 0);

	
	signal mem_addr, mem_data : std_logic_vector(15 downto 0);
	signal mem_wr : std_logic ;
 
BEGIN

	main_clk : process
	begin
		clk <= '1' ;
		wait for clk_period/2 ;
		clk <= '0';
		wait for clk_period/2 ;
	end process ;
	
	main_reset : process
	begin
		resetn <= '0' ;
		wait for pclk_period * 100;
		resetn <= '1' ;
		wait ;
	end process ;
 
	cam0 : virtual_camera
	generic map(IMAGE_PATH => "/home/jpiat/Pictures/blob_test.pgm", PERIOD => pclk_period)
	port map(
		clk => clk,
		resetn => resetn,
		pixel_data =>  pixel_in_data,
		pixel_out_clk => pixel_in_clk,
		pixel_out_hsync =>pixel_in_hsync ,
		pixel_out_vsync =>pixel_in_vsync);
 
	-- Instantiate the Unit Under Test (UUT)
   uut: blob_detection
		generic map(LINE_SIZE => 320)
		PORT MAP (
          clk => clk,
          resetn => resetn,
          pixel_in_clk => pixel_in_clk,
         pixel_in_hsync =>pixel_in_hsync,
         pixel_in_vsync =>pixel_in_vsync,
          pixel_in_data => pixel_in_data,
			 blob_data => blob_data,
			 mem_addr => mem_addr,
			mem_data => mem_data , 
			mem_wr => mem_wr
        );

	mem_proc : process(clk)
	begin
		if rising_edge(clk) then
			if mem_wr = '1' then
				if mem_addr = 0 then
					posy_0 <= mem_data(9 downto 0);
					posx_0(5 downto 0) <= mem_data(15 downto 10);
				end if ;
				
				if mem_addr = 1 then
					posy_1 <= mem_data(13 downto 4);
					posx_1(1 downto 0) <= mem_data(15 downto 14);
					posx_0(9 downto 6) <= mem_data(3 downto 0);
				end if ;
				
				if mem_addr = 2 then
					posx_1(9 downto 2) <= mem_data(7 downto 0);
					blob_label <= mem_data(15 downto 8);
				end if ;
			end if; 
		end if ;
	end process ;

END;
