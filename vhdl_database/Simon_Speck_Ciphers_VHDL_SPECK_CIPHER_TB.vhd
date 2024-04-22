-- SPECK_CIPHER_TB.vhd
-- Copyright 2016 Michael Calvin McCoy
-- calvin.mccoy@gmail.com
-- see LICENSE.md
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:00:46 10/04/2015
-- Design Name:   
-- Module Name:   D:/Work/Code/Simon_Speck_Ciphers/VHDL/SPECK_CIPHER_TB.vhd
-- Project Name:  Speck
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SPECK_CIPHER
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
use work.SPECK_CONSTANTS.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SPECK_CIPHER_TB IS
END SPECK_CIPHER_TB;
 
ARCHITECTURE behavior OF SPECK_CIPHER_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPECK_CIPHER
	 GENERIC(KEY_SIZE : integer range 0 to 256;
				BLOCK_SIZE : integer range 0 to 128;
				ROUND_LIMIT: integer range 0 to 72);
    PORT(
         SYS_CLK : IN  std_logic;
         RST : IN  std_logic;
         BUSY : OUT  std_logic;
         CONTROL : IN  std_logic_vector(1 downto 0);
         KEY : IN  std_logic_vector(KEY_SIZE - 1 downto 0);
         BLOCK_INPUT : IN  std_logic_vector(BLOCK_SIZE - 1 downto 0);
         BLOCK_OUTPUT : OUT  std_logic_vector(BLOCK_SIZE - 1 downto 0)
        );
    END COMPONENT;
    

   --Global Inputs
	signal SYS_CLK : std_logic := '0';
	signal RST : std_logic := '0';
	signal CONTROL : std_logic_vector(1 downto 0) := (others => '0');
   
	--UUT 1 
	signal KEY_1 : std_logic_vector(63 downto 0) := (others => '0');
	signal BLOCK_INPUT_1 : std_logic_vector(31 downto 0) := (others => '0');
	signal BUSY_1 : std_logic;
	signal BLOCK_OUTPUT_1 : std_logic_vector(31 downto 0);
	
	--UUT 2 
	signal KEY_2 : std_logic_vector(71 downto 0) := (others => '0');
	signal BLOCK_INPUT_2 : std_logic_vector(47 downto 0) := (others => '0');
	signal BUSY_2 : std_logic;
	signal BLOCK_OUTPUT_2 : std_logic_vector(47 downto 0);
	
	--UUT 3 
	signal KEY_3 : std_logic_vector(95 downto 0) := (others => '0');
	signal BLOCK_INPUT_3 : std_logic_vector(47 downto 0) := (others => '0');
	signal BUSY_3 : std_logic;
	signal BLOCK_OUTPUT_3 : std_logic_vector(47 downto 0);
	
	--UUT 4 
	signal KEY_4 : std_logic_vector(95 downto 0) := (others => '0');
	signal BLOCK_INPUT_4 : std_logic_vector(63 downto 0) := (others => '0');
	signal BUSY_4 : std_logic;
	signal BLOCK_OUTPUT_4 : std_logic_vector(63 downto 0);
	
	--UUT 5 
	signal KEY_5 : std_logic_vector(127 downto 0) := (others => '0');
	signal BLOCK_INPUT_5 : std_logic_vector(63 downto 0) := (others => '0');
	signal BUSY_5 : std_logic;
	signal BLOCK_OUTPUT_5 : std_logic_vector(63 downto 0);
	
	--UUT 6 
	signal KEY_6 : std_logic_vector(95 downto 0) := (others => '0');
	signal BLOCK_INPUT_6 : std_logic_vector(95 downto 0) := (others => '0');
	signal BUSY_6 : std_logic;
	signal BLOCK_OUTPUT_6 : std_logic_vector(95 downto 0);
	
	--UUT 7 
	signal KEY_7 : std_logic_vector(143 downto 0) := (others => '0');
	signal BLOCK_INPUT_7 : std_logic_vector(95 downto 0) := (others => '0');
	signal BUSY_7 : std_logic;
	signal BLOCK_OUTPUT_7 : std_logic_vector(95 downto 0);
	
	--UUT 8 
	signal KEY_8 : std_logic_vector(127 downto 0) := (others => '0');
	signal BLOCK_INPUT_8 : std_logic_vector(127 downto 0) := (others => '0');
	signal BUSY_8 : std_logic;
	signal BLOCK_OUTPUT_8 : std_logic_vector(127 downto 0);
	
	--UUT 9 
	signal KEY_9 : std_logic_vector(191 downto 0) := (others => '0');
	signal BLOCK_INPUT_9 : std_logic_vector(127 downto 0) := (others => '0');
	signal BUSY_9 : std_logic;
	signal BLOCK_OUTPUT_9 : std_logic_vector(127 downto 0);
	
	--UUT 10 
	signal KEY_10 : std_logic_vector(255 downto 0) := (others => '0');
	signal BLOCK_INPUT_10 : std_logic_vector(127 downto 0) := (others => '0');
	signal BUSY_10 : std_logic;
	signal BLOCK_OUTPUT_10 : std_logic_vector(127 downto 0);

   -- Clock period definitions
   constant SYS_CLK_period : time := 10 ns;
  
