LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fmdem is
generic(
	bwidth	:integer	:=22
);
port(
	bitlen	:in integer range 0 to bwidth;
	
	datin	:in std_logic;
	
	init	:in std_logic;
	break	:in std_logic;
	
	RXDAT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;
	DetMF8	:out std_logic;
	DetMFB	:out std_logic;
	DetMFC	:out std_logic;
	DetMFE	:out std_logic;
	broken	:out std_logic;
	
	curlen	:out integer range 0 to bwidth*2;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end fmdem;

architecture rtl of fmdem is
signal	fmsync		:std_logic;
signal	datsft		:std_logic_vector(15 downto 0);
signal	lencount	:integer range 0 to bwidth*2;
signal	curwidth	:integer range 0 to bwidth*2;
signal	dpulse		:std_logic;
signal	ldatin		:std_logic_vector(3 downto 0);
signal	nodat		:std_logic;
signal	datum		:std_logic;
signal	sft			:std_logic;
signal	lsft		:std_logic;
signal	daterr		:std_logic;
signal	charcount	:integer range 0 to 15;
constant chksync	:integer :=20;
signal	synccount	:integer range 0 to chksync-1;

begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				ldatin<=(others=>'1');
				dpulse<='0';
			elsif(ce = '1')then
				dpulse<='0';
				if(break='1' or init='1')then
					ldatin<=(others=>'0');
				elsif(ldatin="1100")then
					dpulse<='1';
				end if;
				ldatin<=ldatin(2 downto 0) & datin;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				nodat<='1';
				lencount<=0;
				curwidth<=bwidth;
				datum<='0';
				sft<='0';
				synccount<=chksync-1;
			elsif(ce = '1')then
				sft<='0';
				if(init='1' or daterr='1')then
					nodat<='1';
					curwidth<=bitlen;
					synccount<=chksync-1;
				elsif(break='1')then
					nodat<='1';
				elsif(nodat='1')then
					if(dpulse='1')then
						lencount<=0;
						nodat<='0';
					end if;
				else
					if(dpulse='1')then
						if(synccount>0)then
							synccount<=synccount-1;
						else
							datum<='1';
							sft<='1';
						end if;
						--pulse width feedback
						if(lencount>curwidth)then
							if(curwidth<(bitlen+(bitlen/2)))then
								curwidth<=curwidth+1;
							end if;
						else
							if(curwidth>(bitlen/2))then
								curwidth<=curwidth-1;
							end if;
						end if;
						lencount<=0;
					else
						if(lencount=(curwidth+(curwidth/2)))then
							if(synccount=0)then
								datum<='0';
								sft<='1';
							end if;
							lencount<=(curwidth/2)+1;
						else
							lencount<=lencount+1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

	curlen<=curwidth;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				datsft<=(others=>'0');
				lsft<='0';
			elsif(ce = '1')then
				if(break='1')then
					datsft<=(others=>'0');
				elsif(sft='1')then
					datsft<=datsft(14 downto 0) & datum;
				end if;
				lsft<=sft;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				RXDAT<=(others=>'0');
				RXED<='0';
				DetMF8<='0';
				DetMFB<='0';
				DetMFC<='0';
				DetMFE<='0';
				fmsync<='0';
				charcount<=0;
				daterr<='0';
			elsif(ce = '1')then
				RXED<='0';
				DetMF8<='0';
				DetMFB<='0';
				DetMFC<='0';
				DetMFE<='0';
				daterr<='0';
				if(break='1' or init='1')then
					fmsync<='0';
					charcount<=0;
				elsif(lsft='1')then
					if(datsft="1111010101101010")then
						fmsync<='1';
						charcount<=0;
						DetMF8<='1';
					elsif(datsft="1111010101101111")then
						fmsync<='1';
						charcount<=0;
						DetMFB<='1';
					elsif(datsft="1111011101111010")then
						fmsync<='1';
						charcount<=0;
						DetMFC<='1';
					elsif(datsft="1111010101111110")then
						fmsync<='1';
						charcount<=0;
						DetMFE<='1';
					elsif(datsft(2 downto 0)="100")then
						fmsync<='0';	--
						charcount<=0;	--
						daterr<='1';
					elsif((charcount mod 2)=0 and datsft(0)='0')then
						fmsync<='0';
						charcount<=0;
						daterr<='1';
					elsif(fmsync='1')then
						if(charcount=15)then
							RXDAT<=datsft(14) & datsft(12) & datsft(10) & datsft(8) & datsft(6) & datsft(4) & datsft(2) & datsft(0);
							RXED<='1';
							charcount<=0;
						else
							charcount<=charcount+1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	broken<=daterr;
end rtl;

				
		