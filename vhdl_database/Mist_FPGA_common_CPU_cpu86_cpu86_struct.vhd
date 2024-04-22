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
USE ieee.std_logic_unsigned.all;

USE work.cpu86pack.ALL;
USE work.cpu86instr.ALL;


ENTITY cpu86 IS
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
END cpu86 ;


ARCHITECTURE struct OF cpu86 IS

   SIGNAL biu_error    : std_logic;
   SIGNAL clrop        : std_logic;
   SIGNAL dbusdp_out   : std_logic_vector(15 DOWNTO 0);
   SIGNAL decode_state : std_logic;
   SIGNAL eabus        : std_logic_vector(15 DOWNTO 0);
   SIGNAL flush_ack    : std_logic;
   SIGNAL flush_coming : std_logic;
   SIGNAL flush_req    : std_logic;
   SIGNAL instr        : instruction_type;
   SIGNAL inta1        : std_logic;
   SIGNAL intack       : std_logic;
   SIGNAL iomem        : std_logic;
   SIGNAL irq_blocked  : std_logic;
   SIGNAL irq_req      : std_logic;
   SIGNAL latcho       : std_logic;
   SIGNAL mdbus_out    : std_logic_vector(15 DOWNTO 0);
   SIGNAL opc_req      : std_logic;
   SIGNAL path         : path_in_type;
   SIGNAL proc_error   : std_logic;
   SIGNAL read_req     : std_logic;
   SIGNAL reset        : std_logic;
   SIGNAL rw_ack       : std_logic;
   SIGNAL segbus       : std_logic_vector(15 DOWNTO 0);
   SIGNAL status       : status_out_type;
   SIGNAL word         : std_logic;
   SIGNAL write_req    : std_logic;
   SIGNAL wrpath       : write_in_type;


   -- Component Declarations
   COMPONENT biu
   PORT (
      clk          : IN     std_logic ;
      csbus        : IN     std_logic_vector (15 DOWNTO 0);
      dbus_in      : IN     std_logic_vector (7 DOWNTO 0);
      dbusdp_in    : IN     std_logic_vector (15 DOWNTO 0);
      decode_state : IN     std_logic ;
      flush_coming : IN     std_logic ;
      flush_req    : IN     std_logic ;
      intack       : IN     std_logic ;
      intr         : IN     std_logic ;
      iomem        : IN     std_logic ;
      ipbus        : IN     std_logic_vector (15 DOWNTO 0);
      irq_block    : IN     std_logic ;
      nmi          : IN     std_logic ;
      opc_req      : IN     std_logic ;
      read_req     : IN     std_logic ;
      reset        : IN     std_logic ;
      status       : IN     status_out_type ;
      word         : IN     std_logic ;
      write_req    : IN     std_logic ;
      abus         : OUT    std_logic_vector (19 DOWNTO 0);
      biu_error    : OUT    std_logic ;
      dbus_out     : OUT    std_logic_vector (7 DOWNTO 0);
      flush_ack    : OUT    std_logic ;
      instr        : OUT    instruction_type ;
      inta         : OUT    std_logic ;
      inta1        : OUT    std_logic ;
      iom          : OUT    std_logic ;
      irq_req      : OUT    std_logic ;
      latcho       : OUT    std_logic ;
      mdbus_out    : OUT    std_logic_vector (15 DOWNTO 0);
      rdn          : OUT    std_logic ;
      rw_ack       : OUT    std_logic ;
      wran         : OUT    std_logic ;
      wrn          : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT datapath
   PORT (
      clk        : IN     std_logic ;
      clrop      : IN     std_logic ;
      instr      : IN     instruction_type ;
      iomem      : IN     std_logic ;
      mdbus_in   : IN     std_logic_vector (15 DOWNTO 0);
      path       : IN     path_in_type ;
      reset      : IN     std_logic ;
      wrpath     : IN     write_in_type ;
      dbusdp_out : OUT    std_logic_vector (15 DOWNTO 0);
      eabus      : OUT    std_logic_vector (15 DOWNTO 0);
      segbus     : OUT    std_logic_vector (15 DOWNTO 0);
      status     : OUT    status_out_type 
   );
   END COMPONENT;
   COMPONENT proc
   PORT (
      clk          : IN     std_logic ;
      flush_ack    : IN     std_logic ;
      instr        : IN     instruction_type ;
      inta1        : IN     std_logic ;
      irq_req      : IN     std_logic ;
      latcho       : IN     std_logic ;
      reset        : IN     std_logic ;
      rw_ack       : IN     std_logic ;
      status       : IN     status_out_type ;
      clrop        : OUT    std_logic ;
      decode_state : OUT    std_logic ;
      flush_coming : OUT    std_logic ;
      flush_req    : OUT    std_logic ;
      intack       : OUT    std_logic ;
      iomem        : OUT    std_logic ;
      irq_blocked  : OUT    std_logic ;
      opc_req      : OUT    std_logic ;
      path         : OUT    path_in_type ;
      proc_error   : OUT    std_logic ;
      read_req     : OUT    std_logic ;
      word         : OUT    std_logic ;
      write_req    : OUT    std_logic ;
      wrpath       : OUT    write_in_type 
   );
   END COMPONENT;


BEGIN

   -- synchronous reset
   -- Internal use active high, external use active low
   -- Async Asserted, sync negated
   process (clk, por)     
      begin
         if por='1' then
              reset <= '1';
            resoutn <= '0';
         elsif rising_edge(clk) then
              reset <= '0';
            resoutn <= '1';
        end if;         
   end process;


   cpuerror <= proc_error OR biu_error;

   cpubiu : biu
      PORT MAP (
         clk          => clk,
         csbus        => segbus,
         dbus_in      => dbus_in,
         dbusdp_in    => dbusdp_out,
         decode_state => decode_state,
         flush_coming => flush_coming,
         flush_req    => flush_req,
         intack       => intack,
         intr         => intr,
         iomem        => iomem,
         ipbus        => eabus,
         irq_block    => irq_blocked,
         nmi          => nmi,
         opc_req      => opc_req,
         read_req     => read_req,
         reset        => reset,
         status       => status,
         word         => word,
         write_req    => write_req,
         abus         => abus,
         biu_error    => biu_error,
         dbus_out     => dbus_out,
         flush_ack    => flush_ack,
         instr        => instr,
         inta         => inta,
         inta1        => inta1,
         iom          => iom,
         irq_req      => irq_req,
         latcho       => latcho,
         mdbus_out    => mdbus_out,
         rdn          => rdn,
         rw_ack       => rw_ack,
         wran         => wran,
         wrn          => wrn
      );
   cpudpath : datapath
      PORT MAP (
         clk        => clk,
         clrop      => clrop,
         instr      => instr,
         iomem      => iomem,
         mdbus_in   => mdbus_out,
         path       => path,
         reset      => reset,
         wrpath     => wrpath,
         dbusdp_out => dbusdp_out,
         eabus      => eabus,
         segbus     => segbus,
         status     => status
      );
   cpuproc : proc
      PORT MAP (
         clk          => clk,
         flush_ack    => flush_ack,
         instr        => instr,
         inta1        => inta1,
         irq_req      => irq_req,
         latcho       => latcho,
         reset        => reset,
         rw_ack       => rw_ack,
         status       => status,
         clrop        => clrop,
         decode_state => decode_state,
         flush_coming => flush_coming,
         flush_req    => flush_req,
         intack       => intack,
         iomem        => iomem,
         irq_blocked  => irq_blocked,
         opc_req      => opc_req,
         path         => path,
         proc_error   => proc_error,
         read_req     => read_req,
         word         => word,
         write_req    => write_req,
         wrpath       => wrpath
      );

END struct;
