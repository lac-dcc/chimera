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


-- Tom Williams, June 2018


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ipbus_transport_multibuffer_rx_dpram is
  generic (
  	-- corresponds to 32b data
    ADDRWIDTH : natural
  );
  port (
  	clka : in std_logic;
    wea : in std_logic;
    addra : in std_logic_vector(ADDRWIDTH - 2 downto 0);
    dia : in std_logic_vector(63 downto 0);

  	clkb : in std_logic;
  	addrb : in std_logic_vector(ADDRWIDTH - 1 downto 0);
  	dob : out std_logic_vector(31 downto 0)
  );
end entity ipbus_transport_multibuffer_rx_dpram;


architecture rtl of ipbus_transport_multibuffer_rx_dpram is

  type ram_type is array (2**ADDRWIDTH - 1 downto 0) of std_logic_vector(31 downto 0);
  signal ram : ram_type;

begin

  write: process (clka)
  begin
    if rising_edge(clka) then
      if (wea = '1') then
        ram(to_integer(unsigned(addra & '0'))) <= dia(31 downto 0);
        ram(to_integer(unsigned(addra & '1'))) <= dia(63 downto 32);
      end if;
    end if;
  end process write;

  read: process (clkb)
  begin
    if rising_edge(clkb) then
      dob <= ram(to_integer(unsigned(addrb)));
    end if;
  end process read;

end architecture rtl;