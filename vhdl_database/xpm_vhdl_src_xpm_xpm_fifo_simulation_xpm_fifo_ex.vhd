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
use ieee.numeric_std_unsigned.all;
library std;
use std.env.all;
library xpm;
use xpm.vcomponents.all;

entity xpm_fifo_ex is 
generic(
  --testbench constants
  FREEZEON_ERROR       : integer := 0;
  TB_STOP_CNT          : integer := 2;
  TB_SEED              : integer := 20;
  -- Common module constants
  CLOCK_DOMAIN         : string := "COMMON";
  RELATED_CLOCKS       : integer := 0;
  FIFO_MEMORY_TYPE     : string := "BRAM";
  ECC_MODE             : string := "NO_ECC";
  FIFO_WRITE_DEPTH     : integer := 2048;
  WRITE_DATA_WIDTH     : integer := 32;
  WR_DATA_COUNT_WIDTH  : integer := 10;
  PROG_FULL_THRESH     : integer := 256;
  FULL_RESET_VALUE     : integer := 0;
  READ_MODE            : string := "STD";
  FIFO_READ_LATENCY    : integer := 1;
  READ_DATA_WIDTH      : integer := 32;
  RD_DATA_COUNT_WIDTH  : integer := 10;
  PROG_EMPTY_THRESH    : integer := 256;
  DOUT_RESET_VALUE     : string := "0";
  CDC_SYNC_STAGES      : integer := 2;
  WAKEUP_TIME          : integer := 0;
  VERSION              : integer := 0
);
port(
  rst : in std_logic;
  wr_clk : in std_logic;
  rd_clk: in std_logic;
  sim_done: out std_logic;
  status : out std_logic_vector(7 downto 0)
);

end xpm_fifo_ex;

architecture tb of xpm_fifo_ex is

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
  
  constant FIFO_READ_DEPTH  : integer := (FIFO_WRITE_DEPTH * WRITE_DATA_WIDTH)/(READ_DATA_WIDTH);
  constant WR_PNTR_WIDTH    : integer := clog2(FIFO_WRITE_DEPTH);
  constant RD_PNTR_WIDTH    : integer := clog2(FIFO_READ_DEPTH);
  function         FWFT_ENABLED return integer is
  begin
    if READ_MODE = "FWFT" then
        return 1;
    else
        return 0;
    end if;
  end function;

--reg-wire Decalrations
 signal    sleep     : std_logic := '0';
 signal    prog_full : std_logic := '0';
 signal    wr_data_count : std_logic_vector(WR_DATA_COUNT_WIDTH-1 downto 0) := (others => '0');
 signal    overflow: std_logic := '0';
 signal    wr_rst_busy: std_logic := '0';
 signal    prog_empty: std_logic := '0';
 signal    rd_data_count : std_logic_vector(RD_DATA_COUNT_WIDTH-1 downto 0) := (others => '0');
 signal    underflow: std_logic := '0';
 signal    rd_rst_busy: std_logic := '0';
 signal    injectsbiterr: std_logic := '0';
 signal    injectdbiterr: std_logic := '0';
 signal    sbiterr: std_logic := '0';
 signal    dbiterr: std_logic := '0';
-- FIFO interface signal declarations
 signal    wr_en  : std_logic := '0';
 signal    rd_en  : std_logic := '0';
 signal    din    : std_logic_vector(WRITE_DATA_WIDTH-1 downto 0) := (others => '0'); 
 signal    dout   : std_logic_vector(READ_DATA_WIDTH-1 downto 0)  := (others => '0'); 
 signal    dout_i : std_logic_vector(READ_DATA_WIDTH-1 downto 0)  := (others => '0'); 
 signal    full   : std_logic := '0'; 
 signal    empty  : std_logic := '0';

 signal    wr_data        : std_logic_vector(WRITE_DATA_WIDTH-1 downto 0) := (others => '0');
 signal    wr_en_i        : std_logic := '0';
 signal    rd_en_i        : std_logic := '0';
 signal    full_i         : std_logic := '0';
 signal    empty_i        : std_logic := '0';
 constant    almost_full_i  : std_logic := '0';
 constant    almost_empty_i : std_logic := '0';
 signal    prc_we_i       : std_logic := '0';
 signal    prc_re_i       : std_logic := '0';
 signal    dout_chk_i     : std_logic := '0';
 signal    rst_int_rd     : std_logic := '0';
 signal    rst_int_wr     : std_logic := '0';
 signal    reset_en       : std_logic := '0';

 signal    rst_async_wr1  : std_logic := '0';
 signal    rst_async_wr2  : std_logic := '0';
 signal    rst_async_wr3  : std_logic := '0';
 signal    rst_async_rd1  : std_logic := '0';
 signal    rst_async_rd2  : std_logic := '0';
 signal    rst_async_rd3  : std_logic := '0';
 signal    rd_clk_i       : std_logic := '0';

