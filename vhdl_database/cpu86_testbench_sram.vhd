-- ======================================================================================
--       A generic VHDL entity for a typical SRAM with complete timing parameters
--
--                   Static memory,  version 1.3     9. August 1996
--
-- ======================================================================================
--
-- (C) Andre' Klindworth, Dept. of Computer Science
--                        University of Hamburg
--                        Vogt-Koelln-Str. 30
--                        22527 Hamburg
--                        klindwor@informatik.uni-hamburg.de
--
-- This VHDL code may be freely copied as long as the copyright note isn't removed from 
-- its header. Full affiliation of anybody modifying this file shall be added to the
-- header prior to further distribution.
-- The download procedure originates from DLX memory-behaviour.vhdl: 
--                    Copyright (C) 1993, Peter J. Ashenden
--                    Mail:       Dept. Computer Science
--                                University of Adelaide, SA 5005, Australia
--                    e-mail:     petera@cs.adelaide.edu.au
--
--
-- 
-- Features:
--
--  o  generic memory size, width and timing parameters
--
--  o  18 typical SRAM timing parameters supported
--
--  o  clear-on-power-up and/or download-on-power-up if requested by generic
--
--  o  RAM dump into or download from an ASCII-file at any time possible 
--     (requested by signal)
--   
--  o  pair of active-low and active-high Chip-Enable signals 
--
--  o  nWE-only memory access control
--
--  o  many (but not all) timing and access control violations reported by assertions
-- 
--
--
-- RAM data file format:
--
-- The format of the ASCII-files for RAM download or dump is very simple:
-- Each line of the file consists of the memory address (given as a decimal number).
-- and the corresponding RAM data at this address (given as a binary number).
-- Any text in a line following the width-th digit of the binary number is ignored.
-- Please notice that address and data have to be seperated by a SINGLE blank,
-- that the binary number must have as many digits as specified by the generic  width,
-- and that no additional blanks or blank lines are tolerated. Example:
--                
--            0 0111011010111101 This text is interpreted as a comment
--            1 1011101010110010 
--            17 0010001001000100
--
--
-- Hints & traps:
--
-- If you have problems using this model, please feel free to to send me an e-mail.
-- Here are some potential problems which have been reported to me:
--
--    o There's a potential problem with passing the filenames for RAM download or
--      dump via port signals of type string. E.g. for Synopsys VSS, the string
--      assigned to a filename-port should have the same length as its default value.
--      If you are sure that you need a download or dump only once during a single
--      simulation run, you may remove the filename-ports from the interface list
--      and replace the constant string in the corresponding file declarations.
--
--    o Some simulators do not implement all of the standard TEXTIO-functions as
--      specified by the IEEE Std 1076-87 and IEEE Std 1076-93. Check it out.
--      If any of the (multiple overloaded) writeline, write, readline or
--      read functions that are used in this model is missing, you have to
--      write your own version and you should complain at your simulator tool
--      vendor for this deviation from the standard.
--
--    o If you are about to simulate a large RAM e.g. 4M * 32 Bit, representing
--      the RAM with a static array variable of 4 * 32 std_logic values uses a large 
--      amount of memory and may result in an out-of-memory error. A potential remedy 
--      for this is to use a dynamic data type, allocating memory for small blocks of
--      RAM data (e.g. a single word) only if they are actually referenced during a 
--      simulation run. A version of the SRAM model with dynamic memory allocation
--      shall be available at the same WWW-site were you obtained this file or at:
--        http://tech-www.informatik.uni-hamburg.de/vhdl/models/sram/sram.html
--      
--
-- Bugs:
--
--   No severe bugs have been found so far. Please report any bugs:
--   e-mail: klindwor@informatik.uni-hamburg.de
--
library std;   
use std.textio.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY sram IS
   GENERIC( 
      clear_on_power_up       : boolean := TRUE;
      download_on_power_up    : boolean := TRUE;
      trace_ram_load          : boolean := FALSE;
      enable_nWE_only_control : boolean := FALSE;
      size                    : INTEGER := 262144;
      adr_width               : INTEGER := 18;
      width                   : INTEGER := 8;
      tAA_max                 : TIME    := 20 NS;
      tOHA_min                : TIME    := 3 NS;
      tACE_max                : TIME    := 20 NS;
      tDOE_max                : TIME    := 8 NS;
      tLZOE_min               : TIME    := 0 NS;
      tHZOE_max               : TIME    := 8 NS;
      tLZCE_min               : TIME    := 3 NS;
      tHZCE_max               : TIME    := 10 NS;
      tWC_min                 : TIME    := 20 NS;
      tSCE_min                : TIME    := 18 NS;
      tAW_min                 : TIME    := 15 NS;
      tHA_min                 : TIME    := 0 NS;
      tSA_min                 : TIME    := 0 NS;
      tPWE_min                : TIME    := 13 NS;
      tSD_min                 : TIME    := 10 NS;
      tHD_min                 : TIME    := 0 NS;
      tHZWE_max               : TIME    := 10 NS;
      tLZWE_min               : TIME    := 0 NS
   );
   --  if TRUE, RAM is initialized with zeroes at start of simulation
   --  Clearing of RAM is carried out before download takes place
   --  if TRUE, RAM is downloaded at start of simulation
   --  Echoes the data downloaded to the RAM on the screen
   --  (included for debugging purposes)
   --  Read-/write access controlled by nWE only
   --  nOE may be kept active all the time
   -- 
   -- 
   -- 
   --      Configuring RAM size
   --  number of memory words
   --  number of address bits
   --  number of bits per memory word
   --  READ-cycle timing parameters
   --  Address Access Time
   --  Output Hold Time
   --  nCE/CE2 Access Time
   --  nOE Access Time
   --  nOE to Low-Z Output
   --   OE to High-Z Output
   --  nCE/CE2 to Low-Z Output
   --   CE/nCE2 to High Z Output
   --  WRITE-cycle timing parameters
   --  Write Cycle Time
   --  nCE/CE2 to Write End
   --  tAW Address Set-up Time to Write End
   --  tHA Address Hold from Write End
   --  Address Set-up Time
   --  nWE Pulse Width
   --  Data Set-up to Write End
   --  Data Hold from Write End
   --  nWE Low to High-Z Output
   --  nWE High to Low-Z Output
   PORT( 
      -- in file specified by download_filename to the RAM
      download_filename : IN     string(1 to 13)  := "loadfname.dat";           -- name of the download source file
      nCE               : IN     std_logic  := '1';                        -- low-active Chip-Enable of the SRAM device; defaults to '1' (inactive)
      nOE               : IN     std_logic  := '1';                        -- low-active Output-Enable of the SRAM device; defaults to '1' (inactive)
      nWE               : IN     std_logic  := '1';                        -- low-active Write-Enable of the SRAM device; defaults to '1' (inactive)
      A                 : IN     std_logic_vector (adr_width-1 DOWNTO 0);  -- address bus of the SRAM device
      D                 : INOUT  std_logic_vector (width-1 DOWNTO 0);      -- bidirectional data bus to/from the SRAM device
      CE2               : IN     std_logic  := '1';                        -- high-active Chip-Enable of the SRAM device; defaults to '1'  (active)
      download          : IN     boolean    := FALSE;                      -- A FALSE-to-TRUE transition on this signal downloads the data
      --            Passing the filename via a port of type
                                                            -- ********** string may cause a problem with some
                                                            -- WATCH OUT! simulators. The string signal assigned
                                                            -- ********** to the port at least should have the
                                                            --            same length as the default value.
       dump              : IN     boolean    := FALSE;                      -- A FALSE-to-TRUE transition on this signal dumps
       -- the current content of the memory to the file
                                            -- specified by dump_filename.
       dump_start        : IN     natural    := 0;                          -- Written to the dump-file are the memory words from memory address
       dump_end          : IN     natural    := size-1;                     -- dump_start to address dump_end (default: all addresses)
       dump_filename     : IN     string(1 to 13) := "dumpfname.dat"            -- name of the dump destination file
      -- (See note at port  download_filename)
   );

