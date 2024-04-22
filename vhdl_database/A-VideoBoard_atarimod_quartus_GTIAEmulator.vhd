library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Implement a GTIA emulation that sniffs all relevant
-- input pins of the GTIA and emulates the internal 
-- behaviour of the GTIA to finally create a YPbPr signal.
-- Output is generated at every falling edge of the CLK

entity GTIAEmulator is	
	port (
		-- Connections to the GTIAs pins 
		FO0         : in std_logic;
		AN          : in std_logic_vector(2 downto 0);
		PHI2        : in std_logic;
		A           : in std_logic_vector(4 downto 0);
		D           : in std_logic_vector(7 downto 0);
		RW          : in std_logic;
		CS          : in std_logic;
		HALT        : in std_logic;
		
		-- generated video data
		CSYNC       : out std_logic;
		HUE         : out std_logic_vector(3 downto 0);
		LUM0        : out std_logic_vector(3 downto 0);
		LUM1        : out std_logic_vector(3 downto 0)
	);	
end entity;

architecture immediate of GTIAEmulator is
begin
	process (FO0,PHI2) 

	-- registers of the GTIA
	variable HPOSP0 : std_logic_vector (7 downto 0) := "00000000";
	variable HPOSP1 : std_logic_vector (7 downto 0) := "00000000";
	variable HPOSP2 : std_logic_vector (7 downto 0) := "00000000";
	variable HPOSP3 : std_logic_vector (7 downto 0) := "00000000";
	variable HPOSM0 : std_logic_vector (7 downto 0) := "00000000";
	variable HPOSM1 : std_logic_vector (7 downto 0) := "00000000";
	variable HPOSM2 : std_logic_vector (7 downto 0) := "00000000";
	variable HPOSM3 : std_logic_vector (7 downto 0) := "00000000";
	variable SIZEP0 : std_logic_vector (1 downto 0) := "00";
	variable SIZEP1 : std_logic_vector (1 downto 0) := "00";
	variable SIZEP2 : std_logic_vector (1 downto 0) := "00";
	variable SIZEP3 : std_logic_vector (1 downto 0) := "00";
	variable SIZEM  : std_logic_vector (7 downto 0) := "00000000";
	variable GRAFP0 : std_logic_vector (7 downto 0) := "00000000";
	variable GRAFP1 : std_logic_vector (7 downto 0) := "00000000";
	variable GRAFP2 : std_logic_vector (7 downto 0) := "00000000";
	variable GRAFP3 : std_logic_vector (7 downto 0) := "00000000";
	variable GRAFM  : std_logic_vector (7 downto 0) := "00000000";
	variable COLPM0 : std_logic_vector (7 downto 1) := "0001100";
	variable COLPM1 : std_logic_vector (7 downto 1) := "0010100";
	variable COLPM2 : std_logic_vector (7 downto 1) := "0011100";
	variable COLPM3 : std_logic_vector (7 downto 1) := "0010000";
	variable COLPF0 : std_logic_vector (7 downto 1) := "0100010";
	variable COLPF1 : std_logic_vector (7 downto 1) := "1100110";
	variable COLPF2 : std_logic_vector (7 downto 1) := "0110100";
	variable COLPF3 : std_logic_vector (7 downto 1) := "0111111";
	variable COLBK  : std_logic_vector (7 downto 1) := "0000000";
	variable PRIOR  : std_logic_vector (7 downto 0) := "00000000";
	variable VDELAY : std_logic_vector (7 downto 0) := "00000000";
	variable GRACTL : std_logic_vector (1 downto 0) := "00";

	-- registered inputs
	variable in_a   : std_logic_vector(4 downto 0);
	variable in_halt: std_logic;
	variable in_an  : std_logic_vector(2 downto 0);
	variable in2_an : std_logic_vector(2 downto 0);

	-- variables for synchronious operation
	variable hcounter : integer range 0 to 227 := 0;
	variable vcounter : integer range 0 to 511 := 0;
	variable highres : std_logic := '0';
	variable command : std_logic_vector(2 downto 0) := "000";
	variable prevcommand : std_logic_vector(2 downto 0) := "000";
	variable cycle : integer range 0 to 127;
	
	-- variables for player and missile display
	variable ticker_p0 : integer range 0 to 15 := 15;
	variable ticker_p1 : integer range 0 to 15 := 15;
	variable ticker_p2 : integer range 0 to 15 := 15;
	variable ticker_p3 : integer range 0 to 15 := 15;
	variable ticker_m0 : integer range 0 to 3 := 3;
	variable ticker_m1 : integer range 0 to 3 := 3;
	variable ticker_m2 : integer range 0 to 3 := 3;
	variable ticker_m3 : integer range 0 to 3 := 3;
	
	-- temporary variables
	variable tmp_colorlines : std_logic_vector(8 downto 0);
	variable tmp_colorlines_res0 : std_logic_vector(8 downto 0);
	variable tmp_colorlines_res1 : std_logic_vector(8 downto 0);
	variable tmp_colorlines_res2 : std_logic_vector(8 downto 0);
	variable tmp_colorlines_res3 : std_logic_vector(8 downto 0);
	variable tmp_bgcolor : std_logic_vector(7 downto 0);
	variable tmp_4bitvalue : std_logic_vector(3 downto 0);
	variable tmp_odd : boolean;
	variable tmp_ypbpr : std_logic_vector(14 downto 0);
	variable tmp_overridelum : std_logic_vector(1 downto 0);
	variable tmp_color: std_logic_vector(7 downto 0);
	variable tmp_blanking : boolean;
	variable tmp_address : std_logic_vector(4 downto 0);
	variable tmp_data : std_logic_vector(7 downto 0);
	
		-- test, if it is now necessary to increment player/missile pixel counter
		function needpixelstep (hpos:std_logic_vector(7 downto 0); size: std_logic_vector(1 downto 0); hc:integer range 0 to 227) return boolean is
		variable x:std_logic_vector(1 downto 0);
		begin
			x := std_logic_vector(to_unsigned(hc,2));
			case size is 
			when "00" =>   return true;                -- single size
			when "01" =>   return x(0)=hpos(0);       -- double size
			when "10" =>   return true;                -- single size
			when others => return x=hpos(1 downto 0); -- 4 times size
			end case;
		end needpixelstep;				
		
		-- helper function to expand a single bit to 5 identical bits
		subtype T_5bits is std_logic_vector(4 downto 0);
		function expand(b:std_logic) return T_5bits is
		begin
			if b='0' then 
				return "00000";
			else
				return "11111";
			end if;
		end expand;
		
	begin
		-- process ANTIC data signals
		if rising_edge(FO0) then
			-- default color lines to show no color at all (only black)
			tmp_overridelum := "00";
			tmp_colorlines := "000000000";
			tmp_blanking := false;
			
			-- compose the 4bit pixel value that is used in GTIA modes (peeking ahead for next antic command)
			if (hcounter mod 2) = 1 then
				tmp_4bitvalue := command(1 downto 0) & in_an(1 downto 0);
				if PRIOR(7 downto 6)="10" and command(2)='1' and in_an(2)='0' and tmp_4bitvalue/="0000" then  -- background color command in 9-color mode
					tmp_4bitvalue := "1000";
				end if;
			else 
				tmp_4bitvalue := prevcommand(1 downto 0) & command(1 downto 0);
				if PRIOR(7 downto 6)="10" and prevcommand(2)='1' and command(2)='0' and tmp_4bitvalue/="0000" then -- background color command in 9-color mode
					tmp_4bitvalue := "1000";
				end if;
			end if;
			
			-- chose proper background color for special color interpretation modes
			case PRIOR(7 downto 6) is
			when "00" =>    -- standard background color
				tmp_bgcolor := COLBK & "0";
			when "01"  =>   -- single hue, 16 luminances
				tmp_bgcolor(7 downto 4) := COLBK(7 downto 4);
				tmp_bgcolor(3 downto 0) := (COLBK(3 downto 1) & '0') or tmp_4bitvalue;
			when "10" =>   -- indexed color look up 
				tmp_bgcolor := COLBK & "0";
			when others =>   -- 16 hues, single luminance
				tmp_bgcolor(7 downto 4) := COLBK(7 downto 4) or tmp_4bitvalue;
				tmp_bgcolor(3 downto 0) := COLBK(3 downto 1) & "1";
			end case;

			----- process previously read antic command ---
			if command(2) = '1' then	 -- playfield command
				-- interpret bits according to gtia mode				
				case PRIOR(7 downto 6) is
				when "00" =>   -- 4-color playfield or 1.5-color highres
					if highres='0' then
						tmp_colorlines(4 + to_integer(unsigned(command(1 downto 0)))) := '1';
					else
						tmp_colorlines(6) := '1';
						tmp_overridelum(0) := command(1);				
						tmp_overridelum(1) := command(0);				
					end if;
				when "01"  =>   -- single hue, 16 luminances, imposed on background
					tmp_colorlines(8) := '1';
				when "10" =>   -- indexed color look up 
					case tmp_4bitvalue is
					when "0000" => tmp_colorlines(0) := '1';
					when "0001" => tmp_colorlines(1) := '1';
					when "0010" => tmp_colorlines(2) := '1';
					when "0011" => tmp_colorlines(3) := '1';
					when "0100" => tmp_colorlines(4) := '1';
					when "0101" => tmp_colorlines(5) := '1';
					when "0110" => tmp_colorlines(6) := '1';
					when "0111" => tmp_colorlines(7) := '1';
					when "1000" => tmp_colorlines(8) := '1';
					when "1001" => tmp_colorlines(8) := '1';
					when "1010" => tmp_colorlines(8) := '1';
					when "1011" => tmp_colorlines(8) := '1';
					when "1100" => tmp_colorlines(4) := '1';
					when "1101" => tmp_colorlines(5) := '1';
					when "1110" => tmp_colorlines(6) := '1';
					when others => tmp_colorlines(7) := '1';
					end case;
				when others  =>   -- 16 hues, single luminance, imposed on background
					tmp_colorlines(8) := '1';
				end case;
			elsif command(1) = '1' then  -- blank command (setting/clearing highres)
				highres := command(0);
				tmp_blanking := true;
			elsif  command(0) = '1' then  -- vsync command
				tmp_blanking := true; 
			else                          -- background color
				if PRIOR(7 downto 6)="10" then 
					case tmp_4bitvalue is
					when "0000" => tmp_colorlines(0) := '1';
					when "0001" => tmp_colorlines(1) := '1';
					when "0010" => tmp_colorlines(2) := '1';
					when "0011" => tmp_colorlines(3) := '1';
					when "0100" => tmp_colorlines(4) := '1';
					when "0101" => tmp_colorlines(5) := '1';
					when "0110" => tmp_colorlines(6) := '1';
					when "0111" => tmp_colorlines(7) := '1';
					when "1000" => tmp_colorlines(8) := '1';
					when "1001" => tmp_colorlines(8) := '1';
					when "1010" => tmp_colorlines(8) := '1';
					when "1011" => tmp_colorlines(8) := '1';
					when "1100" => tmp_colorlines(4) := '1';
					when "1101" => tmp_colorlines(5) := '1';
					when "1110" => tmp_colorlines(6) := '1';
					when others => tmp_colorlines(7) := '1';
					end case;
				else
					tmp_colorlines(8) := '1';					
				end if;
			end if;

			-- determine which part of players and missiles are visible
			if ticker_p0<8 and  GRAFP0(7-ticker_p0)='1' then
				tmp_colorlines(0) := '1';
			end if;
			if ticker_p1<8 and GRAFP1(7-ticker_p1)='1' then
				tmp_colorlines(1) := '1';
			end if;
			if ticker_p2<8 and GRAFP2(7-ticker_p2)='1' then
				tmp_colorlines(2) := '1';
			end if;
			if ticker_p3<8 and GRAFP3(7-ticker_p3)='1' then
				tmp_colorlines(3) := '1';
			end if;
			if ticker_m0<2 and GRAFM(0 + (1-ticker_m0))='1' then
				if PRIOR(4)='1' then
					tmp_colorlines(7) := '1';
				else 
					tmp_colorlines(0) := '1';
				end if;
			end if;
			if ticker_m1<2 and GRAFM(2 + (1-ticker_m1))='1' then
				if PRIOR(4)='1' then
					tmp_colorlines(7) := '1';
				else 
					tmp_colorlines(1) := '1';
				end if;
			end if;
			if ticker_m2<2 and GRAFM(4 + (1-ticker_m2))='1' then
				if PRIOR(4)='1' then
					tmp_colorlines(7) := '1';
				else 
					tmp_colorlines(2) := '1';
				end if;
			end if;
			if ticker_m3<2 and GRAFM(6 + (1-ticker_m3))='1' then
				if PRIOR(4)='1' then
					tmp_colorlines(7) := '1';
				else 
					tmp_colorlines(3) := '1';
				end if;
			end if;
			
			-- trigger start of display of players and missiles ---			
			if hcounter=to_integer(unsigned(HPOSP0)) then 
				ticker_p0 := 0;
			elsif ticker_p0<8 and needpixelstep(HPOSP0,SIZEP0(1 downto 0),hcounter) then 
				ticker_p0 := ticker_p0 + 1;
			end if;
			if hcounter=to_integer(unsigned(HPOSP1)) then 
				ticker_p1 := 0;
			elsif ticker_p1<8 and needpixelstep(HPOSP1,SIZEP1(1 downto 0),hcounter) then 
				ticker_p1 := ticker_p1 + 1;
			end if;
			if hcounter=to_integer(unsigned(HPOSP2)) then 
				ticker_p2 := 0;
			elsif ticker_p2<8 and needpixelstep(HPOSP2,SIZEP2(1 downto 0),hcounter) then 
				ticker_p2 := ticker_p2 + 1;
			end if;
			if hcounter=to_integer(unsigned(HPOSP3)) then 
				ticker_p3 := 0;
			elsif ticker_p3<8 and needpixelstep(HPOSP3,SIZEP3(1 downto 0),hcounter) then 
				ticker_p3 := ticker_p3 + 1;
			end if;
			if hcounter=to_integer(unsigned(HPOSM0)) then 
				ticker_m0 := 0;
			elsif ticker_m0 < 2 and needpixelstep(HPOSM0,SIZEM(1 downto 0),hcounter) then 
				ticker_m0 := ticker_m0 + 1;
			end if;
			if hcounter=to_integer(unsigned(HPOSM1)) then 
				ticker_m1 := 0;
			elsif ticker_m1 < 2 and needpixelstep(HPOSM1,SIZEM(3 downto 2),hcounter) then 
				ticker_m1 := ticker_m1 + 1;
			end if;
			if hcounter=to_integer(unsigned(HPOSM2)) then 
				ticker_m2 := 0;
			elsif ticker_m2 < 2 and needpixelstep(HPOSM2,SIZEM(5 downto 4),hcounter) then 
				ticker_m2 := ticker_m2 + 1;
			end if;
			if hcounter=to_integer(unsigned(HPOSM3)) then 
				ticker_m3 := 0;
			elsif ticker_m3 < 2 and needpixelstep(HPOSM3,SIZEM(7 downto 6),hcounter) then 
				ticker_m3 := ticker_m3 + 1;
			end if;
					
			-- apply priorities by suppressing specific color lines

			-- everything else cancels background immediately
			if tmp_colorlines(7 downto 0) /= "00000000" then
				tmp_colorlines(8) := '0';
			end if;
			
			-- apply cancelation according to priority bits (works in parallel)
			tmp_colorlines_res0 := tmp_colorlines;
			if PRIOR(0)='1' then 
				if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines_res0(3 downto 2) := "00"; end if;
				if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines_res0(5 downto 4) := "00"; end if;
				if tmp_colorlines(3 downto 2)/="00" then tmp_colorlines_res0(5 downto 4) := "00"; end if;
				if tmp_colorlines(3 downto 2)/="00" then tmp_colorlines_res0(7 downto 6) := "00"; end if;
			end if;
			tmp_colorlines_res1 := tmp_colorlines;
			if PRIOR(1)='1' then 
				if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines_res1(3 downto 2) := "00"; end if;
				if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines_res1(5 downto 4) := "00"; end if;
				if tmp_colorlines(7 downto 6)/="00" then tmp_colorlines_res1(3 downto 2) := "00"; end if;
			end if;
			tmp_colorlines_res2 := tmp_colorlines;
			if PRIOR(2)='1' then 
				if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines_res2(3 downto 2) := "00"; end if;
				if tmp_colorlines(5 downto 4)/="00" then tmp_colorlines_res2(1 downto 0) := "00"; end if;
				if tmp_colorlines(7 downto 6)/="00" then tmp_colorlines_res2(1 downto 0) := "00"; end if;
				if tmp_colorlines(7 downto 6)/="00" then tmp_colorlines_res2(3 downto 2) := "00"; end if;
			end if;
			tmp_colorlines_res3 := tmp_colorlines;
			if PRIOR(3)='1' then 
				if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines_res3(3 downto 2) := "00"; end if;
				if tmp_colorlines(3 downto 2)/="00" then tmp_colorlines_res3(7 downto 6) := "00"; end if;
				if tmp_colorlines(5 downto 4)/="00" then tmp_colorlines_res3(1 downto 0) := "00"; end if;
				if tmp_colorlines(5 downto 4)/="00" then tmp_colorlines_res3(7 downto 6) := "00"; end if;
			end if; 			
			tmp_colorlines := tmp_colorlines_res0 and tmp_colorlines_res1 and tmp_colorlines_res2 and tmp_colorlines_res3;
			
			-- apply final cancelation to the "surviving" color lines
			if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines(3 downto 2) := "00"; end if;
			if tmp_colorlines(1 downto 0)/="00" then tmp_colorlines(7 downto 6) := "00"; end if;
			if tmp_colorlines(5 downto 4)/="00" then tmp_colorlines(3 downto 2) := "00"; end if;
			if tmp_colorlines(7 downto 6)/="00" then tmp_colorlines(5 downto 4) := "00"; end if;
			-- only one playfield color will be shown 
			if tmp_colorlines(7)/='0' then tmp_colorlines(6) := '0'; end if;
			if PRIOR(5)='0' then  -- no multicolor players allowed
				if tmp_colorlines(0)/='0' then tmp_colorlines(1) := '0'; end if;
				if tmp_colorlines(2)/='0' then tmp_colorlines(3) := '0'; end if;
			end if;
			
			-- constrain color generation to screen boundaries
			if not tmp_blanking then
				-- simulate the 'wired or' that mixes together all bits of 
				-- all still selected color lines
				tmp_color := "00000000";
				if tmp_colorlines(0)='1' then	tmp_color := tmp_color or (COLPM0 & "0"); end if;
				if tmp_colorlines(1)='1' then	tmp_color := tmp_color or (COLPM1 & "0"); end if;
				if tmp_colorlines(2)='1' then	tmp_color := tmp_color or (COLPM2 & "0"); end if;
				if tmp_colorlines(3)='1' then tmp_color := tmp_color or (COLPM3 & "0"); end if;
				if tmp_colorlines(4)='1' then	tmp_color := tmp_color or (COLPF0 & "0"); end if;
				if tmp_colorlines(5)='1' then	tmp_color := tmp_color or (COLPF1 & "0"); end if;
				if tmp_colorlines(6)='1' then	tmp_color := tmp_color or (COLPF2 & "0"); end if;
				if tmp_colorlines(7)='1' then	tmp_color := tmp_color or (COLPF3 & "0"); end if;
				if tmp_colorlines(8)='1' then	tmp_color := tmp_color or (tmp_bgcolor);  end if;
				-- determine lum values for both pixels
				if tmp_overridelum(0)='1' then
					lum0 <= COLPF1(3 downto 1) & "0";	
				else
					lum0 <= tmp_color(3 downto 0);
				end if;
				if tmp_overridelum(1)='1' then
					lum1 <= COLPF1(3 downto 1) & "0";	
				else
					lum1 <= tmp_color(3 downto 0);
				end if;
				-- hue is same for both pixels
				hue <= tmp_color(7 downto 4);
			else
				lum0 <= "0000";
				hue <= "0000"; 
				lum1 <= "0000";
			end if ;
			 
			-- generate csync for PAL 288p signal (adjusting timing a bit to get screen correctly aligned) 	
			if (vcounter=0) and (hcounter<16 or (hcounter>=114 and hcounter<114+8)) then                       -- normal sync, short sync
				csync <= '0';				
			elsif (vcounter=1 or vcounter=2) and (hcounter<8 or (hcounter>=114 and hcounter<114+8)) then        -- 2x 2 short syncs
				csync <= '0';
			elsif (vcounter=3 or vcounter=4) and (hcounter<114-16 or (hcounter>=114 and hcounter<228-16)) then    -- 2x 2 vsyncs
				csync <= '0';
			elsif (vcounter=5) and (hcounter<114-16 or (hcounter>=114 and hcounter<114+8)) then                -- one vsync, one short sync
				csync <= '0';
			elsif (vcounter=6 or vcounter=7) and (hcounter<8 or (hcounter>=114 and hcounter<114+8)) then          -- 2x 2 short syncs
				csync <= '0';
			elsif (vcounter>=8) and (hcounter<16) then                                                   -- normal line syncs
				csync <= '0';
			else
				csync <= '1';
			end if;
			
			----- count horizontal and vertical pixels (vsync according to command)
			if command="001" and vcounter>128 then 
				hcounter := 2;               -- because of this tweak, there will be 2 pixels in the 312th row 
				vcounter := 0;               -- (but because the lines start with sync all the same, it makes no difference)
			else 
				if hcounter<227 then
					hcounter := hcounter+1;
				else 
					hcounter := 0;
					if vcounter< 511 then 
						vcounter := vcounter+1;
					end if;
				end if;			
			end if;
			
			----- receive next antic command ----
			prevcommand := command;
			command := in_an;
			in_an := in2_an;
			in2_an := AN;
		end if;

		--- cpu cycle calculation for later use at the falling PHI2  
		if falling_edge(FO0) then
			cycle := (hcounter+2) / 2;
		end if;
		
		-- access address bus early 
		if rising_edge(PHI2) then
			in_a := A;
		end if;
		
		-- process data from the system bus
		if falling_edge(PHI2) then
			-- by default no write 
			tmp_address := "11111"; 
			tmp_data := D;

			-- register write by CPU
			if CS='0' and RW='0' then
				tmp_address := in_a;
			-- possible write by DMA
			elsif in_halt='0' then	
				tmp_odd := (vcounter mod 2) = 0;
				-- is intended for missiles
				if GRACTL(0)='1' and cycle=1 then
					tmp_address := "10001";
					tmp_data := GRAFM;
					if VDELAY(0)='0' or tmp_odd then
						tmp_data(1 downto 0) := D(1 downto 0);
					end if;
					if VDELAY(1)='0' or tmp_odd then
						tmp_data(3 downto 2) := D(3 downto 2);
					end if;
					if VDELAY(2)='0' or tmp_odd then
						tmp_data(5 downto 4) := D(5 downto 4);
					end if;
					if VDELAY(3)='0' or tmp_odd then
						tmp_data(7 downto 6) := D(7 downto 6);
					end if;
				-- is intended for player
				elsif GRACTL(1)='1' then
					if cycle=3 and (VDELAY(4)='0' or tmp_odd) then
						tmp_address := "01101";
					elsif cycle=4 and (VDELAY(5)='0' or tmp_odd) then
						tmp_address := "01110";
					elsif cycle=5 and (VDELAY(6)='0' or tmp_odd) then
						tmp_address := "01111";
					elsif cycle=6 and (VDELAY(7)='0' or tmp_odd) then
						tmp_address := "10000";
					end if;
				end if;
			end if;
			
			-- write to selected register
			case tmp_address is
				when "00000" => HPOSP0 := tmp_data;
				when "00001" => HPOSP1 := tmp_data;
				when "00010" => HPOSP2 := tmp_data;
				when "00011" => HPOSP3 := tmp_data;
				when "00100" => HPOSM0 := tmp_data;
				when "00101" => HPOSM1 := tmp_data;
				when "00110" => HPOSM2 := tmp_data;
				when "00111" => HPOSM3 := tmp_data;				
				when "01000" => SIZEP0 := tmp_data(1 downto 0);
				when "01001" => SIZEP1 := tmp_data(1 downto 0);
				when "01010" => SIZEP2 := tmp_data(1 downto 0);
				when "01011" => SIZEP3 := tmp_data(1 downto 0);
				when "01100" => SIZEM  := tmp_data;
				when "01101" => GRAFP0 := tmp_data;
				when "01110" => GRAFP1 := tmp_data;
				when "01111" => GRAFP2 := tmp_data;
				when "10000" => GRAFP3 := tmp_data;
				when "10001" => GRAFM  := tmp_data;					
				when "10010" => COLPM0 := tmp_data(7 downto 1);
				when "10011" => COLPM1 := tmp_data(7 downto 1);
				when "10100" => COLPM2 := tmp_data(7 downto 1);
				when "10101" => COLPM3 := tmp_data(7 downto 1);
				when "10110" => COLPF0 := tmp_data(7 downto 1);
				when "10111" => COLPF1 := tmp_data(7 downto 1);
				when "11000" => COLPF2 := tmp_data(7 downto 1);
				when "11001" => COLPF3 := tmp_data(7 downto 1);
				when "11010" => COLBK  := tmp_data(7 downto 1);
				when "11011" => PRIOR  := tmp_data;
				when "11100" => VDELAY := tmp_data;
				when "11101" => GRACTL := tmp_data(1 downto 0);
				when others => 
			end case;

			in_halt := HALT; 
		end if;
					
	end process;
	
end immediate;

