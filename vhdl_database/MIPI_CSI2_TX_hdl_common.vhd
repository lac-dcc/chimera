----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2017 10:16:15 PM
-- Design Name: 
-- Module Name: common - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package Common is   

   type my_enum_type is (r1, r2, r3);
   type packet_type_t is (Frame_Start,Frame_End,Line_Start,Line_End,Default_Short_Packet,    --short packet 
						   --YUV
						   YUV420_8_bit,YUV420_10_bit,Legacy_YUV420_8_bit,YUV422_8_bit,YUV422_10_bit,
						   --RGB
						   RGB444,RGB555,RGB565,RGB666,RGB888,  --the only used in bring-up phase is RGB888
						   --RAW
						   RAW6,RAW7,RAW8,RAW10,RAW12,RAW14); --packet types				   

   type test_pattern_t is (TPATTERN_0,TPATTERN_1,TPATTERN_2,TPATTERN_3);

   constant Sync_Sequence : std_logic_vector(7 downto 0) := "10111000";-- My attemp ="00011101"; in Rx ref = 10111000 --output sync sequence 
     -- polynomial: x^16 + x^12 + x^5 + 1
 -- data width: 8
 -- convention: the first serial bit is D[7]
 function nextCRC16_D8
   (Data: std_logic_vector(7 downto 0);
    crc:  std_logic_vector(15 downto 0))
   return std_logic_vector;
   
 function get_ecc
   (data : in std_logic_vector (23 downto 0))
   return std_logic_vector;
 
 function get_short_packet
   (vc_num : in std_logic_vector(1 downto 0); --virtual channel number          
    packet_type : in packet_type_t;          --short packet type
    packet_data : in std_logic_vector(15 downto 0)) --packet data: frame number for frame packet, line number for line packet
    return std_logic_vector; --prepared short packet out
  
end Common;

