library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
		  
library work;
        use work.image_pack.all ;
		  use work.utils_pack.all ;

entity yuv_camera_interface is
	port(
 		clock : in std_logic; 
 		resetn : in std_logic; 
 		pixel_data : in std_logic_vector(7 downto 0 ); 
 		pixel_out_y_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_u_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_v_data : out std_logic_vector(7 downto 0 ); 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pclk, href,vsync : in std_logic
	); 
end yuv_camera_interface;

architecture systemc of yuv_camera_interface is
	
	signal pclk_old, pclk_rising_edge, pclk_falling_edge, nclk : std_logic ;
	signal en_ylatch, en_ulatch, en_vlatch, en_dec_uv : std_logic ;
	signal hsynct, vsynct, pclkt, pixel_clock_out_t  : std_logic ;
	signal vsync_d, href_d : std_logic ;
	signal y_data_a, y_data_b, y_data_c : std_logic_vector(7 downto 0);
	signal u_data_a, u_data_b: std_logic_vector(7 downto 0);
	signal v_data_a, v_data_b: std_logic_vector(7 downto 0);
	
	
	signal pclk_set, pclk_reset, first_pixeln : std_logic ;
	signal cpt_nb_pixel : std_logic_vector(1 downto 0);
	
	signal vsync_old, vsync_falling_edge : std_logic ;

	begin

y_latch : generic_latch 
	 generic map( NBIT => 8)
    port map( clk =>pclk,
           resetn => resetn ,
           sraz => '0' ,
           en => en_ylatch ,
           d => pixel_data , 
           q => y_data_a);
			  
y_latch_b : generic_latch 
	 generic map( NBIT => 8)
    port map( clk =>pclk,
           resetn => resetn ,
           sraz => '0' ,
           en => en_ylatch ,
           d => y_data_a , 
           q => y_data_b);
			  
y_latch_c : generic_latch 
	 generic map( NBIT => 8)
    port map( clk =>pclk,
           resetn => resetn ,
           sraz => '0' ,
           en => en_ylatch ,
           d => y_data_b , 
           q => y_data_c);
			  
u_latch : generic_latch 
	 generic map( NBIT => 8)
    port map( clk => pclk,
           resetn => resetn ,
           sraz => '0' ,
           en => en_ulatch ,
           d => pixel_data , 
           q => u_data_a);
			  
u_latch_b : generic_latch 
	 generic map( NBIT => 8)
    port map( clk => pclk,
           resetn => resetn ,
           sraz => '0' ,
           en => en_dec_uv ,
           d => u_data_a , 
           q => u_data_b);

v_latch_a : generic_latch 
	 generic map( NBIT => 8)
    port map( clk => pclk,
           resetn => resetn ,
           sraz => '0' ,
           en => en_vlatch ,
           d => pixel_data , 
           q => v_data_a);
			  
v_latch_b : generic_latch 
	 generic map( NBIT => 8)
    port map( clk => pclk,
           resetn => resetn ,
           sraz => '0' ,
           en => en_dec_uv ,
           d => v_data_a , 
           q => v_data_b);

	delay_sync : generic_delay
		generic map( WIDTH => 2, DELAY => 3)
		port map(
			clk => pclk, resetn => resetn,
			input(0) => href ,
			input(1) => vsync ,
			output(0) => href_d,
			output(1) => vsync_d
		);		

	process(clock, resetn)
		 begin
			if resetn = '0' then
				hsynct <= '0' ;
				vsynct <= '0' ;
				pclkt <= '0' ;
				pixel_out_y_data <= (others => '0') ; 
				pixel_out_u_data <= (others => '0') ;
				pixel_out_v_data <= (others => '0') ;
				pixel_clock_out_t <= '0' ;
		 	elsif  clock'event and clock = '1'  then
				hsynct <= NOT href_d ; -- changing href into hsync
				vsynct <= vsync_d ;
				pclkt <= pclk ;
				if cpt_nb_pixel(0) = '1' then
					pixel_out_y_data <= y_data_c ; 
					pixel_out_u_data <= u_data_b ;
					pixel_out_v_data <= v_data_b ;
				end if ;
				pixel_clock_out_t <= cpt_nb_pixel(0) ;
			end if ;
	end process ;
	
	process(pclk, resetn)
		 begin
			if resetn = '0' then
				vsync_old <= '0' ;
		 	elsif  pclk'event and pclk = '1'  then
				vsync_old <= vsync ;
			end if ;
	end process ;
	vsync_falling_edge <=  (NOT vsync) and vsync_old ;
	
	 
pixel_counter : simple_counter
	 generic map(NBIT => 2)
    port map( clk => pclk, 
           resetn => resetn, 
           sraz => '0',
           en => '1',
			  load => vsync_falling_edge,
			  E => "01",
           Q => cpt_nb_pixel
			  );
	
	 with cpt_nb_pixel select
		en_ylatch <=  '1' when  "00" ,
						  '1' when  "10" ,
						  '0' when others ;
						  
	 with cpt_nb_pixel select
		en_ulatch <=  '1' when  "01" ,
						  '0' when others ;
						  
	 with cpt_nb_pixel select
		en_vlatch <=  '1' when "11"  ,
						  '0' when others ;
						  
	 with cpt_nb_pixel select
		en_dec_uv <=  '1' when "00"  ,
						  '0' when others ;


	
    pixel_out_hsync <= hsynct ;
	 pixel_out_vsync <= vsynct ;
	 pixel_out_clk <= pixel_clock_out_t ;
						  
end systemc ;
