----------------------------------------------------------------------------
--	GPIO_Demo.vhd -- Basys3 GPIO/UART Demonstration Project
----------------------------------------------------------------------------
-- Author:  Marshall Wingerson Adapted from Sam Bobrowicz
--          Copyright 2013 Digilent, Inc.
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--	The GPIO/UART Demo project demonstrates a simple usage of the Basys3's 
--  GPIO and UART. The behavior is as follows:
--
--	      *The 16 User LEDs are tied to the 16 User Switches. While the center
--			 User button is pressed, the LEDs are instead tied to GND
--	      *The 7-Segment display counts from 0 to 9 on each of its 8
--        digits. This count is reset when the center button is pressed.
--        Also, single anodes of the 7-Segment display are blanked by
--	       holding BTNU, BTNL, BTND, or BTNR. Holding the center button 
--        blanks all the 7-Segment anodes.
--       *An introduction message is sent across the UART when the device
--        is finished being configured, and after the center User button
--        is pressed.
--       *A message is sent over UART whenever BTNU, BTNL, BTND, or BTNR is
--        pressed.
--       *Note that the center user button behaves as a user reset button
--        and is referred to as such in the code comments below
--       *A test pattern is displayed on the VGA port at 1280x1024 resolution.
--        If a mouse is attached to the USB-HID port, a cursor can be moved
--        around the pattern.
--        
--	All UART communication can be captured by attaching the UART port to a
-- computer running a Terminal program with 9600 Baud Rate, 8 data bits, no 
-- parity, and 1 stop bit.																
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Revision History:
--  08/08/2011(SamB): Created using Xilinx Tools 13.2
--  08/27/2013(MarshallW): Modified for the Nexys4 with Xilinx ISE 14.4\
--  		--added RGB and microphone
--  7/22/2014(SamB): Modified for the Basys3 with Vivado 2014.2\
--  		--Removed RGB and microphone
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--The IEEE.std_logic_unsigned contains definitions that allow 
--std_logic_vector types to be used with the + operator to instantiate a 
--counter.
use IEEE.std_logic_unsigned.all;

entity GPIO_demo is
    Port ( SW 			: in  STD_LOGIC_VECTOR (15 downto 0);
           BTN 			: in  STD_LOGIC_VECTOR (4 downto 0);
           CLK 			: in  STD_LOGIC;
           LED 			: out  STD_LOGIC_VECTOR (15 downto 0);
           SSEG_CA 		: out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN 		: out  STD_LOGIC_VECTOR (3 downto 0);
           UART_TXD 	: out  STD_LOGIC;
           VGA_RED      : out  STD_LOGIC_VECTOR (3 downto 0);
           VGA_BLUE     : out  STD_LOGIC_VECTOR (3 downto 0);
           VGA_GREEN    : out  STD_LOGIC_VECTOR (3 downto 0);
           VGA_VS       : out  STD_LOGIC;
           VGA_HS       : out  STD_LOGIC;
           PS2_CLK      : inout STD_LOGIC;
           PS2_DATA     : inout STD_LOGIC
			  );
end GPIO_demo;

architecture Behavioral of GPIO_demo is

component UART_TX_CTRL
Port(
	SEND : in std_logic;
	DATA : in std_logic_vector(7 downto 0);
	CLK : in std_logic;          
	READY : out std_logic;
	UART_TX : out std_logic
	);
end component;

component debouncer
Generic(
        DEBNC_CLOCKS : integer;
        PORT_WIDTH : integer);
Port(
		SIGNAL_I : in std_logic_vector(4 downto 0);
		CLK_I : in std_logic;          
		SIGNAL_O : out std_logic_vector(4 downto 0)
		);
end component;

component vga_ctrl
    Port ( CLK_I : in STD_LOGIC;
           VGA_HS_O : out STD_LOGIC;
           VGA_VS_O : out STD_LOGIC;
           VGA_RED_O : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_BLUE_O : out STD_LOGIC_VECTOR (3 downto 0);
           VGA_GREEN_O : out STD_LOGIC_VECTOR (3 downto 0);
           PS2_CLK      : inout STD_LOGIC;
           PS2_DATA     : inout STD_LOGIC
           );
