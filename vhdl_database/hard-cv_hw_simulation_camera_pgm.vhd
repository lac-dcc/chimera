-- Copyright 2010 Martin Thompson (martin@parallelpoints.com). All
-- rights reserved.
-- 
-- Redistribution and use in source, binary and physical forms, with
-- or without modification, are permitted provided that the following
-- conditions are met:
-- 
--    1. Redistributions of source code must retain the above
--       copyright notice, this list of conditions and the following
--       disclaimer.
-- 
--    2. Redistributions in binary or physical form must reproduce the
--       above copyright notice, this list of conditions and the
--       following disclaimer in the documentation and/or other
--       materials provided with the distribution.
-- 
-- THE FILES ARE PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
-- CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-- WITH THE FILES OR THE USE OR OTHER DEALINGS IN THE FILES

package pgm is
    subtype coordinate is natural;
    subtype pixel is integer range 0 to 255;
    type pixel_array is array (coordinate range <>, coordinate range <>) of pixel;
    type pixel_array_ptr is access pixel_array;
    impure function pgm_read (
        filename : string)
        return pixel_array_ptr;
    procedure pgm_write (
        filename : in string;
        i        : in pixel_array);

    procedure assert_equal (prefix : string; expected, got : pixel_array; level : severity_level := error);
    -- Function: transpose
    -- Useful for initialising arrays such that the first coordinate is the x-coord, but the initialisation can "look" like the
    -- image in question within the code
    function transpose (i          : pixel_array) return pixel_array;
end package pgm;

