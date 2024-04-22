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
-- Module Name: xpm_fifo_gen_dverif
-- Description:
--   Used for XPM FIFO read interface stimulus generation and data checking
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;
library std;
use std.env.all;

entity xpm_fifo_gen_dverif is
generic(
   C_DIN_WIDTH        : integer := 18;
   C_DOUT_WIDTH       : integer := 18;
   C_USE_EMBEDDED_REG : integer := 0;
   C_CH_TYPE          : integer := 0;
   FWFT_ENABLED       : integer := 0;
   FIFO_READ_LATENCY  : integer := 0;
   TB_SEED            : integer := 2
);
port (
   rst       : in   std_logic;
   rd_clk    : in   std_logic;
   prc_rd_en : in   std_logic;
   empty     : in   std_logic;
   data_out  : in   std_logic_vector(C_DOUT_WIDTH-1 downto 0);
   rd_en     : out  std_logic;
   dout_chk  : out  std_logic
);
end xpm_fifo_gen_dverif;

architecture tb of xpm_fifo_gen_dverif is
 
  function MAX(V1: integer; V2: integer) return integer is
  begin
     if(V1 > V2) then
         return V1;
     else
         return V2;
     end if;
  end function;
  
  function MIN(V1: integer; V2: integer) return integer is
  begin
     if(V1 < V2) then
         return V1;
     else
         return V2;
     end if;
  end function;
  
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

 constant C_DATA_WIDTH : integer := MAX(C_DIN_WIDTH , C_DOUT_WIDTH);
 constant C_EXPECTED_WIDTH : integer := MAX(C_DIN_WIDTH , C_DOUT_WIDTH);
 
 function EXTRA_WIDTH  return integer is
 begin
  if (C_CH_TYPE = 2) then
    return 1;
  else
    return 0;
  end if;
 end function;
 
 constant DATA_BYTES   : integer := (C_DATA_WIDTH+EXTRA_WIDTH)/8;
 function LOOP_COUNT   return integer is 
 begin
  if (((C_DATA_WIDTH+EXTRA_WIDTH)mod 8) = 0) then
    return DATA_BYTES;
  else
    return DATA_BYTES+1;
  end if;
 end function;
 constant WIDTH_RATIO  : integer := C_DIN_WIDTH/C_DOUT_WIDTH;
 constant D_WIDTH_DIFF : integer := clog2(WIDTH_RATIO);


 signal  expected_dout : std_logic_vector(C_EXPECTED_WIDTH-1 downto 0); 
 signal  rand_num      : std_logic_vector(8*LOOP_COUNT-1 downto 0); 
 signal  rd_en_i       : std_logic; 
 signal  pr_r_en       : std_logic;
 signal  data_chk      : std_logic := '0'; 
 signal  rd_en_d1      : std_logic := '1'; 
 signal  rd_en_d2      : std_logic := '0'; 
 signal  rst_d1        : std_logic := '0'; 
 signal  rst_d2        : std_logic := '0'; 
 signal  rst_d3        : std_logic := '0'; 
 signal  rst_d4        : std_logic := '0'; 
 
 type slv_arr is array(FIFO_READ_LATENCY-1 downto 0) of std_logic_vector(C_EXPECTED_WIDTH-1 downto 0);
 signal expected_dout_reg : slv_arr;
 signal rd_en_i_reg  : std_logic_vector(FIFO_READ_LATENCY-1 downto 0); 
 signal rd_en_d1_reg : std_logic_vector(FIFO_READ_LATENCY-1 downto 0); 
 
 
