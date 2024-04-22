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
USE ieee.std_logic_unsigned.ALL;

USE work.cpu86pack.ALL;
USE work.cpu86instr.ALL;

ENTITY regshiftmux IS
   PORT( 
      clk        : IN     std_logic;
      dbus_in    : IN     std_logic_vector (7 DOWNTO 0);
      flush_req  : IN     std_logic;
      latchm     : IN     std_logic;
      latcho     : IN     std_logic;
      mux_addr   : IN     std_logic_vector (2 DOWNTO 0);
      mux_data   : IN     std_logic_vector (3 DOWNTO 0);
      mux_reg    : IN     std_logic_vector (2 DOWNTO 0);
      nbreq      : IN     std_logic_vector (2 DOWNTO 0);
      regplus1   : IN     std_logic;
      ldposplus1 : IN     std_logic;
      reset      : IN     std_logic;
      irq        : IN     std_logic;
      inta1      : IN     std_logic;                       -- Added for ver 0.71
      inta2_s    : IN     std_logic;
      irq_type   : IN     std_logic_vector (1 DOWNTO 0);
      instr      : OUT    instruction_type;
      halt_instr : OUT    std_logic;
      lutbus     : OUT    std_logic_vector (15 DOWNTO 0);
      reg1free   : BUFFER std_logic;
      reg1freed  : BUFFER std_logic;                       -- Delayed version (1 clk) of reg1free
      regnbok    : OUT    std_logic
   );
END regshiftmux ;
 
architecture regshift of regshiftmux is

signal reg72_s  : std_logic_vector(71 downto 0);
signal regcnt_s : std_logic_vector(3 downto 0); -- Note need possible 9 byte positions
signal ldpos_s  : std_logic_vector(3 downto 0); -- redundant signal (=regcnt_s)

signal ireg_s   : std_logic_vector(7 downto 0); 
signal mod_s    : std_logic_vector(1 downto 0); 
signal rm_s     : std_logic_vector(2 downto 0); 
signal opcreg_s : std_logic_vector(2 downto 0); 
signal opcdata_s: std_logic_vector(15 downto 0);
signal opcaddr_s: std_logic_vector(15 downto 0);
signal nbreq_s  : std_logic_vector(2 downto 0); -- latched nbreq only for instr

signal flush_req1_s : std_logic;                -- Delayed version of flush_req
signal flush_req2_s : std_logic;                -- Delayed version of flush_req (address setup requires 2 clk cycle)

begin

instr.ireg  <= ireg_s;
instr.xmod  <= mod_s;
instr.rm    <= rm_s;
instr.reg   <= opcreg_s;
instr.data  <= opcdata_s(7 downto 0)&opcdata_s(15 downto 8);
instr.disp  <= opcaddr_s(7 downto 0)&opcaddr_s(15 downto 8);

instr.nb    <= nbreq_s;                         -- use latched version

halt_instr <= '1' when ireg_s=HLT else '0';                                   

-------------------------------------------------------------------------
-- reg counter (how many bytes available in pre-fetch queue)
-- ldpos (load position in queue, if MSB=1 then ignore parts of word)
-- Don't forget resource sharing during synthesis :-)
-------------------------------------------------------------------------
process(reset,clk)
begin
    if reset='1' then
        regcnt_s <= (others => '0');            -- wrap around after first pulse!
        ldpos_s  <= (others => '1');
        flush_req1_s <= '0';
        flush_req2_s <= '0';
    elsif rising_edge(clk) then
        flush_req1_s <= flush_req;              -- delay 1 cycle
        flush_req2_s <= flush_req1_s;           -- delay 2 cycles
        
        if flush_req2_s='1' then
            regcnt_s <= (others => '0');        -- Update during Smaxws state
        elsif latcho='1' then
            regcnt_s <= regcnt_s - ('0'&nbreq);
        elsif regplus1='1' and reg1freed='1' then
            regcnt_s <= regcnt_s + '1'; 
        end if;

        if flush_req2_s='1' then
            ldpos_s  <= (others => '1');        -- Result in part of dbus loaded into queue
        elsif latcho='1' then
            ldpos_s  <= ldpos_s - ('0'&nbreq);
        elsif ldposplus1='1' and reg1freed='1' then
            ldpos_s  <= ldpos_s + '1'; 
        end if;
    end if;
