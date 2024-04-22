----------------------------------------------------------------------------------
-- Company: HGST Research
-- Engineer: Zvonimir Bandic
-- 
-- Create Date:    03/30/2012
-- Design Name: 
-- Module Name:    Timer Core
-- Project Name:   
-- Target Devices:  Papilio / Spartan-3E
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.7 - first version of code written
-- Additional Comments: 
-- Customer requirements:
-- ability to process high frequency signal (approximately up to 1 MHz)
-- and integrate UP time and DOWN time of the signal
-- also ability to count how many times signal switched from 0 to 1 and from 1 to 0
-- 
-- 
--
-- License Creative Commons Attribution
-- Please give attribution to the original author and Gadget Factory (www.gadgetfactory.net)
-- This work is licensed under the Creative Commons Attribution 3.0 United States License. To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/us/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity diode_timer is
	Generic (
				--Default base location in the I/O address space for this core. 
				io_base_address_generic : STD_LOGIC_VECTOR (15 downto 0) := x"1FF0" -- _SFR_IO8(0x1FF0) / _SFR_MEM8(0x2010)
				-- trying 1FF0 as starting address for io_base to avoid potential other conflicts with SPI 
				-- adjusted constant const_ram_to_io_c in pm_fetch_dec.vhd accordingly -Z.
				
	);  
	Port ( 
			-- begin Signals required by AVR8 for this core, do not modify.
			nReset 		: in  STD_LOGIC;
			clk 			: in  STD_LOGIC;
			adr 			: in  STD_LOGIC_VECTOR (15 downto 0);
			dbus_in 		: in  STD_LOGIC_VECTOR (7 downto 0);
			dbus_out 	: out  STD_LOGIC_VECTOR (7 downto 0);
			iore 			: in  STD_LOGIC;
			iowe 			: in  STD_LOGIC;
			out_en		: out STD_LOGIC;
			-- end Signals required by AVR8 for this core, do not modify.

			--Define signals that you want to go in or out of the peripheral. These are usually going to be connected to external pins of the Papilio board.
			--Two Output Signals
			output_sig	: out std_logic_vector (1 downto 0); --we can use more bits than 2, or whole 7 downto 0, but then
			-- need to appropriately change as well, in the instantiation of the core in the main module
			--search for Example Core - core9 in Papilio_AVR8.vhd
			
			--Two Input Signals and one diode signal which is being processed (three input signals total)
			-- input_sig(0) is used as ENABLE signal, and input_sig(1) is used to reset counters/tickers
			
			input_sig		: in std_logic_vector (1 downto 0); 
			--diode Signal
			diode_sig		: in STD_LOGIC
	);
end diode_timer;

architecture Behavioral of diode_timer is

--Define the registers and signals that will be used inside the Core.
	
	--Control Register is used to control the output signals. Default Value is all zeroes.
		signal control_reg	: std_logic_vector(7 downto 0):= "00000000";
		constant control_addr 	: std_logic_vector(15 downto 0):= io_base_address_generic;
	
	--Status Register is used to read the input signals. Default Value is all zeroes.
		signal status_reg	: std_logic_vector(7 downto 0):= "00000000";
		constant status_addr 	: 		std_logic_vector(15 downto 0):= io_base_address_generic + 1;
		
		signal control_Sel, status_Sel : std_logic;
	
	--Counter register is used to count the diode signal on time. Default is all zeroes.	
		signal counter_up_reg	: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
		constant counter_up_addr_7:	std_logic_vector(15 downto 0):=io_base_address_generic + 2;
		constant counter_up_addr_6:	std_logic_vector(15 downto 0):=io_base_address_generic + 3;
		constant counter_up_addr_5:	std_logic_vector(15 downto 0):=io_base_address_generic + 4;
		constant counter_up_addr_4:	std_logic_vector(15 downto 0):=io_base_address_generic + 5;
		constant counter_up_addr_3:	std_logic_vector(15 downto 0):=io_base_address_generic + 6;
		constant counter_up_addr_2:	std_logic_vector(15 downto 0):=io_base_address_generic + 7;
		constant counter_up_addr_1:	std_logic_vector(15 downto 0):=io_base_address_generic + 8;
		constant counter_up_addr_0:	std_logic_vector(15 downto 0):=io_base_address_generic + 9;
		
		signal counter_down_reg	: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
		constant counter_down_addr_7:	std_logic_vector(15 downto 0):=io_base_address_generic + 10;
		constant counter_down_addr_6:	std_logic_vector(15 downto 0):=io_base_address_generic + 11;
		constant counter_down_addr_5:	std_logic_vector(15 downto 0):=io_base_address_generic + 12;
		constant counter_down_addr_4:	std_logic_vector(15 downto 0):=io_base_address_generic + 13;
		constant counter_down_addr_3:	std_logic_vector(15 downto 0):=io_base_address_generic + 14;
		constant counter_down_addr_2:	std_logic_vector(15 downto 0):=io_base_address_generic + 15;
		constant counter_down_addr_1:	std_logic_vector(15 downto 0):=io_base_address_generic + 16;
		constant counter_down_addr_0:	std_logic_vector(15 downto 0):=io_base_address_generic + 17;
		
