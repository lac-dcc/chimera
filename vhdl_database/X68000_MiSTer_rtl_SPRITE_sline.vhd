library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sline is
port(
	wraddr	:in std_logic_vector(8 downto 0);
	wrdat	:in std_logic_vector(7 downto 0);
	wr		:in std_logic;
	clr		:in std_logic;
	change	:in std_logic;
	rdaddr	:in std_logic_vector(8 downto 0);
	rddat	:out std_logic_vector(7 downto 0);

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end sline;

architecture rtl of sline is
signal	sel			:std_logic;
signal	wdat		:std_logic_vector(7 downto 0);
signal	wr0,wr1		:std_logic;
signal	rdat0,rdat1	:std_logic_vector(7 downto 0);

component slinebuf
	PORT
	(
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		wraddress		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		wren		: IN STD_LOGIC  := '0';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;
begin
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				sel<='0';
			elsif(ce = '1')then
				if(change='1')then
					sel<=not sel;
				end if;
			end if;
			end if;
	end process;

	wr0<=	'1' when sel='0' and clr='1' else
			wr when sel='0' else
			'0';
	wr1<=	'1' when sel='1' and clr='1' else
			wr when sel='1' else
			'0';
	rddat<=rdat1 when sel='0' else rdat0;
	wdat<=wrdat when clr='0' else x"00";

	buf0	:slinebuf port map(clk,wdat,rdaddr,wraddr,wr0 and ce,rdat0);
	buf1	:slinebuf port map(clk,wdat,rdaddr,wraddr,wr1 and ce,rdat1);
end rtl;