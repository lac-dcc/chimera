-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  USE ieee.std_logic_unsigned.ALL;
  
  LIBRARY work ;
  use work.image_pack.all ;
   use work.filter_pack.all ;
  ENTITY block_tb IS
  END block_tb;

  ARCHITECTURE behavior OF block_tb IS 

	component virtual_camera is
	generic(IMAGE_PATH : string ; PERIOD : time := 10ns);
	port(
		clk : in std_logic; 
		resetn : in std_logic; 
		pixel_data : out std_logic_vector(7 downto 0 ); 
		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic );
	end component;
  -- Component Declaration

         constant clk_period : time := 5 ns ;
			constant pclk_period : time := 40 ns ;
			
			signal clk, resetn : std_logic ;
			signal pixel_in_clk,pixel_in_hsync,pixel_in_vsync : std_logic ;
			signal pxclk_out, pixel_out_hsync, pixel_out_vsync : std_logic ;
			signal pxclk_out_synced, pixel_out_hsync_synced, pixel_out_vsync_synced : std_logic ;
			signal new_block : std_logic ;
			signal block_out : matNM(0 to 4, 0 to 4) ;
			signal pixel_in_data: std_logic_vector(7 downto 0 ) := (others => '0');

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
	generic map(IMAGE_PATH => "/home/jpiat/Pictures/3b3_square.pgm", PERIOD => pclk_period)
	port map(
		clk => clk,
		resetn => resetn,
		pixel_data =>  pixel_in_data,
		pixel_out_clk => pixel_in_clk,
		pixel_out_hsync =>pixel_in_hsync ,
		pixel_out_vsync =>pixel_in_vsync);
				
		blockNXN_U0 :  blockNxN
		generic map (N => 5)
		port map(
				clk => clk ,
				resetn => resetn, 
				pixel_in_clk => pixel_in_clk, 
				pixel_in_hsync =>pixel_in_hsync, 
				pixel_in_vsync =>pixel_in_vsync,
				pixel_in_data => pixel_in_data, 
				new_block => new_block ,
				block_out => block_out
		);
  

  END;
