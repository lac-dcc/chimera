-- --------------------------------------------------------------------
--
--   Copyright 2002 by IEEE. All rights reserved.
--
--   This source file is an essential part of IEEE [Draft] Standard 1076.3
--   reduce_pkg
--   This source file may not be copied, sold, or included
--   with software that is sold without written permission from the IEEE
--   Standards Department. This source file may be used to implement this
--   [draft] standard and may be distributed in compiled form in any manner so 
--   long as the compiled form does not allow direct decompilation of the 
--   original source file. This source file may be copied for individaul use 
--   between licensed users.
--
--   The IEEE disclaims any responsibility or liability for damages resulting 
--   from misinterpretation or misue of said information by the user.
-- 
--   [This source file represents a portion of the IEEE Draft Standard and is 
--   unapproved and subject to change.]
-- 
--   < statement about permission to modify >
--
--   Title     :  REDUCE_PKG < IEEE std # 1076.3 >
--
--   Library   :  This package shall be compiled into a library 
--                symbolically named IEEE. 
--
--   Developers:  IEEE DASC VHDL/Synthesis, PAR 1076.3
--
--   Purpose   :  Reduction operations.  This allows a vector to
--                be collapsed into a signle bit.  Similar to the built
--                in functions in Verilog.
--
--   Limitation:  
--
-- --------------------------------------------------------------------
--   modification history :
-- --------------------------------------------------------------------
--   Version:  1.3
--   Date   :  8 July 2002
--   Added "to_x01" on all inputs.
--   Made "and_reduce" return a "1" in the NULL case.
-- -------------------------------------------------------------------------
--   Version:  1.2
--   Date   :  21 June 2002
--   Fixed some basic logic errors.
-- -------------------------------------------------------------------------
--   Version:  1.1
--   Date   :  13 May 2002
--   Modified to deal with null arrays, added IEEE header.
-- -------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

