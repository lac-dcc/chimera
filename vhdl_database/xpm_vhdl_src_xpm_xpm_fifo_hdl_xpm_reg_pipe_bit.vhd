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


entity xpm_reg_pipe_bit is
generic (
    PIPE_STAGES  : integer := 1;
    RST_VALUE    : std_logic := '0'
);
port (
  rst      : in  std_logic;
  clk      : in  std_logic;
  pipe_in  : in  std_logic;
  pipe_out : out std_logic
);
end xpm_reg_pipe_bit;

architecture rtl of xpm_reg_pipe_bit is
    signal pipe_stage_ff : std_logic_vector(PIPE_STAGES downto 0);
begin

   pipe_stage_ff(0) <= pipe_in;

   gen_pipe_bit: for pipestage in 0 to PIPE_STAGES-1 generate 
     
      pipe_bit_inst: entity work.xpm_fifo_reg_bit
      generic map (
        RST_VALUE => RST_VALUE
      )
      port map (
        rst   => rst,
        clk   => clk,
        d_in  => pipe_stage_ff(pipestage),
        d_out => pipe_stage_ff(pipestage+1)
      );
   end generate gen_pipe_bit;

   pipe_out <= pipe_stage_ff(PIPE_STAGES);
   
end rtl;