BEGIN
  
	-- Instantiate the Unit Under Test (UUT)
  uut_1: SPECK_CIPHER
	GENERIC MAP (KEY_SIZE => 64,
					 BLOCK_SIZE => 32,
					 ROUND_LIMIT => Round_Count_Lookup(64, 32))
	PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_1,
          CONTROL => CONTROL,
          KEY => KEY_1,
          BLOCK_INPUT => BLOCK_INPUT_1,
          BLOCK_OUTPUT => BLOCK_OUTPUT_1
  );

  uut_2: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 72,
           BLOCK_SIZE => 48,
           ROUND_LIMIT => Round_Count_Lookup(72, 48))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_2,
          CONTROL => CONTROL,
          KEY => KEY_2,
          BLOCK_INPUT => BLOCK_INPUT_2,
          BLOCK_OUTPUT => BLOCK_OUTPUT_2
  );

  uut_3: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 96,
           BLOCK_SIZE => 48,
           ROUND_LIMIT => Round_Count_Lookup(96, 48))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_3,
          CONTROL => CONTROL,
          KEY => KEY_3,
          BLOCK_INPUT => BLOCK_INPUT_3,
          BLOCK_OUTPUT => BLOCK_OUTPUT_3
  );

  uut_4: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 96,
           BLOCK_SIZE => 64,
           ROUND_LIMIT => Round_Count_Lookup(96, 64))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_4,
          CONTROL => CONTROL,
          KEY => KEY_4,
          BLOCK_INPUT => BLOCK_INPUT_4,
          BLOCK_OUTPUT => BLOCK_OUTPUT_4
  );

  uut_5: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 128,
           BLOCK_SIZE => 64,
           ROUND_LIMIT => Round_Count_Lookup(128, 64))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_5,
          CONTROL => CONTROL,
          KEY => KEY_5,
          BLOCK_INPUT => BLOCK_INPUT_5,
          BLOCK_OUTPUT => BLOCK_OUTPUT_5
  );

  uut_6: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 96,
           BLOCK_SIZE => 96,
           ROUND_LIMIT => Round_Count_Lookup(96, 96))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_6,
          CONTROL => CONTROL,
          KEY => KEY_6,
          BLOCK_INPUT => BLOCK_INPUT_6,
          BLOCK_OUTPUT => BLOCK_OUTPUT_6
  );

  uut_7: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 144,
           BLOCK_SIZE => 96,
           ROUND_LIMIT => Round_Count_Lookup(144, 96))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_7,
          CONTROL => CONTROL,
          KEY => KEY_7,
          BLOCK_INPUT => BLOCK_INPUT_7,
          BLOCK_OUTPUT => BLOCK_OUTPUT_7
  );

  uut_8: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 128,
           BLOCK_SIZE => 128,
           ROUND_LIMIT => Round_Count_Lookup(128, 128))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_8,
          CONTROL => CONTROL,
          KEY => KEY_8,
          BLOCK_INPUT => BLOCK_INPUT_8,
          BLOCK_OUTPUT => BLOCK_OUTPUT_8
  );

  uut_9: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 192,
           BLOCK_SIZE => 128,
           ROUND_LIMIT => Round_Count_Lookup(192, 128))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_9,
          CONTROL => CONTROL,
          KEY => KEY_9,
          BLOCK_INPUT => BLOCK_INPUT_9,
          BLOCK_OUTPUT => BLOCK_OUTPUT_9
  );

  uut_10: SPECK_CIPHER
  GENERIC MAP (KEY_SIZE => 256,
           BLOCK_SIZE => 128,
           ROUND_LIMIT => Round_Count_Lookup(256, 128))
  PORT MAP (
          SYS_CLK => SYS_CLK,
          RST => RST,
          BUSY => BUSY_10,
          CONTROL => CONTROL,
          KEY => KEY_10,
          BLOCK_INPUT => BLOCK_INPUT_10,
          BLOCK_OUTPUT => BLOCK_OUTPUT_10
  );


  -- Clock process definitions
  SYS_CLK_process :process
  begin
        for i in 0 to 500 loop
                SYS_CLK <= '0';
  	        wait for SYS_CLK_period/2;
  	        SYS_CLK <= '1';
  	        wait for SYS_CLK_period/2;
        end loop ;
        wait;       
  end process;
 

   -- Stimulus process
