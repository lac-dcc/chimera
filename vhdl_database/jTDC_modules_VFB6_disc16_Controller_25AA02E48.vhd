-------------------------------------------------------------------------
----                                                                 ----
---- Company : ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)                                  ----
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 ELB                                          ----
----                                                                 ----
---- This program is free software; you can redistribute it and/or   ----
---- modify it under the terms of the GNU General Public License as  ----
---- published by the Free Software Foundation; either version 3 of  ----
---- the License, or (at your option) any later version.             ----
----                                                                 ----
---- This program is distributed in the hope that it will be useful, ----
---- but WITHOUT ANY WARRANTY; without even the implied warranty of  ----
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the    ----
---- GNU General Public License for more details.                    ----
----                                                                 ----
---- You should have received a copy of the GNU General Public       ----
---- License along with this program; if not, see                    ----
---- <http://www.gnu.org/licenses>.                                  ----
----                                                                 ----
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controller_25AA02E48 is
    Port ( CLK : in  STD_LOGIC;
           CLKDivH,CLKDivL  : in  std_logic_vector(3 downto 0);
           ReadID : in  STD_LOGIC;
           ID : out  STD_LOGIC_VECTOR (47 downto 0);
           SCLK, CS, MOSI : out  STD_LOGIC;
           MISO : in  STD_LOGIC);
end Controller_25AA02E48;

architecture Behavioral of Controller_25AA02E48 is
--Signal BusyRegister : STD_LOGIC :='0';

--Signal DataRegister : STD_LOGIC_VECTOR (11 downto 0) :=(others=>'0');
--signal AddressRegister : STD_LOGIC_VECTOR (4 downto 0) :=(others=>'0');
Signal TransferRegister : STD_LOGIC_VECTOR (6 downto 0) :=(others=>'0'); -- Data and Address to be transfered. Only 15 bit because MSB is applied immidately at WE='1'
Signal ReadRegister : STD_LOGIC_VECTOR(7 downto 0):=X"EE";


Signal SCLKRegister, MOSIRegister : STD_LOGIC :='0'; -- DAC draws less current if pins are low -> when idle pull low.
Signal CSRegister : STD_LOGIC :='0'; -- Chip select high when idle, low for initial read cycle

Signal ClockDivCounter,Final_counter : unsigned (3 downto 0):=to_unsigned(0,4);-- How many CLK-Cycles has already been waited (update SCLK, when counter reached value set in interface), second: counter to release CS
Signal BitCounter : unsigned (4 downto 0):=to_unsigned(0,5);  -- How many bits have been transfered?

Signal NCRESCLK : STD_LOGIC; -- Next Clockcycle has Rising Edge on SCLK
Signal NCFESCLK : STD_LOGIC; -- Next Clockcycle has Falling Edge on SCLK


	type   controller_states is (waiting,           -- idle state, accept command
										  write_instruction_byte, -- write command to chip
										  write_address,         -- write read address
										  read1,						-- read three bytes
										  read2,
										  read3,
										  read4,
										  read5,
										  read6,
										  final_wait_to_CS
										  );
										  
	signal cont_state    : controller_states := write_instruction_byte;

Signal ByteToSend : STD_LOGIC_VECTOR (7 downto 0) :=X"03";
Signal ReceivedID : STD_LOGIC_VECTOR (47 downto 0):=X"DEADDEADBEEF";

Signal WE: STD_LOGIC:='1';
Signal BusyRegister : STD_LOGIC:='0';

begin

SCLK<=SCLKRegister;
MOSI<=MOSIRegister;
CS<=CSRegister;
--Busy<=BusyRegister;
ID<=ReceivedID;


GenerateSCLK : Process (CLK) is
begin
	if rising_edge(CLK) then
		if BusyRegister='0' then -- reset case
			ClockDivCounter<=to_unsigned(0,4);
			SCLKRegister<='0';
		else
			ClockDivCounter<=ClockDivCounter+1;
			if SCLKRegister='1' then
				if CLKDivH = STD_LOGIC_VECTOR (ClockDivCounter) then
					SCLKRegister<='0';
					ClockDivCounter<=to_unsigned(0,4);
				end if;
			else 
				if CLKDivL = STD_LOGIC_VECTOR (ClockDivCounter) then
					SCLKRegister<='1';
					ClockDivCounter<=to_unsigned(0,4);
				end if;
			end if;
		end if;
	end if;
