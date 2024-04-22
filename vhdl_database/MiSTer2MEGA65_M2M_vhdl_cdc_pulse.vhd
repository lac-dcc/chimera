library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Clock Domain Crossing specialized for a single pulse.
-- The pulse must be only 1 cycle wide, and separated from the next pulse
-- by at least 4 cycles (of the slowest clock).
-- The output will also only be 1 cycle wide.

entity cdc_pulse is
  port (
    src_clk_i   : in    std_logic;
    src_pulse_i : in    std_logic; -- Must only be 1 cycle
    dst_clk_i   : in    std_logic;
    dst_pulse_o : out   std_logic  -- Will only be 1 cycle
  );
end entity cdc_pulse;

architecture synthesis of cdc_pulse is

  signal src_toggle   : std_logic := '0';
  signal dst_toggle   : std_logic;
  signal dst_toggle_d : std_logic;

begin

  src_toggle_proc : process (src_clk_i)
  begin
    if rising_edge(src_clk_i) then
      src_toggle <= src_toggle xor src_pulse_i;
    end if;
  end process src_toggle_proc;

  cdc_stable_inst : entity work.cdc_stable
    generic map (
      G_DATA_SIZE    => 1,
      G_REGISTER_SRC => false
    )
    port map (
      src_clk_i     => src_clk_i,
      src_data_i(0) => src_toggle,
      dst_clk_i     => dst_clk_i,
      dst_data_o(0) => dst_toggle
    );

  dst_pulse_proc : process (dst_clk_i)
  begin
    if rising_edge(dst_clk_i) then
      dst_toggle_d <= dst_toggle;
    end if;
  end process dst_pulse_proc;

  dst_pulse_o <= dst_toggle_d xor dst_toggle;

end architecture synthesis;

