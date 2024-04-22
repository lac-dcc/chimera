----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:24:50 11/19/2013 
-- Design Name: 
-- Module Name:    blockRamArbiter - Behavioral 
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

--note this line.The package is compiled to this directory by default.
--so don't forget to include this directory. 
library work;
--this line also is must.This includes the particular package into your program.
use work.commonPak.all;

entity blockRamArbiter is
	generic(
		numPorts: integer := 2
	);
	port(
		clk: in std_logic;
		reset: in std_logic;
		inPortArray: in type_inArbiterPortArray(0 to numPorts-1); -- Give us the address and whether you request it now
		outPortArray: out type_outArbiterPortArray(0 to numPorts-1) := (others => init_type_outArbiterPort) -- We give you data in this array
	);
end blockRamArbiter;

architecture Behavioral of blockRamArbiter is
	-- Holds the address we intend to use/used
	signal addrReg: std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');
	-- Holds the most recent data we just got
	signal dataOutReg: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	
	signal writeEnableReg: std_logic := '0';
	signal dataInReg: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	
begin

	-- This is the basically the database
	-- Accessed by address
	blockRam: entity work.fontROM
	port map(
		clkA => clk,
		writeEnableA => writeEnableReg,
		addrA => addrReg,
		dataOutA => dataOutReg,
		dataInA => dataInReg
	);
	
	arbiter: process(clk)
		-- Stores the current index as we roll through `inPortArray` and store the data in `outPortArray`
		variable currPortIndex: integer range 0 to numPorts-1 := 0;
		variable nextPortIndex: integer := -1;
		
		type type_arbiterLoopState is (state_updateRomAddr, state_waitForRomData, state_presentData, state_getNextPort);
		variable currState: type_arbiterLoopState := state_updateRomAddr;
	begin
		if rising_edge(clk) then
			
			if reset = '1' then
				-- Reset the array
				outPortArray <= (others => init_type_outArbiterPort);
				
				currPortIndex := 0;
				nextPortIndex := -1;
				
				
				addrReg <= (others => '0');
				writeEnableReg <= '0';
				dataInReg <= (others => '0');
				
				-- Reset State
				currState := state_updateRomAddr;
			else
			
				
				case currState is
					when state_updateRomAddr =>
						
						-- Start the read request
						------------------------------
						if inPortArray(currPortIndex).dataRequest then
							-- If they are making a new request then we have no data waiting yet
							outPortArray(currPortIndex).dataWaiting <= false;
						
							-- Change the address so that on the next cycle,
							-- we have some corresponding data in `dataOutReg`
							addrReg <= inPortArray(currPortIndex).addr;
							
							-- Change State
							currState := state_waitForRomData;
							
						end if;
						
						-- Start the write request
						-----------------------------
						if inPortArray(currPortIndex).writeRequest then
							addrReg <= inPortArray(currPortIndex).addr;
							
							dataInReg <= inPortArray(currPortIndex).writeData; -- Put the data in the ram register
							writeEnableReg <= '1'; -- Tell the ram we are ready
							
							outPortArray(currPortIndex).dataWritten <= false; -- Tell the outside, that we haven't wrote it yet
						
							-- Change State
							currState := state_waitForRomData;
						end if;
						
						-- If we are not doing anything, 
						-- then we should go find another port
						if not inPortArray(currPortIndex).dataRequest and not inPortArray(currPortIndex).writeRequest then
							-- If the current port doesn't want data, find one, that does
							-- Change State
							currState := state_getNextPort;
						end if;
						
						
					-- Wait for the data to be ready
					-- This could be read, write, or both
					when state_waitForRomData =>
						if inPortArray(currPortIndex).dataRequest or inPortArray(currPortIndex).writeRequest then
							-- Change State
							currState := state_presentData;
						else
							-- If the current port doesn't want data, find one, that does
							-- Change State
							currState := state_getNextPort;
						end if;
					
					-- Put the data in the array for use
					when state_presentData =>
				
						-- If they want the data, then give it
						if inPortArray(currPortIndex).dataRequest then
							outPortArray(currPortIndex).data <= dataOutReg;
							outPortArray(currPortIndex).dataWaiting <= true;
							
						-- If they don't want the data, we have no data waiting
						else
							outPortArray(currPortIndex).dataWaiting <= false;
						end if;
						
						-- We wrote to the ram, so tell them
						if inPortArray(currPortIndex).writeRequest then
							dataInReg <= (others => '0'); 
							writeEnableReg <= '0';
							
							outPortArray(currPortIndex).dataWritten <= true; -- Tell the outside, we wrote it!
						end if;
						
						
						-- We go to find a new port no matter what...
						-- Change State
						currState := state_getNextPort;
						
					when state_getNextPort =>
						-- Roll to the next port
						--------------------------
						
						-- Move to the next port that has a request
						nextPortIndex := -1;
						for i in 0 to inPortArray'length-1 loop
							if i > currPortIndex and (inPortArray(i).dataRequest or inPortArray(i).writeRequest) then
								nextPortIndex := i;
								exit;
							else
								outPortArray(i).dataWaiting <= false;
								outPortArray(i).dataWritten <= false;
							end if;
						end loop;
						-- If we didn't find the next port from the loop above
						-- Then start at the beginning and go to the where we are
						if nextPortIndex <= 0 then
							for i in 0 to inPortArray'length-1 loop
								if i <= currPortIndex then
									if inPortArray(i).dataRequest or inPortArray(i).writeRequest then
										nextPortIndex := i;
										exit;
									else
										outPortArray(i).dataWaiting <= false;
										outPortArray(i).dataWritten <= false;
									end if;
								else
									exit;
								end if;
							end loop;
						end if;
						
						-- Change State
						-- We are stuck here until we find
						if nextPortIndex >= 0 then
							currPortIndex := nextPortIndex;
							currState := state_updateRomAddr;
						end if;
						
				end case;
				
			end if;
		end if;
	
	end process;
	
	

end Behavioral;

