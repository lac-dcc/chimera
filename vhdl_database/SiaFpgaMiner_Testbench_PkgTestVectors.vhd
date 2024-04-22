-- Copyright (c) 2017, Pedro Rivera, all rights reserved.

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.PkgBlake2b.all;

package PkgTestVectors is
  
  -- Header format
  -------------------------
  -- Merkle root (79 downto 48) *Big endian
  -- Timestamp   (47 downto 40)
  -- Nonce       (39 downto 32)
  -- Parent ID   (31 downto 0)  *Big endian

  -- Enconding & Endianness
  -------------------------
  -- Arrays are encoded as [LSB, ..., MSB]
  
  -- Anything that is represented as a string in Sia is encoded as a byte array with leftmost characters stored in the least significant bytes (big endian).
  -- This includes merkle root, Parent ID, and hash output.

  -- Integers such as the timestamp are encoded as 64 bits in little endian.

  -- Block Height 975
  -------------------------
  -- MerkleRoot: 0x6350916638e03107884f447e37ddd6093e8de171f49ef6be830f2495927756ef
  --             0xef56779295240f83bef69ef471e18d3e09d6dd377e444f880731e03866915063 (big endian)
  -- Timestamp:  0x000000005574c656 <= 1433716310 apparently any type of integer gets encoded as 64bits in marshall.go
  -- Nonce:      0x0000000043F90000 <= [0 0 249 67 0 0 0 0]
  -- Parent:     0x0000000009e54a03f6738eafe76cf99e4382c8090ab08615b00b2e840fe24baf
  --             0xaf4be20f842e0bb01586b00a09c882439ef96ce7af8e73f6034ae50900000000 (big endian) 
  -- Target:     0x000000000CCCCCCC <= [0, 0, 0, 0, 12, 204, 204, 204] we choose the endianness of this flipped to compare easier in the core.

  constant kTestHeader : U64Array_t(9 downto 0) := (
    x"ef56779295240f83", x"bef69ef471e18d3e", x"09d6dd377e444f88", x"0731e03866915063", x"000000005574c656",
    x"000000000CCCCCCC", x"af4be20f842e0bb0", x"1586b00a09c88243", x"9ef96ce7af8e73f6", x"034ae50900000000");

  constant kTestNonce : unsigned(63 downto 0) := x"0000000043F90000";
  
  constant kExpectedH : U64Array_t(3 downto 0) := ( -- Block 976 Parent ID (Block 975 ID) in big endian
    x"6f12f5af5333a321", x"97b8874f19ac3c31", x"4c675600a0ac95d8", x"cfc6830800000000"
  ); 

  -- Blake2b spec test data
  --------------------------
  -- Requires changing the hash size and message length in PkgBlake2b.vhd
  
  constant kStdTestMsg : U64Array_t(15 downto 0) := (
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000000000",
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0D4D1C983FA580BA", -- Feeding fake target through msg(4)
    x"0000000000000000", x"0000000000000000", x"0000000000000000", x"0000000000636261" 
  );

  constant kStdExpectedH : U64Array_t(7 downto 0) := (
    x"239900D4ED8623B9", x"5A92F1DBA88AD318", x"95CC3345DED552C2", x"2D79AB2A39C5877D",   
    x"D1A2FFDB6FBB124B", x"B7C45A68142F214C",  x"E9F6129FB697276A", x"0D4D1C983FA580BA"
  );

  constant kStdTestNonce : unsigned(63 downto 0) := x"0000000000000000";

end PkgTestVectors;