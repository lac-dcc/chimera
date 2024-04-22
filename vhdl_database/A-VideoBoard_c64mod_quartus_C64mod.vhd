library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.VICTypes.all;

entity C64Mod is	
	generic
	(
		lumacode: boolean := false
	); 
	port (
		-- reference clock
		CLK25:  in std_logic;

		-- digital YPbPr output
		Y: out std_logic_vector(5 downto 0);
		Pb: out std_logic_vector(4 downto 0);
		Pr: out std_logic_vector(4 downto 0);

		-- sniffing VIC-II pins comming to the GPIO1
		GPIO1: in std_logic_vector(20 downto 1);	
		
		-- read output mode settings 
		GPIO2_4: in std_logic;
		GPIO2_5: in std_logic;
		GPIO2_6: in std_logic;
		
		-- multi-purpose use for the JTAG signals (a bit dangerous, but should work)
		TMS : in std_logic;   -- external jumper to support the 6567R56A
		TCK : in std_logic;   -- keep the pin working so JTAG is possible
		TDI : in std_logic;   -- external jumper to force high-contrast palette 
		TDO : out std_logic;  -- keep the pin working so JTAG is possible
		
		-- pixel clock output to drive the VIC if necessary
		AUXPIXELCLOCK : out std_logic
	);	
end entity;


architecture immediate of C64Mod is
	signal PAL     : std_logic;         -- 0=NTSC, 1=PAL (detected by frequency)
	signal CLK     : std_logic;         -- 16 times CPU clock
	signal VICType : t_VICType;         -- Type if VIC as determined by frequency and jumpers
	
	-- SDTV signals
	signal ODDLINE : std_logic;
	signal COLOR : std_logic_vector(3 downto 0);
	signal DELAYEDCOLOR  : std_logic_vector(3 downto 0);	
	signal CSYNC   : std_logic;
	signal YPBPR   : std_logic_vector(15 downto 0);

	-- video memory control
	signal vramrdaddress0 : std_logic_vector (9 downto 0);
	signal vramrdaddress1 : std_logic_vector (9 downto 0);
	signal vramwraddress : std_logic_vector (9 downto 0);
	signal vramq0        : std_logic_vector (14 downto 0);
	signal vramq1        : std_logic_vector (14 downto 0);
	
	-- color delay line addressing
	signal delayrdaddress : std_logic_vector(10 downto 0);
	signal delaywraddress : std_logic_vector(10 downto 0);	
	
	-- signals to change user settings
	signal settings_writeaddr : std_logic_vector(5 downto 0) := "000000";
	signal settings_writedata : std_logic_vector(7 downto 0) := "00000000";
	signal settings_writeen : std_logic := '0';
	
   component ClockMultiplier is
	port (
		-- reference clock
		CLK25: in std_logic;		
		-- C64 cpu clock
		PHI0: in std_logic;
		-- 0: use input frequency for NTSC
		-- 1: use input frequency for PAL
		PAL: in std_logic;
		
		-- x16 times output clock
		CLK: out std_logic;
		
		-- auxilary pixel clock
		AUXPIXELCLOCK : out std_logic
	);	
	end component;
	
   component VIC2Emulation is
	port (
		-- standard definition color output
		COLOR: out std_logic_vector(3 downto 0);
		CSYNC: out std_logic;
		
		-- synchronous clock and phase of the c64 clock cylce
		CLK         : in std_logic;
		
		-- Connections to the real GTIAs pins 
		PHI0        : in std_logic;
		DB          : in std_logic_vector(11 downto 0);
		A           : in std_logic_vector(5 downto 0);
		RW          : in std_logic; 
		CS          : in std_logic; 
		AEC         : in std_logic;
		
		-- selector to choose VIC variant
		VICType : in t_VICType									 
	);	
	end component;
	
	
	component ram_dual is
	generic
	(
		data_width : integer := 8;
		addr_width : integer := 16
	); 
	port 
	(
		data	: in std_logic_vector(data_width-1 downto 0);
		raddr	: in std_logic_vector(addr_width-1 downto 0);
		waddr	: in std_logic_vector(addr_width-1 downto 0);
		we		: in std_logic := '1';
		rclk	: in std_logic;
		wclk	: in std_logic;
		q		: out std_logic_vector(data_width-1 downto 0)
	);	
	end component;

	component Settings is
	port (
		-- reference clock
		CLK: in std_logic;		
		
		-- get notified when CPU writes into the registers
		WRITEADDR : in std_logic_vector(5 downto 0);
		WRITEDATA : in std_logic_vector(7 downto 0);
		WRITEEN : in std_logic;
		
		-- color palette conversion
		QUERYREGISTER : in std_logic_vector(8 downto 0);
		REGISTERDATA : out std_logic_vector(15 downto 0)
	);	
	end component;
	
	
