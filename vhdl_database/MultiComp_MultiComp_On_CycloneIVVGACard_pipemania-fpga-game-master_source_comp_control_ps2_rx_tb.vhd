-- ps2_rx_tb.vhd - TB modulu pro prijem signalu z portu PS2
-- Autori: Jakub Cabal
-- Posledni zmena: 04.10.2014 21:24
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
ENTITY TB_PS2_RX IS
END TB_PS2_RX;
 
ARCHITECTURE behavior OF TB_PS2_RX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PS2_RX
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         PS2C : IN  std_logic;
         PS2D : IN  std_logic;
         PS2RX_DATA : OUT  std_logic_vector(7 downto 0);
         PS2RX_VALID : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal ps2c : std_logic := '0';
   signal ps2d : std_logic := '0';

 	--Outputs
   signal PS2RX_DATA : std_logic_vector(7 downto 0);
   signal PS2RX_VALID : std_logic;

   -- Clock period definitions
   constant CLK2_period : time := 10 ns;
	constant clk_period : time := 90 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PS2_RX PORT MAP (
          CLK => CLK,
          RST => RST,
          PS2C => ps2c,
          PS2D => ps2d,
          PS2RX_DATA => PS2RX_DATA,
          PS2RX_VALID => PS2RX_VALID
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK2_period/2;
		CLK <= '1';
		wait for CLK2_period/2;
   end process;

	-- Stimulus process - generate scan codes
	p_keyboard: process
		variable data : std_logic_vector(7 downto 0);
		variable parity : std_logic;
	begin
		ps2d <= '1';
		ps2c <= '1';
		
		RST <= '1';
		wait for 100 ns;
      RST <= '0';

		wait for clk_period*10;
		----------------------------------------------------------------------------------
		-- key A - make code
		data := X"1C";
		parity := data(7) xor data(6) xor data(5) xor data(4) xor data(3) xor data(2) xor data(1) xor data(0) xor '1';

		ps2d <= '0';							-- start bit
		wait for clk_period*0.1;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		for i in 0 to 7 loop
			ps2d <= data(0);					-- LSB first
			data := '0' & data(7 downto 1);		-- shift right
			wait for clk_period/2;
			ps2c <= '0';
			wait for clk_period/2;
			ps2c <= '1';
		end loop;

		ps2d <= parity;							-- parity bit
		wait for clk_period/2;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		ps2d <= '1';							-- stop bit
		wait for clk_period/2;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		wait for clk_period*50;

		----------------------------------------------------------------------------------
		-- break code
		data := X"F0";
		parity := data(7) xor data(6) xor data(5) xor data(4) xor data(3) xor data(2) xor data(1) xor data(0) xor '1';

		ps2d <= '0';							-- start bit
		wait for clk_period*0.1;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		for i in 0 to 7 loop
			ps2d <= data(0);					-- LSB first
			data := '0' & data(7 downto 1);		-- shift right
			wait for clk_period/2;
			ps2c <= '0';
			wait for clk_period/2;
			ps2c <= '1';
		end loop;

		ps2d <= parity;							-- parity bit
		wait for clk_period/2;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		ps2d <= '1';							-- stop bit
		wait for clk_period/2;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		wait for clk_period*50;

		----------------------------------------------------------------------------------
		-- break code of key A
		data := X"1C";
		parity := data(7) xor data(6) xor data(5) xor data(4) xor data(3) xor data(2) xor data(1) xor data(0) xor '1';

		ps2d <= '0';							-- start bit
		wait for clk_period*0.1;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		for i in 0 to 7 loop
			ps2d <= data(0);					-- LSB first
			data := '0' & data(7 downto 1);		-- shift right
			wait for clk_period/2;
			ps2c <= '0';
			wait for clk_period/2;
			ps2c <= '1';
		end loop;

		ps2d <= parity;							-- parity bit
		wait for clk_period/2;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		ps2d <= '1';							-- stop bit
		wait for clk_period/2;
		ps2c <= '0';
		wait for clk_period/2;
		ps2c <= '1';

		wait for clk_period*50;

		----------------------------------------------------------------------------------
		-- end of simulation
		wait;

	end process p_keyboard;

END;