end process;

Process (CLKDivL, ClockDivCounter, SCLKRegister) is begin
	if CLKDivL = STD_LOGIC_VECTOR (ClockDivCounter) AND SCLKRegister ='0' then
		NCRESCLK<='1';
	else
		NCRESCLK<='0';
	end if;
end Process;

Process (CLKDivH, ClockDivCounter, SCLKRegister) is begin
	if CLKDivH = STD_LOGIC_VECTOR (ClockDivCounter) AND SCLKRegister ='1' then
		NCFESCLK<='1';
	else
		NCFESCLK<='0';
	end if;
end Process;


Process (CLK) is begin
	if rising_edge(CLK) then
		if BusyRegister='0' then
			if WE='1' then
				TransferRegister <= ByteToSend(6 downto 0);
				BusyRegister<='1';
				--CSRegister<='0';
				MOSIRegister <=ByteToSend(7);
			end if;
		else
			if NCFESCLK ='1' then -- on falling edge, bits are transfered-> increase number of transferred bits
				BitCounter<=BitCounter+1;
				TransferRegister (6 downto 1) <=TransferRegister (5 downto 0);
				MOSIRegister <=TransferRegister(6);
				ReadRegister(7 downto 1) <=ReadRegister(6 downto 0);
				ReadRegister(0)<=MISO;
			end if;
			
			if NCRESCLK ='1' then -- on rising edge, change data (should work best because t_setup = t_hold = 2,5 ns)
				
			end if;
			
			if BitCounter = to_unsigned(7,5) AND NCFESCLK ='1' then -- when 16 bits have been transfered, wait until clock to cipselect time is fullfilled (min 10 ns, 
				--CSRegister<='1';
				BusyRegister<='0';
				BitCounter <=to_unsigned(0,5);
			end if;
		end if;
	end if;
end process;



Process (CLK) is begin
	if rising_Edge(CLK) then
		case cont_state is
			when waiting => 
				WE<='0';
				CSRegister<='1';
				if ReadID='1' then
					CSRegister<='0';
					cont_state <= write_instruction_byte;
					ByteToSend <= X"03";
					WE<='1';
				end if;
				
			when write_instruction_byte =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= write_address;
					ByteToSend <= X"FA";
					WE<='1';				
				end if;
				
			when write_address =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= read1;
					ByteToSend <= X"00";
					WE<='1';				
				end if;
			
			when read1 =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= read2;
					ByteToSend <= X"00";
					WE<='1';				
					ReceivedID(47 downto 40)<=ReadRegister;
				end if;
			
			when read2 =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= read3;
					--ByteToSend <= X"00";
					ReceivedID(39 downto 32)<=ReadRegister;
					WE<='1';				
				end if;
			
			when read3 =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= read4;
					--ByteToSend <= X"00";
					ReceivedID(31 downto 24)<=ReadRegister;
					WE<='1';				
				end if;
			
			when read4 =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= read5;
					--ByteToSend <= X"00";
					ReceivedID(23 downto 16)<=ReadRegister;
					WE<='1';				
				end if;
			
			when read5 =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= read6;
					--ByteToSend <= X"00";
					ReceivedID(15 downto 8)<=ReadRegister;
					WE<='1';				
				end if;
				
			when read6 =>
				WE<='0';
				if BusyRegister='0' and WE='0' then
					cont_state <= final_wait_to_CS;
					--ByteToSend <= X"00";
					ReceivedID(7 downto 0)<=ReadRegister;
					Final_counter<=to_unsigned(0,4);
				end if;
			when final_wait_to_CS=>
				Final_counter<=Final_counter+1;
				if CLKDivL = STD_LOGIC_VECTOR(Final_counter) then
					cont_state <= waiting;
				end if;

			
			when others=> null;
		end case;
	end if;
end process;
end Behavioral;

