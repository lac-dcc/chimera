-------------------------------------------------------------------------------
--
-- Delta-Sigma DAC
--
-- $Id: dac.vhd,v 1.1 2006/11/29 14:17:19 arnim Exp $
--
-- Refer to Xilinx Application Note XAPP154.
--
-- This DAC requires an external RC low-pass filter:
--
--   dac_o 0---XXXXX---+---0 analog audio
--              2K2    |
--                    === 10n
--                     |
--                    GND
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity dac is

	generic (
		nbits_g	: integer := 16
	);
	port (
		reset_i	: in  std_logic;
		clock_i	: in  std_logic;
		dac_i		: in  unsigned((nbits_g-1) downto 0);
		dac_o		: out std_logic
	);

end entity;

library ieee;
use ieee.numeric_std.all;

architecture rtl of dac is

  signal DACout_q      : std_logic;
  signal DeltaAdder_s,
         SigmaAdder_s,
         SigmaLatch_q,
         DeltaB_s      : unsigned(nbits_g+1 downto 0);

begin

  DeltaB_s(nbits_g+1 downto nbits_g) <= SigmaLatch_q(nbits_g+1) &
                                        SigmaLatch_q(nbits_g+1);
  DeltaB_s(nbits_g-1 downto       0) <= (others => '0');

  DeltaAdder_s <= unsigned('0' & '0' & dac_i) + DeltaB_s;

  SigmaAdder_s <= DeltaAdder_s + SigmaLatch_q;

  seq: process (clock_i, reset_i)
  begin
    if reset_i = '1' then
      SigmaLatch_q <= to_unsigned(2**nbits_g, SigmaLatch_q'length);
      DACout_q     <= '0';

    elsif rising_edge(clock_i) then
      SigmaLatch_q <= SigmaAdder_s;
      DACout_q     <= SigmaLatch_q(nbits_g+1);
    end if;
  end process seq;

  dac_o <= DACout_q;

end architecture;
