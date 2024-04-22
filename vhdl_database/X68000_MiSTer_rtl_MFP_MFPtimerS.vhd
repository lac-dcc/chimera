library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MFPtimerS is
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
end MFPtimerS;

architecture rtl of MFPtimerS is
constant MAXpres	:integer	:=SCFREQ*200/4000;
signal	prescale:integer range 0 to MAXpres;
signal	counter	:std_logic_vector(7 downto 0);
signal	rvalue	:std_logic_vector(7 downto 0);
signal	lTI,sTI		:std_logic;
signal	sft			:std_logic;
signal	psclk		:std_logic;
signal	redge,fedge	:std_logic;
signal	state		:std_logic;
signal	pmode,lpmode:std_logic;
signal	pmbgn		:std_logic;

component sftgen
generic(
	maxlen	:integer	:=100
);
port(
	len		:in integer range 0 to maxlen;
	sft		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;
			
begin
	prescale<=
		SCFREQ*200/4000 when mode(2 downto 0)="111" else
		SCFREQ*100/4000 when mode(2 downto 0)="110" else
		SCFREQ* 64/4000 when mode(2 downto 0)="101" else
		SCFREQ* 50/4000 when mode(2 downto 0)="100" else
		SCFREQ* 16/4000 when mode(2 downto 0)="011" else
		SCFREQ* 10/4000 when mode(2 downto 0)="010" else
		SCFREQ*  4/4000 when mode(2 downto 0)="001" else
		0;

	prescaler:sftgen generic map(MAXpres)port map(prescale,psclk,clk,ce,rstn);
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				lTI<='0';
				sTI<='0';
			elsif(ce = '1')then
				sTI<=TI;
				lTI<=sTI;
			end if;
		end if;
	end process;
	redge<='1' when sTI='1' and lTI='0' else '0';
	fedge<='1' when sTI='0' and lTI='1' else '0';
	
	sft<=psclk when mode(2 downto 0)/="000" else redge when mode(3)='1' else '0';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				rvalue<=(others=>'0');
			elsif(ce = '1')then
				if(wr='1')then
					rvalue<=wdat;
				end if;
			end if;
		end if;
	end process;
	
	pmode<='1'  when mode(3)='1' and mode(2 downto 0)/="000" else '0';
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				lpmode<='0';
			elsif(ce = '1')then
				lpmode<=pmode;
			end if;
		end if;
	end process;
	pmbgn<='1' when pmode='1' and lpmode='0' else '0';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				counter<=(others=>'0');
				state<='0';
				INT<='0';
			elsif(ce = '1')then
				INT<='0';
				if(pmbgn='1')then
					counter<=rvalue;
					state<='0';
				end if;
				if(wr='1')then
					counter<=wdat;
				elsif(mode/="0000")then
					if(pmode='1')then
						if(state='0')then
							if(redge='1')then
								state<='1';
								counter<=rvalue;
							end if;
						else
							if(fedge='1')then
								state<='0';
								INT<='1';
							end if;
						end if;
					end if;
					if(sft='1')then
						if(pmode='1' and state='0')then
						else
							if(counter=x"01")then
								INT<='1';
	--							counter<=counter-x"01";
	--						elsif(counter=x"00")then
								counter<=rvalue;
							else
								counter<=counter-x"01";
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	rdat<=counter;
end rtl;

			
