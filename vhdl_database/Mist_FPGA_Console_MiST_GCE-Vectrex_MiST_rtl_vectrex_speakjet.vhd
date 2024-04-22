---------------------------------------------------------------------------------
-- Vectrex_speakjet by Dar (darfpga@aol.fr) (14/04/2018)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Educational use only
-- Do not redistribute synthetized file with roms
-- Do not redistribute roms whatever the form
-- Use at your own risk
---------------------------------------------------------------------------------
-- Get vectrex serial data out that is sligtly too fast to be send directly to
-- speakjet chip (due to cpu09 running faster than original cpu). 
--
-- Retransmit vectrex serial data at 9600bd to speakjet chip.
--
-- Get back speakjet pwm bit output and convert it to numeric value
--
-- You have to fill correctly sp0256_to_speakjet array to convert sp0256 code to
-- speakjet code, then you can use sp0256 mode with speakjet chip
--
-- (code are not delivered due to eventual property right and since such a 
-- product is currently commercialised)
---------------------------------------------------------------------------------
-- Speakjet wiring
--
--  /!\ pwm and rdy can be directly connected FPGA 3.3V input *only* if VCC = 3.3V
--
--
--                            VCC (3.3v)
--                             |
--                    +-----+--+
--	      pwm      rdy |     |  | cmd
--	       |        |  | GND |  |  |
--	       ^  x  x  ^  |  |  |  |  v
--        |  |  |  |  |  |  |  |  |  
--     +--'--'--'--'--'--'--'--'--'--+
--     | 18 17 16 15 14 13 12 11 10  |
--     |                             |
--      >         SPEAKJET IC        |
--     |                             |
--     |  1  2  3  4  5  6  7  8  9  |
--     +--,--,--,--,--,--,--,--,--,--+
--        |  |  |  |  |  |  |  |  |
--        +--+--+--+--+--+--+--+--+
--                                |
--                               GND
--
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity vectrex_speakjet is
port
(
	cpu_clock    : in std_logic;
	clock_25     : in std_logic;
	reset        : in std_logic;

	mode         : in std_logic_vector(1 downto 0); -- "01" for sp0256, else for speakjet
	
	vectrex_serial_byte_out : in std_logic_vector(7 downto 0);
	vectrex_serial_byte_rdy : in std_logic;
				
	speakjet_cmd : out std_logic;  -- serial data to speakjet chip
	speakjet_rdy : in  std_logic;  -- speakjet chip is ready to receive a new cmd
	speakjet_pwm : in  std_logic;  -- speakjet chip audio output
	
	audio_out    : out std_logic_vector(9 downto 0)
);
end vectrex_speakjet;

architecture syn of vectrex_speakjet is
  
 signal speakjet_bd_rate_div     : std_logic_vector( 7 downto 0);
 signal speakjet_serial_bit_cnt  : std_logic_vector( 3 downto 0) := X"0";
 signal speakjet_serial_data_out : std_logic_vector(11 downto 0);

 type array_64_bytes is array(0 to  63) of std_logic_vector(7 downto 0);

 signal sp0256_to_speakjet: array_64_bytes := (
 X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
 X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
 X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
 X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
 
 
 signal speakjet_pwm_d   : std_logic;
 signal speakjet_pwm_dd  : std_logic;
 signal speakjet_pwm_cnt : std_logic_vector(9 downto 0);
	
begin

-- send serial data to speakjet
process (cpu_clock, vectrex_serial_byte_rdy)
begin
	if vectrex_serial_byte_rdy ='0' then
		speakjet_bd_rate_div <= (others => '0');
		speakjet_serial_bit_cnt <= (others => '0');
	else 
		if rising_edge(cpu_clock) then
			if speakjet_bd_rate_div = X"A3" then
				speakjet_bd_rate_div <= (others => '0');
				if speakjet_serial_bit_cnt < X"B" then
					speakjet_serial_bit_cnt <= speakjet_serial_bit_cnt + '1';
				end if;
			else
				speakjet_bd_rate_div <= speakjet_bd_rate_div + '1';
			end if;
		end if;
	end if;
end process;

speakjet_serial_data_out <= 
	  "11"&sp0256_to_speakjet(to_integer(unsigned(vectrex_serial_byte_out(5 downto 0))))&"01" when mode = "01"
else "11"&vectrex_serial_byte_out&"01";

speakjet_cmd <= speakjet_serial_data_out(to_integer(unsigned(speakjet_serial_bit_cnt)));

-- convert speakjet pwm
--
-- ---     --------------
--    |    |||||||||||   |
--     ---------------    ---
--    <----  T=32us ---->  constant
--            (800)
--
--  Max count = 32e-6*25e6 = 800
--
-- 
-- No sound
-- ---           --------
--    |         |        |
--     ---------          ---
--    <- 16us -><- 16us ->
--      (400)     (400)
--
-- Let's assume min is 400-250, max is 400+250
-- (Observed with oscilloscope)

process (clock_25)
begin
	if falling_edge(clock_25) then
		speakjet_pwm_d <= speakjet_pwm;
		speakjet_pwm_dd <= speakjet_pwm_d;
		
		if speakjet_pwm_dd = '1' and speakjet_pwm_d = '0' then
		
			speakjet_pwm_cnt <= (others => '0');
		
			-- limit audio_out between 0 and 650
			if (speakjet_pwm_cnt > 150) and (speakjet_pwm_cnt < 650) then
				audio_out <= speakjet_pwm_cnt-150;
			else
				if (speakjet_pwm_cnt > 150) then
					audio_out <= std_logic_vector(to_unsigned(650,10));
				else
					audio_out <= (others => '0');
				end if;
			end if;
				
		else
			
			if (speakjet_pwm_cnt < ("11"&X"FF")) and (speakjet_pwm = '0') then
				speakjet_pwm_cnt <= speakjet_pwm_cnt + '1';
			end if;
			
		end if;
		
	end if;
end process;	

end syn;