--Ticker registers are used to count the diode signal uptick or downtick. Default is all zeroes.	
		signal ticker_up_reg	: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
		constant ticker_up_addr_7:		std_logic_vector(15 downto 0):=io_base_address_generic + 18;
		constant ticker_up_addr_6:		std_logic_vector(15 downto 0):=io_base_address_generic + 19;
		constant ticker_up_addr_5:		std_logic_vector(15 downto 0):=io_base_address_generic + 20;
		constant ticker_up_addr_4:		std_logic_vector(15 downto 0):=io_base_address_generic + 21;
		constant ticker_up_addr_3:		std_logic_vector(15 downto 0):=io_base_address_generic + 22;
		constant ticker_up_addr_2:		std_logic_vector(15 downto 0):=io_base_address_generic + 23;
		constant ticker_up_addr_1:		std_logic_vector(15 downto 0):=io_base_address_generic + 24;
		constant ticker_up_addr_0:		std_logic_vector(15 downto 0):=io_base_address_generic + 25;
		
		signal ticker_down_reg	: std_logic_vector(63 downto 0):="0000000000000000000000000000000000000000000000000000000000000000";
		constant ticker_down_addr_7:	std_logic_vector(15 downto 0):=io_base_address_generic + 26;
		constant ticker_down_addr_6:	std_logic_vector(15 downto 0):=io_base_address_generic + 27;
		constant ticker_down_addr_5:	std_logic_vector(15 downto 0):=io_base_address_generic + 28;
		constant ticker_down_addr_4:	std_logic_vector(15 downto 0):=io_base_address_generic + 29;
		constant ticker_down_addr_3:	std_logic_vector(15 downto 0):=io_base_address_generic + 30;
		constant ticker_down_addr_2:	std_logic_vector(15 downto 0):=io_base_address_generic + 31;
		constant ticker_down_addr_1:	std_logic_vector(15 downto 0):=io_base_address_generic + 32;
		constant ticker_down_addr_0:	std_logic_vector(15 downto 0):=io_base_address_generic + 33;
		
		signal counter_up_Sel_7		: std_logic; --if counter address is selected
		signal counter_up_Sel_6		: std_logic; --if counter address is selected
		signal counter_up_Sel_5		: std_logic; --if counter address is selected
		signal counter_up_Sel_4		: std_logic; --if counter address is selected
		signal counter_up_Sel_3		: std_logic; --if counter address is selected
		signal counter_up_Sel_2		: std_logic; --if counter address is selected
		signal counter_up_Sel_1		: std_logic; --if counter address is selected
		signal counter_up_Sel_0		: std_logic; --if counter address is selected
		
		signal counter_down_Sel_7		: std_logic; --if counter address is selected
		signal counter_down_Sel_6		: std_logic; --if counter address is selected
		signal counter_down_Sel_5		: std_logic; --if counter address is selected
		signal counter_down_Sel_4		: std_logic; --if counter address is selected
		signal counter_down_Sel_3		: std_logic; --if counter address is selected
		signal counter_down_Sel_2		: std_logic; --if counter address is selected
		signal counter_down_Sel_1		: std_logic; --if counter address is selected
		signal counter_down_Sel_0		: std_logic; --if counter address is selected
		
		signal ticker_up_Sel_7		: std_logic; --if ticker address is selected
		signal ticker_up_Sel_6		: std_logic; --if ticker address is selected
		signal ticker_up_Sel_5		: std_logic; --if ticker address is selected
		signal ticker_up_Sel_4		: std_logic; --if ticker address is selected
		signal ticker_up_Sel_3		: std_logic; --if ticker address is selected
		signal ticker_up_Sel_2		: std_logic; --if ticker address is selected
		signal ticker_up_Sel_1		: std_logic; --if ticker address is selected
		signal ticker_up_Sel_0		: std_logic; --if ticker address is selected
		
		signal ticker_down_Sel_7		: std_logic; --if ticker address is selected
		signal ticker_down_Sel_6		: std_logic; --if ticker address is selected
		signal ticker_down_Sel_5		: std_logic; --if ticker address is selected
		signal ticker_down_Sel_4		: std_logic; --if ticker address is selected
		signal ticker_down_Sel_3		: std_logic; --if ticker address is selected
		signal ticker_down_Sel_2		: std_logic; --if ticker address is selected
		signal ticker_down_Sel_1		: std_logic; --if ticker address is selected
		signal ticker_down_Sel_0		: std_logic; --if ticker address is selected
		
		signal delay_reg					: std_logic; -- delay register for diode signal
		signal ticker_up					: std_logic; -- ticker signal goes to 1 when edge up is detected
		signal ticker_down				: std_logic; -- ticker signal that goes to 1 when edge down is detected
		
		
	-- 64 bit counter and ticker registers are mapped into io address space
	-- counter_up_i and counter_down_j signal when appropriate address is selectted on the address bus
	-- ticker_up_i and ticker_down_j signal when appropriate address is selectted on the address bus
	-- and ensure correct value is returned to the data bus