begin


    gen_xpm_fifo_sync: if (CLOCK_DOMAIN = "COMMON") generate
      xpm_fifo_sync_inst: xpm_fifo_sync 
      generic map (
        FIFO_MEMORY_TYPE    => FIFO_MEMORY_TYPE   ,
        ECC_MODE            => ECC_MODE           ,
        FIFO_WRITE_DEPTH    => FIFO_WRITE_DEPTH   ,
        WRITE_DATA_WIDTH    => WRITE_DATA_WIDTH   ,
        WR_DATA_COUNT_WIDTH => WR_DATA_COUNT_WIDTH,
        FULL_RESET_VALUE    => FULL_RESET_VALUE   ,
        PROG_FULL_THRESH    => PROG_FULL_THRESH   ,
        READ_MODE           => READ_MODE          ,
        FIFO_READ_LATENCY   => FIFO_READ_LATENCY  ,
        READ_DATA_WIDTH     => READ_DATA_WIDTH    ,
        RD_DATA_COUNT_WIDTH => RD_DATA_COUNT_WIDTH,
        PROG_EMPTY_THRESH   => PROG_EMPTY_THRESH  ,
        DOUT_RESET_VALUE    => DOUT_RESET_VALUE   ,
        WAKEUP_TIME         => WAKEUP_TIME        
      ) 
      port map (
        sleep            => sleep,
        rst              => rst,
        wr_clk           => wr_clk,
        wr_en            => wr_en,
        din              => din,
        full             => full,
        prog_full        => prog_full,
        wr_data_count    => wr_data_count,
        overflow         => overflow,
        wr_rst_busy      => wr_rst_busy,
        rd_en            => rd_en,
        dout             => dout,
        empty            => empty,
        prog_empty       => prog_empty,
        rd_data_count    => rd_data_count,
        underflow        => underflow,
        rd_rst_busy      => rd_rst_busy,
        injectsbiterr    => injectsbiterr,
        injectdbiterr    => injectdbiterr,
        sbiterr          => sbiterr,
        dbiterr          => dbiterr
      );
    end generate gen_xpm_fifo_sync;

    gen_xpm_fifo_async: if (CLOCK_DOMAIN = "INDEPENDENT") generate
      xpm_fifo_async_inst: xpm_fifo_async 
      generic map(
        FIFO_MEMORY_TYPE    => FIFO_MEMORY_TYPE  ,
        ECC_MODE            => ECC_MODE          ,
        RELATED_CLOCKS      => RELATED_CLOCKS    ,
        FIFO_WRITE_DEPTH    => FIFO_WRITE_DEPTH  ,
        WRITE_DATA_WIDTH    => WRITE_DATA_WIDTH  ,
        WR_DATA_COUNT_WIDTH => WR_DATA_COUNT_WIDTH,
        PROG_FULL_THRESH    => PROG_FULL_THRESH  ,
        FULL_RESET_VALUE    => FULL_RESET_VALUE  ,
        READ_MODE           => READ_MODE         ,
        FIFO_READ_LATENCY   => FIFO_READ_LATENCY ,
        READ_DATA_WIDTH     => READ_DATA_WIDTH   ,
        RD_DATA_COUNT_WIDTH => RD_DATA_COUNT_WIDTH,
        PROG_EMPTY_THRESH   => PROG_EMPTY_THRESH ,
        DOUT_RESET_VALUE    => DOUT_RESET_VALUE  ,
        CDC_SYNC_STAGES     => CDC_SYNC_STAGES   ,
        WAKEUP_TIME         => WAKEUP_TIME       
      )  
      port map(
        sleep            => sleep,
        rst              => rst,
        wr_clk           => wr_clk,
        wr_en            => wr_en,
        din              => din,
        full             => full,
        prog_full        => prog_full,
        wr_data_count    => wr_data_count,
        overflow         => overflow,
        wr_rst_busy      => wr_rst_busy,
        rd_clk           => rd_clk,
        rd_en            => rd_en,
        dout             => dout,
        empty            => empty,
        prog_empty       => prog_empty,
        rd_data_count    => rd_data_count,
        underflow        => underflow,
        rd_rst_busy      => rd_rst_busy,
        injectsbiterr    => injectsbiterr,
        injectdbiterr    => injectdbiterr,
        sbiterr          => sbiterr,
        dbiterr          => dbiterr
      );
    end generate gen_xpm_fifo_async;

  --Reset generation logic 
  rst_int_wr  <= rst_async_wr3;
  rst_int_rd  <= rst_async_rd3;

  --Testbench reset synchronization
  process(rst, rd_clk)
  begin
    if(rst = '1') then
      rst_async_rd1     <= '1';
      rst_async_rd2     <= '1';
      rst_async_rd3     <= '1';
    elsif rising_edge(rd_clk) then
      rst_async_rd1     <= rst;
      rst_async_rd2     <= rst_async_rd1;
      rst_async_rd3     <= rst_async_rd2;
    end if;
  end process;

  process(rst, wr_clk)
  begin
    if(rst = '1') then
      rst_async_wr1     <= '1';
      rst_async_wr2     <= '1';
      rst_async_wr3     <= '1';
    elsif rising_edge(wr_clk) then
      rst_async_wr1     <= rst;
      rst_async_wr2     <= rst_async_wr1;
      rst_async_wr3     <= rst_async_wr2;
    end if;
  end process;

   din      <= wr_data;
   dout_i   <= dout;
   wr_en    <= wr_en_i;
   rd_en    <= rd_en_i;
   full_i   <= full;
   empty_i  <= empty;
   
   g_rd_clk: if (CLOCK_DOMAIN = "COMMON") generate
    rd_clk_i <=  wr_clk;
   end generate;
   g_in_rd_clk: if (CLOCK_DOMAIN /= "COMMON") generate
    rd_clk_i <= rd_clk;
   end generate;

  xpm_dgen_inst: entity work.xpm_fifo_gen_dgen 
  generic map(
      C_DIN_WIDTH    => WRITE_DATA_WIDTH,
      C_DOUT_WIDTH   => READ_DATA_WIDTH,
      TB_SEED        => TB_SEED 
    )  
  port map(  
      rst        => rst_int_wr,
      wr_clk     => wr_clk,
      prc_wr_en  => prc_we_i,
      full       => full_i,
      wr_en      => wr_en_i,
      wr_data    => wr_data
    );

  xpm_fifo_dverif_inst: entity work.xpm_fifo_gen_dverif 
  generic map(
      C_DOUT_WIDTH       => READ_DATA_WIDTH,
      C_DIN_WIDTH        => WRITE_DATA_WIDTH,
      C_USE_EMBEDDED_REG => 1,
      TB_SEED            => TB_SEED,
      FWFT_ENABLED       => FWFT_ENABLED, 
      FIFO_READ_LATENCY  => FIFO_READ_LATENCY, 
      C_CH_TYPE          => 0
    ) 
  port map(
      rst        => rst_int_rd,
      rd_clk     => rd_clk_i,
      prc_rd_en  => prc_re_i,
      rd_en      => rd_en_i,
      empty      => empty_i,
      data_out   => dout,
      dout_chk   => dout_chk_i
    );

  xpm_fifo_pctrl_inst: entity work.xpm_fifo_gen_pctrl 
  generic map(
      C_APPLICATION_TYPE  => 0,
      C_DOUT_WIDTH        => READ_DATA_WIDTH,
      C_DIN_WIDTH         => WRITE_DATA_WIDTH,
      C_WR_PNTR_WIDTH     => WR_PNTR_WIDTH,
      C_RD_PNTR_WIDTH     => RD_PNTR_WIDTH,
      C_CH_TYPE           => 0,
      FREEZEON_ERROR      => FREEZEON_ERROR,
      TB_SEED             => TB_SEED, 
      TB_STOP_CNT         => TB_STOP_CNT
    ) 
  port map(
      RESET_WR       => rst_int_wr,
      RESET_RD       => rst_int_rd,
      RESET_EN       => reset_en,
      WR_CLK         => wr_clk,
      RD_CLK         => rd_clk_i,
      PRC_WR_EN      => prc_we_i,
      PRC_RD_EN      => prc_re_i,
      FULL           => full_i,
      ALMOST_FULL    => almost_full_i,
      ALMOST_EMPTY   => almost_empty_i,
      DOUT_CHK       => dout_chk_i,
      EMPTY          => empty_i,
      DATA_IN        => wr_data,
      DATA_OUT       => dout,
      SIM_DONE       => sim_done,
      STATUS         => status
    );
  
end tb;-- : xpm_fifo_ex 


