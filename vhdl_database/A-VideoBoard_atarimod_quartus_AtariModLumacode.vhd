-- generating lumacode signal on A-Video board Rev.2 

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity AtariModLumacode is	
	port (
		-- reference clock
		CLK25:  in std_logic;

		-- digital YPbPr output
		Y: out std_logic_vector(5 downto 0);
		Pb: out std_logic_vector(4 downto 0);
		Pr: out std_logic_vector(4 downto 0);

		-- sniffing GTIA pins comming inverted to the GPIO1
		GPIO1: in std_logic_vector(20 downto 1);	
		
		-- read jumper settings
		GPIO2_4: in std_logic;
		GPIO2_5: in std_logic;
		GPIO2_6: in std_logic;
		
		-- multi-purpose use for the JTAG signals (a bit dangerous, but should work)
		TMS : in std_logic;   -- keep the pin working so JTAG is possible
		TCK : in std_logic;   -- keep the pin working so JTAG is possible
		TDI : in std_logic;   -- external jumper to force high-contrast palette 
		TDO : out std_logic   -- keep the pin working so JTAG is possible
	);	
end entity; 


architecture immediate of AtariModLumacode is
	
	signal FO0  : std_logic;  -- atari pixel clock signal
	signal RW   : std_logic;  -- atari r/w
	signal FO1  : std_logic;  -- delayed FO0
	signal PHI2 : std_logic;  -- derived from FO1
	
	signal CSYNC : std_logic;
	signal HUE   : std_logic_vector(3 downto 0);
	signal LUM0  : std_logic_vector(3 downto 0);
	signal LUM1  : std_logic_vector(3 downto 0);

	signal CLK6 : std_logic;  -- six times the pixel clock
		
	component ClockMultiplier6 is
	port (
		CLK25: in std_logic;		
		F0O: in std_logic;
		CLK: out std_logic
	);	
	end component;	
	
	component GTIAEmulator is
	port (
		FO0         : in std_logic;
		AN          : in std_logic_vector(2 downto 0);
		PHI2        : in std_logic;
		A           : in std_logic_vector(4 downto 0);
		D           : in std_logic_vector(7 downto 0);
		RW          : in std_logic;
		CS          : in std_logic;
		HALT        : in std_logic;
		
		CSYNC       : out std_logic;
		HUE         : out std_logic_vector(3 downto 0);
		LUM0        : out std_logic_vector(3 downto 0);
		LUM1        : out std_logic_vector(3 downto 0)
	);	

	end component;		
	
