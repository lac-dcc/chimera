----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:03:30 03/24/2014 
-- Design Name: 
-- Module Name:    nmea_frame_extractor - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library work ;
use work.logi_utils_pack.all ;

entity nmea_frame_extractor is
generic(nmea_header : string := "$GPRMC");
port(
	clk, reset : in std_logic ;
	nmea_byte_in : in std_logic_vector(7 downto 0);
	new_byte_in : in std_logic ;
	nmea_byte_out : out std_logic_vector(7 downto 0);
	new_byte_out : out std_logic;
	frame_size : out std_logic_vector(7 downto 0);
	end_of_frame : out std_logic;
	frame_error : out std_logic
);
end nmea_frame_extractor;

architecture Behavioral of nmea_frame_extractor is
type parser_state is (CHECK_HEADER, RECEIVE_INFO, END_OF_DATA);

function headerEqVec(header : string; comp : slv8_array) return boolean is
	variable eq : boolean := true ;
	variable nmea_char : std_logic_vector(7 downto 0) ;
	begin
	for i in 0 to ((header'length)-1) loop
		nmea_char := (std_logic_vector(to_unsigned( character'pos(header(i+1)), 8))) ;
		eq := eq and (nmea_char = comp(i));
	end loop ;
	return eq ;
end headerEqVec ;


function validField(current : std_logic_vector; fields : slv8_array) return boolean is
	variable eq : boolean := false ;
	begin
	for i in 0 to ((fields'length)-1) loop
		eq := eq or (current = fields(i));
	end loop ;
	return eq ;
end validField ;


signal cur_state, next_state : parser_state ;
signal shift_reg : slv8_array(0 to nmea_header'length-1) ;

signal char_counter : std_logic_vector(7 downto 0) ;
signal compute_checksum : std_logic_vector(7 downto 0) ;
signal en_checksum, reset_checksum, checksum_good : std_logic ;
signal frame_checksum, frame_checksum_high, frame_checksum_low : std_logic_vector(7 downto 0) ;
begin

process(clk, reset)
begin
	if reset = '1' then
		shift_reg <= (others => (others => '0')); 
	elsif clk'event and clk = '1' then
		if new_byte_in = '1' then
			shift_reg(0 to 4) <= shift_reg(1 to 5) ;
			shift_reg(5) <= nmea_byte_in ;
		end if ;
	end if ;
end process ;

process(clk, reset)
begin
	if reset = '1' then
		cur_state <= CHECK_HEADER; 
	elsif clk'event and clk = '1' then
		cur_state <= next_state ;
	end if ;
end process ;



process(cur_state, shift_reg)
begin
	next_state <= cur_state;
	case cur_state is
		when CHECK_HEADER =>
			if headerEqVec(nmea_header, shift_reg) then
				next_state <= RECEIVE_INFO ;
			end if ;
		when RECEIVE_INFO =>
			if checksum_good = '1' then -- buffer contains '*'
				next_state <= END_OF_DATA ;
			elsif shift_reg(0) = X"0D" or shift_reg(0) = X"0A"  then -- buffer contains '\n' or '\t'
				next_state <= CHECK_HEADER ;
			end if ;
		when END_OF_DATA =>
				next_state <= CHECK_HEADER ;
		when others => 
				next_state <= CHECK_HEADER ;
	end case ;
end process ;


process(clk, reset)
begin
	if reset = '1'then
		char_counter <= X"01" ;
	elsif clk'event and clk = '1' then
		if shift_reg(0) = X"24" then -- char is '$'
			char_counter <= X"01"; 
		elsif cur_state=RECEIVE_INFO and new_byte_in = '1' then -- counting char in frame
			char_counter <= char_counter + 1 ;
		end if ;
	end if ;
end process ;


-- checksum handling ...
process(clk, reset)
begin
	if reset = '1'then
		compute_checksum <= X"00" ;
		en_checksum <= '0' ;
	elsif clk'event and clk = '1' then
		-- $ is not in checksum
		if new_byte_in = '1' and shift_reg(5) = X"24" then
			compute_checksum <= X"00"; 
		elsif en_checksum = '1' and new_byte_in = '1' and shift_reg(5) /= X"2A" then
			compute_checksum <= compute_checksum xor shift_reg(5); 
		end if ;
		
		if shift_reg(5) = X"24" then -- $ enables the checksum computation
			en_checksum <= '1' ;
		elsif shift_reg(5) = X"2A" then -- char is '*', end of 
			en_checksum <= '0' ; 
		end if ;
		
	end if ;
end process ;

frame_checksum_high <= (shift_reg(1) - X"30") when shift_reg(1) < X"3A" else
							  (shift_reg(1) - X"37") ;
frame_checksum_low <= (shift_reg(2) - X"30") when shift_reg(2) < X"3A" else
							  (shift_reg(2) - X"37") ;
							  
frame_checksum <= frame_checksum_high(3 downto 0) & frame_checksum_low(3 downto 0) ;

reset_checksum  <= '1' when nmea_byte_in = X"24" else
						 '0' ;
checksum_good <= '1' when frame_checksum = compute_checksum and shift_reg(0) = X"2A" else
					 '0' ;
frame_error <= '1' when cur_state = RECEIVE_INFO and (shift_reg(0) = X"0D" or shift_reg(0) = X"0A") else
					'0' ;
	
frame_size <= char_counter ;
						

end_of_frame <= '1' when cur_state = END_OF_DATA else
					'0' ;

nmea_byte_out <= shift_reg(0) ;


new_byte_out <= new_byte_in when cur_state = RECEIVE_INFO else
					 '0' ;

end Behavioral;


