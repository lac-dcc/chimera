library IEEE,work;
use IEEE.std_logic_1164.all;

entity CRCTEST is
port(
	CRCWR	:in std_logic;
	CRCIN	:in std_logic_vector(7 downto 0);

	CLR		:in std_logic;
	CLRDAT	:in std_logic_vector(15 downto 0);

	CRC		:out std_logic_vector(15 downto 0);
	busy	:out std_logic;

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end CRCTEST;

architecture rtl of CRCTEST is
component CRCGENN
	generic(
		DATWIDTH :integer	:=10;
		WIDTH	:integer	:=3
	);
	port(
		POLY	:in std_logic_vector(WIDTH downto 0);
		DATA	:in std_logic_vector(DATWIDTH-1 downto 0);
		DIR		:in std_logic;
		WRITE	:in std_logic;
		BITIN	:in std_logic;
		BITWR	:in std_logic;
		CLR		:in std_logic;
		CLRDAT	:in std_logic_vector(WIDTH-1 downto 0);
		CRC		:out std_logic_vector(WIDTH-1 downto 0);
		BUSY	:out std_logic;
		DONE	:out std_logic;
		CRCZERO	:out std_logic;

		clk		:in std_logic;
		ce      :in std_logic := '1';
		rstn	:in std_logic
	);
end component;
begin
	CRCG	:CRCGENN generic map(8,16) port map(
		POLY	=>"10000100000010001",
		DATA	=>CRCIN,
		DIR		=>'0',
		WRITE	=>CRCWR,
		BITIN	=>'0',
		BITWR	=>'0',
		CLR		=>CLR,
		CLRDAT	=>CLRDAT,
		CRC		=>CRC,
		BUSY	=>busy,
		DONE	=>open,
		CRCZERO	=>open,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
end rtl;


