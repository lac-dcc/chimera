library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity txtpal is
port(
	cs		:in std_logic;
	addr	:in std_logic_vector(7 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	datoe	:out std_logic;
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	
	palno	:in std_logic_vector(7 downto 0);
	palout	:out std_logic_vector(15 downto 0);
	
	sclk	:in std_logic;
	sys_ce  :in std_logic := '1';
	vclk	:in std_logic;
	vid_ce  :in std_logic := '1';
	rstn	:in std_logic
);
end txtpal;
architecture rtl of txtpal is
signal	hwr,lwr	:std_logic;
component txtpramh
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
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

component txtpraml
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
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
	hwr<=cs and wr(1);
	lwr<=cs and wr(0);
	datoe<=cs and rd;
	ramh	:txtpramh port map(addr,palno,sclk,vclk,wdat(15 downto 8),(others=>'0'),hwr and sys_ce,'0',rdat(15 downto 8),palout(15 downto 8));
	raml	:txtpraml port map(addr,palno,sclk,vclk,wdat( 7 downto 0),(others=>'0'),lwr and sys_ce,'0',rdat( 7 downto 0),palout( 7 downto 0));
end rtl;