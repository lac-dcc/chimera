--
-- Copyright: 2013, Technical University of Denmark, DTU Compute
-- Author: Martin Schoeberl (martin@jopdesign.com)
-- License: Simplified BSD License
--

-- VHDL top level for Patmos in Chisel with on-chip memory.
--
-- Includes some 'magic' VHDL code to generate a reset after FPGA configuration.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity patmos_top is
  port(
    clk : in  std_logic;
    oLedsPins_led : out std_logic_vector(7 downto 0);
    oUartPins_txd : out std_logic;
    iUartPins_rxd : in  std_logic
  );
end entity patmos_top;

architecture rtl of patmos_top is
  component Patmos is
    port(
      clock           : in  std_logic;
      reset           : in  std_logic;
      io_UartCmp_rx  : in  std_logic;
      io_UartCmp_tx  : out std_logic;
      io_Leds_led : out std_logic_vector(7 downto 0)
    );
  end component;

  -- DE2-70: 50 MHz clock => 80 MHz
  -- BeMicro: 16 MHz clock => 25.6 MHz
  -- de10-nano: start with the 50 MHz clock input and no PLL
  constant pll_infreq : real    := 50.0;
  constant pll_mult   : natural := 8;
  constant pll_div    : natural := 5;

  signal clk_int : std_logic;

  -- for generation of internal reset
  signal int_res            : std_logic;
  signal res_reg1, res_reg2 : std_logic;
  signal res_cnt            : unsigned(2 downto 0) := "000"; -- for the simulation

  attribute altera_attribute : string;
  attribute altera_attribute of res_cnt : signal is "POWER_UP_LEVEL=LOW";

begin
--  pll_inst : entity work.pll generic map(
--      input_freq  => pll_infreq,
--      multiply_by => pll_mult,
--      divide_by   => pll_div
--    )
--    port map(
--      inclk0 => clk,
--      c0     => clk_int
--    );
  -- we use a PLL
  clk_int <= clk;

  --
  --  internal reset generation
  --  should include the PLL lock signal
  --
  process(clk_int)
  begin
    if rising_edge(clk_int) then
      if (res_cnt /= "111") then
        res_cnt <= res_cnt + 1;
      end if;
      res_reg1 <= not res_cnt(0) or not res_cnt(1) or not res_cnt(2);
      res_reg2 <= res_reg1;
      int_res  <= res_reg2;
    end if;
  end process;


    comp : Patmos port map(clock => clk_int,
      reset => int_res,
      io_UartCmp_rx => iUartPins_rxd,
      io_UartCmp_tx => oUartPins_txd,
      io_Leds_led => oLedsPins_led
    );

end architecture rtl;
