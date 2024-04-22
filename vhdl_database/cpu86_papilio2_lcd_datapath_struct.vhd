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
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

USE work.cpu86pack.ALL;

ENTITY datapath IS
   PORT( 
      clk        : IN     std_logic;
      clrop      : IN     std_logic;
      instr      : IN     instruction_type;
      iomem      : IN     std_logic;
      mdbus_in   : IN     std_logic_vector (15 DOWNTO 0);
      path       : IN     path_in_type;
      reset      : IN     std_logic;
      wrpath     : IN     write_in_type;
      dbusdp_out : OUT    std_logic_vector (15 DOWNTO 0);
      eabus      : OUT    std_logic_vector (15 DOWNTO 0);
      segbus     : OUT    std_logic_vector (15 DOWNTO 0);
      status     : OUT    status_out_type
   );
END datapath ;


ARCHITECTURE struct OF datapath IS

   -- Internal signal declarations
   SIGNAL alu_inbusa : std_logic_vector(15 DOWNTO 0);
   SIGNAL alu_inbusb : std_logic_vector(15 DOWNTO 0);
   SIGNAL alubus     : std_logic_vector(15 DOWNTO 0);
   SIGNAL aluopr     : std_logic_vector(6 DOWNTO 0);
   SIGNAL ax_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL bp_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL bx_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL ccbus      : std_logic_vector(15 DOWNTO 0);
   SIGNAL cs_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL cx_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL data_in    : std_logic_vector(15 DOWNTO 0);
   SIGNAL di_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL dibus      : std_logic_vector(15 DOWNTO 0);
   SIGNAL dimux      : std_logic_vector(2 DOWNTO 0);
   SIGNAL disp       : std_logic_vector(15 DOWNTO 0);
   SIGNAL dispmux    : std_logic_vector(2 DOWNTO 0);
   SIGNAL div_err    : std_logic;
   SIGNAL domux      : std_logic_vector(1 DOWNTO 0);
   SIGNAL ds_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL dx_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL ea         : std_logic_vector(15 DOWNTO 0);
   SIGNAL eamux      : std_logic_vector(3 DOWNTO 0);
   SIGNAL es_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL ipbus      : std_logic_vector(15 DOWNTO 0);
   SIGNAL ipreg      : std_logic_vector(15 DOWNTO 0);
   SIGNAL nbreq      : std_logic_vector(2 DOWNTO 0);
   SIGNAL opmux      : std_logic_vector(1 DOWNTO 0);
   SIGNAL rm         : std_logic_vector(2 DOWNTO 0);
   SIGNAL sdbus      : std_logic_vector(15 DOWNTO 0);
   SIGNAL segop      : std_logic_vector(2 DOWNTO 0);
   SIGNAL selalua    : std_logic_vector(3 DOWNTO 0);
   SIGNAL selalub    : std_logic_vector(3 DOWNTO 0);
   SIGNAL seldreg    : std_logic_vector(2 DOWNTO 0);
   SIGNAL selds      : std_logic;
   SIGNAL selsreg    : std_logic_vector(1 DOWNTO 0);
   SIGNAL si_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL sibus      : std_logic_vector(15 DOWNTO 0);
   SIGNAL simux      : std_logic_vector(1 DOWNTO 0);
   SIGNAL sp_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL ss_s       : std_logic_vector(15 DOWNTO 0);
   SIGNAL w          : std_logic;
   SIGNAL wralu      : std_logic;
   SIGNAL wrcc       : std_logic;
   SIGNAL wrd        : std_logic;
   SIGNAL wrip       : std_logic;
   SIGNAL wrop       : std_logic;
   SIGNAL wrs        : std_logic;
   SIGNAL wrtemp     : std_logic;
   SIGNAL xmod       : std_logic_vector(1 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL eabus_internal : std_logic_vector (15 DOWNTO 0);


   signal domux_s : std_logic_vector(2 downto 0);
   signal opreg_s  : std_logic_vector(1 downto 0); -- Override Segment Register
   signal opflag_s : std_logic; -- set if segment override in progress
   signal eam_s : std_logic_vector(15 downto 0);
   signal segsel_s : std_logic_vector(5 downto 0); -- segbus select
   signal int0cs_s : std_logic;

   -- Component Declarations
   COMPONENT ALU
   PORT (
      alu_inbusa : IN     std_logic_vector (15 DOWNTO 0);
      alu_inbusb : IN     std_logic_vector (15 DOWNTO 0);
      aluopr     : IN     std_logic_vector (6 DOWNTO 0);
      ax_s       : IN     std_logic_vector (15 DOWNTO 0);
      clk        : IN     std_logic ;
      cx_s       : IN     std_logic_vector (15 DOWNTO 0);
      dx_s       : IN     std_logic_vector (15 DOWNTO 0);
      reset      : IN     std_logic ;
      w          : IN     std_logic ;
      wralu      : IN     std_logic ;
      wrcc       : IN     std_logic ;
      wrtemp     : IN     std_logic ;
      alubus     : OUT    std_logic_vector (15 DOWNTO 0);
      ccbus      : OUT    std_logic_vector (15 DOWNTO 0);
      div_err    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT dataregfile
   PORT (
      dibus      : IN     std_logic_vector (15 DOWNTO 0);
      selalua    : IN     std_logic_vector (3 DOWNTO 0);
      selalub    : IN     std_logic_vector (3 DOWNTO 0);
      seldreg    : IN     std_logic_vector (2 DOWNTO 0);
      w          : IN     std_logic ;
      wrd        : IN     std_logic ;
      alu_inbusa : OUT    std_logic_vector (15 DOWNTO 0);
      alu_inbusb : OUT    std_logic_vector (15 DOWNTO 0);
      bp_s       : OUT    std_logic_vector (15 DOWNTO 0);
      bx_s       : OUT    std_logic_vector (15 DOWNTO 0);
      di_s       : OUT    std_logic_vector (15 DOWNTO 0);
      si_s       : OUT    std_logic_vector (15 DOWNTO 0);
      reset      : IN     std_logic ;
      clk        : IN     std_logic ;
      data_in    : IN     std_logic_vector (15 DOWNTO 0);
      mdbus_in   : IN     std_logic_vector (15 DOWNTO 0);
      sp_s       : OUT    std_logic_vector (15 DOWNTO 0);
      ax_s       : OUT    std_logic_vector (15 DOWNTO 0);
      cx_s       : OUT    std_logic_vector (15 DOWNTO 0);
      dx_s       : OUT    std_logic_vector (15 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT ipregister
   PORT (
      clk   : IN     std_logic ;
      ipbus : IN     std_logic_vector (15 DOWNTO 0);
      reset : IN     std_logic ;
      wrip  : IN     std_logic ;
      ipreg : OUT    std_logic_vector (15 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT segregfile
   PORT (
      selsreg : IN     std_logic_vector (1 DOWNTO 0);
      sibus   : IN     std_logic_vector (15 DOWNTO 0);
      wrs     : IN     std_logic ;
      reset   : IN     std_logic ;
      clk     : IN     std_logic ;
      sdbus   : OUT    std_logic_vector (15 DOWNTO 0);
      dimux   : IN     std_logic_vector (2 DOWNTO 0);
      es_s    : OUT    std_logic_vector (15 DOWNTO 0);
      cs_s    : OUT    std_logic_vector (15 DOWNTO 0);
      ss_s    : OUT    std_logic_vector (15 DOWNTO 0);
      ds_s    : OUT    std_logic_vector (15 DOWNTO 0)
   );
   END COMPONENT;


BEGIN
   
   dimux   <= path.datareg_input(6 downto 4);  -- Data Register Input Path
   w       <= path.datareg_input(3);
   seldreg <= path.datareg_input(2 downto 0);
   
   selalua <= path.alu_operation(14 downto 11); -- ALU Path
   selalub <= path.alu_operation(10 downto 7);
   aluopr  <= path.alu_operation(6 downto 0);
   
   domux   <= path.dbus_output;                -- Data Output Path
   
   simux   <= path.segreg_input(3 downto 2);   -- Segment Register Input Path
   selsreg <= path.segreg_input(1 downto 0);
   
   dispmux <= path.ea_output(9 downto 7);      -- select ipreg addition
   eamux   <= path.ea_output(6 downto 3);      -- 4 bits 
   segop   <= path.ea_output(2 downto 0);      -- segop(2)=override flag

   wrd   <= wrpath.wrd;
   wralu <= wrpath.wralu;
   wrcc  <= wrpath.wrcc;
   wrs   <= wrpath.wrs;
   wrip  <= wrpath.wrip;
   wrop  <= wrpath.wrop;
   wrtemp<= wrpath.wrtemp;

   status.ax       <= ax_s;
   status.cx_one   <= '1' when (cx_s=X"0001") else '0';
   status.cx_zero  <= '1' when (cx_s=X"0000") else '0';
   status.cl       <= cx_s(7 downto 0);    -- used for shift/rotate
   status.flag     <= ccbus;
   status.div_err   <= div_err;            -- Divider overflow

   disp    <= instr.disp;
   data_in <= instr.data;
   nbreq   <= instr.nb;
   rm      <= instr.rm;
   xmod   <= instr.xmod;

   ----------------------------------------------------------------------------
   -- Determine effective address        
   ----------------------------------------------------------------------------
   process   (rm, ax_s,bx_s,cx_s,dx_s,bp_s,sp_s,si_s,di_s,disp,xmod)
     begin   
      case rm   is
         when   "000" => if xmod="11" then eam_s <=   ax_s;
                             else eam_s <=   bx_s + si_s   + disp;   
                   end if;
                   selds<='1';
         when   "001" => if xmod="11" then eam_s <=   cx_s;
                             else eam_s <=   bx_s + di_s   + disp;
                         end if;       
                   selds<='1';
         when   "010" => if xmod="11" then eam_s <=   dx_s;
                             else eam_s <=   bp_s + si_s   + disp;  
                         end if;     
                   selds<='0';                 
         when   "011" => if xmod="11" then eam_s <=   bx_s;
                             else eam_s <=   bp_s + di_s   + disp;   
                   end if;
                   selds<='0';
         when   "100" => if xmod="11" then eam_s <=   sp_s;        
                             else eam_s <=   si_s + disp; 
                        end if;          
                   selds<='1';
         when   "101" => if xmod="11" then eam_s <=   bp_s;
                             else eam_s <=   di_s + disp;      
                   end if;
                   selds<='1';
         when   "110" => if xmod="00" then 
                     eam_s <= disp;
                     selds <='1';
                   elsif xmod="11" then 
                     eam_s <= si_s;   
                     selds <='1';         
                   else 
                     eam_s <= bp_s +   disp; 
                     selds <='0';                  -- Use SS  
                   end if;
                   
         when   others=> if xmod="11" then eam_s <=   di_s;
                         else eam_s <=   bx_s + disp;   
                   end if;             
                   selds<='1';    
       end case;
   end   process;
   
   ea<=eam_s;

   process(data_in,eabus_internal,alubus,mdbus_in,simux) 
      begin
         case simux is 
            when "00"   => sibus <= data_in;  
            when "01"   => sibus <= eabus_internal;       
            when "10"   => sibus <= alubus;   
            when others => sibus <= mdbus_in;    
         end case;
   end process;

   process(dispmux,nbreq,disp,mdbus_in,ipreg,eabus_internal)               
      begin
      case dispmux is
            when "000"   => ipbus <= ("0000000000000"&nbreq) + ipreg;
            when "001"   => ipbus <= (("0000000000000"&nbreq)+disp) + ipreg;
            when "011"   => ipbus <= disp;              -- disp contains new IP value
            when "100"   => ipbus <= eabus_internal;    -- ipbus=effective address
            when "101"     => ipbus <= ipreg;           -- bodge to get ipreg onto ipbus
            when others  => ipbus <= mdbus_in;                
      end case;   
   end process;
   
   domux_s <= eabus_internal(0) & domux;                               
   
   process(domux_s, alubus,ccbus, dibus, ipbus)
      begin
         case domux_s is 
            when "000"  => dbusdp_out <= alubus;        -- Even 
            when "001"  => dbusdp_out <= ccbus;
            when "010"  => dbusdp_out <= dibus;
            when "011"  => dbusdp_out <= ipbus;         -- CALL Instruction
            when "100"  => dbusdp_out <= alubus(7 downto 0)& alubus(15 downto 8); -- Odd
            when "101"  => dbusdp_out <= ccbus(7 downto 0) & ccbus(15 downto 8);
            when "110"  => dbusdp_out <= dibus(7 downto 0) & dibus(15 downto 8);
            when others => dbusdp_out <= ipbus(7 downto 0) & ipbus(15 downto 8);
         end case;
   end process;
   
   -- Write Prefix Register
   process(clk,reset)
      begin
           if (reset = '1') then
              opreg_s <= "01";                      -- Default CS Register 
              opflag_s<= '0';                       -- Clear Override Prefix Flag                      
            elsif rising_edge(clk) then            
               if wrop='1' then
                  opreg_s <= segop(1 downto 0);     -- Set override register 
                  opflag_s<= '1';                   -- segop(2);         -- Set flag
               elsif clrop='1' then
                  opreg_s <= "11";                  -- Default Data Segment Register  
                  opflag_s<= '0';                          
               end if;
         end if;
   end process;
   
   process (opflag_s,opreg_s,selds,eamux,segop)
      begin
         if opflag_s='1' and segop(2)='0' then      -- Prefix register set and disable override not set?
            opmux <= opreg_s(1 downto 0);           -- Set mux to override prefix reg
         elsif eamux(3)='1' then
             opmux <= eamux(1 downto 0);
         elsif eamux(0)='0' then
            opmux <= "01";                          -- Select CS for IP
         else
            opmux <= '1'&selds;                     -- DS if selds=1 else SS      
         end if;
   end process;
                                         
   process(dimux, data_in,alubus,mdbus_in,sdbus,eabus_internal) 
      begin
         case dimux is 
            when "000"   => dibus <= data_in;       -- Operand
            when "001"   => dibus <= eabus_internal;-- Offset  
            when "010"   => dibus <= alubus;        -- Output ALU
            when "011"   => dibus <= mdbus_in;      -- Memory Bus
            when others  => dibus <= sdbus;         -- Segment registers
         end case;
   end process;

   int0cs_s <= '1' when eamux(3 downto 1)="011" else '0';
   segsel_s <= iomem & int0cs_s & eamux(2 downto 1) & opmux;      -- 5 bits
             
   process(segsel_s,es_s,cs_s,ss_s,ds_s)            -- Segment Output Mux 
      begin
         case segsel_s is 
            when "000000" => segbus <= es_s;        -- 00**, opmux select register
            when "000001" => segbus <= cs_s;    
            when "000010" => segbus <= ss_s;        
            when "000011" => segbus <= ds_s;        
            when "000100" => segbus <= es_s;        -- 01**, opmux select register
            when "000101" => segbus <= cs_s;    
            when "000110" => segbus <= ss_s;        
            when "000111" => segbus <= ds_s; 
            when "001000" => segbus <= ss_s;        -- 10**=SS, used for PUSH& POP
            when "001001" => segbus <= ss_s;
            when "001010" => segbus <= ss_s;
            when "001011" => segbus <= ss_s;
            when "001100" => segbus <= es_s;        -- 01**, opmux select register
            when "001101" => segbus <= cs_s;    
            when "001110" => segbus <= ss_s;             
            when "001111" => segbus <= ds_s;             
            when others  => segbus <= ZEROVECTOR_C(15 downto 0);-- IN/OUT instruction 0x0000:PORT/DX  
         end case;
   end process;

   -- Offset Mux          
   -- Note ea*4 required if non-32 bits memory access is used(?)
   -- Currently CS &IP are read in one go (fits 32 bits)
   process(ipreg,ea,sp_s,dx_s,eamux,si_s,di_s,bx_s,ax_s) 
      begin
         case eamux is 
            when "0000"  => eabus_internal <= ipreg;--ipbus;--ipreg;  
            when "0001"  => eabus_internal <= ea;    
            when "0010"  => eabus_internal <= dx_s;   
            when "0011"  => eabus_internal <= ea + "10";        -- for call mem32/int
            when "0100"  => eabus_internal <= sp_s;             -- 10* select SP_S 
            when "0101"  => eabus_internal <= sp_s;  
            when "0110"  => eabus_internal <= ea(13 downto 0)&"00";             
            when "0111"  => eabus_internal <=(ea(13 downto 0)&"00") + "10"; -- for int   
            when "1000"  => eabus_internal <= di_s;             -- Select ES:DI 
            when "1011"  => eabus_internal <= si_s;             -- Select DS:SI
            when "1001"  => eabus_internal <= ea;               -- added for JMP SI instruction
            when "1111"  => eabus_internal <= bx_s + (X"00"&ax_s(7 downto 0)); -- XLAT instruction
            when others  => eabus_internal <= DONTCARE(15 downto 0);
         end case;
   end process;

   -- Instance port mappings.
   I6 : ALU
      PORT MAP (
         alu_inbusa => alu_inbusa,
         alu_inbusb => alu_inbusb,
         aluopr     => aluopr,
         ax_s       => ax_s,
         clk        => clk,
         cx_s       => cx_s,
         dx_s       => dx_s,
         reset      => reset,
         w          => w,
         wralu      => wralu,
         wrcc       => wrcc,
         wrtemp     => wrtemp,
         alubus     => alubus,
         ccbus      => ccbus,
         div_err    => div_err
      );
   I0 : dataregfile
      PORT MAP (
         dibus      => dibus,
         selalua    => selalua,
         selalub    => selalub,
         seldreg    => seldreg,
         w          => w,
         wrd        => wrd,
         alu_inbusa => alu_inbusa,
         alu_inbusb => alu_inbusb,
         bp_s       => bp_s,
         bx_s       => bx_s,
         di_s       => di_s,
         si_s       => si_s,
         reset      => reset,
         clk        => clk,
         data_in    => data_in,
         mdbus_in   => mdbus_in,
         sp_s       => sp_s,
         ax_s       => ax_s,
         cx_s       => cx_s,
         dx_s       => dx_s
      );
   I9 : ipregister
      PORT MAP (
         clk   => clk,
         ipbus => ipbus,
         reset => reset,
         wrip  => wrip,
         ipreg => ipreg
      );
   I15 : segregfile
      PORT MAP (
         selsreg => selsreg,
         sibus   => sibus,
         wrs     => wrs,
         reset   => reset,
         clk     => clk,
         sdbus   => sdbus,
         dimux   => dimux,
         es_s    => es_s,
         cs_s    => cs_s,
         ss_s    => ss_s,
         ds_s    => ds_s
      );

   eabus <= eabus_internal;

END struct;
