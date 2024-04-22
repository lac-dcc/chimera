library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

-- Implement a GTIA emulation that sniffs all relevant
-- input pins of the GTIA and emulates the internal 
-- behaviour of the GTIA to finally create a YPbPr signal.
-- Output is generated at every falling edge of the CLK

entity GTIA2YPbPr is	
	port (
		-- standard definition YPbPr output
		SDTV_Y:  out std_logic_vector(5 downto 0);	
		SDTV_Pb: out std_logic_vector(4 downto 0); 
		SDTV_Pr: out std_logic_vector(4 downto 0); 
		
		-- synchronous clock
		CLK         : in std_logic;
		
		-- Connections to the real GTIAs pins 
		F0O         : in std_logic;
		A           : in std_logic_vector(4 downto 0);
		D           : in std_logic_vector(7 downto 0);
		AN          : in std_logic_vector(2 downto 0);
		RW          : in std_logic;
		CS          : in std_logic;
		HALT        : in std_logic;
		
		-- select high-contrast palette
		HIGHCONTRAST : in boolean
	);	
end entity;

architecture immediate of GTIA2YPbPr is
begin
	process (CLK) 

  	type T_ataripalette is array (0 to 255) of integer range 0 to 32767;
   constant ataripalette : T_ataripalette := (
        16#0210#,16#0a10#,16#1210#,16#1a10#,16#2610#,16#2e10#,16#3610#,16#3e10#,16#4210#,16#4a10#,16#5210#,16#5a10#,16#6610#,16#6e10#,16#7610#,16#7e10#,
        16#09f4#,16#0dd4#,16#15b5#,16#1d95#,16#2575#,16#2d55#,16#3515#,16#3d15#,16#4115#,16#4915#,16#5115#,16#5935#,16#6135#,16#6934#,16#6d33#,16#7552#,
        16#0dd5#,16#0dd6#,16#15b6#,16#1d97#,16#2577#,16#2d77#,16#3577#,16#3d77#,16#4177#,16#4977#,16#5177#,16#5976#,16#6195#,16#6594#,16#6d93#,16#71b2#,
        16#0e15#,16#1216#,16#1637#,16#1e37#,16#2237#,16#2e37#,16#3637#,16#3e57#,16#4237#,16#4a37#,16#5237#,16#5a57#,16#6255#,16#6654#,16#6e73#,16#7252#,
        16#12b3#,16#12d4#,16#1af5#,16#1af6#,16#26f5#,16#2ef5#,16#36f5#,16#3ef6#,16#42f6#,16#4af5#,16#52d6#,16#5ab6#,16#6296#,16#6695#,16#6a74#,16#6e53#,
        16#0ef1#,16#1312#,16#1733#,16#1b34#,16#2734#,16#2f34#,16#3734#,16#3f34#,16#4334#,16#4b14#,16#52f4#,16#5ab4#,16#5e94#,16#6674#,16#6e73#,16#7252#,
        16#0f2f#,16#0f50#,16#1371#,16#1b51#,16#2751#,16#2f51#,16#3751#,16#3f31#,16#4332#,16#4712#,16#52f2#,16#56d2#,16#5eb2#,16#6692#,16#6e53#,16#7232#,
        16#0b0f#,16#0f2e#,16#172d#,16#1f4d#,16#234d#,16#2f4d#,16#374d#,16#3f2d#,16#432d#,16#4b0d#,16#52ed#,16#5aad#,16#5e8d#,16#666e#,16#6e4e#,16#762e#,
        16#0ace#,16#12ed#,16#16ec#,16#1eeb#,16#26eb#,16#2f0b#,16#370b#,16#3f0b#,16#430b#,16#4b0b#,16#52cb#,16#5aab#,16#628b#,16#6a6b#,16#724c#,16#762c#,
        16#0e6e#,16#128d#,16#1a8c#,16#1e8b#,16#26aa#,16#2ea9#,16#36a9#,16#3ea9#,16#42a9#,16#4aa9#,16#52a9#,16#5aa9#,16#6289#,16#6a6a#,16#724a#,16#724b#,
        16#0dce#,16#11ad#,16#19cc#,16#1dcb#,16#25c9#,16#2de9#,16#35e9#,16#3de9#,16#41c9#,16#49e9#,16#51e9#,16#5de9#,16#61e9#,16#69e9#,16#6e0a#,16#720b#,
        16#0dce#,16#11ad#,16#19ac#,16#218c#,16#256c#,16#2d2c#,16#350c#,16#3cec#,16#40ec#,16#48ec#,16#50ec#,16#58ec#,16#64ec#,16#68ed#,16#6d0e#,16#712f#,
        16#0dee#,16#11cd#,16#198e#,16#216e#,16#294e#,16#2d2e#,16#390e#,16#3cee#,16#40ef#,16#48cf#,16#50cf#,16#58cf#,16#64cf#,16#6caf#,16#70d0#,16#70f1#,
        16#09f0#,16#11d0#,16#19b0#,16#2170#,16#2950#,16#2d30#,16#3911#,16#3cf1#,16#40f1#,16#48b1#,16#50b1#,16#58b1#,16#60b1#,16#6cb1#,16#74d1#,16#74f2#,
        16#09f2#,16#11d2#,16#19b2#,16#2193#,16#2573#,16#2d33#,16#3513#,16#3cf3#,16#40f3#,16#48d3#,16#50d3#,16#5cd3#,16#60d3#,16#68f3#,16#70f2#,16#7511#,
        16#09f4#,16#0dd4#,16#15b5#,16#1d95#,16#2575#,16#2d55#,16#3515#,16#3d15#,16#4115#,16#4915#,16#5115#,16#5935#,16#6135#,16#6934#,16#6d33#,16#7552#
    );	
	
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
	variable in_f0o         : std_logic;
	variable	in_a           : std_logic_vector(4 downto 0);
	variable in_d	         : std_logic_vector(7 downto 0);
	variable in_an          : std_logic_vector(2 downto 0);
	variable in2_an          : std_logic_vector(2 downto 0);
	variable in3_an          : std_logic_vector(2 downto 0);
	variable in_rw          : std_logic;
	variable in_cs          : std_logic;
	variable in_halt        : std_logic_vector(255 downto 0);
	variable dma_data : std_logic_vector(7 downto 0);

	-- variables for synchronious operation
	variable phase : integer range 0 to 3 := 0;
	variable hcounter : integer range 0 to 227 := 0;
	variable vcounter : integer range 0 to 511 := 0;
	variable highres : std_logic := '0';
	variable command : std_logic_vector(2 downto 0) := "000";
	variable prevcommand : std_logic_vector(2 downto 0) := "000";
	variable prevrw: std_logic := '0';
	
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

   -- internal color and sync registers
	variable csync : std_logic := '1';
	variable color: std_logic_vector(11 downto 0) := "000000000000";  -- lum0 / hue / lum1
	
	-- registered output 
	variable out_Y  : std_logic_vector(5 downto 0) := "000000";
	variable out_Pb : std_logic_vector(4 downto 0) := "10000";
	variable out_Pr : std_logic_vector(4 downto 0) := "10000";
	
		-- test, if it is now necessary to increment player/missile pixel counter
		function needpixelstep (hpos:std_logic_vector(7 downto 0); size: std_logic_vector(1 downto 0)) return boolean is
		variable x:std_logic_vector(1 downto 0);
		begin
			x := std_logic_vector(to_unsigned(hcounter,2));
			case size is 
			when "00" => return true;               -- single size
			when "01" => return x(0)=hpos(0);       -- double size
			when "10" => return true;               -- single size
			when "11" => return x=hpos(1 downto 0); -- 4 times size
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
	
			-- capture sprite data at the right point
		if rising_edge(CLK) and phase=0 then
			dma_data := D;			
		end if;

		
		if rising_edge(CLK) then

			------------ select output color for both halves of the atari clock ---------
			if (PHASE=3 or PHASE=1) then
				if csync='0' then
					out_y := "000000";
					out_pb := "10000";
					out_pr := "10000";
				else			
					if PHASE=3 then -- pixel 0
						tmp_color := color(7 downto 4) & color(11 downto 8);
					else            -- pixel 1
						tmp_color := color(7 downto 0);
					end if;
					tmp_ypbpr := std_logic_vector(to_unsigned(ataripalette(to_integer(unsigned(tmp_color))), 15));			
					out_y(5) := '1';
					out_y(4 downto 0) := tmp_ypbpr(14 downto 10);
					out_pb := tmp_ypbpr(9 downto 5);
					out_pr := tmp_ypbpr(4 downto 0);
				end if;
			end if;		

			--------- serial color bit output for the highcontrast mode ----
			if HIGHCONTRAST then
				if csync='0' then
					out_y := "000000";
					out_pb := "00000";
					out_pr := "00000";
				elsif PHASE=3 then        -- output sample 0
					out_y := "1" & expand(color(11));   
					out_pb := expand(color(7)); -- HUE
					out_pr := expand(color(6)); -- HUE
				elsif PHASE=0 then        -- output sample 1
					out_y := "1" & expand(color(10));
					out_pb := expand(color(9));
					out_pr := expand(color(8));
				elsif PHASE=1 then        -- output sample 2
					out_y := "1" & expand(color(3));
					out_pb := expand(color(5));  -- HUE
					out_pr := expand(color(4));  -- HUE
				elsif PHASE=2 then        -- output sample 3
					out_y := "1" & expand(color(2));
					out_pb := expand(color(1));
					out_pr := expand(color(0));
				end if;
			end if;
			
		
			--------------------- logic for antic input -------------------
			if PHASE=2 then
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
				when "11" =>   -- 16 hues, single luminance
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
							tmp_overridelum := command(1 downto 0);				
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
						when "1111" => tmp_colorlines(7) := '1';
						end case;
					when "11"  =>   -- 16 hues, single luminance, imposed on background
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
						when "1111" => tmp_colorlines(7) := '1';
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
				elsif ticker_p0<8 and needpixelstep(HPOSP0,SIZEP0(1 downto 0)) then 
					ticker_p0 := ticker_p0 + 1;
				end if;
				if hcounter=to_integer(unsigned(HPOSP1)) then 
					ticker_p1 := 0;
				elsif ticker_p1<8 and needpixelstep(HPOSP1,SIZEP1(1 downto 0)) then 
					ticker_p1 := ticker_p1 + 1;
				end if;
				if hcounter=to_integer(unsigned(HPOSP2)) then 
					ticker_p2 := 0;
				elsif ticker_p2<8 and needpixelstep(HPOSP2,SIZEP2(1 downto 0)) then 
					ticker_p2 := ticker_p2 + 1;
				end if;
				if hcounter=to_integer(unsigned(HPOSP3)) then 
					ticker_p3 := 0;
				elsif ticker_p3<8 and needpixelstep(HPOSP3,SIZEP3(1 downto 0)) then 
					ticker_p3 := ticker_p3 + 1;
				end if;
				if hcounter=to_integer(unsigned(HPOSM0)) then 
					ticker_m0 := 0;
				elsif ticker_m0 < 2 and needpixelstep(HPOSM0,SIZEM(1 downto 0)) then 
					ticker_m0 := ticker_m0 + 1;
				end if;
				if hcounter=to_integer(unsigned(HPOSM1)) then 
					ticker_m1 := 0;
				elsif ticker_m1 < 2 and needpixelstep(HPOSM1,SIZEM(3 downto 2)) then 
					ticker_m1 := ticker_m1 + 1;
				end if;
				if hcounter=to_integer(unsigned(HPOSM2)) then 
					ticker_m2 := 0;
				elsif ticker_m2 < 2 and needpixelstep(HPOSM2,SIZEM(5 downto 4)) then 
					ticker_m2 := ticker_m2 + 1;
				end if;
				if hcounter=to_integer(unsigned(HPOSM3)) then 
					ticker_m3 := 0;
				elsif ticker_m3 < 2 and needpixelstep(HPOSM3,SIZEM(7 downto 6)) then 
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
				
				-- simulate the 'wired or' that mixes together all bits of 
				-- all still selected color lines
				color := "000000000000";
				-- constrain color generation to screen boundaries
				if not tmp_blanking then
					if tmp_colorlines(0)='1' then	color := color or ("0000" & COLPM0 & "0"); end if;
					if tmp_colorlines(1)='1' then	color := color or ("0000" & COLPM1 & "0"); end if;
					if tmp_colorlines(2)='1' then	color := color or ("0000" & COLPM2 & "0"); end if;
					if tmp_colorlines(3)='1' then color := color or ("0000" & COLPM3 & "0"); end if;
					if tmp_colorlines(4)='1' then	color := color or ("0000" & COLPF0 & "0"); end if;
					if tmp_colorlines(5)='1' then	color := color or ("0000" & COLPF1 & "0"); end if;
					if tmp_colorlines(6)='1' then	color := color or ("0000" & COLPF2 & "0"); end if;
					if tmp_colorlines(7)='1' then	color := color or ("0000" & COLPF3 & "0"); end if;
					if tmp_colorlines(8)='1' then	color := color or ("0000" & tmp_bgcolor);  end if;
					-- determine lum values for both pixels
					if tmp_overridelum(1)='1' then
						color(11 downto 8) := COLPF1(3 downto 1) & "0";	
					else
						color(11 downto 8) := color(3 downto 0);					
					end if;
					if tmp_overridelum(0)='1' then
						color(3 downto 0) := COLPF1(3 downto 1) & "0";	
					end if;
				end if ;
				 
				-- generate csync for PAL 288p signal (adjusting timing a bit to get screen correctly aligned) 	
				if (vcounter=0) and (hcounter<16 or (hcounter>=114 and hcounter<114+8)) then                       -- normal sync, short sync
					csync := '0';				
				elsif (vcounter=1 or vcounter=2) and (hcounter<8 or (hcounter>=114 and hcounter<114+8)) then        -- 2x 2 short syncs
					csync := '0';
				elsif (vcounter=3 or vcounter=4) and (hcounter<114-16 or (hcounter>=114 and hcounter<228-16)) then    -- 2x 2 vsyncs
					csync := '0';
				elsif (vcounter=5) and (hcounter<114-16 or (hcounter>=114 and hcounter<114+8)) then                -- one vsync, one short sync
					csync := '0';
				elsif (vcounter=6 or vcounter=7) and (hcounter<8 or (hcounter>=114 and hcounter<114+8)) then          -- 2x 2 short syncs
					csync := '0';
				elsif (vcounter>=8) and (hcounter<16) then                                                   -- normal line syncs
					csync := '0';
				else
					csync := '1';
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
			end if;
			
			
				----- let CPU write to the registers (at second clock where rw is asserted) --
			if PHASE=0 then
				if (in_CS='0') and (in_RW='0') and (prevrw='0') then
					case in_A is
						when "00000" => HPOSP0 := in_D;
						when "00001" => HPOSP1 := in_D;
						when "00010" => HPOSP2 := in_D;
						when "00011" => HPOSP3 := in_D;
						when "00100" => HPOSM0 := in_D;
						when "00101" => HPOSM1 := in_D;
						when "00110" => HPOSM2 := in_D;
						when "00111" => HPOSM3 := in_D;				
						when "01000" => SIZEP0 := in_D(1 downto 0);
						when "01001" => SIZEP1 := in_D(1 downto 0);
						when "01010" => SIZEP2 := in_D(1 downto 0);
						when "01011" => SIZEP3 := in_D(1 downto 0);
						when "01100" => SIZEM  := in_D;
						when "01101" => GRAFP0 := in_D;
						when "01110" => GRAFP1 := in_D;
						when "01111" => GRAFP2 := in_D;
						when "10000" => GRAFP3 := in_D;
						when "10001" => GRAFM  := in_D;					
						when "10010" => COLPM0 := in_D(7 downto 1);
						when "10011" => COLPM1 := in_D(7 downto 1);
						when "10100" => COLPM2 := in_D(7 downto 1);
						when "10101" => COLPM3 := in_D(7 downto 1);
						when "10110" => COLPF0 := in_D(7 downto 1);
						when "10111" => COLPF1 := in_D(7 downto 1);
						when "11000" => COLPF2 := in_D(7 downto 1);
						when "11001" => COLPF3 := in_D(7 downto 1);
						when "11010" => COLBK  := in_D(7 downto 1);
						when "11011" => PRIOR  := in_D;
						when "11100" => VDELAY := in_D;
						when "11101" => GRACTL := in_D(1 downto 0);
						when "11110" => 
						when "11111" => 
					end case;
				end if;	
				prevrw := in_RW; 
			end if;
			
			-- receive sprite DMA data -- 
			if PHASE=1 and in_halt(9)='0' then 
				tmp_odd := (vcounter mod 2) = 0;
			
				-- transfer dma player/missile data into registers
				if GRACTL(0)='1' and hcounter=2 then
					if VDELAY(0)='0' or tmp_odd then
						GRAFM(1 downto 0) := dma_data(1 downto 0);
					end if;
					if VDELAY(1)='0' or tmp_odd then
						GRAFM(3 downto 2) := dma_data(3 downto 2);
					end if;
					if VDELAY(2)='0' or tmp_odd then
						GRAFM(5 downto 4) := dma_data(5 downto 4);
					end if;
					if VDELAY(3)='0' or tmp_odd then
						GRAFM(7 downto 6) := dma_data(7 downto 6);
					end if;
				end if;				
				if GRACTL(1)='1' and hcounter=6 then
					if VDELAY(4)='0' or tmp_odd then
						GRAFP0 := dma_data;
					end if;
				end if;
				if GRACTL(1)='1' and hcounter=8 then
					if VDELAY(5)='0' or tmp_odd then 
						GRAFP1 := dma_data;
					end if;
				end if;
				if GRACTL(1)='1' and hcounter=10 then
					if VDELAY(6)='0' or tmp_odd then
						GRAFP2 := dma_data;
					end if;
				end if;
				if GRACTL(1)='1' and hcounter=12 then
					if VDELAY(7)='0' or tmp_odd then 
						GRAFP3 := dma_data;
					end if;
				end if;
			end if;		
		
			--- progress clock phase counter
			if phase>=2 and in_f0o='0' then
				phase := 0;
			elsif phase<3 then
				phase := phase+1;
			end if;
			
			-- take inputs in registers
			in_f0o := F0O;
			in_a := A;
			in_d := D;
			in_an := in2_an;
			in2_an := in3_an;
			in3_an := AN;
			in_rw := RW;
			in_cs := CS;
			in_halt := in_halt(254 downto 0) & HALT;
		end if;
		
		
		-------------------- output signals ---------------------		
		SDTV_Y <= out_y;
		SDTV_Pb <= out_pb;
		SDTV_Pr <= out_pr;				
	end process;
	
end immediate;

