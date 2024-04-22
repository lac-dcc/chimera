library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu2j0_components_pack.all;
use work.test_pkg.all;

entity manip_tap is
end;

architecture tb of manip_tap is
begin
  process
    begin
    test_plan(11,"test manip()");
    test_equal(manip(x"ffffffff", x"12345678", SWAP_BYTE), x"12347856", "swap byte");
    test_equal(manip(x"ffffffff", x"12345678", SWAP_WORD), x"56781234", "swap word");
    test_equal(manip(x"ffffffff", x"12345678", EXTEND_UBYTE), x"00000078", "ext ubyte");
    test_equal(manip(x"ffffffff", x"12345678", EXTEND_UWORD), x"00005678", "ext uword");
    test_equal(manip(x"ffffffff", x"12345678", EXTEND_SBYTE), x"00000078", "ext sbyte 0");
    test_equal(manip(x"ffffffff", x"123456C8", EXTEND_SBYTE), x"FFFFFFC8", "ext sbyte 1");
    test_equal(manip(x"ffffffff", x"12345678", EXTEND_SWORD), x"00005678", "ext sword 0");
    test_equal(manip(x"ffffffff", x"1234C678", EXTEND_SWORD), x"FFFFC678", "ext sword 1");
    test_equal(manip(x"abcdef09", x"12345678", EXTRACT), x"5678abcd", "extract");
    test_equal(manip(x"ffffffff", x"12345678", SET_BIT_7), x"123456F8", "set bit 7 0");
    test_equal(manip(x"ffffffff", x"12345698", SET_BIT_7), x"12345698", "set bit 7 1");
    test_finished("done");
    wait;
    end process;
end;
