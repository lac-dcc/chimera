library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MFPtimer is
generic(
		SCFREQ		:integer	:=20000		--kHz
);
port(
	rdat	:out std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	doe		:out std_logic;
	INTA	:out std_logic;
	INTB	:out std_logic;
	INTC	:out std_logic;
	INTD	:out std_logic;

	TACRRD	:in std_logic;
	TACRWR	:in std_logic;
	TBCRRD	:in std_logic;
	TBCRWR	:in std_logic;
	TCDCRRD	:in std_logic;
	TCDCRWR	:in std_logic;
	TADRRD	:in std_logic;
	TADRWR	:in std_logic;
	TBDRRD	:in std_logic;
	TBDRWR	:in std_logic;
	TCDRRD	:in std_logic;
	TCDRWR	:in std_logic;
	TDDRRD	:in std_logic;
	TDDRWR	:in std_logic;

	TAI		:in std_logic;
	TAE		:in std_logic;
	TAO		:out std_logic;

	TBI		:in std_logic;
	TBE		:in std_logic;
	TBO		:out std_logic;

	TCO		:out std_logic;

	TDO		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end MFPtimer;

architecture rtl of  MFPtimer is
signal	modeA	:std_logic_vector(3 downto 0);
signal	modeB	:std_logic_vector(3 downto 0);
signal	modeC	:std_logic_vector(3 downto 0);
signal	modeD	:std_logic_vector(3 downto 0);
signal	TOA		:std_logic;
signal	TOB		:std_logic;
signal	TOC		:std_logic;
signal	TOD		:std_logic;
signal	INTAb	:std_logic;
signal	INTBb	:std_logic;
signal	INTCb	:std_logic;
signal	INTDb	:std_logic;
signal	TADR	:std_logic_vector(7 downto 0);
signal	TBDR	:std_logic_vector(7 downto 0);
signal	TCDR	:std_logic_vector(7 downto 0);
signal	TDDR	:std_logic_vector(7 downto 0);

component MFPtimerS
generic(
	SCFREQ		:integer	:=20000		--kHz
);
port(
	mode	:in std_logic_vector(3 downto 0);
	wdat	:in std_logic_vector(7 downto 0);
	rdat	:out std_logic_vector(7 downto 0);
	wr		:in std_logic;
	TI		:in std_logic;
	INT		:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

begin

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				modeA<=(others=>'0');
				modeB<=(others=>'0');
				modeC<=(others=>'0');
				modeD<=(others=>'0');
			elsif(ce = '1')then
				if(TACRWR='1')then
					modeA<=wdat(3 downto 0);
				end if;
				if(TBCRWR='1')then
					modeB<=wdat(3 downto 0);
				end if;
				if(TCDCRWR='1')then
					modeC<='0' & wdat(6 downto 4);
					modeD<='0' & wdat(2 downto 0);
				end if;
			end if;
		end if;
	end process;

	TA	:MFPtimerS generic map(SCFREQ) port map(modeA,wdat,TADR,TADRWR,TAI,INTAb,clk,ce,rstn);
	TB	:MFPtimerS generic map(SCFREQ) port map(modeB,wdat,TBDR,TBDRWR,TBI,INTBb,clk,ce,rstn);
	TC	:MFPtimerS generic map(SCFREQ) port map(modeC,wdat,TCDR,TCDRWR,'0',INTCb,clk,ce,rstn);
	TD	:MFPtimerS generic map(SCFREQ) port map(modeD,wdat,TDDR,TDDRWR,'0',INTDb,clk,ce,rstn);

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				TOA<='0';
			elsif(ce = '1')then
				if(TACRWR='1')then
					if(wdat(4)='1')then
						TOA<='0';
					end if;
				elsif(INTAb='1')then
					TOA<=not TOA;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				TOB<='0';
			elsif(ce = '1')then
				if(TBCRWR='1')then
					if(wdat(4)='1')then
						TOB<='0';
					end if;
				elsif(INTAb='1')then
					TOB<=not TOB;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				TOC<='0';
			elsif(ce = '1')then
				if(INTCb='1')then
					TOC<=not TOC;
				end if;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				TOD<='0';
			elsif(ce = '1')then
				if(INTDb='1')then
					TOD<=not TOD;
				end if;
			end if;
		end if;
	end process;

	TAO<=TOA;
	TBO<=TOB;
	TCO<=TOC;
	TDO<=TOD;

	INTA<=INTAb;
	INTB<=INTBb;
	INTC<=INTCb;
	INTD<=INTDb;

	rdat<=	"0000" & modeA when TACRRD='1' else
			"0000" & modeB when TBCRRD='1' else
			modeC & modeD when TCDCRRD='1' else
			TADR when TADRRD='1' else
			TBDR when TBDRRD='1' else
			TCDR when TCDRRD='1' else
			TDDR when TDDRRD='1' else
			x"00";

	doe<=	'1' when TACRRD='1' else
			'1' when TBCRRD='1' else
			'1' when TCDCRRD='1' else
			'1' when TADRRD='1' else
			'1' when TBDRRD='1' else
			'1' when TCDRRD='1' else
			'1' when TDDRRD='1' else
			'0';

end rtl;