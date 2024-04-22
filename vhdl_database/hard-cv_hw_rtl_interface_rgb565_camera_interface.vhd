library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.camera.all ;
		  use work.generic_components.all ;

entity rgb565_camera_interface is
	generic(FORMAT : FRAME_FORMAT := QVGA);
	port(
 		clock : in std_logic; 
 		i2c_clk : in std_logic; 
 		resetn : in std_logic; 
 		pixel_data : in std_logic_vector(7 downto 0 ); 
 		r_data : out std_logic_vector(7 downto 0 ); 
 		g_data : out std_logic_vector(7 downto 0 ); 
 		b_data : out std_logic_vector(7 downto 0 ); 
 		scl : inout std_logic; 
 		sda : inout std_logic; 
 		pixel_out_clk, pixel_out_hsync, pixel_out_vsync : out std_logic; 
 		pxclk, href,pixel_in_vsync : in std_logic
	); 
end rgb565_camera_interface;

architecture systemc of rgb565_camera_interface is
	constant NB_REGS : integer := 255; 
	constant OV7670_I2C_ADDR : std_logic_vector(6 downto 0) := "0100001"; 
	TYPE pixel_state IS (WAIT_LINE, RG, GB) ; 
	TYPE registers_state IS (INIT, SEND_ADDR, WAIT_ACK0, SEND_DATA, WAIT_ACK1, NEXT_REG, STOP) ; 
	signal i2c_data : std_logic_vector(7 downto 0 ) ; 
	signal reg_data : std_logic_vector(15 downto 0 ) ; 
	signal i2c_addr : std_logic_vector(6 downto 0 ) ; 
	signal send : std_logic ; 
	signal rcv : std_logic ; 
	signal dispo : std_logic ; 
	signal ack_byte, nack_byte : std_logic ; 
	signal pix_state : pixel_state ; 
	signal next_state : pixel_state ; 
	signal reg_state : registers_state ; 
	signal reg_addr : std_logic_vector(7 downto 0 ) ;
	
	signal pxclk_old, pxclk_rising_edge, pxclk_falling_edge, nclk : std_logic ;
	signal en_rlatch, en_glatch0, en_glatch1, en_blatch : std_logic ;
	signalpixel_in_hsynct,pixel_in_vsynct, pxclkt, pixel_out_clk_t  : std_logic ;
	for register_rom_vga : rgb565_register_rom use entity rgb565_register_rom(vga) ;
	for register_rom_qvga : rgb565_register_rom use entity rgb565_register_rom(qvga) ;
	
	begin
	
gen_vga : if FORMAT = VGA generate
	register_rom_vga : rgb565_register_rom --rom containg sensor configuration
		port map (
		   clk => clock,
			en => '1',
			addr => reg_addr, 
			data => reg_data
		); 
	 end generate ;
	 
gen_qvga : if FORMAT = QVGA generate
	register_rom_qvga : rgb565_register_rom --rom containg sensor configuration
		port map (
		   clk => clock,
			en => '1',
			addr => reg_addr, 
			data => reg_data
		); 
	 end generate ;
	 
nclk <= not clock ;	
r_latch : edge_triggered_latch 
	 generic map( NBIT => 5)
    port map( clk =>clock,
           resetn => resetn ,
           sraz => '0' ,
           en => en_rlatch ,
           d => pixel_data(7 downto 3) , 
           q => r_data(7 downto 3));
r_data(2 downto 0) <= (others => '0') ; 			  
			  
			  
g_latch_0 : edge_triggered_latch 
	 generic map( NBIT => 3)
    port map( clk => clock,
           resetn => resetn ,
           sraz => '0' ,
           en => en_glatch0 ,
           d => pixel_data(2 downto 0) , 
           q => g_data(7 downto 5));

g_latch_1 : edge_triggered_latch 
	 generic map( NBIT => 3)
    port map( clk => clock,
           resetn => resetn ,
           sraz => '0' ,
           en => en_glatch1 ,
           d => pixel_data(7 downto 5) , 
           q => g_data(4 downto 2));
g_data(1 downto 0) <= (others => '0');

b_latch : edge_triggered_latch 
	 generic map( NBIT => 5)
    port map( clk => clock,
           resetn => resetn ,
           sraz => '0' ,
           en => en_blatch ,
           d => pixel_data(4 downto 0) , 
           q => b_data(7 downto 3));	 
b_data(2 downto 0) <= (others => '0');	 
	
		
	i2c_master0 : i2c_master -- i2c master to send sensor configuration, no proof its working
		port map ( 
			clock => i2c_clk, 
			resetn => resetn, 
			sda => sda, 
			scl => scl, 
			data_in => i2c_data, 
			slave_addr => i2c_addr, 
			send => send, 
			rcv => rcv, 
			dispo => dispo, 
			ack_byte => ack_byte,
			nack_byte => nack_byte
		); 
	