begin		
	-- subcomponents
	multi: ClockMultiplier6 port map ( CLK25, FO0, CLK6 );
	emulator: GTIAEmulator port map (
		FO0,
		NOT (
			GPIO1(17 downto 17) -- AB2
			& GPIO1(15)         -- AN1 
			& GPIO1(13)),       -- AN0
		PHI2,
		NOT (
		GPIO1(6 downto 6)      -- A4
		& GPIO1(4)             -- A3
		& GPIO1(2)             -- A2
		& GPIO1(1)             -- A1
		& GPIO1(3)),           -- A0
		NOT (
		GPIO1(14 downto 14)    -- D7
		& GPIO1(12)            -- D6
		& GPIO1(10)            -- D5
		& GPIO1(8)             -- D4
		& GPIO1(5)             -- D3
		& GPIO1(7)             -- D2
		& GPIO1(9)             -- D1
		& GPIO1(11)),          -- D0
		RW,
		NOT GPIO1(18),         -- CS
		NOT GPIO1(20), 		  -- HALT
		CSYNC,
		HUE,
		LUM0,
		LUM1
	);
	
	-- static pin mapping
	process (GPIO1, FO0, CLK6)  
	begin
		FO0 <= not GPIO1(19);
		RW <= not GPIO1(16);
		TDO <= '1';
	end process;
	
	-- create a delayed pixel clock
	process (FO0, CLK6)
	variable b : std_logic_vector(4 downto 0) := "00000";
	begin
		if rising_edge(CLK6) then
			b := FO0 & b(4 downto 1);		
		end if;
		FO1 <= b(0);
	end process;
	
	-- deduce an approximation of PHI2 
	process (FO1,  RW) 
	variable prev_rw: std_logic;
	variable outclock: std_logic;
	begin
		if falling_edge(FO1) then
			if prev_rw='1' and RW='0' then
				outclock := '1';
			else
				outclock := not outclock;
			end if;
			prev_rw := RW;
		end if;
		PHI2 <= outclock;
	end process;

	-- generate lumacode signal 
	process (CLK6,FO0)
	variable in_fo0,in2_fo0: std_logic;
	variable counter : integer range 0 to 7;
	variable in_csync : std_logic;
	variable in_hue : std_logic_vector(3 downto 0);
	variable in_lum0 : std_logic_vector(3 downto 0);
	variable in_lum1 : std_logic_vector(3 downto 0);	
	variable level : std_logic_vector(1 downto 0);
	begin
		if rising_edge(CLK6) then
			case counter is
			when 0 => level := in_hue(3 downto 2);
			when 1 => level := in_hue(1 downto 0);
			when 2 => level := in_lum0(3 downto 2);
			when 3 => level := in_lum0(1 downto 0);
			when 4 => level := in_lum1(3 downto 2);
			when 5 => level := in_lum1(1 downto 0);
			when 6 => level := "00";
			when 7 => level := "00";
			end case;
			Y <= in_csync & level & level & level(1);
		
			if in_fo0='0' and in2_fo0='1' then
				counter := 0;
				in_csync := CSYNC;
				in_hue := HUE;
				in_lum0 := LUM0;
				in_lum1 := LUM1;
			elsif counter<5 then
				counter := counter+1;
			end if;	
			in_fo0 := in2_fo0;
			in2_fo0 := FO0;
		end if;

		Pb <= FO0 & "0000";
		Pr <= PHI2 & "0000";		
	end process;
	
