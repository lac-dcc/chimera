library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_unsigned.all;

library STD;
use     STD.textio.all; --defines line, output

package salutil is

   type t_fl is record
      SOF_N       : std_logic;
      SOP_N       : std_logic;
      EOP_N       : std_logic;
      EOF_N       : std_logic;
      SRC_RDY_N   : std_logic;
      DST_RDY_N   : std_logic;
      DATA        : std_logic_vector(63 downto 0);
      DREM        : std_logic_vector(2 downto 0); 
   end record;
   
   
   
   type axis is
       record
          TDATA: std_logic_vector(255 downto 0);
          TUSER: std_logic_vector(127 downto 0);
          TKEEP: std_logic_vector(31 downto 0);
          TVALID: std_logic;
          TLAST: std_logic;
      end record;

constant IN_SIMULATION: boolean := false
--pragma synthesis_off
or true
--pragma synthesis_on
;

constant IN_SYNTHESIS: boolean := not IN_SIMULATION;

function bitdc_string_to_std_logic_vector(s: string) return std_logic_vector; 
function bit_string_to_std_logic_vector(s: string) return std_logic_vector; 
function string_to_std_logic_vector(s: string) return std_logic_vector; 
FUNCTION or_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
FUNCTION and_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
function popcount6 (arg: std_logic_vector) return std_logic_vector; 
function popcount8 (arg: std_logic_vector) return std_logic_vector; 
function popcount32 (arg: std_logic_vector) return std_logic_vector; 
function popcount64 (arg: std_logic_vector) return std_logic_vector; 
function myror (L: std_logic_vector; R: integer) return std_logic_vector; 
function to_string(sv: Std_Logic_Vector) return string; 
function hstr(slv: std_logic_vector) return string;
function h(slv: std_logic_vector) return string;

-- File: debugio_h.vhd
-- Version: 3.0	 (June 6, 2004)
-- Source: http://bear.ces.cwru.edu/vhdl
-- Date:   June 6, 2004 (Copyright)
-- Author: Francis G. Wolff   Email: fxw12@po.cwru.edu
-- Author: Michael J. Knieser Email: mjknieser@knieser.com
--
procedure printf(fmt: string; s0, s1, s2: string; i0: integer);
procedure printf(fmt: string);
procedure printf(fmt: string; s1: string);
procedure printf(fmt: string; s1, s2: string);
procedure printf(fmt: string; i1: integer);
procedure printf(fmt: string; i1: integer; s2: string);
procedure printf(fmt: string; i1: integer; s2, s3: string);

end salutil;

package body salutil is


function char2sl(c:character) return std_logic is
   variable sl:std_logic;
begin
   case c is
        when '0' => sl:='0';
        when '1' => sl:='1';
        when 'H' => sl:='H';
        when 'L' => sl:='L';
        when 'X' => sl:='X';
        when 'U' => sl:='U';
        when '-' => sl:='-';
        when 'W' => sl:='W';
        when 'Z' => sl:='Z';
        when others => sl:='U';
    end case;
return sl;
end char2sl;

function bitdc_string_to_std_logic_vector(s: string) return std_logic_vector is  
  variable slv: std_logic_vector(2*(s'high-s'low)+1 downto 0);
  variable k: integer;
begin
   k := 2*(s'high-s'low)+1;
  for i in s'range loop
     if s(i)='1' then
        slv(k) := '1';
     else
        slv(k):='0';
     end if;
     k := k - 1;
  end loop;
  
  for i in s'range loop
     if s(i)='-' then
        slv(k) := '0'; --DC 
     elsif s(i)='X' then
        slv(k) := '0'; --DC 
     else
        slv(k):='1';
     end if;
     k := k - 1;
  end loop;
  return slv;
end bitdc_string_to_std_logic_vector;  


function bit_string_to_std_logic_vector(s: string) return std_logic_vector is  
  variable slv: std_logic_vector((s'high-s'low) downto 0);
  variable k: integer;
begin
   k := s'high-s'low;
  for i in s'range loop
     slv(k) := char2sl(s(i));
     k      := k - 1;
  end loop;
  return slv;
