-- VGA Video generator
-- 2017 Luis Antoniosi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_video is

-- 	http://www.epanorama.net/documents/pc/vga_timing.html
--		Here the common VGA modes supported. The row_out module rdclk must use the same clk
--		These values must be changed on instance (schematic.bdf) for each instance NOT HERE!
--
--    720x350@70Hz
--		clk 						:= VGA_28MHZ_CLK
--		hor_active_video		:= 726
--		hor_front_porch		:= 15
--		hor_sync_pulse			:= 108
--		hor_back_porch			:= 51
--		vert_active_video		:= 354
--		vert_front_porch		:= 36
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 57
--		hsync_level 			:= '0'
--		vsync_level 			:= '0'
--
--    720x400@70Hz
--		clk 						:= VGA_28MHZ_CLK
--		hor_active_video		:= 726
--		hor_front_porch		:= 15
--		hor_sync_pulse			:= 108
--		hor_back_porch			:= 51
--		vert_active_video		:= 404
--		vert_front_porch		:= 11
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 32
--		hsync_level 			:= '0'
--		vsync_level 			:= '1'
--
--    640x350@70Hz
--		clk 						:= VGA_25MHZ_CLK
--		hor_active_video		:= 640
--		hor_front_porch		:= 16
--		hor_sync_pulse			:= 96
--		hor_back_porch			:= 48
--		vert_active_video		:= 350
--		vert_front_porch		:= 37
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 60
--		hsync_level 			:= '1'
--		vsync_level 			:= '0'
--
--    640x400@70Hz
--		clk 						:= VGA_25MHZ_CLK
--		hor_active_video		:= 640
--		hor_front_porch		:= 16
--		hor_sync_pulse			:= 96
--		hor_back_porch			:= 48
--		vert_active_video		:= 400
--		vert_front_porch		:= 12
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 35
--		hsync_level 			:= '1'
--		vsync_level 			:= '0'
--
--    640x480@60Hz
--		clk 						:= VGA_25MHZ_CLK
--		hor_active_video		:= 640
--		hor_front_porch		:= 16
--		hor_sync_pulse			:= 96
--		hor_back_porch			:= 48
--		vert_active_video		:= 480
--		vert_front_porch		:= 10
--		vert_sync_pulse		:= 2
--		vert_back_porch		:= 33
--		hsync_level 			:= '0'
--		vsync_level 			:= '0'

	generic(
		
		constant hor_active_video		: integer 	:= 726;
		constant hor_front_porch		: integer 	:= 15;
		constant hor_sync_pulse			: integer 	:= 108;
		constant hor_back_porch			: integer 	:= 51;

		constant vert_active_video		: integer 	:= 354;
		constant vert_front_porch		: integer 	:= 36;
		constant vert_sync_pulse		: integer 	:= 2;
		constant vert_back_porch		: integer 	:= 57;

		constant hsync_level 			: std_logic := '0';
		constant vsync_level 			: std_logic := '0';
		constant mono						: std_logic := '0';
		
		constant scale_mode				: integer   := 0  -- 0 : no scale, 1 : CGA doubling rows, 2 : MDA 350->400
	);
	
    port(
		clk  					: in std_logic;
		enable				: in std_logic;
		pixel_in				: in unsigned(5 downto 0);		
		scanline				: in std_logic;

		r_out					: out unsigned(3 downto 0);
		g_out					: out unsigned(3 downto 0);
		b_out					: out unsigned(3 downto 0);
		hsync_out			: out std_logic;
		vsync_out			: out std_logic;
		row_number			: buffer unsigned(9 downto 0);
		col_number			: buffer unsigned(9 downto 0);
		rd_req				: buffer std_logic;
		rd_ack				: in std_logic;
				
		sram_clk				: in std_logic;
		no_video				: in std_logic;
		max_col				: in unsigned(9 downto 0);
		max_row				: in unsigned(9 downto 0);
		adjust_mode			: in std_logic;
		green_monitor		: in std_logic;
		osd_ctrl				: out unsigned(8 downto 0);
		osd_enable			: out std_logic;
		osd_bit				: in std_logic;
		osd_active			: in std_logic;
		osd_value			: in unsigned(5 downto 0);
		composite			: in std_logic
    );
end vga_video;

architecture behavioral of vga_video is

type ram_type is array ( 0 to 760 ) of unsigned(5 downto 0);

signal hcount										: unsigned(15 downto 0);
signal vcount										: unsigned(15 downto 0);
signal osd_hcount									: unsigned(15 downto 0);
signal osd_vcount									: unsigned(15 downto 0);

signal videov, videoh							: std_logic;
signal hblank, vblank							: std_logic;
signal merge_rows									: std_logic;
signal blank										: std_logic;
signal row_mask									: std_logic;
--signal start_row									: unsigned(9 downto 0);
--signal start_col									: unsigned(9 downto 0);

