-- running on A-Video board Rev.2

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity AtariMod is	
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
		TDO : out std_logic  -- keep the pin working so JTAG is possible
	);	
end entity; 


architecture immediate of AtariMod is
	-- synchronous clock for most of the circuit
	signal CLK     : std_logic;   
	
	-- SDTV signals
	signal SDTV_Y   : std_logic_vector(5 downto 0);
	signal SDTV_Pb  : std_logic_vector(4 downto 0);
	signal SDTV_Pr  : std_logic_vector(4 downto 0);

	-- video memory control
	signal vramrdaddress0 : std_logic_vector (9 downto 0);
	signal vramrdaddress1 : std_logic_vector (9 downto 0);
	signal vramwraddress : std_logic_vector (9 downto 0);
	signal vramq0        : std_logic_vector (14 downto 0);
	signal vramq1        : std_logic_vector (14 downto 0);

	-- configuration for special palette
	signal HIGHCONTRAST : boolean;
	
   component GTIA2YPbPr is
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
	end component;

	component VideoRAM is
	port (
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (14 DOWNTO 0)
	);
	end component;
	
	component ClockMultiplier is
	port (
		CLK25: in std_logic;		
		F0O: in std_logic;
		CLK: out std_logic
	);	
	end component;
	
begin		
	multi: ClockMultiplier port map ( CLK25, not GPIO1(19), CLK );
	
	gtia: GTIA2YPbPr port map (
		SDTV_Y,
		SDTV_Pb,
		SDTV_Pr,
		CLK,
		NOT GPIO1(19),         -- F0O
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
		NOT (
		GPIO1(17 downto 17)    -- AN2
		& GPIO1(15)            -- AN1
		& GPIO1(13)),          -- AN0
		NOT GPIO1(16),			  -- RW
		NOT GPIO1(18),         -- CS
		NOT GPIO1(20), 		  -- HALT
		HIGHCONTRAST
	);	

	vram0: VideoRAM port map (
		CLK,
		SDTV_Y(4 downto 0) & SDTV_Pb & SDTV_Pr,
		vramrdaddress0,
		vramwraddress,
		'1',
		vramq0		
	);
	vram1: VideoRAM port map (
		CLK,
		SDTV_Y(4 downto 0) & SDTV_Pb & SDTV_Pr,
		vramrdaddress1,
		vramwraddress,
		'1',
		vramq1
	);
	
   --- drive the TDO pin to a known state
	process (TDI)
	begin
		TDO <= '1';
	end process;
	
	--------- transform the SDTV into a EDTV signal by line doubling (if selected by jumper)
	process (CLK,GPIO2_4,GPIO2_6) 
		variable hcnt : integer range 0 to 1023 := 0;
		variable vcnt : integer range 0 to 511 := 0;
		variable shortsyncs : integer range 0 to 3 := 0;
		
		variable val0 : integer range 0 to 63;
		variable val1 : integer range 0 to 63;
		variable usehighcontrast : boolean;
		variable usehighres : boolean; 
		variable usescanlines : boolean;
		
		constant cropstart : integer := 89;
		constant cropend : integer := cropstart+340;
	begin
		-- handle jumper configuration
		usehighcontrast := TDI='0' and (GPIO2_5='0' or GPIO2_6='0');
		usehighres := (GPIO2_4='0' or GPIO2_5='0' or GPIO2_6='0') and not usehighcontrast;
		usescanlines := (GPIO2_5='0' or GPIO2_6='0') and not usehighcontrast;
		HiGHCONTRAST <= usehighcontrast;
	
		if rising_edge(CLK) then
		
			-- generate EDTV output signal (with syncs and all)
			Y <= "100000";
			Pb <= "10000";
			Pr <= "10000";
			
			if vcnt<3 then			  -- 6 EDTV lines with sync	
				if hcnt<144*4-33 or (hcnt>=114*4 and hcnt<228*4-33) then  -- two EDTV vsyncs
					Y(5) <= '0';
				end if;
			else
				-- perfrom horizontal cropping in EDTV mode
				if (hcnt>=cropstart and hcnt<cropend) or (hcnt>=2*228+cropstart and hcnt<2*228+cropend) then
					-- get color from buffer
					Y <= "1" & vramq0(14 downto 10);
					Pb <= vramq0(9 downto 5);
					Pr <= vramq0(4 downto 0);
					 -- construct scanline darkening from both adjacent lines
					if hcnt>=2*228 and usescanlines then  
						val0 := to_integer(unsigned(vramq0(14 downto 10)));
						val1 := to_integer(unsigned(vramq1(14 downto 10)));					
						Y(4 downto 0) <= std_logic_vector(to_unsigned((val0+val1) / 4, 5));
						val0 := to_integer(unsigned(vramq0(9 downto 5)));
						val1 := to_integer(unsigned(vramq1(9 downto 5)));										
						Pb <= std_logic_vector(to_unsigned((val0+val1) / 4 + 8, 5));
						val0 := to_integer(unsigned(vramq0(4 downto 0)));
						val1 := to_integer(unsigned(vramq1(4 downto 0)));										
						Pr <= std_logic_vector(to_unsigned((val0+val1) / 4 + 8, 5));
					end if;				
				end if;
				-- two normal EDTV line syncs
				if hcnt<33 or (hcnt>=114*4 and hcnt<114*4+33) then  
					Y(5) <= '0';
				end if;
			end if;
			
			-- look for short sync pulses at start of line (to know when next frame starts)
			if hcnt=48 then   -- here only on a short sync line, the sync is already off
				if SDTV_Y(5)='1' and shortsyncs<3 then
					shortsyncs := shortsyncs+1;
				else
					shortsyncs := 0;
				end if;
			end if;
			
			-- progress counters and detect sync
			if SDTV_Y(5)='0' and hcnt>4*220 then
				hcnt := 0;
				if shortsyncs=2 and vcnt>100 then 
					vcnt := 0;
				elsif vcnt<511 then
					vcnt := vcnt+1;
				end if;
			elsif hcnt<1023 then
				hcnt := hcnt+1;
			end if;
	
	
			-- if selected, fall back to plain SDTV
			if not usehighres then
				Y  <= SDTV_Y;
				Pb <= SDTV_Pb;
				Pr <= SDTV_Pr;
			end if;
		end if;
		
		-- compute VideoRAM write position (write in buffer one line ahead)
		vramwraddress <= std_logic_vector(to_unsigned(hcnt/2 - 2 + ((vcnt+1) mod 2)*512, 10));
		-- compute VideoRAM read positions to fetch two adjacent lines
		if hcnt<228*2 then
			vramrdaddress0 <= std_logic_vector(to_unsigned(hcnt + (vcnt mod 2)*512, 10));
			vramrdaddress1 <= std_logic_vector(to_unsigned(hcnt + ((vcnt+1) mod 2)*512, 10));
		else
			vramrdaddress0 <= std_logic_vector(to_unsigned(hcnt-228*2 + (vcnt mod 2)*512, 10));
			vramrdaddress1 <= std_logic_vector(to_unsigned(hcnt-228*2 + ((vcnt+1) mod 2)*512, 10));
		end if;
		
	end process;
	

end immediate;

