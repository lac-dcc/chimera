LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sintbl is
port(
	addr	:in std_logic_vector(15 downto 0);
	
	dat		:out std_logic_vector(15 downto 0);
	
	mon_cosw:out std_logic_vector(15 downto 0);
	mon_sinw:out std_logic_vector(15 downto 0);
	mon_cosn:out std_logic_vector(15 downto 0);
	mon_sinn:out std_logic_vector(15 downto 0);
	
	clk		:in std_logic
);
end sintbl;

architecture rtl of sintbl is
component sinwrom
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q_a		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component sinnrom 
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component cosnrom 
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END component;

component mult16
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;

signal	cos2sin	:std_logic_vector(7 downto 0);
signal	sincos	:std_logic_vector(31 downto 0);
signal	cossin	:std_logic_vector(31 downto 0);
signal	sum		:std_logic_vector(31 downto 0);
signal	sinwid	:std_logic_vector(15 downto 0);
signal	coswid	:std_logic_vector(15 downto 0);
signal	sinnal	:std_logic_vector(15 downto 0);
signal	cosnal	:std_logic_vector(15 downto 0);

begin

	cos2sin<="01000000"+addr(15 downto 8);
	
	wide	:sinwrom port map(addr(15 downto 8),cos2sin,clk,sinwid,coswid);
	nals	:sinnrom port map(addr(7 downto 0),clk,sinnal);
	nalc	:cosnrom port map(addr(7 downto 0),clk,cosnal);
	
	mltsc	:mult16 port map(clk,sinwid,cosnal,sincos);
	mltcs	:mult16 port map(clk,coswid,sinnal,cossin);
	
	sum<=sincos+cossin;
	dat<=sum(31 downto 16);
	
	mon_cosw<=coswid;
	mon_sinw<=sinwid;
	mon_cosn<=cosnal;
	mon_sinn<=sinnal;
	
end rtl;
