LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mfmmod is
port(
	txdat	:in std_logic_vector(7 downto 0);
	txwr	:in std_logic;
	txma1	:in std_logic;
	txmc2	:in std_logic;
	break	:in std_logic;
	
	txemp	:out std_logic;
	txend	:out std_logic;
	
	bitout	:out std_logic;
	writeen	:out std_logic;
	
	sft		:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end mfmmod;

architecture rtl of mfmmod is
signal	cursft	:std_logic_vector(14 downto 0);
signal	nxtsft	:std_logic_vector(14 downto 0);
signal	bitcount:integer range 0 to 15;
signal	getnext	:std_logic;
signal	nxtemp	:std_logic;
signal	lastlsb	:std_logic;

begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				nxtemp<='1';
				nxtsft<=(others=>'0');
			elsif(ce = '1')then
				if(break='1')then
					nxtemp<='1';
					nxtsft<=(others=>'0');
				elsif(nxtemp='1' )then
					if(txwr='1')then
						for i in 0 to 6 loop
							nxtsft(i*2)<=txdat(i);
							if(txdat(i)='0' and txdat(i+1)='0')then
								nxtsft(i*2+1)<='1';
							else
								nxtsft(i*2+1)<='0';
							end if;
						end loop;
						nxtsft(14)<=txdat(7);
						nxtemp<='0';
					elsif(txma1='1')then
						nxtsft<="100010010001001";
						nxtemp<='0';
					elsif(txmc2='1')then
						nxtsft<="101001000100100";
						nxtemp<='0';
					end if;
				else
					if(getnext='1')then
						nxtemp<='1';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	txemp<=nxtemp and not(txwr or txma1 or txmc2);
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				getnext<='0';
				cursft<=(others=>'1');
				bitout<='0';
				writeen<='0';
				bitcount<=0;
				txend<='1';
				lastlsb<='1';
			elsif(ce = '1')then
				bitout<='0';
				getnext<='0';
				if(break='1')then
					writeen<='0';
					bitcount<=0;
				elsif(sft='1')then
					if(bitcount>0)then
						bitout<=cursft(14);
						cursft<=cursft(13 downto 0) & '1';
						bitcount<=bitcount-1;
					else
						txend<='1';
						if(nxtemp='0')then
							txend<='0';
							getnext<='1';
							cursft<=nxtsft(14 downto 0);
							if(lastlsb='0' and nxtsft(14)='0')then
								bitout<='1';
							else
								bitout<='0';
							end if;
							lastlsb<=nxtsft(0);
							bitcount<=15;
							writeen<='1';
						else
							writeen<='0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
end rtl;
	