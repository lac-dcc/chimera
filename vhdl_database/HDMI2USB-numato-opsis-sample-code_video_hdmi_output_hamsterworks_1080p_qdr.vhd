----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz>
--
-- Description: Implement a quad data rate interface in SDR FPGA logic
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity qdr is
    Port ( clk0,clk90 : in  STD_LOGIC;
           data       : in  STD_LOGIC_VECTOR (3 downto 0);
           qdr        : out  STD_LOGIC);
end qdr;

architecture Behavioral of qdr is
   COMPONENT out_xor PORT( 
      I0,I1,I2,I3 : IN std_logic;
      o  : OUT std_logic      
      );
   END COMPONENT;

   signal ff, change,buffered : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
   signal reclock    : STD_LOGIC_VECTOR (3 downto 1) := (others => '0');
	signal last : STD_LOGIC := '0';
begin

xor_lut: out_xor PORT MAP(I0 => ff(0), I1 => ff(1), I2 => ff(2), I3 => ff(3), O => qdr);

clk0_proc: process(clk0)
   begin
      if rising_edge(clk0) then
         ff(0)              <= change(0);
         -- Work out what values need to go into the flipflops this cycle.
         change(0)          <= buffered(0) xor last XOR change(0);
         change(3 downto 1) <= buffered(3 downto 1) xor buffered(2 downto 0) xor change(3 downto 1);
			last  <= buffered(3);
			
			buffered <= data;
      end if;
      if falling_edge(clk0) then
         ff(2) <= reclock(2);
      end if;      
   end process;

clk90_proc: process(clk90)
   begin
      if rising_edge(clk90) then
         ff(1) <= reclock(1);
      end if;
      if falling_edge(clk90) then
         ff(3)   <= reclock(3);
         reclock <= change(3 downto 1);
      end if;
   end process;
end Behavioral;