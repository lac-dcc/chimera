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

entity xpm_fifo_reg_vec is
generic (
    REG_WIDTH : integer := 4
);
port (
  rst : in std_logic;
  clk : in std_logic;
  reg_in : in std_logic_vector(REG_WIDTH-1 downto 0);
  reg_out : out std_logic_vector(REG_WIDTH-1 downto 0)
);
end xpm_fifo_reg_vec;

architecture rtl of xpm_fifo_reg_vec is
    signal reg_out_i : std_logic_vector(REG_WIDTH-1 downto 0) := (others => '0');
begin
  
  process(clk, rst)
  begin
    if rst = '1' then
        reg_out_i <= (others => '0');
    elsif rising_edge(clk) then
        reg_out_i <= reg_in;
    end if;
  end process;
  
  reg_out <= reg_out_i;

end rtl;
