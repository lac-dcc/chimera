library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rastercopy is
generic(
	arange	:integer	:=14;
	brsize	:integer	:=8
);
port(
	src		:in std_logic_vector(7 downto 0);
	dst		:in std_logic_vector(7 downto 0);
	plane	:in std_logic_vector(3 downto 0);
	start	:in std_logic;
	stop	:in std_logic;
	busy	:out std_logic;

	t_base	:in std_logic_vector(arange-1 downto 0);	
	srcaddr	:out std_logic_vector(arange-1 downto 0);
	dstaddr	:out std_logic_vector(arange-1 downto 0);
	cplane	:out std_logic_vector(3 downto 0);
	cpy		:out std_logic;
	ack		:in std_logic;
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end rastercopy;
architecture rtl of rastercopy is
type state_t is (
	st_IDLE,
	st_COPY
);
signal	STATE	:state_t;
constant selwidth	:integer	:=10-brsize;
signal	sel	:std_logic_vector(selwidth-1 downto 0);
constant	selmax	:std_logic_vector(selwidth-1 downto 0)	:=(others=>'1');
signal	ackd	:std_logic;
--signal	sstart	:std_logic;
--signal	lstart	:std_logic;
begin
	srcaddr(arange-1 downto selwidth+8)<=t_base(arange-1 downto selwidth+8);
	srcaddr(selwidth-1 downto 0)<=sel;
		
	dstaddr(arange-1 downto selwidth+8)<=t_base(arange-1 downto selwidth+8);
	dstaddr(selwidth-1 downto 0)<=sel;

	
	process(clk,rstn)
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				cplane<=(others=>'0');
				srcaddr(selwidth+7 downto selwidth)<=(others=>'0');
				dstaddr(selwidth+7 downto selwidth)<=(others=>'0');
	--			sstart<='0';
	--			lstart<='0';
				cpy<='0';
			elsif(ce = '1')then
				cpy<='0';
	--			lstart<=sstart;
	--			sstart<=start;
				case STATE is
				when st_IDLE=>
	--				if(sstart='0' and lstart='1')then
					if(start='1')then
						srcaddr(selwidth+7 downto selwidth)<=src;
						dstaddr(selwidth+7 downto selwidth)<=dst;
						cplane<=plane;
						cpy<='1';
						ackd <= ack;
						STATE<=st_COPY;
					end if;
				when st_COPY =>
					if(ack /= ackd)then
						if(sel=selmax)then
							cplane<=(others=>'0');
							STATE<=st_IDLE;
							sel<=(others=>'0');
						else
							sel<=sel+1;
							cpy<='1';
							ackd <= ack;
						end if;
					end if;
				when others =>
				end case;
				if(stop='1')then
					cplane<=(others=>'0');
					STATE<=st_IDLE;
				end if;
			end if;
		end if;
	end process;
	
	busy<='0' when STATE=st_IDLE else '1';
end rtl;

			
