--
-- Copyright 2013-2020 Software Radio Systems Limited
--
-- By using this file, you agree to the terms and conditions set
-- forth in the LICENSE file which can be found at the top level of
-- the distribution.
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; -- We do use unsigned arithmetic
use IEEE.numeric_std.all;

-- Device primitives library
library UNISIM;
use UNISIM.vcomponents.all;

-- I/O libraries * SIMULATION ONLY *
use STD.textio.all;
use ieee.std_logic_textio.all;

entity timestamp_unit_lclk_count is
  generic (
    PARAM_CLOCK_RATIO : integer := 2
  );
  port (
    --! ADC clock signal xN [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and 
    --! sampling freq; max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_clk : in std_logic;                              
    --! ADC high-active reset signal (mapped to the ADC clock xN domain 
    --! [depends on antenna (N = 2 for 1x1 and N = 4 for 2x2) configuration and sampling freq; 
    --! max LTE value for 1x1 is @61.44 MHz and for 2x2 is @122.88 MHz]
    ADCxN_reset : in std_logic;                            
    --! Indicates the division factor between the sampling clock and input clock 
    --! (i.e., '1' indicates N = 2 or 1x1, '0' indicates N = 4 or 2x2)
    ADC_clk_division : in std_logic;                       

    --! Current ADC clock cycle (i.e., current I/Q sample count)
    current_lclk_count : out std_logic_vector(63 downto 0) 
  );
end timestamp_unit_lclk_count;

architecture arch_timestamp_unit_lclk_count_RTL_impl of timestamp_unit_lclk_count is

  -- **********************************
  -- definition of constants
  -- **********************************

  -- time counting related constants
  constant cnt_1_lclock_tick_64b : std_logic_vector(63 downto 0):=x"0000000000000001"; -- 1 clock tick = 1/l_clk freq (e.g., for 30.72 MHz = 32.56 ns)
  constant cnt_1_cenable_tick_3b : std_logic_vector(2 downto 0):="001";
  constant cnt_4_cenable_ticks_3b : std_logic_vector(2 downto 0):="011";

  -- **********************************
  -- internal signals
  -- **********************************

  -- time counting related signals
  signal internal_lclk_count : unsigned(63 downto 0);                  -- up to 2^64-1 clock ticks (e.g., for 30.72 MHz > 6^20 ns... robots will rule the earth by then)
  signal internal_cenable_count : std_logic_vector(2 downto 0);

begin

    -- ***************************************************
    -- lclk counting control
    -- ***************************************************

    -- process counting lclock cycles (between reset periods)
    -- * NOTE: whereas the process is driven by 'ADCxN_clk', we do mean to count 'ADC_clk' ticks and, hence, a simple clock-enable scheme is implemented *
    process(ADCxN_clk,ADCxN_reset)
    begin
      if rising_edge(ADCxN_clk) then
        if ADCxN_reset='1' then -- synchronous high-active reset: initialization of signals
          internal_lclk_count <= (others => '0');
          internal_cenable_count <= (others => '0');
        else
          if (PARAM_CLOCK_RATIO = 1) then
            internal_lclk_count <= internal_lclk_count + 1;
          else
            if (internal_cenable_count < cnt_1_cenable_tick_3b) then
              internal_cenable_count <= internal_cenable_count + cnt_1_cenable_tick_3b;
            else
              internal_cenable_count <= (others => '0');
              internal_lclk_count <= internal_lclk_count + 1;
            end if;
          end if;
        end if; -- end of reset
      end if; -- end of clk
    end process;

   -- mapping of the internal signals to the corresponding output ports
   current_lclk_count <= std_logic_vector(internal_lclk_count);

end arch_timestamp_unit_lclk_count_RTL_impl;
