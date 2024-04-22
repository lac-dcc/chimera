-------------------------------------------------------------------------------
--
-- File        : ep_dp_ram.vhd
-- Description : Hardware Description Language dual port memory description
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ep_dp_ram is

generic (
  ADDR_WR_SIZE : NATURAL := 9;
	WORD_WR_SIZE : NATURAL := 32;
  ADDR_RD_SIZE : NATURAL := 9;
	WORD_RD_SIZE : NATURAL := 32
);

port (
  clka         : in std_logic;
	wea          : in std_logic;
	addra        : in std_logic_vector(ADDR_WR_SIZE - 1 downto 0);
	dina         : in std_logic_vector(WORD_WR_SIZE - 1 downto 0);
	clkb         : in std_logic;
	enb          : in std_logic;
	addrb        : in std_logic_vector(ADDR_RD_SIZE - 1 downto 0);
	doutb        : out std_logic_vector(WORD_RD_SIZE - 1 downto 0)
);

end ep_dp_ram;

architecture rtl of ep_dp_ram is

  constant pow_addr_wr_size: natural := 2**ADDR_WR_SIZE - 1;

type ram_type is array (0 to pow_addr_wr_size) of std_logic_vector (WORD_WR_SIZE - 1 downto 0);
signal RAM    : ram_type;

begin

assert ((2**ADDR_WR_SIZE * WORD_WR_SIZE) = (2**ADDR_RD_SIZE * WORD_RD_SIZE)) report "write and read port sizes incompatible" severity Failure;

process begin
  wait until rising_edge(clka);
  if (wea = '1') then
    -- RAM(conv_integer(addra)) <= dina;
    RAM(to_integer(unsigned(addra))) <= dina;
	end if;
end process;

process begin
  wait until rising_edge(clkb);
  if (enb = '1') then
    -- doutb <= RAM(conv_integer(addrb));
    doutb <= RAM(to_integer(unsigned(addrb)));
	end if;
end process;

end; -- ep_dp_ram

