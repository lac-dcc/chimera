----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:33 04/19/2014 
-- Design Name: 
-- Module Name:    Memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 1.0 Buffering added to better represent interface to external memory so I can make the switch. 7/25/2014
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memory_Alternate is
    Port ( clk : in  STD_LOGIC;
	   reset : in STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (11 downto 0);
           write_data : in  STD_LOGIC_VECTOR (11 downto 0);
           read_data : out  STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
           write_enable : in  STD_LOGIC; -- start write memory cycle, address and write data are valid
           read_enable : in  STD_LOGIC; -- start read cycle, address is valid
           mem_finished : out  STD_LOGIC -- memory cycle is done OK to latch read data
-- Note that read_enable and write_enable may be asserted over many clock cycles but must
-- be released when mem_finished occurs. The address and write data are latched on the first
-- active clock edge when the enable is asserted. 
-- Mem_finished only lasts through one active clock edge.
-- 
-- The registering slows things way down (adds two clock periods to the access time) however
-- this change will make going to an external RAM much simpler.
			  );
end Memory_Alternate;

architecture Behavioral of Memory_Alternate is
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT coreram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------
------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT corerom
  PORT (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

signal wea : std_logic_vector (0 downto 0);
type STATES is (SRESET, SCOPY1, SCOPY2, S0, S1, S1A, S2, S3, S3A);
signal curr_state : STATES := SRESET;
signal next_state : STATES;
signal addr_buf, wdata_buf : std_logic_vector (11 downto 0) := (others => '0');
signal rdata_buf : std_logic_vector (11 downto 0);
signal load_rdata : std_logic;
signal addra, douta : std_logic_vector(11 downto 0); -- ROM interface
signal copying : std_logic := '0';
signal start_copying, end_copying : std_logic;
signal mem_addr, mem_wdata : std_logic_vector (11 downto 0);
signal counter : std_logic_vector (11 downto 0) := (others => '0');
signal inc_counter, count7777 : std_logic;
begin

process (clk) begin -- copying switch
	if rising_edge(clk) then
		if start_copying = '1' or reset = '1' then
			copying <= '1';
		elsif end_copying = '1' then
			copying <= '0';
		end if;
	end if;
end process;

-- Multiplexers to RAM inputs
mem_addr <= counter when copying = '1' else addr_buf;
mem_wdata <= douta when copying = '1' else wdata_buf;

addra <= counter; -- always connected

-- address counter
process (clk) begin
	if rising_edge(clk) then
		if reset = '1' then
			counter <= (others => '0');
		elsif inc_counter = '1' then
			counter <= counter + 1;
		end if;
	end if;
end process;

count7777 <= '1' when counter = "111111111111" else '0';

process (clk) begin -- current state register
	if rising_edge(clk) then
		if reset = '1' then
			curr_state <= SRESET;
		else
			curr_state <= next_state;
		end if;
	end if;
end process;

process (clk) begin -- address and write data buffers
	if rising_edge(clk) then
		if (read_enable = '1' or write_enable = '1') and curr_state = S0 then
			addr_buf <= address;
			wdata_buf <= write_data;
		end if;
	end if;
end process;

process (clk) begin -- read data buffer
	if rising_edge(clk) then
		if load_rdata = '1' then
			read_data <= rdata_buf;
		end if;
	end if;
end process;

process (read_enable, write_enable, curr_state, count7777) begin -- state machine combinatorial logic
	next_state <= curr_state; -- set defaults
	wea <= "0";
	mem_finished <= '0';
	load_rdata <= '0';
	start_copying <= '0';
	end_copying <= '0';
	inc_counter <= '0';
	case curr_state is
		when SRESET => start_copying <= '1'; next_state <= SCOPY1; -- read of ROM starts here
		when SCOPY1 => wea <= "1"; -- write the data (must be available)
							next_state <= SCOPY2;
		when SCOPY2 => -- write is finished
							inc_counter <= '1';
							if count7777 = '1' then next_state <= S0;
							else next_state <= SRESET; 
							end if;
		when S0 =>
					end_copying <= '1';
					if read_enable = '1' then next_state <= S1; -- start read cycle
					elsif write_enable = '1' then next_state <= S3;
					end if;
		when S1 => next_state <= S1A; -- delay for operation
		when S1A => load_rdata <= '1'; next_state <= S2;
		when S2 => mem_finished <= '1'; next_state <= S0;
		when S3 => wea <= "1"; next_state <= S3A;
		when S3A => mem_finished <= '1'; next_state <= S0;
		when others => next_state <= S0;
	end case;
end process;

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : coreram
  PORT MAP (
    clka => clk,
    wea => wea,
    addra => mem_addr,
    dina => mem_wdata,
    douta => rdata_buf
  );
-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name2 : corerom
  PORT MAP (
    clka => clk,
    addra => addra,
    douta => douta
  );
-- INST_TAG_END ------ End INSTANTIATION Template ------------


end Behavioral;

