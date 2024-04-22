library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_ADDRESS_CONTROL_CHANNEL_MODEL is
	PORT
		(
		-- User signals
		clk               : in  STD_LOGIC;
		resetn            : in  STD_LOGIC;
		go                : out STD_LOGIC;
		done              : in  STD_LOGIC;
        error             : in  STD_LOGIC;
        address           : out STD_logic_vector(31 downto 0);
        burst_length      : out integer range 1 to 256;
        burst_size        : out integer range 1 to 128;
        increment_burst   : out STD_LOGIC;
		
		-- AXI Master signals
		AxID              : in  STD_LOGIC_VECTOR (3 downto 0);
		AxADDR		      : in  STD_LOGIC_VECTOR (31 downto 0);
		AxLEN             : in  STD_LOGIC_VECTOR (7 downto 0);
		AxSIZE            : in  STD_LOGIC_VECTOR (2 downto 0);
		AxBURST           : in  STD_LOGIC_VECTOR (1 downto 0);
		AxLOCK            : in  STD_LOGIC_VECTOR (1 downto 0);
		AxCACHE           : in  STD_LOGIC_VECTOR (3 downto 0);
		AxPROT            : in  STD_LOGIC_VECTOR (2 downto 0);
		AxVALID		      : in  STD_LOGIC;
		AxREADY		      : out STD_LOGIC;
		AxQOS             : in  STD_LOGIC_VECTOR (3 downto 0);
		AxREGION          : in  STD_LOGIC_VECTOR (3 downto 0)
		);
end AXI_ADDRESS_CONTROL_CHANNEL_MODEL;



architecture Behavioral of AXI_ADDRESS_CONTROL_CHANNEL_MODEL is

begin


AxREADY_process : process
begin
    AxREADY <= '0';
    loop
        wait until AxVALID = '1';
        wait until clk = '0';
        wait until clk = '1';
        AxREADY <= '1';
        wait until clk = '0';
        wait until clk = '1';
        AxREADY <= '0';
    end loop;    
    AxREADY <= '0';
    wait;
end process;


stimulus : process
begin
    go <= '0';
    address <= (others => '0');
    burst_length <= 1;
    burst_size <= 1;
    increment_burst <= '0';

    -- Wait for a reset pulse
    wait until resetn = '1';
    wait until resetn = '0';
    wait until resetn = '1';

    -- Generate a single beat transaction, 32 bit wide 
    wait until clk = '1';
    address <= X"10000000";
    burst_length <= 1;
    burst_size <= 4;
    increment_burst <= '1';
    go <= '1';

    wait until done = '1';
    address <= (others => '0');
    burst_length <= 1;
    burst_size <= 1;
    increment_burst <= '0';
    go <= '0';

    wait until done = '0';


    -- Generate an 8 beat burst transaction, 32 bit wide 
    wait until clk = '1';
    address <= X"10000000";
    burst_length <= 8;
    burst_size <= 4;
    increment_burst <= '1';
    go <= '1';

    wait until done = '1';
    address <= (others => '0');
    burst_length <= 1;
    burst_size <= 1;
    increment_burst <= '0';
    go <= '0';

    wait;
end process;


end Behavioral;