stim_proc: process
begin		
    -- hold reset state for 100 ns.
    wait for 100 ns;	

	wait for SYS_CLK_period*10;
		
	KEY_1 <= X"1918111009080100";
	KEY_2 <= X"1211100a0908020100";
    KEY_3 <= X"1a19181211100a0908020100";
    KEY_4 <= X"131211100b0a090803020100";
    KEY_5 <= X"1b1a1918131211100b0a090803020100";
    KEY_6 <= X"0d0c0b0a0908050403020100";
    KEY_7 <= X"1514131211100d0c0b0a0908050403020100";
    KEY_8 <= X"0f0e0d0c0b0a09080706050403020100";
    KEY_9 <= X"17161514131211100f0e0d0c0b0a09080706050403020100";
	KEY_10 <= X"1f1e1d1c1b1a191817161514131211100f0e0d0c0b0a09080706050403020100";
	CONTROL <= "01";
	
    wait for SYS_CLK_period*3;
	CONTROL <= "00";
	wait for SYS_CLK_period*100;
		
	BLOCK_INPUT_1 <= X"6574694c";
	BLOCK_INPUT_2 <= X"20796c6c6172";
    BLOCK_INPUT_3 <= X"6d2073696874";
    BLOCK_INPUT_4 <= X"74614620736e6165";
    BLOCK_INPUT_5 <= X"3b7265747475432d";
    BLOCK_INPUT_6 <= X"65776f68202c656761737520";
    BLOCK_INPUT_7 <= X"656d6974206e69202c726576";
    BLOCK_INPUT_8 <= X"6c617669757165207469206564616d20";
    BLOCK_INPUT_9 <= X"726148206665696843206f7420746e65";
    BLOCK_INPUT_10 <= X"65736f6874206e49202e72656e6f6f70";
	CONTROL <= "11";
	
  wait for SYS_CLK_period*3;
	CONTROL <= "00";
	wait for SYS_CLK_period*100;

	assert BLOCK_OUTPUT_1 /= X"a86842f2" report "UUT1 Encryption Success" severity note;
  assert BLOCK_OUTPUT_1 = X"a86842f2" report "UUT1 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_2 /= X"c049a5385adc" report "UUT2 Encryption Success" severity note;
  assert BLOCK_OUTPUT_2 = X"c049a5385adc" report "UUT2 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_3 /= X"735e10b6445d" report "UUT3 Encryption Success" severity note;
  assert BLOCK_OUTPUT_3 = X"735e10b6445d" report "UUT3 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_4 /= X"9f7952ec4175946c" report "UUT4 Encryption Success" severity note;
  assert BLOCK_OUTPUT_4 = X"9f7952ec4175946c" report "UUT4 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_5 /= X"8c6fa548454e028b" report "UUT5 Encryption Success" severity note;
  assert BLOCK_OUTPUT_5 = X"8c6fa548454e028b" report "UUT5 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_6 /= X"9e4d09ab717862bdde8f79aa" report "UUT6 Encryption Success" severity note;
  assert BLOCK_OUTPUT_6 = X"9e4d09ab717862bdde8f79aa" report "UUT6 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_7 /= X"2bf31072228a7ae440252ee6" report "UUT7 Encryption Success" severity note;
  assert BLOCK_OUTPUT_7 = X"2bf31072228a7ae440252ee6" report "UUT7 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_8 /= X"a65d9851797832657860fedf5c570d18" report "UUT8 Encryption Success" severity note;
  assert BLOCK_OUTPUT_8 = X"a65d9851797832657860fedf5c570d18" report "UUT8 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_9 /= X"1be4cf3a13135566f9bc185de03c1886" report "UUT9 Encryption Success" severity note;
  assert BLOCK_OUTPUT_9 = X"1be4cf3a13135566f9bc185de03c1886" report "UUT9 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_10 /= X"4109010405c0f53e4eeeb48d9c188f43" report "UUT10 Encryption Success" severity note;
  assert BLOCK_OUTPUT_10 = X"4109010405c0f53e4eeeb48d9c188f43" report "UUT10 Encryption Failed" severity failure;
				
	BLOCK_INPUT_1 <= X"a86842f2";
  BLOCK_INPUT_2 <= X"c049a5385adc";
  BLOCK_INPUT_3 <= X"735e10b6445d";
  BLOCK_INPUT_4 <= X"9f7952ec4175946c";
  BLOCK_INPUT_5 <= X"8c6fa548454e028b";
  BLOCK_INPUT_6 <= X"9e4d09ab717862bdde8f79aa";
  BLOCK_INPUT_7 <= X"2bf31072228a7ae440252ee6";
  BLOCK_INPUT_8 <= X"a65d9851797832657860fedf5c570d18";
  BLOCK_INPUT_9 <= X"1be4cf3a13135566f9bc185de03c1886";
  BLOCK_INPUT_10 <= X"4109010405c0f53e4eeeb48d9c188f43";
	CONTROL <= "10";
	
  wait for SYS_CLK_period*3;
	CONTROL <= "00";
	wait for SYS_CLK_period*100;
	
  assert BLOCK_OUTPUT_1 /= X"6574694c" report "UUT1 Decryption Success" severity note;
  assert BLOCK_OUTPUT_1 = X"6574694c" report "UUT1 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_2 /= X"20796c6c6172" report "UUT2 Decryption Success" severity note;
  assert BLOCK_OUTPUT_2 = X"20796c6c6172" report "UUT2 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_3 /= X"6d2073696874" report "UUT3 Decryption Success" severity note;
  assert BLOCK_OUTPUT_3 = X"6d2073696874" report "UUT3 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_4 /= X"74614620736e6165" report "UUT4 Decryption Success" severity note;
  assert BLOCK_OUTPUT_4 = X"74614620736e6165" report "UUT4 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_5 /= X"3b7265747475432d" report "UUT5 Decryption Success" severity note;
  assert BLOCK_OUTPUT_5 = X"3b7265747475432d" report "UUT5 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_6 /= X"65776f68202c656761737520" report "UUT6 Decryption Success" severity note;
  assert BLOCK_OUTPUT_6 = X"65776f68202c656761737520" report "UUT6 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_7 /= X"656d6974206e69202c726576" report "UUT7 Decryption Success" severity note;
  assert BLOCK_OUTPUT_7 = X"656d6974206e69202c726576" report "UUT7 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_8 /= X"6c617669757165207469206564616d20" report "UUT8 Decryption Success" severity note;
  assert BLOCK_OUTPUT_8 = X"6c617669757165207469206564616d20" report "UUT8 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_9 /= X"726148206665696843206f7420746e65" report "UUT9 Decryption Success" severity note;
  assert BLOCK_OUTPUT_9 = X"726148206665696843206f7420746e65" report "UUT9 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_10 /= X"65736f6874206e49202e72656e6f6f70" report "UUT10 Decryption Success" severity note;
  assert BLOCK_OUTPUT_10 = X"65736f6874206e49202e72656e6f6f70" report "UUT10 Decryption Failed" severity failure;
		

      -- insert stimulus here 

      wait;
   end process;

END;
