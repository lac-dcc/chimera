--*****************************************************************************
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor             : Xilinx
-- \   \   \/     Version            : 3.92
--  \   \         Application        : MIG
--  /   /         Filename           : memc3_infrastructure.vhd
-- /___/   /\     Date Last Modified : $Date: 2011/06/02 07:16:56 $
-- \   \  /  \    Date Created       : Jul 03 2009
--  \___\/\___\
--
--Device           : Spartan-6
--Design Name      : DDR/DDR2/DDR3/LPDDR
--Purpose          : Clock generation/distribution and reset synchronization
--Reference        :
--Revision History :
--*****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity memc3_infrastructure is
generic
  (
    C_INCLK_PERIOD     : integer := 2500;
    C_RST_ACT_LOW      : integer := 1;
    C_INPUT_CLK_TYPE   : string  := "DIFFERENTIAL";
    C_CLKOUT0_DIVIDE   : integer := 1;
    C_CLKOUT1_DIVIDE   : integer := 1;
    C_CLKOUT2_DIVIDE   : integer := 16;
    C_CLKOUT3_DIVIDE   : integer := 8;
    C_CLKFBOUT_MULT   : integer := 2;
    C_DIVCLK_DIVIDE   : integer := 1

  );
port
(
    sys_clk_p       : in std_logic;
    sys_clk_n       : in std_logic;
    sys_clk       : in std_logic;
    sys_rst_i       : in std_logic;
    clk0            : out std_logic;
    rst0            : out std_logic;
    async_rst       : out std_logic;
    sysclk_2x       : out std_logic;
    sysclk_2x_180   : out std_logic;
    mcb_drp_clk     : out std_logic;
    pll_ce_0        : out std_logic;
    pll_ce_90       : out std_logic;
    pll_lock        : out std_logic
  
);
end entity;
architecture syn of memc3_infrastructure is

  -- # of clock cycles to delay deassertion of reset. Needs to be a fairly
  -- high number not so much for metastability protection, but to give time
  -- for reset (i.e. stable clock cycles) to propagate through all state
  -- machines and to all control signals (i.e. not all control signals have
  -- resets, instead they rely on base state logic being reset, and the effect
  -- of that reset propagating through the logic). Need this because we may not
  -- be getting stable clock cycles while reset asserted (i.e. since reset
  -- depends on PLL/DCM lock status)

  constant RST_SYNC_NUM   : integer := 25;
  constant CLK_PERIOD_NS  : real := (real(C_INCLK_PERIOD)) / 1000.0;
  constant CLK_PERIOD_INT : integer := C_INCLK_PERIOD/1000;


  signal   clk_2x_0            : std_logic;
  signal   clk_2x_180          : std_logic;
  signal   clk0_bufg           : std_logic;
  signal   clk0_bufg_in        : std_logic;
  signal   mcb_drp_clk_bufg_in : std_logic;
  signal   clkfbout_clkfbin    : std_logic;
  signal   rst_tmp             : std_logic;
  signal   sys_clk_ibufg       : std_logic;
  signal   sys_rst             : std_logic;
  signal   rst0_sync_r         : std_logic_vector(RST_SYNC_NUM-1 downto 0);
  signal   powerup_pll_locked  : std_logic;
  signal   syn_clk0_powerup_pll_locked : std_logic;
  signal   locked              : std_logic;
  signal   bufpll_mcb_locked   : std_logic;
  signal   mcb_drp_clk_sig     : std_logic;

  attribute max_fanout : string;
  attribute syn_maxfan : integer;
  attribute KEEP : string; 
  attribute max_fanout of rst0_sync_r : signal is "10";
  attribute syn_maxfan of rst0_sync_r : signal is 10;
  attribute KEEP of sys_clk_ibufg     : signal is "TRUE";

