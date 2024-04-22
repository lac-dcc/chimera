-- Author: Alexander Hill
-- Date: Oct 8, 2013
-- 
-- Change Log:

-- Dec 2,  2013 => replaced direct RGB output writing with the current address
-- Oct 18, 2013 => Continued Spliting Files
-- Oct 13, 2013 => Split entity from test code and created a standalone entity with some documentation
-- Oct 12, 2013 => got working entity and tested several video modes
-- Oct 8, 2013  => Wrote first function that never worked because the hsync signal was blanked out during the vsync period




---------------------------------------------------------------------------------------------------------
--------------------   Tested Video Modes   -------------------------------------------------------------
-- General info from http://tinyvga.com/vga-timing/1440x900@60Hz

--	--   640 X 480 
		-- -- Needs 25 MHz Clock

		--	constant Vsync: integer := 2;
		--	constant VBackPorch: integer := 33;
		--	constant VData: integer := 480;
		--	constant VFrontPorch: integer := 10;
		--	
		--	-- 
		--	constant Hsync: integer := 96;
		--	constant HBackPorch: integer := 48;
		--	constant HData: integer := 640;
		--	constant HFrontPorch: integer := 16;
		--		
	

--	-- 800 X 600
		--	-- needs 50 MHz Clock
		--	constant Vsync: integer := 6;
		--	constant VBackPorch: integer := 23;
		--	constant VData: integer := 600;
		--	constant VFrontPorch: integer := 37;
		--	
		--	-- 
		--	constant Hsync: integer := 120;
		--	constant HBackPorch: integer := 64;
		--	constant HData: integer := 800;
		--	constant HFrontPorch: integer := 56;
	
	
--	-- 1440 X 900
		--	-- needs 106.47 MHz Clock
		--	constant Vsync: integer := 3;
		--	constant VBackPorch: integer := 28;
		--	constant VData: integer := 900;
		--	constant VFrontPorch: integer := 1;
		--	
		--	constant Hsync: integer := 152;
		--	constant HBackPorch: integer := 223;
		--	constant HData: integer := 1440;
		--	constant HFrontPorch: integer := 89;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_driver is 
	port(	VertAddress,HorAddress: out STD_logic_vector(11 downto 0);
			DataValid: out STD_logic;
			VGA_CLK,VGA_BLANK_N,VGA_HS,VGA_VS,VGA_SYNC_N: out STD_logic;
			CLOCK_IN: in STD_logic);
end;

architecture behavior of vga_driver is 
	
	constant Vsync: integer := 2;
	constant VBackPorch: integer := 33;
	constant VData: integer := 480;
	constant VFrontPorch: integer := 10;
	
	-- 
	constant Hsync: integer := 96;
	constant HBackPorch: integer := 48;
	constant HData: integer := 640;
	constant HFrontPorch: integer := 16;	
	
	signal h_count: integer := 0;
	signal v_count: integer := 0;
	signal v_enable: STD_logic;
	signal my_vga_clk: STD_logic;
begin 
	
	----- VGA connections
	VGA_CLK <= CLOCK_IN; 
	VGA_SYNC_N <= '0';
	
	-- generate h sync
	process (CLOCK_IN)
	begin
		if(rising_edge(CLOCK_IN)) then
			if(h_count >= Hsync + HBackPorch + Hdata + HFrontPorch) then
				h_count <= 0;
			else
			
				if((h_count < HSync) ) then	
					VGA_HS <= '0';
				else
					VGA_HS <= '1';
				end if;
				h_count <= h_count + 1;
				
				if((h_count > HSync + HBackPorch ) 
					and(h_count < HSync + HBackPorch + HData) 
					and (v_enable = '1')) then
					-- write the pixel
					
					VGA_BLANK_N <= '1';
					DataValid <= '1';
			
					VertAddress <= std_logic_vector(to_unsigned(v_count - (VSync + VBackPorch),12));
					HorAddress <= std_logic_vector(to_unsigned(h_count - (HSync + HBackPorch),12));
					
					--VertAddress <= std_logic_vector(to_unsigned(v_count,12));
					--HorAddress <= std_logic_vector(to_unsigned(h_count,12));
				else
					VGA_BLANK_N <= '0';
					DataValid <= '0';
				end if;
			end if;
		end if;
	end process;
	
	-- generate v sync
	process (CLOCK_IN )
	begin
		if(rising_edge(CLOCK_IN)) then
			if(h_count = 0) then
				if(v_count < VSync + VBackPorch + VData + VFrontPorch)then
					v_count <= v_count + 1;
				else
					v_count <= 0;
				end if;
				
				if(v_count > Vsync + VBackPorch) and (v_count < VSync + VBackPorch + VData)then
					v_enable <= '1';
				else
					v_enable <= '0';
				end if;
				
			end if;
		end if;
	end process;
	
	-- use v count
	process (CLOCK_IN)
	begin
		if(rising_edge(CLOCK_IN))then
			if(v_count < Vsync) then
				VGA_VS <= '0';
			else
				VGA_VS <= '1';
			end if;
		end if;
	end process;	
	
end behavior;