end process;

reg1free <= '1' when ldpos_s/="1000" else '0';  -- Note maxcnt=9!!    

process(reset,clk)
begin
    if reset='1' then
        reg1freed <= '1'; 
    elsif rising_edge(clk) then
        reg1freed <= reg1free;
    end if;
end process;        

regnbok  <= '1' when (regcnt_s>='0'&nbreq) else '0'; -- regcnt must be >= nb required

lutbus <= reg72_s(71 downto 56); -- Only for opcode LUT decoder

-------------------------------------------------------------------------
-- Load 8 bits instruction into 72 bits prefetch queue (9 bytes)
-- Latched by latchm signal (from biufsm)
-- ldpos=0 means loading at 71 downto 64 etc
-- Shiftn is connected to nbreq
-------------------------------------------------------------------------
process(reset,clk)
begin
    if reset='1' then
        reg72_s <= NOP & X"0000000000000000"; --(others => '0');
    elsif rising_edge(clk) then
        if latchm='1' then
            case ldpos_s is  -- Load new data, shift in lsb byte first      
               when "0000"  => reg72_s(71 downto 64) <= dbus_in;   
               when "0001"  => reg72_s(63 downto 56) <= dbus_in;
               when "0010"  => reg72_s(55 downto 48) <= dbus_in; 
               when "0011"  => reg72_s(47 downto 40) <= dbus_in; 
               when "0100"  => reg72_s(39 downto 32) <= dbus_in; 
               when "0101"  => reg72_s(31 downto 24) <= dbus_in;
               when "0110"  => reg72_s(23 downto 16) <= dbus_in;
               when "0111"  => reg72_s(15 downto  8) <= dbus_in;
               when "1000"  => reg72_s(7  downto  0) <= dbus_in;                
               when others  => reg72_s <= reg72_s; 
            end case;   
        end if;         
        if latcho='1' then
            case nbreq is      -- remove nb byte(s) when latcho is active
                when "001"  => reg72_s <= reg72_s(63 downto 0) & "--------"; -- smaller synth results than "00000000"       
                when "010"  => reg72_s <= reg72_s(55 downto 0) & "----------------"; 
                when "011"  => reg72_s <= reg72_s(47 downto 0) & "------------------------"; 
                when "100"  => reg72_s <= reg72_s(39 downto 0) & "--------------------------------"; 
                when "101"  => reg72_s <= reg72_s(31 downto 0) & "----------------------------------------"; 
                when "110"  => reg72_s <= reg72_s(23 downto 0) & "------------------------------------------------"; 
                when others => reg72_s <= reg72_s;  
            end case;  
        end if;
    end if;
end process;

-------------------------------------------------------------------------
-- Opcode Data
-- Note format LSB-MSB
-------------------------------------------------------------------------
process(reset,clk)
begin
    if reset='1' then
        opcdata_s <= (others => '0');
    elsif rising_edge(clk) then
        if latcho='1' then
            case mux_data is 
                when "0000" => opcdata_s <= (others => '0');                            -- Correct???    
                when "0001" => opcdata_s <= reg72_s(63 downto 56) & X"00"; 
                when "0010" => opcdata_s <= reg72_s(63 downto 48); 
                when "0011" => opcdata_s <= reg72_s(55 downto 48) & X"00"; 
                when "0100" => opcdata_s <= reg72_s(55 downto 40);        
                when "0101" => opcdata_s <= reg72_s(47 downto 40) & X"00"; 
                when "0110" => opcdata_s <= reg72_s(47 downto 32); 
                when "0111" => opcdata_s <= reg72_s(39 downto 32) & X"00"; 
                when "1000" => opcdata_s <= reg72_s(39 downto 24);
                when others => opcdata_s <= "----------------";   -- generate Error?
            end case;
        end if;
    end if;
end process;

