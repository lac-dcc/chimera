
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity genlock is

    port(clock_pixel : in std_logic;
			vsync  		: in std_logic; -- digital vsync
			hblank 		: in std_logic; -- digital hsync
			adc_rgb	 	: in	unsigned(2 downto 0); -- analog r, g, b
			
			pixel_out	: out unsigned(15 downto 0); -- RRRGGGBB
			row_number	: out unsigned(9 downto 0); 
			col_number	: buffer unsigned(9 downto 0); 
			store_req	: out std_logic := '0';
			store_ack 	: in std_logic;
			artifact		: in std_logic;
			mode 			: in std_logic;
			sync_level	: in std_logic;
			apple2		: in std_logic;
			shrink		: in std_logic;
			offset		: in std_logic;
			dac_step		: in unsigned(2 downto 0);
			bright		: in std_logic;
			digital		: in std_logic;
			wren_pixel	: out std_logic;
			clock_dram  : in std_logic
);
			
end genlock;

architecture behavioral of genlock is

signal vblank: 	std_logic;

signal hcount, vcount							: unsigned(13 downto 0);
signal top_border									: integer := 32;
signal front_porch								: integer := 181;

signal pixel_a: unsigned(8 downto 0);
signal pixel_d: unsigned(8 downto 0);
signal pixel_b: unsigned(8 downto 0);

signal pixel_sel: unsigned(1 downto 0);

signal pixel_adc: unsigned(8 downto 0);

signal artifact_mode: std_logic;

signal black:		unsigned(8 downto 0);
signal brown:		unsigned(8 downto 0);
signal magenta:	unsigned(8 downto 0);
signal orange:		unsigned(8 downto 0);
signal darkblue:	unsigned(8 downto 0);
signal darkgray:	unsigned(8 downto 0);
signal violet:		unsigned(8 downto 0);
signal pink:		unsigned(8 downto 0);
signal darkgreen:	unsigned(8 downto 0);
signal green:		unsigned(8 downto 0);
signal lightgray:	unsigned(8 downto 0);
signal yellow:		unsigned(8 downto 0);
signal mediumblue:unsigned(8 downto 0);
signal aqua:		unsigned(8 downto 0);
signal lightblue:	unsigned(8 downto 0);
signal white:		unsigned(8 downto 0);

signal column: 	integer range 0 to 2048;

function f_adc(adc: unsigned) return unsigned;

function f_adc(adc: unsigned) return unsigned is
variable VALUE : unsigned (2 downto 0); 
begin
		case adc is
		
			when "0000000" => VALUE := "000";
			when "0000001" => VALUE := "001";
			when "0000011" => VALUE := "010";
			when "0000111" => VALUE := "011";
			when "0001111" => VALUE := "100";
			when "0011111" => VALUE := "101";
			when "0111111" => VALUE := "110";
			
			when "0000010" => VALUE := "001";
			
			when "0000100" => VALUE := "001";
			when "0000101" => VALUE := "010";
			when "0000110" => VALUE := "010";
			
			when "0001000" => VALUE := "001";
			when "0001001" => VALUE := "010";
			when "0001010" => VALUE := "010";
			when "0001011" => VALUE := "011";
			when "0001100" => VALUE := "010";
			when "0001101" => VALUE := "011";
			when "0001110" => VALUE := "011";
			
			when "0010000" => VALUE := "001";
			when "0010001" => VALUE := "010";
			when "0010010" => VALUE := "010";
			when "0010011" => VALUE := "011";
			when "0010100" => VALUE := "010";
			when "0010101" => VALUE := "011";
			when "0010110" => VALUE := "011";
			when "0010111" => VALUE := "100";
			when "0011000" => VALUE := "010";
			when "0011001" => VALUE := "011";
			when "0011010" => VALUE := "011";
			when "0011011" => VALUE := "100";
			when "0011100" => VALUE := "011";
			when "0011101" => VALUE := "100";
			when "0011110" => VALUE := "100";
			
			when "0100000" => VALUE := "001";
			when "0100001" => VALUE := "010";
			when "0100010" => VALUE := "010";
			when "0100011" => VALUE := "011";
			when "0100100" => VALUE := "010";
			when "0100101" => VALUE := "011";
			when "0100110" => VALUE := "011";
			when "0100111" => VALUE := "100";
			when "0101000" => VALUE := "010";
			when "0101001" => VALUE := "011";
			when "0101010" => VALUE := "011";
			when "0101011" => VALUE := "100";
			when "0101100" => VALUE := "011";
			when "0101101" => VALUE := "100";
			when "0101110" => VALUE := "100";
			when "0101111" => VALUE := "101";
			when "0110000" => VALUE := "010";
			when "0110001" => VALUE := "011";
			when "0110010" => VALUE := "011";
			when "0110011" => VALUE := "100";
			when "0110100" => VALUE := "011";
			when "0110101" => VALUE := "100";
			when "0110110" => VALUE := "100";
			when "0110111" => VALUE := "101";
			when "0111000" => VALUE := "011";
			when "0111001" => VALUE := "100";
			when "0111010" => VALUE := "100";
			when "0111011" => VALUE := "101"; 
			when "0111100" => VALUE := "100";
			when "0111101" => VALUE := "101";
			when "0111110" => VALUE := "101";
			
			when "1000000" => VALUE := "001";
			when "1000001" => VALUE := "010";
			when "1000010" => VALUE := "010";
			when "1000011" => VALUE := "011";
			when "1000100" => VALUE := "010";
			when "1000101" => VALUE := "011";
			when "1000110" => VALUE := "011";
			when "1000111" => VALUE := "100";
			when "1001000" => VALUE := "010";
			when "1001001" => VALUE := "011";
			when "1001010" => VALUE := "011";
			when "1001011" => VALUE := "100";
			when "1001100" => VALUE := "011";
			when "1001101" => VALUE := "100";
			when "1001110" => VALUE := "100";
			when "1001111" => VALUE := "101";
			when "1010000" => VALUE := "010";
			when "1010001" => VALUE := "011";
			when "1010010" => VALUE := "011";
			when "1010011" => VALUE := "100";
			when "1010100" => VALUE := "011";
			when "1010101" => VALUE := "100";
			when "1010110" => VALUE := "100";
			when "1010111" => VALUE := "101";
			when "1011000" => VALUE := "011";
			when "1011001" => VALUE := "100";
			when "1011010" => VALUE := "100";
			when "1011011" => VALUE := "101";
			when "1011100" => VALUE := "100";
			when "1011101" => VALUE := "101";
			when "1011110" => VALUE := "101";
			when "1011111" => VALUE := "110";
			when "1100000" => VALUE := "010";
			when "1100001" => VALUE := "011";
			when "1100010" => VALUE := "011";
			when "1100011" => VALUE := "100";
			when "1100100" => VALUE := "011";
			when "1100101" => VALUE := "100";
			when "1100110" => VALUE := "100";
			when "1100111" => VALUE := "101";
			when "1101000" => VALUE := "011";
			when "1101001" => VALUE := "100";
			when "1101010" => VALUE := "100";
			when "1101011" => VALUE := "101";
			when "1101100" => VALUE := "100";
			when "1101101" => VALUE := "101";
			when "1101110" => VALUE := "101";
			when "1101111" => VALUE := "110";
			when "1110000" => VALUE := "011";
			when "1110001" => VALUE := "100";
			when "1110010" => VALUE := "100";
			when "1110011" => VALUE := "101";
			when "1110100" => VALUE := "100";
			when "1110101" => VALUE := "101";
			when "1110110" => VALUE := "101";
			when "1110111" => VALUE := "110";
			when "1111000" => VALUE := "100";
			when "1111001" => VALUE := "101";
			when "1111010" => VALUE := "101";
			when "1111011" => VALUE := "110";
			when "1111100" => VALUE := "101";
			when "1111101" => VALUE := "110";
			when "1111110" => VALUE := "110";
	
			when others 	=> VALUE := "111";	

		end case;
		
		return VALUE;
		
