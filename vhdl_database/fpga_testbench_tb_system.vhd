LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.defines.all;
USE work.test_utils.all;

ENTITY tb_system IS
END tb_system;

ARCHITECTURE behavior OF tb_system IS 

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk_sys_out : std_logic := '0';
   signal hdmi_bus_control_in : sram_bus_control_t;
   signal vga_bus_control_in : sram_bus_control_t;
   signal ebi_control_in : ebi_control_t;
   signal mc_sram_flip_in : std_logic := '0';

   --BiDirs
   signal sram_bus_data_1_inout : sram_bus_data_t;
   signal sram_bus_data_2_inout : sram_bus_data_t;
   signal hdmi_bus_data_inout : sram_bus_data_t;
   signal vga_bus_data_inout : sram_bus_data_t;
   signal ebi_data_inout : ebi_data_t;
   signal mc_spi_bus : spi_bus_t;

   --Outputs
   signal sram_bus_control_1_out : sram_bus_control_t;
   signal sram_bus_control_2_out : sram_bus_control_t;
   signal mc_kernel_complete_out : std_logic;
   signal led_1_out : std_logic;
   signal led_2_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

   -- Memory (> 512* 256)
   type mem_t is array(200000 - 1 downto 0) of word_t;
   signal sram_a : mem_t := (others => (others => '0'));
   signal sram_b : mem_t := (others => (others => '0'));

   -- Cycle count
   signal elapsed_cycles : natural := 0;
