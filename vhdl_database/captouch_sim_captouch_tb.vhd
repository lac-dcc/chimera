-- This testbench is just for controller-internal tests!
-- The capacitive touch pads are not simulated here (yet).

library ieee;
use ieee.std_logic_1164.all;

entity captouch_tb is
end captouch_tb;

architecture captouch_tb_rtl of captouch_tb is

  -- dut --
  component captouch
    generic (
      F_CLOCK     : integer; -- frequency of clk_i in Hz
      NUM_PADS    : integer; -- number of touch pads
      SENSITIVITY : integer  -- 1=high, 2=medium, 3=low
    );
    port (
      -- global control --
      clk_i       : in    std_ulogic; -- clock
      rstn_i      : in    std_ulogic; -- async reset, low-active
      rstn_sync_i : in    std_ulogic; -- sync reset, low-active
      -- status --
      ready_o     : out   std_ulogic; -- system calibration done when high
      touch_o     : out   std_ulogic_vector(NUM_PADS-1 downto 0); -- touch pads state
      -- touch pads --
      pad_io      : inout std_logic_vector(NUM_PADS-1 downto 0)   -- capacitive touch pads
    );
  end component;

  -- generators --
  signal clk_gen, rstn_gen : std_logic := '0';

  -- touch pads --
  signal pads : std_logic_vector(3 downto 0);

begin

  -- generators --
  clk_gen  <= not clk_gen after 10 ns;
  rstn_gen <= '0', '1' after 60 ns;

  -- dut --
  captouch_inst: captouch
  generic map (
    F_CLOCK     => 100000000, -- frequency of clk_i in Hz
    NUM_PADS    => 4,         -- number of touch pads
    SENSITIVITY => 2          -- 1=high, 2=medium, 3=low
  )
  port map (
    -- global control --
    clk_i       => clk_gen,  -- clock
    rstn_i      => rstn_gen, -- async reset, low-active
    rstn_sync_i => '1',      -- sync reset, low-active
    -- status --
    ready_o     => open,     -- system calibration done when high
    touch_o     => open,     -- touch pads state
    -- touch pads --
    pad_io      => pads      -- capacitive touch pads
  );


end captouch_tb_rtl;