end f_adc;


function f_lerp(pattern: unsigned) return unsigned;

function f_lerp(pattern: unsigned) return unsigned is
variable VALUE : unsigned (2 downto 0); 
begin
		case pattern is	
			when	"000000000"	 => VALUE :=	"000";
			when	"000000001"	 => VALUE :=	"000";
			when	"000000010"	 => VALUE :=	"000";
			when	"000000011"	 => VALUE :=	"000";
			when	"000000100"	 => VALUE :=	"001";
			when	"000000101"	 => VALUE :=	"001";
			when	"000000110"	 => VALUE :=	"001";
			when	"000000111"	 => VALUE :=	"001";
			when	"000001000"	 => VALUE :=	"001";
			when	"000001001"	 => VALUE :=	"001";
			when	"000001010"	 => VALUE :=	"001";
			when	"000001011"	 => VALUE :=	"001";
			when	"000001100"	 => VALUE :=	"001";
			when	"000001101"	 => VALUE :=	"010";
			when	"000001110"	 => VALUE :=	"010";
			when	"000001111"	 => VALUE :=	"010";
			when	"000010000"	 => VALUE :=	"010";
			when	"000010001"	 => VALUE :=	"010";
			when	"000010010"	 => VALUE :=	"010";
			when	"000010011"	 => VALUE :=	"010";
			when	"000010100"	 => VALUE :=	"010";
			when	"000010101"	 => VALUE :=	"010";
			when	"000010110"	 => VALUE :=	"011";
			when	"000010111"	 => VALUE :=	"011";
			when	"000011000"	 => VALUE :=	"011";
			when	"000011001"	 => VALUE :=	"011";
			when	"000011010"	 => VALUE :=	"011";
			when	"000011011"	 => VALUE :=	"011";
			when	"000011100"	 => VALUE :=	"011";
			when	"000011101"	 => VALUE :=	"011";
			when	"000011110"	 => VALUE :=	"011";
			when	"000011111"	 => VALUE :=	"100";
			when	"000100000"	 => VALUE :=	"100";
			when	"000100001"	 => VALUE :=	"100";
			when	"000100010"	 => VALUE :=	"100";
			when	"000100011"	 => VALUE :=	"100";
			when	"000100100"	 => VALUE :=	"100";
			when	"000100101"	 => VALUE :=	"100";
			when	"000100110"	 => VALUE :=	"100";
			when	"000100111"	 => VALUE :=	"100";
			when	"000101000"	 => VALUE :=	"100";
			when	"000101001"	 => VALUE :=	"101";
			when	"000101010"	 => VALUE :=	"101";
			when	"000101011"	 => VALUE :=	"101";
			when	"000101100"	 => VALUE :=	"101";
			when	"000101101"	 => VALUE :=	"101";
			when	"000101110"	 => VALUE :=	"101";
			when	"000101111"	 => VALUE :=	"101";
			when	"000110000"	 => VALUE :=	"101";
			when	"000110001"	 => VALUE :=	"101";
			when	"000110010"	 => VALUE :=	"110";
			when	"000110011"	 => VALUE :=	"110";
			when	"000110100"	 => VALUE :=	"110";
			when	"000110101"	 => VALUE :=	"110";
			when	"000110110"	 => VALUE :=	"110";
			when	"000110111"	 => VALUE :=	"110";
			when	"000111000"	 => VALUE :=	"110";
			when	"000111001"	 => VALUE :=	"110";
			when	"000111010"	 => VALUE :=	"110";
			when	"000111011"	 => VALUE :=	"111";
			when	"000111100"	 => VALUE :=	"111";
			when	"000111101"	 => VALUE :=	"111";
			when	"000111110"	 => VALUE :=	"111";
			when	"000111111"	 => VALUE :=	"111";
			when	"001000000"	 => VALUE :=	"000";
			when	"001000001"	 => VALUE :=	"000";
			when	"001000010"	 => VALUE :=	"001";
			when	"001000011"	 => VALUE :=	"001";
			when	"001000100"	 => VALUE :=	"001";
			when	"001000101"	 => VALUE :=	"001";
			when	"001000110"	 => VALUE :=	"010";
			when	"001000111"	 => VALUE :=	"010";
			when	"001001000"	 => VALUE :=	"001";
			when	"001001001"	 => VALUE :=	"001";
			when	"001001010"	 => VALUE :=	"001";
			when	"001001011"	 => VALUE :=	"010";
			when	"001001100"	 => VALUE :=	"010";
			when	"001001101"	 => VALUE :=	"010";
			when	"001001110"	 => VALUE :=	"010";
			when	"001001111"	 => VALUE :=	"011";
			when	"001010000"	 => VALUE :=	"010";
			when	"001010001"	 => VALUE :=	"010";
			when	"001010010"	 => VALUE :=	"010";
			when	"001010011"	 => VALUE :=	"010";
			when	"001010100"	 => VALUE :=	"011";
			when	"001010101"	 => VALUE :=	"011";
			when	"001010110"	 => VALUE :=	"011";
			when	"001010111"	 => VALUE :=	"011";
			when	"001011000"	 => VALUE :=	"010";
			when	"001011001"	 => VALUE :=	"011";
			when	"001011010"	 => VALUE :=	"011";
			when	"001011011"	 => VALUE :=	"011";
			when	"001011100"	 => VALUE :=	"011";
			when	"001011101"	 => VALUE :=	"100";
			when	"001011110"	 => VALUE :=	"100";
			when	"001011111"	 => VALUE :=	"100";
			when	"001100000"	 => VALUE :=	"011";
			when	"001100001"	 => VALUE :=	"011";
			when	"001100010"	 => VALUE :=	"100";
			when	"001100011"	 => VALUE :=	"100";
			when	"001100100"	 => VALUE :=	"100";
			when	"001100101"	 => VALUE :=	"100";
			when	"001100110"	 => VALUE :=	"101";
			when	"001100111"	 => VALUE :=	"101";
			when	"001101000"	 => VALUE :=	"100";
			when	"001101001"	 => VALUE :=	"100";
			when	"001101010"	 => VALUE :=	"100";
			when	"001101011"	 => VALUE :=	"101";
			when	"001101100"	 => VALUE :=	"101";
			when	"001101101"	 => VALUE :=	"101";
			when	"001101110"	 => VALUE :=	"101";
			when	"001101111"	 => VALUE :=	"110";
			when	"001110000"	 => VALUE :=	"101";
			when	"001110001"	 => VALUE :=	"101";
			when	"001110010"	 => VALUE :=	"101";
			when	"001110011"	 => VALUE :=	"101";
			when	"001110100"	 => VALUE :=	"110";
			when	"001110101"	 => VALUE :=	"110";
			when	"001110110"	 => VALUE :=	"110";
			when	"001110111"	 => VALUE :=	"110";
			when	"001111000"	 => VALUE :=	"101";
			when	"001111001"	 => VALUE :=	"110";
			when	"001111010"	 => VALUE :=	"110";
			when	"001111011"	 => VALUE :=	"110";
			when	"001111100"	 => VALUE :=	"110";
			when	"001111101"	 => VALUE :=	"111";
			when	"001111110"	 => VALUE :=	"111";
			when	"001111111"	 => VALUE :=	"111";
			when	"010000000"	 => VALUE :=	"000";
			when	"010000001"	 => VALUE :=	"000";
			when	"010000010"	 => VALUE :=	"001";
			when	"010000011"	 => VALUE :=	"001";
			when	"010000100"	 => VALUE :=	"010";
			when	"010000101"	 => VALUE :=	"010";
			when	"010000110"	 => VALUE :=	"010";
			when	"010000111"	 => VALUE :=	"011";
			when	"010001000"	 => VALUE :=	"001";
			when	"010001001"	 => VALUE :=	"001";
			when	"010001010"	 => VALUE :=	"001";
			when	"010001011"	 => VALUE :=	"010";
			when	"010001100"	 => VALUE :=	"010";
			when	"010001101"	 => VALUE :=	"011";
			when	"010001110"	 => VALUE :=	"011";
			when	"010001111"	 => VALUE :=	"011";
			when	"010010000"	 => VALUE :=	"001";
			when	"010010001"	 => VALUE :=	"010";
			when	"010010010"	 => VALUE :=	"010";
			when	"010010011"	 => VALUE :=	"010";
			when	"010010100"	 => VALUE :=	"011";
			when	"010010101"	 => VALUE :=	"011";
			when	"010010110"	 => VALUE :=	"100";
			when	"010010111"	 => VALUE :=	"100";
			when	"010011000"	 => VALUE :=	"010";
			when	"010011001"	 => VALUE :=	"010";
			when	"010011010"	 => VALUE :=	"011";
			when	"010011011"	 => VALUE :=	"011";
			when	"010011100"	 => VALUE :=	"011";
			when	"010011101"	 => VALUE :=	"100";
			when	"010011110"	 => VALUE :=	"100";
			when	"010011111"	 => VALUE :=	"101";
			when	"010100000"	 => VALUE :=	"011";
			when	"010100001"	 => VALUE :=	"011";
			when	"010100010"	 => VALUE :=	"011";
			when	"010100011"	 => VALUE :=	"100";
			when	"010100100"	 => VALUE :=	"100";
			when	"010100101"	 => VALUE :=	"100";
			when	"010100110"	 => VALUE :=	"101";
			when	"010100111"	 => VALUE :=	"101";
			when	"010101000"	 => VALUE :=	"011";
			when	"010101001"	 => VALUE :=	"100";
			when	"010101010"	 => VALUE :=	"100";
			when	"010101011"	 => VALUE :=	"100";
			when	"010101100"	 => VALUE :=	"101";
			when	"010101101"	 => VALUE :=	"101";
			when	"010101110"	 => VALUE :=	"101";
			when	"010101111"	 => VALUE :=	"110";
			when	"010110000"	 => VALUE :=	"100";
			when	"010110001"	 => VALUE :=	"100";
			when	"010110010"	 => VALUE :=	"101";
			when	"010110011"	 => VALUE :=	"101";
			when	"010110100"	 => VALUE :=	"101";
			when	"010110101"	 => VALUE :=	"110";
			when	"010110110"	 => VALUE :=	"110";
			when	"010110111"	 => VALUE :=	"110";
			when	"010111000"	 => VALUE :=	"100";
			when	"010111001"	 => VALUE :=	"101";
			when	"010111010"	 => VALUE :=	"101";
			when	"010111011"	 => VALUE :=	"110";
			when	"010111100"	 => VALUE :=	"110";
			when	"010111101"	 => VALUE :=	"110";
			when	"010111110"	 => VALUE :=	"111";
			when	"010111111"	 => VALUE :=	"111";
			when	"011000000"	 => VALUE :=	"000";
			when	"011000001"	 => VALUE :=	"001";
			when	"011000010"	 => VALUE :=	"001";
			when	"011000011"	 => VALUE :=	"010";
			when	"011000100"	 => VALUE :=	"010";
			when	"011000101"	 => VALUE :=	"011";
			when	"011000110"	 => VALUE :=	"011";
			when	"011000111"	 => VALUE :=	"100";
			when	"011001000"	 => VALUE :=	"001";
			when	"011001001"	 => VALUE :=	"001";
			when	"011001010"	 => VALUE :=	"010";
			when	"011001011"	 => VALUE :=	"010";
			when	"011001100"	 => VALUE :=	"011";
			when	"011001101"	 => VALUE :=	"011";
			when	"011001110"	 => VALUE :=	"100";
			when	"011001111"	 => VALUE :=	"100";
			when	"011010000"	 => VALUE :=	"001";
			when	"011010001"	 => VALUE :=	"010";
			when	"011010010"	 => VALUE :=	"010";
			when	"011010011"	 => VALUE :=	"011";
			when	"011010100"	 => VALUE :=	"011";
			when	"011010101"	 => VALUE :=	"100";
			when	"011010110"	 => VALUE :=	"100";
			when	"011010111"	 => VALUE :=	"101";
			when	"011011000"	 => VALUE :=	"010";
			when	"011011001"	 => VALUE :=	"010";
			when	"011011010"	 => VALUE :=	"011";
			when	"011011011"	 => VALUE :=	"011";
			when	"011011100"	 => VALUE :=	"100";
			when	"011011101"	 => VALUE :=	"100";
			when	"011011110"	 => VALUE :=	"101";
			when	"011011111"	 => VALUE :=	"101";
			when	"011100000"	 => VALUE :=	"010";
			when	"011100001"	 => VALUE :=	"011";
			when	"011100010"	 => VALUE :=	"011";
			when	"011100011"	 => VALUE :=	"100";
			when	"011100100"	 => VALUE :=	"100";
			when	"011100101"	 => VALUE :=	"101";
			when	"011100110"	 => VALUE :=	"101";
			when	"011100111"	 => VALUE :=	"110";
			when	"011101000"	 => VALUE :=	"011";
			when	"011101001"	 => VALUE :=	"011";
			when	"011101010"	 => VALUE :=	"100";
			when	"011101011"	 => VALUE :=	"100";
			when	"011101100"	 => VALUE :=	"101";
			when	"011101101"	 => VALUE :=	"101";
			when	"011101110"	 => VALUE :=	"110";
			when	"011101111"	 => VALUE :=	"110";
			when	"011110000"	 => VALUE :=	"011";
			when	"011110001"	 => VALUE :=	"100";
			when	"011110010"	 => VALUE :=	"100";
			when	"011110011"	 => VALUE :=	"101";
			when	"011110100"	 => VALUE :=	"101";
			when	"011110101"	 => VALUE :=	"110";
			when	"011110110"	 => VALUE :=	"110";
			when	"011110111"	 => VALUE :=	"111";
			when	"011111000"	 => VALUE :=	"100";
			when	"011111001"	 => VALUE :=	"100";
			when	"011111010"	 => VALUE :=	"101";
			when	"011111011"	 => VALUE :=	"101";
			when	"011111100"	 => VALUE :=	"110";
			when	"011111101"	 => VALUE :=	"110";
			when	"011111110"	 => VALUE :=	"111";
			when	"011111111"	 => VALUE :=	"111";
			when	"100000000"	 => VALUE :=	"000";
			when	"100000001"	 => VALUE :=	"001";
			when	"100000010"	 => VALUE :=	"001";
			when	"100000011"	 => VALUE :=	"010";
			when	"100000100"	 => VALUE :=	"011";
			when	"100000101"	 => VALUE :=	"011";
			when	"100000110"	 => VALUE :=	"100";
			when	"100000111"	 => VALUE :=	"100";
			when	"100001000"	 => VALUE :=	"000";
			when	"100001001"	 => VALUE :=	"001";
			when	"100001010"	 => VALUE :=	"010";
			when	"100001011"	 => VALUE :=	"010";
			when	"100001100"	 => VALUE :=	"011";
			when	"100001101"	 => VALUE :=	"100";
			when	"100001110"	 => VALUE :=	"100";
			when	"100001111"	 => VALUE :=	"101";
			when	"100010000"	 => VALUE :=	"001";
			when	"100010001"	 => VALUE :=	"001";
			when	"100010010"	 => VALUE :=	"010";
			when	"100010011"	 => VALUE :=	"011";
			when	"100010100"	 => VALUE :=	"011";
			when	"100010101"	 => VALUE :=	"100";
			when	"100010110"	 => VALUE :=	"101";
			when	"100010111"	 => VALUE :=	"101";
			when	"100011000"	 => VALUE :=	"001";
			when	"100011001"	 => VALUE :=	"010";
			when	"100011010"	 => VALUE :=	"010";
			when	"100011011"	 => VALUE :=	"011";
			when	"100011100"	 => VALUE :=	"100";
			when	"100011101"	 => VALUE :=	"100";
			when	"100011110"	 => VALUE :=	"101";
			when	"100011111"	 => VALUE :=	"110";
			when	"100100000"	 => VALUE :=	"010";
			when	"100100001"	 => VALUE :=	"010";
			when	"100100010"	 => VALUE :=	"011";
			when	"100100011"	 => VALUE :=	"011";
			when	"100100100"	 => VALUE :=	"100";
			when	"100100101"	 => VALUE :=	"101";
			when	"100100110"	 => VALUE :=	"101";
			when	"100100111"	 => VALUE :=	"110";
			when	"100101000"	 => VALUE :=	"010";
			when	"100101001"	 => VALUE :=	"011";
			when	"100101010"	 => VALUE :=	"011";
			when	"100101011"	 => VALUE :=	"100";
			when	"100101100"	 => VALUE :=	"100";
			when	"100101101"	 => VALUE :=	"101";
			when	"100101110"	 => VALUE :=	"110";
			when	"100101111"	 => VALUE :=	"110";
			when	"100110000"	 => VALUE :=	"010";
			when	"100110001"	 => VALUE :=	"011";
			when	"100110010"	 => VALUE :=	"100";
			when	"100110011"	 => VALUE :=	"100";
			when	"100110100"	 => VALUE :=	"101";
			when	"100110101"	 => VALUE :=	"101";
			when	"100110110"	 => VALUE :=	"110";
			when	"100110111"	 => VALUE :=	"111";
			when	"100111000"	 => VALUE :=	"011";
			when	"100111001"	 => VALUE :=	"011";
			when	"100111010"	 => VALUE :=	"100";
			when	"100111011"	 => VALUE :=	"101";
			when	"100111100"	 => VALUE :=	"101";
			when	"100111101"	 => VALUE :=	"110";
			when	"100111110"	 => VALUE :=	"110";
			when	"100111111"	 => VALUE :=	"111";
			when	"101000000"	 => VALUE :=	"000";
			when	"101000001"	 => VALUE :=	"001";
			when	"101000010"	 => VALUE :=	"010";
			when	"101000011"	 => VALUE :=	"010";
			when	"101000100"	 => VALUE :=	"011";
			when	"101000101"	 => VALUE :=	"100";
			when	"101000110"	 => VALUE :=	"101";
			when	"101000111"	 => VALUE :=	"101";
			when	"101001000"	 => VALUE :=	"000";
			when	"101001001"	 => VALUE :=	"001";
			when	"101001010"	 => VALUE :=	"010";
			when	"101001011"	 => VALUE :=	"011";
			when	"101001100"	 => VALUE :=	"011";
			when	"101001101"	 => VALUE :=	"100";
			when	"101001110"	 => VALUE :=	"101";
			when	"101001111"	 => VALUE :=	"110";
			when	"101010000"	 => VALUE :=	"001";
			when	"101010001"	 => VALUE :=	"001";
			when	"101010010"	 => VALUE :=	"010";
			when	"101010011"	 => VALUE :=	"011";
			when	"101010100"	 => VALUE :=	"100";
			when	"101010101"	 => VALUE :=	"100";
			when	"101010110"	 => VALUE :=	"101";
			when	"101010111"	 => VALUE :=	"110";
			when	"101011000"	 => VALUE :=	"001";
			when	"101011001"	 => VALUE :=	"010";
			when	"101011010"	 => VALUE :=	"010";
			when	"101011011"	 => VALUE :=	"011";
			when	"101011100"	 => VALUE :=	"100";
			when	"101011101"	 => VALUE :=	"101";
			when	"101011110"	 => VALUE :=	"101";
			when	"101011111"	 => VALUE :=	"110";
			when	"101100000"	 => VALUE :=	"001";
			when	"101100001"	 => VALUE :=	"010";
			when	"101100010"	 => VALUE :=	"011";
			when	"101100011"	 => VALUE :=	"011";
			when	"101100100"	 => VALUE :=	"100";
			when	"101100101"	 => VALUE :=	"101";
			when	"101100110"	 => VALUE :=	"110";
			when	"101100111"	 => VALUE :=	"110";
			when	"101101000"	 => VALUE :=	"001";
			when	"101101001"	 => VALUE :=	"010";
			when	"101101010"	 => VALUE :=	"011";
			when	"101101011"	 => VALUE :=	"100";
			when	"101101100"	 => VALUE :=	"100";
			when	"101101101"	 => VALUE :=	"101";
			when	"101101110"	 => VALUE :=	"110";
			when	"101101111"	 => VALUE :=	"111";
			when	"101110000"	 => VALUE :=	"010";
			when	"101110001"	 => VALUE :=	"010";
			when	"101110010"	 => VALUE :=	"011";
			when	"101110011"	 => VALUE :=	"100";
			when	"101110100"	 => VALUE :=	"101";
			when	"101110101"	 => VALUE :=	"101";
			when	"101110110"	 => VALUE :=	"110";
			when	"101110111"	 => VALUE :=	"111";
			when	"101111000"	 => VALUE :=	"010";
			when	"101111001"	 => VALUE :=	"011";
			when	"101111010"	 => VALUE :=	"011";
			when	"101111011"	 => VALUE :=	"100";
			when	"101111100"	 => VALUE :=	"101";
			when	"101111101"	 => VALUE :=	"110";
			when	"101111110"	 => VALUE :=	"110";
			when	"101111111"	 => VALUE :=	"111";
			when	"110000000"	 => VALUE :=	"000";
			when	"110000001"	 => VALUE :=	"001";
			when	"110000010"	 => VALUE :=	"010";
			when	"110000011"	 => VALUE :=	"011";
			when	"110000100"	 => VALUE :=	"100";
			when	"110000101"	 => VALUE :=	"100";
			when	"110000110"	 => VALUE :=	"101";
			when	"110000111"	 => VALUE :=	"110";
			when	"110001000"	 => VALUE :=	"000";
			when	"110001001"	 => VALUE :=	"001";
			when	"110001010"	 => VALUE :=	"010";
			when	"110001011"	 => VALUE :=	"011";
			when	"110001100"	 => VALUE :=	"100";
			when	"110001101"	 => VALUE :=	"101";
			when	"110001110"	 => VALUE :=	"101";
			when	"110001111"	 => VALUE :=	"110";
			when	"110010000"	 => VALUE :=	"000";
			when	"110010001"	 => VALUE :=	"001";
			when	"110010010"	 => VALUE :=	"010";
			when	"110010011"	 => VALUE :=	"011";
			when	"110010100"	 => VALUE :=	"100";
			when	"110010101"	 => VALUE :=	"101";
			when	"110010110"	 => VALUE :=	"110";
			when	"110010111"	 => VALUE :=	"110";
			when	"110011000"	 => VALUE :=	"000";
			when	"110011001"	 => VALUE :=	"001";
			when	"110011010"	 => VALUE :=	"010";
			when	"110011011"	 => VALUE :=	"011";
			when	"110011100"	 => VALUE :=	"100";
			when	"110011101"	 => VALUE :=	"101";
			when	"110011110"	 => VALUE :=	"110";
			when	"110011111"	 => VALUE :=	"111";
			when	"110100000"	 => VALUE :=	"001";
			when	"110100001"	 => VALUE :=	"001";
			when	"110100010"	 => VALUE :=	"010";
			when	"110100011"	 => VALUE :=	"011";
			when	"110100100"	 => VALUE :=	"100";
			when	"110100101"	 => VALUE :=	"101";
			when	"110100110"	 => VALUE :=	"110";
			when	"110100111"	 => VALUE :=	"111";
			when	"110101000"	 => VALUE :=	"001";
			when	"110101001"	 => VALUE :=	"010";
			when	"110101010"	 => VALUE :=	"010";
			when	"110101011"	 => VALUE :=	"011";
			when	"110101100"	 => VALUE :=	"100";
			when	"110101101"	 => VALUE :=	"101";
			when	"110101110"	 => VALUE :=	"110";
			when	"110101111"	 => VALUE :=	"111";
			when	"110110000"	 => VALUE :=	"001";
			when	"110110001"	 => VALUE :=	"010";
			when	"110110010"	 => VALUE :=	"011";
			when	"110110011"	 => VALUE :=	"011";
			when	"110110100"	 => VALUE :=	"100";
			when	"110110101"	 => VALUE :=	"101";
			when	"110110110"	 => VALUE :=	"110";
			when	"110110111"	 => VALUE :=	"111";
			when	"110111000"	 => VALUE :=	"001";
			when	"110111001"	 => VALUE :=	"010";
			when	"110111010"	 => VALUE :=	"011";
			when	"110111011"	 => VALUE :=	"100";
			when	"110111100"	 => VALUE :=	"100";
			when	"110111101"	 => VALUE :=	"101";
			when	"110111110"	 => VALUE :=	"110";
			when	"110111111"	 => VALUE :=	"111";
			when	"111000000"	 => VALUE :=	"000";
			when	"111000001"	 => VALUE :=	"001";
			when	"111000010"	 => VALUE :=	"010";
			when	"111000011"	 => VALUE :=	"011";
			when	"111000100"	 => VALUE :=	"100";
			when	"111000101"	 => VALUE :=	"101";
			when	"111000110"	 => VALUE :=	"110";
			when	"111000111"	 => VALUE :=	"111";
			when	"111001000"	 => VALUE :=	"000";
			when	"111001001"	 => VALUE :=	"001";
			when	"111001010"	 => VALUE :=	"010";
			when	"111001011"	 => VALUE :=	"011";
			when	"111001100"	 => VALUE :=	"100";
			when	"111001101"	 => VALUE :=	"101";
			when	"111001110"	 => VALUE :=	"110";
			when	"111001111"	 => VALUE :=	"111";
			when	"111010000"	 => VALUE :=	"000";
			when	"111010001"	 => VALUE :=	"001";
			when	"111010010"	 => VALUE :=	"010";
			when	"111010011"	 => VALUE :=	"011";
			when	"111010100"	 => VALUE :=	"100";
			when	"111010101"	 => VALUE :=	"101";
			when	"111010110"	 => VALUE :=	"110";
			when	"111010111"	 => VALUE :=	"111";
			when	"111011000"	 => VALUE :=	"000";
			when	"111011001"	 => VALUE :=	"001";
			when	"111011010"	 => VALUE :=	"010";
			when	"111011011"	 => VALUE :=	"011";
			when	"111011100"	 => VALUE :=	"100";
			when	"111011101"	 => VALUE :=	"101";
			when	"111011110"	 => VALUE :=	"110";
			when	"111011111"	 => VALUE :=	"111";
			when	"111100000"	 => VALUE :=	"000";
			when	"111100001"	 => VALUE :=	"001";
			when	"111100010"	 => VALUE :=	"010";
			when	"111100011"	 => VALUE :=	"011";
			when	"111100100"	 => VALUE :=	"100";
			when	"111100101"	 => VALUE :=	"101";
			when	"111100110"	 => VALUE :=	"110";
			when	"111100111"	 => VALUE :=	"111";
			when	"111101000"	 => VALUE :=	"000";
			when	"111101001"	 => VALUE :=	"001";
			when	"111101010"	 => VALUE :=	"010";
			when	"111101011"	 => VALUE :=	"011";
			when	"111101100"	 => VALUE :=	"100";
			when	"111101101"	 => VALUE :=	"101";
			when	"111101110"	 => VALUE :=	"110";
			when	"111101111"	 => VALUE :=	"111";
			when	"111110000"	 => VALUE :=	"000";
			when	"111110001"	 => VALUE :=	"001";
			when	"111110010"	 => VALUE :=	"010";
			when	"111110011"	 => VALUE :=	"011";
			when	"111110100"	 => VALUE :=	"100";
			when	"111110101"	 => VALUE :=	"101";
			when	"111110110"	 => VALUE :=	"110";
			when	"111110111"	 => VALUE :=	"111";
			when	"111111000"	 => VALUE :=	"000";
			when	"111111001"	 => VALUE :=	"001";
			when	"111111010"	 => VALUE :=	"010";
			when	"111111011"	 => VALUE :=	"011";
			when	"111111100"	 => VALUE :=	"100";
			when	"111111101"	 => VALUE :=	"101";
			when	"111111110"	 => VALUE :=	"110";
			when	others		 => VALUE :=	"111";

		end case;		
		return VALUE;
		
