library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defines.all;
use work.test_utils.all;
use work.utils.all;
entity tb_register_directory is
end tb_register_directory;

architecture behavior of tb_register_directory is 

  constant reg_addr_bits: integer := 4;
  constant num_registers: integer := 16;
  constant num_register_files : integer := 4;
  constant log_num_register_files: integer := 2;
  
  constant clk_period: time := 10 ns;
    
  -- General registers
  signal clk: std_logic;
  signal read_register_1_in: std_logic_vector(reg_addr_bits -1 downto 0);
  signal read_register_2_in: std_logic_vector(reg_addr_bits -1 downto 0);
  signal write_register_in: std_logic_vector(reg_addr_bits -1 downto 0);
  signal write_data_in: word_t;
  signal register_write_enable_in: std_logic;
  signal read_data_1_out: word_t;
  signal read_data_2_out: word_t;
  
  --Barrel
  signal barrel_row_select_in : barrel_row_t;
  
  -- ID 
  signal id_register_write_enable_in: std_logic;
  signal id_register_in: thread_id_t;
  signal lsu_address_out: memory_address_t;
  
  -- Return Registers
  signal return_register_file_in: barrel_row_t;
  signal lsu_write_data_out: word_t;
  signal return_data_in: word_t;
  signal return_register_write_enable_in: std_logic;
  
  -- Masking
  signal predicate_out: std_logic;

  function get_reg_addr(reg: integer) return std_logic_vector is
    begin
      return make_reg_addr(reg, reg_addr_bits);
   end;
  

 begin

-- component instantiation
        register_file: entity work.register_directory
        generic map(
              NUMBER_OF_REGISTERS => num_registers,
              LOG_NUMBER_OF_REGISTERS => reg_addr_bits,
              NUMBER_OF_REGISTER_FILES => num_register_files,
              LOG_NUMBER_OF_REGISTER_FILES => log_num_register_files       
        )
        port map(
              clk => clk,
              read_register_1_in => read_register_1_in,
              read_register_2_in => read_register_2_in,
              write_register_in => write_register_in,
              write_data_in => write_data_in,
              register_write_enable_in => register_write_enable_in,
              read_data_1_out => read_data_1_out,
              read_data_2_out => read_data_2_out,
              id_register_write_enable_in => id_register_write_enable_in,
              id_register_in => id_register_in,
              return_register_write_enable_in => return_register_write_enable_in,
              return_register_file_in => return_register_file_in,
              return_data_in => return_data_in,
              lsu_write_data_out => lsu_write_data_out,
              barrel_row_select_in => barrel_row_select_in,
              lsu_address_out => lsu_address_out,
              predicate_out => predicate_out
        );

  clk_process :process
  begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
  end process;


