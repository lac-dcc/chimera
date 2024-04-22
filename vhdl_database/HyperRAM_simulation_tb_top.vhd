-- Main testbench for the HyperRAM controller.
-- This closely mimics the MEGA65 top level file, except that
-- clocks are generated directly, instead of via MMCM.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;

entity tb_top is
end entity tb_top;

architecture simulation of tb_top is

   constant C_DELAY : time := 1 ns;

   signal sys_clk   : std_logic := '1';
   signal sys_reset : std_logic := '1';

   signal sys_resetn   : std_logic;
   signal sys_csn      : std_logic;
   signal sys_ck       : std_logic;
   signal sys_rwds     : std_logic;
   signal sys_dq       : std_logic_vector(7 downto 0);
   signal sys_rwds_in  : std_logic;
   signal sys_dq_in    : std_logic_vector(7 downto 0);
   signal sys_rwds_out : std_logic;
   signal sys_dq_out   : std_logic_vector(7 downto 0);
   signal sys_rwds_oe  : std_logic;
   signal sys_dq_oe    : std_logic;

   -- HyperRAM simulation device interface
   signal hr_resetn : std_logic;
   signal hr_csn    : std_logic;
   signal hr_ck     : std_logic;
   signal hr_rwds   : std_logic;
   signal hr_dq     : std_logic_vector(7 downto 0);


   component s27kl0642 is
      port (
         dq7      : inout std_logic;
         dq6      : inout std_logic;
         dq5      : inout std_logic;
         dq4      : inout std_logic;
         dq3      : inout std_logic;
         dq2      : inout std_logic;
         dq1      : inout std_logic;
         dq0      : inout std_logic;
         rwds     : inout std_logic;
         csneg    : in    std_logic;
         ck       : in    std_logic;
         ckn      : in    std_logic;
         resetneg : in    std_logic
      );
   end component s27kl0642;

begin

   ---------------------------------------------------------
   -- Generate clock and reset
   ---------------------------------------------------------

   sys_clk   <= not sys_clk after 5 ns;
   sys_reset <= '1', '0' after 1000 ns;


   --------------------------------------------------------
   -- Instantiate DUT
   --------------------------------------------------------

   top_inst : entity work.top
      port map (
         clk         => sys_clk,
         reset       => sys_reset,
         hr_resetn   => sys_resetn,
         hr_csn      => sys_csn,
         hr_ck       => sys_ck,
         hr_rwds     => sys_rwds,
         hr_dq       => sys_dq,
         kb_io0      => open,
         kb_io1      => open,
         kb_io2      => '0',
         hdmi_data_p => open,
         hdmi_data_n => open,
         hdmi_clk_p  => open,
         hdmi_clk_n  => open
      ); -- top_inst


   ---------------------------------------------------------
   -- Connect controller to device (with delay)
   ---------------------------------------------------------

   hr_resetn <= sys_resetn after C_DELAY;
   hr_csn    <= sys_csn    after C_DELAY;
   hr_ck     <= sys_ck     after C_DELAY;

   wiredelay2_rwds_inst : entity work.wiredelay2
      generic map (
         G_DELAY => C_DELAY
      )
      port map (
         a => sys_rwds,
         b => hr_rwds
      ); -- wiredelay2_rwds_inst

   dq_delay_gen : for i in 0 to 7 generate

      wiredelay2_dq_inst : entity work.wiredelay2
         generic map (
            G_DELAY => C_DELAY
         )
         port map (
            a => sys_dq(i),
            b => hr_dq(i)
         ); -- wiredelay2_dq_inst

   end generate dq_delay_gen;


   ---------------------------------------------------------
   -- Instantiate HyperRAM simulation model
   ---------------------------------------------------------

   s27kl0642_inst : component s27kl0642
      port map (
         dq7      => hr_dq(7),
         dq6      => hr_dq(6),
         dq5      => hr_dq(5),
         dq4      => hr_dq(4),
         dq3      => hr_dq(3),
         dq2      => hr_dq(2),
         dq1      => hr_dq(1),
         dq0      => hr_dq(0),
         rwds     => hr_rwds,
         csneg    => hr_csn,
         ck       => hr_ck,
         ckn      => not hr_ck,
         resetneg => hr_resetn
      ); -- s27kl0642_inst

end architecture simulation;

