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
-- Module Name: xpm_fifo_gen_pctrl
-- Description:
--   Used for protocol control on write and read interface stimulus and status generation
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;
use ieee.numeric_std.all;
library std;
use std.env.all;
entity xpm_fifo_gen_pctrl is
generic(
   C_APPLICATION_TYPE  : integer := 0;
   C_DIN_WIDTH         : integer := 18;
   C_DOUT_WIDTH        : integer := 18;
   C_WR_PNTR_WIDTH     : integer := 0;
   C_RD_PNTR_WIDTH     : integer := 0;
   C_CH_TYPE           : integer := 0;
   FREEZEON_ERROR      : integer := 0;
   TB_STOP_CNT         : integer := 2;
   TB_SEED             : integer := 2
);
port(
   RESET_WR      : in  std_logic;
   RESET_RD      : in  std_logic;
   WR_CLK        : in  std_logic;
   RD_CLK        : in  std_logic;
   FULL          : in  std_logic;
   EMPTY         : in  std_logic;
   ALMOST_FULL   : in  std_logic;
   ALMOST_EMPTY  : in  std_logic;
   DATA_IN       : in  std_logic_vector(C_DIN_WIDTH-1 downto 0);
   DATA_OUT      : in  std_logic_vector(C_DOUT_WIDTH-1 downto 0);
   DOUT_CHK      : in  std_logic;
   PRC_WR_EN     : out std_logic;
   PRC_RD_EN     : out std_logic;
   RESET_EN      : out std_logic;
   SIM_DONE      : out std_logic;
   STATUS        : out std_logic_vector(7 downto 0)                
);
end xpm_fifo_gen_pctrl;

