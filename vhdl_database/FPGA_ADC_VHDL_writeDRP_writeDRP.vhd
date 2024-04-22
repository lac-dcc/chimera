----------------------------------------------------------------------------------------------------
-- brief: Writes a register of the MMCM over the DRP interface
-- file: writeDRP.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
----------------------------------------------------------------------------------------------------
-- 0.1     | 31.01.2020 | L. Leuenberger     | Auto-Created
----------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Library declarations
------------------------------------------------------------------------------------------------
library ieee;
-- This package defines the basic std_logic data types and a few functions.								
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.		
use ieee.numeric_std.all;
-- This package provides functions for the calcualtion with real values.
use ieee.math_real.all;

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity writeDRP is
	port(
		-- Local interface
		addr_in       : in  std_logic_vector(6 downto 0);
		data_in       : in  std_logic_vector(15 downto 0);
		bitmask_in    : in  std_logic_vector(15 downto 0);
		start_in      : in  std_logic;
		ready_out     : out std_logic;
		reset_clk_out : out std_logic;
		-- DRP interface
		drp_den       : out std_logic;  -- Enable (required)
		drp_daddr     : out std_logic_vector(6 downto 0); -- Address (required)
		drp_di        : out std_logic_vector(15 downto 0); -- Data In (required)
		drp_do        : in  std_logic_vector(15 downto 0); --  Data out (required)
		drp_drdy      : in  std_logic;  --  (required)
		drp_dwe       : out std_logic;  --  (required)
		--  Clock
		clk           : in  std_logic
	);
end writeDRP;

------------------------------------------------------------------------------------------------
-- Architecture
------------------------------------------------------------------------------------------------
architecture behavioral of writeDRP is
	--------------------------------------------------------------------------------------------
	-- Attributes
	--------------------------------------------------------------------------------------------
	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_INFO of drp_den : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DEN";
	ATTRIBUTE X_INTERFACE_INFO of drp_daddr : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DADDR";
	ATTRIBUTE X_INTERFACE_INFO of drp_di : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DI";
	ATTRIBUTE X_INTERFACE_INFO of drp_do : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DO";
	ATTRIBUTE X_INTERFACE_INFO of drp_drdy : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DRDY";
	ATTRIBUTE X_INTERFACE_INFO of drp_dwe : SIGNAL is "xilinx.com:interface:drp:1.0 m_drp DWE";

	-------------------------------------------------------------------------------------------
	-- internal types
	--------------------------------------------------------------------------------------------
	-- Define the different states of the statemachine	
	type fsmState is (WAITFORSTART, RESETPLL, READDATA, WAITFORREAD, WRITEDATA, WAITFORWRITE);

	--------------------------------------------------------------------------------------------
	-- Internal signals
	--------------------------------------------------------------------------------------------
	signal fsmState_pres : fsmState := WAITFORSTART;
	signal fsmState_next : fsmState := WAITFORSTART;
	signal drpAddr_pres  : std_logic_vector(6 downto 0);
	signal drpAddr_next  : std_logic_vector(6 downto 0);
	signal drpDi_pres    : std_logic_vector(15 downto 0);
	signal drpDi_next    : std_logic_vector(15 downto 0);
	signal bitmask_pres  : std_logic_vector(15 downto 0);
	signal bitmask_next  : std_logic_vector(15 downto 0);

begin
	------------------------------------------------------------------------------------------------
	-- control fsm nextstatelogic process
	------------------------------------------------------------------------------------------------
	-- This process controls the next state logic of the statemachine.
	nextStateLogic : process(drp_drdy, fsmState_pres, start_in, addr_in, data_in, drpAddr_pres, drpDi_pres, bitmask_pres, drp_do, bitmask_in)
	begin
		-- Default assignements
		fsmState_next <= fsmState_pres;
		drpAddr_next  <= drpAddr_pres;
		drpDi_next    <= drpDi_pres;
		bitmask_next  <= bitmask_pres;

		-- Default ports
		drp_dwe       <= '0';
		drp_den       <= '0';
		reset_clk_out <= '1';
		ready_out     <= '0';
		drp_daddr     <= drpAddr_pres;
		drp_di        <= (bitmask_pres and drp_do) or drpDi_pres;

		-- Statemachine
		case fsmState_pres is
			-- Wait for the start of a write transaction
			when WAITFORSTART =>
				-- We are not executing a transaction
				ready_out <= '1';

				-- Enable the PLL
				reset_clk_out <= '0';

				-- Check for the start signal
				if (start_in = '1') then
					-- Save the data and adress
					drpDi_next   <= data_in;
					drpAddr_next <= addr_in;
					bitmask_next <= bitmask_in;

					-- Change the state
					fsmState_next <= RESETPLL;
				end if;

			-- Reset the PLL first
			when RESETPLL =>
				-- Change the state
				fsmState_next <= READDATA;

			-- Read the data first to create the bitmask
			when READDATA =>
				-- Set the enable signal
				drp_den <= '1';

				-- Change the state
				fsmState_next <= WAITFORREAD;

			-- Wait for the read operation to finish
			when WAITFORREAD =>
				-- Wait till the DRP signalizes that the transaction is finished
				if (drp_drdy = '1') then

					-- Change the state
					fsmState_next <= WRITEDATA;
				end if;

			-- Write data to the DRP interface
			when WRITEDATA =>
				-- Start a write transaction
				drp_dwe <= '1';
				drp_den <= '1';

				-- Change the state
				fsmState_next <= WAITFORWRITE;

			when WAITFORWRITE =>
				-- Clear the enable signals, are only allowed to be high for one clock
				drp_dwe <= '0';
				drp_den <= '0';

				-- Wait till the DRP signalizes that the transaction is finished
				if (drp_drdy = '1') then

					-- Change the state
					fsmState_next <= WAITFORSTART;
				end if;
		end case;

	end process nextStateLogic;

	------------------------------------------------------------------------------------------------
	-- control fsm stateregister process
	------------------------------------------------------------------------------------------------
	-- This process controls the stateregister of the statemachine.
	stateRegister : process(clk)
	begin
		-- Check for a rising edge
		if (rising_edge(clk)) then
			fsmState_pres <= fsmState_next;
			drpAddr_pres  <= drpAddr_next;
			drpDi_pres    <= drpDi_next;
			bitmask_pres  <= bitmask_next;
		end if;
	end process stateRegister;

end behavioral;
