-- To the extent possible under law,
--   Martin Thompson, 
--   Mike Tresler,
--   Hendrick Eeckhaut,
--   and Sigasi nv, 
-- have waived all copyright and related or neighbouring
-- rights to the libv project.
-- This work is published from: 
--   United Kingdom, 
--   Belgium
--   and the United States of America.

package libv is
    -- VHDL-2008 users will have to comment this line out as it's
    -- a default part of that standard
    type integer_vector is array(natural range <>) of integer;

    function max (a, b : integer) return integer;
    
    -- Function: number of bits
    -- returns number of bits required to represent 'value'
    function number_of_bits (value : positive) return positive;

    function number_of_chars (val : integer) return integer;

    type frequency is range -2147483647 to 2147483647 units kHz;
        MHz = 1000 kHz;
        GHz = 1000 MHz;
    end units;

    function "/"(a : integer; b : frequency) return time;

    function "/"(a : integer; b : time) return frequency;

    function "*"(a : frequency; b : time) return real;

    function "*"(a : time; b : frequency) return real;

    procedure assert_equal (prefix : string; got, expected : integer; level: severity_level := error);
    procedure assert_equal (prefix : string; got, expected : string; level: severity_level := error);
    procedure assert_equal (prefix : string; got, expected : integer_vector; level : severity_level := error);
    procedure assert_equal (prefix : string; got, expected : time; level : severity_level := error);
    procedure assert_equal (prefix : string; got, expected : frequency; level : severity_level := error);
    procedure assert_equal (prefix : string; got, expected : real; level : severity_level := error);

    -- Function: echo
    -- writes one string to "STD_OUTPUT" without a line feed
    procedure echo ( val : in string := "");        

    function str (val : integer; length : natural := 0) return string;
    function str (val : boolean; length : natural range 0 to 1 := 0) return string;

end package libv;

package body libv is
  
    function max (a,b : integer) return integer is
    begin
        if a > b then
            return a;
        else
            return b;
        end if;
    end function max;
    
    function number_of_chars (val : integer) return integer is
        variable temp : integer;
        variable chars_needed : natural := 0;
    begin
        if val <= 0 then
             chars_needed := 1;  -- start needing one char for potential '-' sign or for the zero itself
        end if;
        temp := abs(val);
        while temp > 0 loop
            temp := temp / 10;
            chars_needed := chars_needed + 1;
        end loop;
        return chars_needed;
    end function number_of_chars;

    -- Function: str(integer)
    -- Takes an integer and optional length.  If length is zero, simply returns a string representing the integer
    -- If length is too short to hold the string, then the whole string is also returned
    -- If length is longer than the integer, the string representation will be right-aligned within a string 1 to length 
    function str (val : integer; length : natural := 0) return string is
        constant chars_needed : natural := number_of_chars(val);
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
    begin
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
        variable bits : natural := 0;
        variable val : natural := value;
    begin
        while val > 0 loop
            bits := bits + 1;
            val  :=  val / 2;
        end loop;
        return bits;
    end function number_of_bits;

    procedure echo (val : in string := "") is
    begin
      std.textio.write(std.textio.output, val);
    end procedure echo;

    procedure assert_equal (
        prefix        : string;
        got, expected : integer;
        level : severity_level := error) is
    begin
        assert got = expected
            report prefix & " wrong.  Got " & str(got) & " expected " & str(expected) & "(difference=" & str(got-expected) &")"
            severity level;
    end procedure assert_equal;
    
    procedure assert_equal (
        prefix        : string;
        got, expected : string;
        level : severity_level := error) is
    begin
        assert got = expected
            report prefix & " wrong.  Got " & got & " expected " & expected &")"
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

    procedure assert_equal(
        prefix        : string;
        got, expected : time;
        level         : severity_level := error) is
    begin
        assert got = expected report prefix & " wrong.  Got " & time'image(got) & " expected " & time'image(expected) & ")" severity level;
    end procedure assert_equal;

    procedure assert_equal(
        prefix        : string;
        got, expected : frequency;
        level         : severity_level := error) is
    begin
        assert got = expected report prefix & " wrong.  Got " & frequency'image(got) & " expected " & frequency'image(expected) & ")" severity level;
    end procedure assert_equal;

    procedure assert_equal(
        prefix        : string;
        got, expected : real;
        level         : severity_level := error) is
    begin
        assert got = expected report prefix & " wrong.  Got " & real'image(got) & " expected " & real'image(expected) & ")" severity level;
    end procedure assert_equal;

    function "/"(a : integer; b : frequency) return time is
    begin
        return a * 1 ms / (b / 1 kHz);
    end function;

    function "/"(a : integer; b : time) return frequency is
    begin
        return (a * 1 GHz) / (b / 1 ns);
    end function;

    function "*"(a : frequency; b : time) return real is
    begin
        return (real(a / 1 Khz) * real(b / 1 ns)) * 1.0E-6;
    end function;

    function "*"(a : time; b : frequency) return real is
    begin
        return (real(b / 1 Khz) * real(a / 1 ns)) * 1.0E-6;
    end function;
