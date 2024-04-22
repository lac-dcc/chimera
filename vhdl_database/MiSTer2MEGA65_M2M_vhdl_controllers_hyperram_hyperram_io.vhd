-- This is the HyperRAM I/O connections
-- The additional clock clk_x2_i is used to drive the DQ/RWDS output and to
-- sample the DQ/RWDS input.
-- The additional clock clk_x2_del_i is used to drive the CK output.
--
-- Created by Michael Jørgensen in 2022 (mjoergen.github.io/HyperRAM).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hyperram_io is
   port (
      clk_x1_i            : in  std_logic;
      clk_x2_i            : in  std_logic; -- Double frequency.
      clk_x2_del_i        : in  std_logic; -- Double frequency, phase shifted.
      rst_i               : in  std_logic;

      -- Connect to HyperRAM controller
      ctrl_rstn_i         : in  std_logic;
      ctrl_ck_ddr_i       : in  std_logic_vector(1 downto 0);
      ctrl_csn_i          : in  std_logic;
      ctrl_dq_ddr_in_o    : out std_logic_vector(15 downto 0);
      ctrl_dq_ddr_out_i   : in  std_logic_vector(15 downto 0);
      ctrl_dq_oe_i        : in  std_logic;
      ctrl_dq_ie_o        : out std_logic;
      ctrl_rwds_ddr_out_i : in  std_logic_vector(1 downto 0);
      ctrl_rwds_oe_i      : in  std_logic;

      -- Connect to HyperRAM device
      hr_resetn_o         : out std_logic;
      hr_csn_o            : out std_logic;
      hr_ck_o             : out std_logic;
      hr_rwds_in_i        : in  std_logic;
      hr_dq_in_i          : in  std_logic_vector(7 downto 0);
      hr_rwds_out_o       : out std_logic;
      hr_dq_out_o         : out std_logic_vector(7 downto 0);
      hr_rwds_oe_o        : out std_logic;
      hr_dq_oe_o          : out std_logic
   );
end entity hyperram_io;

architecture synthesis of hyperram_io is

   -- Output generation
   signal rwds_ddr_out_x2 : std_logic_vector(1 downto 0);
   signal dq_ddr_out_x2   : std_logic_vector(15 downto 0);

   -- Input sampling
   signal csn_in_x2       : std_logic;
   signal rwds_in_x2      : std_logic;
   signal dq_in_x2        : std_logic_vector(7 downto 0);
   signal rwds_in_x2_d    : std_logic;
   signal dq_in_x2_d      : std_logic_vector(7 downto 0);

begin

   hr_csn_o    <= ctrl_csn_i;
   hr_resetn_o <= ctrl_rstn_i;


   ------------------------------------------------
   -- Output generation
   ------------------------------------------------

   -- Note the use of clk_x2_del_i
   p_output_clk : process (clk_x2_del_i)
   begin
      if rising_edge(clk_x2_del_i) then
         if hr_ck_o = '0' then
            hr_ck_o <= ctrl_ck_ddr_i(1);
         else
            hr_ck_o <= '0';
         end if;
      end if;
   end process p_output_clk;

   p_output_rwds : process (clk_x2_i)
   begin
      if rising_edge(clk_x2_i) then
         rwds_ddr_out_x2 <= ctrl_rwds_ddr_out_i;
         if hr_ck_o = '0' then
            hr_rwds_out_o <= rwds_ddr_out_x2(1);
         else
            hr_rwds_out_o <= rwds_ddr_out_x2(0);
         end if;
      end if;
   end process p_output_rwds;

   p_output_dq : process (clk_x2_i)
   begin
      if rising_edge(clk_x2_i) then
         dq_ddr_out_x2 <= ctrl_dq_ddr_out_i;
         if hr_ck_o = '0' then
            hr_dq_out_o <= dq_ddr_out_x2(15 downto 8);
         else
            hr_dq_out_o <= dq_ddr_out_x2(7 downto 0);
         end if;
      end if;
   end process p_output_dq;

   p_delay : process (clk_x1_i)
   begin
      if rising_edge(clk_x1_i) then
         hr_dq_oe_o   <= ctrl_dq_oe_i;
         hr_rwds_oe_o <= ctrl_rwds_oe_i;
      end if;
   end process p_delay;


   ------------------------------------------------
   -- Input sampling
   ------------------------------------------------

   p_sampling : process (clk_x2_i)
   begin
      if rising_edge(clk_x2_i) then
         csn_in_x2    <= hr_csn_o;
         rwds_in_x2   <= hr_rwds_in_i;
         dq_in_x2     <= hr_dq_in_i;

         rwds_in_x2_d <= rwds_in_x2;
         dq_in_x2_d   <= dq_in_x2;
      end if;
   end process p_sampling;

   p_input : process (clk_x1_i)
   begin
      if rising_edge(clk_x1_i) then
         ctrl_dq_ie_o <= '0';
         if rwds_in_x2_d = '1' and rwds_in_x2 = '0' then
            ctrl_dq_ddr_in_o <= dq_in_x2_d & dq_in_x2;
            ctrl_dq_ie_o     <= '1';
         end if;
         if rwds_in_x2_d = '0' and rwds_in_x2 = '1' then
            ctrl_dq_ddr_in_o <= dq_in_x2 & hr_dq_in_i;
            ctrl_dq_ie_o     <= '1';
         end if;
      end if;
   end process p_input;

end architecture synthesis;

