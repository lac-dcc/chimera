-- Main testbench for the HyperRAM controller.
-- This closely mimics the MEGA65 top level file, except that
-- clocks are generated directly, instead of via MMCM.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture simulation of tb is

   constant C_DELAY         : time := 1 ns;
   constant C_CLK_PERIOD    : time := 10 ns; -- 100 MHz

   signal sys_clk           : std_logic := '1';
   signal sys_rstn          : std_logic := '0';

   signal clk               : std_logic;
   signal clk_del           : std_logic;
   signal delay_refclk      : std_logic;
   signal rst               : std_logic;

   signal tb_start          : std_logic;

   -- Statistics
   signal count_long        : unsigned(31 downto 0);
   signal count_short       : unsigned(31 downto 0);

   signal sys_resetn        : std_logic;
   signal sys_csn           : std_logic;
   signal sys_ck            : std_logic;
   signal sys_rwds          : std_logic;
   signal sys_dq            : std_logic_vector(7 downto 0);
   signal sys_rwds_in       : std_logic;
   signal sys_dq_in         : std_logic_vector(7 downto 0);
   signal sys_rwds_out      : std_logic;
   signal sys_dq_out        : std_logic_vector(7 downto 0);
   signal sys_rwds_oe       : std_logic;
   signal sys_dq_oe         : std_logic;

   -- HyperRAM simulation device interface
   signal hr_resetn         : std_logic;
   signal hr_csn            : std_logic;
   signal hr_ck             : std_logic;
   signal hr_rwds           : std_logic;
   signal hr_dq             : std_logic_vector(7 downto 0);


   component s27kl0642 is
      port (
         DQ7      : inout std_logic;
         DQ6      : inout std_logic;
         DQ5      : inout std_logic;
         DQ4      : inout std_logic;
         DQ3      : inout std_logic;
         DQ2      : inout std_logic;
         DQ1      : inout std_logic;
         DQ0      : inout std_logic;
         RWDS     : inout std_logic;
         CSNeg    : in    std_logic;
         CK       : in    std_logic;
         CKn      : in    std_logic;
         RESETNeg : in    std_logic
      );
   end component s27kl0642;

begin

   ---------------------------------------------------------
   -- Generate clock and reset
   ---------------------------------------------------------

   sys_clk  <= not sys_clk after C_CLK_PERIOD/2;
   sys_rstn <= '0', '1' after 100 * C_CLK_PERIOD;

   clk_inst : entity work.clk
      port map (
         sys_clk_i      => sys_clk,
         sys_rstn_i     => sys_rstn,
         clk_o          => clk,
         clk_del_o      => clk_del,
         delay_refclk_o => delay_refclk,
         rst_o          => rst
      ); -- clk_inst


   --------------------------------------------------------
   -- Generate start signal for trafic generator
   --------------------------------------------------------

   p_tb_start : process
   begin
      tb_start <= '0';
      wait for 160 us;
      wait until clk = '1';
      tb_start <= '1';
      wait until clk = '1';
      tb_start <= '0';
      wait;
   end process p_tb_start;


   --------------------------------------------------------
   -- Instantiate core test generator
   --------------------------------------------------------

   i_core : entity work.core
      generic map (
         G_SYS_ADDRESS_SIZE  => 8,
         G_ADDRESS_SIZE      => 22,
         G_DATA_SIZE         => 16
      )
      port map (
         clk_i          => clk,
         clk_del_i      => clk_del,
         delay_refclk_i => delay_refclk,
         rst_i          => rst,
         start_i        => tb_start,
         count_long_o   => count_long,
         count_short_o  => count_short,
         hr_resetn_o    => sys_resetn,
         hr_csn_o       => sys_csn,
         hr_ck_o        => sys_ck,
         hr_rwds_io     => sys_rwds,
         hr_dq_io       => sys_dq
      ); -- i_core


   ---------------------------------------------------------
   -- Connect controller to device (with delay)
   ---------------------------------------------------------

   hr_resetn <= sys_resetn after C_DELAY;
   hr_csn    <= sys_csn    after C_DELAY;
   hr_ck     <= sys_ck     after C_DELAY;

   i_wiredelay2_rwds : entity work.wiredelay2
      generic map (
         G_DELAY => C_DELAY
      )
      port map (
         A => sys_rwds,
         B => hr_rwds
      );

   gen_dq_delay : for i in 0 to 7 generate
   i_wiredelay2_rwds : entity work.wiredelay2
      generic map (
         G_DELAY => C_DELAY
      )
      port map (
         A => sys_dq(i),
         B => hr_dq(i)
      );
   end generate gen_dq_delay;


   ---------------------------------------------------------
   -- Instantiate HyperRAM simulation model
   ---------------------------------------------------------

   i_s27kl0642 : s27kl0642
      port map (
         DQ7      => hr_dq(7),
         DQ6      => hr_dq(6),
         DQ5      => hr_dq(5),
         DQ4      => hr_dq(4),
         DQ3      => hr_dq(3),
         DQ2      => hr_dq(2),
         DQ1      => hr_dq(1),
         DQ0      => hr_dq(0),
         RWDS     => hr_rwds,
         CSNeg    => hr_csn,
         CK       => hr_ck,
         CKn      => not hr_ck,
         RESETNeg => hr_resetn
      ); -- i_s27kl0642

end architecture simulation;

