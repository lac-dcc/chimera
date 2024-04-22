-- SIMON_CIPHER_TB.vhd
-- Copyright 2016 Michael Calvin McCoy
-- calvin.mccoy@gmail.com
-- see LICENSE.md
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:00:46 10/04/2015
-- Design Name:   
-- Module Name:   D:/Work/Code/Simon_Speck_Ciphers/VHDL/SIMON_CIPHER_TB.vhd
-- Project Name:  Simon
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SIMON_CIPHER
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
use work.SIMON_CONSTANTS.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SIMON_CIPHER_TB IS
END SIMON_CIPHER_TB;
 
ARCHITECTURE behavior OF SIMON_CIPHER_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SIMON_CIPHER
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
  uut_1: SIMON_CIPHER
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

  uut_2: SIMON_CIPHER
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

  uut_3: SIMON_CIPHER
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

  uut_4: SIMON_CIPHER
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

  uut_5: SIMON_CIPHER
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

  uut_6: SIMON_CIPHER
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

  uut_7: SIMON_CIPHER
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

  uut_8: SIMON_CIPHER
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

  uut_9: SIMON_CIPHER
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

  uut_10: SIMON_CIPHER
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
		
	BLOCK_INPUT_1 <= X"65656877";
	BLOCK_INPUT_2 <= X"6120676e696c";
  BLOCK_INPUT_3 <= X"72696320646e";
  BLOCK_INPUT_4 <= X"6f7220676e696c63";
  BLOCK_INPUT_5 <= X"656b696c20646e75";
  BLOCK_INPUT_6 <= X"2072616c6c69702065687420";
  BLOCK_INPUT_7 <= X"74616874207473756420666f";
  BLOCK_INPUT_8 <= X"63736564207372656c6c657661727420";
  BLOCK_INPUT_9 <= X"206572656874206e6568772065626972";
  BLOCK_INPUT_10 <= X"74206e69206d6f6f6d69732061207369";
	CONTROL <= "11";
	
  wait for SYS_CLK_period*3;
	CONTROL <= "00";
	wait for SYS_CLK_period*100;

	assert BLOCK_OUTPUT_1 /= X"c69be9bb" report "UUT1 Encryption Success" severity note;
  assert BLOCK_OUTPUT_1 = X"c69be9bb" report "UUT1 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_2 /= X"dae5ac292cac" report "UUT2 Encryption Success" severity note;
  assert BLOCK_OUTPUT_2 = X"dae5ac292cac" report "UUT2 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_3 /= X"6e06a5acf156" report "UUT3 Encryption Success" severity note;
  assert BLOCK_OUTPUT_3 = X"6e06a5acf156" report "UUT3 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_4 /= X"5ca2e27f111a8fc8" report "UUT4 Encryption Success" severity note;
  assert BLOCK_OUTPUT_4 = X"5ca2e27f111a8fc8" report "UUT4 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_5 /= X"44c8fc20b9dfa07a" report "UUT5 Encryption Success" severity note;
  assert BLOCK_OUTPUT_5 = X"44c8fc20b9dfa07a" report "UUT5 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_6 /= X"602807a462b469063d8ff082" report "UUT6 Encryption Success" severity note;
  assert BLOCK_OUTPUT_6 = X"602807a462b469063d8ff082" report "UUT6 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_7 /= X"ecad1c6c451e3f59c5db1ae9" report "UUT7 Encryption Success" severity note;
  assert BLOCK_OUTPUT_7 = X"ecad1c6c451e3f59c5db1ae9" report "UUT7 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_8 /= X"49681b1e1e54fe3f65aa832af84e0bbc" report "UUT8 Encryption Success" severity note;
  assert BLOCK_OUTPUT_8 = X"49681b1e1e54fe3f65aa832af84e0bbc" report "UUT8 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_9 /= X"c4ac61effcdc0d4f6c9c8d6e2597b85b" report "UUT9 Encryption Success" severity note;
  assert BLOCK_OUTPUT_9 = X"c4ac61effcdc0d4f6c9c8d6e2597b85b" report "UUT9 Encryption Failed" severity failure;

  assert BLOCK_OUTPUT_10 /= X"8d2b5579afc8a3a03bf72a87efe7b868" report "UUT10 Encryption Success" severity note;
  assert BLOCK_OUTPUT_10 = X"8d2b5579afc8a3a03bf72a87efe7b868" report "UUT10 Encryption Failed" severity failure;
				
	BLOCK_INPUT_1 <= X"c69be9bb";
  BLOCK_INPUT_2 <= X"dae5ac292cac";
  BLOCK_INPUT_3 <= X"6e06a5acf156";
  BLOCK_INPUT_4 <= X"5ca2e27f111a8fc8";
  BLOCK_INPUT_5 <= X"44c8fc20b9dfa07a";
  BLOCK_INPUT_6 <= X"602807a462b469063d8ff082";
  BLOCK_INPUT_7 <= X"ecad1c6c451e3f59c5db1ae9";
  BLOCK_INPUT_8 <= X"49681b1e1e54fe3f65aa832af84e0bbc";
  BLOCK_INPUT_9 <= X"c4ac61effcdc0d4f6c9c8d6e2597b85b";
  BLOCK_INPUT_10 <= X"8d2b5579afc8a3a03bf72a87efe7b868";
	CONTROL <= "10";
	
  wait for SYS_CLK_period*3;
	CONTROL <= "00";
	wait for SYS_CLK_period*100;
	
  assert BLOCK_OUTPUT_1 /= X"65656877" report "UUT1 Decryption Success" severity note;
  assert BLOCK_OUTPUT_1 = X"65656877" report "UUT1 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_2 /= X"6120676e696c" report "UUT2 Decryption Success" severity note;
  assert BLOCK_OUTPUT_2 = X"6120676e696c" report "UUT2 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_3 /= X"72696320646e" report "UUT3 Decryption Success" severity note;
  assert BLOCK_OUTPUT_3 = X"72696320646e" report "UUT3 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_4 /= X"6f7220676e696c63" report "UUT4 Decryption Success" severity note;
  assert BLOCK_OUTPUT_4 = X"6f7220676e696c63" report "UUT4 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_5 /= X"656b696c20646e75" report "UUT5 Decryption Success" severity note;
  assert BLOCK_OUTPUT_5 = X"656b696c20646e75" report "UUT5 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_6 /= X"2072616c6c69702065687420" report "UUT6 Decryption Success" severity note;
  assert BLOCK_OUTPUT_6 = X"2072616c6c69702065687420" report "UUT6 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_7 /= X"74616874207473756420666f" report "UUT7 Decryption Success" severity note;
  assert BLOCK_OUTPUT_7 = X"74616874207473756420666f" report "UUT7 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_8 /= X"63736564207372656c6c657661727420" report "UUT8 Decryption Success" severity note;
  assert BLOCK_OUTPUT_8 = X"63736564207372656c6c657661727420" report "UUT8 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_9 /= X"206572656874206e6568772065626972" report "UUT9 Decryption Success" severity note;
  assert BLOCK_OUTPUT_9 = X"206572656874206e6568772065626972" report "UUT9 Decryption Failed" severity failure;

  assert BLOCK_OUTPUT_10 /= X"74206e69206d6f6f6d69732061207369" report "UUT10 Decryption Success" severity note;
  assert BLOCK_OUTPUT_10 = X"74206e69206d6f6f6d69732061207369" report "UUT10 Decryption Failed" severity failure;

	wait;	
end process;
  
END behavior;
