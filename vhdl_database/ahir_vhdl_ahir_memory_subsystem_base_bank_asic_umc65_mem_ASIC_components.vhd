------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai, Ch. V. Kalyani
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
--------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.types.all;
use ahir.utilities.all;

package mem_ASIC_components is

  component SZKA65_16X16X1CM2 is
   port(       DO : out std_logic_vector(15 downto 0);
      A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      DI : in std_logic_vector(15 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CKA   :   IN   std_logic;
      CKB   :   IN   std_logic;
      CSAN  :   IN   std_logic;
      CSBN  :   IN   std_logic
);
  end component;
  component SZKA65_16X32X1CM2 is
   port(       DO : out std_logic_vector(31 downto 0);
      A : in std_logic_vector(3 downto 0);
      B : in std_logic_vector(3 downto 0);
      DI : in std_logic_vector(31 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CKA   :   IN   std_logic;
      CKB   :   IN   std_logic;
      CSAN  :   IN   std_logic;
      CSBN  :   IN   std_logic
);
  end component;
  component SZKA65_64X4X1CM2 is
   port(       DO : out std_logic_vector(3 downto 0);
      A : in std_logic_vector(5 downto 0);
      B : in std_logic_vector(5 downto 0);
      DI : in std_logic_vector(3 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CKA   :   IN   std_logic;
      CKB   :   IN   std_logic;
      CSAN  :   IN   std_logic;
      CSBN  :   IN   std_logic
);
  end component;
  component SZKA65_64X8X1CM2 is
   port(       DO : out std_logic_vector(7 downto 0);
      A : in std_logic_vector(5 downto 0);
      B : in std_logic_vector(5 downto 0);
      DI : in std_logic_vector(7 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CKA   :   IN   std_logic;
      CKB   :   IN   std_logic;
      CSAN  :   IN   std_logic;
      CSBN  :   IN   std_logic
);
  end component;
  component SZKA65_64X16X1CM2 is
   port(       DO : out std_logic_vector(15 downto 0);
      A : in std_logic_vector(5 downto 0);
      B : in std_logic_vector(5 downto 0);
      DI : in std_logic_vector(15 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CKA   :   IN   std_logic;
      CKB   :   IN   std_logic;
      CSAN  :   IN   std_logic;
      CSBN  :   IN   std_logic
);
  end component;
  component SJKA65_32X128X1CM4 is
   port(       DOA : out std_logic_vector(127 downto 0);
      DOB : out std_logic_vector(127 downto 0);
      A : in std_logic_vector(4 downto 0);
      B : in std_logic_vector(4 downto 0);
      DIA : in std_logic_vector(127 downto 0);
      DIB : in std_logic_vector(127 downto 0);
     WEAN                          :   IN   std_logic;
     WEBN                          :   IN   std_logic;
     DVSE                          :   IN   std_logic;
     DVS                           :   IN   std_logic_vector (3 downto 0);
     CKA                            :   IN   std_logic;
     CKB                            :   IN   std_logic;
     CSAN                            :   IN   std_logic;
     CSBN                            :   IN   std_logic
);
  end component;
  component SJKA65_64X4X1CM4 is
   port(       DOA : out std_logic_vector(3 downto 0);
      DOB : out std_logic_vector(3 downto 0);
      A : in std_logic_vector(5 downto 0);
      B : in std_logic_vector(5 downto 0);
      DIA : in std_logic_vector(3 downto 0);
      DIB : in std_logic_vector(3 downto 0);
     WEAN                          :   IN   std_logic;
     WEBN                          :   IN   std_logic;
     DVSE                          :   IN   std_logic;
     DVS                           :   IN   std_logic_vector (3 downto 0);
     CKA                            :   IN   std_logic;
     CKB                            :   IN   std_logic;
     CSAN                            :   IN   std_logic;
     CSBN                            :   IN   std_logic
);
  end component;
  component SJKA65_64X8X1CM4 is
   port(       DOA : out std_logic_vector(7 downto 0);
      DOB : out std_logic_vector(7 downto 0);
      A : in std_logic_vector(5 downto 0);
      B : in std_logic_vector(5 downto 0);
      DIA : in std_logic_vector(7 downto 0);
      DIB : in std_logic_vector(7 downto 0);
     WEAN                          :   IN   std_logic;
     WEBN                          :   IN   std_logic;
     DVSE                          :   IN   std_logic;
     DVS                           :   IN   std_logic_vector (3 downto 0);
     CKA                            :   IN   std_logic;
     CKB                            :   IN   std_logic;
     CSAN                            :   IN   std_logic;
     CSBN                            :   IN   std_logic
);
  end component;
  component SJKA65_64X16X1CM4 is
   port(       DOA : out std_logic_vector(15 downto 0);
      DOB : out std_logic_vector(15 downto 0);
      A : in std_logic_vector(5 downto 0);
      B : in std_logic_vector(5 downto 0);
      DIA : in std_logic_vector(15 downto 0);
      DIB : in std_logic_vector(15 downto 0);
     WEAN                          :   IN   std_logic;
     WEBN                          :   IN   std_logic;
     DVSE                          :   IN   std_logic;
     DVS                           :   IN   std_logic_vector (3 downto 0);
     CKA                            :   IN   std_logic;
     CKB                            :   IN   std_logic;
     CSAN                            :   IN   std_logic;
     CSBN                            :   IN   std_logic
);
  end component;
  component SJKA65_256X4X1CM4 is
   port(       DOA : out std_logic_vector(3 downto 0);
      DOB : out std_logic_vector(3 downto 0);
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      DIA : in std_logic_vector(3 downto 0);
      DIB : in std_logic_vector(3 downto 0);
     WEAN                          :   IN   std_logic;
     WEBN                          :   IN   std_logic;
     DVSE                          :   IN   std_logic;
     DVS                           :   IN   std_logic_vector (3 downto 0);
     CKA                            :   IN   std_logic;
     CKB                            :   IN   std_logic;
     CSAN                            :   IN   std_logic;
     CSBN                            :   IN   std_logic
);
  end component;
  component SJKA65_256X16X1CM4 is
   port(       DOA : out std_logic_vector(15 downto 0);
      DOB : out std_logic_vector(15 downto 0);
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      DIA : in std_logic_vector(15 downto 0);
      DIB : in std_logic_vector(15 downto 0);
     WEAN                          :   IN   std_logic;
     WEBN                          :   IN   std_logic;
     DVSE                          :   IN   std_logic;
     DVS                           :   IN   std_logic_vector (3 downto 0);
     CKA                            :   IN   std_logic;
     CKB                            :   IN   std_logic;
     CSAN                            :   IN   std_logic;
     CSBN                            :   IN   std_logic
);
  end component;
  component SJKA65_256X32X1CM4 is
   port(       DOA : out std_logic_vector(31 downto 0);
      DOB : out std_logic_vector(31 downto 0);
      A : in std_logic_vector(7 downto 0);
      B : in std_logic_vector(7 downto 0);
      DIA : in std_logic_vector(31 downto 0);
      DIB : in std_logic_vector(31 downto 0);
     WEAN                          :   IN   std_logic;
     WEBN                          :   IN   std_logic;
     DVSE                          :   IN   std_logic;
     DVS                           :   IN   std_logic_vector (3 downto 0);
     CKA                            :   IN   std_logic;
     CKB                            :   IN   std_logic;
     CSAN                            :   IN   std_logic;
     CSBN                            :   IN   std_logic
);
  end component;
  component SHKA65_32X32X1CM4 is
   port(       DO : out std_logic_vector(31 downto 0);
      A : in std_logic_vector(4 downto 0);
      DI : in std_logic_vector(31 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_64X16X1CM4 is
   port(       DO : out std_logic_vector(15 downto 0);
      A : in std_logic_vector(5 downto 0);
      DI : in std_logic_vector(15 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_64X64X1CM4 is
   port(       DO : out std_logic_vector(63 downto 0);
      A : in std_logic_vector(5 downto 0);
      DI : in std_logic_vector(63 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_64X128X1CM4 is
   port(       DO : out std_logic_vector(127 downto 0);
      A : in std_logic_vector(5 downto 0);
      DI : in std_logic_vector(127 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_128X32X1CM4 is
   port(       DO : out std_logic_vector(31 downto 0);
      A : in std_logic_vector(6 downto 0);
      DI : in std_logic_vector(31 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_128X64X1CM4 is
   port(       DO : out std_logic_vector(63 downto 0);
      A : in std_logic_vector(6 downto 0);
      DI : in std_logic_vector(63 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_512X4X1CM4 is
   port(       DO : out std_logic_vector(3 downto 0);
      A : in std_logic_vector(8 downto 0);
      DI : in std_logic_vector(3 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_512X16X1CM4 is
   port(       DO : out std_logic_vector(15 downto 0);
      A : in std_logic_vector(8 downto 0);
      DI : in std_logic_vector(15 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_512X64X1CM4 is
   port(       DO : out std_logic_vector(63 downto 0);
      A : in std_logic_vector(8 downto 0);
      DI : in std_logic_vector(63 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_4096X8X1CM16 is
   port(       DO : out std_logic_vector(7 downto 0);
      A : in std_logic_vector(11 downto 0);
      DI : in std_logic_vector(7 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_4096X64X1CM8 is
   port(       DO : out std_logic_vector(63 downto 0);
      A : in std_logic_vector(11 downto 0);
      DI : in std_logic_vector(63 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
  component SHKA65_16384X8X1CM16 is
   port(       DO : out std_logic_vector(7 downto 0);
      A : in std_logic_vector(13 downto 0);
      DI : in std_logic_vector(7 downto 0);
      WEB  :   IN   std_logic;
      DVSE :   IN   std_logic;
      DVS  :   IN   std_logic_vector (2 downto 0);
      CK   :   IN   std_logic;
      CSB  :   IN   std_logic
);
  end component;
end package;