end package body libv;

entity tb_libv is
    
end entity tb_libv;
use work.libv.all;
architecture test of tb_libv is
begin  -- architecture test

    test: process is
    begin
        echo ( "______________________ Testing procedure tb_libv" & LF&LF);     
        assert_equal("max", max(1,4), 4);
        assert_equal("max", max(1,1), 1);
        assert_equal("max", max(-1,1), 1);
        assert_equal("max", max(-1,-5), -1);
    
        assert_equal("number_of_chars", number_of_chars(1), 1);
        assert_equal("number_of_chars", number_of_chars(-1), 2);
        assert_equal("number_of_chars", number_of_chars(9), 1);
        assert_equal("number_of_chars", number_of_chars(-9), 2);
        assert_equal("number_of_chars", number_of_chars(19), 2);
        assert_equal("number_of_chars", number_of_chars(1999), 4);
        assert_equal("number_of_chars", number_of_chars(-9999), 5);

        assert_equal("number_of_bits", number_of_bits(1), 1);
        assert_equal("number_of_bits", number_of_bits(2), 2);
        assert_equal("number_of_bits", number_of_bits(3), 2);
        assert_equal("number_of_bits", number_of_bits(7), 3);
        assert_equal("number_of_bits", number_of_bits(8), 4);
        assert_equal("number_of_bits", number_of_bits(200), 8);
        assert_equal("number_of_bits", number_of_bits(1200), 11);
        assert_equal("number_of_bits", number_of_bits(integer'high), 31);

        assert_equal("str(int)", str(0), "0");
        assert_equal("str(int)", str(10), "10");
        assert_equal("str(int)", str(-10), "-10");
        assert_equal("str(int)", str(0,1), "0");
        assert_equal("str(int)", str(0,2), " 0");
        
        assert_equal("str(int)", str(10,4), "  10");
        assert_equal("str(int)", str(-10,4), " -10");
        
        assert_equal("str(boolean)", str(false), "false");
        assert_equal("str(boolean)", str(true), "true");
        assert_equal("str(boolean)", str(false,1), "F");
        assert_equal("str(boolean)", str(true,1), "T");
        
        assert_equal("divide frequency", 1 / 1 MHz, 1 us);
        assert_equal("divide frequency", 1 / 2 kHz, 500 us);
        assert_equal("divide frequency", 1 / 1 GHz, 1 ns);
        assert_equal("divide frequency", 1 / 2 GHz, 500 ps);
        assert_equal("divide frequency", 2 / 4 kHz, 500 us);

        assert_equal("divide by time", 1 GHz, 1 / 1 ns);
        assert_equal("divide by time", 500 kHz, 1 / 2 us);
        assert_equal("divide by time", 500 kHz, 1 / 2 us);
        assert_equal("divide by time", 2 kHz, 1 / 500 us);
        assert_equal("divide by time", 2 MHz, 1 / 500 ns);
        assert_equal("divide by time", 4 kHz, 2 / 500 us);
        assert_equal("multiply time*freq", 1 us * 1 MHz, 1.0);
        assert_equal("multiply time*freq", 1 us * 2 MHz, 2.0);
        assert_equal("multiply time*freq", 1 ms * 100_800 kHz, 100800.0);
        assert_equal("multiply freq*time", 3 MHz * 2 us, 6.0);
        assert_equal("multiply freq*time", 3 MHz * 100 ns, 0.3);
        assert_equal("multiply freq*time", 100_800 kHz * 1 ms, 100800.0);
        echo ("No assertions expected above here __^" & LF&LF);     
        wait for 1 ns; -- ensure Modelsim doesn't rearrange the warning lines relative to the echos
        assert_equal("str(int)", str(10,1), "10");   
        echo ("______________________fit warning expected above ^" & LF&LF);
        wait for 1 ns;
        assert_equal("str(int)", str(-10,1), "-10"); 
        echo ("______________________fit warning expected above ^" & LF&LF);

        report test'path_name & "Tests complete" severity note;
        wait;
    end process;

end architecture test;

-- Expected output:
--
--# ______________________ Testing procedure tb_libv
--# 
--# No assertions expected above here __^
--# 
--# ** Warning: Can't fit 10 into 1 character(s) - returning full width
--#    Time: 0 ps  Iteration: 0  Instance: /tb_libv
--# ______________________fit warning expected above ^
--# 
--# ** Warning: Can't fit -10 into 1 character(s) - returning full width
--#    Time: 0 ps  Iteration: 0  Instance: /tb_libv
--# ______________________fit warning expected above ^
--# 
--# ** Note: :tb_libv:test:Tests complete
--#    Time: 0 ps  Iteration: 0  Instance: /tb_libv
