LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;		 
USE ieee.std_logic_unsigned.all;

entity debouncer is
port 
(	clk    : in  std_logic;
	rst_n  : in  std_logic;
	insig  : in  std_logic;	
	outsig : out std_logic	
);
end entity debouncer;

architecture rtl of debouncer is

signal  input_q : std_logic_vector(7 downto 0);

begin

process(rst_n,clk)
begin
	if rst_n = '0' then
		input_q <= (others => '0');
		outsig <= '0';
	elsif rising_edge(clk) then

		input_q <= (input_q(6 downto 0) & insig);
		
		if input_q = "11111111" then
			outsig <= '1';
		elsif input_q = "00000000" then
			outsig <= '0';
		end if;		
	end if;
end process;

end architecture;