end bit_string_to_std_logic_vector;  


function string_to_std_logic_vector(s: string) return std_logic_vector is 
  variable slv: std_logic_vector(8*(s'high-s'low)+7 downto 0);
  variable k: integer;
begin
   k := s'high-s'low;
  for i in s'range loop
     slv(8*k+7 downto 8*k) := CONV_STD_LOGIC_VECTOR(character'pos((s(i))),8);
     k      := k - 1;
  end loop;
  return slv;
end string_to_std_logic_vector;  


function popcount8 (arg: std_logic_vector) return std_logic_vector is
    variable temp : std_logic_vector(7 downto 0) := "00000000";
    variable result : std_logic_vector(3 downto 0) := "0000";
  begin
       temp:=arg;
       case temp is
       --00
           when "00000000" => 
                    result:= "0000";
           when "00000001" =>
                    result:= "0001";
           when "00000010" =>
                    result:= "0001";
           when "00000011" =>
                    result:= "0010";
           when "00000100" =>
                    result:= "0001";
           when "00000101" =>
                    result:= "0010";
           when "00000110" =>
                    result:= "0010";
           when "00000111" =>
                    result:= "0011";
           when "00001000" =>
                    result:= "0001";
           when "00001001" =>
                    result:= "0010";
           when "00001010" =>
                    result:= "0010";
           when "00001011" =>
                    result:= "0011";
           when "00001100" =>
                    result:= "0010";
           when "00001101" =>
                    result:= "0011";
           when "00001110" =>
                    result:= "0011";
           when "00001111" =>
                    result:= "0100";
           when "00010000" =>
                    result:= "0001";
           when "00010001" =>
                    result:= "0010";
           when "00010010" =>
                    result:= "0010";
           when "00010011" =>
                    result:= "0011";
           when "00010100" =>
                    result:= "0010";
           when "00010101" =>
                    result:= "0011";
           when "00010110" =>
                    result:= "0011";
           when "00010111" =>
                    result:= "0100";
           when "00011000" =>
                    result:= "0010";
           when "00011001" =>
                    result:= "0011";
           when "00011010" =>
                    result:= "0011";
           when "00011011" =>
                    result:= "0100";
           when "00011100" =>
                    result:= "0011";
           when "00011101" =>
                    result:= "0100";
           when "00011110" =>
                    result:= "0100";
           when "00011111" =>
                    result:= "0101";
           when "00100000" =>
                    result:= "0001";
           when "00100001" =>
                    result:= "0010";
           when "00100010" =>
                    result:= "0010";
           when "00100011" =>
                    result:= "0011";
           when "00100100" =>
                    result:= "0010";
           when "00100101" =>
                    result:= "0011";
           when "00100110" =>
                    result:= "0011";
           when "00100111" =>
                    result:= "0100";
           when "00101000" =>
                    result:= "0010";
           when "00101001" =>
                      result:= "0011";
           when "00101010" =>
                      result:= "0011";
           when "00101011" =>
                      result:= "0100";
           when "00101100" =>
                      result:= "0011";
           when "00101101" =>
                      result:= "0100";
           when "00101110" =>
                      result:= "0100";
           when "00101111" =>
                      result:= "0101";
           when "00110000" =>
                      result:= "0010";
           when "00110001" =>
                      result:= "0011";
           when "00110010" =>
                      result:= "0011";
           when "00110011" =>
                      result:= "0100";
           when "00110100" =>
                      result:= "0011";
           when "00110101" =>
                      result:= "0100";
           when "00110110" =>
                      result:= "0100";
           when "00110111" =>
                      result:= "0101";
           when "00111000" =>
                      result:= "0011";
           when "00111001" =>
                      result:= "0100";
           when "00111010" =>
                      result:= "0100";
           when "00111011" =>
                      result:= "0101";
           when "00111100" =>
                      result:= "0100";
           when "00111101" =>
                      result:= "0101";
           when "00111110" =>
                      result:= "0101";
           when "00111111" =>
                    result:= "0110";
           --01
           when "01000000" => 
                    result:= "0001";
           when "01000001" =>
                    result:= "0010";
           when "01000010" =>
                    result:= "0010";
           when "01000011" =>
                    result:= "0011";
           when "01000100" =>
                    result:= "0010";
           when "01000101" =>
                    result:= "0011";
           when "01000110" =>
                    result:= "0011";
           when "01000111" =>
                    result:= "0100";
           when "01001000" =>
                    result:= "0010";
           when "01001001" =>
                    result:= "0011";
           when "01001010" =>
                    result:= "0011";
           when "01001011" =>
                    result:= "0100";
           when "01001100" =>
                    result:= "0011";
           when "01001101" =>
                    result:= "0100";
           when "01001110" =>
                    result:= "0100";
           when "01001111" =>
                    result:= "0101";
           when "01010000" =>
                    result:= "0010";
           when "01010001" =>
                    result:= "0011";
           when "01010010" =>
                    result:= "0011";
           when "01010011" =>
                    result:= "0100";
           when "01010100" =>
                    result:= "0011";
           when "01010101" =>
                    result:= "0100";
           when "01010110" =>
                    result:= "0100";
           when "01010111" =>
                    result:= "0101";
           when "01011000" =>
                    result:= "0011";
           when "01011001" =>
                    result:= "0100";
           when "01011010" =>
                    result:= "0100";
           when "01011011" =>
                    result:= "0101";
           when "01011100" =>
                    result:= "0100";
           when "01011101" =>
                    result:= "0101";
           when "01011110" =>
                    result:= "0101";
           when "01011111" =>
                    result:= "0110";
           when "01100000" =>
                    result:= "0010";
           when "01100001" =>
                    result:= "0011";
           when "01100010" =>
                    result:= "0011";
           when "01100011" =>
                    result:= "0100";
           when "01100100" =>
                    result:= "0011";
           when "01100101" =>
                    result:= "0100";
           when "01100110" =>
                    result:= "0100";
           when "01100111" =>
                    result:= "0101";
           when "01101000" =>
                    result:= "0011";
           when "01101001" =>
                    result:= "0100";
           when "01101010" =>
                      result:= "0100";
           when "01101011" =>
                      result:= "0101";
           when "01101100" =>
                      result:= "0100";
           when "01101101" =>
                      result:= "0101";
           when "01101110" =>
                      result:= "0101";
           when "01101111" =>
                      result:= "0110";
           when "01110000" =>
                      result:= "0011";
           when "01110001" =>
                      result:= "0100";
           when "01110010" =>
                      result:= "0100";
           when "01110011" =>
                      result:= "0101";
           when "01110100" =>
                      result:= "0100";
           when "01110101" =>
                      result:= "0101";
           when "01110110" =>
                      result:= "0101";
           when "01110111" =>
                      result:= "0110";
           when "01111000" =>
                      result:= "0100";
           when "01111001" =>
                      result:= "0101";
           when "01111010" =>
                      result:= "0101";
           when "01111011" =>
                      result:= "0110";
           when "01111100" =>
                      result:= "0101";
           when "01111101" =>
                      result:= "0110";
           when "01111110" =>
                      result:= "0110";
           when "01111111" =>
                    result:= "0111";
         --10
           when "10000000" => 
                    result:= "0001";
           when "10000001" =>
                    result:= "0010";
           when "10000010" =>
                    result:= "0010";
           when "10000011" =>
                    result:= "0011";
           when "10000100" =>
                    result:= "0010";
           when "10000101" =>
                    result:= "0011";
           when "10000110" =>
                    result:= "0011";
           when "10000111" =>
                    result:= "0100";
           when "10001000" =>
                    result:= "0010";
           when "10001001" =>
                    result:= "0011";
           when "10001010" =>
                    result:= "0011";
           when "10001011" =>
                    result:= "0100";
           when "10001100" =>
                    result:= "0011";
           when "10001101" =>
                    result:= "0100";
           when "10001110" =>
                    result:= "0100";
           when "10001111" =>
                    result:= "0101";
           when "10010000" =>
                    result:= "0010";
           when "10010001" =>
                    result:= "0011";
           when "10010010" =>
                    result:= "0011";
           when "10010011" =>
                    result:= "0100";
           when "10010100" =>
                    result:= "0011";
           when "10010101" =>
                    result:= "0100";
           when "10010110" =>
                    result:= "0100";
           when "10010111" =>
                    result:= "0101";
           when "10011000" =>
                    result:= "0011";
           when "10011001" =>
                    result:= "0100";
           when "10011010" =>
                    result:= "0100";
           when "10011011" =>
                    result:= "0101";
           when "10011100" =>
                    result:= "0100";
           when "10011101" =>
                    result:= "0101";
           when "10011110" =>
                    result:= "0101";
           when "10011111" =>
                    result:= "0110";
           when "10100000" =>
                    result:= "0010";
           when "10100001" =>
                    result:= "0011";
           when "10100010" =>
                    result:= "0011";
           when "10100011" =>
                    result:= "0100";
           when "10100100" =>
                    result:= "0011";
           when "10100101" =>
                    result:= "0100";
           when "10100110" =>
                    result:= "0100";
           when "10100111" =>
                    result:= "0101";
           when "10101000" =>
                    result:= "0011";
           when "10101001" =>
                    result:= "0100";
           when "10101010" =>
                      result:= "0100";
           when "10101011" =>
                      result:= "0101";
           when "10101100" =>
                      result:= "0100";
           when "10101101" =>
                      result:= "0101";
           when "10101110" =>
                      result:= "0101";
           when "10101111" =>
                      result:= "0110";
           when "10110000" =>
                      result:= "0011";
           when "10110001" =>
                      result:= "0100";
           when "10110010" =>
                      result:= "0100";
           when "10110011" =>
                      result:= "0101";
           when "10110100" =>
                      result:= "0100";
           when "10110101" =>
                      result:= "0101";
           when "10110110" =>
                      result:= "0101";
           when "10110111" =>
                      result:= "0110";
           when "10111000" =>
                      result:= "0100";
           when "10111001" =>
                      result:= "0101";
           when "10111010" =>
                      result:= "0101";
           when "10111011" =>
                      result:= "0110";
           when "10111100" =>
                      result:= "0101";
           when "10111101" =>
                      result:= "0110";
           when "10111110" =>
                      result:= "0110";
           when "10111111" =>
                    result:= "0111";
	   --11
           when "11000000" => 
                    result:= "0010";
           when "11000001" =>
                    result:= "0011";
           when "11000010" =>
                    result:= "0011";
           when "11000011" =>
                    result:= "0100";
           when "11000100" =>
                    result:= "0011";
           when "11000101" =>
                    result:= "0100";
           when "11000110" =>
                    result:= "0100";
           when "11000111" =>
                    result:= "0101";
           when "11001000" =>
                    result:= "0011";
           when "11001001" =>
                    result:= "0100";
           when "11001010" =>
                    result:= "0100";
           when "11001011" =>
                    result:= "0101";
           when "11001100" =>
                    result:= "0100";
           when "11001101" =>
                    result:= "0101";
           when "11001110" =>
                    result:= "0101";
           when "11001111" =>
                    result:= "0110";
           when "11010000" =>
                    result:= "0011";
           when "11010001" =>
                    result:= "0100";
           when "11010010" =>
                    result:= "0100";
           when "11010011" =>
                    result:= "0101";
           when "11010100" =>
                    result:= "0100";
           when "11010101" =>
                    result:= "0101";
           when "11010110" =>
                    result:= "0101";
           when "11010111" =>
                    result:= "0110";
           when "11011000" =>
                    result:= "0100";
           when "11011001" =>
                    result:= "0101";
           when "11011010" =>
                    result:= "0101";
           when "11011011" =>
                    result:= "0110";
           when "11011100" =>
                    result:= "0101";
           when "11011101" =>
                    result:= "0110";
           when "11011110" =>
                    result:= "0110";
           when "11011111" =>
                    result:= "0111";
           when "11100000" =>
                    result:= "0011";
           when "11100001" =>
                    result:= "0100";
           when "11100010" =>
                    result:= "0100";
           when "11100011" =>
                    result:= "0101";
           when "11100100" =>
                    result:= "0100";
           when "11100101" =>
                    result:= "0101";
           when "11100110" =>
                    result:= "0101";
           when "11100111" =>
                    result:= "0110";
           when "11101000" =>
                    result:= "0100";
           when "11101001" =>
                    result:= "0101";
           when "11101010" =>
                      result:= "0101";
           when "11101011" =>
                      result:= "0110";
           when "11101100" =>
                      result:= "0101";
           when "11101101" =>
                      result:= "0110";
           when "11101110" =>
                      result:= "0110";
           when "11101111" =>
                      result:= "0111";
           when "11110000" =>
                      result:= "0100";
           when "11110001" =>
                      result:= "0101";
           when "11110010" =>
                      result:= "0101";
           when "11110011" =>
                      result:= "0110";
           when "11110100" =>
                      result:= "0101";
           when "11110101" =>
                      result:= "0110";
           when "11110110" =>
                      result:= "0110";
           when "11110111" =>
                      result:= "0111";
           when "11111000" =>
                      result:= "0101";
           when "11111001" =>
                      result:= "0110";
           when "11111010" =>
                      result:= "0110";
           when "11111011" =>
                      result:= "0111";
           when "11111100" =>
                      result:= "0110";
           when "11111101" =>
                      result:= "0111";
           when "11111110" =>
                      result:= "0111";
           when "11111111" =>
                    result:= "1000";
	   when  others =>
                    result:= "0000";
         end case;
    return result;
  end function popcount8;


function popcount6 (arg: std_logic_vector) return std_logic_vector is
    variable temp : std_logic_vector(5 downto 0) := "000000";
    variable result : std_logic_vector(2 downto 0) := "000";
  begin
       temp:=arg;
       case temp is
           when "000000" => 
                    result:= "000";
           when "000001" =>
                    result:= "001";
           when "000010" =>
                    result:= "001";
           when "000011" =>
                    result:= "010";
           when "000100" =>
                    result:= "001";
           when "000101" =>
                    result:= "010";
           when "000110" =>
                    result:= "010";
           when "000111" =>
                    result:= "011";
           when "001000" =>
                    result:= "001";
           when "001001" =>
                    result:= "010";
           when "001010" =>
                    result:= "010";
           when "001011" =>
                    result:= "011";
           when "001100" =>
                    result:= "010";
           when "001101" =>
                    result:= "011";
           when "001110" =>
                    result:= "011";
           when "001111" =>
                    result:= "100";
           when "010000" =>
                    result:= "001";
           when "010001" =>
                    result:= "010";
           when "010010" =>
                    result:= "010";
           when "010011" =>
                    result:= "011";
           when "010100" =>
                    result:= "010";
           when "010101" =>
                    result:= "011";
           when "010110" =>
                    result:= "011";
           when "010111" =>
                    result:= "100";
           when "011000" =>
                    result:= "010";
           when "011001" =>
                    result:= "011";
           when "011010" =>
                    result:= "011";
           when "011011" =>
                    result:= "100";
           when "011100" =>
                    result:= "011";
           when "011101" =>
                    result:= "100";
           when "011110" =>
                    result:= "100";
           when "011111" =>
                    result:= "101";
           when "100000" =>
                    result:= "001";
           when "100001" =>
                    result:= "010";
           when "100010" =>
                    result:= "010";
           when "100011" =>
                    result:= "011";
           when "100100" =>
                    result:= "010";
           when "100101" =>
                    result:= "011";
           when "100110" =>
                    result:= "011";
           when "100111" =>
                    result:= "100";
           when "101000" =>
                    result:= "010";
           when "101001" =>
                    result:= "011";
           when "101010" =>
                    result:= "011";
           when "101011" =>
                    result:= "100";
           when "101100" =>
                    result:= "011";
           when "101101" =>
                    result:= "100";
           when "101110" =>
                    result:= "100";
           when "101111" =>
                    result:= "101";
           when "110000" =>
                    result:= "010";
           when "110001" =>
                    result:= "011";
           when "110010" =>
                    result:= "011";
           when "110011" =>
                    result:= "100";
           when "110100" =>
                    result:= "011";
           when "110101" =>
                    result:= "100";
           when "110110" =>
                    result:= "100";
           when "110111" =>
                    result:= "101";
           when "111000" =>
                    result:= "011";
           when "111001" =>
                    result:= "100";
           when "111010" =>
                    result:= "100";
           when "111011" =>
                    result:= "101";
           when "111100" =>
                    result:= "100";
           when "111101" =>
                    result:= "101";
           when "111110" =>
                    result:= "101";
           when "111111" =>
                    result:= "110";
           when  others =>
                    result:= "000";
         end case;
    return result;
  end function popcount6;

function popcount32 (arg: std_logic_vector) return std_logic_vector is
    variable s1,s2,s3: std_logic_vector(2 downto 0) := "000";
    variable p1,p2,p3,p4,p5,p6 : std_logic_vector(2 downto 0) := "000";
    variable result : std_logic_vector(5 downto 0) := "000000";
  begin
   --first stage compression 6:3
   p1:= popcount6(arg(5 downto 0)); 
   p2:= popcount6(arg(11 downto 6)); 
   p3:= popcount6(arg(17 downto 12)); 
   p4:= popcount6(arg(23 downto 18)); 
   p5:= popcount6(arg(29 downto 24)); 
   p6:= popcount6(arg(31 downto 30)&"0000"); 
   
   --second stage compression 6:3
   s1:=popcount6(p1(0) & p2(0)& p3(0) & p4(0) & p5(0) & p6(0) );
   s2:=popcount6(p1(1) & p2(1)& p3(1) & p4(1) & p5(1) & p6(1) );
   s3:=popcount6(p1(2) & p2(2)& p3(2) & p4(2) & p5(2) & p6(2) );
   
   --third stage compression 6:3
   result(4 downto 0):=("00"&s1)+('0'&s2&'0')+(s3&"00");
   result(5):=and_reduce(arg); 

   return result;
  end function popcount32;

function popcount64 (arg: std_logic_vector) return std_logic_vector is
    variable  carry_0, carry_2: std_logic := '0';
    variable u3,u4 : std_logic_vector(2 downto 0) := "000";
    variable t1,t2,t3,t4 : std_logic_vector(2 downto 0) := "000";
    variable s1,s2,s3,s4,s5,s6: std_logic_vector(2 downto 0) := "000";
    variable p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11 : std_logic_vector(2 downto 0) := "000";
    variable result : std_logic_vector(6 downto 0) := "0000000";
  begin
   --first stage compression 6:3
   p1:= popcount6(arg(5 downto 0)); 
   p2:= popcount6(arg(11 downto 6)); 
   p3:= popcount6(arg(17 downto 12)); 
   p4:= popcount6(arg(23 downto 18)); 
   p5:= popcount6(arg(29 downto 24)); 
   p6:= popcount6(arg(35 downto 30)); 
   p7:= popcount6(arg(41 downto 36)); 
   p8:= popcount6(arg(47 downto 42)); 
   p9:= popcount6(arg(53 downto 48)); 
   p10:= popcount6(arg(59 downto 54)); 
   p11:= popcount6("00"& arg(63 downto 60)); 
   
   --second stage compression 6:3
   s1:=popcount6(p1(0) & p2(0)& p3(0) & p4(0) & p5(0) & p6(0) );
   s2:=popcount6(p7(0) & p8(0)& p9(0) & p10(0) & p11(0) & '0' );
   s3:=popcount6(p1(1) & p2(1)& p3(1) & p4(1) & p5(1) & p6(1) );
   s4:=popcount6(p7(1) & p8(1)& p9(1) & p10(1) & p11(1) & '0' );
   s5:=popcount6(p1(2) & p2(2)& p3(2) & p4(2) & p5(2) & p6(2) );
   s6:=popcount6(p7(2) & p8(2)& p9(2) & p10(2) & p11(2) & '0' );
   
   --third stage compression 6:3
   result(0):=s1(0) xor s2(0);
   carry_0:=s1(0) and s2(0); 
   t1:=popcount6(s1(1) & s2(1)& s3(0) & s4(0) & carry_0 & '0' );
   t2:=popcount6(s1(2) & s2(2)& s3(1) & s4(1) & s5(0) & s6(0) );
   t3:=popcount6(s3(2) & s4(2)& s5(1) & s6(1) & "00" );
   t4(0):=s5(2) xor s6(2);
   t4(1):=s5(2) and s6(2);
  
   result(1):=t1(0);
   result(2):=t2(0) xor t1(1);
   carry_2:=t2(0) and t1(1);
   u3:=popcount6(t1(2) & t2(1) & t3(0) & carry_2 & "00");
   u4:=popcount6(t2(2) & t3(1) & t4(0) & "000");

  --use carry save
   result(3):=u3(0); 
   result(4):=u3(1) xor u4(0); 
   result(5):=u3(2) xor u4(1) xor t3(2) xor t4(1) xor (u3(1) and u4(0)); 
   result(6):=and_reduce(arg); 

   return result;

  end function popcount64;

function h(slv: std_logic_vector) return string is
       variable hexlen: integer;
       variable longslv : std_logic_vector(67 downto 0) := (others => '0');
       variable hex : string(1 to 16);
       variable fourbit : std_logic_vector(3 downto 0);
     begin
       hexlen := (slv'length+1)/4;
       if (slv'length+1) mod 4 /= 0 then
         hexlen := hexlen + 1;
       end if;
       longslv(slv'left downto slv'right) := slv;
       for i in (hexlen -1) downto 0 loop
         fourbit := longslv(((i*4)+3) downto (i*4));
         case fourbit is
           when "0000" => hex(hexlen -I) := '0';
           when "0001" => hex(hexlen -I) := '1';
           when "0010" => hex(hexlen -I) := '2';
           when "0011" => hex(hexlen -I) := '3';
           when "0100" => hex(hexlen -I) := '4';
           when "0101" => hex(hexlen -I) := '5';
           when "0110" => hex(hexlen -I) := '6';
           when "0111" => hex(hexlen -I) := '7';
           when "1000" => hex(hexlen -I) := '8';
           when "1001" => hex(hexlen -I) := '9';
           when "1010" => hex(hexlen -I) := 'A';
           when "1011" => hex(hexlen -I) := 'B';
           when "1100" => hex(hexlen -I) := 'C';
           when "1101" => hex(hexlen -I) := 'D';
           when "1110" => hex(hexlen -I) := 'E';
           when "1111" => hex(hexlen -I) := 'F';
           when "ZZZZ" => hex(hexlen -I) := 'z';
           when "UUUU" => hex(hexlen -I) := 'u';
           when "XXXX" => hex(hexlen -I) := 'x';
           when others => hex(hexlen -I) := '?';
         end case;
       end loop;
       return hex(1 to hexlen);
end function h;

function hstr(slv: std_logic_vector) return string is
       variable hexlen: integer;
       variable longslv : std_logic_vector(67 downto 0) := (others => '0');
       variable hex : string(1 to 16);
       variable fourbit : std_logic_vector(3 downto 0);
     begin
       hexlen := (slv'left+1)/4;
       if (slv'left+1) mod 4 /= 0 then
         hexlen := hexlen + 1;
       end if;
       longslv(slv'left downto 0) := slv;
       for i in (hexlen -1) downto 0 loop
         fourbit := longslv(((i*4)+3) downto (i*4));
         case fourbit is
           when "0000" => hex(hexlen -I) := '0';
           when "0001" => hex(hexlen -I) := '1';
           when "0010" => hex(hexlen -I) := '2';
           when "0011" => hex(hexlen -I) := '3';
           when "0100" => hex(hexlen -I) := '4';
           when "0101" => hex(hexlen -I) := '5';
           when "0110" => hex(hexlen -I) := '6';
           when "0111" => hex(hexlen -I) := '7';
           when "1000" => hex(hexlen -I) := '8';
           when "1001" => hex(hexlen -I) := '9';
           when "1010" => hex(hexlen -I) := 'A';
           when "1011" => hex(hexlen -I) := 'B';
           when "1100" => hex(hexlen -I) := 'C';
           when "1101" => hex(hexlen -I) := 'D';
           when "1110" => hex(hexlen -I) := 'E';
           when "1111" => hex(hexlen -I) := 'F';
           when "ZZZZ" => hex(hexlen -I) := 'z';
           when "UUUU" => hex(hexlen -I) := 'u';
           when "XXXX" => hex(hexlen -I) := 'x';
           when others => hex(hexlen -I) := '?';
         end case;
       end loop;
       return hex(1 to hexlen);
end function hstr;

function to_string(sv: Std_Logic_Vector) 
return string is
    use Std.TextIO.all;
    variable bv: bit_vector(sv'range) := to_bitvector(sv);
    variable lp: line;
  begin
    write(lp, bv);
    return lp.all;
end function to_string;

function myror (L: std_logic_vector; R: integer) return std_logic_vector is
 	begin
	return to_stdlogicvector(to_bitvector(L) ror R);
 end function myror;

function or_reduce (arg: std_logic_vector) return std_logic is
    variable result : std_logic := '0';
  begin
    for i in arg'reverse_range loop
      result := arg(i) or result;
    end loop;
    return result;
  end function or_reduce;

function and_reduce (arg: std_logic_vector) return std_logic is
    variable result : std_logic := '1';
  begin
    for i in arg'reverse_range loop
      result := arg(i) and result;
    end loop;
    return result;
  end function and_reduce;

procedure printf(fmt: string; s0, s1, s2: string; i0: integer) is
    variable W: line; variable i, fi, di: integer:=0;
  begin loop
      --write(W, string'("n=")); write(W, s0'length);
      --write(W, string'(" L=")); write(W, s0'left);
      --write(W, string'(" R=")); write(W, s0'right);
      --writeline(output, W);
      fi:=fi+1; if fi>fmt'length then exit; end if;
      if fmt(fi)='%' then
        fi:=fi+1; if fi>fmt'length then exit; end if;
        if fmt(fi)='s' then
          case di is
          when 0 => i:=s0'left;
                    while i<=s0'right loop
                      if s0(i)=NUL then exit; end if;
                      write(W, s0(i)); i:=i+1;
                    end loop;
          when 1 => i:=s1'left;
                    while i<=s1'right loop
                      if s1(i)=NUL then exit; end if;
                      write(W, s1(i)); i:=i+1;
                    end loop;
          when 2 => i:=s2'left;
                    while i<=s2'length loop
                      if s2(i)=NUL then exit; end if;
                      write(W, s2(i)); i:=i+1;
                    end loop;
          when others =>
          end case;
          di:=di+1;
        elsif fmt(fi)='d' then
	  case di is
          when 0 => write(W, i0); when others => end case;
          di:=di+1;
        end if;
      elsif fmt(fi)='\' then
        fi:=fi+1; if fi>fmt'length then exit; end if;
        case fmt(fi) is
          when 'n'    => writeline(output, W);
          when others => write(W, fmt(fi));
        end case;
      else write(W, fmt(fi));
      end if;
  end loop; end printf;

procedure printf(fmt: string) is
  begin printf(fmt, "", "", "", 0); end printf;

procedure printf(fmt: string; s1: string) is
  begin printf(fmt, s1, "", "", 0); end printf;

procedure printf(fmt: string; s1, s2: string) is
  begin printf(fmt, s1, s2, "", 0); end printf;

procedure printf(fmt: string; i1: integer) is
  begin printf(fmt, "", "", "", i1); end printf; 

procedure printf(fmt: string; i1: integer; s2: string) is
  begin printf(fmt, "", s2, "", i1); end printf; 

procedure printf(fmt: string; i1: integer; s2, s3: string) is
  begin printf(fmt, "", s2, s3, i1); end printf; 

end salutil;
