library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.types.all;
use ahir.subprograms.all;

package wire_pad is

  function zero_pad (
    x             : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector;

  function zero_pad (
    x             : ApInt;
    constant h, l : integer)
    return ApInt;

  function zero_pad (
    x             : ApFloat;
    constant h, l : integer)
    return ApFloat;

  function zero_pad_ascending (
    x             : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector;

  function zero_pad_descending (
    x             : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector;

end wire_pad;

package body wire_pad is

  function zero_pad (
    x             : ApInt;
    constant h, l : integer)
    return ApInt is
  begin
    return To_ApInt(zero_pad(To_SLV(x), h, l));
  end zero_pad;
  
  function zero_pad (
    x             : ApFloat;
    constant h, l : integer)
    return ApFloat is
  begin
    return To_ApFloat(zero_pad(To_SLV(x), h, l));
  end zero_pad;
  
  function zero_pad (
    x             : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector is
  begin
    if x'ascending then
      return zero_pad_ascending(x, h, l);
    else
      return zero_pad_descending(x, h, l);
    end if;
  end zero_pad;

  function zero_pad_ascending (
    x             : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector is
    variable z : std_logic_vector(l to h);
  begin
    assert x'ascending report "expected an SLV with ascending range" severity error;
    assert x'high <= h and x'low >= l report "input out of range" severity error;

    if z'low < x'low then
      z(z'low to x'low - 1) := (others => '0');
    end if;

    if z'high > x'high then
      z(x'high + 1 to z'high) := (others => '0');
    end if;

    z(x'low to x'high) := x;

    return z;
  end zero_pad_ascending;

  function zero_pad_descending (
    x             : std_logic_vector;
    constant h, l : integer)
    return std_logic_vector is
    variable z : std_logic_vector(h downto l);
  begin
    assert not x'ascending report "expected an SLV with descending range" severity error;
    assert x'high <= h and x'low >= l report "input out of range" severity error;

    if z'low < x'low then
      z(x'low - 1 downto z'low) := (others => '0');
    end if;

    if z'high > x'high then
      z(z'high downto x'high + 1) := (others => '0');
    end if;

    z(x'high downto x'low) := x;

    return z;
  end zero_pad_descending;

end wire_pad;
