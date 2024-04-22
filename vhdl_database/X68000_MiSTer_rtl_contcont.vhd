library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.ALL;

entity contcont is
generic(
	extwid	:integer	:=3
);
port(
	addrin	:in std_logic_vector(23 downto 0);
	wr		:in std_logic;
	rd		:in std_logic;
	wrdat	:in std_logic_vector(7 downto 0);
	rddat	:out std_logic_vector(7 downto 0);
	doe	:out std_logic;
	
	vviden	:in std_logic;
	contrast:out std_logic_vector(3+extwid downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	srstn	:in std_logic
);
end contcont;

architecture rtl of contcont is
signal	portwr	:std_logic;
signal	lportwr	:std_logic;
signal	addrx	:std_logic_vector(23 downto 0);
signal	contval	:std_logic_vector(extwid+3 downto 0);
signal	target	:std_logic_vector(extwid+3 downto 0);
begin
	addrx<=addrin(23 downto 1) & '1';
	
	portwr<=	wr when addrx=x"e8e001" else '0';
	doe<=		rd when addrx=x"e8e001" else '0';
	process(sclk,srstn)begin
		if rising_edge(sclk) then
			if(srstn='0')then
				lportwr<='0';
				target(extwid+3 downto extwid)<=(others=>'1');
				target(extwid-1 downto 0)<=(others=>'0');
			elsif(sys_ce = '1')then
				lportwr<=portwr;
				if(lportwr='0' and portwr='1')then
					target(extwid+3 downto extwid)<=wrdat(3 downto 0);
				end if;
			end if;
		end if;
	end process;
	rddat<=x"0" & target(extwid+3 downto extwid);
	contrast<=contval;
	
	process(sclk,srstn)
	variable lviden	:std_logic;
	begin
		if rising_edge(sclk) then
			if(srstn='0')then
				lviden:='0';
				contval<=(others=>'0');
			elsif(sys_ce = '1')then
				if(lviden='1' and vviden='0')then
					if(contval>target)then
						contval<=contval-1;
					elsif(contval<target)then
						contval<=contval+1;
					end if;
				end if;
				lviden:=vviden;
			end if;
		end if;
	end process;

end rtl;