architecture tb of xpm_fifo_gen_pctrl is

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
    if(C_DIN_WIDTH > C_DOUT_WIDTH) then
     return C_DIN_WIDTH;
    else
     return C_DOUT_WIDTH;
    end if;
 end function;
 constant  DATA_BYTES      : integer := C_DATA_WIDTH/8;
 function  LOOP_COUNT      return integer is
 begin
    if ((C_DATA_WIDTH mod 8) = 0) then
      return DATA_BYTES;
    else
      return DATA_BYTES+1;
    end if;
 end function;
 function  D_WIDTH_DIFF    return integer is
 begin
    if (C_DIN_WIDTH > C_DOUT_WIDTH) then
      return clog2(C_DIN_WIDTH/C_DOUT_WIDTH);
    elsif (C_DIN_WIDTH < C_DOUT_WIDTH) then
      return clog2(C_DOUT_WIDTH/C_DIN_WIDTH);
    else 
      return 1;
    end if;
 end function;
 
 function SIM_STOP_CNTR1  return integer is
 begin
    if(C_CH_TYPE = 2) then
        return 64;
    else 
        return TB_STOP_CNT;
    end if;
 end function;

 signal    data_chk_i       : std_logic; 
 signal    full_chk_i       : std_logic := '0'; 
 signal    empty_chk_i      : std_logic := '0'; 
 signal    status_i         : std_logic_vector(4 downto 0); 
 signal    status_d1_i      : std_logic_vector(4 downto 0) := (others => '0'); 
 signal    wr_en_gen        : std_logic_vector(7 downto 0); 
 signal    rd_en_gen        : std_logic_vector(7 downto 0); 
 signal    wr_cntr          : std_logic_vector(C_WR_PNTR_WIDTH-2 downto 0)  := (others => '0'); 
 signal    full_as_timeout  : std_logic_vector(C_WR_PNTR_WIDTH downto 0)    := (others => '0'); 
 signal    full_ds_timeout  : std_logic_vector(C_WR_PNTR_WIDTH downto 0)    := (others => '0'); 
 signal    rd_cntr          : std_logic_vector(C_RD_PNTR_WIDTH-2 downto 0)  := (others => '0'); 
 signal    empty_as_timeout : std_logic_vector(C_RD_PNTR_WIDTH downto 0)    := (others => '0'); 
 signal    empty_ds_timeout : std_logic_vector(C_RD_PNTR_WIDTH downto 0)    := (others => '0'); 
 signal    wr_en_i          : std_logic := '0'; 
 signal    rd_en_i          : std_logic := '0'; 
 signal    state            : std_logic := '0'; 
 signal    wr_control       : std_logic := '0'; 
 signal    rd_control       : std_logic := '0'; 
 signal    stop_on_err      : std_logic := '0'; 
 signal    sim_stop_cntr    : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(SIM_STOP_CNTR1,8));
 signal    sim_done_i       : std_logic := '0'  ;
 signal    rdw_gt_wrw       : std_logic_vector(D_WIDTH_DIFF-1 downto 0)     := (others => '1'); 
 signal    wrw_gt_rdw       : std_logic_vector(D_WIDTH_DIFF-1 downto 0)     := (others => '1'); 
 signal    rd_activ_cont    : std_logic_vector(25 downto 0)                 := (others => '0');
 signal    prc_we_i         : std_logic;
 signal    prc_re_i         : std_logic;
 signal    reset_en_i       : std_logic := '0';
 signal    sim_done_d1      : std_logic := '0';
 signal    sim_done_wr_dom1 : std_logic := '0';
 signal    sim_done_wr_dom2 : std_logic := '0';
 signal    empty_d1         : std_logic := '0';
 signal    empty_wr_dom1    : std_logic := '0';
 signal    state_d1         : std_logic := '0';
 signal    state_rd_dom1    : std_logic := '0';
 signal    rd_en_d1         : std_logic := '0';
 signal    rd_en_wr_dom1    : std_logic := '0';
 signal    wr_en_d1         : std_logic := '0';
 signal    wr_en_rd_dom1    : std_logic := '0';
 signal    full_chk_d1      : std_logic := '0';
 signal    full_chk_rd_dom1 : std_logic := '0';
 signal    empty_wr_dom2    : std_logic := '0';
 signal    state_rd_dom2    : std_logic := '0';
 signal    state_rd_dom3    : std_logic := '0';
 signal    rd_en_wr_dom2    : std_logic := '0';
 signal    wr_en_rd_dom2    : std_logic := '0';
 signal    full_chk_rd_dom2 : std_logic := '0';
 signal    reset_en_d1      : std_logic := '0';
 signal    reset_en_rd_dom1 : std_logic := '0';
 signal    reset_en_rd_dom2 : std_logic := '0';
 signal    post_rst_dly_wr  : std_logic_vector(4 downto 0) := "11111"; 
 signal    post_rst_dly_rd  : std_logic_vector(4 downto 0) := "11111"; 

begin

 status_i  <= data_chk_i & full_chk_rd_dom2 & empty_chk_i & "00";
 STATUS    <= status_d1_i & "00" & rd_activ_cont(25);
 prc_we_i  <= wr_en_i when(sim_done_wr_dom2 = '0') else '0';
 prc_re_i  <= rd_en_i when(sim_done_i = '0') else '0';
 SIM_DONE  <= sim_done_i;

 process( RD_CLK)
 begin
   if rising_edge(RD_CLK) then
     if(prc_re_i = '1') then
       rd_activ_cont <= rd_activ_cont + '1';
     end if;
   end if;
 end process;

--SIM_DONE SIGNAL GENERATION
process(RESET_RD, RD_CLK)
begin
    if(RESET_RD = '1') then
      sim_done_i <= '0';
    elsif rising_edge(RD_CLK) then
      if(((( or sim_stop_cntr) = '0')  and  (TB_STOP_CNT /= 0))  or  stop_on_err = '1') then
         sim_done_i <= '1';
      end if;
    end if;