end component;


--The type definition for the UART state machine type. Here is a description of what
--occurs during each state:
-- RST_REG     -- Do Nothing. This state is entered after configuration or a user reset.
--                The state is set to LD_INIT_STR.
-- LD_INIT_STR -- The Welcome String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The welcome string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
-- SEND_CHAR   -- uartSend is set high for a single clock cycle, signaling the character
--                data at sendStr(strIndex) to be registered by the UART_TX_CTRL at the next
--                cycle. Also, strIndex is incremented (behaves as if it were post 
--                incremented after reading the sendStr data). The state is set to RDY_LOW.
-- RDY_LOW     -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go low, 
--                indicating a send operation has begun. State is set to WAIT_RDY.
-- WAIT_RDY    -- Do nothing. Wait for the READY signal from the UART_TX_CTRL to go high, 
--                indicating a send operation has finished. If READY is high and strEnd = 
--                StrIndex then state is set to WAIT_BTN, else if READY is high and strEnd /=
--                StrIndex then state is set to SEND_CHAR.
-- WAIT_BTN    -- Do nothing. Wait for a button press on BTNU, BTNL, BTND, or BTNR. If a 
--                button press is detected, set the state to LD_BTN_STR.
-- LD_BTN_STR  -- The Button String is loaded into the sendStr variable and the strIndex
--                variable is set to zero. The button string length is stored in the StrEnd
--                variable. The state is set to SEND_CHAR.
type UART_STATE_TYPE is (RST_REG, LD_INIT_STR, SEND_CHAR, RDY_LOW, WAIT_RDY, WAIT_BTN, LD_BTN_STR);

--The CHAR_ARRAY type is a variable length array of 8 bit std_logic_vectors. 
--Each std_logic_vector contains an ASCII value and represents a character in
--a string. The character at index 0 is meant to represent the first
--character of the string, the character at index 1 is meant to represent the
--second character of the string, and so on.
type CHAR_ARRAY is array (integer range<>) of std_logic_vector(7 downto 0);

constant TMR_CNTR_MAX : std_logic_vector(26 downto 0) := "101111101011110000100000000"; --100,000,000 = clk cycles per second
constant TMR_VAL_MAX : std_logic_vector(3 downto 0) := "1001"; --9

constant RESET_CNTR_MAX : std_logic_vector(17 downto 0) := "110000110101000000";-- 100,000,000 * 0.002 = 200,000 = clk cycles per 2 ms

constant MAX_STR_LEN : integer := 27;

constant WELCOME_STR_LEN : natural := 27;
constant BTN_STR_LEN : natural := 24;

--Welcome string definition. Note that the values stored at each index
--are the ASCII values of the indicated character.
constant WELCOME_STR : CHAR_ARRAY(0 to 26) := (X"0A",  --\n
															  X"0D",  --\r
															  X"42",  --B
															  X"41",  --A
															  X"53",  --S
															  X"59",  --Y
															  X"53",  --S
															  X"33",  --3
															  X"20",  -- 
															  X"47",  --G
															  X"50",  --P
															  X"49",  --I
															  X"4F",  --O
															  X"2F",  --/
															  X"55",  --U
															  X"41",  --A
															  X"52",  --R
															  X"54",  --T
															  X"20",  -- 
															  X"44",  --D
															  X"45",  --E
															  X"4D",  --M
															  X"4F",  --O
															  X"21",  --!
															  X"0A",  --\n
															  X"0A",  --\n
															  X"0D"); --\r
															  
--Button press string definition.
constant BTN_STR : CHAR_ARRAY(0 to 23) :=     (X"42",  --B
															  X"75",  --u
															  X"74",  --t
															  X"74",  --t
															  X"6F",  --o
															  X"6E",  --n
															  X"20",  -- 
															  X"70",  --p
															  X"72",  --r
															  X"65",  --e
															  X"73",  --s
															  X"73",  --s
															  X"20",  --
															  X"64",  --d
															  X"65",  --e
															  X"74",  --t
															  X"65",  --e
															  X"63",  --c
															  X"74",  --t
															  X"65",  --e
															  X"64",  --d
															  X"21",  --!
															  X"0A",  --\n
															  X"0D"); --\r

