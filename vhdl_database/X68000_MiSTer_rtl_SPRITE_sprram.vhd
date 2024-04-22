library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sprram is
port(
	addr	:in std_logic_vector(23 downto 0);
	b_rd	:in std_logic;
	b_wr	:in std_logic_vector(1 downto 0);
	wrdat	:in std_logic_Vector(15 downto 0);
	rddat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;

	patno	:in std_logic_vector(9 downto 0);
	dotx	:in std_logic_vector(2 downto 0);
	doty	:in std_logic_vector(2 downto 0);
	dot		:out std_logic_vector(3 downto 0);

	bg_addr	:in std_logic_vector(12 downto 0);
	bg_VR	:out std_logic;
	bg_HR	:out std_logic;
	bg_COLOR:out std_logic_vector(3 downto 0);
	bg_PAT	:out std_logic_vector(7 downto 0);

	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end sprram;

architecture rtl of sprram is
signal	pcg_cs	:std_logic;
signal	bgv_cs	:std_logic;
signal	pcg_wr	:std_logic_vector(1 downto 0);
signal	bgv_wr	:std_logic_vector(1 downto 0);
signal	pcgrdat	:std_logic_vector(15 downto 0);
signal	bgvrdat	:std_logic_vector(15 downto 0);
signal	pcg_addr:std_logic_vector(13 downto 0);
signal	dsel	:std_logic_vector(1 downto 0);

component pcgram
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
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

component bgvram
	PORT
	(
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		rdclock		: IN STD_LOGIC ;
		wraddress		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		wrclock		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;

begin
	pcg_cs<='1' when addr(23 downto 15)="111010111" else '0';
	pcg_wr<=b_wr when pcg_cs='1' else "00";

	bgv_cs<='1' when addr(23 downto 14)="1110101111" else '0';
	bgv_wr<=b_wr when bgv_cs='1' else "00";

	pcg_addr<=patno & doty & dotx(2);
	pcgh	:pcgram port map(addr(14 downto 1),pcg_addr,sclk,vclk,wrdat(15 downto 8),(others=>'0'),pcg_wr(1) and sys_ce,'0',rddat(15 downto 8),pcgrdat(15 downto 8));
	pcgl	:pcgram port map(addr(14 downto 1),pcg_addr,sclk,vclk,wrdat( 7 downto 0),(others=>'0'),pcg_wr(0) and sys_ce,'0',rddat( 7 downto 0),pcgrdat( 7 downto 0));

	process(vclk,rstn)begin
		if rising_edge(vclk) then
			if(rstn='0')then
				dsel<=(others=>'0');
			elsif(vid_ce = '1')then
				dsel<=dotx(1 downto 0);
			end if;
		end if;
	end process;
	dot<=	pcgrdat(15 downto 12) when dsel="00" else
			pcgrdat(11 downto  8) when dsel="01" else
			pcgrdat( 7 downto  4) when dsel="10" else
			pcgrdat( 3 downto  0);

	datoe<='1' when pcg_cs='1' and b_rd='1' else '0';

	bgvh	:bgvram port map(wrdat(15 downto 8),bg_addr,vclk,addr(13 downto 1),sclk,bgv_wr(1) and sys_ce,bgvrdat(15 downto 8));
	bgvl	:bgvram port map(wrdat( 7 downto 0),bg_addr,vclk,addr(13 downto 1),sclk,bgv_wr(0) and sys_ce,bgvrdat( 7 downto 0));
	bg_VR<=bgvrdat(15);
	bg_HR<=bgvrdat(14);
	bg_COLOR<=bgvrdat(11 downto 8);
	bg_PAT<=bgvrdat(7 downto 0);
end rtl;