begin
	--Create a signal that is asserted when the address for our defined registers is selected.
	control_Sel  <= '1' when adr=control_addr else '0';	
	status_Sel  <= '1' when adr=status_addr else '0';
	-- The counter_up and _down signals are asserted when the corresp. counter addresses are selected
	counter_up_Sel_7 <= '1' when (adr=counter_up_addr_7) else '0';
	counter_up_Sel_6 <= '1' when (adr=counter_up_addr_6) else '0';
	counter_up_Sel_5 <= '1' when (adr=counter_up_addr_5) else '0';
	counter_up_Sel_4 <= '1' when (adr=counter_up_addr_4) else '0';
	counter_up_Sel_3 <= '1' when (adr=counter_up_addr_3) else '0';
	counter_up_Sel_2 <= '1' when (adr=counter_up_addr_2) else '0';
	counter_up_Sel_1 <= '1' when (adr=counter_up_addr_1) else '0';
	counter_up_Sel_0 <= '1' when (adr=counter_up_addr_0) else '0';

	counter_down_Sel_7 <= '1' when (adr=counter_down_addr_7) else '0';
	counter_down_Sel_6 <= '1' when (adr=counter_down_addr_6) else '0';
	counter_down_Sel_5 <= '1' when (adr=counter_down_addr_5) else '0';
	counter_down_Sel_4 <= '1' when (adr=counter_down_addr_4) else '0';
	counter_down_Sel_3 <= '1' when (adr=counter_down_addr_3) else '0';
	counter_down_Sel_2 <= '1' when (adr=counter_down_addr_2) else '0';
	counter_down_Sel_1 <= '1' when (adr=counter_down_addr_1) else '0';
	counter_down_Sel_0 <= '1' when (adr=counter_down_addr_0) else '0';
	
