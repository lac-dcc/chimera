----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:13 12/01/2015 
-- Design Name: 
-- Module Name:    ff_sync - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ff_sync is
	generic(
		STAGES : integer := 1;
		WIDTH : integer := 1;
		RESET_VAL : std_logic := '0'
	);
	port(
		clk   : in   std_logic;
		reset : in   std_logic;
		din   : in   std_logic_vector(WIDTH-1 downto 0);
		dout  : out  std_logic_vector(WIDTH-1 downto 0)
	);
end ff_sync;

architecture Behavioral of ff_sync is

	subtype dsync_t is std_logic_vector(WIDTH-1 downto 0);
	type dsync_array_t is array (0 to STAGES) of dsync_t;

	-- Chain of flip-flops
	signal dsync : dsync_array_t := (others => (others => RESET_VAL));

	-- Do not use shift registers as synchronizers
	attribute SHREG_EXTRACT : string;
	attribute SHREG_EXTRACT of dsync : signal is "NO";

	attribute ASYNC_REG : string;
	attribute ASYNC_REG of dsync : signal is "TRUE";

begin

	dout <= dsync(STAGES);

	stage_0 : process
	begin
		wait until rising_edge(clk);
		if (reset = '1') then
			dsync(0) <= (others => RESET_VAL);
		else
			dsync(0) <= din;
		end if;
	end process;

	synchronizer : for i in 1 to STAGES generate
	begin
		process
		begin
			wait until rising_edge(clk);
			if (reset = '1') then
				dsync(i) <= (others => RESET_VAL);
			else
				dsync(i) <= dsync(i-1);
			end if;
		end process;
	end generate;

end Behavioral;