package body Common is

	function get_short_packet
	   (vc_num : in std_logic_vector(1 downto 0); --virtual channel number          
		packet_type : in packet_type_t;          --short packet type
		packet_data : in std_logic_vector(15 downto 0)) --packet data: frame number for frame packet, line number for line packet
		return std_logic_vector is --prepared short packet out is

		
		--******************short packet**********
		constant Frame_Start_Code : std_logic_vector(7 downto 0) := x"00";
		constant Frame_End_Code : std_logic_vector(7 downto 0)   := x"01";
		constant Line_Start_Code : std_logic_vector(7 downto 0)  := x"02";
		constant Line_End_Code : std_logic_vector(7 downto 0)    := x"03";
		constant Default_Short_Packet_Code : std_logic_vector(7 downto 0)    := x"04"; --using reserved value
		
		--*****************long packet**************
		--YUV
		 constant YUV420_8_bit_Code        : std_logic_vector(7 downto 0) := x"18";
         constant YUV420_10_bit_Code       : std_logic_vector(7 downto 0) := x"19";
         constant Legacy_YUV420_8_bit_Code : std_logic_vector(7 downto 0) := x"1A";
         constant YUV422_8_bit_Code        : std_logic_vector(7 downto 0) := x"1E";
         constant YUV422_10_bit_Code       : std_logic_vector(7 downto 0) := x"1F";
		--RGB
		 constant RGB444_Code : std_logic_vector(7 downto 0) := x"20";
		 constant RGB555_Code : std_logic_vector(7 downto 0) := x"21";
		 constant RGB565_Code : std_logic_vector(7 downto 0) := x"22";
		 constant RGB666_Code : std_logic_vector(7 downto 0) := x"23";
		 constant RGB888_Code : std_logic_vector(7 downto 0) := x"24";  --the only one, used in bring-up phase
		--RAW
		 constant RAW6_Code  : std_logic_vector(7 downto 0) := x"28";
		 constant RAW7_Code  : std_logic_vector(7 downto 0) := x"29";
		 constant RAW8_Code  : std_logic_vector(7 downto 0) := x"2A";
		 constant RAW10_Code : std_logic_vector(7 downto 0) := x"2B";
		 constant RAW12_Code : std_logic_vector(7 downto 0) := x"2C";
		 constant RAW14_Code : std_logic_vector(7 downto 0) := x"2D";

		
		
		
		variable byte_1_out : std_logic_vector(7 downto 0);  -- virtual channel number + short packet code
		variable byte_2a3_out : std_logic_vector(15 downto 0); --payload
		variable byte_4_out : std_logic_vector(7 downto 0); --ECC
		variable byte_123_tmp : std_logic_vector(23 downto 0); 
		variable short_packet_out : std_logic_vector(31 downto 0); --return value = constructed short packet
		
		begin

			byte_1_out(7 downto 6) := vc_num;
			-- byte_1_out(2 to 7) := Frame_Start_Code(2 to 7) when packet_type = Frame_Start else
								  -- Frame_End_Code(2 to 7) when packet_type = Frame_End else
								  -- Line_Start_Code(2 to 7) when packet_type = Line_Start else
								  -- Line_End_Code(2 to 7) when packet_type = Line_End else
								  -- (others => '0') ;
								  
			case packet_type is 
			    --short packet 
				when Frame_Start =>
				    byte_1_out(5 downto 0) := Frame_Start_Code(5 downto 0);--b"111111";--x"13";--
				when Frame_End =>
                    byte_1_out(5 downto 0) := Frame_End_Code(5 downto 0);
				when Line_Start =>  
                    byte_1_out(5 downto 0) := Line_Start_Code(5 downto 0);
				when Line_End => 
                    byte_1_out(5 downto 0) := Line_End_Code(5 downto 0);
				when Default_Short_Packet => 
                        byte_1_out(5 downto 0) := Default_Short_Packet_Code(5 downto 0);                    		                    
			--YUV
				when YUV420_8_bit =>
					byte_1_out(5 downto 0) := YUV420_8_bit_Code(5 downto 0);
				when YUV420_10_bit  =>   
					byte_1_out(5 downto 0) := YUV420_10_bit_Code(5 downto 0);
				when Legacy_YUV420_8_bit   =>
					byte_1_out(5 downto 0) := Legacy_YUV420_8_bit_Code(5 downto 0);
				when YUV422_8_bit    =>
					byte_1_out(5 downto 0) := YUV422_8_bit_Code(5 downto 0);
				when YUV422_10_bit   =>
					byte_1_out(5 downto 0) := YUV422_10_bit_Code(5 downto 0);
			--RGB
				when RGB444   =>
					byte_1_out(5 downto 0) := RGB444_Code(5 downto 0);
				when RGB555   =>
					byte_1_out(5 downto 0) := RGB555_Code(5 downto 0);
				when RGB565   =>
					byte_1_out(5 downto 0) := RGB565_Code(5 downto 0);
				when RGB666   =>
					byte_1_out(5 downto 0) := RGB666_Code(5 downto 0);
				when RGB888   =>
					byte_1_out(5 downto 0) := RGB888_Code(5 downto 0); --the only used in bring-up phase is RGB888
			--RAW
				when RAW6     =>
					byte_1_out(5 downto 0) := RAW6_Code(5 downto 0);
				when RAW7     =>
					byte_1_out(5 downto 0) := RAW7_Code(5 downto 0);
				when RAW8     =>
					byte_1_out(5 downto 0) := RAW8_Code(5 downto 0);
				when RAW10    =>
					byte_1_out(5 downto 0) := RAW10_Code(5 downto 0);
				when RAW12    =>
					byte_1_out(5 downto 0) := RAW12_Code(5 downto 0);
				when RAW14    =>
					byte_1_out(5 downto 0) := RAW14_Code(5 downto 0);					
			--default
				when others  =>   
				    byte_1_out(5 downto 0) := Line_End_Code(5 downto 0);	--default case
             
            end case; --packet_type
								  
								  
			byte_2a3_out(15 downto 0) := packet_data;		

			byte_123_tmp(7 downto 0)   := byte_1_out;
			byte_123_tmp(23 downto 8)  := byte_2a3_out;
			byte_4_out                 := get_ecc(byte_123_tmp(23 downto 0));

            --wrong MSB
			--short_packet_out(7 downto 0)   := byte_1_out;
			--short_packet_out(23 downto 8)  := byte_2a3_out;
			--short_packet_out(31 downto 24) := byte_4_out;
			
			--another wrong
			--short_packet_out(31 downto 24)   := byte_1_out;
			--short_packet_out(23 downto 8)  := byte_2a3_out;
			--short_packet_out(7 downto 0) := byte_4_out;
			
			short_packet_out(31 downto 24)   := byte_4_out;
			--short_packet_out(15 downto 8)    := byte_2a3_out(7 downto 0);
			--short_packet_out(23 downto 16)   := byte_2a3_out(15 downto 8);
			short_packet_out(23 downto 8)   := packet_data;
			short_packet_out(7 downto 0)     := byte_1_out;
			

							  
		return short_packet_out;
	end get_short_packet;
   
   
  function nextCRC16_D8
  (Data: std_logic_vector(7 downto 0);
   crc:  std_logic_vector(15 downto 0))
  return std_logic_vector is

  variable d:      std_logic_vector(0 to 7);
  variable c:      std_logic_vector(0 to 15);
  variable newcrc: std_logic_vector(0 to 15);

