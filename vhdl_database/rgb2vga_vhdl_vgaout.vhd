library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vgaout is
	generic(
		hor_active_video		: integer := 640;
		hor_front_porch		: integer := 16;
		hor_sync_pulse			: integer := 96;
		hor_back_porch			: integer := 48;

		vert_active_video		: integer := 480;
		vert_front_porch		: integer := 10;
		vert_sync_pulse		: integer := 2;
		vert_back_porch		: integer := 33		
		
	);
	
    port(clock_vga  : in std_logic;
         vga_out	  : out unsigned(10 downto 0); -- r, g, b, hsync, vsync
								
			pixel_in		: in unsigned(15 downto 0);		
			row_number	: buffer unsigned(9 downto 0);
			col_number	: buffer unsigned(9 downto 0); 
			load_req	: out std_logic := '0';
			load_ack  : in std_logic;

			scanline	: in std_logic;
			
			clock_dram: std_logic;
			video_active : std_logic
			
         );
end vgaout;

architecture behavioral of vgaout is

signal hcount												: unsigned(13 downto 0);
signal vcount												: unsigned(9 downto 0);
signal videov, videoh, hsync, vsync					: std_logic;
signal pixel		  										: unsigned(10 downto 0);
signal barcolor	  										: unsigned(10 downto 0);
	
	
function f_scanline(adc: unsigned) return unsigned;

function f_scanline(adc: unsigned) return unsigned is
variable VALUE : unsigned (2 downto 0); 
begin
		case adc is
		
			when "000" => VALUE := "000";
			when "001" => VALUE := "000";
			when "010" => VALUE := "001";
			when "011" => VALUE := "010";
			when "100" => VALUE := "011";
			when "101" => VALUE := "100";
			when "110" => VALUE := "101";
			when "111" => VALUE := "110";
		end case;
		return VALUE;
end f_scanline;
	
begin


vcounter: process (clock_vga, hcount, vcount)
begin
	if(rising_edge(clock_vga)) then

		if hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch - 1) then
			vcount <= vcount + 1;
		end if;
		
      if vcount = (vert_active_video + vert_front_porch + vert_sync_pulse + vert_back_porch - 1) and hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch - 1) then 
			vcount <= (others => '0');
		end if;
		
	end if;
end process;

v_sync: process(clock_vga, vcount)
begin
	if(rising_edge(clock_vga)) then
		vsync <= '1';
		if (vcount <= (vert_active_video + vert_front_porch + vert_sync_pulse - 1) and vcount >= (vert_active_video + vert_front_porch - 1)) then
			vsync <= '0';
		end if;
	end if;
end process;

hcounter: process (clock_vga, hcount)
begin
	if (rising_edge(clock_vga)) then				
		hcount <= hcount + 1;
		
      if hcount = (hor_active_video + hor_front_porch + hor_sync_pulse + hor_back_porch - 1)	then 
        hcount <= (others => '0');
		  col_number <= to_unsigned(0, col_number'length);
		else
			col_number <= to_unsigned(to_integer(hcount(9 downto 0)) + 1, col_number'length);
		end if;	
		
	end if;
end process;


h_sync: process (clock_vga, hcount)
variable row : integer range 0 to 1024;
begin
	if (rising_edge(clock_vga)) then     
	   hsync <= '1';				
		
		row := to_integer(vcount(9 downto 1)) + 1;		
		row_number <= to_unsigned(row, row_number'length);
		
      if (hcount <= (hor_active_video + hor_front_porch + hor_sync_pulse - 1) and hcount >= (hor_active_video + hor_front_porch - 1)) then
        hsync <= '0';
      end if;
	end if;		
end process;

load_row: process(clock_dram, load_ack, hsync)
begin
	if (load_ack = '1') then
		load_req <= '0';
	elsif (rising_edge(clock_dram)) then
		if (hcount = (hor_active_video + hor_front_porch - 1)) then --hsync = '0') then
			load_req <= '1';
		end if;
	end if;
end process;


video: process(clock_vga, hcount, vcount) 
variable blank: std_logic;
variable vga_pixel: unsigned(8 downto 0);
variable posy, posx, color: integer range 0 to 1024;
begin
	if (rising_edge(clock_vga)) then

		blank := videoh and videov;		
		
		vga_pixel := pixel_in(8 downto 0); 

		if (scanline = '0' and vcount(0) = '0') then
			vga_pixel := f_scanline(vga_pixel(8 downto 6)) & f_scanline(vga_pixel(5 downto 3)) & f_scanline(vga_pixel(2 downto 0));
		end if;		

		pixel(10 downto 2) <= vga_pixel and blank&blank&blank&blank&blank&blank&blank&blank&blank;
		pixel(1 downto 0) <= hsync & vsync;		

		
	end if;
end process;

bar: process(clock_vga, hcount, vcount) 
variable blank: std_logic;
variable vga_pixel: unsigned(8 downto 0);
variable posy, posx, color: integer range 0 to 1024;
begin
	if (rising_edge(clock_vga)) then

		blank := videoh and videov;		
		
		vga_pixel(8 downto 0) := "100100100";	

		if (hcount = 0) then					
			posx := 0;	
			posy := 0;
		end if;
		
		if (hcount >= 40 and hcount < 600) then
			posx := posx + 1;
			if (posx = 70) then			
				posy := posy + 1;
				posx := 0;				
			end if;			
			
			if (vcount > 20 and vcount < 100) then
				vga_pixel := to_unsigned(posy, 3) & "000000";
				if (hcount = 40 or hcount = 599) then
					vga_pixel(8 downto 0) := "000000000";				
				end if;
			elsif (vcount > 140 and vcount < 220) then
				vga_pixel := "000" & to_unsigned(posy, 3) & "000";
				if (hcount = 40 or hcount = 599) then
					vga_pixel(8 downto 0) := "000000000";				
				end if;
			elsif (vcount > 260 and vcount < 340) then
				vga_pixel := "000000" & to_unsigned(posy, 3);
				if (hcount = 40 or hcount = 599) then
					vga_pixel(8 downto 0) := "000000000";				
				end if;
			elsif (vcount > 380 and vcount < 460) then
				vga_pixel := to_unsigned(posy, 3) & to_unsigned(posy, 3) & to_unsigned(posy, 3);
				if (hcount = 40 or hcount = 599) then
					vga_pixel(8 downto 0) := "000000000";				
				end if;
			elsif (vcount = 20 or vcount = 100 or vcount = 140 or vcount = 220 or vcount = 260 or vcount = 340 or vcount = 380 or vcount = 460) then
				vga_pixel(8 downto 0) := "000000000";								
			end if;
		end if;

		if (scanline = '0' and vcount(0) = '0') then
			vga_pixel := f_scanline(vga_pixel(8 downto 6)) & f_scanline(vga_pixel(5 downto 3)) & f_scanline(vga_pixel(2 downto 0));
		end if;		

		barcolor(10 downto 2) <= vga_pixel and blank&blank&blank&blank&blank&blank&blank&blank&blank;
		barcolor(1 downto 0) <= hsync & vsync;		

	end if;
end process;


process (clock_vga, vcount)
begin
	if (rising_edge(clock_vga)) then
		videov <= '1'; 
		if vcount > vert_active_video-1 or vcount = 0 then 
			videov <= '0';
		end if;	
   end if;
end process;


process (clock_vga, hcount)
begin
	if (rising_edge(clock_vga)) then
		videoh <= '1';
		if hcount > hor_active_video or hcount < 3 then
			videoh <= '0';
		end if;
	end if;
end process;

	with video_active select vga_out <= 
		pixel when '0',
		barcolor when '1';

end behavioral;