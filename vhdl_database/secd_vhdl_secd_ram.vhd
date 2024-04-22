-- RAM behavioural model for SECD, simulation only

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.secd_defs.all;
use work.secd_ram_defs.all;

entity secd_ram is
  port(
    read_data        : out std_logic_vector(31 downto 0);
    write_data       : in std_logic_vector(31 downto 0);
    address          : in std_logic_vector(13 downto 0);
    read_en          : in std_logic;
    write_en         : in std_logic;
    clk              : in std_logic;
    reset            : in std_logic;
    busy             : out std_logic
    );
end entity;

architecture sim of secd_ram is

  signal RAM            : RAM_TYPE := RAM_INIT;
  signal write_pulse    : std_logic := '0';
  signal write_register : std_logic := '0';

begin
  process (clk)
  begin
    if rising_edge(clk) then
      busy <= '0';
      if write_pulse = '1' then
        busy <= '1';
        RAM(conv_integer(address)) <= write_data;
--		report "write: " & integer'image(to_integer(unsigned(address)))
--		& " field: " & integer'image(to_integer(unsigned(write_data(31 downto 31))))
--		& " mark: " & integer'image(to_integer(unsigned(write_data(30 downto 30))))
--		& " type: " & integer'image(to_integer(unsigned(write_data(29 downto 28))))
--		& " car: " & integer'image(to_integer(unsigned(write_data(27 downto 14))))
--		& " cdr: " & integer'image(to_integer(unsigned(write_data(13 downto 0))));
      end if;
      read_data <= RAM(conv_integer(address));
    end if;
  end process;

  make_write_pulse : process(clk, write_en)
  begin
    if falling_edge(clk) then
      if write_en = '1' and write_register = '0' then
        write_register <= '1';
        write_pulse <= '1';
      elsif write_en = '1' then
        write_pulse <= '0';
      else
        write_register <= '0';
      end if;
    end if;
  end process;

end sim;

