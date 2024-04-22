library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity input_detect is
	
    port(clock_pixel : in std_logic;
			hsync	 		: in std_logic; -- digital hsync
			video_active : out std_logic;
			offset		: in std_logic;
			hblank_out : out std_logic;
			sync_level	: in std_logic
);
			
end input_detect;

architecture behavioral of input_detect is

begin

horizontal: process(clock_pixel, hsync)
variable horsync : std_logic;
variable hcount : integer range 0 to 262 * 1024 * 8;
variable sync_high : integer range 0 to 1024 * 8;
variable sync_down : integer range 0 to 1024 * 8;
variable hpeak: integer range 0 to 1024 * 8;
--variable pixel_width: integer range 0 to 128;

begin
	if (rising_edge(clock_pixel)) then
		
		hblank_out <= '1';		
		
		if (hsync /= horsync) then
			hpeak := hpeak + 1;
		end if;
		
		if (hsync /= horsync and hpeak > 11) then
		
			horsync := hsync;
						
			if (hsync = '0') then
				sync_down := hpeak;
			else
				sync_high := hpeak;
			end if;
			
			hpeak := 0;
			
			if (hsync = sync_level) then
				hblank_out <= '0';
				hcount := 0;
			end if;
		
		else
		
			video_active <= '0';
			if (hcount < 262 * 1024 * 8) then			
				hcount := hcount + 1;
			else
				video_active <= '1';
			end if;
			
			if (hsync = '0') then
				sync_down := sync_down + 1;
			else
				sync_high := sync_high + 1;
			end if;
					
		end if;
		
	end if;
end process;

end behavioral;
