LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity OPMcreg is
port(
	wrchannel	:in integer range 0 to 7;
	wrdat		:in std_logic_vector(7 downto 0);
	wrdatno		:in integer range 0 to 3;
	wr			:in std_logic;
	busy		:out std_logic;
	
	rdchannel	:in integer range 0 to 7;
	rddat0		:out std_logic_vector(7 downto 0);
	rddat1		:out std_logic_vector(7 downto 0);
	rddat2		:out std_logic_vector(7 downto 0);
	rddat3		:out std_logic_vector(7 downto 0);
	
	clkr		:in std_logic;
	clkw		:in std_logic;
	rstn		:in std_logic
);
end OPMcreg;

architecture rtl of OPMcreg is

component parrmwram
generic(
	awidth	:integer	:=4;
	dwidth	:integer	:=32
);
port(
	rdaddr0	:in integer range 0 to awidth-1;
	rddat0	:out std_logic_vector(dwidth-1 downto 0);
	rdaddr1	:in integer range 0 to awidth-1;
	rddat1	:out std_logic_vector(dwidth-1 downto 0);
	wraddr	:in integer range 0 to awidth-1;
	wrdat	:in std_logic_vector(dwidth-1 downto 0);
	wr		:in std_logic;
	clkr	:in std_logic;
	clkrmw	:in std_logic
);
end component;

type state_t is (
	st_IDLE,
	st_ADDR,
	st_READ
);
signal	wrstate	:state_t;

signal	rmwaddr	:integer range 0 to 7;
signal	rmwrdat	:std_logic_vector(31 downto 0);
signal	rmwwdat	:std_logic_vector(31 downto 0);
signal	wrdatreg:std_logic_vector(7 downto 0);
signal	wrnoreg	:integer range 0 to 3;
signal	rmwwr	:std_logic;
signal	rddat	:std_logic_vector(31 downto 0);
begin
	ram	:parrmwram generic map(8,32)port map(
		rdaddr0	=>rdchannel,
		rddat0	=>rddat,
		rdaddr1	=>rmwaddr,
		rddat1	=>rmwrdat,
		wraddr	=>rmwaddr,
		wrdat	=>rmwwdat,
		wr		=>rmwwr,
		clkr	=>clkr,
		clkrmw	=>clkw
		
	);
	
	process(clkw,rstn)begin
		if(rstn='0')then
			wrstate<=st_IDLE;
			rmwaddr<=0;
			wrnoreg<=0;
			rmwwr<='0';
			wrdatreg<=(others=>'0');
		elsif(clkw' event and clkw='1')then
			rmwwr<='0';
			if(wr='1')then
				rmwaddr<=wrchannel;
				wrnoreg<=wrdatno;
				wrdatreg<=wrdat;
				wrstate<=st_ADDR;
			else
				case wrstate is
				when st_ADDR =>
					wrstate<=st_READ;
				when st_READ =>
					rmwwr<='1';
					wrstate<=st_IDLE;
				when others =>
					wrstate<=st_IDLE;
				end case;
			end if;
		end if;
	end process;
	
	rmwwdat<=	rmwrdat(31 downto 8) & wrdatreg 						when wrnoreg=0 else
				rmwrdat(31 downto 16) & wrdatreg & rmwrdat(7 downto 0)	when wrnoreg=1 else
				rmwrdat(31 downto 24) & wrdatreg & rmwrdat(15 downto 0)	when wrnoreg=2 else
				wrdatreg & rmwrdat(23 downto 0)							when wrnoreg=3 else
				rmwrdat;
	busy<='1' when wr='1' else '0' when wrstate=st_IDLE else '1';
	
	rddat0<=rddat(7 downto 0);
	rddat1<=rddat(15 downto 8);
	rddat2<=rddat(23 downto 16);
	rddat3<=rddat(31 downto 24);
	
end rtl;
	