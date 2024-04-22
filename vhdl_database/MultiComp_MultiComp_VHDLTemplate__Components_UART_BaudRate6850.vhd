-- Baud Rate Generator for buffered UART
-- Assumes 50 MHz clock
-- Pass Baud Rate in BAUD_RATE generic as integer value (300, 9600, 115,200)
-- Legal values are 115200, 38400, 19200, 9600, 4800, 2400, 1200, 600, 300
--
--	Call with
--
--	BaudRateGen : entity work.BaudRate6850
--	GENERIC map (
--		BAUD_RATE	=>  115200
--	)
--	PORT map (
--		i_CLOCK_50	=> i_CLOCK_50,
--		o_serialEn	=> serialEn
--	);
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

ENTITY BaudRate6850 IS
	GENERIC (
		BAUD_RATE	: integer
	);
	PORT (
		i_CLOCK_50	: IN std_logic;
		o_serialEn	: OUT std_logic
	);
END BaudRate6850;

ARCHITECTURE BaudRate6850_beh OF BaudRate6850 IS

   signal w_serialCount   	: std_logic_vector(15 downto 0);
   signal w_serialCount_d	: std_logic_vector(15 downto 0);

	-- Signal Tap Logic Analyzer signals
	attribute syn_keep	: boolean;
	attribute syn_keep of o_serialEn			: signal is true;
	
BEGIN

	-- ____________________________________________________________________________________
	-- Baud Rate Clock Signals
	-- Serial clock DDS
	-- 50MHz master input clock:
	-- f = (increment x 50,000,000) / 65,536 = 16X baud rate
	-- Baud Increment
	-- 115200 2416
	-- 38400 805
	-- 19200 403
	-- 9600 201
	-- 4800 101
	-- 2400 50
	-- 1200 25
	-- 600 13
	-- 300 6
		 
	BAUD_115200: if (BAUD_RATE=115200) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 2416;
			 end process;
	end generate BAUD_115200;
		 
	BAUD_38400: if (BAUD_RATE=38400) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 805;
			 end process;
	end generate BAUD_38400;
		 
	BAUD_19200: if (BAUD_RATE=19200) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 403;
			 end process;
	end generate BAUD_19200;
		 
	BAUD_9600: if (BAUD_RATE=9600) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 201;
			 end process;
	end generate BAUD_9600;
		 
	BAUD_4800: if (BAUD_RATE=4800) generate
		begin
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 101;
			 end process;
	end generate BAUD_4800;
		 
	BAUD_2400: if (BAUD_RATE=2400) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 50;
			 end process;
	end generate BAUD_2400;
	
	BAUD_1200: if (BAUD_RATE=1200) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 25;
			 end process;
	end generate BAUD_1200;
		 
	BAUD_600: if (BAUD_RATE=600) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 13;
			 end process;
	end generate BAUD_600;
		 
	BAUD_300: if (BAUD_RATE=300) generate
		begin	
		baud_div: process (w_serialCount_d, w_serialCount)
			 begin
				  w_serialCount_d <= w_serialCount + 6;
			 end process;
	end generate BAUD_300;
		 
	process (i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
			  -- Enable for baud rate generator
			  w_serialCount <= w_serialCount_d;
			  if w_serialCount(15) = '0' and w_serialCount_d(15) = '1' then
					o_serialEn <= '1';
			  else
					o_serialEn <= '0';
			  end if;
			end if;
		end process;

END BaudRate6850_beh;