begin		
	clkmulti: ClockMultiplier port map ( CLK25, GPIO1(20), PAL, CLK, AUXPIXELCLOCK );
	
	vic: VIC2Emulation port map (
		COLOR,
		CSYNC,
		CLK,
		GPIO1(20),                                   -- PHI0		
		GPIO1(9 downto 9) & GPIO1(10) & GPIO1(11) & GPIO1(12)   
		& GPIO1(1) & GPIO1(2) & GPIO1(3) & GPIO1(4)
		& GPIO1(5) & GPIO1(6) & GPIO1(7) & GPIO1(8), -- DB		
	   GPIO1(9 downto 9) & GPIO1(10) & GPIO1(11)  & GPIO1(12)
		& GPIO1(13) & GPIO1(14),                     -- A
		GPIO1(16),                                   -- RW 
		GPIO1(15),                                   -- CS 
		GPIO1(18),                                   -- AEC
		VICType
	);	 

	vram0: ram_dual generic map(data_width => 15, addr_width => 10)
		port map (
			YPBPR(14 downto 0),
			vramrdaddress0,
			vramwraddress,
			'1',
			CLK,
			CLK,
			vramq0		
		);
	vram1: ram_dual generic map(data_width => 15, addr_width => 10)
		port map (
			YPBPR(14 downto 0),
			vramrdaddress1,
			vramwraddress,
			'1',
			CLK,
			CLK,
			vramq1		
		);
		
	settings0: Settings 
		port map(
			CLK,
			settings_writeaddr,
			settings_writedata,
			settings_writeen,
			ODDLINE & COLOR & DELAYEDCOLOR,
			YPBPR
		);
	
	colordelayline : ram_dual generic map(data_width => 4, addr_width => 11)
		port map (
			COLOR,
			delayrdaddress,
			delaywraddress,
			'1',
			CLK,
			CLK,
			DELAYEDCOLOR		
		);
	
		

	--------- measure CPU frequency and detect if it is a PAL or NTSC machine -------
	--------- also check what the TMS input is doing in general and infer the VIC type 
	process (CLK25, GPIO1, TMS)
		variable in_phi0 : std_logic_vector(3 downto 0);
		variable out_pal : std_logic := '1';
		variable out_victype : t_VICType := CLOCKS63;
		variable countcpu : integer range 0 to 2000 := 0;
		variable countclk25 : integer range 0 to 25000 := 0;
		variable tms_waslow : boolean := false;
		variable tms_washigh : boolean := false;
	begin
		if rising_edge(CLK25) then
			if countclk25/=24999 then
				-- measure clock and TMS for 1 ms to figure out the environment
				countclk25 := countclk25+1;
				if in_phi0="0011" then
					countcpu := countcpu+1;
				end if;
				if TMS='0' then
					tms_waslow := true;
				else
					tms_washigh := true;
				end if;
			else
				-- decide which mode to operate in
				if tms_washigh and tms_waslow then   -- detected toggling TMS: force standard NTSC
					out_pal := '0';
					out_victype := CLOCKS65;
				elsif tms_waslow then                -- permanently low TMS: force to 656756A 
					out_pal := '0';
					out_victype := CLOCKS64;				
				elsif countcpu>=1004 then            -- detected fast CPU clock: standard NTSC				
					out_pal := '0';
					out_victype := CLOCKS65;
				else 
					out_pal := '1';                   -- detected slow CPU cloc: PAL
					out_victype := CLOCKS63;
				end if;
				countclk25 := 0;			
				countcpu := 0;
				tms_waslow := false;
				tms_washigh := false;
			end if;
			in_phi0 := in_phi0(2 downto 0) & GPIO1(20);
		end if;
		PAL <= out_pal;
		VICType <= out_victype;
	end process;
	
	
	--- control the read and write address of the color delay line
	process (CLK, PAL)
	variable p : integer range 0 to 2047;
	begin
		if rising_edge(CLK) then
			p := p+1;		
			case VICType is
			when CLOCKS63 => delaywraddress <= std_logic_vector(to_unsigned(p+1007,11));	
			when CLOCKS64 => delaywraddress <= std_logic_vector(to_unsigned(p+1023,11));	
			when CLOCKS65 => delaywraddress <= std_logic_vector(to_unsigned(p+1039,11));
			end case;
		end if;
		delayrdaddress <= std_logic_vector(to_unsigned(p,11));
	end process;
	
	--------- transform the SDTV into a EDTV signal by line doubling (if selected by jumper) 
	process (CLK) 
		variable hcnt : integer range 0 to 2047 := 0;
		variable vcnt : integer range 0 to 511 := 0;
		variable needvsync : boolean := false;
		
		variable val0 : integer range 0 to 31;
		variable val1 : integer range 0 to 31;
		variable usehighres : boolean; 
		variable usescanlines : boolean;
		variable usehighcontrast : boolean;
		variable lpixel : integer range 0 to 2047;
		variable prevcol : integer range 0 to 15;
		variable lum: integer range 0 to 3;
		variable lum1: integer range 0 to 3;
		
		type T_lumadjustment is array (0 to 31) of integer range 0 to 31;
		constant scanlineboost : T_lumadjustment := 
		(	 0,  1,  2, 4,  5,  6,  8,  9,  10, 11, 13, 14, 15, 17, 18, 20, 
			21, 22, 23, 24, 25, 26, 27, 28, 28, 29, 29, 30, 30, 31, 31, 31
		);	
		constant scanlinedarken : T_lumadjustment := 
		(	 0,  1,  2, 3,  3,  4,  4,  5,  5,  6,   6,  7,  8,  9,  9, 10, 
			11, 12, 13, 14, 15, 16, 17, 18, 19, 19, 20, 21, 23, 25, 26, 27
		);			                           -- W+C     W+Y

	begin
	
		if rising_edge(CLK) then
			-- jumper configuration
			usehighcontrast := TDI='0' and (GPIO2_5='0' or GPIO2_6='0');
			usehighres := (GPIO2_4='0' or GPIO2_5='0' or GPIO2_6='0') and not usehighcontrast;
			usescanlines := (GPIO2_5='0' or GPIO2_6='0') and not usehighcontrast;
			
			-- determine hsync position
			case VICType is
			when CLOCKS63 => lpixel := 504;
			when CLOCKS64 => lpixel := 512;
			when CLOCKS65 => lpixel := 520;			
			end case;
		
			-- if highres is not selected, just use plain SDTV
			if not usehighres then
				if CSYNC='0' then	
					Y(5) <= YPBPR(15);  -- suppress sync signal when set to '1'
				else 
					Y(5) <= '1'; 
				end if; 
				Y(4 downto 0) <= YPBPR(14 downto 10);
				Pb <= YPBPR(9 downto 5);
				Pr <= YPBPR(4 downto 0);
				
				-- override palette usage to force high-contrast or lumacode
				if usehighcontrast then 
					if lumacode then
						case prevcol is  
						when  0 => lum:=0; lum1:=0; -- black
						when  6 => lum:=0; lum1:=1; -- blue
						when  2 => lum:=0; lum1:=2; -- red
						when  4 => lum:=0; lum1:=3; -- purple
						when  9 => lum:=1; lum1:=0; -- brown
						when 11 => lum:=1; lum1:=1; -- dark gray
						when 12 => lum:=1; lum1:=2; -- medium gray
						when 3  => lum:=1; lum1:=3; -- cyan
						when 8  => lum:=2; lum1:=0; -- orange
						when 14 => lum:=2; lum1:=1; -- light blue
						when 15 => lum:=2; lum1:=2; -- light gray
						when 7  => lum:=2; lum1:=3; -- yellow
						when 5  => lum:=3; lum1:=0; -- green
						when 10 => lum:=3; lum1:=1; -- ligh red
						when 13 => lum:=3; lum1:=2; -- light green
						when 1  => lum:=3; lum1:=3; -- white					
						end case;
						if hcnt mod 2 = 1 then
							lum := lum1;
						end if;
						case lum is
						when 0 => Y <= std_logic_vector(to_unsigned((8), 6));   
						when 1 => Y <= std_logic_vector(to_unsigned((37), 6));  
						when 2 => Y <= std_logic_vector(to_unsigned((48), 6));   
						when 3 => Y <= std_logic_vector(to_unsigned((58), 6));
						end case;
						Pb<="00000";
						Pr<="00000";
						if CSYNC='0' then Y <= "000000"; end if;
					else
						case prevcol is  
						when 0 =>  Y(4 downto 0)<="00000"; Pb<="10000"; Pr<="10000";  -- black
						when 6 =>  Y(4 downto 0)<="00000"; Pb<="11111"; Pr<="10000";  -- blue
						when 9 =>  Y(4 downto 0)<="00000"; Pb<="00000"; Pr<="10000";  -- brown
						when 2 =>  Y(4 downto 0)<="00000"; Pb<="10000"; Pr<="11111";  -- red
						when 11 => Y(4 downto 0)<="00000"; Pb<="10000"; Pr<="00000";  -- d.gray
						when 4 =>  Y(4 downto 0)<="10000"; Pb<="11111"; Pr<="11111";  -- purple
						when 8 =>  Y(4 downto 0)<="10000"; Pb<="00000"; Pr<="11111";  -- orange
						when 12 => Y(4 downto 0)<="10000"; Pb<="10000"; Pr<="10000";  -- m.gray
						when 14 => Y(4 downto 0)<="10000"; Pb<="11111"; Pr<="10000";  -- l.blue
						when 5 =>  Y(4 downto 0)<="10000"; Pb<="00000"; Pr<="00000";  -- green
						when 10 => Y(4 downto 0)<="10000"; Pb<="10000"; Pr<="11111";  -- l.red
						when 3 =>  Y(4 downto 0)<="11111"; Pb<="11111"; Pr<="00000";  -- cyan
						when 15 => Y(4 downto 0)<="11111"; Pb<="10000"; Pr<="00000";  -- l.gray					
						when 7 =>  Y(4 downto 0)<="11111"; Pb<="00000"; Pr<="10000";  -- yellow
						when 13 => Y(4 downto 0)<="11111"; Pb<="00000"; Pr<="00000";  -- l.green
						when 1 =>  Y(4 downto 0)<="11111"; Pb<="10000"; Pr<="10000";  -- white
						end case;
						Y(5) <= CSYNC;
					end if;
				end if;
				
			-- generate EDTV output signal (with syncs and all)
			else 
				-- 3 EDTV lines with vsync	
				if vcnt=0 or (vcnt=1 and hcnt<lpixel) then	  
					if (hcnt<lpixel-37) or (hcnt>=lpixel and hcnt<2*lpixel-37) then
						Y(5) <= '0';
					else
						Y(5) <= '1';				
					end if;
					Pb <= "00000";
					Pr <= "00000";			
				-- normal EDTV lines with line syncs
				else
					-- compute the sync signals
					if hcnt<37 or (hcnt>=lpixel and hcnt<lpixel+37) then  
						Y(5) <= '0';
					else
						Y(5) <= '1';
					end if;
				
					-- use scanline effect
					if usescanlines then
						-- construct bright line
						if hcnt<lpixel then
							val0 := to_integer(unsigned(vramq0(14 downto 10)));
							val0 := scanlineboost(val0);
							Y(4 downto 0) <= std_logic_vector(to_unsigned((val0), 5));
							Pb <= vramq0(9 downto 5);
							Pr <= vramq0(4 downto 0);
						-- construct scanline darkening from both adjacent lines
						else  
							val0 := to_integer(unsigned(vramq0(14 downto 10)));
							val1 := to_integer(unsigned(vramq1(14 downto 10)));
							val0 := scanlinedarken((val0+val1)/2);
							Y(4 downto 0) <= std_logic_vector(to_unsigned((val0), 5));
							val0 := to_integer(unsigned(vramq0(9 downto 5)));
							val1 := to_integer(unsigned(vramq1(9 downto 5)));								
							Pb <= std_logic_vector(to_unsigned((val0+val1) / 2, 5));
							val0 := to_integer(unsigned(vramq0(4 downto 0)));
							val1 := to_integer(unsigned(vramq1(4 downto 0)));						
							Pr <= std_logic_vector(to_unsigned((val0+val1) / 2, 5));
						end if;
					-- normal scanline color
					else
						Y(4 downto 0) <= vramq0(14 downto 10);
						Pb <= vramq0(9 downto 5);
						Pr <= vramq0(4 downto 0);
					end if;	
					
				end if;
			end if;
			
			-- progress counters and detect sync
			if CSYNC='0' and hcnt>1004 then
				hcnt := 0;
				if needvsync then 
					vcnt := 0;
					needvsync := false;
				elsif vcnt<511 then
					vcnt := vcnt+1;
				end if;
				if vcnt mod 2 = 0 then
					ODDLINE <= '0';
				else
					ODDLINE <= '1';
				end if;
			elsif hcnt<2047 then
				-- a sync in the middle of a scanline: starts the vsync sequence
				if hcnt=200 and CSYNC='0' and vcnt>50 then
					needvsync := true;
				end if;
				hcnt := hcnt+1;
			end if;
			
			-- memorize color for the case to bypass the palette subsystem
			prevcol := to_integer(unsigned(COLOR));
			
		end if;
		
		-- compute VideoRAM write position (write in buffer one line ahead)
		vramwraddress <= std_logic_vector(to_unsigned(hcnt/2 + ((vcnt+1) mod 2)*512, 10));
		-- compute VideoRAM read positions to fetch two adjacent lines
		if hcnt<lpixel then
			vramrdaddress0 <= std_logic_vector(to_unsigned(hcnt + (vcnt mod 2)*512, 10));
			vramrdaddress1 <= std_logic_vector(to_unsigned(hcnt + ((vcnt+1) mod 2)*512, 10));
		else
			vramrdaddress0 <= std_logic_vector(to_unsigned(hcnt-lpixel + (vcnt mod 2)*512, 10));
			vramrdaddress1 <= std_logic_vector(to_unsigned(hcnt-lpixel + ((vcnt+1) mod 2)*512, 10));
		end if;
		
	end process;
		

	------- listen to CPU activity and forward register change to Settings
	process (CLK) 
	
	-- monitor the CPU actions
	variable phase: integer range 0 to 15 := 0;
	variable in_phi0: std_logic; 
	variable in_db: std_logic_vector(7 downto 0);
	variable in_a:  std_logic_vector(5 downto 0);
	variable in_rw: std_logic; 
	variable in_cs: std_logic; 
	variable in_aec: std_logic; 
	
	variable modeswitch : std_logic_vector(2 downto 0);
	variable prevmodeswitch : std_logic_vector(2 downto 0);
	
	variable writeaddr : std_logic_vector(5 downto 0);
	variable unlocked1 : boolean := false;
	variable unlocked2 : boolean := false;
	
	begin
		-- monitor when the CPU writes into registers and forward info to the settings manager
		if rising_edge(CLK) then

			settings_writeen <= '0';
			settings_writeaddr <= writeaddr;
			settings_writedata <= in_db;
			
			-- attempt to write into register
			if phase=11 then
				writeaddr := in_a;
			end if;
			if phase=14 and in_aec='1' and in_cs='0' and in_rw='0' then
				-- unlock step 1: write 137 to register 63
				if not unlocked1 then
					if in_db="10001001" and writeaddr="111111" then   -- magic number 137
						unlocked1 := true;
					end if;
				-- everything unlocked - send to settings manager
				elsif unlocked2 then
					settings_writeen <= '1';
				end if;
			end if;
			
			-- progress the phase
			if (phase=15 or phase=0 or phase=1) and in_phi0='0' then
				phase:=2;
			elsif phase/=1 then
				phase:=phase+1;
			end if;			

			-- unlock step 2: change the mode switch
			if unlocked1 and modeswitch /= prevmodeswitch then
				unlocked2 := true;
			end if;
			
			-- take signals into registers
			in_phi0 := GPIO1(20);
			in_db :=   GPIO1(1) & GPIO1(2) & GPIO1(3) & GPIO1(4)
						& GPIO1(5) & GPIO1(6) & GPIO1(7) & GPIO1(8);
			in_a := GPIO1(9 downto 9) & GPIO1(10) & GPIO1(11)  & GPIO1(12)
					& GPIO1(13) & GPIO1(14);
			in_rw := GPIO1(16); 
			in_cs := GPIO1(15); 
			in_aec := GPIO1(18);		
			prevmodeswitch := modeswitch;
			modeswitch := GPIO2_4 & GPIO2_5 & GPIO2_6;
		end if;	
	end process;
		
end immediate;

