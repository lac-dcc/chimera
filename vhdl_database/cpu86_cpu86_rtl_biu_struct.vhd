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

ENTITY biu IS
   PORT( 
      clk          : IN     std_logic;
      csbus        : IN     std_logic_vector (15 DOWNTO 0);
      dbus_in      : IN     std_logic_vector (7 DOWNTO 0);
      dbusdp_in    : IN     std_logic_vector (15 DOWNTO 0);
      decode_state : IN     std_logic;
      flush_coming : IN     std_logic;
      flush_req    : IN     std_logic;
      intack       : IN     std_logic;
      intr         : IN     std_logic;
      iomem        : IN     std_logic;
      ipbus        : IN     std_logic_vector (15 DOWNTO 0);
      irq_block    : IN     std_logic;
      nmi          : IN     std_logic;
      opc_req      : IN     std_logic;
      read_req     : IN     std_logic;
      reset        : IN     std_logic;
      status       : IN     status_out_type;
      word         : IN     std_logic;
      write_req    : IN     std_logic;
      abus         : OUT    std_logic_vector (19 DOWNTO 0);
      biu_error    : OUT    std_logic;
      dbus_out     : OUT    std_logic_vector (7 DOWNTO 0);
      flush_ack    : OUT    std_logic;
      instr        : OUT    instruction_type;
      inta         : OUT    std_logic;
      inta1        : OUT    std_logic;
      iom          : OUT    std_logic;
      irq_req      : OUT    std_logic;
      latcho       : OUT    std_logic;
      mdbus_out    : OUT    std_logic_vector (15 DOWNTO 0);
      rdn          : OUT    std_logic;
      rw_ack       : OUT    std_logic;
      wran         : OUT    std_logic;
      wrn          : OUT    std_logic
   );
END biu ;


