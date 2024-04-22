--------------------------------------------------------------------------------
-- Copyright (C) 1999-2008 Easics NV.
-- This source file may be used and distributed without restriction
-- provided that this copyright statement is not removed from the file
-- and that any derivative work contains the original copyright notice
-- and the associated disclaimer.
--
-- THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
-- WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
--
-- Purpose : synthesizable CRC function
--   * polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
--   * data width: 4
--
-- Info : tools@easics.be
--        http://www.easics.com
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE PCK_CRC32_D4 IS
  -- polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
  -- data width: 4
  -- convention: the first serial bit is D[3]
  FUNCTION nextCRC32_D4
  (
    Data : STD_LOGIC_VECTOR(0 TO 3);
    crc : STD_LOGIC_VECTOR(0 TO 31)
  ) RETURN STD_LOGIC_VECTOR;
END PCK_CRC32_D4;
PACKAGE BODY PCK_CRC32_D4 IS

  -- polynomial: x^32 + x^26 + x^23 + x^22 + x^16 + x^12 + x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^2 + x^1 + 1
  -- data width: 4
  -- convention: the first serial bit is D[3]
  FUNCTION nextCRC32_D4
  (
    Data : STD_LOGIC_VECTOR(0 TO 3);
    crc : STD_LOGIC_VECTOR(0 TO 31))
    RETURN STD_LOGIC_VECTOR IS

    VARIABLE d : STD_LOGIC_VECTOR(0 TO 3);
    VARIABLE c : STD_LOGIC_VECTOR(0 TO 31);
    VARIABLE newcrc : STD_LOGIC_VECTOR(0 TO 31);

  BEGIN
    d := Data;
    c := crc;

    newcrc(0) := d(0) XOR c(28);
    newcrc(1) := d(1) XOR d(0) XOR c(28) XOR c(29);
    newcrc(2) := d(2) XOR d(1) XOR d(0) XOR c(28) XOR c(29) XOR c(30);
    newcrc(3) := d(3) XOR d(2) XOR d(1) XOR c(29) XOR c(30) XOR c(31);
    newcrc(4) := d(3) XOR d(2) XOR d(0) XOR c(0) XOR c(28) XOR c(30) XOR c(31);
    newcrc(5) := d(3) XOR d(1) XOR d(0) XOR c(1) XOR c(28) XOR c(29) XOR c(31);
    newcrc(6) := d(2) XOR d(1) XOR c(2) XOR c(29) XOR c(30);
    newcrc(7) := d(3) XOR d(2) XOR d(0) XOR c(3) XOR c(28) XOR c(30) XOR c(31);
    newcrc(8) := d(3) XOR d(1) XOR d(0) XOR c(4) XOR c(28) XOR c(29) XOR c(31);
    newcrc(9) := d(2) XOR d(1) XOR c(5) XOR c(29) XOR c(30);
    newcrc(10) := d(3) XOR d(2) XOR d(0) XOR c(6) XOR c(28) XOR c(30) XOR c(31);
    newcrc(11) := d(3) XOR d(1) XOR d(0) XOR c(7) XOR c(28) XOR c(29) XOR c(31);
    newcrc(12) := d(2) XOR d(1) XOR d(0) XOR c(8) XOR c(28) XOR c(29) XOR c(30);
    newcrc(13) := d(3) XOR d(2) XOR d(1) XOR c(9) XOR c(29) XOR c(30) XOR c(31);
    newcrc(14) := d(3) XOR d(2) XOR c(10) XOR c(30) XOR c(31);
    newcrc(15) := d(3) XOR c(11) XOR c(31);
    newcrc(16) := d(0) XOR c(12) XOR c(28);
    newcrc(17) := d(1) XOR c(13) XOR c(29);
    newcrc(18) := d(2) XOR c(14) XOR c(30);
    newcrc(19) := d(3) XOR c(15) XOR c(31);
    newcrc(20) := c(16);
    newcrc(21) := c(17);
    newcrc(22) := d(0) XOR c(18) XOR c(28);
    newcrc(23) := d(1) XOR d(0) XOR c(19) XOR c(28) XOR c(29);
    newcrc(24) := d(2) XOR d(1) XOR c(20) XOR c(29) XOR c(30);
    newcrc(25) := d(3) XOR d(2) XOR c(21) XOR c(30) XOR c(31);
    newcrc(26) := d(3) XOR d(0) XOR c(22) XOR c(28) XOR c(31);
    newcrc(27) := d(1) XOR c(23) XOR c(29);
    newcrc(28) := d(2) XOR c(24) XOR c(30);
    newcrc(29) := d(3) XOR c(25) XOR c(31);
    newcrc(30) := c(26);
    newcrc(31) := c(27);
    RETURN newcrc;
  END nextCRC32_D4;

END PCK_CRC32_D4;