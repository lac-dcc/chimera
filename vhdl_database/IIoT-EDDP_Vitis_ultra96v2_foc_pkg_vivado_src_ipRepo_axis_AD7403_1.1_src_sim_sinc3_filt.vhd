--------------------------------------------------------------------------------
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

--------------------------------------------------------------------------------
entity sim_sinc3_filt is
--  Port ( );
end sim_sinc3_filt;
--------------------------------------------------------------------------------
architecture Behavioral of sim_sinc3_filt is
--------------------------------------------------------------------------------
function sinc3_bus_width(decimation_ratio : integer) return integer is
begin
	case decimation_ratio is
		when 4		=> return 7;
		when 8		=> return 10;
		when 16		=> return 13;
		when 32		=> return 16;
		when 64		=> return 19;
		when 128	=> return 22;
		when 256	=> return 25;
		when others	=> return 25;
	end case;
end function;
--------------------------------------------------------------------------------
constant mclk_period			: time := 50 ns;	-- 20 MHz

constant C_IMPLEMENTATION 		: integer range 0 to 1	:= 0; -- 0 - Logic only, 1 - DSP48, 2 - DSP48 optimized = not currently supported
constant C_CHANNELS				: integer	:= 1;
constant C_DECIMATION			: integer	:= 8;
constant C_BUS_WIDTH			: integer	:= sinc3_bus_width(C_DECIMATION);
constant C_M_AXIS_TDEST_WIDTH	: integer	:= 2;
constant C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
--------------------------------------------------------------------------------

component sinc3_filt is
generic (
	C_BUS_WIDTH				: integer	:= 16;
	C_IMPLEMENTATION 		: integer range 0 to 1	:= 0;
	C_DECIMATION			: integer	:= 32
);
port (
	-- Modulator signals
	MCLK					: in  STD_LOGIC;
	MDAT					: in  STD_LOGIC;
	-- Result
	tdata					: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	tvalid					: out STD_LOGIC;
	-- Debug
	K						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	Delta1					: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN1						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN2						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CNR						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN0						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN1						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN3						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN3						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN4						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	DN5						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
	CN5						: out STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0)
);
end component;

signal MCLK				: STD_LOGIC;
signal MDAT				: STD_LOGIC;
signal tdata			: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal tvalid			: STD_LOGIC;

-- Debug
signal K    			: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal Delta1			: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN1				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN2				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CNR				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN0				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN1				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN3				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN3				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN4				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal DN5				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
signal CN5				: STD_LOGIC_VECTOR(C_BUS_WIDTH-1 downto 0);
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
MCLKIN_generation: process 
begin  
	MCLK		<= '0';
	wait for mclk_period/2;
	MCLK		<= '1';
	wait for mclk_period/2;
end process;

UUT: sinc3_filt
generic map(
	C_BUS_WIDTH				=> C_BUS_WIDTH,
	C_IMPLEMENTATION 		=> C_IMPLEMENTATION,
	C_DECIMATION			=> C_DECIMATION
)
port map(
	-- Modulator signals
	MCLK					=> MCLK,
	MDAT					=> MDAT,
	-- Result
	tdata					=> tdata,
	tvalid					=> tvalid,
	-- Debug
	K                       => K,
	Delta1					=> Delta1,
	CN1						=> CN1, 
	CN2						=> CN2,
	CNR						=> CNR,
	DN0						=> DN0,
	DN1						=> DN1,
	CN3						=> CN3,
	DN3						=> DN3,
	CN4						=> CN4,
	DN5						=> DN5,
	CN5						=> CN5
);

testbench_clrl: process is
begin	
	MDAT					<= '0';
	wait for mclk_period;
	wait for mclk_period*2;
	MDAT					<= '1';
	wait;
end process  testbench_clrl;

report_clrl: process is
begin	
	wait for mclk_period;
	report "K    MOUT    Delta1    CN1    CN2    CNR    DN0    DN1    CN3    DN3    CN4    DN5    CN5" severity note;
	for i in 0 to 40 loop
		report 
			integer'image(TO_INTEGER(UNSIGNED(K))) & "    " &
			STD_LOGIC'image(MDAT) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(Delta1))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN1))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN2))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CNR))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN0))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN1))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN3))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN3))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN4))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(DN5))) & "    " &
			integer'image(TO_INTEGER(UNSIGNED(CN5)))
			severity note;
		wait for mclk_period;
	end loop;
	wait;
end process  report_clrl;

--------------------------------------------------------------------------------
end Behavioral;
