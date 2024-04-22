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

ENTITY udp_DualPortRAM_tx IS
generic(
  BUFWIDTH: natural := 0;
  ADDRWIDTH: natural := 0
);
port (
  clk : in std_logic;
  clk125 : in std_logic;
  tx_wea : in std_logic;
  tx_addra : in std_logic_vector(BUFWIDTH + ADDRWIDTH - 3 downto 0);
  tx_addrb : in std_logic_vector(BUFWIDTH + ADDRWIDTH - 1 downto 0);
  tx_dia : in std_logic_vector(31 downto 0);
  tx_dob : out std_logic_vector(7 downto 0)
  );
END ENTITY udp_DualPortRAM_tx;

--
ARCHITECTURE v3 OF udp_DualPortRAM_tx IS
type ram_type is array (2**(BUFWIDTH + ADDRWIDTH - 2) - 1 downto 0) of std_logic_vector (31 downto 0);
signal ram : ram_type;
--attribute block_ram : boolean;
--attribute block_ram of ram : signal is TRUE;
signal ram_out : std_logic_vector(31 downto 0);
signal bytesel: std_logic_vector(1 downto 0);
BEGIN

write: process (clk)
begin
  if (rising_edge(clk)) then
    if (tx_wea = '1') then
      ram(to_integer(unsigned(tx_addra))) <= tx_dia;
    end if;
  end if;
end process write;

read: process (clk125)
begin
  if (rising_edge(clk125)) then
    ram_out <= ram(to_integer(unsigned(tx_addrb(BUFWIDTH + ADDRWIDTH - 1 downto 2))))
-- pragma translate_off
    after 4 ns
-- pragma translate_on
    ;
    bytesel <= tx_addrb(1 downto 0)
-- pragma translate_off
    after 4 ns
-- pragma translate_on
    ;
  end if;
end process read;

with bytesel select
tx_dob <= ram_out(31 downto 24) when "00",
ram_out(23 downto 16) when "01",
ram_out(15 downto 8) when "10",
ram_out(7 downto 0) when "11",
(Others => '0') when Others;

END ARCHITECTURE v3;
