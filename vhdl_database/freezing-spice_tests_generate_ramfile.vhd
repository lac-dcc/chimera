library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.common.all;

---------------------------------------------------------------------------------
-- This module assumes the test_config package has a record type which
-- contains a 'filename' field of type string, and a 'test' field of type
-- ram_t (an array of words) which contain the instruction bitvectors.
-- It will then write those instructions to a file in the format understood
-- by the 'dpram' module's initialization functionality.  This makes it possible
-- to load a new "RAM" for instructions and static data at each simulation.
---------------------------------------------------------------------------------
use work.test_config.all;

entity generate_ramfile is
end entity generate_ramfile;

architecture script of generate_ramfile is

    -- purpose: Generate ramfiles
    procedure main is
        file testfile    : text;
        variable outline : line;
        variable ok      : file_open_status;
    begin  -- procedure main

        --
        -- Create test files
        --
        --

        file_open(ok, testfile, test_configuration.filename, WRITE_MODE);
        if ok = open_ok then
            for l in test_configuration.test'range loop
                write(outline, test_configuration.test(l));
                writeline(testfile, outline);
            end loop;  -- l
            file_close(testfile);
        else
            write(outline, string'("Failed to open file "));
            write(outline, test_configuration.filename);
            writeline(output, outline);
        end if;
        
    end procedure main;

begin  -- architecture script
    
    main_proc : process is
        variable outline : line;
    begin  -- process main_proc
        main;
        write(outline, string'("generate_ramfile done."));
        writeline(output, outline);
        wait;
    end process main_proc;
    
end architecture script;

