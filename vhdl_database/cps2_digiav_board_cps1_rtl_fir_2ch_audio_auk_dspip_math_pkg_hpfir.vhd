-- (C) 2001-2021 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-- (C) 2001-2009 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- Revision Control Information
--
-- $Revision: #1 $
-- $Date: 2009/07/29 $
-- Check in by     : $Author: max $
-- Author   :  DSP_IP
--
-- Project      :  <project name>
--
-- Description : 
--
-- Common functions for DSP_IP cores. 
-- 
--
-- ALTERA Confidential and Proprietary
-- Copyright 2006 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
PACKAGE auk_dspip_math_pkg_hpfir IS


  -----------------------------------------------------------------------------
  -- NOTE that these log functions are not intended to synthesize directly
  -- into hardware, rather they are used to generate constants for
  -- synthesized hardware.
  -----------------------------------------------------------------------------
  ---------------------------------------------------------------------------
  -- LOG2_CEIL Function.
  -- Effectively performs log2() followed by ceil()
  -- e.g. CEIL_LOG2(255) returns 8
  --      CEIL_LOG2(256) returns 8
  --      CEIL_LOG2(257) returns 9
  ---------------------------------------------------------------------------
  function log2_ceil(arg : in integer) return integer;
  function log2_ceil_one(arg : in integer) return integer;  -- log2_ceil(1)=0
  ---------------------------------------------------------------------------
  -- LOG2_FLOOR Function.
  -- Effectively performs log2() followed by floor()
  -- e.g. CEIL_LOG2(255) returns 7
  --      CEIL_LOG2(256) returns 8
  --      CEIL_LOG2(257) returns 8
  ---------------------------------------------------------------------------
  function log2_floor(arg : in integer) return integer;

  -----------------------------------------------------------------------------
  -- SIGN functions
  -----------------------------------------------------------------------------
  -- returns the sign bit of a vector
  function sign (arg : in signed) return std_logic;

  -- sign extends ARG to size SIZE.
  function sign_extend (arg : signed; size : positive) return signed;

  -- sign extend one bit
  function xt1 (arg : signed) return signed;

  ---------------------------------------------------------------------------
  -- Arithmetic FUNCTIONs.
  ---------------------------------------------------------------------------
  -- Check integer for odd-ness
  function is_odd(arg : integer) return boolean;

  -----------------------------------------------------------------------------
  -- Logical functions
  -----------------------------------------------------------------------------
  -- Result of and'ing all of the bits of the vector. 
  function and_reduce(arg : std_logic_vector) return std_logic;
  function and_reduce(arg : unsigned) return std_logic;

  -- Result of or'ing all of the bits of the vector. 
  function or_reduce(arg : std_logic_vector) return std_logic;
  function or_reduce(arg : unsigned) return std_logic;

  -- returns index+1 of the highest asserted bit.
  function highest_one(arg : unsigned) return natural;

  -- returns index+1 of the lowest asserted bit.
  function lowest_one(arg : unsigned) return natural;

  -- returns the count of number of ones.
  function count_ones(arg : unsigned) return natural;

  -- Bit reverse
  function bit_reverse(arg : unsigned) return unsigned;

  -- Invert the argument bitwise
  function invert(arg : unsigned) return unsigned;

  --Halve towards up
  function halve_ceil(arg:natural) return natural;

  function div_ceil(a:natural;b:natural) return natural;
 
END PACKAGE auk_dspip_math_pkg_hpfir;