-- The ticker_up and _down signals are asserted when the corresp. ticker addresses are selected
	ticker_up_Sel_7 <= '1' when (adr=ticker_up_addr_7) else '0';
	ticker_up_Sel_6 <= '1' when (adr=ticker_up_addr_6) else '0';
	ticker_up_Sel_5 <= '1' when (adr=ticker_up_addr_5) else '0';
	ticker_up_Sel_4 <= '1' when (adr=ticker_up_addr_4) else '0';
	ticker_up_Sel_3 <= '1' when (adr=ticker_up_addr_3) else '0';
	ticker_up_Sel_2 <= '1' when (adr=ticker_up_addr_2) else '0';
	ticker_up_Sel_1 <= '1' when (adr=ticker_up_addr_1) else '0';
	ticker_up_Sel_0 <= '1' when (adr=ticker_up_addr_0) else '0';

	ticker_down_Sel_7 <= '1' when (adr=ticker_down_addr_7) else '0';
	ticker_down_Sel_6 <= '1' when (adr=ticker_down_addr_6) else '0';
	ticker_down_Sel_5 <= '1' when (adr=ticker_down_addr_5) else '0';
	ticker_down_Sel_4 <= '1' when (adr=ticker_down_addr_4) else '0';
	ticker_down_Sel_3 <= '1' when (adr=ticker_down_addr_3) else '0';
	ticker_down_Sel_2 <= '1' when (adr=ticker_down_addr_2) else '0';
	ticker_down_Sel_1 <= '1' when (adr=ticker_down_addr_1) else '0';
	ticker_down_Sel_0 <= '1' when (adr=ticker_down_addr_0) else '0';
	
	--Connect the registers to the output bus for reading when their address is selected.
	dbus_out <= control_reg when control_Sel='1' else "ZZZZZZZZ";
	dbus_out <= status_reg when status_Sel='1' else "ZZZZZZZZ";
	
	-- when counter_up_Sel or counter_down_Sel are '1', the counter register values are sent to the data bus
	dbus_out <= counter_up_reg(63 downto 56) when counter_up_Sel_7='1' else "ZZZZZZZZ";
	dbus_out <= counter_up_reg(55 downto 48) when counter_up_Sel_6='1' else "ZZZZZZZZ";
	dbus_out <= counter_up_reg(47 downto 40) when counter_up_Sel_5='1' else "ZZZZZZZZ";
	dbus_out <= counter_up_reg(39 downto 32) when counter_up_Sel_4='1' else "ZZZZZZZZ";
	dbus_out <= counter_up_reg(31 downto 24) when counter_up_Sel_3='1' else "ZZZZZZZZ";
	dbus_out <= counter_up_reg(23 downto 16) when counter_up_Sel_2='1' else "ZZZZZZZZ";
	dbus_out <= counter_up_reg(15 downto 8)  when counter_up_Sel_1='1' else "ZZZZZZZZ";
	dbus_out <= counter_up_reg(7  downto 0)  when counter_up_Sel_0='1' else "ZZZZZZZZ";
	
	dbus_out <= counter_down_reg(63 downto 56) when counter_down_Sel_7='1' else "ZZZZZZZZ";
	dbus_out <= counter_down_reg(55 downto 48) when counter_down_Sel_6='1' else "ZZZZZZZZ";
	dbus_out <= counter_down_reg(47 downto 40) when counter_down_Sel_5='1' else "ZZZZZZZZ";
	dbus_out <= counter_down_reg(39 downto 32) when counter_down_Sel_4='1' else "ZZZZZZZZ";
	dbus_out <= counter_down_reg(31 downto 24) when counter_down_Sel_3='1' else "ZZZZZZZZ";
	dbus_out <= counter_down_reg(23 downto 16) when counter_down_Sel_2='1' else "ZZZZZZZZ";
	dbus_out <= counter_down_reg(15 downto 8)  when counter_down_Sel_1='1' else "ZZZZZZZZ";
	dbus_out <= counter_down_reg(7  downto 0)  when counter_down_Sel_0='1' else "ZZZZZZZZ";
	
