--address decoder
--the original hardware is based on BCD-decimal decoders 7442
--chip selects are generated for
-- -System RAM       x0000 - x3FFF        (16k)               "1000"
-- -DK10             xE000 - E400           1k
--                
-- -Video  RAM (BWS) xEC00 - xEFFF          1k DK13           "0010"
-- -System ROM       xF000 - xF7FF          4k DK14+15        "0100"

-- -Perpehrie (keyboard/tape) controller (IO)
--
-- FPGAkuechle
-- this sources are declared to Open Source by the author

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;
use work.pkg_redz0mb1e.all;

entity addr_decode is
  port (
    addr_i   : in  std_logic_vector(15 downto 0);
    ioreq_ni : in  std_logic;
    mreq_ni  : in  std_logic;
    rfsh_ni  : in  std_logic;
    cs_mem_o : out std_logic_vector(3 downto 0);--shall be low active
    cs_io_no : out std_logic_vector(3 downto 0)  --low active
    );
  end entity addr_decode;

  architecture behave of addr_decode is
      signal upper_select : boolean;
        signal mem_select : boolean;    --mem access (not refresh)
        signal io_select  : boolean;
        signal cs_mem_int : std_logic_vector(3 downto 0);
        signal cs_io_int  : std_logic_vector(3 downto 0);
  
  begin
      upper_select <= addr_i(15 downto 13) = "111";  --lower is USER-RAM
      mem_select   <= mreq_ni = '0' and rfsh_ni = '1'; --skip refresh cycles
      io_select    <= ioreq_ni = '0';   
        with addr_i(12 downto 10) select  --1k pages
        cs_mem_int <=   "1110" when "000", --xE00   DK10
                        "1111" when "001",  --xE400  free 
                        "1111" when "010",  --xE800  free 
                        "1101" when "011",  --xEC00  VideoRAM
                        "1011" when "100",  --xF000  Monitor-ROM
                        "1011" when "101",  --xF400  Monitor-ROM  
                        "1011" when "110",  --xF800  extra ROM
                        "1011" when "111",  --xFC00  extra ROM
                        "1111" when others;    

        with addr_i(4 downto 2) select  --1k pages
        cs_io_int  <=   "1110" when "000",  --x00    PIO
                        "1101" when "001",  --x04    iosel1 ? 
                        "1011" when "010",  --x08    keybrd driver - IOSEL2 
                        "1111" when others;    

    cs_mem_o <= cs_mem_int when upper_select and mem_select else   --PROM, Displayram
                    "0111" when mem_select else  --RAM   
                    "1111";                     

     cs_io_no  <=  cs_io_int when io_select else  --only one selcted yet
                "1111"; 
  end architecture behave;