package body auk_dspip_math_pkg_hpfir is
  ---------------------------------------------------------------------------
  -- LOG2_CEIL Function.
  ---------------------------------------------------------------------------
  function log2_ceil(arg : in integer) return integer is
    variable res : integer;
  begin
    res := 0;
    for i in 0 to 30 loop
      if (arg > (2**i)) then
        res := i+1;
      end if;
    end loop;  -- i
    return res;
  end log2_ceil;
  ---------------------------------------------------------------------------
  -- LOG2_CEIL_ONE Function.
  ---------------------------------------------------------------------------
  function log2_ceil_one(arg : in integer) return integer is
    variable res : integer;
  begin
    res := 0;
    for i in 0 to 30 loop
      if (arg > (2**i)) then
        res := i+1;
      end if;
    end loop;  -- i
    if res = 0 then
      res := 1;
    end if;
    return res;
  end log2_ceil_one;

  ---------------------------------------------------------------------------
  -- LOG2_FLOOR Function.
  -----------------------------------------------------------------------------
  function log2_floor(arg : in integer) return integer is
    variable res : integer;
  begin
    res := 0;
    for i in 0 to 30 loop
      if (arg >= (2**i)) then
        res := i;
      end if;
    end loop;  -- i
    return res;
  end log2_floor;

  -----------------------------------------------------------------------------
  -- SIGN Function
  -----------------------------------------------------------------------------
  function sign (arg : in signed) return std_logic is
    variable res : std_logic;
  begin
    res := arg(arg'left);
    return(res);
  end sign;

  -----------------------------------------------------------------------------
  -- SIGN_EXTEND Function
  -----------------------------------------------------------------------------
  function sign_extend (arg : signed; size : positive) return signed is
    variable res : signed(size-1 downto 0);
  begin
      if arg'length > size then
          assert arg'length < size report "WARNING, can't sign extend" severity warning;
      end if;
    for i in arg'length to size-1 loop
      res(i) := arg(arg'left);
    end loop;  -- i
    res(arg'length-1 downto 0) := arg;
    return(res);
  end sign_extend;

  -----------------------------------------------------------------------------
  -- XT1 Function
  -----------------------------------------------------------------------------
  function xt1 (arg : signed) return signed is
    variable res : signed(arg'length downto 0);
  begin
    res := arg(arg'left) & arg;
    return(res);
  end xt1;

  -----------------------------------------------------------------------------
  -- IS_ODD Function
  -----------------------------------------------------------------------------
  function is_odd(arg : integer) return boolean is
  begin
    return ((arg mod 2) = 1);
  end is_odd;


  -----------------------------------------------------------------------------
  -- AND_REDUCE Function
  -----------------------------------------------------------------------------
  function and_reduce(arg : std_logic_vector) return std_logic is
    variable res : std_logic;
  begin
    res := '1';
    for i in arg'range loop
      res := res and arg(i);
    end loop;
    return res;
  end;

  function and_reduce(arg : unsigned) return std_logic is
    variable res : std_logic;
  begin
    res := '1';
    for i in arg'range loop
      res := res and arg(i);
    end loop;
    return res;
  end;


  -----------------------------------------------------------------------------
  -- OR_REDUCE Function
  -----------------------------------------------------------------------------
  function or_reduce(arg : unsigned) return std_logic is
    variable res : std_logic;
  begin
    res := '0';
    for i in arg'range loop
      res := res or arg(i);
    end loop;
    return res;
  end;

  function or_reduce(arg : std_logic_vector) return std_logic is
    variable res : std_logic;
  begin
    res := '0';
    for i in arg'range loop
      res := res or arg(i);
    end loop;
    return res;
  end;

  ---------------------------------------------------------------------------
  -- HIGHEST_ONE Function.
  ---------------------------------------------------------------------------
  -- Returns index+1 of the highest asserted bit, or 0 if no bit set.
  -- Vector is evaluated from left to right, not high to low!
  function highest_one(arg : unsigned) return natural is
  begin
    for i in arg'range loop
      if arg(i) = '1' then
        return i+1;
      end if;
    end loop;
    return 0;
  end;

  -----------------------------------------------------------------------------
  -- LOWEST_ONE Function
  -----------------------------------------------------------------------------
  -- Returns index+1 of the lowest asserted bit, or 0 if no bit set.
  -- Vector is evaluated from left to right, not high to low!
  function lowest_one(arg : unsigned) return natural is
  begin
    for i in 0 to arg'length-1 loop
      if (arg(i) = '1') then
        return(i+1);
      end if;
    end loop;
    return(0);
  end;

  -----------------------------------------------------------------------------
  -- COUNT_ONES
  ---------------------------------------------------------------------------
  -- Returns the count of the number of ones.
  function count_ones(arg : unsigned) return natural is
    variable count : integer;
  begin
    count := 0;
    for i in 0 to arg'length-1 loop
      if (arg(i) = '1') then
        count := count + 1;
      end if;
    end loop;
    return count;
  end;

  -----------------------------------------------------------------------------
  -- BIT_REVERSE function
  -----------------------------------------------------------------------------
  function bit_reverse(arg : unsigned) return unsigned is
    variable res : unsigned(arg'range);
  begin
    for i in arg'range loop
      res(i) := arg(arg'high - i);
    end loop;
    return(res);
  end;

  -----------------------------------------------------------------------------
  -- INVERT Function
  -----------------------------------------------------------------------------
  function invert(arg : unsigned)
    return unsigned                     -- (word'high downto 0)
  is
    variable res : unsigned(arg'high downto 0);
  begin

    for i in arg'range loop
      res(i) := not arg(i);
    end loop;
    return (res);
  end invert;

  -----------------------------------------------------------------------------
  -- HALVE_CEIL Function
  -----------------------------------------------------------------------------
  function halve_ceil(arg : natural) return natural is
    variable res : natural;
  begin
    if is_odd(arg) then
      res := (arg+1)/2;
    else
      res := arg/2;
    end if;
    return (res);
  end halve_ceil;

-------------------------------------------------------------------------------
-- DIV_CEIL function
-------------------------------------------------------------------------------
  function div_ceil(a : natural; b : natural) return natural is
    variable res : natural := a/b;
  begin
    if res*b /= a then
      res := res +1;
    end if;
    return res;
  end div_ceil;

end package body auk_dspip_math_pkg_hpfir;