-- sccb_interface
	process(clock, resetn)
		 begin
		 	i2c_addr <= OV7670_I2C_ADDR ; -- sensor address
		 	if  resetn = '0'  then
		 		reg_state <= init ;
				reg_addr <= (others => '0');
		 	elsif clock'event and clock = '1' then
		 		case reg_state is
		 			when init => 
		 				if  dispo = '1'  then 
		 					send <= '1' ; 
		 					i2c_data <= reg_data(15 downto 8) ; 
		 					reg_state <= send_addr ;
		 				end if ;
		 			when send_addr => --send register address
		 				if  ack_byte = '1'  then
		 					send <= '1' ; 
		 					i2c_data <= reg_data(7 downto 0) ; 
		 					reg_state <= wait_ack0 ;
						elsif nack_byte = '1' then
							send <= '0' ; 
							reg_state <= next_reg ;
		 				end if ;
		 			when wait_ack0 => -- falling edge of ack 
		 			  if  ack_byte = '0'  then
		 					reg_state <= send_data ;
		 				end if ;
		 			when send_data => --send register value
		 				if  ack_byte = '1'  then
		 					send <= '0' ; 
		 					reg_state <= wait_ack1 ; 
		 					reg_addr <= (reg_addr + 1) ;
						elsif nack_byte = '1' then
							send <= '0' ; 
							reg_state <= next_reg ;
		 				end if ;
		 			when wait_ack1 => -- wait for ack
		 			  if  ack_byte = '0'  then
		 					reg_state <= next_reg ;
		 				end if ;
		 			when next_reg => -- switching to next register
		 				send <= '0' ;
		 				if ( NOT ack_byte = '1' ) AND  reg_data /= X"FFFF"  AND  dispo = '1'  AND  conv_integer(reg_addr) < 255  then
		 					reg_state <= send_addr ; 
		 					i2c_data <= reg_data(15 downto 8) ; 
		 					send <= '1' ;
		 				elsif  conv_integer(reg_addr) >= 255  OR  reg_data = X"FFFF"  then
		 					reg_state <= stop ;
		 				end if ;
		 			when stop => -- all register were set, were done !
		 				send <= '0' ;
		 				reg_state <= stop ;
		 			when others => 
		 				reg_state <= init ;
		 		end case ;
		 	end if ;
		 end process;  

	process(clock, resetn)
		 begin
			if resetn = '0' then
				hsynct <= '0' ;
				vsynct <= '0' ;
				pxclkt <= '0' ;
		 	elsif  clock'event and clock = '1'  then
				hsynct <= NOT href ; -- changing href intopixel_in_hsync
				vsynct <=pixel_in_vsync ;
				pxclkt <= pxclk ;
			end if ;
	end process ;
	
	--pxclk rising and falling edge
	process(clock, resetn)
		 begin
			if resetn = '0' then
				pxclk_rising_edge <= '0' ;
				pxclk_falling_edge <= '0' ;
				pxclk_old <= '0' ;
		 	elsif  clock'event and clock = '1' then
				pxclk_old <= pxclk ;
				if pxclk /= pxclk_old andpixel_in_hsynct = '0' andpixel_in_vsynct = '0' then
					pxclk_rising_edge <= pxclk ;
					pxclk_falling_edge <= NOT pxclk ;
				else
					pxclk_rising_edge <= '0' ;
					pxclk_falling_edge <= '0' ;
				end if ;
			end if ;
	end process ;
	
	process(clock, resetn)
		begin
		if resetn = '0'  then
		 		pix_state <= WAIT_LINE;
		elsif clock'event and clock = '1'  then
				pix_state <= next_state ;
		end if ;
	end process ;


	process(hsynct,pixel_in_vsynct, pix_state, pxclk_rising_edge)
		begin
			next_state <= pix_state ;
			case pix_state is
				when WAIT_LINE =>
					ifpixel_in_hsynct = '0' andpixel_in_vsynct = '0' then
						next_state <= RG ;
					end if ;
				when RG => 
					ifpixel_in_hsynct = '1' orpixel_in_vsynct = '1' then
						next_state <= WAIT_LINE ;
					elsif pxclk_falling_edge = '1' then
						next_state <= GB ;
					end if ;
				when GB => 
					ifpixel_in_hsynct = '1' orpixel_in_vsynct = '1' then
						next_state <= WAIT_LINE ;
					elsif pxclk_falling_edge = '1' then
						next_state <= RG ;
					end if ;
				when others => 
					next_state <= WAIT_LINE ;
			end case ;
	 end process;  
	 
	 with pix_state select
		pixel_out_clk_t <=  pxclkt when  GB , 
									 '0' when others ;
								  
	 with pix_state select
		en_rlatch <=  pxclk when RG ,
						  '0' when others ;
	 with pix_state select
		en_glatch0 <=  pxclk when  RG ,
						   '0' when others ;
	 with pix_state select
		en_glatch1 <=  pxclk when  GB ,
						  '0' when others ;
	
	 with pix_state select
		en_blatch <=  pxclk when  GB ,
						  '0' when others ;
	
    pixel_out_hsync <=pixel_in_hsynct AND (NOT pixel_out_clk_t) ;	
	 pixel_out_vsync <=pixel_in_vsynct AND (NOT pixel_out_clk_t);
	 pixel_out_clk <= pixel_out_clk_t ;

	
end systemc ;