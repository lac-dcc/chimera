-- Design Name: R3DUX
-- Module Name: R3DUX.VHD
-- Project Name: R3DUX. Open Source TX X3 CPLD replacement project
-- Target Devices: LC4256
--
-- Revision 1.0 - File Created - Aaron "Kekule" Van Tassle
-- Revision 1.1 - Recovered lost file from NAS, should be more complete
--
-- Additional Comments:
-- R3DUX is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see .


--**BANK SELECTION**
--Bank selection is controlled by bank select switches, or the lower nibble
--of address REG_X3_CTRL (0xF501). A20,A19,A18 are address lines to the main parallel flash memory.
--lines marked X means it is not forced by the CPLD for banking purposes.
-- all the bank select lines are pull-up
--This is how is works:
--
--REGISTER 0xF501/SWITCH Bank Commands: (AM29F016)
--BANK    	SWITCH A20|A19|A18 ADDRESS OFFSET
---------------------------------------------------------------------------
--     	   bits:0123
--256k 
--BANK1		1111 	0 |0 |0 	0x000000
--BANK2    	0111 	0 |0 |1 	0x040000	
--BANK3    	1011 	0 |1 |0 	0x080000
--BANK4    	0011 	0 |1 |1 	0x0C0000	
--BANK5    	1101 	1 |0 |0 	0x100000
--BANK6    	0101 	1 |0 |1 	0x140000	
--BANK7    	1001 	1 |1 |0 	0x180000
--BANK8    	0001 	1 |1 |1 	0x1C0000	

--512k 
--BANK12   	1110 	0 |0 |X 	0x000000
--BANK34   	0110 	0 |1 |X 	0x080000
--BANK56   	1010 	1 |0 |X 	0x100000
--BANK78   	0010 	1 |1 |X 	0x180000

--1M
--BANK1-4   	1100 	0 |X |X 	0x000000
--BANK5-8   	0100 	1 |X |X 	0x100000

--2M
--BANK1-8   	0000 	X |X |X 	0x000000


--
--
--**X3 CONTROL WRITE/READ REGISTERS**
--Bits marked 'X' either have no function or an unknown function.
--**0xF500 READ- :**
-- X3 version, expects 0xE1 to be returned
--
--**0xF501 READ/WRITE:**
--X3 Control
--0-3 hardware bank selection
--4 - unused?
--5 - unknown (set when chip disabled (one is prob LPC FSM reset while other controls d0
--6 - unknown - set when chip is disabled
--7 - backup CE# for flashing the backup

--0xF502 X3 Status Flags (READ/WRITE)**
--0-3 software bank selection
-- 7 - software bank select if set, otherwise dip switch bank select
-- before flashing the current value is read, then 0x8E written, after original value is restored
--
--**0xF503 - LCD Brightness (WRITE)** DISP_O_LIGHT
-- 0-8 - LCD Brightness
--
--**0xF504 - LCD Message (WRITE) DISP_O_DAT
-- 1111 0000    INIT set before sending DISP_O_CMD
-- 000 1111    set when sending data... so only the upper byte is used
-- D7 D6 D5 D4 X X X X
--**0xF505 - LCD Message (WRITE) DISP_O_CMD
-- X X X X X E RW RS

--**0xF506 - LCD Message (WRITE) DISP_O_DIR_DAT
--only used in DisplayInit
--	_outp(DISP_O_DAT, 0);
--	_outp(DISP_O_CMD, 0);
--	_outp(DISP_O_DIR_DAT, 0xFF);
--	_outp(DISP_O_DIR_CMD, 0x07);

--**0xF507 - LCD Message (WRITE) DISP_O_DIR_CMD
-- only used in display init.... see above

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY R3DUX IS
	PORT (
 

		LED_RED : OUT STD_LOGIC := '1';--inverted
		LED_BLUE : OUT STD_LOGIC := '0';
		
		
		SWITCH_BANK : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		PROTECT_SWITCH : IN STD_LOGIC;
		
		CONTROL_D0 : OUT STD_LOGIC; --output to the FET
		CONTROL_K : OUT STD_LOGIC :='0'; --LCD back light control used in PWM?
 
		-- NOR FLASH IO
		FLASH_ADDRESS : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);--:= "000000000000000000000"; -- memory address input
		FLASH_DQ : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0); -- data to be transferred
		FLASH_OE : OUT STD_LOGIC; --output enable active low
		FLASH_WE : OUT STD_LOGIC; -- write enable active low
		FLASH_CE_MAIN : OUT STD_LOGIC := '0'; --output enable active low
		FLASH_CE_BACKUP : OUT STD_LOGIC := '1'; --output enable active low

		-- LPC IO
		LPC_CLK : IN STD_LOGIC;
		LPC_RST : IN STD_LOGIC;
		LPC_LAD : INOUT STD_LOGIC_VECTOR (3 DOWNTO 0);

 
		EJECT_BTN :  IN STD_LOGIC ;
		PWR_BTN :  IN STD_LOGIC;
 		
 
		--HD44780 LCD Pins
		LCD_OUT_DATA : OUT std_logic_vector (7 DOWNTO 0);
		LCD_RS : OUT std_logic;
		LCD_RW : OUT std_logic;
		LCD_E : OUT std_logic
		

		
 
	);

