---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY udp_DualPortRAM_rx IS
generic(
  BUFWIDTH: natural := 0;
  ADDRWIDTH: natural := 0
);
port (
  clk125 : in std_logic;
  clk : in std_logic;
  rx_wea : in std_logic;
  rx_addra : in std_logic_vector(BUFWIDTH + ADDRWIDTH - 1 downto 0);
  rx_addrb : in std_logic_vector(BUFWIDTH + ADDRWIDTH - 3 downto 0);
  rx_dia : in std_logic_vector(7 downto 0);
  rx_dob : out std_logic_vector(31 downto 0)
  );
END ENTITY udp_DualPortRAM_rx;

--
ARCHITECTURE striped OF udp_DualPortRAM_rx IS
type ram_type is array (2**(BUFWIDTH + ADDRWIDTH - 2) - 1 downto 0) of std_logic_vector (7 downto 0);
signal ram1,ram2, ram3, ram4 : ram_type;
--attribute block_ram : boolean;
--attribute block_ram of RAM1 : signal is TRUE;
--attribute block_ram of RAM2 : signal is TRUE;
--attribute block_ram of RAM3 : signal is TRUE;
--attribute block_ram of RAM4 : signal is TRUE;
BEGIN

write: process (clk125)
begin
  if (rising_edge(clk125)) then
    if (rx_wea = '1') then
      case rx_addra(1 downto 0) is
        when "00" =>
          ram4(to_integer(unsigned(rx_addra(BUFWIDTH + ADDRWIDTH - 1 downto 2)))) <= rx_dia;
        when "01" =>
          ram3(to_integer(unsigned(rx_addra(BUFWIDTH + ADDRWIDTH - 1 downto 2)))) <= rx_dia;
        when "10" =>
          ram2(to_integer(unsigned(rx_addra(BUFWIDTH + ADDRWIDTH - 1 downto 2)))) <= rx_dia;
        when "11" =>
          ram1(to_integer(unsigned(rx_addra(BUFWIDTH + ADDRWIDTH - 1 downto 2)))) <= rx_dia;
        when others =>
        	null;
      end case;
    end if;
  end if;
end process write;

read: process (clk)
  variable byte1, byte2, byte3, byte4 : std_logic_vector (7 downto 0);
begin
  if (rising_edge(clk)) then
    byte4 := ram4(to_integer(unsigned(rx_addrb)));
    byte3 := ram3(to_integer(unsigned(rx_addrb)));
    byte2 := ram2(to_integer(unsigned(rx_addrb)));
    byte1 := ram1(to_integer(unsigned(rx_addrb)));
    rx_dob <= byte4 & byte3 & byte2 & byte1;
  end if;
end process read;


END ARCHITECTURE striped;