ARCHITECTURE struct OF biu IS

   SIGNAL abus_s     : std_logic_vector(19 DOWNTO 0);
   SIGNAL abusdp_in  : std_logic_vector(19 DOWNTO 0);
   SIGNAL addrplus4  : std_logic;
   SIGNAL biu_status : std_logic_vector(2 DOWNTO 0);
   SIGNAL csbusbiu_s : std_logic_vector(15 DOWNTO 0);
   SIGNAL halt_instr : std_logic;
   SIGNAL inta2_s    : std_logic;                        -- Second INTA pulse, used to latch 8 bist vector
   SIGNAL ipbusbiu_s : std_logic_vector(15 DOWNTO 0);
   SIGNAL ipbusp1_s  : std_logic_vector(15 DOWNTO 0);
   SIGNAL irq_ack    : std_logic;
   SIGNAL irq_clr    : std_logic;
   SIGNAL irq_type   : std_logic_vector(1 DOWNTO 0);
   SIGNAL latchabus  : std_logic;
   SIGNAL latchclr   : std_logic;
   SIGNAL latchm     : std_logic;
   SIGNAL latchrw    : std_logic;
   SIGNAL ldposplus1 : std_logic;
   SIGNAL lutbus     : std_logic_vector(15 DOWNTO 0);
   SIGNAL mux_addr   : std_logic_vector(2 DOWNTO 0);
   SIGNAL mux_data   : std_logic_vector(3 DOWNTO 0);
   SIGNAL mux_reg    : std_logic_vector(2 DOWNTO 0);
   SIGNAL muxabus    : std_logic_vector(1 DOWNTO 0);
   SIGNAL nbreq      : std_logic_vector(2 DOWNTO 0);
   SIGNAL rdcode_s   : std_logic;
   SIGNAL rddata_s   : std_logic;
   SIGNAL reg1freed  : std_logic;                        -- Delayed version (1 clk) of reg1free
   SIGNAL reg4free   : std_logic;
   SIGNAL regnbok    : std_logic;
   SIGNAL regplus1   : std_logic;
   SIGNAL w_biufsm_s : std_logic;
   SIGNAL wr_s       : std_logic;

   SIGNAL flush_ack_internal : std_logic;
   SIGNAL inta1_internal     : std_logic;
   SIGNAL irq_req_internal   : std_logic;
   SIGNAL latcho_internal    : std_logic;


   signal nmi_s : std_logic;
   signal nmipre_s : std_logic_vector(1 downto 0);  -- metastability first FF for nmi
   signal outbus_s : std_logic_vector(7 downto 0);  -- used in out instr. bus streering
   signal latchmd_s : std_logic;                    -- internal rdl_s signal
   signal abusdp_inp1l_s: std_logic_vector(15 downto 0);
   signal latchrw_d_s: std_logic;                   -- latchrw delayed 1 clk cycle
   signal latchclr_d_s: std_logic;                  -- latchclr delayed 1 clk cycle
   signal iom_s : std_logic;
   signal instr_trace_s : std_logic;                -- TF latched by exec_state pulse
   signal irq_req_s : std_logic;

   -- Component Declarations
   COMPONENT biufsm
   PORT (
      clk          : IN     std_logic ;
      flush_coming : IN     std_logic ;
      flush_req    : IN     std_logic ;
      irq_req      : IN     std_logic ;
      irq_type     : IN     std_logic_vector (1 DOWNTO 0);
      opc_req      : IN     std_logic ;
      read_req     : IN     std_logic ;
      reg1freed    : IN     std_logic ;
      reg4free     : IN     std_logic ;
      regnbok      : IN     std_logic ;
      reset        : IN     std_logic ;
      w_biufsm_s   : IN     std_logic ;
      write_req    : IN     std_logic ;
      addrplus4    : OUT    std_logic ;
      biu_error    : OUT    std_logic ;
      biu_status   : OUT    std_logic_vector (2 DOWNTO 0);
      irq_ack      : OUT    std_logic ;
      irq_clr      : OUT    std_logic ;
      latchabus    : OUT    std_logic ;
      latchclr     : OUT    std_logic ;
      latchm       : OUT    std_logic ;
      latcho       : OUT    std_logic ;
      latchrw      : OUT    std_logic ;
      ldposplus1   : OUT    std_logic ;
      muxabus      : OUT    std_logic_vector (1 DOWNTO 0);
      rdcode_s     : OUT    std_logic ;
      rddata_s     : OUT    std_logic ;
      regplus1     : OUT    std_logic ;
      rw_ack       : OUT    std_logic ;
      wr_s         : OUT    std_logic ;
      flush_ack    : BUFFER std_logic ;
      inta1        : BUFFER std_logic 
   );
   END COMPONENT;
   COMPONENT formatter
   PORT (
      lutbus   : IN     std_logic_vector (15 DOWNTO 0);
      mux_addr : OUT    std_logic_vector (2 DOWNTO 0);
      mux_data : OUT    std_logic_vector (3 DOWNTO 0);
      mux_reg  : OUT    std_logic_vector (2 DOWNTO 0);
      nbreq    : OUT    std_logic_vector (2 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT regshiftmux
   PORT (
      clk        : IN     std_logic ;
      dbus_in    : IN     std_logic_vector (7 DOWNTO 0);
      flush_req  : IN     std_logic ;
      latchm     : IN     std_logic ;
      latcho     : IN     std_logic ;
      mux_addr   : IN     std_logic_vector (2 DOWNTO 0);
      mux_data   : IN     std_logic_vector (3 DOWNTO 0);
      mux_reg    : IN     std_logic_vector (2 DOWNTO 0);
      nbreq      : IN     std_logic_vector (2 DOWNTO 0);
      regplus1   : IN     std_logic ;
      ldposplus1 : IN     std_logic ;
      reset      : IN     std_logic ;
      irq        : IN     std_logic ;
      inta1      : IN     std_logic ;                   -- Added for ver 0.71
      inta2_s    : IN     std_logic ;
      irq_type   : IN     std_logic_vector (1 DOWNTO 0);
      instr      : OUT    instruction_type ;
      halt_instr : OUT    std_logic ;
      lutbus     : OUT    std_logic_vector (15 DOWNTO 0);
      reg1free   : BUFFER std_logic ;
      reg1freed  : BUFFER std_logic ;                   -- Delayed version (1 clk) of reg1free
      regnbok    : OUT    std_logic 
   );
   END COMPONENT;


BEGIN

   -------------------------------------------------------------------------
   -- Databus Latch    
   -------------------------------------------------------------------------
   process(reset,clk)
   begin
      if reset='1' then
         dbus_out   <= DONTCARE(7 downto 0);          
      elsif rising_edge(clk) then
            if latchrw='1' then                  -- Latch Data from DataPath
               dbus_out <= outbus_s; 
            end if;
      end if;
   end process;
   
   ---------------------------------------------------------------------------
   -- OUT instruction bus steering
   -- IO/~M & A[1:0] 
   ---------------------------------------------------------------------------
   process(dbusdp_in,abus_s)
      begin
          if abus_s(0)='0' then
            outbus_s <= dbusdp_in(7 downto 0);     -- D0 
         else
            outbus_s <= dbusdp_in(15 downto 8);     -- D1
         end if;
   end process;

   ---------------------------------------------------------------------------
   -- Latch word for BIU FSM
   ---------------------------------------------------------------------------
   process(clk,reset)
      begin
         if reset='1' then
           w_biufsm_s<='0';
         elsif rising_edge(clk) then 
            if latchrw='1' then   
              w_biufsm_s<=word;
            end if;
         end if;
   end process;
   
   -- metastability sync
   process(reset,clk) -- ireg
   begin
      if reset='1' then
         nmipre_s <= "00";      
      elsif rising_edge(clk) then
         nmipre_s <= nmipre_s(0) & nmi;
      end if;
   end process;
   
   -- set/reset FF
   process(reset, clk) -- ireg
   begin
      if (reset='1') then
         nmi_s <= '0';   
      elsif rising_edge(clk) then
       if (irq_clr='1') then
          nmi_s <= '0';   
       else 
           nmi_s <= nmi_s or ((not nmipre_s(1)) and nmipre_s(0));
       end if;
      end if;
   end process;
   
   -- Instruction trace flag, the trace flag is latched by the decode_state signal. This will
   -- result in the instruction after setting the trace flag not being traced (required).
   -- The instr_trace_s flag is not set if the current instruction is a HLT
   process(reset, clk) 
   begin
      if (reset='1') then
         instr_trace_s <= '0';   
      elsif rising_edge(clk) then
         if (decode_state='1' and halt_instr='0') then
             instr_trace_s <= status.flag(8);   
          end if;
      end if;
   end process;
   
   -- int0_req=Divider/0 error
   -- status(8)=TF
   -- status(9)=IF
   irq_req_s <= '1' when ((status.div_err='1' or instr_trace_s='1' or nmi_s='1' or (status.flag(9)='1' and intr='1')) and irq_block='0') else '0';                                      
   
   -- set/reset FF
   process(reset, clk) -- ireg
       begin
          if (reset='1') then
               irq_req_internal <= '0';   
           elsif rising_edge(clk) then
               if (irq_clr='1') then
                   irq_req_internal <= '0';   
               elsif irq_req_s='1' then
                  irq_req_internal <= '1';
               end if;
          end if;
   end process;
   
   --process (nmi_s,status,intr)
   process (reset,clk)
       begin
          if reset='1' then
             irq_type <= (others => '0');       -- Don't care value
          elsif rising_edge(clk) then
            if irq_req_internal='1' then
                 if nmi_s='1' then
                     irq_type <= "10";         -- NMI result in INT2
                 elsif status.flag(8)='1' then
                     irq_type <= "01";         -- TF result in INT1
                 else
                     irq_type <= "00";         -- INTR result in INT <DBUS>
                 end if;
            end if;
         end if;
   end process;
   
   ---------------------------------------------------------------------------
   -- Delayed signals
   ---------------------------------------------------------------------------
   process(clk,reset)
      begin
       if reset='1' then
           latchrw_d_s  <= '0';
           latchclr_d_s <= '0';
       elsif rising_edge(clk) then 
           latchrw_d_s  <= latchrw; 
           latchclr_d_s <= latchclr;        
       end if;
   end process;
   
   ---------------------------------------------------------------------------
   -- IO/~M strobe latch
   ---------------------------------------------------------------------------
   process(clk,reset)
      begin
         if reset='1' then
            iom_s <= '0';
         elsif rising_edge(clk) then 
            if latchrw='1' and muxabus/="00" then   
                 iom_s <= iomem;
            elsif latchrw='1' then
                 iom_s <= '0';        
            end if;
         end if;
   end process;
   iom <= iom_s;
   
   ---------------------------------------------------------------------------
   -- Shifted WR strobe latch, to add some address and data hold time the WR
   -- strobe is negated .5 clock cycles before address and data changes. This
   -- is implemented using the falling edge of the clock. Generally using
   -- both edges of a clock is not recommended.  If this is not desirable
   -- use the latchclr signal with the rising edge of clk. This will result
   -- in a full clk cycle for the data hold.
   ---------------------------------------------------------------------------
   process(clk,reset)                      -- note wr should be 1 clk cycle after latchrw
      begin
         if reset='1' then
            wran  <= '1';
   
         elsif falling_edge(clk) then      -- wran is negated 0.5 cycle before data&address changes
            if latchclr_d_s='1' then    
               wran <= '1';      
            elsif wr_s='1' then   
               wran<='0';
            end if;
   
   --      elsif rising_edge(clk) then     -- wran negated 1 clk cycle before data&address changes
   --         if latchclr='1' then             
   --            wran <= '1';      
   --         elsif wr_s='1' then   
   --            wran<='0';
   --         end if;
   
         end if;
   end process;
   
   ---------------------------------------------------------------------------
   -- WR strobe latch. This signal can be use to drive the tri-state drivers 
   -- and will result in a data hold time until the end of the write cycle.
   ---------------------------------------------------------------------------
   process(clk,reset)                      
      begin
         if reset='1' then
          wrn <= '1';                     
         elsif rising_edge(clk) then 
            if latchclr_d_s='1' then        -- Change wrn at the same time as addr changes
               wrn <= '1';      
            elsif wr_s='1' then   
               wrn<='0';
            end if;
         end if;
   end process;
   
   
   ---------------------------------------------------------------------------
   -- RD strobe latch   
   -- rd is active low and connected to top entity      
   -- Use 1 clk delayed latchrw_d_s signal
   -- Original signals were rd_data_s and rd_code_s, new signals rddata_s and 
   -- rdcode_s.
   -- Add flushreq_s, prevend rd signal from starting 
   ---------------------------------------------------------------------------
   process(reset,clk)
   begin
      if reset='1' then
         rdn <= '1';
         latchmd_s <= '0';
      elsif rising_edge(clk) then
          if latchclr_d_s='1' then
              rdn <= '1';
              latchmd_s <= '0';
          elsif latchrw_d_s='1' then
             latchmd_s <= rddata_s;
             -- Bug reported by Rick Kilgore
             -- ver 0.69, stops RD from being asserted during second inta
             rdn <= not((rdcode_s or rddata_s) AND NOT intack); 
                 
        -- The next second was added to create a updown pulse on the rd strobe
        -- during a flush action. This will result in a dummy read cycle (unavoidable?)
          elsif latchrw='1' then
             latchmd_s <= rddata_s;
             rdn <= not(rdcode_s or rddata_s);  
         end if;
      end if;
   end process;
   
   ---------------------------------------------------------------------------
   -- Second INTA strobe latch   
   ---------------------------------------------------------------------------
   process(reset,clk)
   begin
      if reset='1' then
        inta2_s<= '0';
      elsif rising_edge(clk) then         
          if latchclr_d_s='1' then
              inta2_s <= '0';
          elsif latchrw_d_s='1' then
              inta2_s <= intack;
         end if;
      end if;
   end process;
   
   inta <= not (inta2_s OR inta1_internal); 
   
   ---------------------------------------------------------------------------
   -- Databus stearing for the datapath input
   -- mdbus_out(31..16) is only used for "int x", the value si used to load 
   -- ipreg at the same time as loading cs.
   -- Note mdbus must be valid (i.e. contain dbus value) before rising edge
   -- of wrn/rdn
   ---------------------------------------------------------------------------
   process(clk,reset) 
      begin
         if reset='1' then
            mdbus_out <= (others => '0');
         elsif rising_edge(clk) then 
            if latchmd_s='1' then   
                if word='0' then                   -- byte read
                     mdbus_out <= X"00" & dbus_in;
                else
                   if muxabus="00" then            -- first cycle of word read
                      mdbus_out(15 downto 8) <= dbus_in;
                   else                            -- Second cycle 
                      mdbus_out(7 downto 0) <= dbus_in;
                   end if;               
                end if;        
            end if;
         end if;
   end process;

   process(reset,clk)
   begin
       if reset='1' then
           ipbusbiu_s <= RESET_IP_C;                   -- start 0x0000, CS=FFFF
           csbusbiu_s <= RESET_CS_C;
       elsif rising_edge(clk) then
           if latchabus='1' then
               if (addrplus4='1') then
                   ipbusbiu_s <= ipbusbiu_s+'1';
               else 
                   ipbusbiu_s <= ipbus;                -- get new address after flush
                   csbusbiu_s <= csbus;
               end if;     
           end if;                                   
       end if;
   end process;
   
   -------------------------------------------------------------------------
   -- Latch datapath address+4 for mis-aligned R/W    
   -------------------------------------------------------------------------
   ipbusp1_s <= ipbus+'1';
   abusdp_inp1l_s  <= ipbus when latchrw='0' else ipbusp1_s;
   
   process(abusdp_inp1l_s,muxabus,csbusbiu_s,ipbusbiu_s,csbus,ipbus)
   begin
       case muxabus is
           when "01"   => abus_s <= (csbus&"0000") + ("0000"&ipbus);           --abusdp_in;      
           when "10"   => abus_s <= (csbus&"0000") + ("0000"&abusdp_inp1l_s);  -- Add 1 if odd address and write word
           when others => abus_s <= (csbusbiu_s&"0000") + ("0000"&ipbusbiu_s); -- default to BIU word address
       end case;
   end process;
   
   -------------------------------------------------------------------------
   -- Address/Databus Latch    
   -------------------------------------------------------------------------
   process(reset,clk)
   begin
       if reset='1' then
           abus <= RESET_VECTOR_C;
       elsif rising_edge(clk) then
           if latchrw='1' then                     -- Latch Address 
               abus <= abus_s;                        
           end if;
       end if;
   end process;

   -- Instance port mappings.
   fsm : biufsm
      PORT MAP (
         clk          => clk,
         flush_coming => flush_coming,
         flush_req    => flush_req,
         irq_req      => irq_req_internal,
         irq_type     => irq_type,
         opc_req      => opc_req,
         read_req     => read_req,
         reg1freed    => reg1freed,
         reg4free     => reg4free,
         regnbok      => regnbok,
         reset        => reset,
         w_biufsm_s   => w_biufsm_s,
         write_req    => write_req,
         addrplus4    => addrplus4,
         biu_error    => biu_error,
         biu_status   => biu_status,
         irq_ack      => irq_ack,
         irq_clr      => irq_clr,
         latchabus    => latchabus,
         latchclr     => latchclr,
         latchm       => latchm,
         latcho       => latcho_internal,
         latchrw      => latchrw,
         ldposplus1   => ldposplus1,
         muxabus      => muxabus,
         rdcode_s     => rdcode_s,
         rddata_s     => rddata_s,
         regplus1     => regplus1,
         rw_ack       => rw_ack,
         wr_s         => wr_s,
         flush_ack    => flush_ack_internal,
         inta1        => inta1_internal
      );
   I4 : formatter
      PORT MAP (
         lutbus   => lutbus,
         mux_addr => mux_addr,
         mux_data => mux_data,
         mux_reg  => mux_reg,
         nbreq    => nbreq
      );
   shift : regshiftmux
      PORT MAP (
         clk        => clk,
         dbus_in    => dbus_in,
         flush_req  => flush_req,
         latchm     => latchm,
         latcho     => latcho_internal,
         mux_addr   => mux_addr,
         mux_data   => mux_data,
         mux_reg    => mux_reg,
         nbreq      => nbreq,
         regplus1   => regplus1,
         ldposplus1 => ldposplus1,
         reset      => reset,
         irq        => irq_ack,
         inta1      => inta1_internal,
         inta2_s    => inta2_s,
         irq_type   => irq_type,
         instr      => instr,
         halt_instr => halt_instr,
         lutbus     => lutbus,
         reg1free   => reg4free,
         reg1freed  => reg1freed,
         regnbok    => regnbok
      );

   flush_ack <= flush_ack_internal;
   inta1     <= inta1_internal;
   irq_req   <= irq_req_internal;
   latcho    <= latcho_internal;

END struct;