end f_lerp;	

begin

channel_red: process(clock_pixel, hcount, dac_step)
variable red_adc: unsigned(7 downto 0);
begin
	if (rising_edge(clock_pixel)) then		
		--wait until (clock_pixel'event and clock_pixel='1' and hcount(2 downto 0) = dac_step); 
		red_adc(to_integer(hcount(2 downto 0))) := adc_rgb(2);
		pixel_adc(8 downto 6) <= f_adc(red_adc(6 downto 0));
	end if;

end process;

channel_green: process(clock_pixel, hcount, dac_step)
variable green_adc: unsigned(7 downto 0);
begin
	if (rising_edge(clock_pixel)) then		
		--wait until (clock_pixel'event and clock_pixel='1' and hcount(2 downto 0) = dac_step); 
		green_adc(to_integer(hcount(2 downto 0))) := adc_rgb(1);
		pixel_adc(5 downto 3) <= f_adc(green_adc(6 downto 0));
	end if;
end process;

channel_blue: process(clock_pixel, hcount, dac_step)
variable blue_adc: unsigned(7 downto 0);
begin
	if (rising_edge(clock_pixel)) then		
		--wait until (clock_pixel'event and clock_pixel='1' and hcount(2 downto 0) = dac_step); 
		blue_adc(to_integer(hcount(2 downto 0))) := adc_rgb(0);
		pixel_adc(2 downto 0) <= f_adc(blue_adc(6 downto 0)); 
	end if;
end process;

hraster: process (clock_pixel, hblank, vblank)
begin
	if (hblank = '0' or vblank = '0') then
		hcount <= (others => '0');
	elsif (rising_edge(clock_pixel)) then
		hcount <= hcount + 1;		
	end if;
end process;

col_counter: process(clock_pixel, hcount, hblank, vblank)
begin
	if (hblank = '0' or vblank = '0') then
		column <= 0;
	elsif (rising_edge(clock_pixel)) then
		if (hcount(2 downto 0) = "111") then
			if (shrink = '1' or hcount(5 downto 3) /= "111") then
				column <= column + 1;
			end if;
		end if;		
	end if;		
end process;
		

vsync_lock: process(clock_pixel, vsync)
variable sync: std_logic;
begin	
	if (rising_edge(clock_pixel)) then		

		vblank <= '1'; 					
		if (vsync = sync_level and vcount > 261) then
		
			if (vcount > 290) then
					top_border <= 42;
			else
				top_border <= 16;
			end if;	
			
			vblank <= '0';
		end if;								
	end if;	

end process;

vraster: process (clock_pixel, vblank)
begin
	if (vblank = '0') then 
			vcount <= (others => '0');
	elsif(rising_edge(clock_pixel)) then
		if hblank = '0' then
			vcount <= vcount + 1;
		end if;
	end if;
end process;

detect_artifact: process(clock_pixel, hblank, hcount)
begin
	if (hblank = '0') then
		artifact_mode <= '1';	
	elsif (rising_edge(clock_pixel)) then	
		if (apple2 = '1') then
				if (column  < front_porch) then		
					-- out of active window. if coco2/coco3 check for white border to activate artifacting
					if (pixel_adc = "111111111") then
						artifact_mode <= artifact;
					end if;
				end if;
		else
				artifact_mode <= artifact;		
		end if;		
	end if;
end process;

process_b: process--(clock_pixel, hcount, dac_step, col_number)
variable a_pixel: unsigned(8 downto 0);
variable p_pixel: unsigned(8 downto 0);
variable n_pixel: unsigned(8 downto 0);
begin

	wait until (clock_pixel'event and clock_pixel='1' and hcount(2 downto 0) = "111"); 
--if (rising_edge(clock_pixel)) then

	--if (hcount(2 downto 0) = "111" and dac_step(2 downto 0) = "111") then
	--if (hcount(2 downto 0) = dac_step(2 downto 0)) then
	--if (hcount(2 downto 0) = "111") then
		
		if (to_integer(pixel_adc(5 downto 3)) > 4) then
			a_pixel := "111111111"; 
		else
			a_pixel := "000000000";
		end if;
		
		if (shrink = '0') then
			n_pixel(8 downto 6) := f_lerp(hcount(5 downto 3) & p_pixel(8 downto 6) & a_pixel(8 downto 6));
			n_pixel(5 downto 3) := f_lerp(hcount(5 downto 3) & p_pixel(5 downto 3) & a_pixel(5 downto 3));
			n_pixel(2 downto 0) := f_lerp(hcount(5 downto 3) & p_pixel(2 downto 0) & a_pixel(2 downto 0));	
		else				
			n_pixel := a_pixel;
		end if;		
		
		pixel_b <= n_pixel;
		
		p_pixel := a_pixel;	
	
	--end if;

--end if;
		
end process;

process_d: process --(clock_pixel, hcount, dac_step, col_number)
variable pixel: unsigned(3 downto 0);
variable a_pixel: unsigned(8 downto 0);
variable p_pixel: unsigned(8 downto 0);
variable n_pixel: unsigned(8 downto 0);
begin

	wait until (clock_pixel'event and clock_pixel='1' and hcount(2 downto 0) = "111"); 

--if (rising_edge(clock_pixel)) then

	--if (hcount(2 downto 0) = dac_step(2 downto 0)) then
	--if (hcount(2 downto 0) = "111" and dac_step(2 downto 0) = "111") then
	--if (hcount(2 downto 0) = "111") then

		--wait until (clock_pixel'event and clock_pixel='1' and hcount(2 downto 0) = "100" and dac_step(2 downto 0) = "100"); 
			
				pixel(3 downto 1) := pixel(2 downto 0);
				-- pixel shifting for apple2/coco3 artifact
				if (to_integer(pixel_adc(5 downto 3)) > 4) then
					pixel(0) := '1'; 
				else
					pixel(0) := '0';
				end if;	
													
				if (hcount(3) = '0') then
					-- even rows					
					--	APPLE ][ NTSC ARTIFACT COLOUR TABLE					
					--	|00|11|00|11|00|11   hcount(4)
					--	|01|01|01|01|01|01   hcount(3)
					--	+------------------+------
					--	|00|00|00|00|00|00 - black
					--	|00|01|00|01|00|01 - brown
					--	|10|00|10|00|10|00 - magenta
					--	|10|01|10|01|10|01 - orange
					--	|01|00|01|00|01|00 - darkblue
					--	|01|01|01|01|01|01 - darkgray
					--	|11|00|11|00|11|00 - violet
					--	|11|01|11|01|11|01 - pink
					--	|00|10|00|10|00|10 - darkgreen
					--	|00|11|00|11|00|11 - green
					--	|10|10|10|10|10|10 - lightgray
					--	|10|11|10|11|10|11 - yellow
					--	|01|10|01|10|01|10 - mediumblue
					--	|01|11|01|11|01|11 - aqua
					--	|11|10|11|10|11|10 - lightblue 
					--	|11|11|11|11|11|11 - white								
					
					--	COCO2/COCO3 PMODE4 NTSC ARTIFACT COLOUR TABLE					
					--	|00|11|00|11|00|11   hcount(4)
					--	|01|01|01|01|01|01   hcount(3)
					--	+------------------+------
					--	|00|00|00|00|00|00 - black					
					--	|00|11|00|11|00|11 - medium blue
					--	|11|00|11|00|11|00 - orange
					--	|11|11|11|11|11|11 - white
					
					if (hcount(4) = '0') then
						-- decode colour by the last 4-bit pattern
							case (pixel) is
								when "0000" => a_pixel := black;
								when "0100" => a_pixel := brown;
								when "0010" => a_pixel := magenta;
								when "0110" => a_pixel := orange;
								when "0001" => a_pixel := darkblue;
								when "0101" => a_pixel := darkgray;
								when "0011" => a_pixel := violet;
								when "0111" => a_pixel := pink;
								when "1000" => a_pixel := darkgreen;
								when "1100" => a_pixel := green;
								when "1010" => a_pixel := lightgray;
								when "1110" => a_pixel := yellow;				
								when "1001" => a_pixel := mediumblue;
								when "1101" => a_pixel := aqua;
								when "1011" => a_pixel := lightblue;
								when others => a_pixel := white;      
								
							end case;
					else
							case (pixel) is
								when "0000" => a_pixel := black;
								when "0001" => a_pixel := brown;
								when "1000" => a_pixel := magenta;
								when "1001" => a_pixel := orange;
								when "0100" => a_pixel := darkblue;
								when "0101" => a_pixel := darkgray;
								when "1100" => a_pixel := violet;
								when "1101" => a_pixel := pink;
								when "0010" => a_pixel := darkgreen;
								when "0011" => a_pixel := green;
								when "1010" => a_pixel := lightgray;
								when "1011" => a_pixel := yellow;				
								when "0110" => a_pixel := mediumblue;
								when "0111" => a_pixel := aqua;
								when "1110" => a_pixel := lightblue;
								when others => a_pixel := white;      
							end case;
					end if;								
				else
					-- odd rows
					if (hcount(4) = '0') then
							-- decode colour by the last 4-bit pattern
							case (pixel) is
								when "0000" => a_pixel := black;
								when "1000" => a_pixel := brown;
								when "0100" => a_pixel := magenta;
								when "1100" => a_pixel := orange;
								when "0010" => a_pixel := darkblue;
								when "1010" => a_pixel := darkgray;
								when "0110" => a_pixel := violet;
								when "1110" => a_pixel := pink;
								when "0001" => a_pixel := darkgreen;
								when "1001" => a_pixel := green;
								when "0101" => a_pixel := lightgray;
								when "1101" => a_pixel := yellow;					
								when "0011" => a_pixel := mediumblue;
								when "1011" => a_pixel := aqua;
								when "0111" => a_pixel := lightblue;
								when others => a_pixel := white;      
							end case;										
					else
							case (pixel) is
								when "0000" => a_pixel := black;
								when "0010" => a_pixel := brown;
								when "0001" => a_pixel := magenta;
								when "0011" => a_pixel := orange;
								when "1000" => a_pixel := darkblue;
								when "1010" => a_pixel := darkgray;
								when "1001" => a_pixel := violet;
								when "1011" => a_pixel := pink;
								when "0100" => a_pixel := darkgreen;
								when "0110" => a_pixel := green;
								when "0101" => a_pixel := lightgray;
								when "0111" => a_pixel := yellow;			
								when "1100" => a_pixel := mediumblue;
								when "1110" => a_pixel := aqua;
								when "1101" => a_pixel := lightblue;
								when others => a_pixel := white;      
							end case;
					end if;
				end if;			
				
				if (shrink = '0') then
					n_pixel(8 downto 6) := f_lerp(hcount(5 downto 3) & p_pixel(8 downto 6) & a_pixel(8 downto 6));
					n_pixel(5 downto 3) := f_lerp(hcount(5 downto 3) & p_pixel(5 downto 3) & a_pixel(5 downto 3));
					n_pixel(2 downto 0) := f_lerp(hcount(5 downto 3) & p_pixel(2 downto 0) & a_pixel(2 downto 0));						
					n_pixel(0) := '0';
				else				

					if (p_pixel = "000000000" or p_pixel = "111111111") then
						n_pixel(8 downto 6) := f_lerp("010" & p_pixel(8 downto 6) & a_pixel(8 downto 6));
						n_pixel(5 downto 3) := f_lerp("010" & p_pixel(5 downto 3) & a_pixel(5 downto 3));
						n_pixel(2 downto 0) := f_lerp("010" & p_pixel(2 downto 0) & a_pixel(2 downto 0));					
					elsif (a_pixel = "000000000" or a_pixel = "111111111") then
						n_pixel(8 downto 6) := f_lerp("101" & p_pixel(8 downto 6) & a_pixel(8 downto 6));
						n_pixel(5 downto 3) := f_lerp("101" & p_pixel(5 downto 3) & a_pixel(5 downto 3));
						n_pixel(2 downto 0) := f_lerp("101" & p_pixel(2 downto 0) & a_pixel(2 downto 0));					
					else					
						n_pixel(8 downto 6) := f_lerp("100" & p_pixel(8 downto 6) & a_pixel(8 downto 6));
						n_pixel(5 downto 3) := f_lerp("100" & p_pixel(5 downto 3) & a_pixel(5 downto 3));
						n_pixel(2 downto 0) := f_lerp("100" & p_pixel(2 downto 0) & a_pixel(2 downto 0));					
					end if;


				end if;

				pixel_d <= n_pixel;
				
				p_pixel := a_pixel;			
				
		--end if;
	
--end if;				
				
end process;

process_a: process --(clock_pixel, hcount, dac_step, col_number)
variable c_pixel: unsigned(8 downto 0);
variable p_pixel: unsigned(8 downto 0);
variable n_pixel: unsigned(8 downto 0);
variable col: integer;
begin

	wait until (clock_pixel'event and clock_pixel='1' and hcount(2 downto 0) = "111"); 
--if (rising_edge(clock_pixel)) then

	--if (hcount(2 downto 0) = "111" and dac_step(2 downto 0) = "111") then
	--if (hcount(2 downto 0) = dac_step(2 downto 0)) then
	--if (hcount(2 downto 0) = "111") then

		c_pixel := pixel_adc;
			
		if (digital = '0') then
			
			c_pixel := (others => '0');
			
			if (to_integer(pixel_adc(8 downto 6)) > 4) then
				c_pixel(8 downto 6) := "111";
			end if;
			if (to_integer(pixel_adc(5 downto 3)) > 4) then
				c_pixel(5 downto 3) := "111";
			end if;
			if (to_integer(pixel_adc(2 downto 0)) > 4) then
				c_pixel(2 downto 0) := "111";
			end if;
						
			c_pixel := c_pixel and '1'&bright&'1' & '1'&bright&'1' & '1'&bright&'1';
			
		end if;
		
		if (shrink = '0') then
			n_pixel(8 downto 6) := f_lerp(hcount(5 downto 3) & p_pixel(8 downto 6) & c_pixel(8 downto 6));
			n_pixel(5 downto 3) := f_lerp(hcount(5 downto 3) & p_pixel(5 downto 3) & c_pixel(5 downto 3));
			n_pixel(2 downto 0) := f_lerp(hcount(5 downto 3) & p_pixel(2 downto 0) & c_pixel(2 downto 0));		
		else
			n_pixel := c_pixel;
		end if;

		pixel_a <= n_pixel;

		p_pixel := c_pixel;

		--end if;
	
--end if;

end process;

process_col_nr: process(clock_pixel, hcount, column) 
variable row, col: integer range 0 to 2048;
begin
	if (rising_edge(clock_pixel)) then
		
		wren_pixel <= '0';
		
		if (column >= front_porch and column < 641+front_porch and vcount >= top_border and vcount < top_border+241) then
			-- user active window
			col := column - front_porch;
			row := to_integer(vcount) - top_border;					

			row_number <= to_unsigned(row, row_number'length);
			col_number <= to_unsigned(col, col_number'length);				
			wren_pixel <= '1';
		end if;
		
	end if;
end process;

color_scheme: process(clock_pixel, apple2, mode)
begin
	if (rising_edge(clock_pixel)) then
		if (apple2 = '1') then
		
			if (mode = '0') then
					black 				<= "000000000"; -- black
					brown					<= "111011000"; -- brown
					magenta				<= "010010111"; -- dark blue
					orange				<= "111011000"; -- orange
					darkblue				<= "010010111"; -- dark mediumblue
					darkgray				<= "111011000"; -- dark gray
					violet				<= "010010111"; -- medium blue
					pink					<= "111011000"; -- light blue
					darkgreen			<= "010010111"; -- darkgreen
					green					<= "111011000"; -- green
					lightgray			<= "010010111"; -- light gray
					yellow				<= "111011000"; -- yellow				
					mediumblue			<= "010010111"; -- mediumblue
					aqua					<= "111011000"; -- aqua
					lightblue			<= "010010111"; -- lightblue
					white					<= "111111111"; -- white		
			else
					black 				<= "000000000"; -- black
					brown					<= "010010111"; -- brown
					magenta				<= "111011000"; -- dark blue
					orange				<= "010010111"; -- orange
					darkblue				<= "111011000"; -- dark mediumblue
					darkgray				<= "010010111"; -- dark gray
					violet				<= "111011000"; -- medium blue
					pink					<= "010010111"; -- light blue
					darkgreen			<= "111011000"; -- darkgreen
					green					<= "010010111"; -- green
					lightgray			<= "111011000"; -- light gray
					yellow				<= "010010111"; -- yellow				
					mediumblue			<= "111011000"; -- mediumblue
					aqua					<= "010010111"; -- aqua
					lightblue			<= "111011000"; -- lightblue
					white					<= "111111111"; -- white		
			end if;

		else
				darkgreen			<= "000100000"; -- darkgreen
				green					<= "000111000"; -- green
				yellow				<= "111111000"; -- yellow
				brown					<= "010010000"; -- brown
				orange				<= "111011000"; -- orange
				pink					<= "111011111"; -- pink				
				magenta				<= "110000011"; -- magenta
				violet				<= "111000111"; -- violet
				darkblue				<= "000000100"; -- darkblue
				mediumblue			<= "010010110"; -- mediumblue
				lightblue			<= "011110110"; -- lightblue
				aqua					<= "001111100"; -- aqua
				
				black 				<= "000000000"; -- black
				darkgray				<= "010010010"; -- darkgray
				lightgray			<= "100100100"; -- lightgray
				white					<= "111111111"; -- white									
		end if;
	end if;
end process;


store_row: process(clock_dram, hblank, store_ack)
begin	
	if (store_ack = '1') then -- store_ack is asynchronous
			store_req <= '0';
	elsif (rising_edge(clock_dram)) then
		if (hblank = '0') then
			store_req <= '1'; -- store_req is on clock_pixel
		end if;
	end if;	
end process;

mode_change: process(clock_pixel)
begin
	if (rising_edge(clock_pixel)) then
		if (shrink = '0') then
			front_porch <= 128;
		elsif (apple2 = '0') then
			front_porch <= 208;
		elsif (offset = '0') then
			front_porch <= 208;
		else
			front_porch <= 182;
		end if;			
	end if;	
end process;

	pixel_sel(1 downto 0) <= artifact_mode&apple2;	
	with pixel_sel select pixel_out(8 downto 0) <= 
		pixel_a(8 downto 0) when "11",
		pixel_b(8 downto 0) when "10",
		pixel_d(8 downto 0) when "01",
		pixel_d(8 downto 0) when "00";
									
end behavioral;