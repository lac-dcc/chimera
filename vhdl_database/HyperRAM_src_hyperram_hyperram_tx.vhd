-- This is part of the HyperRAM I/O connections
-- It handles signals from FPGA to HyperRAM.
-- The additional clock clk_del_i is used to drive the CK output.
--
-- Created by Michael Jørgensen in 2023 (mjoergen.github.io/HyperRAM).

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;

library unisim;
   use unisim.vcomponents.all;

entity hyperram_tx is
   port (
      clk_i               : in    std_logic;
      clk_del_i           : in    std_logic; -- phase shifted.
      rst_i               : in    std_logic;

      -- Connect to HyperRAM controller
      ctrl_ck_ddr_i       : in    std_logic_vector(1 downto 0);
      ctrl_dq_ddr_out_i   : in    std_logic_vector(15 downto 0);
      ctrl_dq_oe_i        : in    std_logic;
      ctrl_rwds_ddr_out_i : in    std_logic_vector(1 downto 0);
      ctrl_rwds_oe_i      : in    std_logic;

      -- Connect to HyperRAM device
      hr_ck_o             : out   std_logic;
      hr_rwds_out_o       : out   std_logic;
      hr_rwds_oe_n_o      : out   std_logic;
      hr_dq_out_o         : out   std_logic_vector(7 downto 0);
      hr_dq_oe_n_o        : out   std_logic_vector(7 downto 0)
   );
end entity hyperram_tx;

architecture synthesis of hyperram_tx is

   signal hr_dq_oe_n   : std_logic_vector(7 downto 0);
   signal hr_rwds_oe_n : std_logic;

   -- Make sure all eight flip-flops are preserved, even though
   -- they have identical inputs. This is necessary for the
   -- set_property IOB TRUE constraint to have effect.
   attribute dont_touch : string;
   attribute dont_touch of hr_dq_oe_n : signal is "true";

begin

   oddr_clk_inst : component oddr
      generic map (
         DDR_CLK_EDGE => "SAME_EDGE"
      )
      port map (
         d1 => ctrl_ck_ddr_i(1),
         d2 => ctrl_ck_ddr_i(0),
         ce => '1',
         q  => hr_ck_o,
         c  => clk_del_i
      ); -- oddr_clk_inst

   oddr_rwds_inst : component oddr
      generic map (
         DDR_CLK_EDGE => "SAME_EDGE"
      )
      port map (
         d1 => ctrl_rwds_ddr_out_i(1),
         d2 => ctrl_rwds_ddr_out_i(0),
         ce => '1',
         q  => hr_rwds_out_o,
         c  => clk_i
      ); -- oddr_rwds_inst

   oddr_dq_gen : for i in 0 to 7 generate

      oddr_dq_inst : component oddr
         generic map (
            DDR_CLK_EDGE => "SAME_EDGE"
         )
         port map (
            d1 => ctrl_dq_ddr_out_i(i + 8),
            d2 => ctrl_dq_ddr_out_i(i),
            ce => '1',
            q  => hr_dq_out_o(i),
            c  => clk_i
         ); -- oddr_dq_inst

   end generate oddr_dq_gen;

   -- The Output Enable signals are active low, because that maps
   -- directly into the TriState pin of an IOBUFT primitive.
   output_proc : process (clk_i)
   begin
      if rising_edge(clk_i) then
         hr_dq_oe_n   <= (others => not ctrl_dq_oe_i);
         hr_rwds_oe_n <= not ctrl_rwds_oe_i;
      end if;
   end process output_proc;

   hr_dq_oe_n_o   <= hr_dq_oe_n;
   hr_rwds_oe_n_o <= hr_rwds_oe_n;

end architecture synthesis;