end process;
-- TB Timeout/Stop
 fifo_tb_stop_run: if (TB_STOP_CNT /= 0) generate
 begin
     process (RD_CLK)
     begin
       if rising_edge(RD_CLK) then
         if(state_rd_dom2 = '0'  and  state_rd_dom3 = '1') then
           sim_stop_cntr <= sim_stop_cntr - '1';
         end if;  
       end if;
     end process;
 end generate;

-- Stop when error found
  process(RD_CLK)
  begin
    if rising_edge(RD_CLK) then
      if(sim_done_i = '0')  then
        status_d1_i <= status_i  or  status_d1_i;
      end if;
    end if;
  end process;
  process(RD_CLK)
  begin
    if rising_edge(RD_CLK) then
      if((FREEZEON_ERROR = 1)  and  (status_i /= "00000")) then
        stop_on_err <= '1';
      end if;
    end if;
  end process;

-- CHECKS FOR FIFO
  process(RESET_RD, RD_CLK)
  begin
      if(RESET_RD = '1') then
        post_rst_dly_rd <= "11111";
      elsif rising_edge(RD_CLK) then
        post_rst_dly_rd <= post_rst_dly_rd-post_rst_dly_rd(4);
      end if;
  end process;

  process(RESET_WR, WR_CLK)
  begin
      if(RESET_WR = '1') then
        post_rst_dly_wr <= "11111";
      elsif rising_edge(WR_CLK) then
        post_rst_dly_wr <= post_rst_dly_wr-post_rst_dly_wr(4);
      end if;
  end process;

 dinw_gt_doutw: if (C_DIN_WIDTH > C_DOUT_WIDTH) generate
 begin 
     process(RESET_WR, WR_CLK)
     begin
         if(RESET_WR = '1') then
           wrw_gt_rdw <= std_logic_vector(to_unsigned(1,D_WIDTH_DIFF));
         elsif rising_edge(WR_CLK) then
           if(rd_en_wr_dom2 = '1'  and  (wr_en_i = '1')  and  FULL = '1') then
             wrw_gt_rdw <= wrw_gt_rdw + 1;
           end if;
         end if;
     end process;
 end generate;

-- FULL de-assert Counter
  process(RESET_WR, WR_CLK)
  begin
      if(RESET_WR = '1') then
        full_ds_timeout <= (others => '0');
      elsif rising_edge(WR_CLK) then
        if(state = '1') then
          if(rd_en_wr_dom2 = '1' and  ( wr_en_i = '0')  and  FULL = '1'  and  ( and wrw_gt_rdw) = '1') then
            full_ds_timeout <= full_ds_timeout + '1';
          else
            full_ds_timeout <= (others => '0');
          end if;
        end if;
      end if;
  end process;
 
 g_doutw_gt_dinw: if (C_DIN_WIDTH < C_DOUT_WIDTH) generate
 begin 
     process(RESET_RD, RD_CLK)
     begin
         if(RESET_RD = '1') then
           rdw_gt_wrw <= std_logic_vector(to_unsigned(1,D_WIDTH_DIFF));
         elsif rising_edge(RD_CLK) then
           if(wr_en_rd_dom2 = '1'  and  (rd_en_i = '0')  and  EMPTY = '1') then
             rdw_gt_wrw <= rdw_gt_wrw + '1';
           end if;
         end if;
     end process;
 end generate;
-- EMPTY deassert counter
  process(RESET_RD, RD_CLK)
  begin
    if(RESET_RD = '1') then
      empty_ds_timeout <= (others => '0');
    elsif rising_edge(RD_CLK) then
        if(state_rd_dom2 = '0') then
          if(wr_en_rd_dom2 = '1'  and  (rd_en_i = '0')  and  EMPTY = '1' and  ( and rdw_gt_wrw) = '1') then
            empty_ds_timeout <= empty_ds_timeout + '1';
          else
             empty_ds_timeout <= (others => '0');
          end if;
        end if;
    end if;
  end process;

