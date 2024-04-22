library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.cpu2j0_components_pack.all;
use work.test_pkg.all;

entity divider_tap is
  
end divider_tap;

architecture tb  of divider_tap is
  type div_state is record
    m : std_logic;
    q : std_logic;
    t : std_logic;

    dividend : std_logic_vector(31 downto 0);
    divisor : std_logic_vector(31 downto 0);
    step : natural;
    value : std_logic_vector(31 downto 0);
  end record;

  function div_init_u(dividend : std_logic_vector(31 downto 0);
                      divisor : std_logic_vector(31 downto 0))
    return div_state is
    variable r : div_state;
  begin
    r.m := '0';
    r.q := '0';
    r.t := '0';
    r.dividend := dividend;
    r.divisor := divisor;
    r.step := 0;
    r.value := dividend;
    return r;
  end;

  function div_init_s(dividend : std_logic_vector(31 downto 0);
                      divisor : std_logic_vector(31 downto 0))
    return div_state is
    variable r : div_state := div_init_u(dividend, divisor);
    variable sr : sr_t := (int_mask => (others => '0'), others => '0');
  begin
    sr := arith_update_sr(sr, divisor(divisor'left), dividend(dividend'left),
                          x"0000000",
                          '0', ADD, DIV0S);
    r.m := sr.m;
    r.q := sr.q;
    r.t := sr.t;
    return r;
  end;

  type div1_o_t is record
    y : std_logic_vector(31 downto 0);
    q : std_logic;
    t : std_logic;
  end record;

  function div1_step(a, b : std_logic_vector;
                     m, q, t : std_logic) return div1_o_t is
    alias xa : std_logic_vector(a'length - 1 downto 0) is a;
    alias xb : std_logic_vector(b'length - 1 downto 0) is b;
    variable arith_func : arith_func_t;
    variable val : std_logic_vector(32 downto 0);
    variable sr : sr_t;
    variable r : div1_o_t;
  begin
    sr := (int_mask => (others => '0'),
           s => '0',
           m => m,
           q => q,
           t => t);
    arith_func := ADD;
    if m = q then
      arith_func := SUB;
    end if;
    val := arith_unit(xa(30 downto 0) & t,
                      xb, arith_func, '0');
    sr := arith_update_sr(sr,
                          xa(xa'left),
                          xb(xb'left),
                          val(31 downto 0),
                          val(32),
                          arith_func,
                          DIV1);
    r.y := val(31 downto 0);
    r.q := sr.q;
    r.t := sr.t;
    return r;
  end;

  function next_state(state : div_state)
    return div_state is
    variable div1_o : div1_o_t;
    variable r : div_state;
    variable arith_func : arith_func_t;
    variable val : std_logic_vector(32 downto 0);
    variable sr : sr_t;
  begin
    sr := (int_mask => (others => '0'),
           s => '0',
           m => state.m,
           q => state.q,
           t => state.t);
    arith_func := ADD;
    if state.m = state.q then
      arith_func := SUB;
    end if;
    val := arith_unit(state.value(30 downto 0) & state.t,
                      state.divisor, arith_func, '0');
    sr := arith_update_sr(sr,
                          state.value(31),
                          state.divisor(state.divisor'left),
                          val(31 downto 0),
                          val(32),
                          arith_func,
                          DIV1);
    r := state;
    r.q := sr.q;
    r.t := sr.t;
    r.value := val(31 downto 0);
    r.step := r.step + 1;
    return r;
  end;

  procedure print_state(state : in div_state) is
    variable l : line;
  begin
    write(l, string'("div("));
    if state.step < 10 then
      write(l, string'(" "));
    end if;
    write(l, state.step);
    write(l, string'("): "));
    hwrite(l, state.value);
    write(l, string'(" / "));
    hwrite(l, state.divisor);
    write(l, string'(" M:"));
    write(l, state.m);
    write(l, string'(" Q:"));
    write(l, state.q);
    write(l, string'(" T:"));
    write(l, state.t);
    writeline(output, l);
  end;

  function div_step(state : div_state)
  return div_state is
    variable state2 : div_state;
    variable l : line;
  begin
    state2 := next_state(state);
    write(l, string'("div("));
    if state2.step < 10 then
      write(l, string'(" "));
    end if;
    write(l, state2.step);
    write(l, string'("): M:"));
    write(l, state.m);
    write(l, string'(" Q:"));
    write(l, state.q);
    write(l, string'(" T:"));
    write(l, state.t);
    write(l, string'(" MSB:"));
    write(l, state.value(state.value'left));
    write(l, string'(" "));
    hwrite(l, state.value);
    write(l, string'(" -> "));
    hwrite(l, state.value(30 downto 0) & state.t);
    if state.m = state.q then
      write(l, string'(" - "));
    else
      write(l, string'(" + "));
    end if;
    hwrite(l, state.divisor);
    write(l, string'(" = "));
    hwrite(l, state2.value);
    write(l, string'(" M:"));
    write(l, state2.m);
    write(l, string'(" Q:"));
    write(l, state2.q);
    write(l, string'(" T:"));
    write(l, state2.t);
    writeline(output, l);
    return state2;
  end;

  -- 32bit / 16 bit unsigned
  function div_32_16_u(dividend : std_logic_vector(31 downto 0);
                       divisor : std_logic_vector(15 downto 0))
  return std_logic_vector is
    variable state : div_state := div_init_u(dividend, divisor & x"0000");
    variable l : line;
  begin
    print_state(state);
    for i in 1 to 16 loop
      state := div_step(state);
    end loop;
    -- final steps required for unsigned 32/16 division described in example 1
    -- of DIV1 in the SH2 software manual
    -- ROTCL
    state.value := state.value(30 downto 0) & state.t;
    -- EXTU.W
    return state.value(15 downto 0);
  end;

  -- 64bit / 32 bit unsigned
  function div_64_32_u(dividend : std_logic_vector(63 downto 0);
                       divisor : std_logic_vector(31 downto 0))
  return std_logic_vector is
    variable state : div_state := div_init_u(dividend(63 downto 32),
                                             divisor);
    variable dividend_rest : std_logic_vector(31 downto 0) := dividend(31 downto 0);
    variable t : std_logic;
    variable l : line;
  begin
    print_state(state);
    for i in 1 to 32 loop
      t := dividend_rest(31);
      dividend_rest := dividend_rest(30 downto 0) & state.t;
      state.t := t;
      write(l, string'("R2="));
      hwrite(l, dividend_rest);
      writeline(output, l);

      state := div_step(state);
    end loop;
    -- final steps required for unsigned 64/16 division described in example 1
    -- of DIV1 in the SH2 software manual
    -- ROTCL
    dividend_rest := dividend_rest(30 downto 0) & state.t;
    return dividend_rest;
  end;

  -- 32bit / 16 bit signed
  function div_32_16_s(dividend : std_logic_vector(31 downto 0);
                       divisor : std_logic_vector(15 downto 0))
  return std_logic_vector is
    variable state : div_state;
    variable l : line;
    variable d : std_logic_vector(31 downto 0);
  begin
    -- pre decrement and post increment are described in examples 3 and 4 of
    -- DIV1 in the SH2 software manual

    -- decrement the dividend if it's negative
    d := dividend;
    if d(d'left) = '1' then
      d := std_logic_vector(unsigned(d) - 1);
    end if;

    state := div_init_s(d, divisor & x"0000");
    print_state(state);
    for i in 1 to 16 loop
      state := div_step(state);
    end loop;

    -- increment quotient if it's msb is positive
    state.value := state.value(30 downto 0) & state.t;
    if state.value(16) = '1' then
      state.value := std_logic_vector(unsigned(state.value) + 1);
    end if;
    return state.value(15 downto 0);
  end;

  -- performs a 32b / 16b unsigned division using both divider and VHDL /
  -- operator and compares the results
  procedure test_div_32_16_u(dividend : std_logic_vector(31 downto 0);
                             divisor : std_logic_vector(15 downto 0)) is
    variable expected : std_logic_vector(31 downto 0);
    variable result : std_logic_vector(15 downto 0);
    variable l : line;
  begin
    expected := std_logic_vector(unsigned(dividend) / unsigned(divisor));
    result := div_32_16_u(dividend, divisor);

    -- build string for test_equal call
    write(l, string'("32b/16b unsigned "));
    hwrite(l, dividend);
    write(l, string'(" / "));
    hwrite(l, divisor);
    write(l, string'(" = "));
    hwrite(l, expected(15 downto 0));
    test_equal(result, expected(15 downto 0), l.all);
    deallocate(l);
  end;

  -- performs a 64b / 32b unsigned division using both divider and VHDL /
  -- operator and compares the results
  procedure test_div_64_32_u(dividend : std_logic_vector(63 downto 0);
                             divisor : std_logic_vector(31 downto 0)) is
    variable expected : std_logic_vector(63 downto 0);
    variable result : std_logic_vector(31 downto 0);
    variable l : line;
  begin
    expected := std_logic_vector(unsigned(dividend) / unsigned(divisor));
    result := div_64_32_u(dividend, divisor);

    -- build string for test_equal call
    write(l, string'("64b/32b unsigned "));
    hwrite(l, dividend);
    write(l, string'(" / "));
    hwrite(l, divisor);
    write(l, string'(" = "));
    hwrite(l, expected(31 downto 0));
    test_equal(result, expected(31 downto 0), l.all);
    deallocate(l);
  end;

  -- performs a 32b / 16b signed division using both divider and VHDL /
  -- operator and compares the results
  procedure test_div_32_16_s(dividend : std_logic_vector(31 downto 0);
                             divisor : std_logic_vector(15 downto 0)) is
    variable expected : std_logic_vector(31 downto 0);
    variable result : std_logic_vector(15 downto 0);
    variable l : line;
  begin
    expected := std_logic_vector(signed(dividend) / signed(divisor));
    result := div_32_16_s(dividend, divisor);

    -- build string for test_equal call
    write(l, string'("32b/16b signed "));
    hwrite(l, dividend);
    write(l, string'(" / "));
    hwrite(l, divisor);
    write(l, string'(" = "));
    hwrite(l, expected(15 downto 0));
    test_equal(result, expected(15 downto 0), l.all);
    deallocate(l);
  end;

  procedure test_div(actual : div1_o_t;
                     expectedy : std_logic_vector(31 downto 0);
                     expectedq : std_logic;
                     expectedt : std_logic;
                     description : string := "";
                     directive : string := "") is
    variable oky : boolean := actual.y = expectedy;
    variable okq : boolean := actual.q = expectedq;
    variable okt : boolean := actual.t = expectedt;
    variable ok : boolean := oky and okq and okt;
  begin
    test_ok(ok, description, directive);
    if not oky then
      test_comment("DIV y failed");
    end if;
    if not okq then
      test_comment("DIV q failed");
    end if;
    if not okt then
      test_comment("DIV t failed");
    end if;
  end procedure;

  signal state : div_state;
begin
  process
    begin

    test_plan(21,"Divider");

    test_equal(div_init_s(slv(4),slv(2)).t, '0', "div0s 4 2");
    test_equal(div_init_s(slv(-4),slv(2)).t, '1', "div0s -4 2");
    test_equal(div_init_s(slv(4),slv(-2)).t, '1', "div0s 4 -2");
    test_equal(div_init_s(slv(-4),slv(-2)).t, '0', "div0s -4 -2");

    test_div(div1_step(slv(4),slv(2),'0','0','0'),slv(6),'0','1',"divide test 000");

    test_div(div1_step(slv(-4),slv(2),'0','0','0'),slv(-10),'1','0',"divide test 001");
    test_div(div1_step(slv(4),slv(-2),'1','0','0'),slv(6),'0','0',"divide test 010");
    test_div(div1_step(slv(-4),slv(-2),'1','0','0'),slv(-10),'1','1',"divide test 011");
    test_div(div1_step(slv(4),slv(2),'0','1','0'),slv(10),'0','1',"divide test 100");
    test_div(div1_step(slv(-4),slv(2),'0','1','0'),slv(-6),'1','0',"divide test 101");
    test_div(div1_step(slv(4),slv(-2),'1','1','0'),slv(10),'0','0',"divide test 110");
    test_div(div1_step(slv(-4),slv(-2),'1','1','0'),slv(-6),'1','1',"divide test 111");

    test_comment("32b / 16b signed");
    test_div_32_16_s(x"0FFFFFFF", x"2BCD");
    test_div_32_16_s(x"0FFFFFFF", x"ABCD");
    test_div_32_16_s(x"EFFFFFFF", x"2BCD");
    test_div_32_16_s(x"EFFFFFFF", x"ABCD");

    test_comment("32b / 16b unsigned");
    test_div_32_16_u(x"0FFFFFFF", x"2BCD");
    test_div_32_16_u(x"1FFFFFFF", x"2BCD");
    test_div_32_16_u(x"9FFFFFFF", x"ABCD");

    test_div_32_16_u(x"71C638E4", x"AAAA");

    test_comment("64b / 32b unsigned");
    test_div_64_32_u(x"0b00ea4e242d2080", x"9abcdef0");

    test_finished("done");
    wait;
    end process;
end tb ;
