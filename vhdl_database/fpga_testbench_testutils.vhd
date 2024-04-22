    library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

package test_utils is
  procedure assert_equals(expected : std_logic_vector; received : std_logic_vector; message : string);
  procedure assert_equals(expected : signed; received : signed; message : string);
  procedure assert_equals(expected : std_logic; received : std_logic; message : string);
  procedure assert_equals(expected : integer; received : integer; message : string);
end;

package body test_utils is

  shared variable test_i : integer := 0;

  function to_string(sv: signed) return string is
    use Std.TextIO.all;
    variable bv: bit_vector(sv'range) := 
    to_bitvector(std_logic_vector(sv));
    variable lp: line;
  begin
    write(lp, bv);
    return lp.all;
  end;

  procedure assert_equals(
  expected : std_logic_vector;
  received : std_logic_vector;
  message : string) is
  begin
    assert_equals(signed(expected), signed(received), message);
  end;

  procedure assert_equals(
  expected : signed;
  received : signed;
  message : string) is
  begin
    assert expected = received
    report message & " [Expected " & to_string(expected) & " but was " & to_string(received) & "]"
    severity failure;

    test_i:=test_i+1;
    report "Passed test [" & integer'image(test_i) & "] (" & message & ")";
  end;

  procedure assert_equals(
  expected : std_logic;
  received : std_logic;
  message : string) is
  begin
    assert expected = received
    report message & " [Expected " & std_logic'image(expected) & " but was " & std_logic'image(received) & "]"
    severity failure;

    test_i:=test_i+1;
    report "Passed test [" & integer'image(test_i) & "] (" & message & ")";
  end;
  
  procedure assert_equals(
  expected : integer;
  received : integer; 
  message : string) is
  begin
    assert expected = received
    report message & " [Expected " & integer'image(expected) & " but was " & integer'image(received) & "]" severity failure;

    test_i:=test_i+1;
    report "Passed test [" & integer'image(test_i) & "]";
  end;
  end;
