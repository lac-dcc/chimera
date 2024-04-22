------------------------------------------------------------------------------
-- FILE NAME            : gearbox_10to16.vhd
------------------------------------------------------------------------------
-- COMPANY              : PERALEX ELECTRONICS (PTY) LTD
------------------------------------------------------------------------------
-- COPYRIGHT NOTICE :
--
-- The copyright, manufacturing and patent rights stemming from this document
-- in any form are vested in PERALEX ELECTRONICS (PTY) LTD.
--
-- (c) PERALEX ELECTRONICS (PTY) LTD 2021
--
-- PERALEX ELECTRONICS (PTY) LTD has ceded these rights to its clients
-- where contractually agreed.
------------------------------------------------------------------------------
-- DESCRIPTION :
--	 This component is a 10 to 16 gearbox
--
------------------------------------------------------------------------------

------------------------
-- LIBRARIES
------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

------------------------
-- ENTITY
------------------------
entity gearbox_10to16 is
port(
	clk             : in  std_logic;
	reset_n         : in  std_logic;
	data_in_10x12b  : in  std_logic_vector(119 downto 0);
	data_out_16x12b : out std_logic_vector(191 downto 0);
	valid           : out std_logic);
end gearbox_10to16;

architecture arc_gearbox_10to16 of gearbox_10to16 is

    ------------------------
	-- TYPES
	------------------------
	type std_12b_array_8_type  is array (0 to 23) of std_logic_vector(11 downto 0);  -- TODO: CREATE PERMANET FIX, THIS IS A WORKAROUND
	type std_12b_array_10_type is array (0 to 23) of std_logic_vector(11 downto 0); -- TODO: CREATE PERMANET FIX, THIS IS A WORKAROUND
	type std_12b_array_16_type is array (0 to 23) of std_logic_vector(11 downto 0); -- TODO: CREATE PERMANET FIX, THIS IS A WORKAROUND
	
    ------------------------
	-- SIGNALS
	------------------------
	signal gearbox_counter       : integer range 0 to 23;
    signal gearbox_counter_z1    : integer range 0 to 23;
	signal data_in_10x12b_array  : std_12b_array_10_type;
	signal data_out_16x12b_array : std_12b_array_16_type;
	signal gearbox_array_low     : std_12b_array_16_type;
	signal gearbox_array_high    : std_12b_array_8_type;
	
begin

	------------------------
	-- DATA IN/OUT MAPPING
	------------------------
	generate_data_in_10x12b_i: for i in 0 to 9 generate
		data_in_10x12b_array(i) <= data_in_10x12b(i*12 + 11 downto i*12);
	end generate;
	generate_data_out_16x12b_i: for i in 0 to 15 generate
		data_out_16x12b(i*12 + 11 downto i*12) <= data_out_16x12b_array(i);
	end generate;
	
	------------------------
	-- MAIN PROCESS
	------------------------
	process_gearbox_10to16 : process (clk)
	begin
		if rising_edge(clk) then
			if reset_n = '0' then
				-- RESET ALL
				gearbox_counter       <= 0;
				gearbox_counter_z1    <= 0;
				valid                 <= '0';
				data_out_16x12b_array <= (others => (others => '0'));
				gearbox_array_low     <= (others => (others => '0'));
				gearbox_array_high    <= (others => (others => '0'));
			else
				-- GEARBOX COUNTER AND VALID SIGNAL ASSERTION
				if (gearbox_counter <= 4) then
					gearbox_counter <= gearbox_counter + 10;
					valid <= '0';
				else
					gearbox_counter <= gearbox_counter + 10 - 16;              
				end if;
				
				-- DATA OUT AND VALID ASSERTION
				if gearbox_counter_z1 >= 6 then
					for i in 0 to 15 loop
						data_out_16x12b_array(i)  <= gearbox_array_low(i);
					end loop;
					valid <= '1';
				else
					valid <= '0';
				end if;
				
				-- GEARBOX DATA IN AND SHIFTING
				for i in 0 to 23 loop
					if      i <  gearbox_counter and gearbox_counter <= 8 then
						gearbox_array_low(i) <= gearbox_array_high(i);
					elsif i >= gearbox_counter and i <= gearbox_counter + 9 then
						if i <= 15 then
							gearbox_array_low(i)       <= data_in_10x12b_array(i - gearbox_counter);
						else
							gearbox_array_high(i - 16) <= data_in_10x12b_array(i - gearbox_counter);
						end if;
					end if;
				end loop;
                
                -- DELAYED SIGNALS
				gearbox_counter_z1 <= gearbox_counter;
			end if;
		end if;
	end process;

end arc_gearbox_10to16;