-------------------------------------------------------------------------
-- Opcode Address/Offset/Displacement
-- Format LSB, MSB!
-- Single Displacement byte sign extended
-------------------------------------------------------------------------
process(reset,clk)
begin
    if reset='1' then
        opcaddr_s <= (others => '0');
    elsif rising_edge(clk) then
        if inta2_s='1' then
            opcaddr_s <= dbus_in & X"00";               -- Read 8 bits vector
        elsif latcho='1' then
            --if irq='1' then
            if irq='1' or inta1='1' then                -- added for ver 0.71
                opcaddr_s <= "000000" & irq_type & X"00";               
            else
                case mux_addr is 
                    when "000"  => opcaddr_s <= (others => '0');                         -- Correct ????
                    when "001"  => opcaddr_s <= reg72_s(63 downto 56) & reg72_s(63)& reg72_s(63)& reg72_s(63)& reg72_s(63)&
                                                reg72_s(63)& reg72_s(63)& reg72_s(63)& reg72_s(63); -- MSB Sign extended  
                    when "010"  => opcaddr_s <= reg72_s(63 downto 48); 
                    when "011"  => opcaddr_s <= reg72_s(55 downto 48) & reg72_s(55)& reg72_s(55)& reg72_s(55)& reg72_s(55)&
                                                reg72_s(55)& reg72_s(55)& reg72_s(55)& reg72_s(55); -- MSB Sign Extended
                    when "100"  => opcaddr_s <= reg72_s(55 downto 40); 
                    when "101"  => opcaddr_s <= reg72_s(63 downto 56) & X"00"; -- No sign extend, MSB=0  
                    when "110"  => opcaddr_s <= X"0300";    -- INT3 type=3
                    when others => opcaddr_s <= X"0400";    -- INTO type=4
                end case;
             end if;
        end if;
    end if;

end process;

-------------------------------------------------------------------------
-- Opcode Register
-- Note : "11" is push segment reg[2]=0 reg[1..0]=reg
--      : Note reg[2]=0 if mux_reg=011
-------------------------------------------------------------------------
process(reset,clk)
begin
    if reset='1' then
        opcreg_s <= (others => '0');
    elsif rising_edge(clk) then
        if latcho='1' then
            case mux_reg is 
                when "000"  => opcreg_s <= (others => '0');                       -- Correct ??
                when "001"  => opcreg_s <= reg72_s(61 downto 59);
                when "010"  => opcreg_s <= reg72_s(66 downto 64); 
                when "011"  => opcreg_s <= '0' & reg72_s(68 downto 67); -- bit2 forced to 0
                when "100"  => opcreg_s <= reg72_s(58 downto 56);
                when others => opcreg_s <= "---";
                     --assert FALSE report "**** Incorrect mux_reg in Opcode Regs Register" severity error;
            end case;
        end if;
    end if;
end process;

-------------------------------------------------------------------------
-- Opcode, Mod R/M Register, and latched nbreq! 
-- Create fake xmod and rm if offset (addr_mux) is 1,2,5,6,7. In this case
-- there is no second opcode byte. The fake xmod and rm result in an
-- EA=Displacement.   
-------------------------------------------------------------------------
process(reset,clk) -- ireg
begin
    if reset='1' then
        ireg_s  <=  NOP;            -- default instr
        mod_s   <= (others => '0'); -- default mod
        rm_s    <= (others => '0'); -- default rm
        nbreq_s <= "001";           -- single NOP
    elsif rising_edge(clk) then
        if latcho='1' then
            if irq='1' or inta1='1' then    -- force INT instruction, added for ver 0.71
                ireg_s <= INT;
                nbreq_s<= "000";    -- used in datapath to add to IP address
                mod_s  <= "00";     -- Fake mod (select displacement for int type   
                rm_s   <= "110";    -- Fake rm
            else
                ireg_s <= reg72_s(71 downto 64);
                nbreq_s<= nbreq;
                if  (mux_addr= "001" or mux_addr= "010" or mux_addr= "101"
                                     or mux_addr= "110" or mux_addr= "111") then
                    mod_s  <= "00";     -- Fake mod     
                    rm_s   <= "110";    -- Fake rm
                else
                    mod_s  <= reg72_s(63 downto 62);
                    rm_s   <= reg72_s(58 downto 56);
                end if;
            end if;
        end if;
    end if;
end process;

end regshift;