use std.textio.all;
use work.libv.all;
package body pgm is

    impure function pgm_read (
        filename : string)
        return pixel_array_ptr is
        file pgmfile           : text;
        variable width, height : coordinate;                     -- storage for image dimensions
        variable l             : line;                           -- buffer for a line of text
        variable s             : string(1 to 2);                 -- to check the P2 header
        variable ints          : integer_vector(1 to 3);         -- store the first three integers (width, height and depth)
        variable int           : integer;                        -- temporary storage
        variable ch            : character;                      -- temporary storage
        variable good          : boolean;                        -- to record whether a read is successful or not
        variable count         : positive;                       -- keep track of how many numbers we've read
        variable empty_image   : pixel_array_ptr := null;        -- return this on error
        variable ret           : pixel_array_ptr;                -- actual return value
        variable x, y          : coordinate;                     -- coordinate tracking
    begin  -- function pgm_read
        -- setup some defaults
        width  := 0;
        height := 0;
        file_open(pgmfile, filename, read_mode);
        readline(pgmfile, l);
        read(l, s(1));
        read(l, s(2), good);
        if not good or s /= "P2" then
            report "PGM file '"&filename&"' not P2 type" severity warning;
            file_close(pgmfile);
            return empty_image;
        end if;
        allints : loop  -- read until we have 3 integers (width, height and colour depth).  
            line_reading : loop
                readline(pgmfile, l);
                exit when l.all(1) = '#';                        -- skip comments;
                if l'length = 0 then
                    report "EOF reached in pgmfile before opening integers found" severity warning;
                    file_close(pgmfile);
                    return empty_image;
                end if;
                number_reading : loop
                    read(l, ints(count), good);
                    exit number_reading when not good;           -- need to read some more from the file
                    count := count + 1;
                    exit allints        when count > ints'high;  -- got enough ints now
                end loop;
            end loop;
            exit when count > ints'high;                         -- shouldn't happen, but paranoia
        end loop;
          -- Now we have our header sorted. store it
        width  := ints(1);
        height := ints(2);
        -- now read the image pixels
        x      := 0;
        y      := 0;
        ret    := new pixel_array(0 to width-1, 0 to height-1);
        allpixels : loop
            readline(pgmfile, l);
            exit when l = null;
            exit when l'length = 0;
            loop
                read(l, int, good);
                exit           when not good;
                ret(x, y) := int;
                exit allpixels when x = width-1 and y = height-1;
                x         := x + 1;
                if x >= width then
                    x := 0;
                    y := y + 1;
                end if;
            end loop;
        end loop allpixels;
        assert (x = width-1 and y = height-1)
            report "Don't seem to have read all the pixels I should have"
            severity warning;
        return ret;
    end function pgm_read;
    procedure pgm_write (
        filename : in string;
        i        : in pixel_array) is
        file pgmfile : text;
        variable l   : line;
    begin  -- procedure pgm_write
        file_open(pgmfile, filename, write_mode);
        write(l, string'("P2"));
        writeline(pgmfile, l);
        write(l, str(i'length(1)) & " " & str(i'length(2)));
        writeline(pgmfile, l);
        write(l, str(pixel'high));
        writeline(pgmfile, l);
        for y in i'range(2) loop
            for x in i'range(1) loop
                write(l, str(i(x, y)) & " ");
            end loop;  -- x
            writeline(pgmfile, l);
        end loop;  -- y
        file_close(pgmfile);
        deallocate(l);
    end procedure pgm_write;

    procedure assert_equal (
        prefix        : string;
        expected, got : pixel_array;
        level         : severity_level := error) is
    begin  -- procedure assert_equal
        assert_equal(prefix & "(width)", expected'length(1), got'length(1), level);
        assert_equal(prefix & "(height)", expected'length(2), got'length(2), level);
        for y in expected'range(2) loop
            for x in expected'range(1) loop
                assert expected(x, y) = got(x, y)
                    report prefix & " (" & str(x) & "," & str(y) & ")" &
                    str(expected(x, y)) & " /= " & str(got(x, y))
                    severity level;
            end loop;  -- x
        end loop;  -- y
    end procedure assert_equal;

    function transpose (i : pixel_array) return pixel_array is
        variable ret : pixel_array(i'range(2), i'range(1));
    begin  -- function transpose
        for i1 in i'range(1) loop
            for i2 in i'range(2) loop
                ret(i2, i1) := i(i1, i2);
            end loop;  -- i2
        end loop;  -- i1
        return ret;
    end function transpose;
end package body pgm;
----------------------------------------------------------------------------------------------------------------------------------

entity tb_pgm is
end entity tb_pgm;

use work.libv.all;
use work.pgm.all;
architecture test of tb_pgm is
begin  -- architecture test
    test1 : process is
        variable i : pixel_array_ptr;
        -- Without the transpose function, we would have to present the initialisation data in a non-intuitive way.
        constant testdata : pixel_array(0 to 7, 0 to 3) := transpose(pixel_array'(
            (000, 027, 062, 095, 130, 163, 198, 232),
            (000, 000, 000, 000, 000, 000, 000, 000),
            (255, 255, 255, 255, 255, 255, 255, 255),
            (100, 100, 100, 100, 100, 255, 255, 255))
        );
        variable blacksquare : pixel_array(0 to 7, 0 to 7) := (others => (others => 0));
    begin  -- process test1
          -- test on a proper image
        i := pgm_read("testimage_ascii.pgm");
        assert i /= null report "pixels are null" severity error;
        assert_equal("ASCII PGM Width", i.all'length(1), 8);
        assert_equal("ASCII PGM Height", i.all'length(2), 4);
        assert_equal("ASCII PGM data", i.all, testdata);

          -- make sure we return a non-image for the binary-style PGM file
        i := pgm_read("testimage.pgm");
        assert i = null report "Binary pixels should be null" severity error;

        -- Now create an image from scratch - a letter M
        blacksquare(1, 1) := 255; blacksquare(5, 1) := 255;
        blacksquare(1, 2) := 255; blacksquare(2, 2) := 255; blacksquare(4, 2) := 255; blacksquare(5, 2) := 255;
        blacksquare(1, 3) := 255; blacksquare(3, 3) := 255; blacksquare(5, 3) := 255;
        blacksquare(1, 4) := 255; blacksquare(5, 4) := 255;
        blacksquare(1, 5) := 255; blacksquare(5, 5) := 255;
        blacksquare(1, 6) := 255; blacksquare(5, 6) := 255;
        pgm_write("test_write.pgm", blacksquare);
        report "End of tests" severity note;
        wait;
    end process test1;

end architecture test;