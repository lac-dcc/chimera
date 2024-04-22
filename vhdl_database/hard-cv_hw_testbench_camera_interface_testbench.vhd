library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;

library work ;
	use work.interface_pack.all ;


entity camera_interface_testbench is
end camera_interface_testbench;

architecture test of camera_interface_testbench is
	constant clk_period : time := 5 ns ;
	constant pclk_period : time := 20 ns ;
	constant resetn_delay : integer := 1024 ;
	signal resetn_time : integer range 0 to 1024 := resetn_delay ;
	signal clk, resetn_delayed : std_logic ;
	signal pixel_from_camera : std_logic_vector(7 downto 0);
	signal pixely_from_interface : std_logic_vector(7 downto 0);
	signal pixelu_from_interface : std_logic_vector(7 downto 0);
	signal pixelv_from_interface : std_logic_vector(7 downto 0);
	
	signal pixel_from_erode : std_logic_vector(7 downto 0);
	signal binarized_pixel : std_logic_vector(7 downto 0);

	signal data_to_send : std_logic_vector(7 downto 0);
	signal pxclk_from_camera, href_from_camera,pixel_in_vsync_from_camera : std_logic ;
	signal pxclk_from_interface, href_from_interface,pixel_in_vsync_from_interface : std_logic ;
	signal pxclk_from_erode, href_from_erode,pixel_in_vsync_from_erode : std_logic ;
	signal send_data, scl, sda : std_logic ;
	
	signal pixel_data : std_logic_vector(31 downto 0) := X"AA" & X"BB" & X"CC" & X"DD";
	
	begin
	
	process(clk) -- reset process
	begin
		if clk'event and clk = '1' then
			if resetn_time = 0 then
				resetn_delayed <= '1' ;
			else
				resetn_delayed <= '0';
				resetn_time <= resetn_time - 1 ;
			end if;
		end if;
	end process;
	
	
	camera0: yuv_camera_interface
		port map(clock => clk,
					pixel_data => pixel_from_camera, 
					resetn => resetn_delayed,
					pxclk => pxclk_from_camera, href => href_from_camera,pixel_in_vsync =>pixel_in_vsync_from_camera,
					pixel_out_clk => pxclk_from_interface, pixel_out_hsync => href_from_interface, pixel_out_vsync =>pixel_in_vsync_from_interface,
					y_data => pixely_from_interface, 
					u_data => pixelu_from_interface, 
					v_data => pixelv_from_interface
		);

pixel_from_camera <= pixel_data(7 downto 0);

process
	begin
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period; 
	end process;
	
process
	variable px_count, line_count, byte_count : integer := 0 ;
	begin
		pxclk_from_camera <= '0';
		if px_count < 640 * 2 and line_count >= 20 and line_count < 497 then
			href_from_camera <= '1' ;
		else
				pixel_data <= X"AA" & X"BB" & X"CC" & X"DD";
				href_from_camera <= '0' ;
		end if ;

		if line_count < 3 then
			vsync_from_camera <= '1' ;
		 else 
			vsync_from_camera <= '0' ;
		end if ;
		wait for pclk_period;
		
		pxclk_from_camera <= '1';
		
		if byte_count < 2 then
		  byte_count := byte_count + 1 ;
		else
		  byte_count := 0;
		end if ;
		if (px_count = 784 * 2) then
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
		pixel_data(31 downto 8) <= pixel_data(23 downto 0);
		pixel_data(7 downto 0) <= pixel_data(31 downto 24) ;
	end process;
	
end test ;
