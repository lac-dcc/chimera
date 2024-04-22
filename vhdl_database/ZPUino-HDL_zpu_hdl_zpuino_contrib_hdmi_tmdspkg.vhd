library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;

package tmdspkg is

  type tmds_phase_type is (
    VIDEO_DATA,
    VIDEO_PREAMBLE,
    VIDEO_GUARD,
    PACKET_DATA,
    PACKET_PREAMBLE,
    PACKET_GUARD,
    CONTROL
  );

end tmdspkg;
