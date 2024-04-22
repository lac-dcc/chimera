--------------------------------------------------------------------------------
-- Company:LAAS-CNRS 
-- Author:Jonathan Piat <piat.jonathan@gmail.com>
--
-- Create Date:   13:58:03 09/07/2012
-- Design Name:   
-- Module Name:   /home/jpiat/development/FPGA/projects/fpga-cam/hdl/test_benches/conv3x3_tb.vhd
-- Project Name:  SPARTCAM
-- Target Device:  
-- Tool versions: ISE 14.1  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: conv3x3
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
USE ieee.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

 
 
 
ENTITY conv3x3_tb IS
END conv3x3_tb;
 
ARCHITECTURE behavior OF conv3x3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	component conv3x3 is
	generic(KERNEL : imatNM(0 to 2, 0 to 2) := ((1, 2, 1),(0, 0, 0),(-1, -2, -1));
		  NON_ZERO	: index_array := ((0, 0), (0, 1), (0, 2), (2, 0), (2, 1), (2, 2), (3, 3), (3, 3), (3, 3) ); -- (3, 3) indicate end  of non zero values
		  IS_POWER_OF_TWO : natural := 0 -- (3, 3) indicate end  of non zero values
		  );
	port(
		clk : in std_logic; 
		resetn : in std_logic; 
		new_block : in std_logic ;
		block3x3 : in matNM(0 to 2, 0 to 2);
		new_conv : out std_logic ;
		busy : out std_logic ;
		abs_res : out std_logic_vector(7 downto 0 );
		raw_res : out signed(15 downto 0 )
	);
	end component;
	 
	 
	 
	type test_vect_3x3_type is array(0 to 2) of mat3 ;
	

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal new_block : std_logic := '0';
   signal block3x3 : mat3;
	

 	--Outputs
   signal new_conv : std_logic;
   signal busy : std_logic;
   signal abs_res : std_logic_vector(7 downto 0);
   signal raw_res : signed(15 downto 0);

	signal test_vec : test_vect_3x3_type := 
	((( to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
	(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
	(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9))),
	
	(( to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
	(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
	(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9))),
	
	(( to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
	(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
	(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)))
	);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	block3x3 <=  (( to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
										(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)), 
										(to_signed(1, 9), to_signed(1, 9), to_signed(1, 9)));
 
	-- Instantiate the Unit Under Test (UUT)
   uut: conv3x3 
	generic map(KERNEL =>((1, 2, 1),(0, 0, 0),(-1, -2, -1)),
		  NON_ZERO	=> ((0, 0), (0, 1), (0, 2), (2, 0), (2, 1), (2, 2), (3, 3), (3, 3), (3, 3) ), -- (3, 3) indicate end  of non zero values
		  IS_POWER_OF_TWO => 0
		  )
	PORT MAP (
          clk => clk,
          resetn => resetn,
          new_block => new_block,
          block3x3 => block3x3,
          new_conv => new_conv,
          busy => busy,
          abs_res => abs_res,
          raw_res => raw_res
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
   begin		
      resetn <= '0' ;
      wait for 100 ns;	
		resetn <= '1' ;
      wait for clk_period*5;
		for i in 0 to 2 loop
			new_block <= '1' ;
			block3x3 <= test_vec(i);
			wait for clk_period;
			new_block <= '0' ;
			wait until new_conv = '1' ;
		end loop ;
      -- insert stimulus here 
      wait;
   end process;

END;
