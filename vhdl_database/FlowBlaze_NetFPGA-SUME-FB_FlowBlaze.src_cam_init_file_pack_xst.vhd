--  Module      : cam_init_file_pack_xst.vhd
--
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Memory Initialization File reading and writing procedures 
--                VHDL-93 compatable version. Not compatable with VHDL-87
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

LIBRARY std;
USE std.textio.ALL;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


-------------------------------------------------------------------------------
-- This package contains procedures to read and write Memory Initialization
-- Files into or from a memory stored as a single STD_LOGIC_VECTOR
-------------------------------------------------------------------------------

PACKAGE CAM_INIT_FILE_PACK_XST IS

-------------------------------------------------------------------------------
-- Procedure to pad the default data with zero if the length is
-- not the width of the memory
-- Takes parameters
-- default_data : default data string
-- width : Width of the memory in bits
-------------------------------------------------------------------------------
  FUNCTION pad_string( data_string : IN string;
                       width       : IN integer
                       ) RETURN string;

-------------------------------------------------------------------------------
-- Procedure to count the number of characters required in the memory
-- initialization string for each memory location
-- Takes parameters
-- width : Width of the memory in bits
-- radix : Radix of string
-------------------------------------------------------------------------------
  FUNCTION getWidthChrs( width : IN integer;
                         radix : IN integer
                         ) RETURN integer;

-------------------------------------------------------------------------------
-- Procedure to manipulate the memory initialization string with user's
-- default data and return the padded initialization string.
-- Takes parameters
-- depth : Depth of the memory in words
-- width : Width of the memory in bits
-- radix : Radix of the initialization string
-- meminitdata: memory initialization string
-- defaultdata: user's default data
-------------------------------------------------------------------------------
  FUNCTION manipMemInit( depth       : IN integer;
                         width       : IN integer;
                         radix       : IN integer;
                         meminitdata : IN string;
                         defaultdata : IN string
                         ) RETURN string;

-------------------------------------------------------------------------------
-- Procedure to read a MIF file and place the data in a std_logic_vector
-- Takes parameters
-- filename : Name of the file from which to read data
-- depth : Depth of memory in words
-- width : Width of memory in bits
-- memvect : Memory vector ( must be depth*width in size )
-- lines : Number of lines to be read from file
-- If lines <= 0 or lines > depth then lines = depth
-- If the file has fewer lines then only the available
-- data is read
-------------------------------------------------------------------------------


  PROCEDURE read_meminit_file(
    filename : IN    STRING;
    depth    : IN    INTEGER;
    width    : IN    INTEGER;
    memvect  : OUT   STD_LOGIC_VECTOR;
    lines    : INOUT INTEGER
    );



-------------------------------------------------------------------------------
-- Procedure to write a MIF file using the data stored in a std_logic_vector
-- Takes parameters
--   filename : Name of the file to which to write data
--   depth    : Depth of memory in words
--   width    : Width of memory in bits
--   memvect  : Memory vector ( must be depth*width in size )
--   lines    : Number of lines to be written to file
--              If lines <= 0 or lines > depth then lines = depth
-------------------------------------------------------------------------------
  IMPURE FUNCTION write_meminit_file(filename    : IN string;
                                     depth       : IN integer;
                                     width       : IN integer;
                                     memvect     : IN bit_vector
                                     ) RETURN boolean;

-------------------------------------------------------------------------------
-- Function to calculate the number of lines in the given mif file
-- Takes parameters
-- filename : Name of the file to which data is to be written
-- depth : Depth of memory in words
-- width : Width of memory in bits
-------------------------------------------------------------------------------
  IMPURE FUNCTION find_num_of_lines( filename : IN string ) RETURN integer;

END CAM_INIT_FILE_PACK_XST;