begin
 
 dout_chk <= data_chk;
 rd_en    <= rd_en_i;
 rd_en_i  <= prc_rd_en;

  -------------------------------------------------------
  -- Expected data generation and checking for data_fifo
  -------------------------------------------------------
  g_fwft: if(FWFT_ENABLED = 1) generate
    rd_en_d1 <= '1';
  end generate g_fwft;
  g_nfwft: if(FWFT_ENABLED /= 1) generate
  
    process(rst, rd_clk)
    begin
      if (rst = '1') then
        rd_en_d1 <= '0';
        rd_en_d2 <= '0';
      elsif rising_edge(rd_clk) then
        if ((empty = '0')  and  rd_en_i = '1'  and  ( rd_en_d1 = '1')) then
          rd_en_d1 <= '1';
        end if;
        rd_en_d2 <= rd_en_d1;
      end if;
    end process;
 end generate g_nfwft;

 
  g_din_width_lt_dout_width: if (C_DIN_WIDTH <= C_DOUT_WIDTH)   generate
    pr_r_en       <= rd_en_i  and  (not empty)  and  rd_en_d1;
    expected_dout <= rand_num;
  end generate g_din_width_lt_dout_width;
  g_din_width_gt_dout_width: if (C_DIN_WIDTH > C_DOUT_WIDTH)   generate
    signal  rd_cntr : std_logic_vector(D_WIDTH_DIFF-1 downto 0);
  begin
    process(rst, rd_clk)
    begin
      if (rst = '1') then
        rd_cntr <= (others => '0');
      elsif rising_edge(rd_clk) then
        if(rd_en_i = '1'  and  empty = '0'  and  rd_en_d1 = '1') then
          rd_cntr <= rd_cntr+'1';
        end if;
      end if;
    end process;
    pr_r_en       <= rd_en_i  and  (not empty)  and  (and rd_cntr);
    
    process (rd_cntr) 
    begin
      if(rd_cntr = (rd_cntr'range=>'0')) then
        expected_dout <= rand_num;
      else
        expected_dout <= expected_dout(C_DOUT_WIDTH-1 downto 0) & expected_dout(C_DIN_WIDTH-1 downto C_DOUT_WIDTH);
      end if;
    end process;
  
 end generate g_din_width_gt_dout_width;

 g_loop_count: for rn in LOOP_COUNT-1 downto 0 generate
     rd_gen_inst1: entity work.xpm_fifo_gen_rng 
     generic map(
         WIDTH => 8,
         SEED  => TB_SEED+rn
     )  
     port map(
         clk        => rd_clk,
         rst        => rst,
         enable     => pr_r_en,
         random_num => rand_num(8*(rn+1)-1 downto 8*rn)
     );
 end generate g_loop_count;
  

  g_lat1: if (FIFO_READ_LATENCY = 1)   generate
  begin
    process (rst, rd_clk)
    begin
      if(rst = '1') then
        data_chk <= '0';
      elsif rising_edge(rd_clk) then
        if((empty = '0')  and  (rd_en_i = '1'  and  rd_en_d1 = '1')) then
          if(data_out = expected_dout(C_DOUT_WIDTH-1 downto 0)) then
            data_chk <= '0';
          else
            data_chk <= '1';
          end if;
        end if;
      end if;
    end process;
  end generate g_lat1;
 

 process (expected_dout,rd_en_i, rd_en_d1)
 begin
   for i in expected_dout_reg'left downto 0 loop
    if i = 0 then
       expected_dout_reg(i) <= expected_dout;
       rd_en_i_reg(i)       <= rd_en_i;
       rd_en_d1_reg(i)      <= rd_en_d1;
    end if;
   end loop;
 end process;

 g_for_expeced_dout: for rln in 1 to FIFO_READ_LATENCY-1 generate
     process(rst, rd_clk) 
     begin
       if(rst = '1') then
           expected_dout_reg(rln) <= (others => '0');
           rd_en_i_reg(rln) <= '0';
           rd_en_d1_reg(rln) <= '0';
       elsif rising_edge(rd_clk) then
           expected_dout_reg(rln) <= expected_dout_reg(rln-1); 
           rd_en_i_reg(rln) <= rd_en_i_reg(rln-1);
           rd_en_d1_reg(rln) <= rd_en_d1_reg(rln-1);
       end if;
     end process;
 end generate;

 g_latgt1: if (FIFO_READ_LATENCY > 1)   generate
   process(rst, rd_clk)
   begin
       if(rst = '1') then
           data_chk <= '0';
       elsif rising_edge(rd_clk) then
           if((empty = '0')  and  (rd_en_i_reg(FIFO_READ_LATENCY-1) = '1'  and  rd_en_d1_reg(FIFO_READ_LATENCY-1) = '1')) then
             if(data_out = expected_dout_reg(FIFO_READ_LATENCY-1)(C_DOUT_WIDTH-1 downto 0)) then
               data_chk <= '0';
             else
               data_chk <= '1';
             end if;
           end if;
       end if;
   end process;
 end generate g_latgt1;
 
end tb;-- : xpm_fifo_gen_dverif






