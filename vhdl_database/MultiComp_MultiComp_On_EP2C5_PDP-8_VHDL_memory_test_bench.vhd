--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:08:35 05/28/2012
-- Design Name:   
-- Module Name:   C:/XilinxProjects/ram_controller/memory_test_bench.vhd
-- Project Name:  ram_controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram_controller
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memory_test_bench IS
END memory_test_bench;
 
ARCHITECTURE behavior OF memory_test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memory_Module
    Port ( clk : in  STD_LOGIC;
           reset : in STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (11 downto 0);
           write_data : in  STD_LOGIC_VECTOR (11 downto 0);
           read_data : out  STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
           write_enable : in  STD_LOGIC; -- start write memory cycle, address and write data are valid
           read_enable : in  STD_LOGIC; -- start read cycle, address is valid
           mem_finished : out  STD_LOGIC; -- memory cycle is done OK to latch read data
-- Note that read_enable and write_enable may be asserted over many clock cycles but must
-- be released when mem_finished occurs. The address and write data are latched on the first
-- active clock edge when the enable is asserted. 
-- Mem_finished only lasts through one active clock edge.

   	        RamCLK : out STD_LOGIC;
		    RamADVn : out STD_LOGIC;
            RamCEn : out STD_LOGIC;
            RamCRE : out STD_LOGIC;
            RamOEn : out STD_LOGIC;
            RamWEn : out STD_LOGIC;
            RamLBn : out STD_LOGIC;
            RamUBn : out STD_LOGIC;
            RamWait : in STD_LOGIC;
            MemDB : inout STD_LOGIC_VECTOR (15 downto 0);
            MemAdr : out STD_LOGIC_VECTOR (22 downto 0));
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rd_enable : std_logic := '0';
   signal wr_enable : std_logic := '0';
   signal address : std_logic_vector(11 downto 0) := (others => '0');
   signal wr_data : std_logic_vector(11 downto 0) := (others => '0');

	--BiDirs
   signal ram_data : std_logic_vector(15 downto 0);

 	--Outputs
   signal rd_data : std_logic_vector(11 downto 0);
   signal finished : std_logic;
   signal ram_addr : std_logic_vector(22 downto 0);
   signal ram_oe : std_logic;
   signal ram_we : std_logic;
   signal ram_mt_adv : std_logic;
   signal ram_mt_clk : std_logic;
   signal ram_mt_ub : std_logic;
   signal ram_mt_lb : std_logic;
   signal ram_mt_ce : std_logic;
   signal ram_mt_cre : std_logic;

   signal reset : std_logic := '0';
	
	-- The RAM
	type RAMTYPE is array (0 to 4095) of std_logic_vector (11 downto 0);
	signal ram : RAMTYPE;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
    uut: memory_module PORT MAP(
            clk => clk,
            reset => reset,
           address => address,
           write_data => wr_data,
           read_data => rd_data,
           write_enable => wr_enable,
           read_enable => rd_enable,
           mem_finished => finished,
   	        RamCLK => ram_mt_clk,
		    RamADVn => ram_mt_adv,
            RamCEn => ram_mt_ce,
            RamCRE => ram_mt_cre,
            RamOEn => ram_oe,
            RamWEn => ram_we,
            RamLBn => ram_mt_lb,
            RamUBn => ram_mt_ub,
            RamWait => '0',
            MemDB => ram_data,
            MemAdr => ram_addr);


   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

	process (ram_we) -- Writing to the RAM
	begin
		if rising_edge(ram_we) then -- capture on rising edge
			ram(Conv_INTEGER(ram_addr(11 downto 0))) <= ram_data(11 downto 0);
		end if;
	end process;
	
	process  -- Reading from the RAM
	begin
		ram_data <= (others => 'Z');
		wait until ram_oe = '0'; -- start cycle on falling edge of OE
		ram_data <= (others => '0'); -- start driving
		wait for 70 ns;
		ram_data(11 downto 0) <= ram(Conv_INTEGER(ram_addr(11 downto 0)));
		wait until ram_oe = '1';
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		address <= "000010000000";
		rd_enable <= '1';
		wait until finished = '1' and falling_edge(clk);
		rd_enable <= '0';
		wait until finished = '0' and falling_edge(clk);
		wr_data <= "111100001111";
		wr_enable <= '1';
		wait until finished = '1' and falling_edge(clk);
		wr_enable <= '0';
		wait until finished = '0' and falling_edge(clk);
		rd_enable <= '1';
		wait until finished = '1' and falling_edge(clk);

      wait;
   end process;

END;