--  test bench statements
  tb : process
    constant ALL_BITS_HIGH: memory_address_t := (others => '1');

   procedure assert_generic(reg: integer; value:integer; signal in_signal: register_address_t; signal out_signal: word_t ; message:string) is
    begin
      read_register_1_in <= get_reg_addr(reg);
      register_write_enable_in <= '1';
      read_register_2_in <= get_reg_addr(reg);
      write_register_in <= get_reg_addr(reg);
      write_data_in <= make_word(value);
      wait for clk_period;
      assert_equals(make_word(value), out_signal, message);
    end assert_generic;
   
    procedure assert_generic(reg: integer; value:integer; signal in_signal: register_address_t; signal out_signal: word_t ) is
     begin
      assert_generic(reg, value, in_signal, out_signal, "Should be able to read/write general purpose register.");
    end assert_generic;
    
    procedure assert_lsu_address_registers is
      constant max_int: std_logic_vector(WORD_WIDTH-1 downto 0):= (others => '1');
      constant max_address : std_logic_vector(DATA_ADDRESS_WIDTH -1 downto 0) := (others => '1');
     begin
      -- Address high/low can be treated as general purpose registers.
      -- Only difference is that their out should also be in lsu_data.
      -- Register $3 address high
      -- Test general purpose first
      assert_generic(register_address_hi, to_integer(unsigned(max_int)), read_register_1_in, read_data_1_out, " $3(Address high) Should be treated as a general purpose register."); 
      assert_generic(register_address_lo, to_integer(unsigned(max_int)), read_register_1_in, read_data_1_out, " $3(Address high) Should be treated as a general purpose register."); 
      
      --Test lsu address = hi & low
      assert_equals(max_address, lsu_address_out, "LSU address should consist of Address low and high bits from address high."); 
    end assert_lsu_address_registers;
    
    procedure assert_zero_reg is
     begin

      read_register_1_in <= get_reg_addr(register_zero);
      read_register_2_in <= get_reg_addr(register_zero);
      wait for clk_period;
      assert_equals(make_word(0), read_data_1_out, "Register $0 should be zero.");
      assert_equals(make_word(0), read_data_2_out, "Register $0 should be zero.");
      write_register_in <= get_reg_addr(register_zero);
      write_data_in <= make_word(1);
      wait for clk_period;
      assert_equals(make_word(0), read_data_1_out, "Register $0 should be write only.");
      assert_equals(make_word(0), read_data_2_out, "Register $0 should be write only.");

     end assert_zero_reg;
     
    procedure assert_id_registers is
     begin
      -- Register $1,$2 ID HI,LOW      
      id_register_write_enable_in <= '1';
      id_register_in <= (others=> '1'); 
      read_register_1_in <= get_reg_addr(register_id_hi);
      read_register_2_in <= get_reg_addr(register_id_lo);
      wait for clk_period;
      assert_equals(make_word(15), read_data_1_out, "ID value should be split into high and low registers.");
      assert_equals("1111111111111111", read_data_2_out, "ID value should be split into high and low registers.");
      write_register_in <= get_reg_addr(register_id_hi);
      write_data_in <= make_word(4);
      register_write_enable_in <= '1';
      wait for clk_period;
      write_register_in <= get_reg_addr(register_id_lo);
      wait for clk_period;
      assert_equals(make_word(15), read_data_1_out, "ID should be readonly.");
      assert_equals("1111111111111111", read_data_2_out, "ID should be readonly.");
     end assert_id_registers;
     
    procedure assert_lsu_data_register is
     begin
      --Return register($5) is also a general purpose register
      assert_generic(register_lsu_data, 12, read_register_1_in, read_data_1_out, "$5 should be treated as a general register.");
     
      --Test write from lsu
      register_write_enable_in <= '0';
      read_register_1_in <= get_reg_addr(register_lsu_data);
      return_register_write_enable_in <= '1';
      return_data_in <= make_word(9);
      wait for clk_period;
      assert_equals(make_word(9), read_data_1_out, "LSU should be able to write result");
     end assert_lsu_data_register;
    
    procedure assert_general_purpose_registers is
     begin
       --Test other general registers
       for i in 7 to num_registers -1 loop
        report "reg is " & integer'image(i);
        assert_generic(i, 30 + i, read_register_1_in, read_data_1_out);
      end loop;
      
      --
    end procedure assert_general_purpose_registers;
    
    procedure assert_mask_register is
     begin
      register_write_enable_in <= '1';
      write_register_in <= get_reg_addr(register_mask);
      write_data_in <= make_word(1);
      wait for clk_period;
      assert_equals('1', predicate_out, "Predicate should be writable.");
    end procedure assert_mask_register;
    
   procedure assert_register_file(file_number: integer) is
    begin
      barrel_row_select_in <= make_row(file_number);
      return_register_file_in <= make_row(file_number);
      assert_zero_reg;
      report "Asserted zero_reg";

      assert_id_registers;
      report "Asserted zero_reg";

      assert_lsu_address_registers;
      report "Asserted address registers";

      assert_lsu_data_register;
      report "Asserted data register";

      assert_mask_register;
      report "Asserted mask register";

      assert_general_purpose_registers;
      report "Asserted general purpose registers";
   end procedure assert_register_file;

   procedure write_register(register_file: integer;  reg: integer; value:integer) is
    begin
     barrel_row_select_in <= make_row(register_file);
     register_write_enable_in <= '1';
     write_register_in <= get_reg_addr(reg);
     write_data_in <= make_word(value);
     wait for clk_period;
     register_write_enable_in <= '0';
   end procedure write_register;
   
   procedure assert_register_file_read(register_file: integer; reg:integer; expected: integer) is
    begin
     barrel_row_select_in <= make_row(register_file);
     read_register_1_in <= get_reg_addr(reg);
     wait for clk_period;
     
     assert_equals(make_word(expected), read_data_1_out, "Registers should be persisted between barrel rolls.");
   end;
   constant max_id : std_logic_vector(DATA_WIDTH -1 downto 0) := (others => '1');
    begin
    
      for i in 0 to num_register_files -1 loop
        report "Asserting register file " & integer'image(i);
        assert_register_file(i);
      end loop;

      report "Tested all register files!";
      
      -- Test correct persistence between register files
      for reg_file in 0 to num_register_files -1 loop
        -- Write to return register
        return_register_file_in <= make_row(reg_file);
        return_data_in <= make_word(reg_file*100 + 5);
        return_register_write_enable_in <= '1';
        wait for clk_period;
        return_register_write_enable_in <= '0';
        
        for reg in 7 to num_registers -1 loop
          write_register(reg_file, reg, reg + reg_file*100);
        end loop;
      end loop;
      report "Set up all barrels for persistence test!";
      wait for clk_period;
      for reg_file in 0 to num_register_files -1 loop
       -- Make sure the return register hasnt been overwritten.
       barrel_row_select_in <= make_row(reg_file);
       wait for clk_period;
       assert_equals(make_word(reg_file*100 +5), lsu_write_data_out, "LSU data register should be persisted between barrel rolls.");
       for reg in 7 to num_registers -1 loop
          assert_register_file_read(reg_file, reg, reg + reg_file*100);
       end loop;
      end loop;
      
      
      wait; -- will wait forever
   end process tb;
  --  end test bench 

end;
