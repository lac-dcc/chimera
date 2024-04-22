LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity muls16xu16 is
port(
	ins		:in std_logic_vector(15 downto 0);
	inu		:in std_logic_vector(15 downto 0);
	
	q		:out std_logic_vector(15 downto 0);
	
	clk		:in std_logic
);

end muls16xu16;

architecture rtl of muls16xu16 is
signal	inus	:std_logic_vector(16 downto 0);
signal	qwid	:std_logic_vector(32 downto 0);
 component MUL16x17
	PORT
	(
		clock		: IN STD_LOGIC ;
		dataa		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (32 DOWNTO 0)
	);
END component;

begin
	inus<='0' & inu;
	
	mul:mul16x17 port map(clk,ins,inus,qwid);
	
	q<=qwid(31 downto 16);
end rtl;