PACKAGE BODY CAM_INIT_FILE_PACK_XST IS

  -----------------------------------------------------------------------------
  -- Procedure to pad the default data with zero if the length is
  -- not the width of the memory
  -- Takes parameters
  --   default_data : default data string
  --   width        : Width of the memory in bits
  -----------------------------------------------------------------------------
  FUNCTION pad_string( data_string : IN string;
                       width       : IN integer
                       ) RETURN string IS
    VARIABLE dstringlen            :    integer            := data_string'length;
    VARIABLE padded_data           :    string(1 TO width) := "";
  BEGIN

    FOR i IN 1 TO (width-dstringlen-1) LOOP
      padded_data(i) := '0';
    END LOOP;
    padded_data      := padded_data & data_string;
    RETURN padded_data;
  END pad_string;


  -----------------------------------------------------------------------------
  -- Procedure to count the number of characters required in the memory
  -- initialization string for each memory location
  -- Takes parameters
  --   width    : Width of the memory in bits
  --   radix    : Radix of string
  -----------------------------------------------------------------------------
  FUNCTION getWidthChrs( width : IN integer;
                         radix : IN integer
                         ) RETURN integer IS
    VARIABLE maxVal            :    integer := 2;
    VARIABLE bigOne            :    integer := 1;
    VARIABLE widthchrs         :    integer := 0;
  BEGIN
    maxVal                                  := maxVal**width;
    maxVal                                  := maxVal - bigOne;
    IF (radix = 2) THEN
      widthchrs                             := maxVal;
    ELSIF (radix = 10) THEN
      widthchrs                             := maxVal;
    ELSIF (radix = 16) THEN
      widthchrs                             := maxVal / 4;
    END IF;
    RETURN widthchrs;
  END getWidthChrs;

  -----------------------------------------------------------------------------
  -- Procedure to manipulate the memory initialization string with user's
  -- default data and return the padded initialization string.
  -- Takes parameters
  --   depth       : Depth of the memory in words
  --   width       : Width of the memory in bits
  --   radix       : Radix of the initialization string
  --   meminitdata : memory initialization string
  --   defaultdata : user's default data
  -----------------------------------------------------------------------------
  FUNCTION manipMemInit( depth       : IN integer;
                         width       : IN integer;
                         radix       : IN integer;
                         meminitdata : IN string;
                         defaultdata : IN string
                         ) RETURN string IS
    VARIABLE istringlen              :    integer                          := meminitdata'length;
    VARIABLE widthchrs               :    integer                          := getWidthChrs(width, radix);
    VARIABLE maxdlen                 :    integer                          := depth*widthchrs;
    VARIABLE defdlen                 :    integer                          := defaultdata'length;
    VARIABLE defdcnt                 :    integer                          := 0;
    VARIABLE defaultdata_tmp         :    string(1 TO widthchrs)           := "";
    VARIABLE memid                   :    string(1 TO maxdlen)             := "";
    VARIABLE defd                    :    string(1 TO (widthchrs-defdlen)) := "";
    VARIABLE meminitdata_tmp         :    string(1 TO (width*depth))       := "";
  BEGIN
    IF (defdlen = 0) THEN
      defaultdata_tmp                                                      := "0";
      defdlen                                                              := 1;
    END IF;

    IF (defdlen < widthchrs) THEN
      FOR i IN 1 TO (widthchrs-defdlen) LOOP
        defd(i)       := '0';
      END LOOP;
      defaultdata_tmp := defd & defaultdata;
      defdlen         := widthchrs;
    END IF;

    IF (istringlen < maxdlen) THEN
      FOR i IN istringlen TO (maxdlen-1) LOOP
        memid(i)        := defaultdata_tmp(defdcnt);
      END LOOP;
      IF (defdcnt = (defdlen-1)) THEN
        defdcnt         := 0;
      ELSE
        meminitdata_tmp := memid;
      END IF;
      meminitdata_tmp   := meminitdata;
    END IF;

    RETURN meminitdata_tmp;
  END manipMemInit;

  -----------------------------------------------------------------------------
  -- Procedure to count number of lines in the mif file
  -- Takes parameters
  --   filename : Name of the file from which to read data
  -----------------------------------------------------------------------------
  IMPURE FUNCTION find_num_of_lines ( filename : string
                                    ) RETURN integer IS
    FILE meminitfile                    : text;
    VARIABLE mif_status                 : file_open_status := open_ok;
    VARIABLE bitline                    : line;
    VARIABLE lines                      : integer          := 0;
  BEGIN
    file_open(meminitfile, filename, read_mode);
    IF (mif_status = open_ok) THEN
      WHILE (NOT (endfile(meminitfile))) LOOP
        readline(meminitfile, bitline);
        lines                                              := lines+1;
      END LOOP;
      file_close( meminitfile );
    END IF;
    RETURN lines;
  END find_num_of_lines;

  -----------------------------------------------------------------------------
  -- Procedure to read a MIF file and place the data in a std_logic_vector
  -- Takes parameters
  --   filename : Name of the file from which to read data
  --   depth    : Depth of memory in words
  --   width    : Width of memory in bits
  --   memvect  : Memory vector ( must be depth*width in size )
  --   lines    : Number of lines to be read from file
  --              If lines <= 0 or lines > depth then lines = depth
  --              If the file has fewer lines then only the available
  --              data is read
  -----------------------------------------------------------------------------
  PROCEDURE read_meminit_file(
    filename  : IN    STRING;
    depth     : IN    INTEGER;
    width     : IN    INTEGER;
    memvect   : OUT   STD_LOGIC_VECTOR;
    lines     : INOUT INTEGER
    ) IS
    FILE meminitfile                    :       TEXT IS filename;
    VARIABLE bit                        :       INTEGER;
    VARIABLE i                          :       INTEGER;
    VARIABLE bitline                    :       LINE;
    VARIABLE bitchar                    :       CHARACTER;
    VARIABLE bits_good                  :       BOOLEAN;
    VARIABLE offset                     :       INTEGER;
    VARIABLE total_lines                :       INTEGER;
    VARIABLE mem_vector                 :       STRING(width DOWNTO 1);
    CONSTANT mem_bits                   :       INTEGER := depth * width;
    CONSTANT vec_bits                   :       INTEGER := memvect'LENGTH;
  BEGIN
    ASSERT mem_bits = vec_bits
      REPORT "BAD MEMORY VECTOR SIZE" SEVERITY FAILURE;
    IF(lines > 0 AND lines <= depth) THEN
      total_lines                                       := lines;
    ELSE
      total_lines                                       := depth;
    END IF;
    lines                                               := 0;
    offset                                              := 0;
    WHILE (NOT (endfile(meminitfile)) AND (lines < total_lines)) LOOP
      readline(meminitfile, bitline);
      read(bitline, mem_vector, bits_good);
      FOR bit IN 0 TO width-1 LOOP
        bitchar                                         := mem_vector(bit+1);
        IF (bitchar = '1') THEN
          memvect(offset+bit)                           := '1';
        ELSIF (bitchar = '0') THEN
          memvect(offset+bit)                           := '0';
        ELSIF (bitchar = 'X' OR bitchar = 'x') THEN
          memvect(offset+bit)                           := 'X';
        ELSE
         
            ASSERT false REPORT "ERROR: read_meminit_file: unknown or illegal" &
            " character encountered while reading mif - " &
            "finishing file read." & 
            "This could be due to an undersized mif file."
            SEVERITY WARNING;
          
            memvect(offset + bit)                         := 'U';
        END IF;
      END LOOP;
      lines                                             := lines+1;
      offset                                            := offset + width;
    END LOOP;
    
  END read_meminit_file;
 

 


