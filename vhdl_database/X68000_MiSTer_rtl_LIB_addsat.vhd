LIBRARY	IEEE;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_SIGNED.ALL;
	use ieee.std_logic_arith.all;

entity addsat is
generic(
	datwidth	:integer	:=16
);
port(
	INA		:in std_logic_vector(datwidth-1 downto 0);
	INB		:in std_logic_vector(datwidth-1 downto 0);
	
	OUTQ	:out std_logic_vector(datwidth-1 downto 0);
	OFLOW	:out std_logic;
	UFLOW	:out std_logic
);
end addsat;

architecture rtl of addsat is
begin
	process(INA,INB)
	variable WA,WB,SUM	:std_logic_vector(datwidth downto 0);
	begin
		WA:=INA(datwidth-1)&INA;
		WB:=INB(datwidth-1)&INB;
		SUM:=WA+WB;
		case SUM(datwidth downto datwidth-1)is
		when "00" | "11" =>
			OUTQ<=SUM(datwidth-1 downto 0);
			OFLOW<='0';
			UFLOW<='0';
		when "01" =>
			OUTQ(datwidth-1)<='0';
			OUTQ(datwidth-2 downto 0)<=(others=>'1');
			OFLOW<='1';
			UFLOW<='0';
		when "10" =>
			OUTQ(datwidth-1)<='1';
			OUTQ(datwidth-2 downto 0)<=(others=>'0');
			OFLOW<='0';
			UFLOW<='1';
		when others =>
			OUTQ<=(others=>'0');
			OFLOW<='1';
			UFLOW<='1';
		end case;
	end process;
end rtl;

	