-- Full check signal generation
  process(RESET_WR, WR_CLK)
  begin
    if(RESET_WR = '1') then
      full_chk_i <= '0';
    elsif rising_edge(WR_CLK) then
      if(C_APPLICATION_TYPE = 1) then
        full_chk_i <= '0';
      else
        full_chk_i <= ( and full_as_timeout)  or  ( and full_ds_timeout);
      end if;
    end if;
  end process;

-- Empty checks
  process(RESET_RD, RD_CLK)
  begin
    if(RESET_RD = '1') then
      empty_chk_i <= '0';
    elsif rising_edge(RD_CLK) then
      if(C_APPLICATION_TYPE = 1) then
        empty_chk_i <= '0';
      else
        empty_chk_i <= ( and empty_as_timeout)  or  ( and empty_ds_timeout);
      end if;
    end if;
  end process;

  fifo_d_chk: if(C_CH_TYPE /= 2) generate
  begin
     PRC_WR_EN  <= prc_we_i ;
     PRC_RD_EN  <= prc_re_i ;
     data_chk_i <= DOUT_CHK;
  end generate;

-- SYNCHRONIZERS B/W WRITE AND READ DOMAINS
  process(RESET_WR, WR_CLK)
  begin
     if(RESET_WR = '1') then
       empty_wr_dom1     <= '1';
       empty_wr_dom2     <= '1';
       state_d1          <= '0';
       wr_en_d1          <= '0';
       rd_en_wr_dom1     <= '0';
       rd_en_wr_dom2     <= '0';
       full_chk_d1       <= '0';
       reset_en_d1       <= '0';
       sim_done_wr_dom1  <= '0';
       sim_done_wr_dom2  <= '0';
     elsif rising_edge(WR_CLK) then
       sim_done_wr_dom1  <= sim_done_d1;
       sim_done_wr_dom2  <= sim_done_wr_dom1;
       reset_en_d1       <= reset_en_i;
       state_d1          <= state;
       empty_wr_dom1     <= empty_d1;
       empty_wr_dom2     <= empty_wr_dom1;
       wr_en_d1          <= wr_en_i;
       rd_en_wr_dom1     <= rd_en_d1;
       rd_en_wr_dom2     <= rd_en_wr_dom1;
       full_chk_d1       <= full_chk_i;
     end if;
   end process;

  process(RESET_RD, RD_CLK)
  begin
     if(RESET_RD = '1') then
         empty_d1           <= '1';
         state_rd_dom1      <= '0';
         state_rd_dom2      <= '0';
         state_rd_dom3      <= '0';
         wr_en_rd_dom1      <= '0';
         wr_en_rd_dom2      <= '0';
         rd_en_d1           <= '0';
         full_chk_rd_dom1   <= '0';
         full_chk_rd_dom2   <= '0';
         reset_en_rd_dom1   <= '0';
         reset_en_rd_dom2   <= '0';
         sim_done_d1        <= '0';
     elsif rising_edge(RD_CLK) then
         sim_done_d1        <= sim_done_i;
         reset_en_rd_dom1   <= reset_en_d1;
         reset_en_rd_dom2   <= reset_en_rd_dom1;
         empty_d1           <= EMPTY;
         rd_en_d1           <= rd_en_i;
         state_rd_dom1      <= state_d1;
         state_rd_dom2      <= state_rd_dom1;
         state_rd_dom3      <= state_rd_dom2;
         wr_en_rd_dom1      <= wr_en_d1;
         wr_en_rd_dom2      <= wr_en_rd_dom1;
         full_chk_rd_dom1   <= full_chk_d1;
         full_chk_rd_dom2   <= full_chk_rd_dom1;
     end if;
  end process;
   
   RESET_EN <= reset_en_rd_dom2;
 

   data_fifo_en: if(C_CH_TYPE /= 2) generate
   begin
   -- WR_EN GENERATION
   gen_rand_wr_en: entity work.xpm_fifo_gen_rng 
   generic map(
     WIDTH => 8,
     SEED  => TB_SEED+1
   )
   port map(
      clk        => WR_CLK,
      rst        => RESET_WR,
      random_num => wr_en_gen,
      enable     => '1'
   );

  process(RESET_WR, WR_CLK)
  begin
      if(RESET_WR = '1') then
        wr_en_i   <=  '0';
      elsif rising_edge(WR_CLK) then
        if(state = '1') then
          wr_en_i <= wr_en_gen(0)  and  wr_en_gen(7)  and  wr_en_gen(2)  and  wr_control;
        else
          wr_en_i <= (wr_en_gen(3)  or  wr_en_gen(4)  or  wr_en_gen(2))  and  (not post_rst_dly_wr(4)); 
        end if;
      end if;
  end process;
    
  -- WR_EN CONTROL
  process(RESET_WR, WR_CLK)
  begin
      if(RESET_WR = '1') then
        wr_cntr         <= (others => '0');
        wr_control      <= '1';
        full_as_timeout <= (others => '0');
      elsif rising_edge(WR_CLK) then
       if(state = '1') then
        if(wr_en_i = '1') then
          wr_cntr <= wr_cntr + '1';
        end if;
        full_as_timeout <= (others => '0');
       else
        wr_cntr <= (others => '0');
        if(rd_en_wr_dom2 = '0') then
          if(wr_en_i) then
               full_as_timeout <= full_as_timeout + '1';
          end if;
        else 
          full_as_timeout <= (others => '0');
        end if;
       end if;
       wr_control <= not wr_cntr(C_WR_PNTR_WIDTH-2);
      end if;
  end process;

  -- RD_EN GENERATION
    gen_rand_rd_en: entity work.xpm_fifo_gen_rng 
    generic map(
       WIDTH => 8,
       SEED  => TB_SEED
    )
    port map(
      clk        => RD_CLK,
      rst        => RESET_RD,
      random_num => rd_en_gen,
      enable     => '1'
    );

  process(RESET_RD, RD_CLK)
  begin
      if(RESET_RD = '1') then
        rd_en_i    <= '0';
      elsif rising_edge(RD_CLK) then
        if(state_rd_dom2 = '0') then
           rd_en_i <= rd_en_gen(1)  and  rd_en_gen(5)  and  rd_en_gen(3)  and  rd_control  and  (not post_rst_dly_rd(4));
        else
          rd_en_i <= rd_en_gen(0)  or  rd_en_gen(6);
        end if;
      end if;
  end process;

 -- RD_EN CONTROL
  process(RESET_RD, RD_CLK)
  begin
      if(RESET_RD = '1') then
        rd_cntr    <= (others => '0');
        rd_control <= '1';
        empty_as_timeout <= (others => '0');
      elsif rising_edge(RD_CLK) then
        if(state_rd_dom2 = '0') then
         if(rd_en_i = '1') then
           rd_cntr <= rd_cntr + '1';
         end if;
         empty_as_timeout <= (others => '0');
       else
         rd_cntr <= (others => '0');
         if(wr_en_rd_dom2 = '0') then
           if(rd_en_i = '1') then
               empty_as_timeout <= empty_as_timeout + '1';
           end if;
         else 
           empty_as_timeout <= (others => '0');
         end if;
        end if;
        rd_control <= not rd_cntr(C_RD_PNTR_WIDTH-2);
      end if;
  end process;

  -- STIMULUS CONTROL
  process(RESET_WR, RD_CLK)
  begin
      if(RESET_WR = '1') then
        state      <= '0';
        reset_en_i <= '0';
      elsif rising_edge(RD_CLK) then
        if(state = '0') then
          if(FULL = '1'  and  empty_wr_dom2 = '0') then
              state   <= '1';
          end if;
          reset_en_i <= '0';
        elsif(state = '1') then
          if(empty_wr_dom2 = '1' and  FULL = '0') then
              state       <= '0';
          end if;
          reset_en_i <= '1';
        else
          state <= state;
        end if;
      end if;
   end process;
end generate;


end tb;-- : xpm_fifo_gen_pctrl
