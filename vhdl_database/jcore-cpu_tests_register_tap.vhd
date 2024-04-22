library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.cpu2j0_components_pack.all;
use work.test_pkg.all;

entity register_tap is
  
end register_tap;

architecture tb  of register_tap is



  signal clk : std_logic := '0';
  signal rst : std_logic := '1';

  signal addr_ra, addr_rb, w_addr_wb, w_addr_ex : std_logic_vector(4 downto 0);
  signal din_wb, din_ex : std_logic_vector(31 downto 0);
  signal dout_a0, dout_b0, dout_00 : std_logic_vector(31 downto 0);
  signal dout_a1, dout_b1, dout_01 : std_logic_vector(31 downto 0);
  signal we_wb, we_ex : std_logic;
  
  signal slot : std_logic;
  
  shared variable ENDSIM : boolean := false;

  
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


    u_regfile0 : entity work.register_file(flops)
          generic map (
            ADDR_WIDTH => 5,
            NUM_REGS => 22,
            REG_WIDTH => 32)
          port map(clk => clk, rst => rst, ce => slot,
                   addr_ra => addr_ra,
                   dout_a => dout_a0,
                   addr_rb => addr_rb,
                   dout_b => dout_b0,
                   dout_0 => dout_00,
                   we_wb => we_wb,
                   w_addr_wb => w_addr_wb,
                   din_wb => din_wb,
                   we_ex => we_ex,
                   w_addr_ex => w_addr_ex,
                   din_ex => din_ex);
    u_regfile1 : entity work.register_file(two_bank)
          generic map (
            ADDR_WIDTH => 5,
            NUM_REGS => 22,
            REG_WIDTH => 32)
          port map(clk => clk, rst => rst, ce => slot,
                   addr_ra => addr_ra,
                   dout_a => dout_a1,
                   addr_rb => addr_rb,
                   dout_b => dout_b1,
                   dout_0 => dout_01,
                   we_wb => we_wb,
                   w_addr_wb => w_addr_wb,
                   din_wb => din_wb,
                   we_ex => we_ex,
                   w_addr_ex => w_addr_ex,
                   din_ex => din_ex);

  process

    
    begin
   
    test_plan(22,"register file");

    addr_ra <= "00001";
    addr_rb <= "00000";
    
    w_addr_wb <= "00000";
    din_wb <= x"bbbbbbbb";
    
    w_addr_ex <= "00001";
    din_ex <= x"aaaaaaaa";

    slot <= '0';

    we_wb <= '1';
    we_ex <= '0';


    wait for 10 ns;
    rst <= '0';
    slot <= '1';
    
    wait for 5 ns;
    addr_ra <= "00000";
    din_wb <= x"cccccccc";

    wait for 5 ns; -- check out (mid CC)
    test_equal(dout_a0, x"cccccccc","test wb_pipe on dout_a0");
    test_equal(dout_b0, x"cccccccc","test wb_pipe on dout_b0");
    test_equal(dout_00, x"cccccccc","test wb_pipe on dout_00");
    test_equal(dout_a1, x"cccccccc","test wb_pipe on dout_a1");
    test_equal(dout_b1, x"cccccccc","test wb_pipe on dout_b1");
    test_equal(dout_01, x"cccccccc","test wb_pipe on dout_01");
    wait for 10 ns;
    we_wb <= '0';
    din_wb <= x"dddddddd";
     wait for 10 ns;
    -- addr_ra <= "00001";
    wait for 20 ns;
    we_ex <= '1';
    wait for 5 ns;
    addr_ra <= "00001";
    wait for 10 ns;
    test_equal(dout_a0, x"aaaaaaaa","test ex_pipe[1] on dout_a0");
    test_equal(dout_a1, x"aaaaaaaa","test ex_pipe[1] on dout_a1");
    
    we_ex <= '0';
    din_ex <= x"55555555";
    wait for 10 ns;
    addr_ra <= "00000";
    wait for 10 ns; -- 
    test_equal(dout_a0, x"cccccccc","test RAM[0] on dout_a0");
    test_equal(dout_a1, x"cccccccc","test RAM[0] on dout_a1");
    
    wait for 10 ns; -- 
      w_addr_ex <= "00000";
     w_addr_wb <= "00001";
    
     wait for 10 ns; 
    we_ex <= '1';
    --w_addr_ex <= "00010"; -- hmmm
     wait for 10 ns; -- 
    -- w_addr_ex <= "00000";
    we_ex <= '0';
    addr_ra <= "00001";
    wait for 5 ns;
    test_equal(dout_a0, x"aaaaaaaa","test RAM[1] on dout_a0");
    test_equal(dout_b0, x"55555555","test ex_pipe[1] on dout_b0");
    test_equal(dout_00, x"55555555","test ex_pipe[1] on dout_00");
    test_equal(dout_a1, x"aaaaaaaa","test RAM[1] on dout_a1");
    test_equal(dout_b1, x"55555555","test ex_pipe[1] on dout_b1");
    test_equal(dout_01, x"55555555","test ex_pipe[1] on dout_01");
    wait for 5 ns;
    addr_ra <= "00000";
    wait for 10 ns;
    test_equal(dout_a0, x"55555555","test ex_pipe[2] on dout_a0");
    test_equal(dout_a1, x"55555555","test ex_pipe[2] on dout_a1");
    wait for 20 ns;
    we_wb <= '1';
    w_addr_wb <= "00010";
    wait for 10 ns;
    addr_rb <= "00010";
    w_addr_wb <= "00011";
    wait for 10 ns;
    we_wb <= '0';
    test_equal(dout_b0, x"dddddddd","test RAM[2] on dout_b0");
    test_equal(dout_b1, x"dddddddd","test RAM[2] on dout_b1");
    wait for 10 ns;
    we_ex <= '1';
    --w_addr_ex <= "00011";
    din_ex <= x"ffffffff";
    wait for 10 ns;
    we_ex <= '0';
    wait for 10 ns;
    w_addr_ex <= "00100";
    din_ex <= x"22222222";
    we_ex <= '1';
    wait for 10 ns;
    we_ex <= '0';
    test_equal(dout_00, x"ffffffff","test reg_0 on dout_00");
    test_equal(dout_01, x"ffffffff","test reg_0 on dout_01");
    
    
    test_finished("done");
    
    wait for 40 ns;
    ENDSIM := true;
    
    wait;
    end process;
  

end tb ;
