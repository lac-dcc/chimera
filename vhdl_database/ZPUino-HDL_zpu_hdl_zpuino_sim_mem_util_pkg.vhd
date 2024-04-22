-------------------------------------------------------
-- Author: Hugues CREUSY
--February 2004
-- VHDL model
-- project: M25P16 50 MHz,
-- release: 1.2
-----------------------------------------------------
-- Unit   : Package mem_util_pkg
-----------------------------------------------------
-------------------------------------------------------------
-- These VHDL models are provided "as is" without warranty
-- of any kind, included but not limited to, implied warranty
-- of merchantability and fitness for a particular purpose.
-------------------------------------------------------------


-------------------------------------------------------------------------
--				Memory utilization package	
-------------------------------------------------------------------------

library IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;

-------------------------------------------------------------------------
--				PACKAGE
-------------------------------------------------------------------------
PACKAGE mem_util_pkg IS

TYPE PAGE is ARRAY (natural range <>) of std_logic_vector(7 downto 0);

--------------------------------------------------------------------
-- To convert a standard logic vector (ie a binary word) into 
-- a natural
---------------------------------------------------------------------
FUNCTION TO_natural(vecteur_bit : std_logic_vector ) RETURN natural ;
---------------------------------------------------------------------
---------------------------------------------------------------------------
-- To increase the adress pointing vector 
---------------------------------------------------------------------------
FUNCTION add_inc(vecteur_bit : std_logic_vector ) RETURN std_logic_vector ;
---------------------------------------------------------------------------
--------------------------------------------------------------------
-- To get the number of bits used to code the memory  
-- which size (number of bytes) is a parameter
--------------------------------------------------------------------
FUNCTION TO_bit_code(nb_octets: positive) RETURN natural ;
--------------------------------------------------------------------
------------------------------------------------------------------------
-- To get the first adress of the sector pointed by anyone of its bytes.
------------------------------------------------------------------------
FUNCTION add_sector(vecteur_bit: std_logic_vector;
			 NB_byte_mem,NB_byte_sect: positive) RETURN natural;
------------------------------------------------------------------------
--------------------------------------------------------------------------
-- To convert an integer (ARG) into a standard logic vector with its size.
--------------------------------------------------------------------------
FUNCTION TO_std_logic_vector(ARG: INTEGER; SIZE: INTEGER) 
								RETURN STD_LOGIC_VECTOR;
--------------------------------------------------------------------------
END mem_util_pkg;

---------------------------------------------------------------
--				Package body		
---------------------------------------------------------------
PACKAGE BODY mem_util_pkg IS
----------------------------------------------------------------
FUNCTION TO_natural(vecteur_bit : std_logic_vector ) RETURN natural IS
VARIABLE val_vecteur: natural := 0;	  
BEGIN
FOR J IN vecteur_bit'RANGE LOOP
	val_vecteur :=  val_vecteur * 2;
	val_vecteur :=  val_vecteur + std_logic'pos(vecteur_bit(J)) - 2;
END LOOP;
RETURN val_vecteur;
END TO_natural;
---------------------------------------------------------------
FUNCTION add_inc(vecteur_bit : std_logic_vector ) RETURN std_logic_vector IS
VARIABLE val_vecteur: std_logic_vector(vecteur_bit'RANGE);	  
BEGIN
val_vecteur := vecteur_bit;
FOR J IN vecteur_bit'REVERSE_RANGE LOOP
	val_vecteur(J) := "XOR"( vecteur_bit(J),  '1' );
	IF (val_vecteur(J) = '1') THEN
		EXIT;
	END IF;
END LOOP;
RETURN val_vecteur;
END add_inc;
-----------------------------------------------------------------
FUNCTION TO_bit_code(nb_octets: positive) RETURN natural IS
VARIABLE val_add, add_bit_code: natural ;	  
BEGIN
val_add := nb_octets;
add_bit_code := 0;
IF ((val_add rem 2)/=0) THEN
	val_add := val_add - 1 ;
	add_bit_code := add_bit_code + 1 ;
END IF;

WHILE ( val_add > 1 ) LOOP
	val_add := (val_add/2);
	add_bit_code := add_bit_code + 1;
END LOOP;
RETURN add_bit_code;
END TO_bit_code;
---------------------------------------------------------------
FUNCTION TO_std_logic_vector(ARG: INTEGER; SIZE: INTEGER)
RETURN STD_LOGIC_VECTOR IS
variable result: STD_LOGIC_VECTOR (SIZE-1 downto 0);
variable temp: integer;
begin
temp := ARG;
for i in 0 to SIZE-1 loop
	if (temp mod 2) = 1 then
		result(i) := '1';
	else 
		result(i) := '0';
	end if;
	if temp > 0 then
		temp := temp / 2;
	else
		temp := (temp - 1) / 2;
	end if;
end loop;
return result;
END TO_std_logic_vector;
------------------------------------------------------------
FUNCTION add_sector(vecteur_bit:std_logic_vector;NB_byte_mem,NB_byte_sect:positive) 
RETURN natural IS
VARIABLE addr_sector,deb_sect: natural := 0;
BEGIN
addr_sector := TO_natural(vecteur_bit);
FOR i IN 1 TO (NB_byte_mem/NB_byte_sect) LOOP
	IF ((i-1)*NB_byte_sect<=addr_sector AND addr_sector < i*NB_byte_sect) THEN
		deb_sect:=(i-1)*NB_byte_sect;	
	END IF;
END LOOP;
RETURN deb_sect;
END add_sector;
--------------------------------------------------------------
END mem_util_pkg;
