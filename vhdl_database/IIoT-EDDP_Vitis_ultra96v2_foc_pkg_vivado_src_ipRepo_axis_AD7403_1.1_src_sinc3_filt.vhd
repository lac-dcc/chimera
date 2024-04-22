--------------------------------------------------------------------------------
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------------
entity sinc3_filt is
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
end sinc3_filt;
--------------------------------------------------------------------------------
architecture RTL of sinc3_filt is
--------------------------------------------------------------------------------
signal dec_cnt						: integer range 0 to C_DECIMATION-1;
signal lf_en						: STD_LOGIC := '0';
signal data_in						: STD_LOGIC := '0';
signal IA, IB, IC, K_cnt			: UNSIGNED(C_BUS_WIDTH-1 downto 0) := (others => '0');
signal PA, NA, PB, NB, PC, NC, PD	: UNSIGNED(C_BUS_WIDTH-1 downto 0) := (others => '0');
signal CNR_cnt						: UNSIGNED(C_BUS_WIDTH-1 downto 0) := (others => '1');
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
fab_imp_gen: if C_IMPLEMENTATION = 0 generate
	process(MCLK)
	begin
		if(MCLK = '1' and MCLK'event)then
			K_cnt			<= K_cnt + 1;
			if(dec_cnt = C_DECIMATION-1)then
				dec_cnt		<= 0;
				lf_en		<= '1';
			else
				lf_en		<= '0';
				dec_cnt		<= dec_cnt + 1;
			end if;
			
			if(dec_cnt = 0)then
				CNR_cnt		<= CNR_cnt + 1;
			end if;
		end if;
	end process;
	
	integrators: process(MCLK)
	begin
		if(MCLK = '1' and MCLK'event)then
			data_in			<= MDAT;	-- Input trigger
			if(data_in = '1')then
				IA			<= IA + 1;
			end if;
			IB				<= IB + IA;
			IC				<= IC + IB;
		end if;
	end process;
	
	differentiators: process(MCLK)
	begin
		if(MCLK = '1' and MCLK'event)then
			if(lf_en = '1')then
				PA			<= IC;	-- Decimation
				NA			<= PA;
				NB			<= PB;
				NC			<= PC;
				tdata		<= STD_LOGIC_VECTOR(PD);
				tvalid		<= '1';
			else
				tvalid		<= '0';
			end if;
		end if;
	end process;
	
	PB		<= PA - NA;
	PC		<= PB - NB;
	PD		<= PC - NC;
	
end generate;
-- Debug
K		<= STD_LOGIC_VECTOR(K_cnt);
Delta1	<= STD_LOGIC_VECTOR(IA);
CN1		<= STD_LOGIC_VECTOR(IB);
CN2		<= STD_LOGIC_VECTOR(IC);
CNR		<= STD_LOGIC_VECTOR(CNR_cnt);
DN0		<= STD_LOGIC_VECTOR(PA);
DN1		<= STD_LOGIC_VECTOR(NA);
CN3		<= STD_LOGIC_VECTOR(PB);
DN3		<= STD_LOGIC_VECTOR(NB);
CN4		<= STD_LOGIC_VECTOR(PC);
DN5		<= STD_LOGIC_VECTOR(NC);
CN5		<= STD_LOGIC_VECTOR(PD);
--------------------------------------------------------------------------------
end RTL;
