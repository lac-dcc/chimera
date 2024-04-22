-- author: Furkan Cayci, 2018
-- description: generate 1x pixel and 5x serial clocks from the input clock
--   default to 125 Mhz input clock
--               25 and 125 Mhz output clocks

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity clock_gen is
    generic (
        CLKIN_PERIOD :    real := 8.000;  -- input clock period (8ns)
        CLK_MULTIPLY : integer := 8;      -- multiplier
        CLK_DIVIDE   : integer := 1;      -- divider
        CLKOUT0_DIV  : integer := 8;      -- serial clock divider
        CLKOUT1_DIV  : integer := 40      -- pixel clock divider
    );
    port(
        clk_i  : in  std_logic; --  input clock
        clk0_o : out std_logic; -- serial clock
        clk1_o : out std_logic  --  pixel clock
    );
end clock_gen;

architecture rtl of clock_gen is

    signal pllclk0, pllclk1 : std_logic;
    signal clkfbout : std_logic;

begin

    -- buffer output clocks
    clk0buf: BUFG port map (I=>pllclk0, O=>clk0_o);
    clk1buf: BUFG port map (I=>pllclk1, O=>clk1_o);

    clock: PLLE2_BASE generic map (
        clkin1_period  => CLKIN_PERIOD,
        clkfbout_mult  => CLK_MULTIPLY,
        clkout0_divide => CLKOUT0_DIV,
        clkout1_divide => CLKOUT1_DIV,
        divclk_divide  => CLK_DIVIDE
    )
    port map(
        rst      => '0',
        pwrdwn   => '0',
        clkin1   => clk_i,
        clkfbin  => clkfbout,
        clkfbout => clkfbout,
        clkout0  => pllclk0,
        clkout1  => pllclk1
    );

end rtl;
