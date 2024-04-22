library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
library STD;
use STD.TEXTIO.ALL;

entity sram_sim is
	generic(
		INIT_FILE	:	string := "vram.txt"
	);
	port(
		A 	: in std_logic_vector(17 downto 0);

		OEn	: in std_logic;
		WEn	: in std_logic;			
		CEn	: in std_logic;

		UBn	: in std_logic;
		LBn	: in std_logic;
		
		DQ	: inout std_logic_vector(15 downto 0)
	);
end sram_sim;

architecture sim of sram_sim is
begin

	-- process
		-- file F		: text open read_mode is INIT_FILE;
		-- variable L	: line;
		-- variable V	: std_logic_vector(15 downto 0);
	-- begin
        -- for i in 0 to 32767 loop     
          -- exit when endfile(F); 
          -- readline(F,L);  
          -- hread(L,V);
          -- RAMEXT(i) <= V;
        -- end loop;

		-- wait;
	-- end process;
	
	process(CEn, OEn, WEn, UBn, LBn, A, DQ)
		file F		: text open read_mode is INIT_FILE;
		variable L	: line;
		variable V	: std_logic_vector(15 downto 0);
		variable init_done : std_logic := '0';
		type memory is array(natural range <>) of std_logic_vector(15 downto 0);
		variable RAMEXT : memory(0 to 2**18 - 1) := (others => x"ffff");
	begin
		if init_done = '0' then
			for i in 0 to 32767 loop     
				exit when endfile(F); 
				readline(F,L);  
				hread(L,V);
				RAMEXT(i) := V;
			end loop;
			init_done := '1';
		end if;

		if CEn = '0' then

			if OEn = '0' and LBn = '0' then
				DQ(7 downto 0) <= RAMEXT(conv_integer(to_x01(A)))(7 downto 0);
			else
				DQ(7 downto 0) <= "ZZZZZZZZ";
			end if;
			if OEn = '0' and UBn = '0' then
				DQ(15 downto 8) <= RAMEXT(conv_integer(to_x01(A)))(15 downto 8);
			else
				DQ(15 downto 8) <= "ZZZZZZZZ";
			end if;

			if WEn = '0' and LBn = '0' then
				RAMEXT(conv_integer(to_x01(A)))(7 downto 0) := DQ(7 downto 0);
			end if;
			if WEn = '0' and UBn = '0' then
				RAMEXT(conv_integer(to_x01(A)))(15 downto 8) := DQ(15 downto 8);
			end if;
			
		else

			DQ(15 downto 0) <= "ZZZZZZZZZZZZZZZZ";

		end if;
	end process;
		
end sim;

