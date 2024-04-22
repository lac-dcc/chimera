library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity grpal is
port(
	cs		:in std_logic;
	addr	:in std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	
	gmode	:in std_logic;
	skel	:in std_logic	:='0';
	palnoh	:in std_logic_vector(7 downto 0);
	palnol	:in std_logic_vector(7 downto 0);
	palout	:out std_logic_vector(15 downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end grpal;
architecture rtl of grpal is
signal	cs3,cs2,cs1,cs0	:std_logic;
signal	wr3,wr2,wr1,wr0	:std_logic;
signal	rdat3,rdat2,rdat1,rdat0	:std_logic_vector(7 downto 0);
signal	pdat3,pdat2,pdat1,pdat0	:std_logic_vector(7 downto 0);
signal	psel	:std_logic_vector(1 downto 0);
signal	red,grn,blu	:std_logic_vector(5 downto 0);
signal	palp,pals	:std_logic_vector(15 downto 0);
signal	ssel	:std_logic;
component gpram
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock_a		: IN STD_LOGIC  := '1';
		clock_b		: IN STD_LOGIC ;
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;
begin
	cs3<=cs when addr(0)='1' else '0';
	cs2<=cs when addr(0)='1' else '0';
	cs1<=cs when addr(0)='0' else '0';
	cs0<=cs when addr(0)='0' else '0';
	
	wr3<=cs3 and wr(1);
	wr2<=cs2 and wr(0);
	wr1<=cs1 and wr(1);
	wr0<=cs0 and wr(0);
	
	datoe<=(cs3 or cs2 or cs1 or cs0) and rd;

	ram3	:gpram port map(addr(7 downto 1),palnoh(7 downto 1),sclk,vclk,wdat(15 downto 8),(others=>'0'),wr3 and sys_ce,'0',rdat3,pdat3);
	ram2	:gpram port map(addr(7 downto 1),palnoh(7 downto 1),sclk,vclk,wdat( 7 downto 0),(others=>'0'),wr2 and sys_ce,'0',rdat2,pdat2);
	ram1	:gpram port map(addr(7 downto 1),palnol(7 downto 1),sclk,vclk,wdat(15 downto 8),(others=>'0'),wr1 and sys_ce,'0',rdat1,pdat1);
	ram0	:gpram port map(addr(7 downto 1),palnol(7 downto 1),sclk,vclk,wdat( 7 downto 0),(others=>'0'),wr0 and sys_ce,'0',rdat0,pdat0);

	rdat(15 downto 8)<=	rdat3 when cs3='1' else
						rdat1 when cs1='1' else
						x"00";
	rdat(7 downto 0)<=	rdat2 when cs2='1' else
						rdat0 when cs0='1' else
						x"00";
	process(vclk)begin
		if rising_edge(vclk) then
			if(vid_ce = '1')then
				psel<=palnoh(0) & palnol(0);
			end if;
		end if;
	end process;
	
	palp(15 downto 8)<=	pdat1 when gmode='0' and psel(1)='0' else
							pdat3 when gmode='0' and psel(1)='1' else
							pdat2 when gmode='1' and psel(1)='1' else
							pdat3 when gmode='1' and psel(1)='0' else
							(others=>'0');
	palp(7 downto 0)<=	pdat0 when gmode='0' and psel(0)='0' else
							pdat2 when gmode='0' and psel(0)='1' else
							pdat0 when gmode='1' and psel(0)='1' else
							pdat1 when gmode='1' and psel(0)='0' else
							(others=>'0');
	grn<=	('0' & pdat1(7 downto 3))+('0' & pdat3(7 downto 3));
	red<=	('0' & pdat1(2 downto 0) & pdat0(7 downto 6))+('0' & pdat3(2 downto 0) & pdat2(7 downto 6));
	blu<=	('0' & pdat0(5 downto 1))+('0' & pdat2(5 downto 1));
	
	pals<=grn(5 downto 1) & red(5 downto 1) & blu(5 downto 1) & '0';
	palout<=palp when skel='0' or psel(0)='0' else pals;
	
end rtl;