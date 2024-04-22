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

   -- Architecture declarations
   signal csromn : std_logic;

   -- Internal signal declarations
   SIGNAL DCDn        : std_logic := '1';
   SIGNAL DSRn        : std_logic := '1';
   SIGNAL RIn         : std_logic := '1';
   SIGNAL abus        : std_logic_vector(19 DOWNTO 0);
   SIGNAL clk         : std_logic;
   SIGNAL cscom1      : std_logic;
   SIGNAL dbus_com1   : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_in     : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_in_cpu : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_out    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_rom    : std_logic_vector(7 DOWNTO 0);
   SIGNAL dout        : std_logic;
   SIGNAL dout1       : std_logic;
   SIGNAL intr        : std_logic;
   SIGNAL iom         : std_logic;
   SIGNAL nmi         : std_logic;
   SIGNAL por         : std_logic;
   SIGNAL rdn         : std_logic;
   SIGNAL resoutn     : std_logic;
   SIGNAL sel_s       : std_logic_vector(1 DOWNTO 0);
   SIGNAL wea         : std_logic_VECTOR(0 DOWNTO 0);
   SIGNAL wran        : std_logic;
   SIGNAL wrcom       : std_logic;
   SIGNAL wrn         : std_logic;
   signal rxclk_s	  : std_logic;

   -- Component Declarations
   COMPONENT cpu86
   PORT( 
      clk      : IN     std_logic;
      dbus_in  : IN     std_logic_vector (7 DOWNTO 0);
      intr     : IN     std_logic;
      nmi      : IN     std_logic;
      por      : IN     std_logic;
      abus     : OUT    std_logic_vector (19 DOWNTO 0);
      dbus_out : OUT    std_logic_vector (7 DOWNTO 0);
      cpuerror : OUT    std_logic;
      inta     : OUT    std_logic;
      iom      : OUT    std_logic;
      rdn      : OUT    std_logic;
      resoutn  : OUT    std_logic;
      wran     : OUT    std_logic;
      wrn      : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT blk_mem_40K
   PORT (
      addra : IN     std_logic_VECTOR (15 DOWNTO 0);
      clka  : IN     std_logic;
      dina  : IN     std_logic_VECTOR (7 DOWNTO 0);
      wea   : IN     std_logic_VECTOR (0 DOWNTO 0);
      douta : OUT    std_logic_VECTOR (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT bootstrap
   PORT (
      abus : IN     std_logic_vector (7 DOWNTO 0);
      dbus : OUT    std_logic_vector (7 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT uart_top
   PORT (
      BR_clk   : IN     std_logic ;
      CTSn     : IN     std_logic  := '1';
      DCDn     : IN     std_logic  := '1';
      DSRn     : IN     std_logic  := '1';
      RIn      : IN     std_logic  := '1';
      abus     : IN     std_logic_vector (2 DOWNTO 0);
      clk      : IN     std_logic ;
      csn      : IN     std_logic ;
      dbus_in  : IN     std_logic_vector (7 DOWNTO 0);
      rdn      : IN     std_logic ;
      resetn   : IN     std_logic ;
      sRX      : IN     std_logic ;
      wrn      : IN     std_logic ;
      B_CLK    : OUT    std_logic ;
      DTRn     : OUT    std_logic ;
      IRQ      : OUT    std_logic ;
      OUT1n    : OUT    std_logic ;
      OUT2n    : OUT    std_logic ;
      RTSn     : OUT    std_logic ;
      dbus_out : OUT    std_logic_vector (7 DOWNTO 0);
      stx      : OUT    std_logic 
   );
   END COMPONENT;


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 4 mux
   -- dmux 1                        
   
   process(sel_s,dbus_com1,dbus_in,dbus_rom)
      begin
         case sel_s is
              when "01"  => dbus_in_cpu <= dbus_com1;  -- UART     
              when "10"  => dbus_in_cpu <= dbus_rom;   -- BootStrap Loader  
              when others=> dbus_in_cpu <= dbus_in;    -- Embedded SRAM        
          end case;         
   end process;

   -- HDL Embedded Text Block 7 clogic
   clk <= CLOCK_40MHZ;
   
   wrcom <= not wrn;      
   wea(0)<= not wrn;
   PIN4  <= resoutn; -- For debug only
   
   -- dbus_in_cpu multiplexer
   sel_s <= cscom1 & csromn;
   
   -- chip_select 
   -- Comport, uart_16550
   -- COM1, 0x3F8-0x3FF
   cscom1 <= '0' when (abus(15 downto 3)="0000001111111" AND iom='1') else '1';
   
   -- Bootstrap ROM 256 bytes 
   -- FFFFF-FF=FFF00
   csromn <= '0' when ((abus(19 downto 8)=X"FFF") AND iom='0') else '1';   


   nmi   <= '0';
   intr  <= '0';
   dout  <= '0';
   dout1 <= '0';
   DCDn  <= '0';
   DSRn  <= '0';
   RIn   <= '0';

   por <= NOT(PIN3);

   -- Instance port mappings.
   U_1 : cpu86
      PORT MAP (
         clk        => clk,
         dbus_in    => dbus_in_cpu,
         intr       => intr,
         nmi        => nmi,
         por        => por,
         abus       => abus,
         cpuerror   => LED1,
         dbus_out   => dbus_out,
         inta       => OPEN,
         iom        => iom,
         rdn        => rdn,
         resoutn    => resoutn,
         wran       => wran,
         wrn        => wrn
      );
   U_3 : blk_mem_40K
      PORT MAP (
         clka  => clk,
         dina  => dbus_out,
         addra => abus(15 DOWNTO 0),
         wea   => wea,
         douta => dbus_in
      );
   U_2 : bootstrap
      PORT MAP (
         abus => abus(7 DOWNTO 0),
         dbus => dbus_rom
      );
   U_0 : uart_top
   PORT MAP (
       BR_clk   => rxclk_s,
       CTSn     => CTS,
       DCDn     => DCDn,
       DSRn     => DSRn,
       RIn      => RIn,
       abus     => abus(2 DOWNTO 0),
       clk      => clk,
       csn      => cscom1,
       dbus_in  => dbus_out,
       rdn      => rdn,
       resetn   => resoutn,
       sRX      => RXD,
       wrn      => wrn,
       B_CLK    => rxclk_s,
       DTRn     => OPEN,
       IRQ      => OPEN,
       OUT1n    => led2n,
       OUT2n    => led3n,
       RTSn     => RTS,
       dbus_out => dbus_com1,
       stx      => TXD
    );

END struct;
