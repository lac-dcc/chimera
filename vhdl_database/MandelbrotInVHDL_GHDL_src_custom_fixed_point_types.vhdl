--------------------------------------------------------------------------------
-- Fixed point - nicely arranged types for easy re-use.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;

package custom_fixed_point_types is

    -- 27 fractional bits should be enough for my mandelbrot computations.

    constant integerPart  : integer := 6;
    constant fractionalPart : integer := 26;

    subtype custom_fixed_point_type is
        sfixed(integerPart - 1 downto -fractionalPart);

    function to_sfixed_custom(arg : real) return unresolved_sfixed;
    function to_sfixed_custom(arg : integer) return unresolved_sfixed;
    function to_sfixed_custom(arg : std_logic_vector) return unresolved_sfixed;
end package custom_fixed_point_types;


package body custom_fixed_point_types is

    -- Helper functions - they make the code in my main state machine
    -- and in the mandelbrot engine much cleaner.

    function to_sfixed_custom(arg : real)
        return unresolved_sfixed
    is
        variable result : unresolved_sfixed(
            integerPart - 1 downto -fractionalPart);
    begin
        result := to_sfixed(
            arg => arg,
            left_index => integerPart - 1,
            right_index => -fractionalPart);
        return result;
    end function to_sfixed_custom;

    -------------------------------------------------
    function to_sfixed_custom(arg : integer)
        return unresolved_sfixed
    is
        variable result : unresolved_sfixed(
            integerPart - 1 downto -fractionalPart);
    begin
        result := to_sfixed(
            arg => arg,
            left_index => integerPart - 1,
            right_index => -fractionalPart);
        return result;
    end function to_sfixed_custom;

    -------------------------------------------------
    function to_sfixed_custom(arg : std_logic_vector)
        return unresolved_sfixed
    is
        variable result : unresolved_sfixed(
            integerPart - 1 downto -fractionalPart);
    begin
        result := to_sfixed(
            arg,
            left_index => integerPart - 1,
            right_index => -fractionalPart);
        return result;
    end function to_sfixed_custom;

end package body custom_fixed_point_types;