begin 

  sys_rst  <= not(sys_rst_i) when (C_RST_ACT_LOW /= 0) else sys_rst_i;
  clk0     <= clk0_bufg;
  pll_lock <= bufpll_mcb_locked;
  mcb_drp_clk <= mcb_drp_clk_sig;

  diff_input_clk : if(C_INPUT_CLK_TYPE = "DIFFERENTIAL") generate   
      --***********************************************************************
      -- Differential input clock input buffers
      --***********************************************************************
      u_ibufg_sys_clk : IBUFGDS
        generic map (
          DIFF_TERM => TRUE		    
        )
        port map (
          I  => sys_clk_p,
          IB => sys_clk_n,
          O  => sys_clk_ibufg
          );
  end generate;   
  
  
  se_input_clk : if(C_INPUT_CLK_TYPE = "SINGLE_ENDED") generate   
      --***********************************************************************
      -- SINGLE_ENDED input clock input buffers
      --***********************************************************************
      u_ibufg_sys_clk : IBUFG
        port map (
          I  => sys_clk,
          O  => sys_clk_ibufg
          );
  end generate;   

  --***************************************************************************
  -- Global clock generation and distribution
  --***************************************************************************

    u_pll_adv : PLL_ADV 
    generic map 
        (
         BANDWIDTH          => "OPTIMIZED",
         CLKIN1_PERIOD      => CLK_PERIOD_NS,
         CLKIN2_PERIOD      => CLK_PERIOD_NS,
         CLKOUT0_DIVIDE     => C_CLKOUT0_DIVIDE,
         CLKOUT1_DIVIDE     => C_CLKOUT1_DIVIDE,
         CLKOUT2_DIVIDE     => C_CLKOUT2_DIVIDE,
         CLKOUT3_DIVIDE     => C_CLKOUT3_DIVIDE,
         CLKOUT4_DIVIDE     => 1,
         CLKOUT5_DIVIDE     => 1,
         CLKOUT0_PHASE      => 0.000,
         CLKOUT1_PHASE      => 180.000,
         CLKOUT2_PHASE      => 0.000,
         CLKOUT3_PHASE      => 0.000,
         CLKOUT4_PHASE      => 0.000,
         CLKOUT5_PHASE      => 0.000,
         CLKOUT0_DUTY_CYCLE => 0.500,
         CLKOUT1_DUTY_CYCLE => 0.500,
         CLKOUT2_DUTY_CYCLE => 0.500,
         CLKOUT3_DUTY_CYCLE => 0.500,
         CLKOUT4_DUTY_CYCLE => 0.500,
         CLKOUT5_DUTY_CYCLE => 0.500,
	 SIM_DEVICE         => "SPARTAN6",
         COMPENSATION       => "INTERNAL",
         DIVCLK_DIVIDE      => C_DIVCLK_DIVIDE,
         CLKFBOUT_MULT      => C_CLKFBOUT_MULT,
         CLKFBOUT_PHASE     => 0.0,
         REF_JITTER         => 0.005000
         )
        port map
          (
           CLKFBIN          => clkfbout_clkfbin,
           CLKINSEL         => '1',
           CLKIN1           => sys_clk_ibufg,
           CLKIN2           => '0',
           DADDR            => (others => '0'),
           DCLK             => '0',
           DEN              => '0',
           DI               => (others => '0'),
           DWE              => '0',
           REL              => '0',
           RST              => sys_rst,
           CLKFBDCM         => open,
           CLKFBOUT         => clkfbout_clkfbin,
           CLKOUTDCM0       => open,
           CLKOUTDCM1       => open,
           CLKOUTDCM2       => open,
           CLKOUTDCM3       => open,
           CLKOUTDCM4       => open,
           CLKOUTDCM5       => open,
           CLKOUT0          => clk_2x_0,
           CLKOUT1          => clk_2x_180,
           CLKOUT2          => clk0_bufg_in,
           CLKOUT3          => mcb_drp_clk_bufg_in,
           CLKOUT4          => open,
           CLKOUT5          => open,
           DO               => open,
           DRDY             => open,
           LOCKED           => locked
           );

    U_BUFG_CLK0 : BUFG
    port map
    (
     O => clk0_bufg,
     I => clk0_bufg_in
     );

   --U_BUFG_CLK1 : BUFG 
   -- port map (  
   --  O => mcb_drp_clk_sig,
   --  I => mcb_drp_clk_bufg_in
   --  );

   U_BUFG_CLK1 : BUFGCE 
    port map (  
     O => mcb_drp_clk_sig,
     I => mcb_drp_clk_bufg_in,
     CE => locked
     );

   process (mcb_drp_clk_sig, sys_rst)
   begin
      if(sys_rst = '1') then
         powerup_pll_locked <= '0';
      elsif (mcb_drp_clk_sig'event and mcb_drp_clk_sig = '1') then
         if (bufpll_mcb_locked = '1') then
            powerup_pll_locked <= '1';
         end if;
      end if;
   end process;      


   process (clk0_bufg, sys_rst)
   begin
      if(sys_rst = '1') then
         syn_clk0_powerup_pll_locked <= '0';
      elsif (clk0_bufg'event and clk0_bufg = '1') then
         if (bufpll_mcb_locked = '1') then
            syn_clk0_powerup_pll_locked <= '1';
         end if;
      end if;
   end process;      


   --***************************************************************************
   -- Reset synchronization
   -- NOTES:
   --   1. shut down the whole operation if the PLL hasn't yet locked (and
   --      by inference, this means that external sys_rst has been asserted -
   --      PLL deasserts LOCKED as soon as sys_rst asserted)
   --   2. asynchronously assert reset. This was we can assert reset even if
   --      there is no clock (needed for things like 3-stating output buffers).
   --      reset deassertion is synchronous.
   --   3. asynchronous reset only look at pll_lock from PLL during power up. After
   --      power up and pll_lock is asserted, the powerup_pll_locked will be asserted
   --      forever until sys_rst is asserted again. PLL will lose lock when FPGA 
   --      enters suspend mode. We don't want reset to MCB get
   --      asserted in the application that needs suspend feature.
   --***************************************************************************


  async_rst <= sys_rst or not(powerup_pll_locked);
  -- async_rst <= rst_tmp;
  rst_tmp <= sys_rst or not(syn_clk0_powerup_pll_locked);
  -- rst_tmp <= sys_rst or not(powerup_pll_locked);

process (clk0_bufg, rst_tmp)
  begin
    if (rst_tmp = '1') then
      rst0_sync_r <= (others => '1');
    elsif (rising_edge(clk0_bufg)) then      
      rst0_sync_r <= rst0_sync_r(RST_SYNC_NUM-2 downto 0) & '0';  -- logical left shift by one (pads with 0)
    end if;
  end process;

  rst0    <= rst0_sync_r(RST_SYNC_NUM-1);


BUFPLL_MCB_INST : BUFPLL_MCB
port map
( IOCLK0         => sysclk_2x,	
  IOCLK1         => sysclk_2x_180, 
  LOCKED         => locked,
  GCLK           => mcb_drp_clk_sig,
  SERDESSTROBE0  => pll_ce_0, 
  SERDESSTROBE1  => pll_ce_90, 
  PLLIN0         => clk_2x_0,  
  PLLIN1         => clk_2x_180,
  LOCK           => bufpll_mcb_locked 
  );

end architecture syn;

