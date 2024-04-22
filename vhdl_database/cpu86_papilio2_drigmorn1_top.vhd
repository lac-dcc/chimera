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
-------------------------------------------------------------------------------
--  Toplevel : CPU86, 256Byte ROM, 16550 UART, 40K8 SRAM (all blockrams used)--
-------------------------------------------------------------------------------
--  Revision History:                                                        --
--                                                                           --
--  Date:        Revision  Author                                            --
--                                                                           --
--  30 Dec 2007  0.1       H. Tiggeler   First version                       --
--  17 May 2008  0.75      H. Tiggeler   Updated for CPU86 ver0.75           --
--  27 Jun 2008  0.79      H. Tiggeler   Changed UART to Opencores 16750     --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY drigmorn1_top IS
   PORT( 
      CLOCK_40MHZ : IN     std_logic;
      CTS         : IN     std_logic  := '1';
      PIN3        : IN     std_logic;
      RXD         : IN     std_logic;
      LED1        : OUT    std_logic;
      LED2N       : OUT    std_logic;
      LED3N       : OUT    std_logic;
      PIN4        : OUT    std_logic;
      RTS         : OUT    std_logic;
      TXD         : OUT    std_logic
   );
END drigmorn1_top ;


ARCHITECTURE struct OF drigmorn1_top IS



BEGIN

END struct;
