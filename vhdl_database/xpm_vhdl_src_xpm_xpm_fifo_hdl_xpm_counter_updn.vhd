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
use ieee.numeric_std.all;
library std;
use std.env.all;

entity xpm_counter_updn is
generic (
  COUNTER_WIDTH        : integer := 4;
  RESET_VALUE          : integer := 0

);
port(
  rst         : in std_logic;
  clk         : in std_logic;
  cnt_en      : in std_logic;
  cnt_up      : in std_logic;
  cnt_down    : in std_logic;
  count_value : out std_logic_vector(COUNTER_WIDTH-1 downto 0)
);
end xpm_counter_updn;

architecture rtl of xpm_counter_updn is
    signal count_value_i : unsigned(COUNTER_WIDTH-1 downto 0) := to_unsigned(RESET_VALUE, COUNTER_WIDTH);
begin

  
  count_value <= std_logic_vector(count_value_i);
  
  process(rst, clk)
  begin
    if (rst = '1') then
      count_value_i  <= to_unsigned(RESET_VALUE, COUNTER_WIDTH);
    elsif rising_edge(clk) then
      if (cnt_en = '1') then
        if cnt_up = '1' and cnt_down = '0' then
          count_value_i <= count_value_i + to_unsigned(1, COUNTER_WIDTH);
        end if;
        if cnt_up = '0' and cnt_down = '1' then
          count_value_i <= count_value_i - to_unsigned(1, COUNTER_WIDTH);
        end if;
      end if;
    end if;
  end process;

end rtl;
