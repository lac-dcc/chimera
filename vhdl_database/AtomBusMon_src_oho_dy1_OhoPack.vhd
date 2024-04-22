----------------------------------------------------------------------------------
-- Company:        OHO-Elektronik
-- Engineer:       Michael Randelzhofer mr@oho-elektronik.de +491776116444
-- 
-- Create Date:    10.11.2008
-- Design Name:    
-- Module Name:    OhoPack.vhd
-- Project Name:   
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.00 - File Created
-- Revision 1.01 - Brightness support
-- Revision 1.02 - Added display test
-- Revision 1.03 - display update support, new interface signal names

-- Additional Comments: 
-- package for OHO_DY1 display module
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL ;
USE IEEE.NUMERIC_STD.ALL ;


package OhoPack is

type y2d_type is array(14 downto 0) of std_logic_vector(8 downto 0) ;

-- OHO_DY1 hex decodes for positions (7 downto 0) -> edgacpbf
constant seg_a: std_logic_vector(7 downto 0) := X"10" ;
constant seg_b: std_logic_vector(7 downto 0) := X"02" ;
constant seg_c: std_logic_vector(7 downto 0) := X"08" ;
constant seg_d: std_logic_vector(7 downto 0) := X"40" ;
constant seg_e: std_logic_vector(7 downto 0) := X"80" ;
constant seg_f: std_logic_vector(7 downto 0) := X"01" ;
constant seg_g: std_logic_vector(7 downto 0) := X"20" ;
constant seg_dp: std_logic_vector(7 downto 0) := X"04" ;

-- hex decoder shift values
constant H0x0: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_d or seg_e or seg_f ;
constant H0x1: std_logic_vector(7 downto 0) := seg_b or seg_c ;
constant H0x2: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_g or seg_e or seg_d ;
constant H0x3: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_d or seg_g ;
constant H0x4: std_logic_vector(7 downto 0) := seg_f or seg_g or seg_b or seg_c ;
constant H0x5: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_g or seg_c or seg_d ;
constant H0x6: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_g or seg_c or seg_d or seg_e ;
constant H0x7: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c ;
constant H0x8: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_d or seg_e or seg_f or seg_g ;
constant H0x9: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_d or seg_f or seg_g ;
constant H0xa: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_e or seg_f or seg_g ;
constant H0xb: std_logic_vector(7 downto 0) := seg_c or seg_d or seg_e or seg_f or seg_g ;
constant H0xc: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_e or seg_d ;
constant H0xd: std_logic_vector(7 downto 0) := seg_b or seg_c or seg_d or seg_e or seg_g ;
constant H0xe: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_g or seg_e or seg_d ;
constant H0xf: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_g or seg_e ;

constant L_a: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_e or seg_f or seg_g ;
constant L_b: std_logic_vector(7 downto 0) := seg_c or seg_d or seg_e or seg_f or seg_g ;
constant L_c: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_e or seg_d ;
constant L_d: std_logic_vector(7 downto 0) := seg_b or seg_c or seg_d or seg_e or seg_g ;
constant L_e: std_logic_vector(7 downto 0) := seg_a or seg_g or seg_d or seg_e or seg_f ;
constant L_f: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_g or seg_e ;
constant L_g: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_d or seg_f or seg_g ;
constant L_h: std_logic_vector(7 downto 0) := seg_c or seg_e or seg_g or seg_f ;
constant L_hh: std_logic_vector(7 downto 0) := seg_b or seg_c or seg_e or seg_f or seg_g ;
constant L_i: std_logic_vector(7 downto 0) := seg_b or seg_c ;
constant L_j: std_logic_vector(7 downto 0) := seg_b or seg_c or seg_d ;
constant L_l: std_logic_vector(7 downto 0) := seg_d or seg_e or seg_f ;
constant L_n: std_logic_vector(7 downto 0) := seg_c or seg_e or seg_g ;
constant L_o: std_logic_vector(7 downto 0) := seg_c or seg_d or seg_e or seg_g ;
constant L_oo: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_c or seg_d or seg_e or seg_f ;
constant L_p: std_logic_vector(7 downto 0) := seg_a or seg_b or seg_g or seg_f or seg_e ;
constant L_r: std_logic_vector(7 downto 0) := seg_e or seg_g ;
constant L_s: std_logic_vector(7 downto 0) := seg_a or seg_f or seg_g or seg_c or seg_d ;
constant L_t: std_logic_vector(7 downto 0) := seg_f or seg_e or seg_g or seg_d ;
constant L_u: std_logic_vector(7 downto 0) := seg_b or seg_c or seg_d or seg_e or seg_f ;
constant L_v: std_logic_vector(7 downto 0) := seg_c or seg_d or seg_e ;
constant L_x: std_logic_vector(7 downto 0) := seg_c or seg_f or seg_g ;
constant L_y: std_logic_vector(7 downto 0) := seg_b or seg_c or seg_d or seg_g or seg_f ;

constant hex: std_logic := '1' ;
constant raw: std_logic := '0' ;

constant DupVal: std_logic_vector(11 DOWNTO 0) := X"001" ;

