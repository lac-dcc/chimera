library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sprregs is
port(
	addr	:in std_logic_vector(23 downto 0);
	b_rd	:in std_logic;
	b_wr	:in std_logic_vector(1 downto 0);
	wrdat	:in std_logic_Vector(15 downto 0);
	rddat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;

	sprno	:in std_logic_vector(6 downto 0);
	xpos	:out std_logic_Vector(9 downto 0);
	ypos	:out std_logic_vector(9 downto 0);
	VR		:out std_logic;
	HR		:out std_logic;
	COLOR	:out std_logic_vector(3 downto 0);
	PATNO	:out std_logic_vector(7 downto 0);
	PRI		:out std_logic_vector(1 downto 0);
	
	BG0Xpos	:out std_logic_vector(9 downto 0);
	BG0Ypos	:out std_logic_vector(9 downto 0);
	BG1Xpos	:out std_logic_vector(9 downto 0);
	BG1Ypos	:out std_logic_vector(9 downto 0);
	DISPEN	:out std_logic;
	BG1TXSEL	:out std_logic_vector(1 downto 0);
	BG0TXSEL	:out std_logic_vector(1 downto 0);
	BGON	:out std_logic_vector(1 downto 0);
	HTOTAL	:out std_logic_vector(7 downto 0);
	HDISP	:out std_logic_vector(5 downto 0);
	VDISP	:out std_logic_vector(7 downto 0);
	LH		:out std_logic;
	VRES	:out std_logic_vector(1 downto 0);
	HRES	:out std_logic_vector(1 downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end sprregs;

architecture rtl of sprregs is
signal	reg0_cs	:std_logic;
signal	reg0_wr	:std_logic_vector(1 downto 0);
signal	reg1_cs	:std_logic;
signal	reg1_wr	:std_logic_vector(1 downto 0);
signal	reg2_cs	:std_logic;
signal	reg2_wr	:std_logic_vector(1 downto 0);
signal	reg3_cs	:std_logic;
signal	reg3_wr	:std_logic_vector(1 downto 0);
signal	reg0rd	:std_logic_vector(15 downto 0);
signal	reg1rd	:std_logic_vector(15 downto 0);
signal	reg2rd	:std_logic_vector(15 downto 0);
signal	reg3rd	:std_logic_vector(15 downto 0);
signal	reg0dat	:std_logic_vector(15 downto 0);
signal	reg1dat	:std_logic_vector(15 downto 0);
signal	reg2dat	:std_logic_vector(15 downto 0);
signal	reg3dat	:std_logic_vector(15 downto 0);
signal	reg00rdat	:std_logic_vector(15 downto 0);
signal	reg00doe	:std_logic;
signal	reg00dat	:std_logic_vector(15 downto 0);
signal	reg02rdat	:std_logic_vector(15 downto 0);
signal	reg02doe	:std_logic;
signal	reg02dat	:std_logic_vector(15 downto 0);
signal	reg04rdat	:std_logic_vector(15 downto 0);
signal	reg04doe	:std_logic;
signal	reg04dat	:std_logic_vector(15 downto 0);
signal	reg06rdat	:std_logic_vector(15 downto 0);
signal	reg06doe	:std_logic;
signal	reg06dat	:std_logic_vector(15 downto 0);
signal	reg08rdat	:std_logic_vector(15 downto 0);
signal	reg08doe	:std_logic;
signal	reg08dat	:std_logic_vector(15 downto 0);
signal	reg0ardat	:std_logic_vector(15 downto 0);
signal	reg0adoe	:std_logic;
signal	reg0adat	:std_logic_vector(15 downto 0);
signal	reg0crdat	:std_logic_vector(15 downto 0);
signal	reg0cdoe	:std_logic;
signal	reg0cdat	:std_logic_vector(15 downto 0);
signal	reg0erdat	:std_logic_vector(15 downto 0);
signal	reg0edoe	:std_logic;
signal	reg0edat	:std_logic_vector(15 downto 0);
signal	reg10rdat	:std_logic_vector(15 downto 0);
signal	reg10doe	:std_logic;
signal	reg10dat	:std_logic_vector(15 downto 0);

component sprreg IS
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

component ramreg is
generic(
	address	:std_logic_vector(23 downto 0)	:=x"000000"
);
port(
	addr	:in std_logic_vector(23 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	doe		:out std_logic;

	reg		:out std_logic_vector(15 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;
begin
	reg0_cs<='1' when addr(23 downto 10)="11101011000000" and addr(2 downto 1)="00" else '0';
	reg1_cs<='1' when addr(23 downto 10)="11101011000000" and addr(2 downto 1)="01" else '0';
	reg2_cs<='1' when addr(23 downto 10)="11101011000000" and addr(2 downto 1)="10" else '0';
	reg3_cs<='1' when addr(23 downto 10)="11101011000000" and addr(2 downto 1)="11" else '0';
	reg0_wr<=b_wr when reg0_cs='1' else "00";
	reg1_wr<=b_wr when reg1_cs='1' else "00";
	reg2_wr<=b_wr when reg2_cs='1' else "00";
	reg3_wr<=b_wr when reg3_cs='1' else "00";
	
	reg0h	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat(15 downto 8),(others=>'0'),reg0_wr(1) and sys_ce,'0',reg0rd(15 downto 8),reg0dat(15 downto 8));
	reg0l	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat( 7 downto 0),(others=>'0'),reg0_wr(0) and sys_ce,'0',reg0rd( 7 downto 0),reg0dat( 7 downto 0));
	reg1h	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat(15 downto 8),(others=>'0'),reg1_wr(1) and sys_ce,'0',reg1rd(15 downto 8),reg1dat(15 downto 8));
	reg1l	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat( 7 downto 0),(others=>'0'),reg1_wr(0) and sys_ce,'0',reg1rd( 7 downto 0),reg1dat( 7 downto 0));
	reg2h	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat(15 downto 8),(others=>'0'),reg2_wr(1) and sys_ce,'0',reg2rd(15 downto 8),reg2dat(15 downto 8));
	reg2l	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat( 7 downto 0),(others=>'0'),reg2_wr(0) and sys_ce,'0',reg2rd( 7 downto 0),reg2dat( 7 downto 0));
	reg3h	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat(15 downto 8),(others=>'0'),reg3_wr(1) and sys_ce,'0',reg3rd(15 downto 8),reg3dat(15 downto 8));
	reg3l	:sprreg port map(addr(9 downto 3),sprno,sclk,vclk,wrdat( 7 downto 0),(others=>'0'),reg3_wr(0) and sys_ce,'0',reg3rd( 7 downto 0),reg3dat( 7 downto 0));

	rddat<=	reg0rd when reg0_cs='1' else
			reg1rd when reg1_cs='1' else
			reg2rd when reg2_cs='1' else
			reg3rd when reg3_cs='1' else
			reg00rdat	when reg00doe='1' else
			reg02rdat	when reg02doe='1' else
			reg04rdat	when reg04doe='1' else
			reg06rdat	when reg06doe='1' else
			reg08rdat	when reg08doe='1' else
			reg0ardat	when reg0adoe='1' else
			reg0crdat	when reg0cdoe='1' else
			reg0erdat	when reg0edoe='1' else
			reg10rdat	when reg10doe='1' else
			(others=>'0');
	datoe<=	'0' when b_rd='0' else
			'1' when reg0_cs='1' else
			'1' when reg1_cs='1' else
			'1' when reg2_cs='1' else
			'1' when reg3_cs='1' else
			reg00doe or reg02doe or reg04doe or reg06doe or reg08doe or reg0adoe or reg0cdoe or reg0edoe or reg10doe;

	xpos<=	reg0dat(9 downto 0);
	ypos<=	reg1dat(9 downto 0);
	VR<=	reg2dat(15);
	HR<=	reg2dat(14);
	COLOR<=	reg2dat(11 downto 8);
	PATNO<=	reg2dat(7 downto 0);
	PRI<=	reg3dat(1 downto 0);
	
	reg00	:ramreg generic map(x"eb0800") port map(addr,reg00rdat,wrdat,b_rd,b_wr,reg00doe,reg00dat,sclk,sys_ce,rstn);
	reg02	:ramreg generic map(x"eb0802") port map(addr,reg02rdat,wrdat,b_rd,b_wr,reg02doe,reg02dat,sclk,sys_ce,rstn);
	reg04	:ramreg generic map(x"eb0804") port map(addr,reg04rdat,wrdat,b_rd,b_wr,reg04doe,reg04dat,sclk,sys_ce,rstn);
	reg06	:ramreg generic map(x"eb0806") port map(addr,reg06rdat,wrdat,b_rd,b_wr,reg06doe,reg06dat,sclk,sys_ce,rstn);
	reg08	:ramreg generic map(x"eb0808") port map(addr,reg08rdat,wrdat,b_rd,b_wr,reg08doe,reg08dat,sclk,sys_ce,rstn);
	reg0a	:ramreg generic map(x"eb080a") port map(addr,reg0ardat,wrdat,b_rd,b_wr,reg0adoe,reg0adat,sclk,sys_ce,rstn);
	reg0c	:ramreg generic map(x"eb080c") port map(addr,reg0crdat,wrdat,b_rd,b_wr,reg0cdoe,reg0cdat,sclk,sys_ce,rstn);
	reg0e	:ramreg generic map(x"eb080e") port map(addr,reg0erdat,wrdat,b_rd,b_wr,reg0edoe,reg0edat,sclk,sys_ce,rstn);
	reg10	:ramreg generic map(x"eb0810") port map(addr,reg10rdat,wrdat,b_rd,b_wr,reg10doe,reg10dat,sclk,sys_ce,rstn);

	BG0Xpos<=	reg00dat(9 downto 0);
	BG0Ypos<=	reg02dat(9 downto 0);
	BG1Xpos<=	reg04dat(9 downto 0);
	BG1Ypos<=	reg06dat(9 downto 0);
	DISPEN<=	reg08dat(9);
	BG1TXSEL<=	reg08dat(5 downto 4);
	BG0TXSEL<=	reg08dat(2 downto 1);
	BGON<=		reg08dat(3) & reg08dat(0);
	HTOTAL<=	reg0adat(7 downto 0);
	HDISP<=		reg0cdat(5 downto 0);
	VDISP<=		reg0edat(7 downto 0);
	LH<=		reg10dat(4);
	VRES<=		reg10dat(3 downto 2);
	HRES<=		reg10dat(1 downto 0);

end rtl;
