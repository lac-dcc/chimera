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
--  TestBench                                                                --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

LIBRARY std;
USE std.TEXTIO.all;
USE work.utils.all;

entity cpu86_top_tb is
end cpu86_top_tb ;


ARCHITECTURE struct OF cpu86_top_tb IS

   -- Architecture declarations
   signal dind1_s : std_logic;
   signal dind2_s : std_logic;       

   -- Internal signal declarations
   SIGNAL CE2         : std_logic := '1';
   SIGNAL CLOCK_40MHZ : std_logic := '0';
   SIGNAL CTS         : std_logic;
   SIGNAL RESET       : std_logic;
   SIGNAL TXD         : std_logic;
   SIGNAL abus        : std_logic_vector(19 DOWNTO 0);
   SIGNAL csramn      : std_logic;
   SIGNAL dbus        : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_in     : std_logic_vector(7 DOWNTO 0);
   SIGNAL dbus_out    : std_logic_vector(7 DOWNTO 0);
   SIGNAL cpuerror   : std_logic;
   SIGNAL rdn         : std_logic;
   SIGNAL rdn_s       : std_logic;                        -- Active Low Read Pulse (CLK)
   SIGNAL rdrf        : std_logic;
   SIGNAL resoutn     : std_logic;
   SIGNAL rxenable    : std_logic;
   SIGNAL txcmd       : std_logic;
   SIGNAL txenable    : std_logic;
   SIGNAL udbus       : Std_Logic_Vector(7 DOWNTO 0);
   SIGNAL wrn         : std_logic;


   -- Component Declarations
   COMPONENT cpu86_top
   PORT (
      CLOCK_40MHZ : IN     std_logic ;
      CTS         : IN     std_logic  := '1';
      RESET       : IN     std_logic ;
      RXD         : IN     std_logic ;
      dbus_in     : IN     std_logic_vector (7 DOWNTO 0);
      RTS         : OUT    std_logic ;
      TXD         : OUT    std_logic ;
      abus        : OUT    std_logic_vector (19 DOWNTO 0);
      cpuerror    : OUT    std_logic ;
      led2n       : OUT    std_logic;       -- Connected to 16750 OUT1 signal
      led3n       : OUT    std_logic;       -- Connected to 16750 OUT2 signal
      csramn      : OUT    std_logic ;
      dbus_out    : OUT    std_logic_vector (7 DOWNTO 0);
      rdn         : OUT    std_logic ;
      resoutn     : OUT    std_logic ;
      wrn         : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT sram
   GENERIC (
      clear_on_power_up       : boolean;
      download_on_power_up    : boolean;
      trace_ram_load          : boolean;
      enable_nWE_only_control : boolean;
      size                    : INTEGER;
      adr_width               : INTEGER;
      width                   : INTEGER;
      tAA_max                 : TIME;
      tOHA_min                : TIME;
      tACE_max                : TIME;
      tDOE_max                : TIME;
      tLZOE_min               : TIME;
      tHZOE_max               : TIME;
      tLZCE_min               : TIME;
      tHZCE_max               : TIME;
      tWC_min                 : TIME;
      tSCE_min                : TIME;
      tAW_min                 : TIME;
      tHA_min                 : TIME;
      tSA_min                 : TIME;
      tPWE_min                : TIME;
      tSD_min                 : TIME;
      tHD_min                 : TIME;
      tHZWE_max               : TIME;
      tLZWE_min               : TIME
   );
   PORT (
      A                 : IN     std_logic_vector (adr_width-1 DOWNTO 0);
      CE2               : IN     std_logic  := '1';
      download          : IN     boolean    := FALSE;
      download_filename : IN     string     := "loadfname.dat";
      dump              : IN     boolean    := FALSE;
      dump_end          : IN     natural    := size-1;
      dump_filename     : IN     string     := "dumpfname.dat";
      dump_start        : IN     natural    := 0;
      nCE               : IN     std_logic  := '1';
      nOE               : IN     std_logic  := '1';
      nWE               : IN     std_logic  := '1';
      D                 : INOUT  std_logic_vector (width-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT tester
   PORT (
      resoutn     : IN     std_logic ;
      CTS         : OUT    std_logic ;
      RESET       : OUT    std_logic ;
      rxenable    : OUT    std_logic ;
      CLOCK_40MHZ : BUFFER std_logic ;
      txenable    : BUFFER std_logic ;
      txcmd       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT uartrx
   PORT (
      clk    : IN     std_logic;
      enable : IN     std_logic;
      rdn    : IN     std_logic;
      resetn : IN     std_logic;
      rx     : IN     std_logic;
      dbus   : OUT    std_logic_vector (7 DOWNTO 0);
      ferror : OUT    std_logic;
      rdrf   : OUT    std_logic
   );
   END COMPONENT;


BEGIN
   -- Architecture concurrent statements
   process (wrn,dbus_out)
      begin  
           case wrn is
               when '0'    => dbus<= dbus_out after 10 ns; -- drive porta
               when '1'    => dbus<= (others => 'Z') after 10 ns;
               when others => dbus<= (others => 'X') after 10 ns;         
           end case;    
   end process;   
   dbus_in <= dbus; -- drive internal dbus    

   assert not ((NOW > 0 ns) and cpuerror='1')  report "**** CPU Error flag asserted ****" severity failure;

   -- UART Monitor
   -- Display string after 80 characters or CR character is received   
   process (rdrf,resoutn)      
      variable L   : line;
      variable i_v : integer;
         begin
            if resoutn='0' then
                i_v := 0;                       -- clear character counter
            elsif (rising_edge(rdrf)) then      -- possible, pulse is wide!
                 if i_v=0 then 
                   write(L,string'("RD UART : "));
                   if (udbus/=X"0D" and udbus/=X"0A") then 
                      write(L,std_to_char(udbus)); 
                   end if;         
                   i_v := i_v+1;
                elsif (i_v=80 or udbus=X"0D") then                
                      writeline(output,L);
                      i_v:=0;
                else 
               if (udbus/=X"0D" and udbus/=X"0A") then 
                  write(L,std_to_char(udbus)); 
               end if;         
               i_v := i_v+1;
                 end if;
             end if;   
   end process;
                                       
   process (CLOCK_40MHZ,resoutn)                -- First/Second delay        
       begin
         if (resoutn='0') then                     
            dind1_s <= '0';
            dind2_s <= '0';              
         elsif (rising_edge(CLOCK_40MHZ)) then     
            dind1_s <= rdrf;
            dind2_s <= dind1_s;                             
         end if;   
   end process;    
       
   rdn_s <= '0' when (dind1_s='1' and dind2_s='0') else '1';

   CE2 <= '1';

   -- Instance port mappings.
   U_0 : cpu86_top
      PORT MAP (
         CLOCK_40MHZ => CLOCK_40MHZ,
         CTS         => CTS,
         RESET       => RESET,
         RXD         => txcmd,
         dbus_in     => dbus_in,
         RTS         => OPEN,
         TXD         => TXD,
         abus        => abus,
         cpuerror    => cpuerror,
         led2n       => OPEN,
         led3n       => OPEN,
         csramn      => csramn,
         dbus_out    => dbus_out,
         rdn         => rdn,
         resoutn     => resoutn,
         wrn         => wrn
      );
   U_12 : sram
      GENERIC MAP (
         clear_on_power_up       => TRUE,
         download_on_power_up    => TRUE,
         trace_ram_load          => FALSE,
         enable_nWE_only_control => FALSE,
         size                    => 262144,
         adr_width               => 18,
         width                   => 8,
         tAA_max                 => 20 NS,
         tOHA_min                => 3 NS,
         tACE_max                => 20 NS,
         tDOE_max                => 8 NS,
         tLZOE_min               => 0 NS,
         tHZOE_max               => 8 NS,
         tLZCE_min               => 3 NS,
         tHZCE_max               => 10 NS,
         tWC_min                 => 20 NS,
         tSCE_min                => 18 NS,
         tAW_min                 => 15 NS,
         tHA_min                 => 0 NS,
         tSA_min                 => 0 NS,
         tPWE_min                => 13 NS,
         tSD_min                 => 10 NS,
         tHD_min                 => 0 NS,
         tHZWE_max               => 10 NS,
         tLZWE_min               => 0 NS
      )
      PORT MAP (
         download_filename => OPEN,
         nCE               => csramn,
         nOE               => rdn,
         nWE               => wrn,
         A                 => abus(17 DOWNTO 0),
         D                 => dbus,
         CE2               => CE2,
         download          => OPEN,
         dump              => OPEN,
         dump_start        => OPEN,
         dump_end          => OPEN,
         dump_filename     => OPEN
      );
   U_1 : tester
      PORT MAP (
         resoutn     => resoutn,
         CTS         => CTS,
         RESET       => RESET,
         rxenable    => rxenable,
         CLOCK_40MHZ => CLOCK_40MHZ,
         txenable    => txenable,
         txcmd       => txcmd
      );
   U_3 : uartrx
      PORT MAP (
         clk    => CLOCK_40MHZ,
         enable => rxenable,
         resetn => resoutn,
         dbus   => udbus,
         rdn    => rdn_s,
         rdrf   => rdrf,
         ferror => OPEN,
         rx     => TXD
      );

END struct;
