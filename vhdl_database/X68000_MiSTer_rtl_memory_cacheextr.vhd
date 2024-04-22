LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cacheextr is
generic(
	awidth	:integer	:=8
);
port(
	wraddr	:in std_logic_vector(awidth-1 downto 0);
	wr		:in std_logic;
	clr		:in std_logic;
	busy	:out std_logic;
	
	rdaddr	:in std_logic_vector(awidth-1 downto 0);
	rd		:out std_logic;
	masken	:in std_logic;
	
	wclk	:in std_logic;
	ram_ce  :in std_logic := '1';
	rclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end cacheextr;

architecture rtl of cacheextr is
signal	wraddr0,wraddr1	:std_logic_vector(awidth-1 downto 0);
signal	clraddr	:std_logic_vector(awidth-1 downto 0);

type state_t is (
	st_IDLE,
	st_INIT,
	st_CLR
);
signal	state	:state_t;
signal	current	:std_logic;

signal	rd0,rd1	:std_logic;
signal	wr0,wr1	:std_logic;
signal	wdat0,wdat1:std_logic;
constant lastaddr	:std_logic_vector(awidth-1 downto 0)	:=(others=>'1');
signal	srclk	:std_logic;
signal	lrclk	:std_logic;
signal	mask	:std_logic;
signal	mcount	:integer range 0 to 2;
signal	rdm		:std_logic;

component cereg
generic(
	awidth	:integer	:=8
);
port(
	wraddr	:in std_logic_vector(awidth-1 downto 0);
	wr		:in std_logic;
	wdat	:in std_logic;
	
	rdaddr	:in std_logic_vector(awidth-1 downto 0);
	rd		:out std_logic;
	
	wclk	:in std_logic;
	ram_ce  :in std_logic := '1';
	rclk	:in std_logic;
	sys_ce  :in std_logic := '1'
);
end component;

begin
	
	reg0	:cereg generic map(awidth) port map(wraddr0,wr0,wdat0,rdaddr,rd0,wclk,ram_ce,wclk,sys_ce);
	reg1	:cereg generic map(awidth) port map(wraddr1,wr1,wdat1,rdaddr,rd1,wclk,ram_ce,wclk,sys_ce);
	
	process(wclk,rstn)begin
		if rising_edge(wclk) then
			if(rstn='0')then
				state<=st_INIT;
				clraddr<=(others=>'0');
				current<='0';
			elsif(ram_ce = '1')then
				case state is
				when st_INIT =>
					if(clraddr=lastaddr)then
						state<=st_IDLE;
					else
						clraddr<=clraddr+1;
					end if;
				when st_IDLE =>
					if(clr='1')then
						clraddr<=(others=>'0');
						current<=not current;
						state<=st_CLR;
					end if;
				when st_CLR =>
					if(clraddr=lastaddr)then
						state<=st_IDLE;
					else
						clraddr<=clraddr+1;
					end if;
				when others =>
					state<=st_IDLE;
				end case;
			end if;
		end if;
	end process;
	
	process(wclk,rstn)begin
		if rising_edge(wclk) then
			if(rstn='0')then
				mask<='1';
				mcount<=0;
				srclk<='1';
				lrclk<='1';
			elsif (ram_ce = '1') then
				srclk<=rclk;
				lrclk<=srclk;
				if(clr='1')then
					mask<='0';
					mcount<=2;
				elsif(lrclk='0' and srclk='1')then
					if(mcount>0)then
						mcount<=mcount-1;
					else
						mask<='1';
					end if;
				end if;
			end if;
		end if;
	end process;
	
	wraddr0<=	clraddr	when state=st_INIT else
				clraddr when state=st_CLR and current='1' else
				wraddr	when current='0' else
				(others=>'0');

	wraddr1<=	clraddr	when state=st_INIT else
				clraddr when state=st_CLR and current='0' else
				wraddr	when current='1' else
				(others=>'0');
				
	rdm<=		rd0 when current='0' else rd1;
	
	wr0<=		'1' when state=st_INIT else
				'1' when state=st_CLR and current='1' else
				wr	when current='0' else
				'0';

	wr1<=		'1' when state=st_INIT else
				'1' when state=st_CLR and current='0' else
				wr	when current='1' else
				'0';
	
	wdat0<=		'0' when state=st_INIT else
				'0' when state=st_CLR and current='1' else
				'1' when current='0' else
				'0';

	wdat1<=		'0' when state=st_INIT else
				'0' when state=st_CLR and current='0' else
				'1' when current='1' else
				'0';
	
	busy<=		'0' when state=st_IDLE else '1';
	rd<=		rdm and mask and (not clr) when masken='1' else rdm;
	
end rtl;
