LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vrcack is
generic(
	awidth	:integer	:=22;
	cwidth	:integer	:=8
);
port(
	rd		:in std_logic;
	rdaddr	:in std_logic_vector(awidth-1 downto 0);
	raddrh	:in std_logic_vector(awidth-cwidth-1 downto 0);
	rcaddr	:in std_logic_vector(cwidth-1 downto 0);
	de		:in std_logic;
	
	ack		:out std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end vrcack;
architecture rtl of vrcack is
type state_t is(
	st_IDLE,
	st_DWAIT,
	st_READ
);
signal	STATE	:state_t;
signal	hdiff	:std_logic;
signal	hdiffl	:std_logic;
signal	curaddr	:std_logic_vector(cwidth-1 downto 0);
begin

	hdiff<='0' when rdaddr(awidth-1 downto cwidth)=raddrh else '1';
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				curaddr<=(others=>'0');
			elsif(ce = '1')then
				if(hdiff='1')then
					curaddr<=(others=>'0');
				elsif(de='1')then
					curaddr<=rcaddr;
				end if;
			end if;
		end if;
	end process;
	
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				STATE<=st_IDLE;
				ack<='0';
				hdiffl<='1';
			elsif(ce = '1')then
				if(hdiff='1')then
					state<=st_IDLE;
				elsif(hdiff='0' and hdiffl='1')then
					state<=st_DWAIT;
				end if;
				if(STATE=st_DWAIT)then
					if(de='1')then
						STATE<=st_READ;
					end if;
				end if;
				if(STATE=st_READ and rdaddr(cwidth-1 downto 0)<=curaddr and rd='1')then
					ack<='1';
				else
					ack<='0';
				end if;
				hdiffl<=hdiff;
			end if;
		end if;
	end process;
end rtl;
			
