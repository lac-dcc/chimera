----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 13.11.2014 09:54:46
-- Design Name: 
-- Module Name: DATA_FREQUENCY_MULTIPLIER - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DATA_FREQUENCY_MULTIPLIER is
	Generic(
		DATA_WIDTH : integer := 64
	);
	Port(
		CLK_I        : in  std_logic;
		CLK_MULT_I   : in  std_logic;
		STROBE_I     : in  std_logic;

		DATA_VALID_I : in  std_logic;
		DATA_I       : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
		DATA_VALID_O : out std_logic;
		DATA_O       : out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
end DATA_FREQUENCY_MULTIPLIER;

architecture Behavioral of DATA_FREQUENCY_MULTIPLIER is
	attribute DONT_TOUCH : string;

	constant number_of_acks : integer := DATA_WIDTH / 16;

	signal data_d1            : std_logic_vector(DATA_WIDTH - 1 downto 0);
	signal data_valid_d1_flag : std_logic := '0';

	signal data_d2 : std_logic_vector(DATA_WIDTH - 1 downto 0);

	signal data_valid_d2_flag     : std_logic := '0';
	signal data_valid_d2_flag_old : std_logic := '0';

	signal ack_flag       : std_logic_vector(number_of_acks - 1 downto 0);
	signal ack_flag_extra : std_logic;

	attribute DONT_TOUCH of ack_flag : signal is "true";
	attribute DONT_TOUCH of ack_flag_extra : signal is "true";

begin
	INPUT_REGISTER_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			data_d1 <= DATA_I;
			if (DATA_VALID_I = '1') then
				data_valid_d1_flag <= not data_valid_d1_flag;
			end if;
		end if;
	end process INPUT_REGISTER_proc;

	GENERATE_A : for i in 0 to number_of_acks - 1 generate
	begin
		ACKNOWLEDGE_PROC : process(CLK_MULT_I) is
		begin
			if rising_edge(CLK_MULT_I) then
				ack_flag(i) <= STROBE_I;
			end if;
		end process ACKNOWLEDGE_PROC;

		RECEIVE_proc : process(CLK_MULT_I) is
		begin
			if rising_edge(CLK_MULT_I) then
				if (ack_flag(i) = '1') then
					data_d2((16 * i) + 15 downto 16 * i) <= data_d1((16 * i) + 15 downto 16 * i);
				end if;
			end if;
		end process RECEIVE_proc;
	end generate GENERATE_A;

	ACKNOWLEDGE_PROC : process(CLK_MULT_I) is
	begin
		if rising_edge(CLK_MULT_I) then
			ack_flag_extra <= STROBE_I;
		end if;
	end process ACKNOWLEDGE_PROC;

	RECEIVE_proc : process(CLK_MULT_I) is
	begin
		if rising_edge(CLK_MULT_I) then
			if (ack_flag_extra = '1') then
				data_valid_d2_flag <= data_valid_d1_flag;
			end if;
		end if;
	end process RECEIVE_proc;

	GENERATE_B : if ((DATA_WIDTH - 1) > 16 * number_of_acks) generate
	begin
		RECEIVE_proc : process(CLK_MULT_I) is
		begin
			if rising_edge(CLK_MULT_I) then
				if (ack_flag_extra = '1') then
					data_d2(DATA_WIDTH - 1 downto 16 * number_of_acks) <= data_d1(DATA_WIDTH - 1 downto 16 * number_of_acks);
				end if;
			end if;
		end process RECEIVE_proc;
	end generate GENERATE_B;

	OUTPUT_REGISTER_proc : process(CLK_MULT_I) is
	begin
		if rising_edge(CLK_MULT_I) then
			DATA_O <= data_d2;
			if (data_valid_d2_flag /= data_valid_d2_flag_old) then
				DATA_VALID_O <= '1';
			else
				DATA_VALID_O <= '0';
			end if;
			data_valid_d2_flag_old <= data_valid_d2_flag;
		end if;
	end process OUTPUT_REGISTER_proc;

end Behavioral;