--	-- generate component video signal 
--	process (FO0)
--	type T_ataripalette is array (0 to 255) of integer range 0 to 32767;
--   constant ataripalette : T_ataripalette := (
--        16#0210#,16#0a10#,16#1210#,16#1a10#,16#2610#,16#2e10#,16#3610#,16#3e10#,16#4210#,16#4a10#,16#5210#,16#5a10#,16#6610#,16#6e10#,16#7610#,16#7e10#,
--        16#09f4#,16#0dd4#,16#15b5#,16#1d95#,16#2575#,16#2d55#,16#3515#,16#3d15#,16#4115#,16#4915#,16#5115#,16#5935#,16#6135#,16#6934#,16#6d33#,16#7552#,
--        16#0dd5#,16#0dd6#,16#15b6#,16#1d97#,16#2577#,16#2d77#,16#3577#,16#3d77#,16#4177#,16#4977#,16#5177#,16#5976#,16#6195#,16#6594#,16#6d93#,16#71b2#,
--        16#0e15#,16#1216#,16#1637#,16#1e37#,16#2237#,16#2e37#,16#3637#,16#3e57#,16#4237#,16#4a37#,16#5237#,16#5a57#,16#6255#,16#6654#,16#6e73#,16#7252#,
--        16#12b3#,16#12d4#,16#1af5#,16#1af6#,16#26f5#,16#2ef5#,16#36f5#,16#3ef6#,16#42f6#,16#4af5#,16#52d6#,16#5ab6#,16#6296#,16#6695#,16#6a74#,16#6e53#,
--        16#0ef1#,16#1312#,16#1733#,16#1b34#,16#2734#,16#2f34#,16#3734#,16#3f34#,16#4334#,16#4b14#,16#52f4#,16#5ab4#,16#5e94#,16#6674#,16#6e73#,16#7252#,
--        16#0f2f#,16#0f50#,16#1371#,16#1b51#,16#2751#,16#2f51#,16#3751#,16#3f31#,16#4332#,16#4712#,16#52f2#,16#56d2#,16#5eb2#,16#6692#,16#6e53#,16#7232#,
--        16#0b0f#,16#0f2e#,16#172d#,16#1f4d#,16#234d#,16#2f4d#,16#374d#,16#3f2d#,16#432d#,16#4b0d#,16#52ed#,16#5aad#,16#5e8d#,16#666e#,16#6e4e#,16#762e#,
--        16#0ace#,16#12ed#,16#16ec#,16#1eeb#,16#26eb#,16#2f0b#,16#370b#,16#3f0b#,16#430b#,16#4b0b#,16#52cb#,16#5aab#,16#628b#,16#6a6b#,16#724c#,16#762c#,
--        16#0e6e#,16#128d#,16#1a8c#,16#1e8b#,16#26aa#,16#2ea9#,16#36a9#,16#3ea9#,16#42a9#,16#4aa9#,16#52a9#,16#5aa9#,16#6289#,16#6a6a#,16#724a#,16#724b#,
--        16#0dce#,16#11ad#,16#19cc#,16#1dcb#,16#25c9#,16#2de9#,16#35e9#,16#3de9#,16#41c9#,16#49e9#,16#51e9#,16#5de9#,16#61e9#,16#69e9#,16#6e0a#,16#720b#,
--        16#0dce#,16#11ad#,16#19ac#,16#218c#,16#256c#,16#2d2c#,16#350c#,16#3cec#,16#40ec#,16#48ec#,16#50ec#,16#58ec#,16#64ec#,16#68ed#,16#6d0e#,16#712f#,
--        16#0dee#,16#11cd#,16#198e#,16#216e#,16#294e#,16#2d2e#,16#390e#,16#3cee#,16#40ef#,16#48cf#,16#50cf#,16#58cf#,16#64cf#,16#6caf#,16#70d0#,16#70f1#,
--        16#09f0#,16#11d0#,16#19b0#,16#2170#,16#2950#,16#2d30#,16#3911#,16#3cf1#,16#40f1#,16#48b1#,16#50b1#,16#58b1#,16#60b1#,16#6cb1#,16#74d1#,16#74f2#,
--        16#09f2#,16#11d2#,16#19b2#,16#2193#,16#2573#,16#2d33#,16#3513#,16#3cf3#,16#40f3#,16#48d3#,16#50d3#,16#5cd3#,16#60d3#,16#68f3#,16#70f2#,16#7511#,
--        16#09f4#,16#0dd4#,16#15b5#,16#1d95#,16#2575#,16#2d55#,16#3515#,16#3d15#,16#4115#,16#4915#,16#5115#,16#5935#,16#6135#,16#6934#,16#6d33#,16#7552#
--   );
--	variable ypbpr0 : std_logic_vector(15 downto 0);
--	variable ypbpr1 : std_logic_vector(15 downto 0);
--	variable tmp_color : std_logic_vector(7 downto 0);
--	begin
--		if rising_edge(FO0) then
--			tmp_color := HUE & LUM0;
--			ypbpr0 := CSYNC & std_logic_vector(to_unsigned(ataripalette(to_integer(unsigned(tmp_color))), 15));			
--			tmp_color := HUE & LUM1;
--			ypbpr1 := CSYNC & std_logic_vector(to_unsigned(ataripalette(to_integer(unsigned(tmp_color))), 15));			
--		end if;
--		
--		if FO0='1' then
--			Y <= ypbpr0(15 downto 10);
--			Pb <= ypbpr0(9 downto 5);
--			Pr <= ypbpr0(4 downto 0);
--		else
--			Y <= ypbpr1(15 downto 10);
--			Pb <= ypbpr1(9 downto 5);
--			Pr <= ypbpr1(4 downto 0);
--		end if;
--	end process;
		
end immediate;