-- Package definition
package reduce_pack is
  FUNCTION and_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of and'ing all of the bits of the vector. 

  FUNCTION nand_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  FUNCTION or_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of or'ing all of the bits of the vector. 

  FUNCTION nor_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  FUNCTION xor_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  FUNCTION xnor_reduce(arg : STD_LOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xnor'ing all of the bits of the vector.

  FUNCTION and_reduce(arg : STD_ULOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of and'ing all of the bits of the vector. 

  FUNCTION nand_reduce(arg : STD_ULOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  FUNCTION or_reduce(arg : STD_ULOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of or'ing all of the bits of the vector. 

  FUNCTION nor_reduce(arg : STD_ULOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  FUNCTION xor_reduce(arg : STD_ULOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  FUNCTION xnor_reduce(arg : STD_ULOGIC_VECTOR) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xnor'ing all of the bits of the vector. 

  FUNCTION and_reduce(arg : SIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of and'ing all of the bits of the vector. 

  FUNCTION nand_reduce(arg : SIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  FUNCTION or_reduce(arg : SIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of or'ing all of the bits of the vector. 

  FUNCTION nor_reduce(arg : SIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  FUNCTION xor_reduce(arg : SIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  FUNCTION xnor_reduce(arg : SIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xnor'ing all of the bits of the vector. 

  FUNCTION and_reduce(arg : UNSIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of and'ing all of the bits of the vector. 

  FUNCTION nand_reduce(arg : UNSIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  FUNCTION or_reduce(arg : UNSIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of or'ing all of the bits of the vector. 

  FUNCTION nor_reduce(arg : UNSIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  FUNCTION xor_reduce(arg : UNSIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  FUNCTION xnor_reduce(arg : UNSIGNED) RETURN STD_LOGIC; 
  -- Result subtype: STD_LOGIC. 
  -- Result: Result of xnor'ing all of the bits of the vector. 

  -- bit_vector versions
  FUNCTION and_reduce(arg : BIT_VECTOR) RETURN BIT; 
  -- Result subtype: BIT. 
  -- Result: Result of and'ing all of the bits of the vector. 

  FUNCTION nand_reduce(arg : BIT_VECTOR) RETURN BIT; 
  -- Result subtype: BIT. 
  -- Result: Result of nand'ing all of the bits of the vector. 

  FUNCTION or_reduce(arg : BIT_VECTOR) RETURN BIT; 
  -- Result subtype: BIT. 
  -- Result: Result of or'ing all of the bits of the vector. 

  FUNCTION nor_reduce(arg : BIT_VECTOR) RETURN BIT; 
  -- Result subtype: BIT. 
  -- Result: Result of nor'ing all of the bits of the vector. 

  FUNCTION xor_reduce(arg : BIT_VECTOR) RETURN BIT; 
  -- Result subtype: BIT. 
  -- Result: Result of xor'ing all of the bits of the vector. 

  FUNCTION xnor_reduce(arg : BIT_VECTOR) RETURN BIT; 
  -- Result subtype: BIT. 
  -- Result: Result of xnor'ing all of the bits of the vector. 

end reduce_pack;

-- Package body.
package body reduce_pack is

-- done in a recursively called function.
  function and_reduce (arg : std_logic_vector )
    return std_logic is
    variable Upper, Lower : std_logic;
    variable Half : integer;
    variable BUS_int : std_logic_vector ( arg'length - 1 downto 0 );
    variable Result : std_logic;
  begin
    if (arg'LENGTH < 1) then            -- In the case of a NULL range
      Result := '1';                    -- Change for version 1.3
    else
      BUS_int := to_ux01 (arg);
      if ( BUS_int'length = 1 ) then
        Result := BUS_int ( BUS_int'left );
      elsif ( BUS_int'length = 2 ) then
        Result := BUS_int ( BUS_int'right ) and BUS_int ( BUS_int'left );
      else
        Half := ( BUS_int'length + 1 ) / 2 + BUS_int'right;
        Upper := and_reduce ( BUS_int ( BUS_int'left downto Half ));
        Lower := and_reduce ( BUS_int ( Half - 1 downto BUS_int'right ));
        Result := Upper and Lower;
      end if;
    end if;
    return Result;
  end;

  function nand_reduce (arg : std_logic_vector )
    return std_logic is
  begin
    return not and_reduce (arg);
  end;  

  function or_reduce (arg : std_logic_vector )
    return std_logic is
    variable Upper, Lower : std_logic;
    variable Half : integer;
    variable BUS_int : std_logic_vector ( arg'length - 1 downto 0 );
    variable Result : std_logic;
  begin
    if (arg'LENGTH < 1) then            -- In the case of a NULL range
      Result := '0';
    else
      BUS_int := to_ux01 (arg);
      if ( BUS_int'length = 1 ) then
        Result := BUS_int ( BUS_int'left );
      elsif ( BUS_int'length = 2 ) then
        Result := BUS_int ( BUS_int'right ) or BUS_int ( BUS_int'left );
      else
        Half := ( BUS_int'length + 1 ) / 2 + BUS_int'right;
        Upper := or_reduce ( BUS_int ( BUS_int'left downto Half ));
        Lower := or_reduce ( BUS_int ( Half - 1 downto BUS_int'right ));
        Result := Upper or Lower;
      end if;
    end if;
    return Result;
  end;

  function nor_reduce (arg : std_logic_vector )
    return std_logic is
  begin
    return not or_reduce ( arg );
  end;
  
  function xor_reduce (arg : std_logic_vector )
    return std_logic is
    variable Upper, Lower : std_logic;
    variable Half : integer;
    variable BUS_int : std_logic_vector ( arg'length - 1 downto 0 );
    variable Result : std_logic;
  begin
    if (arg'LENGTH < 1) then            -- In the case of a NULL range
      Result := '0';
    else
      BUS_int := to_ux01 (arg);
      if ( BUS_int'length = 1 ) then
        Result := BUS_int ( BUS_int'left );
      elsif ( BUS_int'length = 2 ) then
        Result := BUS_int ( BUS_int'right ) xor BUS_int ( BUS_int'left );
      else
        Half := ( BUS_int'length + 1 ) / 2 + BUS_int'right;
        Upper := xor_reduce ( BUS_int ( BUS_int'left downto Half ));
        Lower := xor_reduce ( BUS_int ( Half - 1 downto BUS_int'right ));
        Result := Upper xor Lower;
      end if;
    end if;
    return Result;
  end;

  function xnor_reduce (arg : std_logic_vector )
    return std_logic is
  begin
    return not xor_reduce ( arg );
  end;

  function and_reduce (arg : std_ulogic_vector )
    return std_logic is
  begin
    return and_reduce (std_logic_vector ( arg ));
  end;

  function and_reduce (arg : SIGNED )
    return std_logic is
  begin
    return and_reduce (std_logic_vector ( arg ));
  end;

  function and_reduce (arg : UNSIGNED )
    return std_logic is
  begin
    return and_reduce (std_logic_vector ( arg ));
  end;

  function nand_reduce (arg : std_ulogic_vector )
    return std_logic is
  begin
    return nand_reduce (std_logic_vector ( arg ));
  end;

  function nand_reduce (arg : SIGNED )
    return std_logic is
  begin
    return nand_reduce (std_logic_vector ( arg ));
  end;

  function nand_reduce (arg : UNSIGNED )
    return std_logic is
  begin
    return nand_reduce (std_logic_vector ( arg ));
  end;

  function or_reduce (arg : std_ulogic_vector )
    return std_logic is
  begin
    return or_reduce (std_logic_vector ( arg ));
  end;
  
  function or_reduce (arg : SIGNED )
    return std_logic is
  begin
    return or_reduce (std_logic_vector ( arg ));
  end;

  function or_reduce (arg : UNSIGNED )
    return std_logic is
  begin
    return or_reduce (std_logic_vector ( arg ));
  end;

  function nor_reduce (arg : std_ulogic_vector )
    return std_logic is
  begin
    return nor_reduce (std_logic_vector ( arg ));
  end;
  
  function nor_reduce (arg : SIGNED )
    return std_logic is
  begin
    return nor_reduce (std_logic_vector ( arg ));
  end;

  function nor_reduce (arg : UNSIGNED )
    return std_logic is
  begin
    return nor_reduce (std_logic_vector ( arg ));
  end;

  function xor_reduce (arg : std_ulogic_vector )
    return std_logic is
  begin
    return xor_reduce (std_logic_vector ( arg ));
  end;
  
  function xor_reduce (arg : SIGNED )
    return std_logic is
  begin
    return xor_reduce (std_logic_vector ( arg ));
  end;

  function xor_reduce (arg : UNSIGNED )
    return std_logic is
  begin
    return xor_reduce (std_logic_vector ( arg ));
  end;
  
  function xnor_reduce (arg : std_ulogic_vector )
    return std_logic is
  begin
    return xnor_reduce (std_logic_vector ( arg ));
  end;

  function xnor_reduce (arg : SIGNED )
    return std_logic is
  begin
    return xnor_reduce (std_logic_vector ( arg ));
  end;

  function xnor_reduce (arg : UNSIGNED )
    return std_logic is
  begin
    return xnor_reduce (std_logic_vector ( arg ));
  end;

  function and_reduce (arg : bit_vector )
    return bit is
  begin
    return to_bit (and_reduce (to_stdlogicvector ( arg )));
  end;
  
  function nand_reduce (arg : bit_vector )
    return bit is
  begin
    return to_bit (nand_reduce (to_stdlogicvector ( arg )));
  end;
  
  function or_reduce (arg : bit_vector )
    return bit is
  begin
    return to_bit (or_reduce (to_stdlogicvector ( arg )));
  end;

  function nor_reduce (arg : bit_vector )
    return bit is
  begin
    return to_bit (nor_reduce (to_stdlogicvector ( arg )));
  end;

  function xor_reduce (arg : bit_vector )
    return bit is
  begin
    return to_bit (xor_reduce (to_stdlogicvector ( arg )));
  end;
  
  function xnor_reduce (arg : bit_vector )
    return bit is
  begin
    return to_bit (xnor_reduce (to_stdlogicvector ( arg )));
  end;

end reduce_pack;