-- when ticker_up_Sel or ticker_down_Sel are '1', the ticker register values are sent to the data bus
	dbus_out <= ticker_up_reg(63 downto 56) when ticker_up_Sel_7='1' else "ZZZZZZZZ";
	dbus_out <= ticker_up_reg(55 downto 48) when ticker_up_Sel_6='1' else "ZZZZZZZZ";
	dbus_out <= ticker_up_reg(47 downto 40) when ticker_up_Sel_5='1' else "ZZZZZZZZ";
	dbus_out <= ticker_up_reg(39 downto 32) when ticker_up_Sel_4='1' else "ZZZZZZZZ";
	dbus_out <= ticker_up_reg(31 downto 24) when ticker_up_Sel_3='1' else "ZZZZZZZZ";
	dbus_out <= ticker_up_reg(23 downto 16) when ticker_up_Sel_2='1' else "ZZZZZZZZ";
	dbus_out <= ticker_up_reg(15 downto 8)  when ticker_up_Sel_1='1' else "ZZZZZZZZ";
	dbus_out <= ticker_up_reg(7  downto 0)  when ticker_up_Sel_0='1' else "ZZZZZZZZ";
	
	dbus_out <= ticker_down_reg(63 downto 56) when ticker_down_Sel_7='1' else "ZZZZZZZZ";
	dbus_out <= ticker_down_reg(55 downto 48) when ticker_down_Sel_6='1' else "ZZZZZZZZ";
	dbus_out <= ticker_down_reg(47 downto 40) when ticker_down_Sel_5='1' else "ZZZZZZZZ";
	dbus_out <= ticker_down_reg(39 downto 32) when ticker_down_Sel_4='1' else "ZZZZZZZZ";
	dbus_out <= ticker_down_reg(31 downto 24) when ticker_down_Sel_3='1' else "ZZZZZZZZ";
	dbus_out <= ticker_down_reg(23 downto 16) when ticker_down_Sel_2='1' else "ZZZZZZZZ";
	dbus_out <= ticker_down_reg(15 downto 8)  when ticker_down_Sel_1='1' else "ZZZZZZZZ";
	dbus_out <= ticker_down_reg(7  downto 0)  when ticker_down_Sel_0='1' else "ZZZZZZZZ";	
	
	
	--Lets the I/O multiplexer know when to connect the output bus from this core to the AVR8 for reading.
	out_en <= '1' 	when ((adr=control_addr 
							or adr=status_addr 
							or adr=counter_up_addr_7 
							or adr=counter_up_addr_6 
							or adr=counter_up_addr_5 
							or adr=counter_up_addr_4
							or adr=counter_up_addr_3 
							or adr=counter_up_addr_2 
							or adr=counter_up_addr_1 
							or adr=counter_up_addr_0
							or adr=counter_down_addr_7 
							or adr=counter_down_addr_6 
							or adr=counter_down_addr_5 
							or adr=counter_down_addr_4
							or adr=counter_down_addr_3 
							or adr=counter_down_addr_2 
							or adr=counter_down_addr_1 
							or adr=counter_down_addr_0
							or adr=ticker_up_addr_7 
							or adr=ticker_up_addr_6 
							or adr=ticker_up_addr_5 
							or adr=ticker_up_addr_4
							or adr=ticker_up_addr_3 
							or adr=ticker_up_addr_2 
							or adr=ticker_up_addr_1 
							or adr=ticker_up_addr_0
							or adr=ticker_down_addr_7 
							or adr=ticker_down_addr_6 
							or adr=ticker_down_addr_5 
							or adr=ticker_down_addr_4
							or adr=ticker_down_addr_3 
							or adr=ticker_down_addr_2 
							or adr=ticker_down_addr_1 
							or adr=ticker_down_addr_0) 
							and iore = '1') 
						else '0';
	
	
	-- All non combinational logic is contained in a process that is synchronized to a common clock.
	Registers:process(clk, nreset)
	begin
		if (nReset = '0' or input_sig(1)='1') then
			-- If there is a reset then set the registers to zero.
			control_reg <= (others => '0');
			status_reg <= (others => '0');
			counter_up_reg <=(others =>'0');
			counter_down_reg <=(others =>'0');
			ticker_up_reg <=(others =>'0');
			ticker_down_reg <=(others =>'0');
			delay_reg <='0';
			
		elsif (clk='1' and clk'event and input_sig(0)='1') then -- add and input_sig(0) here and use it as CountEnable

			--Placing these statements within a clocked process tells the synthesis tools that we want status and control to be data registers (with memory) instead of just signals (combinational).
			--We are making a register that permanently stores the data on the input and output pins.
			status_reg(1 downto 0) <= input_sig; 
			output_sig <= control_reg(1 downto 0);
			
			delay_reg <= diode_sig; -- this is D FF that remembers previous state of diode_sig!
			

			-- Write registers when the io_base_address is selected.
			
			if diode_sig='1' then
				counter_up_reg <= (counter_up_reg+"0000000000000000000000000000000000000000000000000000000000000001");
			end if;
				
			if diode_sig='0' then
				counter_down_reg <= (counter_down_reg+"0000000000000000000000000000000000000000000000000000000000000001");	
		   end if;
			
			
			if (ticker_up='1') then
				ticker_up_reg <= (ticker_up_reg+"0000000000000000000000000000000000000000000000000000000000000001");
			end if;
				
			if (ticker_down='1') then
				ticker_down_reg <= (ticker_down_reg+"0000000000000000000000000000000000000000000000000000000000000001");	
		   end if;
		
		
		
		
			if (iowe = '1') then
				case (adr) is
					when control_addr =>
						--Write to the Control register
						control_reg <= dbus_in;
												
					when counter_up_addr_7 =>
						counter_up_reg(63 downto 56) <=dbus_in;
					when counter_up_addr_6 =>
						counter_up_reg(55 downto 48) <=dbus_in;	
					when counter_up_addr_5 =>
						counter_up_reg(47 downto 40) <=dbus_in;
					when counter_up_addr_4 =>
						counter_up_reg(39 downto 32) <=dbus_in;
					when counter_up_addr_3 =>
						counter_up_reg(31 downto 24) <=dbus_in;							
					when counter_up_addr_2 =>
						counter_up_reg(23 downto 16) <=dbus_in;
					when counter_up_addr_1 =>
						counter_up_reg(15 downto 8)  <=dbus_in;
					when counter_up_addr_0 =>
						counter_up_reg(7 downto 0)   <=dbus_in;
						
					when counter_down_addr_7 =>
						counter_down_reg(63 downto 56) <=dbus_in;
					when counter_down_addr_6 =>
						counter_down_reg(55 downto 48) <=dbus_in;	
					when counter_down_addr_5 =>
						counter_down_reg(47 downto 40) <=dbus_in;
					when counter_down_addr_4 =>
						counter_down_reg(39 downto 32) <=dbus_in;
					when counter_down_addr_3 =>
						counter_down_reg(31 downto 24) <=dbus_in;							
					when counter_down_addr_2 =>
						counter_down_reg(23 downto 16) <=dbus_in;
					when counter_down_addr_1 =>
						counter_down_reg(15 downto 8)  <=dbus_in;
					when counter_down_addr_0 =>
						counter_down_reg(7 downto 0)   <=dbus_in;			

					
					when ticker_up_addr_7 =>
						ticker_up_reg(63 downto 56) <=dbus_in;
					when ticker_up_addr_6 =>
						ticker_up_reg(55 downto 48) <=dbus_in;	
					when ticker_up_addr_5 =>
						ticker_up_reg(47 downto 40) <=dbus_in;
					when ticker_up_addr_4 =>
						ticker_up_reg(39 downto 32) <=dbus_in;
					when ticker_up_addr_3 =>
						ticker_up_reg(31 downto 24) <=dbus_in;							
					when ticker_up_addr_2 =>
						ticker_up_reg(23 downto 16) <=dbus_in;
					when ticker_up_addr_1 =>
						ticker_up_reg(15 downto 8)  <=dbus_in;
					when ticker_up_addr_0 =>
						ticker_up_reg(7 downto 0)   <=dbus_in;
						
					when ticker_down_addr_7 =>
						ticker_down_reg(63 downto 56) <=dbus_in;
					when ticker_down_addr_6 =>
						ticker_down_reg(55 downto 48) <=dbus_in;	
					when ticker_down_addr_5 =>
						ticker_down_reg(47 downto 40) <=dbus_in;
					when ticker_down_addr_4 =>
						ticker_down_reg(39 downto 32) <=dbus_in;
					when ticker_down_addr_3 =>
						ticker_down_reg(31 downto 24) <=dbus_in;							
					when ticker_down_addr_2 =>
						ticker_down_reg(23 downto 16) <=dbus_in;
					when ticker_down_addr_1 =>
						ticker_down_reg(15 downto 8)  <=dbus_in;
					when ticker_down_addr_0 =>
						ticker_down_reg(7 downto 0)   <=dbus_in;							
						
					when status_addr =>
						--Nothing to be done for status register since it cannot be written.

					when others =>
				end case;	
			end if;
		end if;
	end process;
	
	-- decoding logic for ticker up and down signals
	ticker_up <= ((not delay_reg) and diode_sig);
	ticker_down <= ((delay_reg) and (not diode_sig));
	
	
	
end Behavioral;