BEGIN

  -- Instantiate the Unit Under Test (UUT)
  uut: entity work.System
  PORT MAP (
             clk => clk,
             reset => reset,
             clk_sys_out => clk_sys_out,
             sram_bus_data_1_inout => sram_bus_data_1_inout,
             sram_bus_control_1_out => sram_bus_control_1_out,
             sram_bus_data_2_inout => sram_bus_data_2_inout,
             sram_bus_control_2_out => sram_bus_control_2_out,
             ebi_data_inout => ebi_data_inout,
             ebi_control_in => ebi_control_in,
             mc_kernel_complete_out => mc_kernel_complete_out,
             mc_frame_buffer_select_in => mc_sram_flip_in,
             mc_spi_bus => mc_spi_bus,
             led_1_out => led_1_out,
             led_2_out => led_2_out
           );

   -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

  process (clk_sys_out) is
  begin
    if rising_edge(clk_sys_out) then
      elapsed_cycles <= elapsed_cycles + 1;
    end if;
  end process;

  mem_proc: process (clk) is
  begin

    if rising_edge(clk) then
      sram_bus_data_1_inout <= (others => 'Z');
      sram_bus_data_2_inout <= (others => 'Z');

      if sram_bus_control_1_out.write_enable_n = '0' then
        sram_a(to_integer(unsigned(sram_bus_control_1_out.address))) <= sram_bus_data_1_inout;
      else
        sram_bus_data_1_inout <= sram_a(to_integer(unsigned(sram_bus_control_1_out.address)));
      end if;

      if sram_bus_control_2_out.write_enable_n = '0' then
        sram_b(to_integer(unsigned(sram_bus_control_2_out.address))) <= sram_bus_data_2_inout;
      else
        sram_bus_data_2_inout <=  sram_b(to_integer(unsigned(sram_bus_control_2_out.address)));
      end if;
    end if;
  end process;


   -- Stimulus process
  stim_proc: process


     procedure write_instruction(instruction : in instruction_t
                                ;address     : in instruction_address_t
                                ) is begin
       ebi_data_inout <= instruction(31 downto 16);
       ebi_control_in.address <= "001" & address & '0';
       ebi_control_in.write_enable_n <= '0';
       ebi_control_in.read_enable_n <= '1';
       ebi_control_in.chip_select_fpga_n <= '0';
       wait on clk_sys_out until rising_edge(clk_sys_out);

       ebi_data_inout <= instruction(15 downto 0);
       ebi_control_in.address <= "001" & address & '1';
       ebi_control_in.write_enable_n <= '0';
       ebi_control_in.chip_select_fpga_n <= '0';
       wait on clk_sys_out until rising_edge(clk_sys_out);

       ebi_control_in.write_enable_n <= '1';
       ebi_control_in.chip_select_fpga_n <= '1';
     end procedure;


     procedure write_constant(constant_in : in word_t;
                              address     : in integer) is begin
       ebi_data_inout <= constant_in;
       ebi_control_in.address <= "0000" & std_logic_vector(to_unsigned(address, 16));
       ebi_control_in.write_enable_n <= '0';
       ebi_control_in.read_enable_n <= '1';
       ebi_control_in.chip_select_fpga_n <= '0';
       wait on clk_sys_out until rising_edge(clk_sys_out);

       ebi_control_in.write_enable_n <= '1';
       ebi_control_in.chip_select_fpga_n <= '1';
     end procedure;


     procedure write_memory(data_in : in word_t;
                              address     : in integer) is begin
         ebi_data_inout <= data_in;
         ebi_control_in.address <= "0000" & std_logic_vector(to_unsigned(address, 16));
         ebi_control_in.write_enable_n <= '0';
         ebi_control_in.read_enable_n <= '1';
         ebi_control_in.chip_select_sram_n <= '0';
         wait on clk_sys_out until rising_edge(clk_sys_out);

         ebi_control_in.write_enable_n <= '1';
         ebi_control_in.chip_select_sram_n <= '1';
     end procedure;


     procedure check_memory(data : in word_t
                           ;address : in integer
                           ) is begin
       if address mod 2 = 0 then
          --report "Checking " & integer'image(address) & " " & integer'image(to_integer(signed(sram_a(address/2))));
          assert_equals(data, sram_a(address/2), "Data memory check");
       else
          --report "Checking " & integer'image(address) & " " & integer'image(to_integer(signed(sram_b(address/2))));
          assert_equals(data, sram_b(address/2), "Data memory check");
       end if;
     end procedure;


     type InstrData is array (natural range<>) of instruction_t;
     procedure fill_instruction_memory(instruction_data : in InstrData;
                                       base_address : in integer) is
     begin
       for i in 0 to instruction_data'LENGTH-1 loop
         write_instruction(instruction_data(i),
                           std_logic_vector(to_unsigned(base_address + i,
                                                        INSTRUCTION_ADDRESS_WIDTH)));
       end loop;
     end fill_instruction_memory;


    procedure simulate_kernel(kernel_base_address : in integer ;
                              num_threads : in integer) is
      variable delta_cycles : natural := 0;
    begin
      -- Write number of threads to memory
      ebi_data_inout <= std_logic_vector(to_unsigned(num_threads / (NUMBER_OF_STREAMING_PROCESSORS * BARREL_HEIGHT) , WORD_WIDTH));
       -- Start at instruction mem 0. Bit 18 1 means start kernel
      ebi_control_in.address <= "0100" & std_logic_vector(to_unsigned(kernel_base_address, INSTRUCTION_ADDRESS_WIDTH));
      ebi_control_in.write_enable_n <= '0';
      ebi_control_in.chip_select_fpga_n <= '0';
      wait on clk_sys_out until rising_edge(clk_sys_out);
      ebi_control_in.write_enable_n <= '1';

      -- Count cycles to completion
      delta_cycles := elapsed_cycles;
      wait on mc_kernel_complete_out until mc_kernel_complete_out = '1';
      delta_cycles  := elapsed_cycles - delta_cycles;
      report "Kernels done @ " & natural'image(delta_cycles) & " cycles.";
      wait for clk_period * NUMBER_OF_STREAMING_PROCESSORS * 2;
    end procedure;


     constant KERNEL_SRL : InstrData := (
       X"00022801", -- srl $5, $2, 0
       X"00011820", -- add $3, $0, $1
       X"00022020", -- add $4, $0, $2
       X"10000000", -- sw
       X"40000000" --finished
     );
     constant NUM_THREADS_SRL : integer := 1024;

    constant KERNEL_FILLSCREEN : InstrData := (
      X"08050000", -- ldc $lsu_data, 0
      X"00011820", -- add $address_hi, $zero, $id_hi
      X"00022020", -- add $address_lo, $zero, $id_lo
      X"10000000", -- sw
      X"40000000" -- thread_finished
    );
    constant NUM_THREADS_FILLSCREEN : integer := 256;

    constant KERNEL_SLT : InstrData := (
     X"00002804", -- add $lsu_data, $0, $0
     X"0407000a", -- addi $7, $0, 10
     X"0408000c", -- addi $8, $0, 12
     X"00e83003", -- slt $mask, $7, $8
     X"8405002a", -- ? addi $lsu_data, $0, 42
     X"00011804", -- add $address_hi, $0, $id_hi
     X"00022004", -- add $address_lo, $0, $id_lo
     X"10000000", -- sw
     X"40000000" -- thread_finished
   );
   constant NUM_THREADS_SLT : integer := 64;

    constant KERNEL_SQUARE : InstrData := (
      X"00023a41", -- srl $7, $2, 9 ; load y value
      X"000159c0", -- sll $11, $1, 7 ; Load shifted hi value
      X"00eb3804", -- add $7, $7, $11 ; Stitch together hi and low
      X"040801ff", -- addi $8, $0, 511
      X"01024006", -- and $8, $8, $2 ; load x value
      X"04090040", -- addi $9, $0, 64 ; x, y offset
      X"04060000", -- addi $6, $0, 0 ; Disable masking
      X"04050000", -- addi $5, $0, 0 ; Set default color to black
      X"00e93003", -- slt $6, $7, $9
      X"81093003", -- ? slt $6, $8, $9
      X"040a0200", -- addi $10, $0, 512
      X"01495005", -- sub $10, $10, $9
      X"81483003", -- ? slt $6, $10, $8
      X"040a0100", -- addi $10, $0, 256
      X"01495005", -- sub $10, $10, $9
      X"81473003", -- ? slt $6, $10, $7
      X"8405f800", -- ? addi $5, $0, 0b1111100000000000 ; red
      X"00011804", -- add $3, $0, $1
      X"00022004", -- add $4, $0, $2
      X"10000000", -- sw
      X"40000000" -- thread_finished
    );
    CONSTANT NUM_THREADS_SQUARE : integer := 512*70;

    constant KERNEL_LOAD : InstrData := (
      X"00001804", -- add $address_hi, $0, $0
      X"00002004", -- add $address_lo, $0, $0
      X"20000000", -- lw
      X"00011804", -- add $address_hi, $0, $id_hi
      X"04080002", -- addi $8, $0, 2
      X"01022004", -- add $address_lo, $8, $id_lo
      X"00000000", -- nop
      X"10000000", -- sw
      X"00000000", -- nop
      X"40000000" -- thread_finished
    );
    constant NUM_THREADS_LOAD : integer := 64;

   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      ebi_control_in.write_enable_n <= '1';
      ebi_control_in.chip_select_fpga_n <= '1';
      ebi_control_in.chip_select_sram_n <= '1';

      -------------------
      -- Load kernels  --
      -------------------
      fill_instruction_memory(KERNEL_SRL, 1);
      fill_instruction_memory(KERNEL_FILLSCREEN, 200);
      fill_instruction_memory(KERNEL_SLT, 300);
      fill_instruction_memory(KERNEL_SQUARE, 400);
      fill_instruction_memory(KERNEL_LOAD, 500);

      --------------------
      --  Kernel SRL   --
      --------------------
      report "Simulating SRL kernel";

      simulate_kernel(1, NUM_THREADS_SRL);

      report "Checking memory SRL";
      for i in 0 to NUM_THREADS_SRL - 1 loop
        check_memory(std_logic_vector(to_unsigned(i,16)), i);
      end loop;
      report "SRL kernel completed";

      --------------------
      --Kernel Constant --
      --------------------
      report "Simulating Constant fillscreen kernel";

      write_constant(std_logic_vector(to_signed(30, 16)), 0);
      simulate_kernel(200, NUM_THREADS_FILLSCREEN);

      report "Checking memory Constant";
      for i in 0 to NUM_THREADS_FILLSCREEN - 1 loop
        check_memory(std_logic_vector(to_signed(30, 16)), i);
      end loop;
      report "Constant fillscreen completed";

      ----------------------
      --Kernel SLT & Mask --
      ----------------------
      simulate_kernel(300, NUM_THREADS_SLT);
      for i in 0 to NUM_THREADS_SLT - 1 loop
        check_memory(std_logic_vector(to_signed(0, 16)), i);
      end loop;
      report "Simulated SLT";

      --------------------
      --  Kernel Load   --
      --------------------
      report "Simulating load test";
      write_memory(std_logic_vector(to_signed(55, 16)), 0);
      write_memory(std_logic_vector(to_signed(55, 16)), 1);
      simulate_kernel(500, NUM_THREADS_LOAD);

      report "Checking load test memory";
      for i in 0 to NUM_THREADS_LOAD - 1 loop
        check_memory(std_logic_vector(to_signed(55, 16)), i + 2);
      end loop;

      report "Simulated Load";
      --------------------
      --Kernel Square   --
      --------------------
      report "Simulating square kernel";

      simulate_kernel(400, NUM_THREADS_SQUARE);

      report "Checking memory";
      for i in 0 to NUM_THREADS_SQUARE - 1 loop
        if i mod 512 >= 64
            and i / 512 >= 64
            and i mod 512 <= 512 - 64
            and i / 512 <= 256 - 64 then
          check_memory("1111100000000000", i);
        else
          check_memory(std_logic_vector(to_signed(0, 16)), i);
        end if;
      end loop;
      report "Square kernel completed";

      report "TEST SUCCESS!" severity failure;
      wait;
   end process;

END;
