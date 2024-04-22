library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu2j0_components_pack.all;
use work.test_pkg.all;

entity arith_tap is
end arith_tap;

architecture tb  of arith_tap is
  function test_t(a,b : std_logic_vector(31 downto 0);
                  ci : std_logic;
                  arith_func : arith_func_t;
                  sr_func : arith_sr_func_t) return std_logic
  is
    variable r : std_logic_vector(32 downto 0);
    variable sr : sr_t;
  begin
    r := arith_unit(a, b, arith_func, ci);
    sr := arith_update_sr(sr, a(a'left), b(b'left), r(31 downto 0), r(r'left),
                          arith_func, sr_func);
    return sr.t;
  end;
begin
  process
    begin
    test_plan(106,"Arith unit");
    test_comment("ADD");
    test_equal(arith_unit(slv(0),slv(0),ADD,'0'),"0" & slv(0),"0 + 0");
    test_equal(arith_unit(slv(0),slv(1),ADD,'0'),"0" & slv(1),"0 + 1");
    test_equal(arith_unit(slv(1),slv(0),ADD,'0'),"0" & slv(1),"1 + 0");
    test_equal(arith_unit(slv(0),slv(1),ADD,'1'),"0" & slv(2),"0 + 1 + 1");
    test_equal(arith_unit(slv(0),slv(0),ADD,'1'),"0" & slv(1),"0 + 0 + 1");
    test_equal(arith_unit(slv(10123),slv(28484),ADD,'1'),"0" & slv(38608),"10123 + 28484 + 1");
    test_equal(arith_unit(x"7fffffff", slv(1),ADD,'0'), "0" & x"80000000", "0x80000000 + 1");
    test_equal(arith_unit(x"7fffffff", x"7fffffff",ADD,'0'), "0" & x"fffffffe", "2 * 0x7fffffff");
    test_equal(arith_unit(x"7fffffff", x"7fffffff",ADD,'1'), "0" & x"ffffffff", "2 * 0x7fffffff + 1");
    test_equal(arith_unit(x"7fffffff", x"80000000",ADD,'1'), "1" & x"00000000", "0x7fffffff + 0x80000000 + 1");
    test_equal(arith_unit(x"7fffffff", x"80001f80",ADD,'1'), "1" & x"00001f80", "0x7fffffff + 0x80001f80 + 1");

    test_comment("SUB");
    test_equal(arith_unit(slv(0),slv(0),SUB,'0'),"0" & slv(0),"0 - 0");
    test_equal(arith_unit(slv(0),slv(0),SUB,'1'),"1" & x"ffffffff","0 - 0 - 1");
    test_equal(arith_unit(slv(1),slv(0),SUB,'0'),"0" & slv(1),"1 - 0");
    test_equal(arith_unit(slv(1),slv(0),SUB,'1'),"0" & slv(0),"1 - 0 - 1");

    test_equal(arith_unit(slv(28484), slv(10123),SUB,'0'),"0" & slv(18361),"28484 - 10123 - 0");
    test_equal(arith_unit(slv(28484), slv(10123),SUB,'1'),"0" & slv(18360),"28484 - 10123 - 1");
    test_equal(arith_unit(x"f0000000", slv(1),SUB,'0'), "0" & x"efffffff", "0xf0000000 - 1");
    test_equal(arith_unit(x"f0000000", slv(1),SUB,'1'), "0" & x"effffffe", "0xf0000000 - 1 - 1");
    test_equal(arith_unit(x"7fffffff", x"7fffffff",SUB,'0'), "0" & x"00000000", "0x7fffffff - 0x7fffffff");
    test_equal(arith_unit(x"7fffffff", x"7fffffff",SUB,'1'), "1" & x"ffffffff", "0x7fffffff - 0x7fffffff - 1");

    test_equal(arith_unit(x"7fffffff", x"80000000",SUB,'0'), "1" & x"ffffffff", "0x7fffffff - 0x80000000");
    test_equal(arith_unit(x"7fffffff", x"80001f80",SUB,'0'), "1" & x"ffffe07f", "0x7fffffff - 0x80001f80");

    test_comment("ZERO");
    test_equal(test_t(slv(0), slv(0), '0', ADD, ZERO), '1', "zero? 0 + 0");
    test_equal(test_t(slv(0), slv(0), '1', ADD, ZERO), '0', "zero? 0 + 0 + 1");
    test_equal(test_t(x"ffffffff", slv(0), '0', ADD, ZERO), '0', "zero? 0xfffffffff + 0");
    -- carry out should be ignored by zero
    test_equal(test_t(x"ffffffff", slv(0), '1', ADD, ZERO), '1', "zero? 0xfffffffff + 0 + 1");
    test_equal(test_t(x"ffffffff", slv(1), '0', ADD, ZERO), '1', "zero? 0xfffffffff + 1 + 0");
    test_equal(test_t(x"ffffffff", slv(1), '1', ADD, ZERO), '0', "zero? 0xfffffffff + 1 + 1");
    test_equal(test_t(x"ffffffff", slv(10), '0', ADD, ZERO), '0', "zero? 0xfffffffff + 0xa + 0");

    test_comment("ADDV");
    test_equal(test_t(x"00000001",x"7ffffffe",'0',ADD,OVERUNDERFLOW),'0',"addv R0,R1");
    test_equal(test_t(x"00000002",x"7ffffffe",'0',ADD,OVERUNDERFLOW),'1',"addv R0,R1 overflow");
    test_equal(test_t(x"80000000",x"80000000",'0',ADD,OVERUNDERFLOW),'1',"addv 2 negative numbers");
    test_equal(test_t(slv(-1),slv(-1),'0',ADD,OVERUNDERFLOW),'0',"addv -1 and -1");

    test_comment("SUBV");
    test_equal(test_t(slv(10),slv(2),'0',SUB,OVERUNDERFLOW),'0',"10 subv 1");
    test_equal(test_t(x"80000001",slv(2),'0',SUB,OVERUNDERFLOW),'1',"subv 2");
    test_equal(test_t(x"7ffffffe",slv(-2),'0',SUB,OVERUNDERFLOW),'1',"subv 3");
    test_equal(test_t(x"7ffffffe",slv(2),'0',SUB,OVERUNDERFLOW),'0',"subv 4");

    test_comment("UGRTER");
    test_equal(test_t(slv(0), slv(0),'0',SUB,UGRTER),'0',"0 > 0");
    test_equal(test_t(slv(1), slv(0),'0',SUB,UGRTER),'1',"1 > 0");
    test_equal(test_t(slv(0), slv(1),'0',SUB,UGRTER),'0',"0 > 1");
    test_equal(test_t(slv(2345),slv(2345),'0',SUB,UGRTER),'0',"test positive = positive");
    test_equal(test_t(slv(1345),slv(2345),'0',SUB,UGRTER),'0',"test positive > positive");
    test_equal(test_t(slv(2345),slv(1345),'0',SUB,UGRTER),'1',"test positive < positive");
    test_equal(test_t(slv(1345),slv(-2345),'0',SUB,UGRTER),'0',"test positive > negative");
    test_equal(test_t(slv(-2345),slv(1345),'0',SUB,UGRTER),'1',"test negative < positive");
    test_equal(test_t(slv(-2345),slv(-2345),'0',SUB,UGRTER),'0',"test negative = negative");
    test_equal(test_t(slv(-1345),slv(-2345),'0',SUB,UGRTER),'1',"test negative > negative");
    test_equal(test_t(slv(-2345),slv(-1345),'0',SUB,UGRTER),'0',"test negative < negative");

    test_comment("UGRTER_EQ");
    test_equal(test_t(slv(0), slv(0),'0',SUB,UGRTER_EQ),'1',"0 >= 0");
    test_equal(test_t(slv(1), slv(0),'0',SUB,UGRTER_EQ),'1',"1 >= 0");
    test_equal(test_t(slv(0), slv(1),'0',SUB,UGRTER_EQ),'0',"0 >= 1");
    test_equal(test_t(slv(2345),slv(2345),'0',SUB,UGRTER_EQ),'1',"test positive = positive");
    test_equal(test_t(slv(1345),slv(2345),'0',SUB,UGRTER_EQ),'0',"test positive > positive");
    test_equal(test_t(slv(2345),slv(1345),'0',SUB,UGRTER_EQ),'1',"test positive < positive");
    test_equal(test_t(slv(1345),slv(-2345),'0',SUB,UGRTER_EQ),'0',"test positive > negative");
    test_equal(test_t(slv(-2345),slv(1345),'0',SUB,UGRTER_EQ),'1',"test negative < positive");
    test_equal(test_t(slv(-2345),slv(-2345),'0',SUB,UGRTER_EQ),'1',"test negative = negative");
    test_equal(test_t(slv(-1345),slv(-2345),'0',SUB,UGRTER_EQ),'1',"test negative > negative");
    test_equal(test_t(slv(-2345),slv(-1345),'0',SUB,UGRTER_EQ),'0',"test negative < negative");

    test_comment("SGRTER_EQ");
    test_equal(test_t(slv(0), slv(0),'0',SUB,SGRTER_EQ),'1',"0 > 0");
    test_equal(test_t(slv(1), slv(0),'0',SUB,SGRTER_EQ),'1',"1 > 0");
    test_equal(test_t(slv(0), slv(1),'0',SUB,SGRTER_EQ),'0',"0 > 1");
    test_equal(test_t(slv(2345),slv(2345),'0',SUB,SGRTER_EQ),'1',"test positive = positive");
    test_equal(test_t(slv(1345),slv(2345),'0',SUB,SGRTER_EQ),'0',"test positive > positive");
    test_equal(test_t(slv(2345),slv(1345),'0',SUB,SGRTER_EQ),'1',"test positive < positive");
    test_equal(test_t(slv(1345),slv(-2345),'0',SUB,SGRTER_EQ),'1',"test positive > negative");
    test_equal(test_t(slv(-2345),slv(1345),'0',SUB,SGRTER_EQ),'0',"test negative < positive");
    test_equal(test_t(slv(-2345),slv(-2345),'0',SUB,SGRTER_EQ),'1',"test negative = negative");
    test_equal(test_t(slv(-1345),slv(-2345),'0',SUB,SGRTER_EQ),'1',"test negative > negative");
    test_equal(test_t(slv(-2345),slv(-1345),'0',SUB,SGRTER_EQ),'0',"test negative < negative");

    test_equal(test_t(x"80000000",x"7fffffff",'0',SUB,SGRTER_EQ),'0',"test signed greater than (negative a)");
    test_equal(test_t(x"7fffffff",x"80000000",'0',SUB,SGRTER_EQ),'1',"test signed greater than (positive a)");
    test_equal(test_t(x"7fffffff",x"7fffffff",'0',SUB,SGRTER_EQ),'1',"test signed greater than (equal)");

    test_equal(test_t(slv(1030),slv(345),'0',SUB,SGRTER_EQ),'1',"test signed greater than (equal)");
    test_equal(test_t(slv(345),slv(1030),'0',SUB,SGRTER_EQ),'0',"test signed greater than (equal)");
    test_equal(test_t(x"abcdef01",x"bbcdef01",'0',SUB,SGRTER_EQ),'0',"test signed greater than (equal)");
    test_equal(test_t(x"bbcdef01",x"abcdef01",'0',SUB,SGRTER_EQ),'1',"test signed greater than (equal)");

    test_comment("SGRTER");
    test_equal(test_t(slv(0), slv(0),'0',SUB,SGRTER),'0',"0 > 0");
    test_equal(test_t(slv(1), slv(0),'0',SUB,SGRTER),'1',"1 > 0");
    test_equal(test_t(slv(0), slv(1),'0',SUB,SGRTER),'0',"0 > 1");
    test_equal(test_t(slv(2345),slv(2345),'0',SUB,SGRTER),'0',"test positive = positive");
    test_equal(test_t(slv(1345),slv(2345),'0',SUB,SGRTER),'0',"test positive > positive");
    test_equal(test_t(slv(2345),slv(1345),'0',SUB,SGRTER),'1',"test positive < positive");
    test_equal(test_t(slv(1345),slv(-2345),'0',SUB,SGRTER),'1',"test positive > negative");
    test_equal(test_t(slv(-2345),slv(1345),'0',SUB,SGRTER),'0',"test negative < positive");
    test_equal(test_t(slv(-2345),slv(-2345),'0',SUB,SGRTER),'0',"test negative = negative");
    test_equal(test_t(slv(-1345),slv(-2345),'0',SUB,SGRTER),'1',"test negative > negative");
    test_equal(test_t(slv(-2345),slv(-1345),'0',SUB,SGRTER),'0',"test negative < negative");

    test_equal(test_t(x"80000000",x"7fffffff",'0',SUB,SGRTER),'0',"test signed greater than (negative a)");
    test_equal(test_t(x"7fffffff",x"80000000",'0',SUB,SGRTER),'1',"test signed greater than (positive a)");
    test_equal(test_t(x"7fffffff",x"7fffffff",'0',SUB,SGRTER),'0',"test signed greater than (equal)");

    test_equal(test_t(slv(1030),slv(345),'0',SUB,SGRTER),'1',"test signed greater than (equal)");
    test_equal(test_t(slv(345),slv(1030),'0',SUB,SGRTER),'0',"test signed greater than (equal)");
    test_equal(test_t(x"abcdef01",x"bbcdef01",'0',SUB,SGRTER),'0',"test signed greater than (equal)");
    test_equal(test_t(x"bbcdef01",x"abcdef01",'0',SUB,SGRTER),'1',"test signed greater than (equal)");

    test_comment("GRTER_ZERO");
    test_equal(test_t(slv(1),slv(0),'0',SUB,SGRTER),'1',"1 > 0");
    test_equal(test_t(slv(-1),slv(0),'0',SUB,SGRTER),'0',"-1 > 0");
    test_equal(test_t(slv(1000),slv(0),'0',SUB,SGRTER),'1',"1000 > 0");
    test_equal(test_t(slv(-1000),slv(0),'0',SUB,SGRTER),'0',"-1000 > 0");
    test_equal(test_t(slv(0),slv(0),'0',SUB,SGRTER),'0',"0 > 0");

    test_comment("GRTER_EQ_ZERO");
    test_equal(test_t(slv(1),slv(0),'0',SUB,SGRTER_EQ),'1',"1 >= 0");
    test_equal(test_t(slv(-1),slv(0),'0',SUB,SGRTER_EQ),'0',"-1 >= 0");
    test_equal(test_t(slv(1000),slv(0),'0',SUB,SGRTER_EQ),'1',"1000 >= 0");
    test_equal(test_t(slv(-1000),slv(0),'0',SUB,SGRTER_EQ),'0',"-1000 >= 0");
    test_equal(test_t(slv(0),slv(0),'0',SUB,SGRTER_EQ),'1',"0 >= 0");

    test_finished("done");
    wait for 40 ns;
    wait;
    end process;
end tb ;
