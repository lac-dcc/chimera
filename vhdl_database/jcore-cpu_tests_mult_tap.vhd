library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu2j0_components_pack.all;
use work.test_pkg.all;
use work.mult_pkg.all;

entity mult_tap is
  
end mult_tap;

architecture tb  of mult_tap is



  signal clk : std_logic := '0';
  signal rst : std_logic := '1';
  signal slot : std_logic;
  
  shared variable ENDSIM : boolean := false;

  signal mac_i   : mult_i_t;
  signal mac_o   : mult_o_t;
  
  procedure test_mult(actualh : std_logic_vector(31 downto 0);
                      actuall : std_logic_vector(31 downto 0);
                      expectedh : std_logic_vector(31 downto 0);
                      expectedl : std_logic_vector(31 downto 0);
                      description : string := "";
                      directive : string := "") is
    variable okh : boolean := actualh = expectedh;
    variable okl : boolean := actuall = expectedl;
    variable ok : boolean := okh and okl;
    begin
      test_ok(ok, description, directive);
      if not okh then
        test_comment("MACH fail");
      --  test_comment_fail(actualh,x"40005553");
      end if;
      if not okl then
        test_comment("MACL fail");
     --   test_comment_fail(actuall,x"0001555B");
      end if;
    end procedure;
      
                      
  
begin  -- tb
       -- 
  --clk <= '0' after 5 ns when clk = '1' else '1' after 5 ns;

  clk_gen : process
    begin
      if ENDSIM = false then
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
      else
        wait;
      end if;
    end process;


   mult_i : mult port map (clk => clk, rst => rst, slot => slot, a => mac_i, y => mac_o);
  process

    
    begin
   
    test_plan(7,"Mult");

    -- FIXME: So, here we make sure that our test bypasses a lot of logic... easier to pass that way!
    mac_i.s       <= '0';
    mac_i.wr_mach <= '0';
    mac_i.wr_macl <= '0';

    mac_i.command <= NOP;
    mac_i.wr_m1 <= '1';
    mac_i.in1 <= x"fffffffe";
    mac_i.in2 <= x"00005555";
    slot <= '0';

    wait for 10 ns;
    rst <= '0';
    slot <= '1';
    wait for 5 ns;

    mac_i.command <= DMULSL;

    wait for 10 ns;
    mac_i.command <= NOP;
    mac_i.wr_m1 <= '0';
      
    --wait for 30 ns; -- just after clk edge
    wait for 40 ns;

    --test_equal(mac_o.macl,x"ffff5556","test mult");
    test_mult(mac_o.mach, mac_o.macl, x"ffffffff",x"ffff5556","test DMULS.L");

    mac_i.command <= DMULUL;
    mac_i.wr_m1 <= '1';
    
    wait for 10 ns;
    mac_i.command <= NOP;
    mac_i.wr_m1 <= '0';

    --wait for 30 ns; --
    wait for 40 ns; -- 
    test_mult(mac_o.mach, mac_o.macl, x"00005554",x"ffff5556","test DMULU.L");

    wait for 40 ns;
    mac_i.command <= MULL;
    mac_i.wr_m1 <= '1';
   -- mac_i.in1 <= x"00002bc0";
   -- mac_i.in2 <= x"00002b30";
    wait for 10 ns;
    mac_i.command <= NOP;
    mac_i.wr_m1 <= '0';
    --wait for 30 ns; --
    wait for 40 ns;
    test_equal(mac_o.macl,x"ffff5556","test MUL.L"); 
    wait for 20 ns;
    mac_i.command <= MULSW;
    mac_i.wr_m1 <= '1';
    wait for 10 ns;
    mac_i.command <= NOP;
    mac_i.wr_m1 <= '0';
    --wait for 20 ns; --
    wait for 40 ns; --
    test_equal(mac_o.macl,x"ffff5556","test MULS.W");
    wait for 20 ns;
    mac_i.command <= MULUW;
    mac_i.wr_m1 <= '1';
    mac_i.in1 <= x"00000002";
    mac_i.in2 <= x"ffffaaaa";
    wait for 10 ns;
    mac_i.command <= NOP;
    mac_i.wr_m1 <= '0';
    --wait for 20 ns; -- 
    wait for 40 ns; -- 
    test_equal(mac_o.macl,x"00015554","test MULU.W");
    wait for 20 ns;
    mac_i.wr_m1 <= '1';
    mac_i.in1 <= x"00000003";
    wait for 10 ns;
    mac_i.command <= MACW;
    mac_i.wr_m1 <= '0';
    mac_i.in2 <= x"00000002";
    wait for 10 ns;
    mac_i.command <= NOP;
     --wait for 20 ns; --
     wait for 40 ns; -- 
    test_equal(mac_o.macl,x"0001555a","test MAC.W");
    --wait for 20 ns;
    wait for 20 ns;
    mac_i.wr_m1 <= '1';
    mac_i.in1 <= x"7fffffff";
    wait for 10 ns;
    mac_i.command <= MACL;
    mac_i.wr_m1 <= '0';
    mac_i.in2 <= x"7fffffff";
    wait for 10 ns;
    mac_i.command <= NOP;
   -- wait for 30 ns; --
    wait for 50 ns; --
    test_mult(mac_o.mach,mac_o.macl,x"40005553",x"0001555B","test MAC.L");
    
    test_finished("done");
    
    wait for 40 ns;
    ENDSIM := true;
    
    wait;
    end process;
  

end tb ;
