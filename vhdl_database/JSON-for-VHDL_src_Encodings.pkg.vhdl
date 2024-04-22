library ieee;
use ieee.fixed_pkg.from_hex_string;
use ieee.fixed_pkg.to_unsigned;
use ieee.fixed_pkg.to_hex_string;
use ieee.fixed_pkg.to_ufixed;
use ieee.fixed_pkg.ufixed;
use ieee.numeric_std.to_integer;

package Encodings is

  function base16_encode(constant str: string) return string;
  function base16_decode(constant str: string) return string;

end package;

package body Encodings is

  function lower (constant str: string) return string is
    variable result : string(str'range) := str;
  begin
    for i in str'range loop
      if (character'pos(str(i)) >= character'pos('A')) and (character'pos(str(i)) <= character'pos('Z')) then
        result(i) := character'val(character'pos(str(i)) + character'pos('a') - character'pos('A'));
      end if;
    end loop;
    return result;
  end function;

  function base16_encode(constant str: string) return string is
    constant str_i : string(1 to str'length) := str;
    variable result: string (1 to str'length * 2);
  begin
    for x in str_i'range loop
      result(2 * x - 1 to 2 * x) := lower(to_hex_string(
        to_ufixed(character'pos(str_i(x)), 7, 0)
      )(1 to 2));
    end loop;
    return result;
  end function;

  function base16_decode(constant str : string) return string is
    alias str_i : string(1 to str'length) is str;
    variable result : string (1 to (str'length + 1) / 2);
    variable byte_as_hex : string(1 to 2);
  begin
    for x in result'range loop
      byte_as_hex := str_i(2 * x - 1 to 2 * x);
      result(x) := character'val(to_integer(to_unsigned(ufixed'(from_hex_string(byte_as_hex, 7, 0)), 8)));
    end loop;
    return result;
  end function;

end package body;
