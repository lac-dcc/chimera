-------------------------------------------------------------------[03.08.2014]
-- Delta-Sigma DAC
-------------------------------------------------------------------------------
-- V1.0		03.08.2014	Initial release
-------------------------------------------------------------------------------
--
-- This DAC requires an external RC low-pass filter:
--
--   DAC_OUT 0---XXXXX---+---0 analog audio
--                3k3    |
--                      === 4n7
--                       |
--                      GND
--
-- For example, for an 8-bit DAC (msbi_g = 7) the lowest VOUT is 0V when
-- DACin is 0. The highest VOUT is 255/256 VCCO volts when DACin is 0xFF.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity dac is

  generic (
    msbi_g : integer := 15
  );
  port (
    CLK   	: in  std_logic;
    RESET 	: in  std_logic;
    DAC_DATA	: in  std_logic_vector(msbi_g downto 0);
    DAC_OUT   	: out std_logic
  );

end dac;

library ieee;
use ieee.numeric_std.all;

architecture rtl of dac is

  signal DACout_q      : std_logic;
  signal DeltaAdder_s,
         SigmaAdder_s,
         SigmaLatch_q,
         DeltaB_s      : unsigned(msbi_g+2 downto 0);

begin

  DeltaB_s(msbi_g+2 downto msbi_g+1) <= SigmaLatch_q(msbi_g+2) &
                                        SigmaLatch_q(msbi_g+2);
  DeltaB_s(msbi_g   downto        0) <= (others => '0');

  DeltaAdder_s <= unsigned('0' & '0' & DAC_DATA) + DeltaB_s;

  SigmaAdder_s <= DeltaAdder_s + SigmaLatch_q;

  seq: process (CLK, RESET)
  begin
    if RESET = '1' then
      SigmaLatch_q <= to_unsigned(2**(msbi_g+1), SigmaLatch_q'length);
      DACout_q     <= '0';

    elsif CLK'event and CLK = '1' then
      SigmaLatch_q <= SigmaAdder_s;
      DACout_q     <= SigmaLatch_q(msbi_g+2);
    end if;
  end process seq;

  DAC_OUT <= DACout_q;

end rtl;
