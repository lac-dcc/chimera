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

  component DPRAM_32X8 is
   port(       QA,QB : out std_logic_vector(7 downto 0);
      AA,AB,AMA,AMB : in std_logic_vector(4 downto 0) := TieHighSlvConstant(5);
      DA,DB,DMA,DMB,BWEBA,BWEBB,BWEBMA,BWEBMB : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD, VG, VS  :   IN   std_logic := '1'; --- ????? 
      BIST  :   IN   std_logic := '1'; --- ????? 
      AWT:   IN   std_logic := '1'; --- ????? 
      WTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      RTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      CEBA, CEBB :   IN   std_logic := '1';
      CEBMA, CEBMB :   IN   std_logic := '1';
      WEBA, WEBB :   IN   std_logic := '1';
      WEBMA, WEBMB :   IN   std_logic := '1';
      CLKA, CLKB, CLKM  :   IN   std_logic := '1');
  end component;
  component DPRAM_256X32 is
   port(       QA,QB : out std_logic_vector(31 downto 0);
      AA,AB,AMA,AMB : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      DA,DB,DMA,DMB,BWEBA,BWEBB,BWEBMA,BWEBMB : in std_logic_vector(31 downto 0) := TieHighSlvConstant(32);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD, VG, VS  :   IN   std_logic := '1'; --- ????? 
      BIST  :   IN   std_logic := '1'; --- ????? 
      AWT:   IN   std_logic := '1'; --- ????? 
      WTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      RTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      CEBA, CEBB :   IN   std_logic := '1';
      CEBMA, CEBMB :   IN   std_logic := '1';
      WEBA, WEBB :   IN   std_logic := '1';
      WEBMA, WEBMB :   IN   std_logic := '1';
      CLKA, CLKB, CLKM  :   IN   std_logic := '1');
  end component;
  component DPRAM_2048X8 is
   port(       QA,QB : out std_logic_vector(7 downto 0);
      AA,AB,AMA,AMB : in std_logic_vector(10 downto 0) := TieHighSlvConstant(11);
      DA,DB,DMA,DMB,BWEBA,BWEBB,BWEBMA,BWEBMB : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD, VG, VS  :   IN   std_logic := '1'; --- ????? 
      BIST  :   IN   std_logic := '1'; --- ????? 
      AWT:   IN   std_logic := '1'; --- ????? 
      WTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      RTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      CEBA, CEBB :   IN   std_logic := '1';
      CEBMA, CEBMB :   IN   std_logic := '1';
      WEBA, WEBB :   IN   std_logic := '1';
      WEBMA, WEBMB :   IN   std_logic := '1';
      CLKA, CLKB, CLKM  :   IN   std_logic := '1');
  end component;
  component DPRAM_2048X36 is
   port(       QA,QB : out std_logic_vector(35 downto 0);
      AA,AB,AMA,AMB : in std_logic_vector(10 downto 0) := TieHighSlvConstant(11);
      DA,DB,DMA,DMB,BWEBA,BWEBB,BWEBMA,BWEBMB : in std_logic_vector(35 downto 0) := TieHighSlvConstant(36);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD, VG, VS  :   IN   std_logic := '1'; --- ????? 
      BIST  :   IN   std_logic := '1'; --- ????? 
      AWT:   IN   std_logic := '1'; --- ????? 
      WTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      RTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      CEBA, CEBB :   IN   std_logic := '1';
      CEBMA, CEBMB :   IN   std_logic := '1';
      WEBA, WEBB :   IN   std_logic := '1';
      WEBMA, WEBMB :   IN   std_logic := '1';
      CLKA, CLKB, CLKM  :   IN   std_logic := '1');
  end component;
  component DPRAM_256X52 is
   port(       QA,QB : out std_logic_vector(51 downto 0);
      AA,AB,AMA,AMB : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      DA,DB,DMA,DMB,BWEBA,BWEBB,BWEBMA,BWEBMB : in std_logic_vector(51 downto 0) := TieHighSlvConstant(52);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD, VG, VS  :   IN   std_logic := '1'; --- ????? 
      BIST  :   IN   std_logic := '1'; --- ????? 
      AWT:   IN   std_logic := '1'; --- ????? 
      WTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      RTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      CEBA, CEBB :   IN   std_logic := '1';
      CEBMA, CEBMB :   IN   std_logic := '1';
      WEBA, WEBB :   IN   std_logic := '1';
      WEBMA, WEBMB :   IN   std_logic := '1';
      CLKA, CLKB, CLKM  :   IN   std_logic := '1');
  end component;
  component DPRAM_32X64 is
   port(       QA,QB : out std_logic_vector(63 downto 0);
      AA,AB,AMA,AMB : in std_logic_vector(4 downto 0) := TieHighSlvConstant(5);
      DA,DB,DMA,DMB,BWEBA,BWEBB,BWEBMA,BWEBMB : in std_logic_vector(63 downto 0) := TieHighSlvConstant(64);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD, VG, VS  :   IN   std_logic := '1'; --- ????? 
      BIST  :   IN   std_logic := '1'; --- ????? 
      AWT:   IN   std_logic := '1'; --- ????? 
      WTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      RTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      CEBA, CEBB :   IN   std_logic := '1';
      CEBMA, CEBMB :   IN   std_logic := '1';
      WEBA, WEBB :   IN   std_logic := '1';
      WEBMA, WEBMB :   IN   std_logic := '1';
      CLKA, CLKB, CLKM  :   IN   std_logic := '1');
  end component;
  component DPRAM_32X4 is
   port(       QA,QB : out std_logic_vector(3 downto 0);
      AA,AB,AMA,AMB : in std_logic_vector(4 downto 0) := TieHighSlvConstant(5);
      DA,DB,DMA,DMB,BWEBA,BWEBB,BWEBMA,BWEBMB : in std_logic_vector(3 downto 0) := TieHighSlvConstant(4);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD, VG, VS  :   IN   std_logic := '1'; --- ????? 
      BIST  :   IN   std_logic := '1'; --- ????? 
      AWT:   IN   std_logic := '1'; --- ????? 
      WTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      RTSEL  :   IN   std_logic_vector(1 downto 0) := "11"; --- ????? 
      CEBA, CEBB :   IN   std_logic := '1';
      CEBMA, CEBMB :   IN   std_logic := '1';
      WEBA, WEBB :   IN   std_logic := '1';
      WEBMA, WEBMB :   IN   std_logic := '1';
      CLKA, CLKB, CLKM  :   IN   std_logic := '1');
  end component;
  component SRAM_64X4 is
   port(       Q : out std_logic_vector(3 downto 0);
      A, AM : in std_logic_vector(5 downto 0) := TieHighSlvConstant(6);
      D, DM, BWEB, BWEBM : in std_logic_vector(3 downto 0) := TieHighSlvConstant(4);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_64X32 is
   port(       Q : out std_logic_vector(31 downto 0);
      A, AM : in std_logic_vector(5 downto 0) := TieHighSlvConstant(6);
      D, DM, BWEB, BWEBM : in std_logic_vector(31 downto 0) := TieHighSlvConstant(32);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_256X8 is
   port(       Q : out std_logic_vector(7 downto 0);
      A, AM : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      D, DM, BWEB, BWEBM : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_256X32 is
   port(       Q : out std_logic_vector(31 downto 0);
      A, AM : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      D, DM, BWEB, BWEBM : in std_logic_vector(31 downto 0) := TieHighSlvConstant(32);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_8192X8 is
   port(       Q : out std_logic_vector(7 downto 0);
      A, AM : in std_logic_vector(12 downto 0) := TieHighSlvConstant(13);
      D, DM, BWEB, BWEBM : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_32X32 is
   port(       Q : out std_logic_vector(31 downto 0);
      A, AM : in std_logic_vector(4 downto 0) := TieHighSlvConstant(5);
      D, DM, BWEB, BWEBM : in std_logic_vector(31 downto 0) := TieHighSlvConstant(32);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_128X22 is
   port(       Q : out std_logic_vector(21 downto 0);
      A, AM : in std_logic_vector(6 downto 0) := TieHighSlvConstant(7);
      D, DM, BWEB, BWEBM : in std_logic_vector(21 downto 0) := TieHighSlvConstant(22);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_1024X8 is
   port(       Q : out std_logic_vector(7 downto 0);
      A, AM : in std_logic_vector(9 downto 0) := TieHighSlvConstant(10);
      D, DM, BWEB, BWEBM : in std_logic_vector(7 downto 0) := TieHighSlvConstant(8);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_1024X64 is
   port(       Q : out std_logic_vector(63 downto 0);
      A, AM : in std_logic_vector(9 downto 0) := TieHighSlvConstant(10);
      D, DM, BWEB, BWEBM : in std_logic_vector(63 downto 0) := TieHighSlvConstant(64);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_64X128 is
   port(       Q : out std_logic_vector(127 downto 0);
      A, AM : in std_logic_vector(5 downto 0) := TieHighSlvConstant(6);
      D, DM, BWEB, BWEBM : in std_logic_vector(127 downto 0) := TieHighSlvConstant(128);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_64X67 is
   port(       Q : out std_logic_vector(66 downto 0);
      A, AM : in std_logic_vector(5 downto 0) := TieHighSlvConstant(6);
      D, DM, BWEB, BWEBM : in std_logic_vector(66 downto 0) := TieHighSlvConstant(67);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_64X24 is
   port(       Q : out std_logic_vector(23 downto 0);
      A, AM : in std_logic_vector(5 downto 0) := TieHighSlvConstant(6);
      D, DM, BWEB, BWEBM : in std_logic_vector(23 downto 0) := TieHighSlvConstant(24);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
  component SRAM_64X90 is
   port(       Q : out std_logic_vector(89 downto 0);
      A, AM : in std_logic_vector(5 downto 0) := TieHighSlvConstant(6);
      D, DM, BWEB, BWEBM : in std_logic_vector(89 downto 0) := TieHighSlvConstant(90);
      SLP  :   IN   std_logic := '1'; --- ????? 
      SD   :   IN   std_logic := '1'; --- ????? 
      WEB  :   IN   std_logic;
      CEB  :   IN   std_logic;
      WEBM : in std_logic := '1'; --- ????? 
      CEBM : in std_logic := '1'; --- ????? 
      AWT  : in std_logic := '1'; --- ????? 
      BIST : in std_logic := '1'; --- ????? 
      CLK:   IN   std_logic);
  end component;
end package;