END;

ARCHITECTURE Behavioral OF R3DUX IS
	-- LPC BUS STATES for memory IO. Will need to include other states to
	-- support other LPC transactions.
	TYPE LPC_STATE_MACHINE IS
	(
	WAIT_START, 
	CYCTYPE_DIR, 
	ADDRESS, 
	-- jump based on CYC_TYPE not currently implemented
 
	--WRITE
	WRITE_DATA0, 
	WRITE_DATA1, 
 
	--MEMORY READ
	READ_DATA0, 
	READ_DATA1, 

	TAR1, 
	TAR2, 
	--JUMP TO CORRECT POS BASED ON CYC_TYPE

	SYNC, 

	--TRANSACTION CLOSE
	SYNC_COMPLETE, 

	TAR_EXIT
	);
 
	TYPE CYC_TYPE IS
	(
	IO_READ, 
	IO_WRITE, 
	MEM_READ, 
	MEM_WRITE
	);
 
	SIGNAL LPC_CURRENT_STATE : LPC_STATE_MACHINE;
	SIGNAL CYCLE_TYPE : CYC_TYPE;
 
	SIGNAL LPC_ADDRESS : STD_LOGIC_VECTOR (20 DOWNTO 0);
	
 	--IO REGISTER CONSTANTS
	CONSTANT X3_VERSION_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F500";---R
	CONSTANT X3_CONTROL_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F501";--R/W
	CONSTANT X3_STATUS_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F502";--R/W
	CONSTANT LCD_BL_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F503";--W

	CONSTANT LCD_O_DAT_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F504";--W
	CONSTANT LCD_O_CMD_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F505";--W
	CONSTANT LCD_O_DIR_DAT_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F506";--W
	CONSTANT LCD_O_DIR_CMD_ADDR : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"F507";--W 
 
 
	--R/W for flash memory
	SIGNAL DQ : STD_LOGIC_VECTOR (7 DOWNTO 0) := "ZZZZZZZZ";-- := (OTHERS => '0');
	--IO WRITE REGISTERS SIGNALS
	CONSTANT REG_X3_VERSION : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"E1";--must return 0xE1 to ID as an X3
	SIGNAL REG_X3_CONTROL_WRITE : STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');--"00000000"; --Busy,X,CHIP DISABLE,D0 Disbale?,X,BNK3, BNK2, BNK1,BNK0
	SIGNAL REG_X3_STATUS_WRITE : STD_LOGIC_VECTOR (7 DOWNTO 0);-- := "00000000";
	SIGNAL REG_X3_CONTROL_READ : STD_LOGIC_VECTOR (7 DOWNTO 0);-- := "00000000"; 
	SIGNAL REG_X3_STATUS_READ : STD_LOGIC_VECTOR (7 DOWNTO 0);-- := "00000000";
	SIGNAL BANK_SELECT : STD_LOGIC_VECTOR(3 DOWNTO 0);-- := "0000";
	SIGNAL FLASH_PROTECT : STD_LOGIC:='1';--disbaled if H
	
	SIGNAL REG_LCD_BL :STD_LOGIC_VECTOR (7 DOWNTO 0) := "11111111";
	SIGNAL REG_LCD_O_DATA : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
	SIGNAL REG_LCD_O_CMD : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
	SIGNAL REG_LCD_O_DIR_DAT : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
	SIGNAL REG_LCD_O_DIR_CMD : STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
 
 
	SIGNAL READBUFFER : STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	

	--CHIP_DISABLE IS SET TO '1' WHEN YOU REQUEST TO BOOT FROM TSOP. THIS PREVENTS THE CPLD FROM DRIVING D0.
	--D0LEVEL is inverted (since its through a P-MOSFET). This allows the CPLD to latch/release the D0/LFRAME signal.
	SIGNAL CHIP_DISABLE : STD_LOGIC :='0';
	SIGNAL D0LEVEL: STD_LOGIC := '0';
	SIGNAL BACKUP_ENABLE : STD_LOGIC := '0';
	SIGNAL SWITCH_TO_MAIN: STD_LOGIC := '0';
	SIGNAL SOFTBANK_CONTROL :STD_LOGIC :='0';
	SIGNAL HARD_CHIP_DISABLE : STD_LOGIC := '0';

	--for PWM
	SIGNAL reset : STD_LOGIC :='0';
	SIGNAL BACKLIGHT_TARGET : STD_LOGIC:='0';
	
	--for button chip control	
	SIGNAL PWR_PRESSED: STD_LOGIC := '0';
	SIGNAL HAS_BOOTED :STD_LOGIC :='0';

	--GENERAL COUNTER USED TO TRACK ADDRESS AND SYNC STATES.
	SIGNAL COUNT : INTEGER RANGE 0 TO 7;
 
 