-----------------------------------------------------------------------------
  -- Function to write a MIF file using the data stored in a BIT_VECTOR
  -- Takes parameters
  --   filename : Name of the file to which data is to be written
  --   depth    : Depth of memory in words
  --   width    : Width of memory in bits
  --   memvect  : Memory vector ( if length < depth*width then it is padded
  --                              with '0's )
  -----------------------------------------------------------------------------
  IMPURE FUNCTION write_meminit_file(filename : IN STRING;
                                     depth    : IN INTEGER;
                                     width    : IN INTEGER;
                                     memvect  : IN BIT_VECTOR
                                     ) RETURN BOOLEAN IS
    FILE meminitfile                    :    TEXT;
    VARIABLE mif_status                 :    FILE_OPEN_STATUS;
    VARIABLE bitline                    :    LINE;
    VARIABLE bitchar                    :    CHARACTER;
    VARIABLE offset                     :    INTEGER;
    VARIABLE contents                   :    BIT_VECTOR(width-1 DOWNTO 0);
    CONSTANT mem_bits                   :    INTEGER := depth * width;
    CONSTANT vec_bits                   :    INTEGER := memvect'LENGTH;
  BEGIN

    file_open(meminitfile, filename, write_mode);

    ASSERT mif_status = OPEN_OK
      REPORT "Error : couldn't open memory initialization file."
      SEVERITY FAILURE;

    IF mif_status = OPEN_OK THEN
      offset := 0;

      FOR addrs IN 0 TO depth-1 LOOP
        FOR bit IN width-1 DOWNTO 0 LOOP
          IF (offset + bit) > (vec_bits-1) THEN
            bitchar   := '0';           -- Pad with '0's if memvect bits all used
          ELSE
            IF ( memvect(offset+bit) = '1' ) THEN
              bitchar := '1';
            ELSE
              bitchar := '0';
            END IF;
          END IF;  -- addrs

          WRITE(bitline, bitchar);
        END LOOP;  -- bit

        WRITELINE(meminitfile, bitline);
        offset := offset + width;
      END LOOP;  -- addrs

    END IF;  -- mif_status

    FILE_CLOSE( meminitfile );

    RETURN TRUE;                        -- XCC requires a return value

  END write_meminit_file;

END CAM_INIT_FILE_PACK_XST;
