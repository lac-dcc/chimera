library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.defines.all;
use work.test_utils.all;

entity tb_thread_spawner is
  end tb_thread_spawner;

architecture behavior of tb_thread_spawner is 

    -- component declaration for the unit under test (uut)

  component thread_spawner
    port(
          clk : in  std_logic;
          thread_done_in : in  std_logic;
          kernel_start_in : in  std_logic;
          kernel_addr_in : in  std_logic_vector(15 downto 0);
          kernel_complete_out : out  std_logic;
          num_threads_in : in  std_logic_vector(19 downto 0);
          pc_start_out : out  std_logic_vector(15 downto 0);
          pc_input_select_out : out  std_logic;
          thread_id_out : out  std_logic_vector(19 downto 0);
          id_write_enable_out : out  std_logic
        );
  end component;


   --Inputs
  signal clk : std_logic := '0';
  signal thread_done_in : std_logic := '0';
  signal kernel_start_in : std_logic := '0';
  signal kernel_addr_in : std_logic_vector(15 downto 0) := (others => '0');
  signal num_threads_in : std_logic_vector(19 downto 0) := (others => '0');

   --Outputs
  signal kernel_complete_out : std_logic;
  signal pc_start_out : std_logic_vector(15 downto 0);
  signal pc_input_select_out : std_logic;
  signal thread_id_out : std_logic_vector(19 downto 0);
  signal id_write_enable_out : std_logic;

   -- Clock period definitions
  constant clk_period : time := 10 ns;

BEGIN

   -- Instantiate the Unit Under Test (UUT)
  uut: thread_spawner PORT MAP (
                                 clk => clk,
                                 thread_done_in => thread_done_in,
                                 kernel_start_in => kernel_start_in,
                                 kernel_addr_in => kernel_addr_in,
                                 kernel_complete_out => kernel_complete_out,
                                 num_threads_in => num_threads_in,
                                 pc_start_out => pc_start_out,
                                 pc_input_select_out => pc_input_select_out,
                                 thread_id_out => thread_id_out,
                                 id_write_enable_out => id_write_enable_out
                               );

   -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

   -- Stimulus process
  stim_proc: process

    procedure test_kernel
    ( kernel_addr : in instruction_address_t
    ; thread_count : in integer
  )
  
    is 
     variable n_barrels_of_warps : integer := integer(ceil(real(thread_count)/(real(NUMBER_OF_STREAMING_PROCESSORS)*real(BARREL_HEIGHT))));
    begin

      --      Set start pc.
      kernel_addr_in <= kernel_addr;

      --      Set nr of threads.
      num_threads_in <= std_logic_vector(to_unsigned(thread_count, 19));

      --      Start thread spawner.
      wait for clk_period;
      kernel_start_in <= '1';
      wait for clk_period; --Thread spawner activate next clock cycle

--      Check that the PC is set correctly
      assert_equals(pc_start_out, kernel_addr, "PC start address set correctly");
      assert_equals(pc_input_select_out, '1', "Set pc_input_select_out correctly when starting new threads");


      --      Check that the IDs are set correctly when spawning first threads
      for i in 0 to BARREL_HEIGHT -1 loop
        assert_equals(signed(thread_id_out), to_signed(i * NUMBER_OF_STREAMING_PROCESSORS, 19), "ID should be set correctly");
        wait for clk_period;
      end loop;
      
      kernel_start_in <= '0';

      wait for clk_period/2;
      assert_equals(pc_input_select_out, '0', "Set pc_input_select_out low after PC has been updated");
      wait for clk_period/2;

      assert_equals(kernel_complete_out, '0', "Kernel_complete_out should be set to 0 while threads are still running");
--    Spawn all threads except the last round
      for barrels in 1 to n_barrels_of_warps - 1 loop
       wait for clk_period*2*BARREL_HEIGHT;-- threads are runnin, yo.
        for i in 0 to BARREL_HEIGHT - 1 loop
          thread_done_in <= '1';

          wait for clk_period / 2;
          --      Check that new threads with correct ids are started
          assert_equals(signed(thread_id_out)
          , to_signed(NUMBER_OF_STREAMING_PROCESSORS*BARREL_HEIGHT*barrels + i * NUMBER_OF_STREAMING_PROCESSORS, 19)
          , "ID should be set correctly when killing warps");
          assert_equals(id_write_enable_out, '1', "ID write enable should be 1 when threads die and new threads are spawned");

          --      Check that pc is reset
          assert_equals(pc_start_out, kernel_addr, "PC address should not change when spawning threads");
          assert_equals(pc_input_select_out, '1', "PC address should overriden when new threads start");

          wait for clk_period / 2;
        end loop;
        thread_done_in <= '0';
        wait for clk_period;
        assert_equals(pc_input_select_out, '0', "Set pc_input_select_out low after a new set of threads are spawned");
        assert_equals(kernel_complete_out, '0', "Kernel_complete_out should be set to 0 while threads are still running");
      end loop;
      
      wait for clk_period*10*BARREL_HEIGHT;-- Last threads are runnin, yo.      
      
--    Kill the last barrel of warps
      for i in 0 to BARREL_HEIGHT - 1 loop
       thread_done_in <= '1';

        wait for clk_period / 2;
 
        assert_equals(kernel_complete_out, '0', "Kernel_complete_out should be set to 0 while threads are still running");

        --      Check that new threads are not spawned
        --assert_equals(id_write_enable_out, '0', "Do not write new ID after all threads have been executed");

        wait for clk_period / 2;
      end loop;
      wait for clk_period * 10;
      assert_equals(kernel_complete_out, '1', "Kernel_complete_out should be set to 1 when all threads are done");
      
      wait for clk_period;
      thread_done_in <= '0';


    end procedure test_kernel;
  constant batch_size: integer := BARREL_HEIGHT * NUMBER_OF_STREAMING_PROCESSORS;
  begin		
      --Set up default values

    wait for 100 ns;	
    wait for clk_period*10;
    
    test_kernel(std_logic_vector(to_unsigned(10,19)), 10);
    test_kernel(std_logic_vector(to_unsigned(20,19)), 500);
    wait;
  end process;

END;
