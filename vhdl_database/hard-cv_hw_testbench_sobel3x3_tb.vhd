-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  USE ieee.std_logic_unsigned.ALL;
  
  LIBRARY work ;
  use work.camera.all ;

  ENTITY sobel3x3_tb IS
  END sobel3x3_tb;

  ARCHITECTURE behavior OF sobel3x3_tb IS 

  -- Component Declaration
			component block3X3v3 is
				generic(WIDTH: natural := 640;
				HEIGHT: natural := 480);
				port(
					resetn : in std_logic; 
					pixel_in_clk,pixel_in_hsync,pixel_in_vsync : in std_logic;
					pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic;
					pixel_in_data : in std_logic_vector(7 downto 0 ); 
					block_out : out mat3);
			end component;

         constant clk_period : time := 5 ns ;
			constant pclk_period : time := 40 ns ;
			
			signal clk, resetn : std_logic ;
			signal pxclk,pixel_in_hsync,pixel_in_vsync : std_logic ;
			signal pxclk_out, pixel_out_hsync, pixel_out_vsync : std_logic ;
			signal pixel : std_logic_vector(7 downto 0 ) := (others => '0');
			signal abs_val : std_logic_vector(7 downto 0 );
			signal raw_val : signed(15 downto 0 ) ;	

  BEGIN

    -- Component Instantiation
         sobel3x3_0 :  sobel3x3 
				port map(
						clk => clk, 
						resetn => resetn, 
						pixel_in_clk => pxclk, 
						hsync =>pixel_in_hsync, 
						vsync =>pixel_in_vsync,
						pixel_out_clk => pxclk_out, 
						pixel_out_hsync => pixel_out_hsync, 
						pixel_out_vsync => pixel_out_vsync,
						pixel_in_data => pixel, 
						pixel_out_data => abs_val
				);

	process
	begin
		resetn <= '0' ;
		wait for 10*clk_period;
		resetn <= '1' ;
		while true loop
			clk <= '0';
			wait for clk_period;
			clk <= '1';
			wait for clk_period; 
		end loop ;
	end process;
	
process
	variable px_count, line_count, byte_count : integer := 0 ;
	begin
		pxclk <= '0';
		if px_count < 640 and line_count >= 20 and line_count < 497 then
			hsync <= '0' ;
			pixel <= pixel + 1;
		else
				hsync <= '1' ;
		end if ;

		if line_count < 3 then
			vsync <= '1' ;
		 else 
			vsync <= '0' ;
		end if ;
		wait for pclk_period;
		
		pxclk <= '1';
		if (px_count = 784 ) then
			px_count := 0 ;
			if (line_count > 510) then
			   line_count := 0;
		  else
		    line_count := line_count + 1 ;
		  end if ;
		else
		  px_count := px_count + 1 ;
		end if ;
		
		wait for pclk_period;

	end process;
  

  END;
