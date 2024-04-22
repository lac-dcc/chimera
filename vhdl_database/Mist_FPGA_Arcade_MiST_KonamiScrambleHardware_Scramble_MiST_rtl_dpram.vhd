-------------------------------------------------------------------------------
-- $Id: dpram.vhd,v 1.1 2006/02/23 21:46:45 arnim Exp $
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity dpram is

generic (
	 addr_width_g : integer := 8;
	 data_width_g : integer := 8
);
port (
	clk_a_i  : in  std_logic;
	en_a_i   : in  std_logic;
	we_i     : in  std_logic;
	addr_a_i : in  std_logic_vector(addr_width_g-1 downto 0);
	data_a_i : in  std_logic_vector(data_width_g-1 downto 0);
	data_a_o : out std_logic_vector(data_width_g-1 downto 0);
	clk_b_i  : in  std_logic;
	addr_b_i : in  std_logic_vector(addr_width_g-1 downto 0);
	data_b_o : out std_logic_vector(data_width_g-1 downto 0)
);

end dpram;


library ieee;
use ieee.numeric_std.all;

architecture rtl of dpram is

  type   ram_t is array (natural range 2**addr_width_g-1 downto 0) of std_logic_vector(data_width_g-1 downto 0);
  signal ram_q : ram_t;

begin

  mem_a: process (clk_a_i)
  begin
    if rising_edge(clk_a_i) then
      if we_i = '1' and en_a_i = '1' then
        ram_q(to_integer(unsigned(addr_a_i))) <= data_a_i;
		  data_a_o <= data_a_i;
		else
		  data_a_o <= ram_q(to_integer(unsigned(addr_a_i)));
      end if;
    end if;
  end process mem_a;

  mem_b: process (clk_b_i)
  begin
    if rising_edge(clk_b_i) then
		data_b_o <= ram_q(to_integer(unsigned(addr_b_i)));
    end if;
  end process mem_b;

end rtl;
