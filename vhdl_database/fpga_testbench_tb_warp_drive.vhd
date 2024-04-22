  library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use work.test_utils.all;
  entity tb_warp_drive is
  end tb_warp_drive;

  architecture behavior of tb_warp_drive is 
  
    signal clk: std_logic;
    
  -- One bit
    signal one_pc_write_enable_out: std_logic;
    signal one_active_barrel_row_out: std_logic_vector(0 downto 0);
    signal one_reset: std_logic;
    
  -- Four bit
    signal four_pc_write_enable_out: std_logic;
    signal four_active_barrel_row_out: std_logic_vector(3 downto 0);
    signal four_reset: std_logic;
  
    constant clk_period: time := 10 ns;
  begin

          one_bit_drive: entity work.warp_drive
          generic map( BARREL_BIT_WIDTH => 1 )
          port map(
                  tick => clk,
                  pc_write_enable_out => one_pc_write_enable_out,
                  active_barrel_row_out => one_active_barrel_row_out,
                  reset => one_reset
          );
          
          four_bit_drive: entity work.warp_drive
          generic map( BARREL_BIT_WIDTH => 4 )
          port map(
                  tick => clk,
                  pc_write_enable_out => four_pc_write_enable_out,
                  active_barrel_row_out => four_active_barrel_row_out,
                  reset => four_reset
          );

     clk_process :process
      begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
      end process;

     tb : process
     begin
        -- Test one bit drive first
        one_reset <= '1';
        wait for 1 ns; 
        one_reset <= '0';
      
        assert_equals('1', one_pc_write_enable_out, "PC write should be high every n rows");
        assert_equals("0", one_active_barrel_row_out, "Row count should start at 0");
        wait for clk_period;
        
        assert_equals('0', one_pc_write_enable_out, "PC write should be low unless we are at row 0");
        assert_equals("1", one_active_barrel_row_out, "Row count should be incremented once per tick");
        wait for clk_period;
        
        assert_equals('1', one_pc_write_enable_out, "PC write should be high every n rows");
        assert_equals("0", one_active_barrel_row_out, "Row count should wrap around to 0");
        
        wait until clk = '0';
        four_reset <= '1';
        wait for 1 ns;
        four_reset <= '0';
         
        assert_equals('1', four_pc_write_enable_out, "PC write should be high every n rows");
        assert_equals("0000", four_active_barrel_row_out, "Row count should start at 0");
        wait for clk_period*2;
        
        assert_equals('0', four_pc_write_enable_out, "PC write should be low unless we are at row 0");
        assert_equals("0010", four_active_barrel_row_out, "Row count should be incremented once per tick");
        wait for clk_period*14;
      
        assert_equals('1', four_pc_write_enable_out, "PC write should be high every n rows");
        assert_equals("0000", four_active_barrel_row_out, "Row count should wrap around to 0");


        wait; 
     end process tb;
  --  end test bench 

  end;
