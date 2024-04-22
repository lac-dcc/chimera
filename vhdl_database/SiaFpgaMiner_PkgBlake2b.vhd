-- Copyright (c) 2017, Pedro Rivera, all rights reserved.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

package PkgBlake2b is
  
  type SigmaArray_t is array (0 to 9, 0 to 15) of integer range 0 to 15;
  type U64Array_t is array (natural range <>) of unsigned(63 downto 0);
  
  constant kU64Zeros : unsigned(63 downto 0) := (others => '0');
  -- Length in bytes of the hashed result. Blake2b std uses 0x40, Sia uses 0x20
  constant kHashLen  : unsigned(7 downto 0) := x"20"; -- 32 bytes
  -- Length in bytes of the message
  constant kMsgLen  : unsigned(7 downto 0) := x"50"; -- 80 bytes
  -- Length in bytes of the optional key
  constant kKeyLen  : unsigned(7 downto 0) := x"00";

  -- kMaxMsgLen defines the width of the MsgLen port in the Blake2b core.
  -- According to the standard this can be up to 128-bits, which represents
  -- as much as 3.4x10^29 GB. For practicity the default value is set to 32,
  -- enabling up to ~4.3 GB.
  constant kMaxMsgLen : integer := 32;
  
  -- Message schedule for Blake2b
  -- Reference: https://tools.ietf.org/html/rfc7693#section-2.7
  constant kSigma : SigmaArray_t := (
    (00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15),
    (14, 10, 04, 08, 09, 15, 13, 06, 01, 12, 00, 02, 11, 07, 05, 03),
    (11, 08, 12, 00, 05, 02, 15, 13, 10, 14, 03, 06, 07, 01, 09, 04),
    (07, 09, 03, 01, 13, 12, 11, 14, 02, 06, 05, 10, 04, 00, 15, 08),
    (09, 00, 05, 07, 02, 04, 10, 15, 14, 01, 11, 12, 06, 08, 03, 13),
    (02, 12, 06, 10, 00, 11, 08, 03, 04, 13, 07, 05, 15, 14, 01, 09),
    (12, 05, 01, 15, 14, 13, 04, 10, 00, 07, 06, 03, 09, 02, 08, 11),
    (13, 11, 07, 14, 12, 01, 03, 09, 05, 00, 15, 04, 08, 06, 02, 10),
    (06, 15, 14, 09, 11, 03, 00, 08, 12, 02, 13, 07, 01, 04, 10, 05),
    (10, 02, 08, 04, 07, 06, 01, 05, 15, 11, 09, 14, 03, 12, 13, 00)
  );

  constant kIV : U64Array_t(7 downto 0) := (
    x"5be0cd19137e2179",
    x"1f83d9abfb41bd6b",
    x"9b05688c2b3e6c1f",
    x"510e527fade682d1",
    x"a54ff53a5f1d36f1",
    x"3c6ef372fe94f82b",
    x"bb67ae8584caa73b",
    x"6a09e667f3bcc908"
  );

  -- For Sia mining Hin is actually constant
  constant kHin : U64Array_t(7 downto 0) := (
    kIV(7), kIV(6), kIV(5), kIV(4), kIV(3), kIV(2), kIV(1),
    kIV(0) xor (x"000000000101" & kKeyLen & kHashLen)
  );

end PkgBlake2b;