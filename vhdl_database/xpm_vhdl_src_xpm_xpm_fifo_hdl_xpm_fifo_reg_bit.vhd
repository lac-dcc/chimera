--! Copyright [2020] [Frans Schreuder]
--!
--!   Licensed under the Apache License, Version 2.0 (the "License");
--!   you may not use this file except in compliance with the License.
--!   You may obtain a copy of the License at
--!
--!       http://www.apache.org/licenses/LICENSE-2.0
--!
--!   Unless required by applicable law or agreed to in writing, software
--!   distributed under the License is distributed on an "AS IS" BASIS,
--!   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--!   See the License for the specific language governing permissions and
--!   limitations under the License.
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.env.all;

entity  xpm_fifo_reg_bit is
generic (
    RST_VALUE        : std_logic := '0'

);
port(
    rst : in std_logic;
    clk : in std_logic;
    d_in : in std_logic;
    d_out : out std_logic := RST_VALUE
);
end xpm_fifo_reg_bit;

architecture rtl of xpm_fifo_reg_bit is

begin

  process(clk)
  begin
    if rst = '1' then
        d_out <= RST_VALUE;
    elsif rising_edge(clk) then
        d_out  <= d_in;
    end if;
  end process;

end rtl;