function f_luminance(pattern: unsigned) return unsigned;
function f_luminance(pattern: unsigned) return unsigned is
variable VALUE : unsigned (3 downto 0); 
begin
		case pattern is	
			when "0000" => VALUE := "0000";	
			when "0001" => VALUE := "0011";
			when "0010" => VALUE := "0001";	
			when "0011" => VALUE := "1000";	
			when "0100" => VALUE := "0100";
			when "0101" => VALUE := "1100";
			when "0110" => VALUE := "0101";
			when "0111" => VALUE := "1101";
			when "1000" => VALUE := "0010";	
			when "1001" => VALUE := "1010";
			when "1010" => VALUE := "0111";	
			when "1011" => VALUE := "1011";
			when "1100" => VALUE := "0110";
			when "1101" => VALUE := "1110";
			when "1110" => VALUE := "1001";
			when "1111" => VALUE := "1111";	
		end case;		
		return VALUE;		
end f_luminance;

begin

	-- row control
	process (clk, enable, hcount)
	begin
		
			if (enable = '0') then
				-- disable
			elsif(rising_edge(clk)) then

				if hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch ) then
					vcount <= vcount + 1;
					
					if(vcount > 32) then
						osd_vcount <=  vcount - 32;
					else
						osd_vcount <= (others => '1');
					end if;			
					
				end if;
				
				if (vcount = (vert_active_video + vert_front_porch + vert_sync_pulse + vert_back_porch ) and hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch )) then 
					vcount <= (others => '0');
					osd_vcount <= (others => '1');
				end if;		
				
			end if;

	end process;
	
	-- colum control
	process (clk, enable)
	begin
		
			if (enable = '0') then
				-- disable
			elsif (rising_edge(clk)) then

				hcount <= hcount + 1;
				if(hcount > 64) then
					osd_hcount <=  hcount - 64;
				else
					osd_hcount <= (others => '1');
				end if;
				
				if (hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch )) then 			
					hcount <= (others => '0');
					osd_hcount <= (others => '1');
				end if;
				
			end if;

			
	end process;	
	
	-- pre hblank, vblank
	process (clk, enable)
	begin
		
			if (enable = '0') then
				-- disable
			elsif (rising_edge(clk)) then
			
				hblank <= '0';
				vblank <= '0';
				
				-- vblank and hblank happens always one clock behind vcount and hcount wrap around
				if (hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch - 1)) then 			
					hblank <= '1';				
					if (vcount = (vert_active_video + vert_front_porch + vert_sync_pulse + vert_back_porch)) then 
						vblank <= '1';
					end if;									
				end if;			
			end if;

			
	end process;		

	-- vsync control
	process(clk, enable, vcount)
	begin
				
			if (enable = '0') then
				-- disable
				vsync_out <= 'Z';			
			elsif(rising_edge(clk)) then
				vsync_out <= not vsync_level;
				
				if (vcount <= (vert_active_video + vert_front_porch + vert_sync_pulse - 1) and vcount >= (vert_active_video + vert_front_porch - 1)) then
					vsync_out <= vsync_level;
				end if;

			end if;
		
	end process;

	-- hsync control
	process (clk, enable, hcount)
	begin
		
			if (enable = '0') then
				-- disable
				hsync_out <= 'Z';
				
			elsif (rising_edge(clk)) then     

				hsync_out <= not hsync_level;
				
				if (hcount <= (hor_active_video + hor_front_porch + hor_sync_pulse - 1) and hcount >= (hor_active_video + hor_front_porch - 1)) then
					hsync_out <= hsync_level;
				end if;
				
			end if;		
		
	end process;
		
	-- colum pixel to read from row RAM
	process (clk, hcount)
	begin
			if (rising_edge(clk)) then
				if (hcount = (hor_active_video + hor_front_porch + hor_sync_pulse)) then
				
					col_number <= to_unsigned(8, col_number'length);
					
				elsif (hcount < hor_active_video) then
									
					col_number <= col_number + 1;
					
				end if;
			end if;

	end process;
	

	-- row to read from SRAM into row RAM
	process (clk, vcount, vblank, hblank)
	begin
			if (rising_edge(clk)) then
			
				if (hblank = '1') then
					
					merge_rows <= '0';
					row_mask <= '1';
										
					if (vcount = (vert_active_video + vert_front_porch + vert_sync_pulse)) then
						
						row_number <= to_unsigned(8, col_number'length);
						
					elsif (vcount < vert_active_video) then
					
						case scale_mode is
						
							when 1 =>
								if (vcount(0) = '1') then
									row_number <= row_number + 1;
									row_mask <= not scanline;
								end if;
							
							when others =>
								row_number <= row_number + 1;
								
						end case;
					
					end if;					
				end if;
			end if;
		
	end process;

	-- SRAM sync
	process(sram_clk, hcount, rd_ack)
	begin
	
		if (rd_ack = '1') then
		
			rd_req <= '0'; -- request taken 
			
		elsif (rising_edge(sram_clk)) then
		
			if (hcount = (hor_active_video) ) then
			
				rd_req <= '1'; -- request a new ROW fetch
				
			end if;
			
		end if;
		
	end process;

	-- pixel color
	process(clk, enable, hcount, vcount, pixel_in, col_number, merge_rows, osd_bit) 
	variable osd, osd_mask: std_logic;
	variable red_pixel: unsigned(3 downto 0);
	variable green_pixel: unsigned(3 downto 0);
	variable blue_pixel: unsigned(3 downto 0);
	variable rgbi : unsigned(3 downto 0);
	
	variable p_red_pixel: unsigned(3 downto 0);
	variable p_green_pixel: unsigned(3 downto 0);
	variable p_blue_pixel: unsigned(3 downto 0);
	variable t_red_pixel: unsigned(3 downto 0);
	variable t_green_pixel: unsigned(3 downto 0);
	variable t_blue_pixel: unsigned(3 downto 0);
	
	begin		
		
			if (enable = '0') then
			
				-- disable
				r_out <= (others => 'Z');
				g_out <= (others => 'Z');
				b_out <= (others => 'Z');			
				
			elsif (rising_edge(clk)) then
			
				rgbi(0) := pixel_in(4) or pixel_in(2) or pixel_in(0);
				rgbi(1) := pixel_in(1);
				rgbi(2) := pixel_in(3);
				rgbi(3) := pixel_in(5);			
				
				if (green_monitor = '1') then
					if(adjust_mode = '1') then
						-- amber 
						red_pixel := f_luminance(rgbi);
						green_pixel := '0' & f_luminance(rgbi)(3 downto 1);
					else
						-- plain radioactive green
						red_pixel := "0000";
						green_pixel := f_luminance(rgbi);
					end if;
					blue_pixel := "0000";

				else
				
					red_pixel := pixel_in(5)  & pixel_in(4) & "00";
					green_pixel := pixel_in(3) & pixel_in(2) & "00";
					blue_pixel := pixel_in(1) & pixel_in(0) & "00";
					
					t_red_pixel := red_pixel;
					t_green_pixel := green_pixel;
					t_blue_pixel := blue_pixel;					
					
					if (composite = '1') then
						red_pixel := to_unsigned(to_integer(red_pixel) + to_integer(p_red_pixel), 5)(4 downto 1);
						green_pixel := to_unsigned(to_integer(green_pixel) + to_integer(p_green_pixel), 5)(4 downto 1);
						blue_pixel := to_unsigned(to_integer(blue_pixel) + to_integer(p_blue_pixel), 5)(4 downto 1);
					end if;
					
					p_red_pixel := t_red_pixel;
					p_green_pixel := t_green_pixel;
					p_blue_pixel := t_blue_pixel;
				
				end if;
				
				if (row_mask = '0') then
					red_pixel := '0' & red_pixel(3 downto 1);
					green_pixel := '0' & green_pixel(3 downto 1);
					blue_pixel := '0' & blue_pixel(3 downto 1);
				end if;
				
					
				if (no_video = '1') then				
					red_pixel := "0000";
					green_pixel := "0000";
					blue_pixel := "0000";
				end if;	
				
				if (osd_active = '1') then
					
					if (osd_bit = '1') then
						red_pixel := "1111";
						green_pixel := "0000";
						blue_pixel := "1111";
					end if;
					
					if (osd_vcount(9 downto 2) > 8 and osd_vcount(9 downto 2) < 12 and osd_hcount(9 downto 2) < 63) then
					
						if (osd_hcount(9 downto 2) >= osd_value) then
							red_pixel := "1111";
							green_pixel := "0000";
							blue_pixel := "1111";							
						else
							red_pixel := "0000";
							green_pixel := "1111";
							blue_pixel := "0000";														
						end if;
						
					end if;
				end if;
							
				r_out <= red_pixel and (blank&blank&blank&blank);
				g_out <= green_pixel and (blank&blank&blank&blank);
				b_out <= blue_pixel and (blank&blank&blank&blank);
				
			end if;
		
	end process;

	-- vert active video control
	process (clk, enable, vcount)
	begin
		if (rising_edge(clk)) then
			videov <= '0'; 
			if ( vcount > 0 and vcount < vert_active_video + 1 and row_number < max_row) then 
				videov <= '1';
			end if;	
	   end if;
	end process;

	-- horz active video control
	process (clk, enable, hcount)
	begin
		if (rising_edge(clk)) then
			videoh <= '0';
			if (hcount < hor_active_video and col_number < (max_col - 6)) then
				videoh <= '1';
			end if;
		end if;
	end process;
	
	process (clk, enable, hcount)
	begin
		if (rising_edge(clk)) then
			blank <= videoh and videov;
		end if;
	end process;	
	
	process (clk, enable, col_number, row_number)
	begin
		if (rising_edge(clk)) then
			osd_enable <= '0';
			if (osd_vcount(9 downto 2) < 8 and osd_hcount(9 downto 2) < 64) then
				osd_ctrl <= osd_vcount(4 downto 2) & osd_hcount(7 downto 2);
				osd_enable <= '1';
			end if;
		end if;
	end process;		

end behavioral;