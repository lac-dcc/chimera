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

entity xpm_fifo_rst is
generic (
  COMMON_CLOCK     : integer := 1;
  CDC_DEST_SYNC_FF : integer := 2;
  SIM_ASSERT_CHK   : integer := 0

);
port (
  rst         : in  std_logic;
  wr_clk      : in  std_logic;
  rd_clk      : in  std_logic;
  wr_rst      : out std_logic;
  rd_rst      : out std_logic;
  wr_rst_busy : out std_logic;
  rd_rst_busy : out std_logic
);
end xpm_fifo_rst;

architecture rtl of xpm_fifo_rst is
  signal power_on_rst : std_logic_vector(1 downto 0) := "11";
  signal rst_i : std_logic;
begin

    -- -------------------------------------------------------------------------------------------------------------------
    -- Reset Logic
    -- -------------------------------------------------------------------------------------------------------------------
    --Keeping the power on reset to work even when the input reset(to xpm_fifo) is not applied or not using
    process(wr_clk)
    begin
      if rising_edge(wr_clk) then
        power_on_rst <= power_on_rst(0) & '0';
      end if;
    end process;
    
    rst_i <= power_on_rst(1) or rst;

  -- Write and read reset generation for common clock FIFO
   gen_rst_cc: if (COMMON_CLOCK = 1) generate
     signal fifo_wr_rst_cc : std_logic_vector(2 downto 0) := "000";
   begin
     wr_rst        <= fifo_wr_rst_cc(2);
     rd_rst        <= fifo_wr_rst_cc(2);
     rd_rst_busy   <= fifo_wr_rst_cc(2);
     wr_rst_busy   <= fifo_wr_rst_cc(2);

 -- synthesis translate_off
     assert_rst: if (SIM_ASSERT_CHK = 1) generate
       process(wr_clk) 
       begin
         if rising_edge(wr_clk) then
           assert (rst = '1' or rst = '0') report ("Input port 'rst' has unknown value 'X' or 'Z' at "& time'image(now)&". This may cause the outputs of FIFO to be 'X' or 'Z' in simulation. Ensure 'rst' has a valid value ('0' or '1')") severity warning;
         end if;
       end process;
     end generate assert_rst;
 -- synthesis translate_on

    process(wr_clk, rst_i)
    begin
      if (rst_i = '1') then
        fifo_wr_rst_cc    <= "111";
      elsif rising_edge(wr_clk) then
      fifo_wr_rst_cc   <= fifo_wr_rst_cc(1 downto 0) & '0';
      end if;
    end process;
  end generate gen_rst_cc;

  -- Write and read reset generation for independent clock FIFO
  gen_rst_ic : if (COMMON_CLOCK = 0) generate
    signal fifo_wr_rst_rd : std_logic;
    signal fifo_rd_rst_wr_i : std_logic;
    signal fifo_wr_rst_i       : std_logic := '0';
    signal wr_rst_busy_i       : std_logic := '0';
    signal fifo_rd_rst_i       : std_logic := '0';
    signal fifo_rd_rst_ic      : std_logic := '0';
    signal fifo_wr_rst_ic      : std_logic := '0';
    signal wr_rst_busy_ic      : std_logic := '0';
    signal rst_seq_reentered   : std_logic := '0';
    type WRST_TYPE is (
      WRST_IDLE,   --"000"
      WRST_IN,     --"010"
      WRST_OUT,    --"111"
      WRST_EXIT,   --"110"
      WRST_GO2IDLE --"100"
    );
    signal curr_wrst_state, next_wrst_state : WRST_TYPE := WRST_IDLE;
    type RRST_TYPE is (
      RRST_IDLE, --"00"
      RRST_IN,   --"10"
      RRST_OUT,  --"11"
      RRST_EXIT  --"01"
    );
    signal curr_rrst_state , next_rrst_state : RRST_TYPE := RRST_IDLE;
  begin

     wr_rst          <= fifo_wr_rst_ic or wr_rst_busy_ic;
     rd_rst          <= fifo_rd_rst_ic;
     rd_rst_busy     <= fifo_rd_rst_ic;
     wr_rst_busy     <= wr_rst_busy_ic;

   -- synthesis translate_off
     assert_rst: if (SIM_ASSERT_CHK = 1) generate
       process(wr_clk) 
       begin
         if rising_edge(wr_clk) then
           assert (rst = '1' or rst = '0') report ("Input port 'rst' has unknown value 'X' or 'Z' at "& time'image(now)&". This may cause the outputs of FIFO to be 'X' or 'Z' in simulation. Ensure 'rst' has a valid value ('0' or '1')") severity warning;
         end if;
       end process;
     end generate assert_rst;

   -- synthesis translate_on

   process(wr_clk, rst_i)
   begin
     if (rst_i = '1') then
       rst_seq_reentered  <= '0';
     elsif rising_edge(wr_clk) then
       if (curr_wrst_state = WRST_GO2IDLE) then
         rst_seq_reentered  <= '1';
       end if;
     end if;
   end process;

   process(curr_wrst_state, rst_i, fifo_rd_rst_wr_i, rst, rst_seq_reentered)
   begin
      case (curr_wrst_state) is
         when WRST_IDLE =>
            if (rst_i = '1') then
               next_wrst_state     <= WRST_IN;
            else
               next_wrst_state     <= WRST_IDLE;
            end if;
         when WRST_IN =>
            if (rst_i = '1') then
               next_wrst_state     <= WRST_IN;
            elsif (fifo_rd_rst_wr_i = '1') then
               next_wrst_state     <= WRST_OUT;
            else
               next_wrst_state     <= WRST_IN;
            end if;
         when WRST_OUT =>
            if (rst_i = '1') then
               next_wrst_state     <= WRST_IN;
            elsif (fifo_rd_rst_wr_i = '0') then
               next_wrst_state     <= WRST_EXIT;
            else
               next_wrst_state     <= WRST_OUT;
            end if;
         when WRST_EXIT =>
            if (rst_i = '1') then
               next_wrst_state     <= WRST_IN;
            elsif (rst = '0' and rst_seq_reentered = '0') then
               next_wrst_state     <= WRST_GO2IDLE;
            elsif (rst_seq_reentered = '1') then
               next_wrst_state     <= WRST_IDLE;
            else
               next_wrst_state     <= WRST_EXIT;
            end if;
         when WRST_GO2IDLE =>
           next_wrst_state     <= WRST_IN;
         when others =>
           next_wrst_state  <= WRST_IDLE;
      end case;
   end process;

   process(wr_clk)
   begin
     if rising_edge(wr_clk) then
       curr_wrst_state     <= next_wrst_state;
       fifo_wr_rst_ic      <= fifo_wr_rst_i;
       wr_rst_busy_ic      <= wr_rst_busy_i;
     end if;
   end process;

   process(curr_wrst_state, rst_i, fifo_wr_rst_ic)
   begin
      case (curr_wrst_state) is
         when WRST_IDLE     => fifo_wr_rst_i <= rst_i;
         when WRST_IN       => fifo_wr_rst_i <= '1';
         when WRST_OUT      => fifo_wr_rst_i <= '0';
         when WRST_EXIT     => fifo_wr_rst_i <= '0';
         when WRST_GO2IDLE  => fifo_wr_rst_i <= '1';
         when others        => fifo_wr_rst_i <= fifo_wr_rst_ic;
      end case;
   end process;

   process(curr_wrst_state, rst_i, wr_rst_busy_ic)
   begin
      case (curr_wrst_state) is
         when WRST_IDLE     => wr_rst_busy_i <= rst_i;
         when WRST_IN       => wr_rst_busy_i <= '1';
         when WRST_OUT      => wr_rst_busy_i <= '1';
         when WRST_EXIT     => wr_rst_busy_i <= '1';
         when others        => wr_rst_busy_i <= wr_rst_busy_ic;
      end case;
   end process;

   process(curr_rrst_state, fifo_wr_rst_rd)
   begin
      case (curr_rrst_state) is
         when RRST_IDLE =>
            if (fifo_wr_rst_rd = '1') then
               next_rrst_state      <= RRST_IN;
            else
               next_rrst_state      <= RRST_IDLE;
            end if;
         when RRST_IN  =>
            next_rrst_state <= RRST_OUT;
         when RRST_OUT =>
            if (fifo_wr_rst_rd = '0') then
               next_rrst_state      <= RRST_EXIT;
            else
               next_rrst_state      <= RRST_OUT;
            end if;
         when RRST_EXIT =>
            next_rrst_state <= RRST_IDLE;
         when others    =>
            next_rrst_state   <= RRST_IDLE;
      end case;
   end process;

   process(rd_clk)
   begin
     if rising_edge(rd_clk) then
       curr_rrst_state  <= next_rrst_state;
       fifo_rd_rst_ic   <= fifo_rd_rst_i;
     end if;
   end process;

   process(curr_rrst_state, fifo_wr_rst_rd)
   begin
      case (curr_rrst_state) is
         when RRST_IDLE => fifo_rd_rst_i <= fifo_wr_rst_rd;
         when RRST_IN   => fifo_rd_rst_i <= '1';
         when RRST_OUT  => fifo_rd_rst_i <= '1';
         when RRST_EXIT => fifo_rd_rst_i <= '0';
         when others    => fifo_rd_rst_i <= '0';
      end case;
   end process;

    -- Synchronize the wr_rst (fifo_wr_rst_ic) in read clock domain
    wrst_rd_inst: entity work.xpm_cdc_sync_rst 
    generic map(
      DEST_SYNC_FF      => CDC_DEST_SYNC_FF,
      INIT              => 0,
      INIT_SYNC_FF      => 1,
      SIM_ASSERT_CHK    => 0
    )
    port map(
      src_rst         => fifo_wr_rst_ic,
      dest_clk        => rd_clk,
      dest_rst        => fifo_wr_rst_rd
    );

    -- Synchronize the rd_rst (fifo_rd_rst_ic) in write clock domain
    rrst_wr_inst: entity work.xpm_cdc_sync_rst 
    generic map(
      DEST_SYNC_FF      => CDC_DEST_SYNC_FF,
      INIT              => 0,
      INIT_SYNC_FF      => 1,
      SIM_ASSERT_CHK    => 0
    )
    port map(
      src_rst         => fifo_rd_rst_ic,
      dest_clk        => wr_clk,
      dest_rst        => fifo_rd_rst_wr_i
    );
      
  end generate gen_rst_ic;
end rtl;
