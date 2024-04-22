-- Detects the levels of hsync and vsync and if the video is enabled
-- 2017 Luis Antoniosi

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sync_level is
	
	generic(
		constant vsync_level	: std_logic	:= '1';
		constant hsync_level	: std_logic	:= '1';
		constant hsync_ticks	: integer := 7;	
		constant vsync_ticks	: integer := 63;
		constant noise_filter: std_logic := '1'
	);
	
    port(clk 			: in std_logic;
		 hsync	 		: in std_logic;
		 vsync	 		: in std_logic; 
		 vblank			: buffer std_logic;
		 hblank			: buffer std_logic;
		 enable			: in std_logic;
		 video_enable	: buffer std_logic;
		 no_video		: buffer std_logic;
		 adjust			: in unsigned(2 downto 0)
		);
			
end sync_level;

architecture behavioral of sync_level is


signal vsync_lo	 : integer range 0 to 1024*1024*128;
signal vsync_hi	 : integer range 0 to 1024*1024*128;
signal vcount		 : integer range 0 to 65535;
signal hcount	 	 : integer range 0 to 65535;
signal vchange		 : std_logic;

signal video_cnt 	: integer range 0 to 1024*1024*128 := 0;
signal video_trg  : std_logic := '0';

signal hsync_adjust: integer range 0 to 255;

begin

process(clk, adjust)
begin
	if (rising_edge(clk)) then
	
		hsync_adjust <= hsync_ticks + to_integer(adjust);
		
	end if;
end process;

--
-- detect hsync level, pulse duration and row interval
process(clk, hsync, hsync_adjust, enable)
variable sync : std_logic;
variable peak: integer range 0 to 65535 := 0;

begin
	if (rising_edge(clk)) then
		
		if (enable = '1') then
		
			hblank <= '0';
			
			if (hcount < 65535) then
				hcount <= hcount + 1;
			end if;
			
			if (hsync /= sync) then
			
				peak := peak + 1;	
				
				if (peak > hsync_adjust) then
				
					peak := 0;
					
					sync := hsync;
					
					if (hsync = hsync_level) then 
						hblank <= '1';
						hcount <= 0;
					end if;

				end if;
			elsif noise_filter = '1' then
				peak := 0;
			end if;
		end if;
	end if;
end process;

process(clk, hblank, vblank, enable)
begin
	if (rising_edge(clk)) then
		if (enable = '1') then
			if (hblank = '1' and vcount < 65535) then		
				vcount <= vcount + 1;			
			end if;
			
			if (vblank = '1') then
				vcount <= 0;
			end if;
		end if;
	end if;
end process;



-- detect vsync level, pulse duration and frame interval
process(clk, vsync, enable)
variable sync : std_logic;
variable peak: integer range 0 to 65535 := 0;

begin
	if (rising_edge(clk)) then
		if (enable = '1') then
			vblank <= '0';			
			vchange <= '0'; 			
			if (vsync /= sync) then
			
				peak := peak + 1;	
				
				if (peak > vsync_ticks) then
				
					vchange <= '1';
									
					peak := 0;
					
					sync := vsync;	
					
					if (vsync = vsync_level) then
						vblank <= '1';
					end if;				
				end if;			
			elsif noise_filter = '1' then
				peak := 0;
			end if;
		end if;
	end if;
end process;

process(clk, vsync, vchange, enable)
variable peak_lo: integer range 0 to (1024*1024*16-1);
begin
	if (rising_edge(clk)) then
		if (enable = '1') then
			if(vsync = '0' or vsync = 'Z') then
				if (peak_lo < (1024*1024*16-1)) then
					peak_lo := peak_lo + 1;	
				end if;
				
				if(vchange = '1') then
					vsync_lo <= peak_lo;
					peak_lo := 0;		
				end if;			
				
			end if;
		end if;
	end if;
end process;

process(clk, vsync, vchange, enable)
variable peak_hi: integer range 0 to (1024*1024*16-1);
begin
	if (rising_edge(clk)) then
		if (enable = '1') then		
			if (vsync = '1') then
				if (peak_hi < (1024*1024*16-1)) then
					peak_hi := peak_hi + 1;						
				end if;
				
				if(vchange = '1') then
					vsync_hi <= peak_hi;
					peak_hi := 0;						
				end if;					
			end if;
		end if;
	end if;
end process;


process(clk, enable)
begin
	if (rising_edge(clk)) then		
		if (enable = '1') then
			video_trg <= '0';
		
			if (video_cnt > 0) then
				video_cnt <= video_cnt - 1;					
			else			
				video_cnt <= 1024 * 1024 * 10;
				video_trg <= '1';
			end if;
		end if;		
	end if;
end process;


process(clk, video_trg, vsync_lo, vsync_hi, enable)
begin
	if (rising_edge(clk)) then
		
		if (enable = '1') then
		
			if (video_trg = '1') then			
			
				if (hcount = 65535) then
				
					video_enable <= '0';
					no_video <= '0';		
					
				elsif ((vsync_level = '0' and vsync_lo < vsync_hi) or (vsync_level = '1' and vsync_hi < vsync_lo)) then
						video_enable <= '1';
						no_video <= '0';
				else
					video_enable <= '0';
					no_video <= '0';					
				end if;			
			
			end if;
			
		else			
			video_enable <= '0';
			no_video <= '0';					
		end if;			
		
	end if;
	
end process;


end behavioral;
