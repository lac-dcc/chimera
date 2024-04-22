LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fmmod is
port(
	txdat	:in std_logic_vector(7 downto 0);
	txwr	:in std_logic;
	txmf8	:in std_logic;
	txmfb	:in std_logic;
	txmfc	:in std_logic;
	txmfe	:in std_logic;
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
end fmmod;

architecture rtl of fmmod is
signal	cursft	:std_logic_vector(14 downto 0);
signal	nxtsft	:std_logic_vector(15 downto 0);
signal	bitcount:integer range 0 to 15;
signal	getnext	:std_logic;
signal	nxtemp	:std_logic;

begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				nxtemp<='1';
				nxtsft<=(others=>'0');
			elsif(ce = '1')then
				if(break='1')then
					nxtsft<=(others=>'0');
					nxtemp<='1';
				elsif(nxtemp='1' )then
					if(txwr='1')then
						nxtsft<='1' & txdat(7) & '1' & txdat(6) & '1' & txdat(5) & '1' & txdat(4) & '1' & txdat(3) & '1' & txdat(2) & '1' & txdat(1) & '1' & txdat(0);
						nxtemp<='0';
					elsif(txmf8='1')then
						nxtsft<="1111010101101010";
						nxtemp<='0';
					elsif(txmfb='1')then
						nxtsft<="1111010101101111";
						nxtemp<='0';
					elsif(txmfc='1')then
						nxtsft<="1111011101111010";
						nxtemp<='0';
					elsif(txmfe='1')then
						nxtsft<="1111010101111110";
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
	
	txemp<=nxtemp and not(txwr or txmf8 or txmfb or txmfc or txmfe);
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				getnext<='0';
				cursft<=(others=>'1');
				bitout<='0';
				writeen<='0';
				bitcount<=0;
				txend<='1';
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
							bitout<=nxtsft(15);
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
	