-- Declarations

END sram ;

-- hds interface_end



ARCHITECTURE behavior OF sram IS

  FUNCTION Check_For_Valid_Data (a: std_logic_vector) RETURN BOOLEAN IS
    VARIABLE result: BOOLEAN;
   BEGIN
    result := TRUE;
    FOR i IN a'RANGE LOOP
      result := (a(i) = '0') OR (a(i) = '1');
      IF NOT result THEN EXIT;
      END IF;
    END LOOP;
    RETURN result;
  END Check_For_Valid_Data;

  FUNCTION Check_For_Tristate (a: std_logic_vector) RETURN BOOLEAN IS
    VARIABLE result: BOOLEAN;
   BEGIN
    result := TRUE;
    FOR i IN a'RANGE LOOP
      result := (a(i) = 'Z');
      IF NOT result THEN EXIT;
      END IF;
    END LOOP;
    RETURN result;
  END Check_For_Tristate;
 
  SIGNAL tristate_vec: std_logic_vector(D'RANGE);   -- constant all-Z vector for data bus D
  SIGNAL undef_vec: std_logic_vector(D'RANGE);      -- constant all-X vector for data bus D
  SIGNAL undef_adr_vec: std_logic_vector(A'RANGE);  -- constant all-X vector for address bus

  SIGNAL read_active: BOOLEAN := FALSE;             -- Indicates whether the SRAM is sending on the D bus
  SIGNAL read_valid: BOOLEAN := FALSE;              -- If TRUE, the data output by the RAM is valid
  SIGNAL read_data: std_logic_vector(D'RANGE);      -- content of the memory location addressed by A
  SIGNAL do_write: std_logic := '0';                -- A '0'->'1' transition on this signal marks
                                                    -- the moment when the data on D is stored in the
                                                    -- addressed memory location
  SIGNAL adr_setup: std_logic_vector(A'RANGE);      -- delayed value of A to model the Address Setup Time
  SIGNAL adr_hold: std_logic_vector(A'RANGE);       -- delayed value of A to model the Address Hold Time
  SIGNAL valid_adr: std_logic_vector(A'RANGE);      -- valid memory address derived from A after
                                                    -- considering Address Setup and Hold Times
      
BEGIN


  PROCESS BEGIN                 -- static assignments to the variable length busses'
                                -- all-X and all-Z signal vectors
    FOR i IN D'RANGE LOOP
      tristate_vec(i) <= 'Z';
      undef_vec(i) <= 'X';
    END LOOP;
    FOR i IN A'RANGE LOOP
      undef_adr_vec(i) <= 'X';
    END LOOP;
    WAIT;
  END PROCESS;



  memory: PROCESS
   
    CONSTANT low_address: natural := 0;
    CONSTANT high_address: natural := size -1; 

    TYPE memory_array IS
      ARRAY (natural RANGE low_address TO high_address) OF std_logic_vector(width-1  DOWNTO 0);

    VARIABLE mem: memory_array;
    VARIABLE address : natural;
      
    VARIABLE write_data: std_logic_vector(width-1 DOWNTO 0);

    VARIABLE outline : line;


    PROCEDURE power_up (mem: inout memory_array; clear: boolean) IS

      VARIABLE init_value: std_logic;

     BEGIN

      IF clear THEN
        init_value := '0';
        write(outline, string'("Initializing SRAM with zero ..."));
        writeline(output, outline);

      ELSE
        init_value := 'X'; 
      END IF;
      FOR add IN low_address TO high_address LOOP
        FOR j IN (width-1) DOWNTO 0 LOOP
          mem(add)(j) := init_value;
        END LOOP;
      END LOOP; 

    END power_up;


    PROCEDURE load (mem: INOUT memory_array; download_filename: IN string) IS

   --   FILE source : text IS IN download_filename;
	  FILE source : text open READ_MODE is download_filename;
      VARIABLE inline, outline : line;
      VARIABLE add: natural;
      VARIABLE c : character;
      VARIABLE source_line_nr: integer := 1;
    --  VARIABLE init_value: std_logic := 'U';

     BEGIN
      write(outline, string'("Loading SRAM from file ") & download_filename & string'(" ... ") );
	  writeline(output, outline);

      WHILE NOT endfile(source) LOOP
        readline(source, inline);
        read(inline, add);
        read(inline, c); 
        IF (c /= ' ') THEN
          write(outline, string'("Syntax error in file '"));
          write(outline, download_filename);
          write(outline,  string'("', line "));
          write(outline, source_line_nr);
          writeline(output, outline);
          ASSERT FALSE
          REPORT "RAM loader aborted."
          SEVERITY FAILURE;
        END IF;
        FOR i IN (width -1) DOWNTO 0 LOOP
          read(inline, c);
	  IF (c = '1') THEN
            mem(add)(i) := '1';
          ELSE
            IF (c /= '0') THEN
              write(outline, string'("-W- Invalid character '"));
              write(outline, c);
              write(outline, string'("' in Bitstring in '"));
              write(outline, download_filename);
              write(outline, '(');
              write(outline, source_line_nr);
              write(outline, string'(") is set to '0'"));
              writeline(output, outline);
            END IF;
            mem(add)(i) := '0';
          END IF;
        END LOOP;
--        IF (trace_ram_load) THEN
--          write(outline, string'("RAM["));
--          write(outline, add);
--          write(outline, string'("] :=  "));
--          write(outline, mem(add));
--          writeline(output, outline );
--        END IF;
        source_line_nr := source_line_nr +1;

      END LOOP; -- WHILE

    END load;  -- PROCEDURE



     PROCEDURE do_dump (mem: INOUT memory_array; 
                        dump_start, dump_end: IN natural; 
                        dump_filename: IN string) IS
 
      -- FILE dest : text IS OUT dump_filename;
 	  FILE dest : text open WRITE_MODE is dump_filename;
       VARIABLE l : line;
   --    VARIABLE c : character;
 
      BEGIN
 
       IF (dump_start > dump_end)  OR (dump_end >= size) THEN
         ASSERT FALSE
         REPORT "Invalid addresses for memory dump. Cancelled."
         SEVERITY ERROR;
       ELSE
         FOR add IN dump_start TO dump_end LOOP
           write(l, add);
           write(l, ' ');
 --          FOR i IN (width-1) downto 0 LOOP
 --            write(l, mem(add)(i));
 --          END LOOP;
           writeline(dest, l);
         END LOOP;
       END IF;
 
     END do_dump;  -- PROCEDURE



   BEGIN
    power_up(mem, clear_on_power_up);
    IF download_on_power_up THEN 
      load(mem, download_filename);
    END IF;
    LOOP
      IF do_write'EVENT and (do_write = '1') then
        IF NOT Check_For_Valid_Data(D) THEN
          IF D'EVENT AND Check_For_Valid_Data(D'DELAYED) THEN
		  -- commented out for RTL sims
          --  write(outline, string'("-W- Data changes exactly at end-of-write to SRAM."));
          --  writeline(output, outline);

            write_data := D'delayed;
          ELSE
            write(outline, string'("-E- Data not valid at end-of-write to SRAM."));
            writeline(output, outline);

            write_data := undef_vec;
          END IF;
        ELSIF NOT D'DELAYED(tHD_min)'STABLE(tSD_min) THEN
          write(outline, string'("-E- tSD violation: Data input changes within setup-time at end-of-write to SRAM."));
          writeline(output, outline);

          write_data := undef_vec;
        ELSIF NOT D'STABLE(tHD_min) THEN
          write(outline, string'("-E- tHD violation: Data input changes within hold-time at end-of-write to SRAM."));
          writeline(output, outline);

          write_data := undef_vec;
        ELSIF nWE'DELAYED(tHD_min)'STABLE(tPWE_min) THEN
          write(outline, string'("-E- tPWE violation: Pulse width of nWE too short at SRAM."));
          writeline(output, outline);

          write_data := undef_vec;
        ELSE write_data := D;
        END IF;
        mem(CONV_INTEGER(valid_adr)) := write_data;
      END IF;
      IF Check_For_Valid_Data(valid_adr) THEN
        read_data <= mem(CONV_INTEGER(valid_adr));
      ELSE
        read_data <= undef_vec;
      END IF;
--       IF dump AND dump'EVENT THEN do_dump(mem, dump_start, dump_end, dump_filename);
--       END IF;
      IF download AND download'EVENT THEN load(mem, download_filename);
      END IF;
      WAIT ON do_write, valid_adr, download;
    END LOOP;

  END PROCESS memory;



  adr_setup <= TRANSPORT A AFTER tAA_max;
  adr_hold <= TRANSPORT A AFTER tOHA_min;

  valid_adr <= adr_setup WHEN     Check_For_Valid_Data(adr_setup)
                              AND (adr_setup = adr_hold) 
                              AND adr_hold'STABLE(tAA_max - tOHA_min) ELSE
               undef_adr_vec;

  read_active <=    (     (nOE = '0') AND (nOE'DELAYED(tLZOE_min) = '0') AND nOE'STABLE(tLZOE_min) 
                      AND ((nWE = '1') OR (nWE'DELAYED(tHZWE_max) = '0'))
                      AND (nCE = '0') AND (CE2 = '1') AND nCE'STABLE(tLZCE_min) AND CE2'STABLE(tLZCE_min))
                 OR (read_active AND (nOE'DELAYED(tHZOE_max) = '0') 
                                 AND (nWE'DELAYED(tHZWE_max) = '1')
                                 AND (nCE'DELAYED(tHZCE_max) = '0') AND (CE2'DELAYED(tHZCE_max) = '1'));

  read_valid <=     (     (nOE = '0') AND nOE'STABLE(tDOE_max) 
                      AND (nWE = '1') AND (nWE'DELAYED(tHZWE_max) = '1')
                      AND (nCE = '0') AND (CE2 = '1') AND nCE'STABLE(tACE_max) AND CE2'STABLE(tACE_max))
                 OR (read_valid AND read_active);

  D <= read_data WHEN read_valid and read_active ELSE
       undef_vec WHEN not read_valid and read_active ELSE
       tristate_vec;

       
  PROCESS (nWE, nCE, CE2) 
   BEGIN
    IF      ((nCE = '1') OR (nWE = '1') OR (CE2 = '0'))
        AND (nCE'DELAYED = '0') AND (CE2'DELAYED = '1') AND (nWE'DELAYED = '0') -- End of Write
      THEN 
        do_write <= '1' AFTER tHD_min;
    ELSE 
      IF (Now > 10 NS) AND (nCE = '0') AND (CE2 = '1') AND (nWE = '0') -- Start of Write
        THEN            
          ASSERT Check_For_Valid_Data(A)
          REPORT "Address not valid at start-of-write to RAM."
          SEVERITY FAILURE;
         
          ASSERT A'STABLE(tSA_min)
          REPORT "tSA violation: Address changed within setup-time at start-of-write to SRAM."
          SEVERITY ERROR;

          ASSERT enable_nWE_only_control OR ((nOE = '1') AND nOE'STABLE(tSA_min))
          REPORT "tSA violation: nOE not inactive at start-of-write to RAM."
          SEVERITY ERROR;
      END IF;
      do_write <= '0';
    END IF;
  END PROCESS;
 


-- The following processes check for validity of the control signals at the
-- SRAM interface. Removing them to speed up simulation will not affect the
-- functionality of the SRAM model.      
     

  PROCESS (A) -- Checks that an address change is allowed
  BEGIN
    IF (Now > 0 NS) THEN  -- suppress obsolete error message at time 0
      ASSERT (nCE = '1') OR (CE2 = '0') OR (nWE = '1')
      REPORT "Address not stable while write-to-SRAM active"
      SEVERITY FAILURE;

      ASSERT     (nCE = '1') OR (CE2 = '0') OR (nWE = '1')
             OR  (nCE'DELAYED(tHA_min) = '1') OR (CE2'DELAYED(tHA_min) = '0')
             OR (nWE'DELAYED(tHA_min) = '1')
      REPORT "tHA violation: Address changed within hold-time at end-of-write to SRAM."
      SEVERITY FAILURE;
    END IF;
  END PROCESS;


  PROCESS (nOE, nWE, nCE, CE2)  -- Checks that control signals at RAM are valid all the time
   BEGIN
    IF (Now > 0 NS) AND (nCE /= '1') AND (CE2 /= '0') THEN
      IF (nCE = '0') AND (CE2 = '1') THEN
        ASSERT (nWE = '0') OR (nWE = '1')
        REPORT "Invalid nWE-signal at SRAM while nCE is active"
        SEVERITY WARNING;
      ELSE
        IF (nCE /= '0') THEN  
          ASSERT (nOE = '1')  
          REPORT "Invalid nCE-signal at SRAM while nOE not inactive"
          SEVERITY WARNING;
      
          ASSERT (nWE = '1')
          REPORT "Invalid nCE-signal at SRAM while nWE not inactive"
          SEVERITY ERROR;
        END IF;
        IF (CE2 /= '1') THEN  
          ASSERT (nOE = '1')  
          REPORT "Invalid CE2-signal at SRAM while nOE not inactive"
          SEVERITY WARNING;
      
          ASSERT (nWE = '1')
          REPORT "Invalid CE2-signal at SRAM while nWE not inactive"
          SEVERITY ERROR;
        END IF;
      END IF;
    END IF;
  END PROCESS;

END behavior;
