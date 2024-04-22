LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mfmdem is
generic(
	bwidth	:integer	:=88;
	fben	:integer	:=1
);
port(
	bitlen	:in integer range 0 to bwidth;
	
	datin	:in std_logic;
	
	init	:in std_logic;
	break	:in std_logic;
	
	RXDAT	:out std_logic_vector(7 downto 0);
	RXED	:out std_logic;
	DetMA1	:out std_logic;
	DetMC2	:out std_logic;
	broken	:out std_logic;
	
	curlen	:out integer range 0 to bwidth*2;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end mfmdem;

architecture rtl of mfmdem is
signal	mfmsync		:std_logic;
signal	datsft		:std_logic_vector(31 downto 0);
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
signal	lastd,lasti	:std_logic;
constant chksync	:integer :=40;
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
				lastd<='0';
				lasti<='0';
				synccount<=chksync-1;
			elsif(ce = '1')then
				sft<='0';
				if(init='1')then
					nodat<='1';
					curwidth<=bitlen;
					synccount<=chksync-1;
				elsif(break='1')then
					nodat<='1';
				elsif(nodat='1')then
					if(dpulse='1')then
						lencount<=1;
						nodat<='0';
					end if;
				elsif(daterr='1')then
					synccount<=chksync-1;
					curwidth<=bitlen;
				else
					if(dpulse='1')then
						if(synccount>0)then
							synccount<=synccount-1;
						else
							datum<='1';
							sft<='1';
						end if;
						--pulse width feedback
						if(fben/=0)then
							if(lencount=curwidth)then
								curwidth<=curwidth;
								lastd<='0';
								lasti<='0';
							elsif(lencount>curwidth)then
								if(curwidth<(bitlen+(bitlen/2)))then
									if(lasti='1')then
										curwidth<=curwidth+1;
										lasti<='0';
									else
										lasti<='1';
									end if;
									lastd<='0';
								end if;
							else
								if(curwidth>(bitlen/2))then
									if(lastd='1')then
										curwidth<=curwidth-1;
										lastd<='0';
									else
										lastd<='1';
									end if;
									lasti<='0';
								end if;
							end if;
						end if;
						lencount<=1;
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
				if(break='1' or init='1')then
					datsft<=(others=>'0');
				elsif(sft='1')then
					datsft<=datsft(30 downto 0) & datum;
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
				DetMC2<='0';
				DetMA1<='0';
				mfmsync<='0';
				charcount<=0;
				daterr<='0';
			elsif(ce = '1')then
				RXED<='0';
				DetMC2<='0';
				DetMA1<='0';
				daterr<='0';
				if(break='1' or init='1')then
					mfmsync<='0';
					charcount<=0;
				elsif(lsft='1')then
					if(datsft(1 downto 0)="11" or datsft(4 downto 0)="10000")then
						mfmsync<='0';		--
						charcount<=0;		--
						daterr<='1';
					end if;
					if(datsft(15 downto 0)="0100010010001001")then
						mfmsync<='1';
						charcount<=0;
						DetMA1<='1';
					elsif(datsft="01010010001001000101001000100100")then
						mfmsync<='1';
						charcount<=0;
						DetMC2<='1';
					elsif(mfmsync='1')then
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

				
		