--This is used to determine when the 7-segment display should be
--incremented
signal tmrCntr : std_logic_vector(26 downto 0) := (others => '0');

--This counter keeps track of which number is currently being displayed
--on the 7-segment.
signal tmrVal : std_logic_vector(3 downto 0) := (others => '0');

--Contains the current string being sent over uart.
signal sendStr : CHAR_ARRAY(0 to (MAX_STR_LEN - 1));

--Contains the length of the current string being sent over uart.
signal strEnd : natural;

--Contains the index of the next character to be sent over uart
--within the sendStr variable.
signal strIndex : natural;

--Used to determine when a button press has occured
signal btnReg : std_logic_vector (3 downto 0) := "0000";
signal btnDetect : std_logic;

--UART_TX_CTRL control signals
signal uartRdy : std_logic;
signal uartSend : std_logic := '0';
signal uartData : std_logic_vector (7 downto 0):= "00000000";
signal uartTX : std_logic;

--Current uart state signal
signal uartState : UART_STATE_TYPE := RST_REG;

--Debounced btn signals used to prevent single button presses
--from being interpreted as multiple button presses.
signal btnDeBnc : std_logic_vector(4 downto 0);

signal clk_cntr_reg : std_logic_vector (4 downto 0) := (others=>'0'); 

signal pwm_val_reg : std_logic := '0';

--this counter counts the amount of time paused in the UART reset state
signal reset_cntr : std_logic_vector (17 downto 0) := (others=>'0');

begin

----------------------------------------------------------
------                LED Control                  -------
----------------------------------------------------------

with BTN(4) select
	LED <= SW 			when '0',
			 "0000000000000000" when others;
			 			 
----------------------------------------------------------
------           7-Seg Display Control             -------
----------------------------------------------------------
--Digits are incremented every second, and are blanked in
--response to button presses.

--Individual and reset blanking of Anodes
with BTN(4) select
	SSEG_AN(3 downto 0) <= btnDeBnc(3 downto 0)	when '0',
				  "1111" 			when others;	  			  

--This process controls the counter that triggers the 7-segment
--to be incremented. It counts 100,000,000 and then resets.		  
timer_counter_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if ((tmrCntr = TMR_CNTR_MAX) or (BTN(4) = '1')) then
			tmrCntr <= (others => '0');
		else
			tmrCntr <= tmrCntr + 1;
		end if;
	end if;
end process;

--This process increments the digit being displayed on the 
--7-segment display every second.
timer_inc_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (BTN(4) = '1') then
			tmrVal <= (others => '0');
		elsif (tmrCntr = TMR_CNTR_MAX) then
			if (tmrVal = TMR_VAL_MAX) then
				tmrVal <= (others => '0');
			else
				tmrVal <= tmrVal + 1;
			end if;
		end if;
	end if;
end process;

--This select statement encodes the value of tmrVal to the necessary
--cathode signals to display it on the 7-segment
with tmrVal select
	SSEG_CA <= "01000000" when "0000",
				  "01111001" when "0001",
				  "00100100" when "0010",
				  "00110000" when "0011",
				  "00011001" when "0100",
				  "00010010" when "0101",
				  "00000010" when "0110",
				  "01111000" when "0111",
				  "00000000" when "1000",
				  "00010000" when "1001",
				  "11111111" when others;


----------------------------------------------------------
------              Button Control                 -------
----------------------------------------------------------
--Buttons are debounced and their rising edges are detected
--to trigger UART messages


--Debounces btn signals
Inst_btn_debounce: debouncer 
    generic map(
        DEBNC_CLOCKS => (2**16),
        PORT_WIDTH => 5)
    port map(
		SIGNAL_I => BTN,
		CLK_I => CLK,
		SIGNAL_O => btnDeBnc
	);

--Registers the debounced button signals, for edge detection.
btn_reg_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		btnReg <= btnDeBnc(3 downto 0);
	end if;
