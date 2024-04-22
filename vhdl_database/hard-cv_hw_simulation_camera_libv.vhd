-- Copyright 2010 Martin Thompson (martin@parallelpoints.com). All
-- rights reserved.
-- 
-- Redistribution and use in source, binary and physical forms, with
-- or without modification, are permitted provided that the following
-- conditions are met:
-- 
--    1. Redistributions of source code must retain the above
--       copyright notice, this list of conditions and the following
--       disclaimer.
-- 
--    2. Redistributions in binary or physical form must reproduce the
--       above copyright notice, this list of conditions and the
--       following disclaimer in the documentation and/or other
--       materials provided with the distribution.
-- 
-- THE FILES ARE PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
-- CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-- WITH THE FILES OR THE USE OR OTHER DEALINGS IN THE FILES

package libv is

    -- Function: number of bits
    -- returns number of bits required to represent 'value'
    function number_of_bits (value : positive) return positive;

    type integer_vector is array (integer range <>) of integer;

    function num_chars (val : integer) return integer;
    
    procedure assert_equal (prefix : string; got, expected : integer; level: severity_level := error);
    procedure assert_equal (prefix        : string; got, expected : integer_vector; level : severity_level := error);

    function str (val : integer; length : natural := 0) return string;
    function str (val : boolean; length : natural range 0 to 1 := 0) return string;
end package libv;

package body libv is
    function max (a,b : integer) return integer is
    begin  -- function max
        if a > b then
            return a;
        else
            return b;
        end if;
    end function max;
    function num_chars (val : integer) return integer is
        variable temp : integer;
        variable chars_needed : natural := 0;
    begin  -- function num_chars
        if val <= 0 then
             chars_needed := 1;  -- start needing one char for potential '-' sign or for the zero itself
        end if;
        temp := abs(val);
        while temp > 0 loop
            temp := temp / 10;
            chars_needed := chars_needed + 1;
        end loop;
        return chars_needed;
    end function num_chars;

    -- Function: str(integer)
    -- Takes an integer and optional length.  If length is zero, simply returns a string representing the integer
    -- If length is too short to hold the string, then the whole string is also returned
    -- If length is longer than the integer, the string representation will be right-aligned within a string 1 to length 
    function str (val : integer; length : natural := 0) return string is
        constant chars_needed : natural := num_chars(val);
        variable s : string(1 to max(length, chars_needed)) := (others => ' ');
    begin  -- function str
        if length = 0 then
            return integer'image(val);
        end if;
        if chars_needed > length then
            report "Can't fit " & integer'image(val) & " into " & integer'image(length) & " character(s) - returning full width" severity warning;
            return integer'image(val);
        end if;
        s(s'high-(chars_needed-1) to s'high) := integer'image(val);
        return s;
    end function str;

    
    -- Function: str(boolean, length)
    -- Takes a boolean and optional length.
    -- If length is 0, simply returns a string "True" or "False"
    -- If length is 1, returns "T" or "F"
    function str (val : boolean; length:natural range 0 to 1 := 0) return string is
    begin  -- function str
        if length = 0 then
            return boolean'image(val);
        end if;
        if length = 1 then
            if val then
                return "T";
            else
                return "F";
            end if;
        end if;
    end function str;
    ------------------------------------------------------------------------------------------------------------------------------
    
    function number_of_bits (
        value : positive)
        return positive is
        variable bits : positive := 1;
    begin  -- function number_of_bits
        while 2**bits <= value loop
            bits := bits + 1;
        end loop;
        return bits;
    end function number_of_bits;

    procedure assert_equal (
        prefix        : string;
        got, expected : integer;
        level : severity_level := error) is
    begin  -- procedure assert_equal
        assert got = expected
            report prefix & " wrong.  Got " & str(got) & " expected " & str(expected) & "(difference=" & str(got-expected) &")"
            severity level;
    end procedure assert_equal;

    procedure assert_equal (
        prefix        : string;
        got, expected : integer_vector;
        level : severity_level := error) is 
        variable g,e : integer;
        constant top : integer := got'length-1;
    begin  -- procedure assert_equal
        assert got'length = expected'length
            report prefix & " length wrong.  Got " & str(got'length)
            & " expected " & str(expected'length)
            & "(difference=" & str(got'length-expected'length) &")"
            severity level;
        for i in 0 to top loop
            g := got(got'low+i);
            e := expected(expected'low+i);
            assert g = e
                report prefix & CR & LF
                & "       got(" & str(got'low+i) & ") = " & str(g) & CR & LF
                & "  expected(" & str(expected'low+i) & ") = " & str(e)
                severity level;
        end loop;  -- i
    end procedure assert_equal;
end package body libv;

entity tb_libv is
    
end entity tb_libv;
use work.libv.all;
architecture test of tb_libv is

begin  -- architecture test

    process is
    begin
        assert num_chars(1) = 1 report "Num chars wrong" severity error;
        assert num_chars(-1) = 2 report "Num chars wrong" severity error;
        assert num_chars(9) = 1 report "Num chars wrong" severity error;
        assert num_chars(-9) = 2 report "Num chars wrong" severity error;
        assert num_chars(19) = 2 report "Num chars wrong" severity error;
        assert num_chars(-99) = 3 report "Num chars wrong" severity error;
        assert num_chars(1999) = 4 report "Num chars wrong" severity error;
        assert num_chars(-9999) = 5 report "Num chars wrong" severity error;

        assert number_of_bits(1) = 1 report "num bits wrong" severity error;
        assert number_of_bits(2) = 2 report "num bits wrong" severity error;
        assert number_of_bits(3) = 2 report "num bits wrong" severity error;
        assert number_of_bits(7) = 3 report "num bits wrong" severity error;
        assert number_of_bits(8) = 4 report "num bits wrong" severity error;
        assert number_of_bits(200) = 8 report "num bits wrong" severity error;
        assert number_of_bits(1200) = 11 report "num bits wrong" severity error;

        assert str(  0) = "0" report "str(int) wrong" severity error;
        assert str( 10) = "10" report "str(int) wrong" severity error;
        assert str(-10) = "-10" report "str(int) wrong" severity error;
        assert str(  0,1) = "0" report "str(int) wrong" severity error;
        assert str(  0,2) = " 0" report "str(int) wrong" severity error;
        assert str( 10,1) = "10" report "str(int) wrong" severity error;
        assert str(-10,1) = "-10" report "str(int) wrong" severity error;
        assert str( 10,4) = "  10" report "str(int) wrong" severity error;
        assert str(-10,4) = " -10" report "str(int) wrong" severity error;

        assert str(false) = "false" report "str(boolean) wrong" severity error;
        assert str(true)  = "true" report "str(boolean) wrong" severity error;
        assert str(false, 1) = "F" report "str(boolean) wrong" severity error;
        assert str(true, 1)  = "T" report "str(boolean) wrong" severity error;
        report test'path_name & "Tests complete" severity note;
        wait;
    end process;

end architecture test;