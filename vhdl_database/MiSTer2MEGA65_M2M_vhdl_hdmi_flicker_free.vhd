library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

-- This module monitors the read and write accesses to the HyperRAM by the ascaler.
--
-- The input stream from the CORE creates writes to the HyperRAM.
-- The output stream to the HDMI creates reads from the HyperRAM.
-- The goal is to ensure that the writes occur just before the reads, specifically
-- to ensure they do not "cross over".
--
-- This module samples the difference at the start of the output frame,
-- i.e. when the read address has wrapped around.
--
-- This module detects when the difference CORE-HDMI exceeds the bounds chosen by
-- the generics.
-- The intention is that the output signals high_o and low_o can be used
-- to choose between two different speeds of the CORE.
-- This will create a hyseteris effect, where the CORE occasionally (less than once a second)
-- switches speed.
--
-- For simplicity, this difference is only sampled when the output frame starts,
-- i.e. when the read address is X"0000_0000".
-- In this case the write address should be slightly ahead, i.e. have a small positive
-- value.

entity hdmi_flicker_free is
generic (
   G_THRESHOLD_LOW  : std_logic_vector(31 downto 0);
   G_THRESHOLD_HIGH : std_logic_vector(31 downto 0)
);
port (
   hr_clk_i       : in  std_logic;
   hr_write_i     : in  std_logic;
   hr_read_i      : in  std_logic;
   hr_address_i   : in  std_logic_vector(31 downto 0);
   high_o         : out std_logic;  -- CORE is too fast
   low_o          : out std_logic   -- CORE is too slow
);
end entity hdmi_flicker_free;

architecture synthesis of hdmi_flicker_free is

   constant C_HR_FREQ_HZ    : natural := 100_000_000;

   signal last_core_address : std_logic_vector(31 downto 0);
   signal last_hdmi_address : std_logic_vector(31 downto 0);
   signal last_diff         : std_logic_vector(31 downto 0);

   -- Debug signals
   signal dbg_low_d         : std_logic;
   signal dbg_high_d        : std_logic;
   signal dbg_low_cnt       : std_logic_vector(15 downto 0);
   signal dbg_high_cnt      : std_logic_vector(15 downto 0);
   signal dbg_min_diff      : std_logic_vector(31 downto 0);
   signal dbg_max_diff      : std_logic_vector(31 downto 0);
   signal dbg_min_stored    : std_logic_vector(31 downto 0);
   signal dbg_max_stored    : std_logic_vector(31 downto 0);
   signal dbg_sec1_cnt      : natural range 0 to C_HR_FREQ_HZ-1;
   signal dbg_sec1          : std_logic;

begin

   p_last_address : process (hr_clk_i)
   begin
      if rising_edge(hr_clk_i) then
         if hr_write_i = '1' then
            last_core_address <= hr_address_i; -- The CORE is writing to HyperRAM
         end if;

         if hr_read_i = '1' then
            last_hdmi_address <= hr_address_i; -- The HDMI is reading from HyperRAM
         end if;
      end if;
   end process p_last_address;

   p_last_diff : process (hr_clk_i)
   begin
      if rising_edge(hr_clk_i) then
         -- Only sample once each frame
         if last_hdmi_address = 0 then
            last_diff <= last_core_address; -- This is CORE-HDMI, i.e. value of CORE when HDMI=0
         end if;
      end if;
   end process p_last_diff;

   p_output : process (hr_clk_i)
   begin
      if rising_edge(hr_clk_i) then
         low_o  <= '0';
         high_o <= '0';

         if last_diff < G_THRESHOLD_LOW then
            low_o <= '1';
         end if;

         if last_diff > G_THRESHOLD_HIGH then
            high_o <= '1';
         end if;
      end if;
   end process p_output;

   -- Pulse every second
   p_debug_sec1 : process (hr_clk_i)
   begin
      if rising_edge(hr_clk_i) then
         if dbg_sec1_cnt < C_HR_FREQ_HZ-1 then
            dbg_sec1_cnt <= dbg_sec1_cnt + 1;
            dbg_sec1     <= '0';
         else
            dbg_sec1_cnt <= 0;
            dbg_sec1     <= '1';
         end if;
      end if;
   end process p_debug_sec1;

   -- Debug statistics
   p_debug : process (hr_clk_i)
   begin
      if rising_edge(hr_clk_i) then
         dbg_low_d  <= low_o;
         dbg_high_d <= high_o;

         if dbg_low_d = '0' and low_o = '1' then
            dbg_low_cnt <= dbg_low_cnt + 1;
         end if;
         if dbg_high_d = '0' and high_o = '1' then
            dbg_high_cnt <= dbg_high_cnt + 1;
         end if;

         if last_diff > dbg_max_diff then
            dbg_max_diff <= last_diff;
         end if;
         if last_diff < dbg_min_diff then
            dbg_min_diff <= last_diff;
         end if;

         if dbg_sec1 = '1' then
            dbg_max_diff   <= last_diff;
            dbg_min_diff   <= last_diff;
            dbg_max_stored <= dbg_max_diff;
            dbg_min_stored <= dbg_min_diff;
         end if;
      end if;
   end process p_debug;

end architecture synthesis;

