
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dac_simplesd is
  generic (
    nbits : integer := 9);
  port (
    din     : in  signed((nbits-1) downto 0);
    dout    : out std_logic;
    clk     : in  std_logic;
    clk_ena : in  std_logic;
    rst     : in  std_logic);
end entity dac_simplesd;

architecture behave of dac_simplesd is

  signal sigma_latch: unsigned(nbits+1 downto 0);

begin

process(clk)
  variable delta_b:     unsigned(nbits+1 downto 0);
  variable delta_adder: unsigned(nbits+1 downto 0);
  variable sigma_adder: unsigned(nbits+1 downto 0);
  variable data:        unsigned(nbits+1 downto 0);
begin

  if rising_edge(clk) then
   if rst='1' then
      sigma_latch <= (others => '0');
		  sigma_latch(sigma_latch'high) <= '1';
		  dout <= '0';
	  else
      if clk_ena='1' then
        delta_b(nbits+1) := sigma_latch(nbits+1);
        delta_b(nbits)   := sigma_latch(nbits+1);
        delta_b(nbits-1 downto 0) := (others => '0');
        data(nbits+1 downto nbits) := "00";
        data(nbits-1) := not din(nbits-1);
        data(nbits-2 downto 0) := unsigned(din(nbits-2 downto 0));
        delta_adder := data + delta_b;
        sigma_adder := delta_adder + sigma_latch;
    	  sigma_latch <= sigma_adder;
    		dout <= sigma_latch(sigma_latch'high);
      end if;
  	end if;
  end if;
end process;
end behave;
