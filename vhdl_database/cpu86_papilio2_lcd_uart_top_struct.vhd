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
USE ieee.std_logic_arith.all;

ENTITY uart_top IS
   PORT( 
      BR_clk   : IN     std_logic;
      CTSn     : IN     std_logic  := '1';
      DCDn     : IN     std_logic  := '1';
      DSRn     : IN     std_logic  := '1';
      RIn      : IN     std_logic  := '1';
      abus     : IN     std_logic_vector (2 DOWNTO 0);
      clk      : IN     std_logic;
      csn      : IN     std_logic;
      dbus_in  : IN     std_logic_vector (7 DOWNTO 0);
      rdn      : IN     std_logic;
      resetn   : IN     std_logic;
      sRX      : IN     std_logic;
      wrn      : IN     std_logic;
      B_CLK    : OUT    std_logic;
      DTRn     : OUT    std_logic;
      IRQ      : OUT    std_logic;
      OUT1n    : OUT    std_logic;
      OUT2n    : OUT    std_logic;
      RTSn     : OUT    std_logic;
      dbus_out : OUT    std_logic_vector (7 DOWNTO 0);
      stx      : OUT    std_logic
   );

-- Declarations

END uart_top ;

ARCHITECTURE struct OF uart_top IS

   -- Internal signal declarations
   SIGNAL BAUDCE : std_logic;
   SIGNAL CS     : std_logic;
   SIGNAL RD     : std_logic;
   SIGNAL WR     : std_logic;
   SIGNAL rst    : std_logic;


   -- Component Declarations
   COMPONENT uart_16750
   PORT (
      A        : IN     std_logic_vector (2 DOWNTO 0);
      BAUDCE   : IN     std_logic;
      CLK      : IN     std_logic;
      CS       : IN     std_logic;
      CTSN     : IN     std_logic;
      DCDN     : IN     std_logic;
      DIN      : IN     std_logic_vector (7 DOWNTO 0);
      DSRN     : IN     std_logic;
      RCLK     : IN     std_logic;
      RD       : IN     std_logic;
      RIN      : IN     std_logic;
      RST      : IN     std_logic;
      SIN      : IN     std_logic;
      WR       : IN     std_logic;
      BAUDOUTN : OUT    std_logic;
      DDIS     : OUT    std_logic;
      DOUT     : OUT    std_logic_vector (7 DOWNTO 0);
      DTRN     : OUT    std_logic;
      INT      : OUT    std_logic;
      OUT1N    : OUT    std_logic;
      OUT2N    : OUT    std_logic;
      RTSN     : OUT    std_logic;
      SOUT     : OUT    std_logic
   );
   END COMPONENT;


BEGIN
   rst <= not resetn;      -- externally use active low reset
   rd  <= not rdn;
   wr  <= not wrn;
   cs  <= not csn;

   BAUDCE <= '1';

   -- Instance port mappings.
   U_0 : uart_16750
      PORT MAP (
         CLK      => clk,
         RST      => rst,
         BAUDCE   => BAUDCE,
         CS       => CS,
         WR       => WR,
         RD       => RD,
         A        => abus,
         DIN      => dbus_in,
         DOUT     => dbus_out,
         DDIS     => OPEN,
         INT      => IRQ,
         OUT1N    => OUT1n,
         OUT2N    => OUT2n,
         RCLK     => BR_clk,
         BAUDOUTN => B_CLK,
         RTSN     => RTSn,
         DTRN     => DTRn,
         CTSN     => CTSn,
         DSRN     => DSRn,
         DCDN     => DCDn,
         RIN      => RIn,
         SIN      => sRX,
         SOUT     => stx
      );

END struct;
