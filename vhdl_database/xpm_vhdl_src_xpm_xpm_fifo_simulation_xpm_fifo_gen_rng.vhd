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
-- Module Name: xpm_fifo_gen_rng
-- Description:
--   Used for generation of pseudo random numbers
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;
use ieee.numeric_std.all;
library std;
use std.env.all;
entity xpm_fifo_gen_rng is
generic(
  WIDTH    : integer := 8;
  SEED     : integer := 3
  );
port(
  clk        : in std_logic;
  rst        : in std_logic;
  enable     : in std_logic;
  random_num : out std_logic_vector(WIDTH-1 downto 0)
);
end xpm_fifo_gen_rng;

architecture tb of xpm_fifo_gen_rng is  
  signal rand_temp: std_logic_vector(WIDTH-1 downto 0);
  signal temp: std_logic;
begin

  process(rst, clk)
  begin
    if (rst = '1') then
      temp      <= '0';
      rand_temp <= std_logic_vector(to_unsigned(SEED, WIDTH));
    elsif rising_edge(clk) then
      if(enable = '1') then
    
        temp      <= rand_temp(WIDTH-1) xnor rand_temp(WIDTH-3) xnor rand_temp(WIDTH-4) xnor rand_temp(WIDTH-5);
        rand_temp <= rand_temp(WIDTH-2 downto 0) & temp;
      end if;
    end if;
  end process;
  random_num <= rand_temp;

end tb;-- : xpm_fifo_gen_rng