BEGIN
	-- Connections for LCD transaction
	--LCD Data has this format

PW : entity work.pwm port map(LPC_CLK,reset, REG_LCD_BL, BACKLIGHT_TARGET);

	
	CONTROL_K<=BACKLIGHT_TARGET;
	
	LCD_RS <= REG_LCD_O_CMD(0);
	LCD_RW <= REG_LCD_O_CMD(1);
	LCD_E <= REG_LCD_O_CMD(2);
	LCD_OUT_DATA <= REG_LCD_O_DATA;


	SOFTBANK_CONTROL <= REG_X3_STATUS_WRITE(7);
	REG_X3_CONTROL_WRITE (3 DOWNTO 0) <= SWITCH_BANK WHEN SOFTBANK_CONTROL = '0';

	FLASH_PROTECT <=  PROTECT_SWITCH;

	BACKUP_ENABLE <= ((NOT EJECT_BTN AND NOT PWR_BTN ) OR REG_X3_CONTROL_WRITE(7)) WHEN
		BACKUP_ENABLE = '0'; --pwr and eject are held high unless pressed or you are flashing the backup bios

	HARD_CHIP_DISABLE <= PWR_PRESSED AND NOT PWR_BTN WHEN 
		HARD_CHIP_DISABLE = '0' AND 
		BACKUP_ENABLE = '0';
		


	CHIP_DISABLE <=  (REG_X3_CONTROL_WRITE(5) OR HARD_CHIP_DISABLE);-- AND
	--	NOT BACKUP_ENABLE;-- AND
	--	NOT HAS_BOOTED;

	--enable the correct flash chip
	FLASH_CE_BACKUP <= '0' WHEN BACKUP_ENABLE = '1' AND SWITCH_TO_MAIN = '0' ELSE '1'; -- CE is active low
	FLASH_CE_MAIN <= '0' WHEN BACKUP_ENABLE = '0' OR SWITCH_TO_MAIN = '1' ELSE '1'; --CE is active low
	

	FLASH_ADDRESS <= LPC_ADDRESS;
 
	--LAD lines can be either input or output
	--The output values depend on variable states of the LPC transaction!
	LPC_LAD <= "0000" WHEN LPC_CURRENT_STATE = SYNC_COMPLETE ELSE
	           "0101" WHEN LPC_CURRENT_STATE = SYNC ELSE
	           "1111" WHEN LPC_CURRENT_STATE = TAR2 ELSE
	           "1111" WHEN LPC_CURRENT_STATE = TAR_EXIT ELSE
	           READBUFFER(3 DOWNTO 0) WHEN LPC_CURRENT_STATE = READ_DATA0 ELSE
	           READBUFFER(7 DOWNTO 4) WHEN LPC_CURRENT_STATE = READ_DATA1 ELSE
	           "ZZZZ";
	--Flash data vector outputs the data value in MEM_WRITE mode, else its just an input
	FLASH_DQ <= DQ WHEN CYCLE_TYPE = MEM_WRITE ELSE "ZZZZZZZZ";
 
	--WE, and OE (Write Enable and Output Enable for Flash Memory Write and Reads respectively) are active low signals,
	
	FLASH_WE <= '0' WHEN CYCLE_TYPE = MEM_WRITE AND
		FLASH_PROTECT = '1' AND --its the button is disbaled when HIGH
	        (LPC_CURRENT_STATE = TAR1 OR
	        LPC_CURRENT_STATE = TAR2 OR
		LPC_CURRENT_STATE = SYNC) ELSE '1';
				 

	--Output Enable for Flash Memory Read (Active low)
	--Output Enable must be pulled low for 50ns before data is valid for reading
	FLASH_OE <= '0' WHEN CYCLE_TYPE = MEM_READ AND
	            (LPC_CURRENT_STATE = TAR1 OR
	            LPC_CURRENT_STATE = TAR2 OR
	            LPC_CURRENT_STATE = SYNC OR
	            LPC_CURRENT_STATE = SYNC_COMPLETE OR
	            LPC_CURRENT_STATE = READ_DATA0 OR
	            LPC_CURRENT_STATE = READ_DATA1 OR
	            LPC_CURRENT_STATE = TAR_EXIT) ELSE '1';


	--D0 has the following behaviour
   	--Held low on boot to ensure it boots from the LPC then released when definitely booting from modchip.
   	--When soldered to LFRAME it will simulate LPC transaction aborts for 1.6.
   	--Released for TSOP booting.
   	--NOTE: CONTROL_D0 is an output to a mosfet driver. '0' turns off the MOSFET releasing D0
   	--and a value of '1' turns on the MOSFET forcing it to ground. This is why I invert D0LEVEL before mapping it.
   	CONTROL_D0 <= '1' WHEN CHIP_DISABLE = '1' ELSE
                '0' WHEN CYCLE_TYPE = MEM_READ ELSE
                '0' WHEN CYCLE_TYPE = MEM_WRITE ELSE
                 D0LEVEL; 
	--this is so X3CL can show you what bank is selected
	--REG_X3_CONTROL_READ(3 DOWNTO 0) <=  SWITCH_BANK(3 DOWNTO 0);
 	LED_BLUE <= '1' WHEN CHIP_DISABLE = '1' ELSE '0';
	LED_RED  <= '0' WHEN BACKUP_ENABLE = '1' OR --ELSE '1';
		CHIP_DISABLE = '1' ELSE '1';
	-- LPC Device State machine, see the Intel LPC Specifications for details
	PROCESS (LPC_RST, LPC_CLK, CHIP_DISABLE, BACKUP_ENABLE) BEGIN
 
	
	IF (LPC_RST = '0') THEN --initalize values
		--LCD_DATA_BYTE <= "00000000";
		--LPC_ADDRESS <= (others => '0');
		HAS_BOOTED <= '0';
		
		
				

		D0LEVEL <=CHIP_DISABLE;
		LPC_CURRENT_STATE <= WAIT_START;
		CYCLE_TYPE <= MEM_READ;
 
	ELSIF (rising_edge(LPC_CLK)) THEN

		PWR_PRESSED <= NOT PWR_BTN;--1 cycle button debounce for chip disable
		
 
		CASE LPC_CURRENT_STATE IS
 
			WHEN WAIT_START => 
				
			
				IF LPC_LAD = "0000" THEN --indicates start of cycle for memory IO and DMA cycles, and indicates LFRAME on 1.3+
					LPC_CURRENT_STATE <= CYCTYPE_DIR;
				END IF;
 
			WHEN CYCTYPE_DIR => --determine transaction type
				IF LPC_LAD(3 DOWNTO 1) = "000" THEN
					CYCLE_TYPE <= IO_READ;
					COUNT <= 3;
					LPC_CURRENT_STATE <= ADDRESS;
				ELSIF LPC_LAD(3 DOWNTO 1) = "001" THEN
					CYCLE_TYPE <= IO_WRITE;
					COUNT <= 3;
					LPC_CURRENT_STATE <= ADDRESS;
				ELSIF LPC_LAD(3 DOWNTO 1) = "010" THEN
					CYCLE_TYPE <= MEM_READ;
					COUNT <= 7;
					LPC_CURRENT_STATE <= ADDRESS;
				ELSIF LPC_LAD(3 DOWNTO 1) = "011" THEN
					CYCLE_TYPE <= MEM_WRITE;
					COUNT <= 7;
					LPC_CURRENT_STATE <= ADDRESS;
				ELSE
					LPC_CURRENT_STATE <= WAIT_START; -- Unsupported, reset state machine.
				END IF;
 
			WHEN ADDRESS => 
				IF COUNT = 5 THEN
					LPC_ADDRESS(20) <= LPC_LAD(0);
 
				ELSIF COUNT = 4 THEN
					LPC_ADDRESS(19 DOWNTO 16) <= LPC_LAD;


					--BANK CONTROL
					IF SOFTBANK_CONTROL = '1' THEN
						--software controlled bank is controlled with REG_X3_STATUS		
						--BANK_SELECT <=   REG_X3_STATUS_WRITE(3 DOWNTO 0);--SWITCH_BANK;
						BANK_SELECT <=   NOT REG_X3_STATUS_WRITE(3 DOWNTO 0);
					
					ELSE	-- hardware bank selet
						BANK_SELECT <=  NOT SWITCH_BANK(3 DOWNTO 0);
					
					
					END IF;
						
					IF (CYCLE_TYPE = MEM_READ OR CYCLE_TYPE = MEM_WRITE) THEN 
		
						CASE BANK_SELECT(3 DOWNTO 0) IS --
						---256k Banks
						
							--THESE ARE BACKWARDS FROM THE SWITCH APPEARANCE	
							WHEN "1111" => --
								LPC_ADDRESS(20 DOWNTO 18) <= "000"; --BANK 1
							WHEN "1110" => --
								LPC_ADDRESS(20 DOWNTO 18) <= "001"; --BANK 2 
							WHEN "1101" => --
								LPC_ADDRESS(20 DOWNTO 18) <= "010"; --BANK 3
							WHEN "1100" => --BANK 4 
								LPC_ADDRESS(20 DOWNTO 18) <= "011"; --BANK 4 
							WHEN "1011" => 							
								LPC_ADDRESS(20 DOWNTO 18) <= "100"; --BANK 5
							WHEN "1010" =>   --
								LPC_ADDRESS(20 DOWNTO 18) <= "101"; --BANK 6 
							WHEN "1001" =>   --
								LPC_ADDRESS(20 DOWNTO 18) <= "110"; --BANK 7
							WHEN "1000" => 
								LPC_ADDRESS(20 DOWNTO 18) <= "111"; --BANK 8 
						--512k Banks
							WHEN "0111" => 
								LPC_ADDRESS(20 DOWNTO 19) <= "00";  --BANK 12
							WHEN "0110" => 
								LPC_ADDRESS(20 DOWNTO 19) <= "01";  --BANK 34
							WHEN "0101" => 
								LPC_ADDRESS(20 DOWNTO 19) <= "10";  --BANK 56
							WHEN "0100" => 
								LPC_ADDRESS(20 DOWNTO 19) <= "11";  --BANK 78
						--1M Banks
							WHEN "0011" =>   
								LPC_ADDRESS(20) <= '0'; 	    --BANK 1234
							WHEN "0010" => 
								LPC_ADDRESS(20) <= '1'; 	    --BANK 5678
						
							WHEN "0000"  => --no bank switch, default to first 1MB bank
								LPC_ADDRESS(20) <= '0'; 
							WHEN OTHERS => 
							--	LPC_ADDRESS(20 DOWNTO 18) <= "000";
						END CASE;
					END IF;
 
				ELSIF COUNT = 3 THEN
					LPC_ADDRESS(15 DOWNTO 12) <= LPC_LAD;
 
				ELSIF COUNT = 2 THEN
					LPC_ADDRESS(11 DOWNTO 8) <= LPC_LAD;
 
				ELSIF COUNT = 1 THEN
					LPC_ADDRESS(7 DOWNTO 4) <= LPC_LAD;
 
				ELSIF COUNT = 0 THEN
					LPC_ADDRESS(3 DOWNTO 0) <= LPC_LAD;
					IF CYCLE_TYPE = IO_READ OR CYCLE_TYPE = MEM_READ THEN
						LPC_CURRENT_STATE <= TAR1;
					ELSIF CYCLE_TYPE = IO_WRITE OR CYCLE_TYPE = MEM_WRITE THEN
						LPC_CURRENT_STATE <= WRITE_DATA0;
					END IF;
				END IF;
				COUNT <= COUNT - 1; 
 
				--WRITE DATA
			WHEN WRITE_DATA0 => 
				IF CYCLE_TYPE = MEM_WRITE THEN
					DQ(3 DOWNTO 0) <= LPC_LAD;
				ELSIF	CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = X3_CONTROL_ADDR THEN
					REG_X3_CONTROL_WRITE(3 DOWNTO 0) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = X3_STATUS_ADDR THEN
				 	REG_X3_STATUS_WRITE(3 DOWNTO 0) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_BL_ADDR THEN
				   	REG_LCD_BL(3 DOWNTO 0) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_DAT_ADDR THEN
					REG_LCD_O_DATA(3 DOWNTO 0) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_CMD_ADDR THEN
					REG_LCD_O_CMD(3 DOWNTO 0) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_DIR_DAT_ADDR THEN
					REG_LCD_O_DIR_DAT(3 DOWNTO 0) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_DIR_CMD_ADDR THEN
					REG_LCD_O_DIR_CMD(3 DOWNTO 0) <= LPC_LAD;
				END IF;
				LPC_CURRENT_STATE <= WRITE_DATA1;
 
			WHEN WRITE_DATA1 => 
				IF CYCLE_TYPE = MEM_WRITE THEN 
					DQ(7 DOWNTO 4) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = X3_CONTROL_ADDR THEN
					REG_X3_CONTROL_WRITE(7 DOWNTO 4) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = X3_STATUS_ADDR THEN
					REG_X3_STATUS_WRITE(7 DOWNTO 4) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_BL_ADDR THEN
					REG_LCD_BL(7 DOWNTO 4) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_DAT_ADDR THEN
					REG_LCD_O_DATA(7 DOWNTO 4) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_CMD_ADDR THEN
					REG_LCD_O_CMD(7 DOWNTO 4) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_DIR_DAT_ADDR THEN
					REG_LCD_O_DIR_DAT(7 DOWNTO 4) <= LPC_LAD;
				ELSIF CYCLE_TYPE = IO_WRITE AND LPC_ADDRESS(15 DOWNTO 0) = LCD_O_DIR_CMD_ADDR THEN
					REG_LCD_O_DIR_CMD(7 DOWNTO 4) <= LPC_LAD;
				
				END IF;
				LPC_CURRENT_STATE <= TAR1;
 
 
				--READ DATA 
			WHEN READ_DATA0 => 
				LPC_CURRENT_STATE <= READ_DATA1; 
			WHEN READ_DATA1 => 
				LPC_CURRENT_STATE <= TAR_EXIT;
 
				--TURN AROUND
			WHEN TAR1 => 
				LPC_CURRENT_STATE <= TAR2;
			WHEN TAR2 => 
				LPC_CURRENT_STATE <= SYNC;
				IF CYCLE_TYPE = MEM_READ OR CYCLE_TYPE = MEM_WRITE THEN
					COUNT <=2;
				ELSE COUNT<=6;
				END IF;
			--	COUNT <=6;

			WHEN SYNC => 
				COUNT <= COUNT - 1;--always does COUNT+1 sync cycles
				--Buffer IO reads during syncing. Helps output timings
				IF COUNT = 1 THEN
					IF CYCLE_TYPE = MEM_READ THEN
						IF BACKUP_ENABLE = '1' THEN
							-- SPOOF the ID of the backup chip
							IF LPC_ADDRESS = x"F0100" THEN
								READBUFFER <= x"1C";
							ELSIF LPC_ADDRESS = x"F0101" THEN
								READBUFFER <= x"92";
							ELSE READBUFFER <= FLASH_DQ;
							END IF;
						ELSE 
							READBUFFER <= FLASH_DQ;
						END IF;

					ELSIF CYCLE_TYPE = IO_READ THEN
						IF LPC_ADDRESS(15 DOWNTO 0) = X3_VERSION_ADDR THEN
							READBUFFER <= REG_X3_VERSION;
						ELSIF LPC_ADDRESS(15 DOWNTO 0) = X3_CONTROL_ADDR THEN
							READBUFFER <= REG_X3_CONTROL_WRITE;
						ELSIF LPC_ADDRESS(15 DOWNTO 0) = X3_STATUS_ADDR THEN
							READBUFFER <= REG_X3_STATUS_WRITE; 
						ELSE
							READBUFFER <= "11111111";-- if I dont return something evox wont boot
						END IF;
					END IF;
				ELSIF COUNT = 0 THEN
					LPC_CURRENT_STATE <= SYNC_COMPLETE;
				END IF;

			WHEN SYNC_COMPLETE => 
				IF CYCLE_TYPE = MEM_READ OR CYCLE_TYPE = IO_READ THEN
					LPC_CURRENT_STATE <= READ_DATA0;
				ELSE
					LPC_CURRENT_STATE <= TAR_EXIT;
				END IF;
 
 
				--TURN BUS AROUND (PERIPHERAL TO HOST)
 
			WHEN TAR_EXIT => 
							
				-- have to switch back to the main flash if booting off of backup
				IF LPC_ADDRESS (17 DOWNTO 0) = x"22fAF" THEN
					--backup enabled but not flashing backup from x3cl
					IF BACKUP_ENABLE = '1' AND REG_X3_CONTROL_WRITE(7) = '0' THEN
						SWITCH_TO_MAIN <='1';
					END IF;
				END IF;
				CYCLE_TYPE <= IO_READ;
				LPC_CURRENT_STATE <= WAIT_START;
			--	HAS_BOOTED <= '1';
 
 
		END CASE;
	END IF;
END PROCESS;
END Behavioral;