FUNCTION Rise(sig:std_logic; sigq:std_logic) return boolean ;
FUNCTION Fall(sig:std_logic; sigq:std_logic) return boolean ;
FUNCTION ShiftBit(bitshift:std_logic_vector(2 downto 0); shiftval:std_logic_vector(7 downto 0)) return std_logic ;
FUNCTION SerialHexDecode(bitpos:std_logic_vector(2 downto 0); ledcode:std_logic_vector(8 downto 0)) return std_logic ;
FUNCTION Mirror(slv:std_logic_vector) return std_logic_vector ; 

end OhoPack ;


package body OhoPack is

-- generate one clock pulse on rising edge of signal sig
FUNCTION Rise(sig:std_logic; sigq:std_logic) return boolean is
VARIABLE Z : boolean ; 
BEGIN
  if (sig and not sigq) = '1' then
    Z := true  ;
  else
    Z := false  ;
  end if ;
RETURN Z ;
END Rise ;

-- generate one clock pulse on falling edge of signal sig
FUNCTION Fall(sig:std_logic; sigq:std_logic) return boolean is
VARIABLE Z : boolean ; 
BEGIN
  if (not sig and sigq) = '1' then
    Z := true  ;
  else
    Z := false  ;
  end if ;
RETURN Z ;
END Fall ;


-- serial bit decoder for bit positions
-- bitshiftposition=0 -> result=shiftval(7)
-- bitshiftposition=1 -> result=shiftval(6)
-- bitshiftposition=2 -> result=shiftval(5)
-- bitshiftposition=3 -> result=shiftval(4)
-- bitshiftposition=4 -> result=shiftval(3)
-- bitshiftposition=5 -> result=shiftval(2)
-- bitshiftposition=6 -> result=shiftval(1)
-- bitshiftposition=7 -> result=shiftval(0)
FUNCTION ShiftBit(bitshift:std_logic_vector(2 downto 0); shiftval:std_logic_vector(7 downto 0)) return std_logic is
VARIABLE Z : std_logic ; 
VARIABLE mv : std_logic_vector(7 downto 0) ; 
BEGIN
  mv := Mirror(shiftval) ;
  Z := mv(to_integer(unsigned(bitshift))) ;
RETURN Z ;
END ShiftBit ;

-- lookup table driven hex decoder, needs binary up counter on bitpos
-- input digit data is 9bits: ledcode(8 downto 0)
-- ledcode(8)=0 -> ledcode(7 downto 0)=LED raw data; use led constants defined in this package
-- ledcode(8)=1 -> ledcode(3 downto 0)=display hex nibble; ledcode(7)=decimal point
FUNCTION SerialHexDecode(bitpos:std_logic_vector(2 downto 0); ledcode:std_logic_vector(8 downto 0)) return std_logic is
VARIABLE Z : std_logic ; 
VARIABLE hexval : std_logic_vector(3 downto 0) ; 
VARIABLE dp : std_logic_vector(7 downto 0) ; 
BEGIN
  hexval := ledcode(3 downto 0) ;
  if (ledcode(7)='0') then
    dp := (others => '0') ;
  else
    dp := seg_dp ;
  end if ;
  if (ledcode(8)='0') then
    Z := ShiftBit(bitpos,ledcode(7 downto 0)) ;
  else
    case hexval is
      when X"0" => Z := ShiftBit(bitpos,H0x0 or dp) ;
      when X"1" => Z := ShiftBit(bitpos,H0x1 or dp) ;
      when X"2" => Z := ShiftBit(bitpos,H0x2 or dp) ;
      when X"3" => Z := ShiftBit(bitpos,H0x3 or dp) ;
      when X"4" => Z := ShiftBit(bitpos,H0x4 or dp) ;
      when X"5" => Z := ShiftBit(bitpos,H0x5 or dp) ;
      when X"6" => Z := ShiftBit(bitpos,H0x6 or dp) ;
      when X"7" => Z := ShiftBit(bitpos,H0x7 or dp) ;
      when X"8" => Z := ShiftBit(bitpos,H0x8 or dp) ;
      when X"9" => Z := ShiftBit(bitpos,H0x9 or dp) ;
      when X"a" => Z := ShiftBit(bitpos,H0xa or dp) ;
      when X"b" => Z := ShiftBit(bitpos,H0xb or dp) ;
      when X"c" => Z := ShiftBit(bitpos,H0xc or dp) ;
      when X"d" => Z := ShiftBit(bitpos,H0xd or dp) ;
      when X"e" => Z := ShiftBit(bitpos,H0xe or dp) ;
      when X"f" => Z := ShiftBit(bitpos,H0xf or dp) ;
    
      when others =>
    end case ;
  end if ;
RETURN Z ;
END SerialHexDecode ;


--this function mirrors all the bits of the input vector
FUNCTION Mirror(slv:std_logic_vector) return std_logic_vector is 
VARIABLE MIR : std_logic_vector(slv'high downto slv'low); 
BEGIN
  FOR i IN (slv'low) to slv'high LOOP 
    MIR(i) := (slv(slv'high-i)) ; 
  END LOOP ; 
RETURN MIR ; 
END Mirror ;


end OHOPack ;

