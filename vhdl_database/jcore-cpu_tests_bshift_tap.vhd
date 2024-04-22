library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu2j0_components_pack.all;
use work.test_pkg.all;

entity bshift_tap is
  
end bshift_tap;

architecture tb  of bshift_tap is

  signal y32 : std_logic_vector(31 downto 0);
  
  function bshifter_32(a,b : std_logic_vector(31 downto 0); c : std_logic; ops : shiftfunc_t) return std_logic_vector is
    variable b2 : std_logic_vector(5 downto 0);
  begin
    b2 := b(b'left) & b(4 downto 0);
    return bshifter(a, b2, c, ops);
  end function;

begin  -- tb
       -- 
  y32 <= bshifter_32(x"80000000",x"ffffffe1",'0',logic);

  process

    begin
   
    test_plan(31,"yahoo");
    test_comment("32 bit shifter");
    test_comment("arith shift");
    test_equal(bshifter_32(x"00000000",slv(0),'0',arith),x"00000000","shift 0 by 0");
    test_equal(bshifter_32(x"ffffffff",slv(-32),'0',arith),x"ffffffff","shift -1 right by 32");
    test_equal(bshifter_32(x"00000001",slv(4),'0',arith),x"00000010","shift 1 left by 4");
    test_equal(bshifter_32(x"00000000",slv(-1),'0',arith),x"00000000","shift 0 right by 1");
    test_equal(bshifter_32(x"7fffffff",slv(1),'0',arith),x"fffffffe","shift x7fffffff left by 1");
    test_equal(bshifter_32(x"7fffffff",slv(-1),'0',arith),x"3fffffff","shift x7fffffff right by 1");
    test_equal(bshifter_32(x"00000001",slv(31),'0',arith),x"80000000","shift 1 left by 31");
    test_equal(bshifter_32(x"00000001",slv(32),'0',arith),x"00000001","shift 1 left by 32 is like 0");
    test_equal(bshifter_32(x"80000000",slv(-1),'0',arith),x"c0000000","shift x80000000 right by 1");
    test_equal(bshifter_32(x"80000000",slv(-31),'0',arith),x"ffffffff","shift x80000000 right by 31");
    test_comment("logic shift");
    test_equal(bshifter_32(x"80000000",slv(-1),'0',logic),x"40000000","shift x80000000 right by 1"," ");
    test_equal(bshifter_32(x"80000000",slv(-31),'0',logic),x"00000001","shift x80000000 right by 31"," ");
    test_equal(bshifter_32(x"80000000",slv(-32),'0',logic),x"00000000","shift x80000000 right by 32"," ");
    test_equal(bshifter_32(x"80000007",slv(-3),'0',logic),x"10000000","shift x80000000 right by 3"," ");
    test_equal(bshifter_32(x"80000007",x"8000001d",'0',logic),x"10000000","repeat above - only set bottom 5b and msb"," ");
    test_equal(bshifter_32(x"00000000",slv(0),'0',logic),x"00000000","shift 0 by 0"," ");
    test_equal(bshifter_32(x"00000001",slv(4),'0',logic),x"00000010","shift 1 left by 4"," ");
    test_equal(bshifter_32(x"00000001",slv(31),'0',logic),x"80000000","shift 1 left by 31"," ");
    test_equal(bshifter_32(x"00000001",slv(32),'0',logic),x"00000001","shift 1 left by 32 is like 0"," ");
    test_comment("rotate");
    test_equal(bshifter_32(x"00000000",slv(1),'0',rotate),x"00000000","rotate 0 left by 1"," ");
    test_equal(bshifter_32(x"00000000",slv(-1),'0',rotate),x"00000000","rotate 0 right by 1"," ");
    test_equal(bshifter_32(x"f0000000",slv(1),'0',rotate),x"e0000001","rotate left by 1"," ");
    test_equal(bshifter_32(x"f0000000",slv(-1),'0',rotate),x"78000000","rotate right by 1"," ");
    test_comment("rotc");
    test_equal(bshifter_32(x"0f000000",slv(1),'1',rotc),x"1e000001","rotc left by 1 with c=1"," ");
    test_equal(bshifter_32(x"0f000000",slv(1),'0',rotc),x"1e000000","rotc left by 1 with c=0"," ");
    test_equal(bshifter_32(x"0f000000",slv(-1),'1',rotc),x"87800000","rotc right by 1 with c=1"," ");
    test_equal(bshifter_32(x"0f000000",slv(-1),'0',rotc),x"07800000","rotc right by 1 with c=0"," ");
    test_equal(bshifter_32(x"00000000",slv(1),'1',rotc),x"00000001","rotc 0 left by 1 with c=1"," ");
    test_equal(bshifter_32(x"00000000",slv(-1),'1',rotc),x"80000000","rotc 0 right by 1 with c=1"," ");
    test_equal(bshifter_32(x"ffffffff",slv(1),'0',rotc),x"fffffffe","rotc -1 left by 1 with c=0"," ");
    test_equal(bshifter_32(x"ffffffff",slv(-1),'0',rotc),x"7fffffff","rotc -1 right by 1 with c=0"," ");
    test_finished("done");
    wait for 40 ns;
    
    wait;
    end process;

end tb ;
