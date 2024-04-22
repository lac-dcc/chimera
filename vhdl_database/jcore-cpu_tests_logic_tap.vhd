library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu2j0_components_pack.all;
use work.test_pkg.all;

entity logic_tap is
end logic_tap;

architecture tb  of logic_tap is
  function test_t(a,b : std_logic_vector(31 downto 0);
                  logic_func : logic_func_t;
                  sr_func : logic_sr_func_t) return std_logic
  is
    variable r : std_logic_vector(31 downto 0);
    variable sr : sr_t;
  begin
    r := logic_unit(a, b, logic_func);
    sr := logic_update_sr(sr, r, sr_func);
    return sr.t;
  end;
begin
  process
  begin
    test_plan(30,"Logic unit");

    test_comment("AND");
    test_equal(logic_unit(x"aaaaaaaa",slv(0),LOGIC_AND),slv(0),"AND 1");
    test_equal(logic_unit(slv(0),x"aaaaaaaa",LOGIC_AND),slv(0),"AND 2");
    test_equal(logic_unit(x"aaaaaaaa",x"55555555",LOGIC_AND),x"00000000","AND 3");
    test_equal(logic_unit(x"0000000f",x"ffffffff",LOGIC_AND),x"0000000f","AND 4");
    test_equal(logic_unit(x"ffffffff",x"0000000f",LOGIC_AND),x"0000000f","AND 5");
    test_equal(logic_unit(x"00abcdef",x"99999999",LOGIC_AND),x"00898989","AND 6");
    test_comment("NOT");
    test_equal(logic_unit(slv(0),x"aaaaaaaa",LOGIC_NOT),x"55555555","not 1");
    test_equal(logic_unit(slv(12312),x"aaaaaaaa",LOGIC_NOT),x"55555555","NOT ignores a");
    test_equal(logic_unit(slv(0),x"1f1f1f1f",LOGIC_NOT),x"e0e0e0e0","NOT 2");
    test_comment("OR");
    test_equal(logic_unit(x"aaaa5555",x"55550000",LOGIC_OR),x"ffff5555","OR 1");
    test_equal(logic_unit(x"00000008",x"000000f0",LOGIC_OR),x"000000f8","OR 2");
    test_equal(logic_unit(x"00000000",x"00000000",LOGIC_OR),x"00000000","OR 3");
    test_comment("XOR");
    test_equal(logic_unit(x"aaaaaaaa",x"55555555",LOGIC_XOR),x"ffffffff","XOR 1");
    test_equal(logic_unit(x"000000f0",x"ffffffff",LOGIC_XOR),x"ffffff0f","XOR 2");

    test_comment("BYTE_EQUAL");
    test_equal(test_t(x"0000005a",x"aaaaaa5a",LOGIC_XOR,BYTE_EQ),'1',"test eqll");
    test_equal(test_t(x"cccc12aa",x"00001200",LOGIC_XOR,BYTE_EQ),'1',"test eqlh");
    test_equal(test_t(x"12345678",x"00340000",LOGIC_XOR,BYTE_EQ),'1',"test eqhl");
    test_equal(test_t(x"ff987654",x"ff000000",LOGIC_XOR,BYTE_EQ),'1',"test eqhh");
    test_comment("BYTE_NOT_EQUAL");
    test_equal(test_t(x"0000004a",x"aaaaaa5a",LOGIC_XOR,BYTE_EQ),'0',"test eqll");
    test_equal(test_t(x"cccc11aa",x"00001200",LOGIC_XOR,BYTE_EQ),'0',"test eqlh");
    test_equal(test_t(x"12335678",x"00340000",LOGIC_XOR,BYTE_EQ),'0',"test eqhl");
    test_equal(test_t(x"fe987654",x"ff000000",LOGIC_XOR,BYTE_EQ),'0',"test eqhh");
    test_equal(test_t(x"7f987654",x"ff000000",LOGIC_XOR,BYTE_EQ),'0',"test msb");
    test_equal(test_t(x"ff000000",x"0ff00ff0",LOGIC_XOR,BYTE_EQ),'0',"test mismatch");

    test_comment("ZERO");
    test_equal(test_t(x"fe987654",x"ff000000",LOGIC_AND,ZERO),'0',"zero 1");
    test_equal(test_t(x"01987654",x"ff000000",LOGIC_AND,ZERO),'0',"zero 2");
    test_equal(test_t(x"01987654",x"fe000000",LOGIC_AND,ZERO),'1',"zero 3");

    test_equal(test_t(x"00000000",x"00000000",LOGIC_XOR,ZERO),'1',"zero 4");
    test_equal(test_t(x"00000101",x"00000100",LOGIC_XOR,ZERO),'0',"zero 5");
    test_equal(test_t(x"00000101",x"00000101",LOGIC_XOR,ZERO),'1',"zero 6");

    test_finished("done");
    wait for 40 ns;
    wait;
    end process;
end tb ;