end process;

--btnDetect goes high for a single clock cycle when a btn press is
--detected. This triggers a UART message to begin being sent.
btnDetect <= '1' when ((btnReg(0)='0' and btnDeBnc(0)='1') or
								(btnReg(1)='0' and btnDeBnc(1)='1') or
								(btnReg(2)='0' and btnDeBnc(2)='1') or
								(btnReg(3)='0' and btnDeBnc(3)='1')  ) else
				  '0';
				  



----------------------------------------------------------
------              UART Control                   -------
----------------------------------------------------------
--Messages are sent on reset and when a button is pressed.

--This counter holds the UART state machine in reset for ~2 milliseconds. This
--will complete transmission of any byte that may have been initiated during 
--FPGA configuration due to the UART_TX line being pulled low, preventing a 
--frame shift error from occuring during the first message.
process(CLK)
begin
  if (rising_edge(CLK)) then
    if ((reset_cntr = RESET_CNTR_MAX) or (uartState /= RST_REG)) then
      reset_cntr <= (others=>'0');
    else
      reset_cntr <= reset_cntr + 1;
    end if;
  end if;
end process;

--Next Uart state logic (states described above)
next_uartState_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (btnDeBnc(4) = '1') then
			uartState <= RST_REG;
		else	
			case uartState is 
			when RST_REG =>
        if (reset_cntr = RESET_CNTR_MAX) then
          uartState <= LD_INIT_STR;
        end if;
			when LD_INIT_STR =>
				uartState <= SEND_CHAR;
			when SEND_CHAR =>
				uartState <= RDY_LOW;
			when RDY_LOW =>
				uartState <= WAIT_RDY;
			when WAIT_RDY =>
				if (uartRdy = '1') then
					if (strEnd = strIndex) then
						uartState <= WAIT_BTN;
					else
						uartState <= SEND_CHAR;
					end if;
				end if;
			when WAIT_BTN =>
				if (btnDetect = '1') then
					uartState <= LD_BTN_STR;
				end if;
			when LD_BTN_STR =>
				uartState <= SEND_CHAR;
			when others=> --should never be reached
				uartState <= RST_REG;
			end case;
		end if ;
	end if;
end process;

--Loads the sendStr and strEnd signals when a LD state is
--is reached.
string_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR) then
			sendStr <= WELCOME_STR;
			strEnd <= WELCOME_STR_LEN;
		elsif (uartState = LD_BTN_STR) then
			sendStr(0 to 23) <= BTN_STR;
			strEnd <= BTN_STR_LEN;
		end if;
	end if;
end process;

--Conrols the strIndex signal so that it contains the index
--of the next character that needs to be sent over uart
char_count_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = LD_INIT_STR or uartState = LD_BTN_STR) then
			strIndex <= 0;
		elsif (uartState = SEND_CHAR) then
			strIndex <= strIndex + 1;
		end if;
	end if;
end process;

--Controls the UART_TX_CTRL signals
char_load_process : process (CLK)
begin
	if (rising_edge(CLK)) then
		if (uartState = SEND_CHAR) then
			uartSend <= '1';
			uartData <= sendStr(strIndex);
		else
			uartSend <= '0';
		end if;
	end if;
end process;

--Component used to send a byte of data over a UART line.
Inst_UART_TX_CTRL: UART_TX_CTRL port map(
		SEND => uartSend,
		DATA => uartData,
		CLK => CLK,
		READY => uartRdy,
		UART_TX => uartTX 
	);

UART_TXD <= uartTX;


----------------------------------------------------------
------              VGA Control                    -------
----------------------------------------------------------

Inst_vga_ctrl: vga_ctrl port map(
		CLK_I => CLK,
		VGA_HS_O => VGA_HS,
        VGA_VS_O => VGA_VS,
		VGA_RED_O => VGA_RED,
        VGA_BLUE_O => VGA_BLUE,
        VGA_GREEN_O => VGA_GREEN,
        PS2_CLK => PS2_CLK,
        PS2_DATA => PS2_DATA
	);

end Behavioral;
