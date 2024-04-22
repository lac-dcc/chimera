-------------------------------------------------------------------------------
--  CPU86 - VHDL CPU8088 IP core                                             --
--  Copyright (C) 2002-2008 HT-LAB                                           --
--                                                                           --
--  Contact/bugs : http://www.ht-lab.com/misc/feedback.html                  --
--  Web          : http://www.ht-lab.com                                     --
--                                                                           --
--  CPU86 is released as open-source under the GNU GPL license. This means   --
--  that designs based on CPU86 must be distributed in full source code      --
--  under the same license. Contact HT-Lab for commercial applications where --
--  source-code distribution is not desirable.                               --
--                                                                           --
-------------------------------------------------------------------------------
--                                                                           --
--  This library is free software; you can redistribute it and/or            --
--  modify it under the terms of the GNU Lesser General Public               --
--  License as published by the Free Software Foundation; either             --
--  version 2.1 of the License, or (at your option) any later version.       --
--                                                                           --
--  This library is distributed in the hope that it will be useful,          --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of           --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU        --
--  Lesser General Public License for more details.                          --
--                                                                           --
--  Full details of the license can be found in the file "copying.txt".      --
--                                                                           --
--  You should have received a copy of the GNU Lesser General Public         --
--  License along with this library; if not, write to the Free Software      --
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA  --
--                                                                           --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY formatter IS
   PORT( 
      lutbus   : IN     std_logic_vector (15 DOWNTO 0);
      mux_addr : OUT    std_logic_vector (2 DOWNTO 0);
      mux_data : OUT    std_logic_vector (3 DOWNTO 0);
      mux_reg  : OUT    std_logic_vector (2 DOWNTO 0);
      nbreq    : OUT    std_logic_vector (2 DOWNTO 0)
   );
END formatter ;


ARCHITECTURE struct OF formatter IS

   -- Architecture declarations
   SIGNAL dout   : std_logic_vector(15 DOWNTO 0);
   SIGNAL dout4  : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout5  : std_logic_vector(7 DOWNTO 0);
   SIGNAL muxout : std_logic_vector(7 DOWNTO 0);


   SIGNAL mw_I1temp_din : std_logic_vector(15 DOWNTO 0);

   -- Component Declarations
   COMPONENT a_table
   PORT (
      addr : IN     std_logic_vector (15 DOWNTO 0);
      dout : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT d_table
   PORT (
      addr : IN     std_logic_vector (15 DOWNTO 0);
      dout : OUT    std_logic_vector (3 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT m_table
   PORT (
      ireg   : IN     std_logic_vector (7 DOWNTO 0);
      modrrm : IN     std_logic_vector (7 DOWNTO 0);
      muxout : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT n_table
   PORT (
      addr : IN     std_logic_vector (15 DOWNTO 0);
      dout : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT r_table
   PORT (
      addr : IN     std_logic_vector (15 DOWNTO 0);
      dout : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;


BEGIN

   dout <= dout4 & muxout;

   mw_I1temp_din <= lutbus;
   i1combo_proc: PROCESS (mw_I1temp_din)
   VARIABLE temp_din: std_logic_vector(15 DOWNTO 0);
   BEGIN
      temp_din := mw_I1temp_din(15 DOWNTO 0);
      dout5 <= temp_din(7 DOWNTO 0);
      dout4 <= temp_din(15 DOWNTO 8);
   END PROCESS i1combo_proc;

   -- Instance port mappings.
   I2 : a_table
      PORT MAP (
         addr => dout,
         dout => mux_addr
      );
   I3 : d_table
      PORT MAP (
         addr => dout,
         dout => mux_data
      );
   I6 : m_table
      PORT MAP (
         ireg   => dout4,
         modrrm => dout5,
         muxout => muxout
      );
   I4 : n_table
      PORT MAP (
         addr => dout,
         dout => nbreq
      );
   I5 : r_table
      PORT MAP (
         addr => dout,
         dout => mux_reg
      );

END struct;
