--  Module      : cam_pkg.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Package file with constants and functions definitions 
--                for the CAM core
--                **This file contains architecture-dependent constructs 
--                and must be updated for newer architectures.
--
--  Company     : Xilinx, Inc.
--
--  (c) Copyright 2001-2011 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Library Declarations
-------------------------------------------------------------------------------
LIBRARY std;
USE std.textio.ALL;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


LIBRARY cam;
USE cam.cam_init_file_pack_xst.ALL;

-------------------------------------------------------------------------------
-- Package declaration
-------------------------------------------------------------------------------
PACKAGE cam_pkg IS

  -----------------------------------------------------------------------------
  -- Constants Definition
  -----------------------------------------------------------------------------
  CONSTANT ANY                   : STRING := "any";
  CONSTANT SPARTAN3              : STRING := "spartan3";
  CONSTANT ASPARTAN3             : STRING := "aspartan3";
  CONSTANT ASPARTAN3A            : STRING := "aspartan3a";
  CONSTANT ASPARTAN3ADSP         : STRING := "aspartan3adsp";
  CONSTANT ASPARTAN3E            : STRING := "aspartan3e";
  CONSTANT SPARTAN3E             : STRING := "spartan3e";
  CONSTANT SPARTAN3A             : STRING := "spartan3a";
  CONSTANT SPARTAN3ADSP          : STRING := "spartan3adsp";
  CONSTANT SPARTAN6              : STRING := "spartan6";
  CONSTANT VIRTEX4               : STRING := "virtex4";
  CONSTANT AVIRTEX4              : STRING := "avirtex4";
  CONSTANT VIRTEX5               : STRING := "virtex5";
  CONSTANT VIRTEX6               : STRING := "virtex6";
  CONSTANT VIRTEX6L              : STRING := "virtex6l";
 
  CONSTANT ZERO                  : STD_LOGIC := '0';
  CONSTANT ZEROS4                : STD_LOGIC_VECTOR(3 DOWNTO 0)     
                                   := (OTHERS => '0');
  CONSTANT ZEROS16               : STD_LOGIC_VECTOR(15 DOWNTO 0)   
                                   := (OTHERS => '0');
  CONSTANT ZEROS32               : STD_LOGIC_VECTOR(31 DOWNTO 0)   
                                   := (OTHERS => '0');
  CONSTANT ZEROS256              : STD_LOGIC_VECTOR(255 DOWNTO 0) 
                                   := (OTHERS => '0');

  CONSTANT C_ENCODED_ADDR        : INTEGER := 0;
  CONSTANT C_UNENCODED_ADDR      : INTEGER := 1;
  CONSTANT C_MULT_UNENCODED_ADDR : INTEGER := 2;
  CONSTANT C_SRL_MEM             : INTEGER := 0;
  CONSTANT C_BLOCK_MEM           : INTEGER := 1;
  CONSTANT C_LOWEST_MATCH        : INTEGER := 0;
  CONSTANT C_HIGHEST_MATCH       : INTEGER := 1;
  CONSTANT C_TERNARY_MODE_OFF    : INTEGER := 0;
  CONSTANT C_TERNARY_MODE_STD    : INTEGER := 1;
  CONSTANT C_TERNARY_MODE_ENH    : INTEGER := 2;
  CONSTANT TFF                   : TIME    := 2 ns;



  -----------------------------------------------------------------------------
  -- Functions Definitions
  -----------------------------------------------------------------------------
  -- Functions added from iputils
  FUNCTION roundup_to_multiple(data_value: INTEGER; multipleof: INTEGER)
  RETURN INTEGER;
  
  FUNCTION binary_width_of_integer (data_value: INTEGER) RETURN INTEGER;
  
  FUNCTION if_then_else (condition  : INTEGER;
                         true_case  : INTEGER; 
                         false_case : INTEGER) RETURN INTEGER;
  
  FUNCTION if_then_else (condition  : BOOLEAN; 
                         true_case  : INTEGER; 
                         false_case : INTEGER) RETURN INTEGER;

  FUNCTION addr_width_for_depth (depth : INTEGER) RETURN INTEGER;
  
  FUNCTION two_comp(vect : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;
  
  FUNCTION rat( value : STD_LOGIC ) RETURN STD_LOGIC;
  
  FUNCTION char_to_std_logic (char : IN CHARACTER) RETURN STD_LOGIC;
       
  FUNCTION int_2_std_logic_vector( value, bitwidth : INTEGER ) 
  RETURN STD_LOGIC_VECTOR;
  
  FUNCTION std_logic_vector_2_posint(vect : STD_LOGIC_VECTOR) RETURN INTEGER;
  
  FUNCTION std_logic_vector_2_string(v : STD_LOGIC_VECTOR) RETURN STRING;                   
                                                                                        
  FUNCTION divroundup (data_value : INTEGER; divisor : INTEGER) RETURN INTEGER;
  
  FUNCTION get_min ( a : INTEGER; b : INTEGER) RETURN INTEGER;
  
  FUNCTION equalIgnoreCase( str1, str2 : STRING ) RETURN BOOLEAN;
  
  FUNCTION toLowerCaseChar( char : CHARACTER ) RETURN CHARACTER;
  
  FUNCTION derived ( child, ancestor : STRING ) RETURN BOOLEAN;
  
  FUNCTION calc_cmp_data_mask_rev (simul_read_write, tern_mode : INTEGER) 
  RETURN INTEGER;
  
  FUNCTION calc_data_mask (tern_mode : INTEGER) 
  RETURN INTEGER;
  
  FUNCTION calc_match_addr_width_rev (depth           : INTEGER; 
                                  match_addr_type : INTEGER) RETURN INTEGER;
                                     
  FUNCTION synth_ternary_compare (maska : STD_LOGIC_VECTOR; 
                                  dataa : STD_LOGIC_VECTOR; 
                                  maskb : STD_LOGIC_VECTOR; 
                                  datab : STD_LOGIC_VECTOR) RETURN BOOLEAN;
  
  FUNCTION synth_ternary_compare_xy (maska : STD_LOGIC_VECTOR; 
                                     dataa : STD_LOGIC_VECTOR; 
                                     maskb : STD_LOGIC_VECTOR; 
                                     datab : STD_LOGIC_VECTOR) RETURN BOOLEAN;

  -- Other functions
   
  IMPURE FUNCTION read_init_file(filename : IN STRING;
                                 valid    : IN INTEGER;
                                 depth    : IN INTEGER;
                                 width    : IN INTEGER) 
  RETURN STD_LOGIC_VECTOR;

   
  FUNCTION word_config(vector     : IN STD_LOGIC_VECTOR;
                       is_ternary : IN INTEGER;  
                       old_length : IN INTEGER;
                       new_length : IN INTEGER) RETURN STD_LOGIC_VECTOR;

  FUNCTION init_decode(data       : IN STD_LOGIC_VECTOR;
                       is_ternary : IN INTEGER) RETURN BIT_VECTOR;


  FUNCTION normalize_slv(vector : IN STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;


  attribute max_fanout:integer;
  attribute max_fanout of all: entity is 10;

END cam_pkg;

-------------------------------------------------------------------------------
-- Package body
-------------------------------------------------------------------------------

PACKAGE BODY cam_pkg IS

-------------------------------------------------------------------------------
-- Functions - Taken from ul_utils
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- synth_ternary_compare
-- This function compares two ternary values which are described using
-- a combination of mask and data. When the mask bit = '1', the bit
-- is considered an X, and will match either a 0 or a 1 bit.
-------------------------------------------------------------------------------

  FUNCTION synth_ternary_compare (maska : std_logic_vector; 
                                  dataa : std_logic_vector; 
                                  maskb : std_logic_vector; 
                                  datab : std_logic_vector) RETURN boolean IS
    VARIABLE ternary_match_vector : std_logic_vector(dataa'high DOWNTO dataa'low)  
                                    := (OTHERS => '0');
    VARIABLE zero_vector          : std_logic_vector(dataa'high DOWNTO dataa'low)  
                                    := (OTHERS => '0');
  BEGIN
    FOR i IN dataa'low TO dataa'high LOOP
       ternary_match_vector(i) := NOT (maska(i) OR maskb(i)) AND 
                                      (dataa(i) XOR datab(i));
    END LOOP;  -- i

    IF ternary_match_vector = zero_vector THEN
      RETURN true;                     --match
    ELSE
      RETURN false;                    --no match
    END IF;
  END synth_ternary_compare;

-------------------------------------------------------------------------------
-- synth_ternary_compare
-- This function compares two ternary values which are described using
-- a combination of mask and data. When the mask bit = '1', the bit
-- is considered an X, and will match either a 0 or a 1 bit.
-------------------------------------------------------------------------------

  FUNCTION synth_ternary_compare_xy (maska : std_logic_vector; 
                                     dataa : std_logic_vector; 
                                     maskb : std_logic_vector; 
                                     datab : std_logic_vector) 
    RETURN boolean IS
    VARIABLE tern_match_vector : std_logic_vector(dataa'high DOWNTO dataa'low) 
                                 := (OTHERS => '0');
    VARIABLE zero_vector       : std_logic_vector(dataa'high DOWNTO dataa'low) 
                                 := (OTHERS => '0');
  BEGIN
    FOR i IN dataa'low TO dataa'high LOOP
       tern_match_vector(i) := (((maska(i)) OR (maskb(i))) AND 
                                ((dataa(i)) OR (datab(i))));
    END LOOP;  -- i

    IF tern_match_vector = zero_vector THEN
      RETURN true;                     --match
    ELSE
      RETURN false;                    --no match
    END IF;
  END synth_ternary_compare_xy;

-------------------------------------------------------------------------------  
-- Function to call the read_meminit_file procedure
-- this function will return one long STD_LOGIC_VECTOR
-- as a return value.	 
-- Takes parameters
--   filename : Name of the file to which to write data
--   valid	  : If .mif file is provided or not
--   depth    : Depth of CAM in words
--   width    : Width of .mif file in bits
-------------------------------------------------------------------------------  
  IMPURE FUNCTION read_init_file(filename : IN STRING;	  
                          valid    : IN INTEGER;
                          depth    : IN INTEGER;
                          width    : IN INTEGER)
    RETURN STD_LOGIC_VECTOR IS
    VARIABLE init_vect : STD_LOGIC_VECTOR (depth*width - 1 DOWNTO 0);
    VARIABLE lines : INTEGER := depth;
  BEGIN	 
    ASSERT valid < 2
      REPORT "invalid selection of c_mem_init field" SEVERITY ERROR;
    IF valid = 1 THEN
      read_meminit_file(filename, depth, width, init_vect, lines);
    ELSE
    init_vect := (OTHERS => '0');
    END IF;
    RETURN init_vect;
  END read_init_file;		  
  
-------------------------------------------------------------------------------
-- word_config
--  
-- Manipulates the "word" of data read from the .mif file
-- depending on the word width, ternary mode, AND if in ternary mode
-- does the .mif file have masks?
--
-- Takes parameters
--   vector     : Name of vector containing the word of info from the .mif file
--   is_ternary : Is CAM in ternary mode?
--   has_mask   : Are the maskes represented in the .mif file?
--   old_length : Length of the word read from the .mif file.
--   new_legth  : Length of the word needed to fit a word into SRL16 structure
-------------------------------------------------------------------------------
  FUNCTION word_config(vector     : IN STD_LOGIC_VECTOR;
                       is_ternary : IN INTEGER;	 
                       old_length : IN INTEGER;
                       new_length : IN INTEGER)
    RETURN STD_LOGIC_VECTOR is
    VARIABLE new_vect     : STD_LOGIC_VECTOR (new_length-1 downto 0)
                            := (OTHERS => '0');
    VARIABLE i            : INTEGER:= 0;
    VARIABLE maskdata     : STD_LOGIC_VECTOR(1 DOWNTO 0);
    VARIABLE mask_2bit    : STD_LOGIC_VECTOR(1 downto 0);
    VARIABLE data_2bit    : STD_LOGIC_VECTOR(1 downto 0);
    CONSTANT old_length_i : INTEGER := old_length; 
    CONSTANT vector_i     : STD_LOGIC_VECTOR(old_length - 1 downto 0):= vector;

  BEGIN
        
    ASSERT old_length <= new_length REPORT 
                                    "CANNOT EXTEND TO A SMALLER VECTOR" 
                                    SEVERITY FAILURE;
    
    -- NON-TERNARY MODE	  
    IF is_ternary = 0 THEN
      IF old_length_i = new_length THEN
        new_vect := vector_i;
      ELSE
        new_vect (old_length_i-1 downto 0) := vector_i;
      END IF;	
      -- TERNARY MODE	
    ELSE 
      i := 0;					  
      while i < old_length_i loop
        -- odd old_length
        IF i+1 = old_length_i then	
          --reformat vector to have "mask,data" format
          IF vector_i(i) = 'X' THEN
            maskdata(1) := '1';
            maskdata(0) := '0';
          ELSIF vector_i(i) = 'U' THEN
            maskdata(1) := 'U';
            maskdata(0) := 'U';
          ELSE	
            maskdata(1) := '0';
            maskdata(0) := vector_i(i);
          END IF;				
          new_vect(i*2+1 downto i*2):= maskdata;
          
        ELSE -- even old_length	
          --reformat vector to have "mask,data" format
          IF vector_i(i) = 'X' THEN
            mask_2bit(0) := '1';
            data_2bit(0) := '0';
          ELSIF vector_i(i) = 'U' THEN
            mask_2bit(0) := vector_i(i);
            data_2bit(0) := vector_i(i);
          ELSE	
            mask_2bit(0) := '0';
            data_2bit(0) := vector_i(i);
          END IF;	
          IF vector_i(i+1) = 'X' THEN
            mask_2bit(1) := '1';
            data_2bit(1) := '0';
          ELSIF vector_i(i+1) = 'U' THEN
            mask_2bit(1) := vector_i(i+1);
            data_2bit(1) := vector_i(i+1);
          ELSE	
            mask_2bit(1) := '0';
            data_2bit(1) := vector_i(i+1);
          END IF;
          new_vect(i*2+3 downto i*2):= mask_2bit & data_2bit;
        END IF;	
        i := i + 2;
      end loop;		 
      
    END IF;
    
    RETURN new_vect;
  END word_config;

-------------------------------------------------------------------------------
-- init_decode
--
-- Function to convert INIT data to SRL16E initialization values
-- non_ternary AND ternary mode	
--
-- Takes parameters
--   data       : part of word which will fit into one SRL16 primitive
--   is_ternary : is CAM in ternary mode?
-------------------------------------------------------------------------------
  FUNCTION init_decode(data        : IN STD_LOGIC_VECTOR;
                       is_ternary  : IN INTEGER)
    RETURN BIT_VECTOR is
    VARIABLE init_vect      : BIT_VECTOR (15 downto 0):= (OTHERS => '0');
    VARIABLE count          : STD_LOGIC_VECTOR(3 downto 0):= (OTHERS => '0');
    VARIABLE ternary_encode : STD_LOGIC_VECTOR(3 downto 0):= (OTHERS => '0');
    VARIABLE A              : STD_LOGIC := '0' ;
    VARIABLE B              : STD_LOGIC := '0' ;
    VARIABLE C              : STD_LOGIC := '0' ;
    VARIABLE D              : STD_LOGIC := '0' ;
    VARIABLE compare        : STD_LOGIC := '0' ;
    VARIABLE match          : BOOLEAN := false;
    CONSTANT data_i         : STD_LOGIC_VECTOR(3 downto 0):= data;
   
  BEGIN
     -- ternary encode data with the masks ( data(3) AND data(2) are masks)
     A := ((not data_i(1)) AND (not data_i(0))) OR (data_i(3) AND data_i(2)) OR
          ((not data_i(1)) AND data_i(2)) OR ((not data_i(0)) AND data_i(3));

     B := ((not data_i(1)) AND data_i(0)) OR (data_i(3) AND data_i(2)) OR
          ((not data_i(1)) AND data_i(2)) OR (data_i(0) AND data_i(3));
 
     C := (data_i(1) AND (not data_i(0))) OR (data_i(3) AND data_i(2)) OR
          (data_i(1) AND data_i(2)) OR ((not data_i(0)) AND data_i(3)) ;
 
     D := (data_i(1) AND data_i(0)) OR (data_i(3) AND data_i(2)) OR
          (data_i(1) AND data_i(2)) OR (data_i(0) AND data_i(3));
    
    -- IF any bit is 'U' whole word will assume to be undefined
    IF data_i(3) = 'U' or data_i(2) = 'U' or data_i(1) = 'U' or data_i(0) = 'U'
      THEN
      init_vect:= (OTHERS => '0');
    ELSE
      -- NON TERNARY MODE
      IF is_ternary = 0 THEN
        FOR i IN 0 to 15 LOOP
          count := int_2_std_logic_vector(i, 4);
          IF count = data_i THEN
            init_vect(i):= '1';
          ELSE
            init_vect(i):= '0';
          END IF;
        END LOOP;
      END IF;
      -- STANDARD TERNARY MODE
      IF is_ternary /= 0 THEN
        FOR i IN 0 to 15 LOOP
          count := int_2_std_logic_vector(i, 4);
          compare := (count(3) AND A) OR 
                     (count(2) AND B) OR 
                     (count(1) AND C) OR 
                     (count(0) AND D);
          IF compare = '1' THEN
            init_vect(i):= '1';
          ELSE
            init_vect(i):= '0';
          END IF;
        END LOOP;
    
      END IF;
    END IF;
    RETURN init_vect;
  END init_decode;
  
-------------------------------------------------------------------------------
-- normalize_slv
-- normalizes skew indexed STD_LOGIC_VECTOR to (index downto 0)
-------------------------------------------------------------------------------
  FUNCTION normalize_slv(vector:STD_LOGIC_VECTOR) 
    RETURN STD_LOGIC_VECTOR IS
    VARIABLE ret : STD_LOGIC_VECTOR((vector'high - vector'low) DOWNTO 0);
  BEGIN  -- normalize_slv
    FOR i IN vector'low TO vector'high LOOP
      ret(i - vector'low) := vector(i);
    END LOOP;  -- i
    RETURN ret;
    
  END normalize_slv;


-------------------------------------------------------------------------------
-- Functions copied form iputils
-------------------------------------------------------------------------------

  -----------------------------------------------------------------------------
  --   Round up to the next nearest INTEGER value which is divisible by the
  --   specified number.
  --   Round the number up to the next multiple of a number.
  -- Example:
  --   For the number 7, the nearest higher INTEGER divisible by 2 is 8.
  --   For the number 4, the nearest higher INTEGER divisible by 4 is 4.
  -- Algorithm:
  --   multipleof*roundup(data_value/multipleof)
  -- Parameters:
  --   data_value : number to be rounded
  --   multipleof : value of which the output should be a multiple
  -- Return : data_value rounded up to nearest multiple of "multipleof"
  -- NOTES:
  -----------------------------------------------------------------------------
  FUNCTION roundup_to_multiple(data_value : INTEGER; 
                               multipleof : INTEGER)
    RETURN INTEGER IS
    VARIABLE retval : INTEGER;
  BEGIN
    retval   := data_value/multipleof;
    IF ( (data_value MOD multipleof) /= 0) THEN
      retval := retval+1;
    END IF;
    retval := multipleof * retval;
   
    RETURN retval;
  END roundup_to_multiple;

  -----------------------------------------------------------------------------
  --   Calculates the number of bits/registers needed to represent/store the
  --    specified maximum value
  -- Example:
  --   A max value of 0 does not require any bits for storage.
  --   A max value of 255 requires 8 bits to represent/store.
  --   A max value of 256 requires 9 bits to represent/store.
  -- Algorithm:
  --   roundup(log2(data_value+1))
  -- Parameters:
  --   data_value : input number
  -- Return : number of bits needed
  -- NOTES: By definition, log2(-1+1) is undefined. However, this function will
  -- simply return a 0 for any input < 0.
  -----------------------------------------------------------------------------
  FUNCTION binary_width_of_integer (data_value : INTEGER)
   RETURN INTEGER IS

   VARIABLE dwidth : INTEGER := 0;

  BEGIN
    WHILE 2**dwidth-1 < data_value AND data_value > 0 LOOP
      dwidth := dwidth + 1;
    END LOOP;

    RETURN dwidth;
  END binary_width_of_integer;


  -----------------------------------------------------------------------------
  -- This function is used to implement an IF..THEN when such a statement is 
  -- not allowed.  It considers all non-zero INTEGERs as TRUE.
  -----------------------------------------------------------------------------
  FUNCTION if_then_else (condition  : INTEGER; 
                         true_case  : INTEGER; 
                         false_case : INTEGER) RETURN INTEGER IS
  VARIABLE retval : INTEGER := 0;
  BEGIN
    IF condition=0 THEN
      retval:=false_case;
    ELSE
      retval:=true_case;
    END IF;
    RETURN retval;
  END if_then_else;


  -----------------------------------------------------------------------------
  -- This function is used to implement an IF..THEN when such a statement is 
  -- not allowed.
  -----------------------------------------------------------------------------
  FUNCTION if_then_else (condition  : BOOLEAN; 
                         true_case  : INTEGER; 
                         false_case : INTEGER) RETURN INTEGER IS
  VARIABLE retval : INTEGER := 0;
  BEGIN
    IF NOT condition THEN
      retval:=false_case;
    ELSE
      retval:=true_case;
    END IF;
    RETURN retval;
  END if_then_else;

  -----------------------------------------------------------------------------
  --   Calculates the number of bits necessary for addressing a memory of
  --    of the specified depth.
  --   Equivalently, calculates the minimum number of bits required to have
  --    the specified number of unique states.
  -- Example: A memory with depth 256 requires an 8-bit addr bus.
  -- Example: To represent 256 unique values/states requires 8 bits.
  -- Algorithm:
  --   roundup(log2(depth))
  -- Parameters:
  --   depth : memory depth or unique values or states
  -- Return:
  --   INTEGER number of bits
  -- NOTES: By definition, log2(0) is undefined. However, this function will
  --   simply return a 0 for any input <= 0.
  -----------------------------------------------------------------------------
  FUNCTION addr_width_for_depth (depth : INTEGER)
    RETURN INTEGER IS
    VARIABLE bits : INTEGER := 0;
  BEGIN
    WHILE 2**bits < depth AND depth > 1 LOOP
      bits := bits + 1;
    END LOOP;

    RETURN bits;
  END addr_width_for_depth;

  -----------------------------------------------------------------------------
  -- Returns the lower case form of char if char is an upper case letter.
  -- Otherwise char is returned.
  -----------------------------------------------------------------------------
  FUNCTION toLowerCaseChar( char : CHARACTER ) RETURN CHARACTER IS
  BEGIN
     -- If char is not an upper case letter then return char
     IF char<'A' OR char>'Z' THEN
       RETURN char;
     END IF;
     -- Otherwise map char to its corresponding lower case character AND
     -- return that
     CASE char IS
       WHEN 'A' => RETURN 'a'; WHEN 'B' => RETURN 'b'; WHEN 'C' => RETURN 'c';
       WHEN 'D' => RETURN 'd'; WHEN 'E' => RETURN 'e'; WHEN 'F' => RETURN 'f'; 
       WHEN 'G' => RETURN 'g'; WHEN 'H' => RETURN 'h'; WHEN 'I' => RETURN 'i'; 
       WHEN 'J' => RETURN 'j'; WHEN 'K' => RETURN 'k'; WHEN 'L' => RETURN 'l';
       WHEN 'M' => RETURN 'm'; WHEN 'N' => RETURN 'n'; WHEN 'O' => RETURN 'o'; 
       WHEN 'P' => RETURN 'p'; WHEN 'Q' => RETURN 'q'; WHEN 'R' => RETURN 'r'; 
       WHEN 'S' => RETURN 's'; WHEN 'T' => RETURN 't'; WHEN 'U' => RETURN 'u'; 
       WHEN 'V' => RETURN 'v'; WHEN 'W' => RETURN 'w'; WHEN 'X' => RETURN 'x';
       WHEN 'Y' => RETURN 'y'; WHEN 'Z' => RETURN 'z';
       WHEN OTHERS => RETURN char;
     END CASE;
  END toLowerCaseChar;

  -----------------------------------------------------------------------------
  -- Returns true if case insensitive STRING comparison determines that
  -- str1 AND str2 are equal
  -----------------------------------------------------------------------------
  FUNCTION equalIgnoreCase( str1, str2 : STRING ) RETURN BOOLEAN IS
    CONSTANT len1 : INTEGER := str1'length;
    CONSTANT len2 : INTEGER := str2'length;
    VARIABLE equal : BOOLEAN := TRUE;
  BEGIN
     IF NOT (len1=len2) THEN
       equal := FALSE;
     ELSE
       FOR i IN str2'left TO str1'right LOOP
         IF NOT (toLowerCaseChar(str1(i)) = toLowerCaseChar(str2(i))) THEN
           equal := FALSE;
         END IF;
       END LOOP;
     END IF;
 
     RETURN equal;
  END equalIgnoreCase;

  -----------------------------------------------------------------------------
  -- FUNCTION: derived
  -- True if architecture "child" is derived from, or equal to,
  -- the architecture "ancestor".
  -- **This function is architecture-dependent and must be updated for newer
  --  architectures
  -----------------------------------------------------------------------------
  FUNCTION derived (child, ancestor : STRING ) RETURN BOOLEAN IS
    VARIABLE is_derived : BOOLEAN := FALSE;
  BEGIN
 IF equalIgnoreCase( child, VIRTEX4 ) THEN
      IF ( equalIgnoreCase(ancestor,VIRTEX4) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, AVIRTEX4 ) THEN
      IF ( equalIgnoreCase(ancestor,AVIRTEX4) OR
           equalIgnoreCase(ancestor,VIRTEX4) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, VIRTEX5 ) THEN
      IF ( equalIgnoreCase(ancestor,VIRTEX5) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, VIRTEX6 ) THEN
      IF ( equalIgnoreCase(ancestor,VIRTEX6) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, SPARTAN6) THEN
      IF ( equalIgnoreCase(ancestor,SPARTAN6) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, SPARTAN3ADSP) THEN
      IF ( equalIgnoreCase(ancestor,SPARTAN3ADSP) OR
           equalIgnoreCase(ancestor,SPARTAN3A) OR
           equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, SPARTAN3A) THEN
      IF ( equalIgnoreCase(ancestor,SPARTAN3A) OR
           equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child,ASPARTAN3A) THEN
      IF ( equalIgnoreCase(ancestor,ASPARTAN3A) OR
           equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, ASPARTAN3ADSP) THEN
      IF ( equalIgnoreCase(ancestor,ASPARTAN3ADSP) OR
           equalIgnoreCase(ancestor,SPARTAN3A) OR
           equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, ASPARTAN3E) THEN
      IF ( equalIgnoreCase(ancestor,ASPARTAN3E) OR
           equalIgnoreCase(ancestor,SPARTAN3E) OR
           equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, SPARTAN3E) THEN
      IF ( equalIgnoreCase(ancestor,SPARTAN3E) OR
           equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, SPARTAN3 ) THEN
      IF ( equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, ASPARTAN3 ) THEN
      IF ( equalIgnoreCase(ancestor,ASPARTAN3) OR
           equalIgnoreCase(ancestor,SPARTAN3) OR
           equalIgnoreCase(ancestor,ANY) )
      THEN
        is_derived := TRUE;
      END IF;
    ELSIF equalIgnoreCase( child, ANY ) THEN
      IF equalIgnoreCase( ancestor, ANY ) THEN
        is_derived := TRUE;
      END IF;
    END IF;
 
    RETURN is_derived;
  END derived;

  -----------------------------------------------------------------------------
  -- FUNCTION : divroundup
  -- Returns the ceiling value of the division
  -- Data_value - the quantity to be divided, dividend
  -- Divisor - the value to divide the data_value by
  -----------------------------------------------------------------------------
  FUNCTION divroundup (data_value : INTEGER; divisor : INTEGER)
    RETURN INTEGER IS
    VARIABLE div : INTEGER;
  BEGIN
    div   := data_value/divisor;
    IF ( (data_value MOD divisor) /= 0) THEN
      div := div+1;
    END IF;
    RETURN div;
  END divroundup;

  -----------------------------------------------------------------------------
  -- FUNCTION : get_min
  -- Returns the min(a,b)
  -----------------------------------------------------------------------------
  FUNCTION get_min ( a : INTEGER; b : INTEGER) RETURN INTEGER IS
    VARIABLE smallest  : INTEGER := 1;
  BEGIN
    IF (a < b) THEN
      smallest := a;
    ELSE
      smallest := b;
     END IF;
     RETURN smallest;
  END get_min;

  -----------------------------------------------------------------------------
  -- FUNCTION : std_logic_vector_2_posint
  -----------------------------------------------------------------------------
  FUNCTION std_logic_vector_2_posint(vect : STD_LOGIC_VECTOR)
    RETURN INTEGER IS

    VARIABLE result : INTEGER := 0;
  BEGIN
    FOR i IN vect'high DOWNTO vect'low LOOP
      result   := result * 2;
      IF (rat(vect(i)) = '1') THEN
        result := result + 1;
      END IF;
    END LOOP;
    RETURN result;
  END std_logic_vector_2_posint;

  -- purpose: converts a bit_vector to a std_logic_vector
  FUNCTION bv_to_slv(bitsin : BIT_VECTOR) RETURN STD_LOGIC_VECTOR IS
    VARIABLE ret : STD_LOGIC_VECTOR(bitsin'range);
  BEGIN
    FOR i IN bitsin'range LOOP
      IF bitsin(i) = '1' THEN
        ret(i) := '1';
      ELSE
        ret(i) := '0';
      END IF;
    END LOOP;

    RETURN ret;
  END bv_to_slv;

  ---------------------------------------------------------------------
  -- Convert character to type std_logic.
  ---------------------------------------------------------------------
  FUNCTION char_to_std_logic (char : IN CHARACTER)
    RETURN STD_LOGIC is
     VARIABLE data : STD_LOGIC;
  BEGIN
     IF char = '0' THEN
        data := '0';
     ELSIF char = '1' THEN
        data := '1';
     ELSE
        ASSERT false
           REPORT "character which is not '0' or '1'."
           SEVERITY WARNING;
        data := 'X';
     END IF;
     RETURN data;
  END char_to_std_logic;

  -----------------------------------------------------------------------------
  -- FUNCTION : int_2_std_logic_vector
  -----------------------------------------------------------------------------
  FUNCTION int_2_std_logic_vector( value, bitwidth : INTEGER )
    RETURN STD_LOGIC_VECTOR IS
    VARIABLE running_value  : INTEGER := value;
    VARIABLE running_result : STD_LOGIC_VECTOR(bitwidth-1 DOWNTO 0);
  BEGIN
    IF (value < 0) THEN
      running_value := -1 * value;
    END IF;

    FOR i IN 0 TO bitwidth-1 LOOP
      IF running_value MOD 2 = 0 THEN
        running_result(i) := '0';
      ELSE
        running_result(i) := '1';
      END IF;
      running_value := running_value/2;
    END LOOP;

    IF (value < 0) THEN                 -- find the 2s complement
      RETURN two_comp(running_result);
    ELSE
      RETURN running_result;
    END IF;

  END int_2_std_logic_vector;

  -----------------------------------------------------------------------------
  -- FUNCTION : std_logic_vector_2_string
  -----------------------------------------------------------------------------
  FUNCTION std_logic_vector_2_string(v : STD_LOGIC_VECTOR) 
    RETURN STRING IS
    VARIABLE str : STRING(1 TO v'high+1);
    CONSTANT ss  : STRING(1 TO 3) := "01X";
  BEGIN
    FOR i IN v'high DOWNTO v'low LOOP
      IF (v(i) = '0') THEN
        str(v'high-i+1) := ss(1);
      ELSIF (v(i) = '1') THEN
        str(v'high-i+1) := ss(2);
      ELSE
        str(v'high-i+1) := ss(3);
      END IF;
    END LOOP;
    RETURN str;
  END std_logic_vector_2_string;

  -----------------------------------------------------------------------------
  -- FUNCTION: rat
  -----------------------------------------------------------------------------
  FUNCTION rat( value : STD_LOGIC )
    RETURN STD_LOGIC IS
  BEGIN
    CASE value IS
      WHEN '0' | '1' => RETURN value;
      WHEN 'H'       => RETURN '1';
      WHEN 'L'       => RETURN '0';
      WHEN OTHERS    => RETURN 'X';
    END CASE;
  END rat;

  -----------------------------------------------------------------------------
  -- FUNCTION: two_comp
  -----------------------------------------------------------------------------
  FUNCTION two_comp(vect : STD_LOGIC_VECTOR)
    RETURN STD_LOGIC_VECTOR IS
    VARIABLE local_vect : STD_LOGIC_VECTOR(vect'high DOWNTO 0);
    VARIABLE toggle     : INTEGER := 0;
  BEGIN  
    FOR i IN 0 TO vect'high LOOP
      IF (toggle = 1) THEN
        IF (vect(i) = '0') THEN
          local_vect(i) := '1';
        ELSE
          local_vect(i) := '0';
        END IF;
      ELSE
        local_vect(i)   := vect(i);
        IF (vect(i) = '1') THEN
          toggle        := 1;
        END IF;
      END IF;
    END LOOP;
    RETURN local_vect;
  END two_comp;

  -----------------------------------------------------------------------------
  -- Determines whether or not the CMP_DATA_MASK port is present, based
  -- on the user-selected Simultaneous_Read_Write_Option AND Ternary_Mode
  -- user parameters.
  -----------------------------------------------------------------------------
  FUNCTION calc_cmp_data_mask_rev (simul_read_write, tern_mode : INTEGER) 
    RETURN INTEGER IS
  BEGIN
    IF ( ((tern_mode = 1) OR (tern_mode = 2)) AND (simul_read_write = 1) ) THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END calc_cmp_data_mask_rev;
  
  -----------------------------------------------------------------------------
  -- Determines whether or not the DATA_MASK port is present, based
  -- on the user-selected Ternary_Mode user parameters.
  -----------------------------------------------------------------------------
  FUNCTION calc_data_mask(tern_mode : INTEGER) 
    RETURN INTEGER IS
  BEGIN
    IF ((tern_mode = 1) OR (tern_mode = 2)) THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END calc_data_mask;


  -----------------------------------------------------------------------------
  -- calc_match_addr_width_rev
  --      Determines the with of the match_addr output port
  -----------------------------------------------------------------------------

  FUNCTION calc_match_addr_width_rev (depth           : INTEGER; 
                                         match_addr_type : INTEGER) 
    RETURN INTEGER IS
  BEGIN
    IF match_addr_type = 0 THEN
      RETURN addr_width_for_depth(depth);
    ELSE
      RETURN depth;
    END IF;
  END calc_match_addr_width_rev;


END cam_pkg;





