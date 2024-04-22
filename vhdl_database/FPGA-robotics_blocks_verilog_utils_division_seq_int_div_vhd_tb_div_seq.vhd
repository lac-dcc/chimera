
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:14:37 01/16/2007
-- Design Name:   div_seq
-- Module Name:   D:/Docencia/myDocencia/TELECO/DCSE/curso0607/practicas/operaciones/tb_div_seq.vhd
-- Project Name:  operaciones
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: div_seq
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

ENTITY tb_div_seq_vhd IS
END tb_div_seq_vhd;

ARCHITECTURE behavior OF tb_div_seq_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT div_seq
	PORT(
		resetN : IN std_logic;
		clk : IN std_logic;
		divide : IN std_logic;
		Dividendo : IN std_logic_vector(11 downto 0);
		Divisor : IN std_logic_vector(11 downto 0);          
		Cociente : OUT std_logic_vector(11 downto 0);
		Resto : OUT std_logic_vector(11 downto 0);
		AvisoDiv : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL resetN :  std_logic := '0';
	SIGNAL clk :  std_logic := '0';
	SIGNAL divide :  std_logic := '0';
	SIGNAL Dividendo :  std_logic_vector(11 downto 0) := (others=>'0');
	SIGNAL Divisor :  std_logic_vector(11 downto 0) := (others=>'0');

        signal Dividendo_int : natural range 0 to 2**12-1;
        signal Divisor_int   : natural range 0 to 2**12-1;
        signal Cociente_int   : natural range 0 to 2**12-1;
        signal Resto_int   : natural range 0 to 2**12-1;

	--Outputs
	SIGNAL Cociente :  std_logic_vector(11 downto 0);
	SIGNAL Resto :  std_logic_vector(11 downto 0);
	SIGNAL AvisoDiv :  std_logic;

BEGIN

  Dividendo <= std_logic_vector(TO_UNSIGNED (Dividendo_int, 12));
  Divisor <= std_logic_vector(TO_UNSIGNED (Divisor_int, 12));
  Cociente_int <= to_integer(unsigned(Cociente));
  Resto_int <= to_integer(unsigned(Resto));

	-- Instantiate the Unit Under Test (UUT)
	uut: div_seq PORT MAP(
		resetN => resetN,
		clk => clk,
		divide => divide,
		Dividendo => Dividendo,
		Divisor => Divisor,
		Cociente => Cociente,
		Resto => Resto,
		AvisoDiv => AvisoDiv
	);

  PClk:Process
  begin
    Clk <= '1';
    wait for 5 ns; -- 100 MHz: 5ns + 5ns
    Clk <= '0';
    wait for 5 ns;
  end process;
  
  PReset:Process
  begin
    ResetN <= '0';
    wait for 14 ns;
    ResetN <= '1';
    wait for 28 ns;
    ResetN <= '0';
    wait for 18 ns;
    ResetN <= '1';
    wait;
  end process;   
  
  PDiv: Process
  begin
    divide <= '0';
    wait for 100 ns;
    wait on clk until clk='0';
    Dividendo_int <= 129;
    Divisor_int <= 16;
    divide <= '1';
    wait on clk until clk='0';
    divide <= '0';
    wait on AvisoDiv until AvisoDiv = '1';
    wait on clk until clk='0';
    Dividendo_int <= 300;
    Divisor_int <= 12;
    divide <= '1';
    wait on clk until clk='1';
    divide <= '0';
    wait until AvisoDiv = '1';
    wait on clk until clk='0';
    wait on clk until clk='0';
    Dividendo_int <= 1300;
    Divisor_int <= 49;
    divide <= '1';
    wait on clk until clk='0';
    divide <= '0';
    wait until AvisoDiv = '1';
    Dividendo_int <= 1;
    wait on clk until clk='0';

    for i in 0 to 1000 loop
      Dividendo_int <= Dividendo_int + 1;
      Divisor_int <= 9;
      divide <= '1';
      wait on clk until clk='1';
      divide <= '0';
      wait until AvisoDiv = '1' ;
      wait on clk until clk='1';
    end loop;

    wait;
  end process;
END;
