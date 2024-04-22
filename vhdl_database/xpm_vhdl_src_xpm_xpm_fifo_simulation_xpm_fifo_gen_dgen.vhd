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
-- Module Name: xpm_fifo_gen_dgen
-- Description:
--   Used for XPM FIFO write interface stimulus generation
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;
use ieee.numeric_std.all;
library std;
use std.env.all;
entity xpm_fifo_gen_dgen is
generic(
    C_DIN_WIDTH  : integer := 32;
    C_DOUT_WIDTH : integer := 32;
    TB_SEED      : integer := 2
);
port(
    rst        : in  std_logic;
    wr_clk     : in  std_logic;
    prc_wr_en  : in  std_logic;
    full       : in  std_logic;
    wr_en      : out std_logic;
    wr_data    : out std_logic_vector(C_DIN_WIDTH-1 downto 0) := (others => '0')
);
end xpm_fifo_gen_dgen;

architecture tb of xpm_fifo_gen_dgen is

  function clog2(N : natural) return positive is
  begin
    if N <= 2 then
      return 1;
    elsif N mod 2 = 0 then
      return 1 + clog2(N/2);
    else
      return 1 + clog2((N+1)/2);
    end if;
  end function;

  function C_DATA_WIDTH return integer is
  begin
    if (C_DIN_WIDTH > C_DOUT_WIDTH) then
     return C_DIN_WIDTH;
    else
     return C_DOUT_WIDTH;
    end if;
  end function;
  constant  DATA_BYTES : integer := C_DATA_WIDTH/8;
  function  LOOP_COUNT return integer is
  begin
    if ((C_DATA_WIDTH mod 8) = 0)then
      return DATA_BYTES;
    else
      return DATA_BYTES+1;
    end if;
  end function;
  constant   WIDTH_RATIO  : integer := C_DOUT_WIDTH/C_DIN_WIDTH;
  constant   D_WIDTH_DIFF : integer := clog2(WIDTH_RATIO);

  signal     wr_cntr   : std_logic_vector(D_WIDTH_DIFF-1 downto 0) := (others => '0');
  signal     pr_w_en   : std_logic := '0';
  signal     rand_num  : std_logic_vector(8*LOOP_COUNT-1 downto 0):= (others => '0');
  signal     wr_data_i : std_logic_vector(C_DATA_WIDTH-1 downto 0):= (others => '0');

begin

 wr_en    <= prc_wr_en; 
 
 process
 begin
    wait for 10 ns;
    wr_data  <= wr_data_i(C_DIN_WIDTH-1 downto 0); 
    wait;
 end process;

--Generation of DATA
gen_stim: for wn in LOOP_COUNT-1 downto 0 generate
    rd_gen_inst1: entity work.xpm_fifo_gen_rng 
    generic map(
               WIDTH => 8,
               SEED  => TB_SEED+wn
    )  
    port map(
        clk        => wr_clk,
        rst        => rst,
        enable     => pr_w_en,
        random_num => rand_num(8*(wn+1)-1 downto 8*wn)
    );
end generate gen_stim;

g_dinw_gt_doutw: if (C_DIN_WIDTH >= C_DOUT_WIDTH)  generate
begin
  pr_w_en   <= prc_wr_en  and  (not full);
  process(rand_num)
  begin
       wr_data_i <= rand_num;
  end process;
end generate;

g_doutw_gt_dinw: if (C_DIN_WIDTH < C_DOUT_WIDTH) generate
      process(rst, wr_clk)
      begin
         if (rst = '1') then
           wr_cntr <= (others => '0');
         elsif rising_edge(wr_clk) then
           if((full = '0')  and  prc_wr_en = '1') then
             wr_cntr <= wr_cntr+1;
           end if;
         end if;
      end process;

  pr_w_en   <= prc_wr_en  and  (not full)  and  ( and wr_cntr);
  process(wr_cntr)
  begin
      if(wr_cntr = 0) then
          wr_data_i <= rand_num;
      else
          wr_data_i <= wr_data_i(C_DIN_WIDTH-1 downto 0) & wr_data_i(C_DOUT_WIDTH-1 downto C_DIN_WIDTH);
      end if;
  end process;
end generate;

end tb;-- : xpm_fifo_gen_dgen
