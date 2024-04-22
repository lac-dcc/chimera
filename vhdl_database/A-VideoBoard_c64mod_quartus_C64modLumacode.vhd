library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.VICTypes.all;

entity C64ModLumacode is	
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


architecture immediate of C64ModLumacode is
   component C64Mod is
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
	end component;	
	
begin		
	c64: C64Mod generic map(lumacode => true)
	port map (
		CLK25,
		Y,
		Pb,
		Pr,
		GPIO1,
		GPIO2_4,
		GPIO2_5,
		GPIO2_6,
		TMS,
		TCK,
		TDI,
		TDO,
		AUXPIXELCLOCK
	);	 		
end immediate;