begin
  d := Data;
  c := crc;

  newcrc(0) := d(4) xor d(0) xor c(8) xor c(12);
  newcrc(1) := d(5) xor d(1) xor c(9) xor c(13);
  newcrc(2) := d(6) xor d(2) xor c(10) xor c(14);
  newcrc(3) := d(7) xor d(3) xor c(11) xor c(15);
  newcrc(4) := d(4) xor c(12);
  newcrc(5) := d(5) xor d(4) xor d(0) xor c(8) xor c(12) xor c(13);
  newcrc(6) := d(6) xor d(5) xor d(1) xor c(9) xor c(13) xor c(14);
  newcrc(7) := d(7) xor d(6) xor d(2) xor c(10) xor c(14) xor c(15);
  newcrc(8) := d(7) xor d(3) xor c(0) xor c(11) xor c(15);
  newcrc(9) := d(4) xor c(1) xor c(12);
  newcrc(10) := d(5) xor c(2) xor c(13);
  newcrc(11) := d(6) xor c(3) xor c(14);
  newcrc(12) := d(7) xor d(4) xor d(0) xor c(4) xor c(8) xor c(12) xor c(15);
  newcrc(13) := d(5) xor d(1) xor c(5) xor c(9) xor c(13);
  newcrc(14) := d(6) xor d(2) xor c(6) xor c(10) xor c(14);
  newcrc(15) := d(7) xor d(3) xor c(7) xor c(11) xor c(15);
  return newcrc;
end nextCRC16_D8;

function get_ecc
    (data : in std_logic_vector (23 downto 0))
    return std_logic_vector is

variable ecc_out: std_logic_vector(7 downto 0);

begin
    ecc_out(7) := '0';
    ecc_out(6) := '0';
    ecc_out(5) := data(10) xor data(11) xor data(12) xor data(13) xor data(14) xor data(15) xor data(16) xor data(17) xor data(18) xor data(19) xor data(21) xor data(22) xor data(23);
    ecc_out(4) := data(4) xor data(5) xor data(6) xor data(7) xor data(8) xor data(9) xor data(16) xor data(17) xor data(18) xor data(19) xor data(20) xor data(22) xor data(23);
    ecc_out(3) := data(1) xor data(2) xor data(3) xor data(7) xor data(8) xor data(9) xor data(13) xor data(14) xor data(15) xor data(19) xor data(20) xor data(21) xor data(23);
    ecc_out(2) := data(0) xor data(2) xor data(3) xor data(5) xor data(6) xor data(9) xor data(11) xor data(12) xor data(15) xor data(18) xor data(20) xor data(21) xor data(22);
    ecc_out(1) := data(0) xor data(1) xor data(3) xor data(4) xor data(6) xor data(8) xor data(10) xor data(12) xor data(14) xor data(17) xor data(20) xor data(21) xor data(22) xor data(23);
    ecc_out(0) := data(0) xor data(1) xor data(2) xor data(4) xor data(5) xor data(7) xor data(10) xor data(11) xor data(13) xor data(16) xor data(20) xor data(21) xor data(22) xor data(23);
	
	return ecc_out;
end get_ecc;
   
end Common;
