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
--  Ver 0.82 Fixed RCR X,CL                                                  --
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

USE work.cpu86pack.ALL;

ENTITY ALU IS
   PORT( 
      alu_inbusa : IN     std_logic_vector (15 DOWNTO 0);
      alu_inbusb : IN     std_logic_vector (15 DOWNTO 0);
      aluopr     : IN     std_logic_vector (6 DOWNTO 0);
      ax_s       : IN     std_logic_vector (15 DOWNTO 0);
      clk        : IN     std_logic;
      cx_s       : IN     std_logic_vector (15 DOWNTO 0);
      dx_s       : IN     std_logic_vector (15 DOWNTO 0);
      reset      : IN     std_logic;
      w          : IN     std_logic;
      wralu      : IN     std_logic;
      wrcc       : IN     std_logic;
      wrtemp     : IN     std_logic;
      alubus     : OUT    std_logic_vector (15 DOWNTO 0);
      ccbus      : OUT    std_logic_vector (15 DOWNTO 0);
      div_err    : OUT    std_logic
   );
END ALU ;

architecture rtl of alu is

component divider is                                    -- Generic Divider

generic( 
        WIDTH_DIVID : Integer := 32;                    --  Width Dividend
        WIDTH_DIVIS : Integer := 16;                    --  Width Divisor
        WIDTH_SHORT : Integer := 8);                    --  Check Overflow against short Byte/Word
port( 
        clk         : in   std_logic;                   -- System Clock, not used in this architecture   
        reset       : in   std_logic;                   -- Active high, not used in this architecture
        dividend    : in   std_logic_vector (WIDTH_DIVID-1 DOWNTO 0);
        divisor     : in   std_logic_vector (WIDTH_DIVIS-1 DOWNTO 0);
        quotient    : out  std_logic_vector (WIDTH_DIVIS-1 DOWNTO 0);  -- changed to 16 bits!! (S not D)
        remainder   : out  std_logic_vector (WIDTH_DIVIS-1 DOWNTO 0);
        twocomp     : in   std_logic;                   -- '1' = 2's Complement, '0' = Unsigned
        w           : in   std_logic;                   -- '0'=byte, '1'=word (cpu processor)
        overflow    : out  std_logic;                   -- '1' if div by 0 or overflow
        start       : in   std_logic;                   -- not used in this architecture
        done        : out  std_logic);                  -- not used in this architecture
end component divider;

component multiplier is                                 -- Generic Multiplier
 generic (WIDTH     : integer := 16);                   
port (multiplicant  : in   std_logic_vector (WIDTH-1 downto 0); 
      multiplier    : in   std_logic_vector (WIDTH-1 downto 0); 
      product       : out  std_logic_vector (WIDTH+WIDTH-1 downto 0);-- result
      twocomp       : in   std_logic);
end component multiplier;

signal  product_s   : std_logic_vector(31 downto 0);    -- result multiplier 

signal  dividend_s  : std_logic_vector(31 downto 0);    -- Input divider
signal  remainder_s : std_logic_vector(15 downto 0);    -- Divider result
signal  quotient_s  : std_logic_vector(15 downto 0);    -- Divider result
signal  divresult_s : std_logic_vector(31 DOWNTO 0);    -- Output divider to alubus
signal  div_err_s   : std_logic;                        -- Divide by 0 

signal  twocomp_s   : std_logic;                        -- Sign Extend for IMUL and IDIV
signal  wl_s        : std_logic;                        -- Latched w signal, used for muliplier/divider

signal  alubus_s    : std_logic_vector (15 DOWNTO 0);

signal  abus_s      : std_logic_vector(15 downto 0);        
signal  bbus_s      : std_logic_vector(15 downto 0);  
signal  dxbus_s     : std_logic_vector(15 downto 0);    -- DX register 

signal  addbbus_s   : std_logic_vector(15 downto 0);    -- bbus connected to full adder 
signal  cbus_s      : std_logic_vector(16 downto 0);    -- Carry Bus
signal  outbus_s    : std_logic_vector(15 downto 0);    -- outbus=abus+bbus

signal  sign16a_s   : std_logic_vector(15 downto 0);    -- sign extended alu_busa(7 downto 0)
signal  sign16b_s   : std_logic_vector(15 downto 0);    -- sign extended alu_busb(7 downto 0)
signal  sign32a_s   : std_logic_vector(15 downto 0);    -- 16 bits alu_busa(15) vector (CWD)

signal  aasbus_s    : std_logic_vector(15 downto 0);    -- used for AAS instruction
signal  aas1bus_s   : std_logic_vector(15 downto 0);    

signal  daabus_s    : std_logic_vector(7 downto 0);     -- used for DAA instruction
signal  dasbus_s    : std_logic_vector(7 downto 0);     -- used for DAS instruction

signal  aaabus_s    : std_logic_vector(15 downto 0);    -- used for AAA instruction
signal  aaa1bus_s   : std_logic_vector(15 downto 0);    

signal  aadbus_s    : std_logic_vector(15 downto 0);    -- used for AAD instruction
signal  aad1bus_s   : std_logic_vector(10 downto 0);    
signal  aad2bus_s   : std_logic_vector(10 downto 0);    

signal  setaas_s    : std_logic;                        -- '1' set CF & AF else both 0
signal  setaaa_s    : std_logic;                        -- '1' set CF & AF else both 0
signal  setdaa_s    : std_logic_vector(1 downto 0);     -- "11" set CF & AF 
signal  setdas_s    : std_logic_vector(1 downto 0);     -- "11" set CF & AF 

signal  bit4_s      : std_logic;                        -- used for AF flag
signal  cout_s      : std_logic;                    

signal  psrreg_s    : std_logic_vector(15 downto 0);    -- 16 bits flag register

signal  zflaglow_s  : std_logic;                        -- low byte zero flag (w=0)
signal  zflaghigh_s : std_logic;                        -- high byte zero flag (w=1)
signal  zeroflag_s  : std_logic;                        -- zero flag, asserted when zero

signal  c1flag_s    : std_logic;                        -- Asserted when CX=1(w=1) or CL=1(w=0)

signal  zflagdx_s   : std_logic;                        -- Result (DX) zero flag, asserted when not zero (used for mul/imul)

signal  zflagah_s   : std_logic;                        -- '1' if IMUL(15..8)/=0
signal  hflagah_s   : std_logic;                        -- Used for IMUL
signal  hflagdx_s   : std_logic;                        -- Used for IMUL

signal  overflow_s  : std_logic;
signal  parityflag_s: std_logic; 
signal  signflag_s  : std_logic;                        

alias   OFLAG       : std_logic is psrreg_s(11);
alias   DFLAG       : std_logic is psrreg_s(10);
alias   IFLAG       : std_logic is psrreg_s(9);
alias   TFLAG       : std_logic is psrreg_s(8);                           
alias   SFLAG       : std_logic is psrreg_s(7);
alias   ZFLAG       : std_logic is psrreg_s(6);
alias   AFLAG       : std_logic is psrreg_s(4);
alias   PFLAG       : std_logic is psrreg_s(2);
alias   CFLAG       : std_logic is psrreg_s(0);

signal  alureg_s    : std_logic_vector(31 downto 0);    -- 31 bits temp register for alu_inbusa & alu_inbusb
signal  alucout_s   : std_logic;                        -- ALUREG Carry Out signal

signal  alu_temp_s  : std_logic_vector(15 downto 0);    -- Temp/scratchpad register, use ALU_TEMP to select

signal  done_s      : std_logic;                        -- Serial divider conversion done
signal  startdiv_s  : std_logic;                        -- Serial divider start pulse

begin

ALUU1 : divider
    generic map (WIDTH_DIVID =>  32,  WIDTH_DIVIS =>  16, WIDTH_SHORT => 8)
    port map   (clk         => clk,
                reset       => reset,
                dividend    => dividend_s,              -- DX:AX
                divisor     => alureg_s(15 downto 0),   -- 0&byte/word
                --divisor   => bbus_s,                  -- byte/word
                quotient    => quotient_s,              -- 16 bits
                remainder   => remainder_s,             -- 16 bits
                twocomp     => twocomp_s,
                w           => wl_s,                    -- Byte/Word
                overflow    => div_err_s,               -- Divider Overflow. generate int0
                start       => startdiv_s,              -- start conversion, generated by proc      
                done        => done_s);                 -- conversion done, latch results

ALUU2 : multiplier
    generic map (WIDTH      =>  16)                     -- Result is 2*WIDTH bits
    port map   (multiplicant=> alureg_s(31 downto 16),      
                multiplier  => alureg_s(15 downto 0),                                   
                product     => product_s,               -- 32 bits!
                twocomp     => twocomp_s);

dividend_s  <= X"000000"&alureg_s(23 downto 16) when aluopr=ALU_AAM else dxbus_s & alureg_s(31 downto 16);-- DX is sign extended for byte IDIV

-- start serial divider 1 cycle after wralu pulse received. The reason is that the dividend is loaded into the
-- accumulator thus the data must be valid when this happens.
process (clk, reset)
    begin 
        if reset='1' then
            startdiv_s <= '0';
        elsif rising_edge(clk) then
            if  (wralu='1' and (aluopr=ALU_DIV or aluopr=ALU_IDIV OR aluopr=ALU_AAM)) then
                startdiv_s <= '1';  
            else 
                startdiv_s <= '0';
            end if;
        end if;
end process;

----------------------------------------------------------------------------
-- Create Full adder
----------------------------------------------------------------------------   
fulladd: for bit_nr in 0 to 15 generate       
    outbus_s(bit_nr) <= abus_s(bit_nr) xor addbbus_s(bit_nr) xor cbus_s(bit_nr);

    cbus_s(bit_nr+1) <= (abus_s(bit_nr) and addbbus_s(bit_nr)) or
                        (abus_s(bit_nr) and cbus_s(bit_nr)) or
                        (addbbus_s(bit_nr) and cbus_s(bit_nr));
end generate fulladd;
      
bit4_s    <= cbus_s(4);  

sign16a_s <= alu_inbusa(7) &alu_inbusa(7) &alu_inbusa(7) &alu_inbusa(7)&alu_inbusa(7)&
             alu_inbusa(7) &alu_inbusa(7) &alu_inbusa(7) &alu_inbusa(7 downto 0);   
sign16b_s <= alu_inbusb(7) &alu_inbusb(7) &alu_inbusb(7) &alu_inbusb(7)&alu_inbusb(7)&
             alu_inbusb(7) &alu_inbusb(7) &alu_inbusb(7) &alu_inbusb(7 downto 0);
sign32a_s <= alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&
             alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&
             alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&alu_inbusa(15)&
             alu_inbusa(15);

-- Invert bus for subtract instructions
addbbus_s <= not bbus_s when ((aluopr=ALU_CMP) or (aluopr=ALU_CMP_SE) or (aluopr=ALU_CMPS) or (aluopr=ALU_DEC) 
                           or (aluopr=ALU_SBB) or (aluopr=ALU_SBB_SE) or (aluopr=ALU_PUSH) or (aluopr=ALU_SUB) 
                           or (aluopr=ALU_SUB_SE) or (aluopr=ALU_SCAS)) else bbus_s;


-- sign extend for IDIV and IMUL instructions           
twocomp_s <= '1' when  ((aluopr=ALU_IDIV) or (aluopr=ALU_IMUL) or
                        (aluopr=ALU_IDIV2)or (aluopr=ALU_IMUL2)) else '0';   

----------------------------------------------------------------------------
-- Sign Extend Logic abus & bbus & dxbus
----------------------------------------------------------------------------
process (w, alu_inbusa, alu_inbusb, sign16a_s, sign16b_s, aluopr, ax_s, alureg_s)
    begin 
        if (w='1') then                                 -- Word, no sign extend, unless signextend is specified
            case aluopr is  
                when ALU_CMPS =>
                    abus_s  <= alu_inbusa;              -- no sign extend
                    bbus_s  <= alureg_s(15 downto 0);   -- previous read ES:[DI]
                when ALU_NEG | ALU_NOT =>
                    abus_s  <= not(alu_inbusa);         -- NEG instruction, not(operand)+1
                    bbus_s  <= alu_inbusb;              -- 0001 (0000 for NOT)
                when ALU_ADD_SE | ALU_ADC_SE | ALU_SBB_SE | ALU_SUB_SE | ALU_CMP_SE |
                     ALU_OR_SE | ALU_AND_SE | ALU_XOR_SE=>
                    abus_s  <= alu_inbusa;              -- no sign extend
                    bbus_s  <= sign16b_s;               -- Sign extend on 8 bits immediate values (see O80I2RM)
                when others =>
                    abus_s  <= alu_inbusa;              -- no sign extend
                    bbus_s  <= alu_inbusb;
            end case;
        else                                                
            case aluopr is  
                when ALU_CMPS =>
                    abus_s  <= alu_inbusa;
                    bbus_s  <= alureg_s(15 downto 0);       
                when ALU_DIV | ALU_DIV2  =>
                    abus_s  <= ax_s;
                    bbus_s  <= alu_inbusb;
                when ALU_IDIV| ALU_IDIV2 =>
                    abus_s  <= ax_s;
                    bbus_s  <= sign16b_s;
                when ALU_MUL | ALU_MUL2 | ALU_SCAS  =>
                    abus_s  <= alu_inbusa;
                    bbus_s  <= alu_inbusb;
                when ALU_NEG | ALU_NOT =>
                    abus_s  <= not(alu_inbusa);         -- NEG instruction, not(operand)+1
                    bbus_s  <= alu_inbusb;              -- 0001 (0000 for NOT)
                when others =>
                    abus_s  <= sign16a_s;
                    bbus_s  <= sign16b_s;
            end case;                    
        end if;
end process; 

process (wl_s, aluopr, dx_s, alu_inbusa)                -- dxbus for DIV/IDIV only
    begin                   
        if (wl_s='1') then                              -- Word, no sign extend
            dxbus_s  <= dx_s;                   
        else                                            -- Byte  
            if (((aluopr=ALU_IDIV) or (aluopr=ALU_IDIV2)) and (alu_inbusa(15)='1')) then    -- signed DX<-SE(AX)/bbus<-SE(byte)
                dxbus_s <= X"FFFF";                     -- DX=FFFF (ignored for mul)
            else 
                dxbus_s <= X"0000";                     -- DX=0000 (ignored for mul)
            end if;
        end if;
end process;                         

----------------------------------------------------------------------------
-- Carry In logic
----------------------------------------------------------------------------
process (aluopr, psrreg_s)
    begin 
        case aluopr is
            when ALU_ADD | ALU_ADD_SE | ALU_INC | ALU_POP | ALU_NEG | ALU_NOT   
                            =>  cbus_s(0) <= '0';
            when ALU_SBB | ALU_SBB_SE   
                            =>  cbus_s(0) <= not CFLAG;
            when ALU_SUB | ALU_SUB_SE | ALU_DEC | ALU_PUSH | ALU_CMP | ALU_CMP_SE 
                         | ALU_CMPS   | ALU_SCAS    
                            =>  cbus_s(0) <= '1';
            when others     =>  cbus_s(0) <= CFLAG;     -- ALU_ADC, ALU_SUB, ALU_SBB
        end case;
end process; 

----------------------------------------------------------------------------
-- Carry Out logic
-- cout is inverted for ALU_SUB and ALU_SBB before written to psrreg_s
----------------------------------------------------------------------------
process (aluopr, w, psrreg_s, cbus_s, alu_inbusa)
    begin 
        case aluopr is  
            when ALU_ADD | ALU_ADD_SE | ALU_ADC | ALU_ADC_SE | ALU_SUB | ALU_SUB_SE | ALU_SBB | ALU_SBB_SE |
                 ALU_CMP | ALU_CMP_SE | ALU_CMPS| ALU_SCAS => 
                if (w='1') then cout_s <= cbus_s(16); 
                    else cout_s <= cbus_s(8); 
                end if;
            when ALU_NEG =>                             -- CF=0 if operand=0, else 1
                if (alu_inbusa=X"0000") then
                    cout_s <= '1';                      -- Note CFLAG=NOT(cout_s)
                else
                    cout_s <= '0';                      -- Note CFLAG=NOT(cout_s)
                end if;         
            when others  => 
                cout_s <= CFLAG;                        -- Keep previous value
        end case;       
end process;

----------------------------------------------------------------------------
-- Overflow Logic
----------------------------------------------------------------------------
process (aluopr, w, psrreg_s, cbus_s, alureg_s, alucout_s, zflaghigh_s, zflagdx_s,hflagdx_s,zflagah_s,
         hflagah_s, wl_s, product_s, c1flag_s)
    begin 
        case aluopr is          
            when ALU_ADD | ALU_ADD_SE | ALU_ADC | ALU_ADC_SE | ALU_INC | ALU_DEC | ALU_SUB | ALU_SUB_SE |  
                 ALU_SBB | ALU_SBB_SE | ALU_CMP | ALU_CMP_SE | ALU_CMPS | ALU_SCAS | ALU_NEG =>
                if w='1' then                       -- 16 bits
                    overflow_s  <= cbus_s(16) xor cbus_s(15);
                else 
                    overflow_s  <= cbus_s(8) xor cbus_s(7);             
                end if;

            when ALU_ROL1 | ALU_RCL1 | ALU_SHL1 =>          -- count=1 using constants as in rcl bx,1
                if (((w='1') and (alureg_s(15)/=alucout_s)) or
                    ((w='0') and (alureg_s(7) /=alucout_s))) then
                    overflow_s <= '1';  
                else
                    overflow_s <= '0'; 
                end if;
            when ALU_ROL | ALU_RCL | ALU_SHL =>             -- cl/cx=1              
                if (( c1flag_s='1' and w='1' and (alureg_s(15)/=alucout_s)) or
                    ( c1flag_s='1' and w='0' and (alureg_s(7) /=alucout_s))) then
                    overflow_s <= '1';  
                else
                    overflow_s <= '0'; 
                end if;


            when ALU_ROR1 | ALU_RCR1 | ALU_SHR1 | ALU_SAR1 => 
                if (((w='1') and (alureg_s(15)/=alureg_s(14))) or
                    ((w='0') and (alureg_s(7) /=alureg_s(6)))) then 
                    overflow_s <= '1';  
                else
                    overflow_s <= '0'; 
                end if;     
            when ALU_ROR | ALU_RCR | ALU_SHR | ALU_SAR =>           -- if cl/cx=1
                if ((c1flag_s='1' and w='1' and (alureg_s(15)/=alureg_s(14))) or
                    (c1flag_s='1' and w='0' and (alureg_s(7) /=alureg_s(6)))) then  
                    overflow_s <= '1';  
                else
                    overflow_s <= '0'; 
                end if;     
                
                        
            when ALU_MUL | ALU_MUL2 => 
                if (wl_s='0') then
                    overflow_s <= zflaghigh_s;  
                else
                    overflow_s <= zflagdx_s;    -- MSW multiply/divide result
                end if;
            when ALU_IMUL | ALU_IMUL2 =>        -- if MSbit(1)='1' & AH=FF/DX=FFFF 
                if ((wl_s='0' and product_s(7)='1'  and hflagah_s='1') or
                    (wl_s='0' and product_s(7)='0'  and zflagah_s='0') or
                    (wl_s='1' and product_s(15)='1' and hflagdx_s='1') or
                    (wl_s='1' and product_s(15)='0' and zflagdx_s='0')) then
                    overflow_s <= '0';  
                else
                    overflow_s <= '1';                  
                end if;
            when others     =>  
                overflow_s <= OFLAG;                -- Keep previous value
        end case;
end process;

----------------------------------------------------------------------------
-- Zeroflag set if result=0, zflagdx_s=1 when dx/=0, zflagah_s=1 when ah/=0
----------------------------------------------------------------------------
zflaglow_s  <=  alubus_s(7)  or alubus_s(6)  or alubus_s(5)  or alubus_s(4)  or
                alubus_s(3)  or alubus_s(2)  or alubus_s(1)  or alubus_s(0);
zflaghigh_s <=  alubus_s(15) or alubus_s(14) or alubus_s(13) or alubus_s(12) or
                alubus_s(11) or alubus_s(10) or alubus_s(9)  or alubus_s(8);
zeroflag_s  <= not(zflaghigh_s or zflaglow_s) when w='1' else not(zflaglow_s);

zflagdx_s   <=  product_s(31) or product_s(30) or product_s(29) or product_s(28) or
                product_s(27) or product_s(26) or product_s(25) or product_s(24) or
                product_s(23) or product_s(22) or product_s(21) or product_s(20) or
                product_s(19) or product_s(18) or product_s(17) or product_s(16);

zflagah_s   <=  product_s(15) or product_s(14) or product_s(13) or product_s(12) or
                product_s(11) or product_s(10) or product_s(09) or product_s(08);

----------------------------------------------------------------------------
-- hflag set if IMUL result AH=FF or DX=FFFF 
----------------------------------------------------------------------------
hflagah_s  <=   product_s(15) and product_s(14) and product_s(13) and product_s(12) and
                product_s(11) and product_s(10) and product_s(9)  and product_s(8);

hflagdx_s  <=   product_s(31) and product_s(30) and product_s(29) and product_s(28) and
                product_s(27) and product_s(26) and product_s(25) and product_s(24) and
                product_s(23) and product_s(22) and product_s(21) and product_s(20) and
                product_s(19) and product_s(18) and product_s(17) and product_s(16);

----------------------------------------------------------------------------
-- Parity flag set if even number of bits in LSB
----------------------------------------------------------------------------
parityflag_s <=not(alubus_s(7) xor alubus_s(6) xor alubus_s(5) xor alubus_s(4)  xor
                   alubus_s(3) xor alubus_s(2) xor alubus_s(1) xor alubus_s(0));

----------------------------------------------------------------------------
-- Sign flag
----------------------------------------------------------------------------
signflag_s <= alubus_s(15) when w='1' else alubus_s(7);

----------------------------------------------------------------------------
-- c1flag asserted if CL or CX=1, used to update the OF flags during
-- rotate/shift instructions
----------------------------------------------------------------------------
c1flag_s  <= '1' when (cx_s=X"0001" and w='1') OR (cx_s(7 downto 0)=X"01" and w='0') else '0';

----------------------------------------------------------------------------
-- Temp/ScratchPad Register
-- alureg_s can also be used as temp storage
-- temp<=bbus; 
----------------------------------------------------------------------------
process (clk, reset)
    begin 
        if reset='1' then
            alu_temp_s<= (others => '0');
        elsif rising_edge(clk) then
            if (wrtemp='1') then 
                alu_temp_s <= bbus_s;
            end if;
        end if;
end process;


----------------------------------------------------------------------------
-- ALU Register used for xchg and rotate/shift instruction
-- latch Carry Out alucout_s signal
----------------------------------------------------------------------------
process (clk, reset)
    begin 
        if reset='1' then
            alureg_s <= (others => '0'); 
            alucout_s<= '0';                                              
            wl_s     <= '0';        
        elsif rising_edge(clk) then
            if (wralu='1') then 
                alureg_s(31 downto 16) <= abus_s;   -- alu_inbusa;
                wl_s <= w;                          -- Latched w version
                if w='1' then                       -- word operation
                    case aluopr is
                        when ALU_ROL | ALU_ROL1 => alureg_s(15 downto 0) <= alureg_s(14 downto 0) & alureg_s(15);
                                                   alucout_s<= alureg_s(15); 
                        when ALU_ROR | ALU_ROR1 => alureg_s(15 downto 0) <= alureg_s(0) & alureg_s(15 downto 1); 
                                                   alucout_s<= alureg_s(0);     
                        when ALU_RCL | ALU_RCL1 => alureg_s(15 downto 0) <= alureg_s(14 downto 0) & alucout_s; -- shift carry in
                                                   alucout_s<= alureg_s(15);    
                        when ALU_RCR | ALU_RCR1 => alureg_s(15 downto 0) <= alucout_s & alureg_s(15 downto 1);
                                                   alucout_s<= alureg_s(0);     
                        when ALU_SHL | ALU_SHL1 => alureg_s(15 downto 0) <= alureg_s(14 downto 0) & '0';
                                                   alucout_s<= alureg_s(15);    
                        when ALU_SHR | ALU_SHR1 => alureg_s(15 downto 0) <= '0' & alureg_s(15 downto 1);
                                                   alucout_s<= alureg_s(0);     
                        when ALU_SAR | ALU_SAR1 => alureg_s(15 downto 0) <= alureg_s(15) & alureg_s(15 downto 1);
                                                   alucout_s<= alureg_s(0); 
                       when ALU_TEMP            => alureg_s(15 downto 0) <= bbus_s;
                                                   alucout_s<= '-';         -- Don't care!
                        when ALU_AAM            => alureg_s(15 downto 0) <= X"000A";
                                                   alucout_s<= '-';         -- Don't care!
                        
                        when others => alureg_s(15 downto 0) <= bbus_s ;--alu_inbusb;           -- ALU_PASSB
                                                   alucout_s<= CFLAG; 
                    end case; 
                else
                    case aluopr is                    -- To aid resource sharing add MSB byte as above
                        when ALU_ROL | ALU_ROL1 => alureg_s(15 downto 0) <= alureg_s(14 downto 7)               & (alureg_s(6 downto 0) & alureg_s(7)); 
                                                   alucout_s<= alureg_s(7);
                        when ALU_ROR | ALU_ROR1 => alureg_s(15 downto 0) <= alureg_s(0) & alureg_s(15 downto 9) & (alureg_s(0) & alureg_s(7 downto 1));     
                                                   alucout_s<= alureg_s(0);
                        when ALU_RCL | ALU_RCL1 => alureg_s(15 downto 0) <= alureg_s(14 downto 7)               & (alureg_s(6 downto 0) & alucout_s); -- shift carry in 
                                                   alucout_s<= alureg_s(7);
                     -- when ALU_RCR | ALU_RCR1 => alureg_s(15 downto 0) <= alucout_s & alureg_s(15 downto 9) & (psrreg_s(0) & alureg_s(7 downto 1));
                        when ALU_RCR | ALU_RCR1 => alureg_s(15 downto 0) <= alucout_s & alureg_s(15 downto 9) & (alucout_s & alureg_s(7 downto 1));  -- Ver 0.82                            
                                                   alucout_s<= alureg_s(0);
                        when ALU_SHL | ALU_SHL1 => alureg_s(15 downto 0) <= alureg_s(14 downto 7)               & (alureg_s(6 downto 0) & '0'); 
                                                   alucout_s<= alureg_s(7);
                        when ALU_SHR | ALU_SHR1 => alureg_s(15 downto 0) <= '0' & alureg_s(15 downto 9)         & ('0' & alureg_s(7 downto 1)); 
                                                   alucout_s<= alureg_s(0);
                        when ALU_SAR | ALU_SAR1 => alureg_s(15 downto 0) <= alureg_s(15) & alureg_s(15 downto 9)& (alureg_s(7) & alureg_s(7 downto 1)); 
                                                   alucout_s<= alureg_s(0);
                        when ALU_TEMP           => alureg_s(15 downto 0) <= bbus_s;
                                                   alucout_s<= '-';         -- Don't care!
                        when ALU_AAM            => alureg_s(15 downto 0) <= X"000A";
                                                   alucout_s<= '-';         -- Don't care!
                        when others => alureg_s(15 downto 0) <= bbus_s ;--alu_inbusb            -- ALU_PASSB
                                                   alucout_s<= CFLAG;
                    end case; 
                end if;
            end if; 
        end if; 
end process;  

----------------------------------------------------------------------------
-- AAS Instruction  3F
----------------------------------------------------------------------------
process (alu_inbusa,psrreg_s,aas1bus_s)
    begin
        aas1bus_s<=alu_inbusa-X"0106";
        if ((alu_inbusa(3 downto 0) > "1001") or (psrreg_s(4)='1')) then    
            aasbus_s <= aas1bus_s(15 downto 8)&X"0"&aas1bus_s(3 downto 0);
            setaas_s <= '1';                    -- Set CF and AF flag
        else
            aasbus_s(7 downto 0) <= X"0"&(alu_inbusa(3 downto 0));  -- AL=AL&0Fh
            aasbus_s(15 downto 8)<= alu_inbusa(15 downto 8); -- leave AH unchanged
            setaas_s <= '0';                    -- Clear CF and AF flag
        end if;
end process;

----------------------------------------------------------------------------
-- AAA Instruction  37
----------------------------------------------------------------------------
process (alu_inbusa,psrreg_s,aaa1bus_s)
    begin
        aaa1bus_s<=alu_inbusa+X"0106";
        if ((alu_inbusa(3 downto 0) > "1001") or (psrreg_s(4)='1')) then   
            aaabus_s <= aaa1bus_s(15 downto 8)&X"0"&aaa1bus_s(3 downto 0);
            setaaa_s <= '1';                    -- Set CF and AF flag
        else
            aaabus_s(7 downto 0) <= X"0"&alu_inbusa(3 downto 0); -- AL=AL&0Fh
            aaabus_s(15 downto 8)<= alu_inbusa(15 downto 8);    -- AH Unchanged
            setaaa_s <= '0';                    -- Clear CF and AF flag
        end if;
end process;

----------------------------------------------------------------------------
-- DAA Instruction  27
----------------------------------------------------------------------------
process (alu_inbusa,psrreg_s,setdaa_s)
    begin
        if ((alu_inbusa(3 downto 0) > X"9") or (psrreg_s(4)='1')) then  
            setdaa_s(0) <= '1';                         -- set AF
        else
            setdaa_s(0) <= '0';                         -- clr AF
        end if;
        if ((alu_inbusa(7 downto 0) > X"9F") or (psrreg_s(0)='1') or (alu_inbusa(7 downto 0) > X"99")) then 
            setdaa_s(1) <= '1';                         -- set CF
        else
            setdaa_s(1) <= '0';                         -- clr CF
        end if;
        case setdaa_s is
            when "00"   => daabus_s <= alu_inbusa(7 downto 0);
            when "01"   => daabus_s <= alu_inbusa(7 downto 0) + X"06";
            when "10"   => daabus_s <= alu_inbusa(7 downto 0) + X"60";
            when others => daabus_s <= alu_inbusa(7 downto 0) + X"66";
        end case;
end process;

----------------------------------------------------------------------------
-- DAS Instruction  2F
----------------------------------------------------------------------------
process (alu_inbusa,psrreg_s,setdas_s)
    begin
        if ((alu_inbusa(3 downto 0) > X"9") or (psrreg_s(4)='1')) then  
            setdas_s(0) <= '1';                         -- set AF
        else
            setdas_s(0) <= '0';                         -- clr AF
        end if;
        if ((alu_inbusa(7 downto 0) > X"9F") or (psrreg_s(0)='1') or (alu_inbusa(7 downto 0) > X"99")) then 
            setdas_s(1) <= '1';                         -- set CF
        else
            setdas_s(1) <= '0';                         -- clr CF
        end if;
        case setdas_s is
            when "00"   => dasbus_s <= alu_inbusa(7 downto 0);
            when "01"   => dasbus_s <= alu_inbusa(7 downto 0) - X"06";
            when "10"   => dasbus_s <= alu_inbusa(7 downto 0) - X"60";
            when others => dasbus_s <= alu_inbusa(7 downto 0) - X"66";
        end case;
end process;

----------------------------------------------------------------------------
-- AAD Instruction  5D 0A
----------------------------------------------------------------------------
process (alu_inbusa,aad1bus_s,aad2bus_s)
    begin
        aad1bus_s <= ("00" & alu_inbusa(15 downto 8) & '0') + (alu_inbusa(15 downto 8) & "000"); -- AH*2 + AH*8
        aad2bus_s <= aad1bus_s + ("000" & alu_inbusa(7 downto 0));   -- + AL
        aadbus_s<= "00000000" & aad2bus_s(7 downto 0);
end process;

----------------------------------------------------------------------------
-- ALU Operation
----------------------------------------------------------------------------
process (aluopr,abus_s,bbus_s,outbus_s,psrreg_s,alureg_s,aasbus_s,aaabus_s,daabus_s,sign16a_s,
         sign16b_s,sign32a_s,dasbus_s,product_s,divresult_s,alu_temp_s,aadbus_s,quotient_s,remainder_s) 
    begin
        case aluopr is
    
            when ALU_ADD | ALU_ADD_SE | ALU_INC | ALU_POP | ALU_SUB | ALU_SUB_SE | ALU_DEC | ALU_PUSH | ALU_CMP | ALU_CMP_SE | 
                 ALU_CMPS | ALU_ADC | ALU_ADC_SE | ALU_SBB | ALU_SBB_SE | ALU_SCAS | ALU_NEG | ALU_NOT
                            => alubus_s <= outbus_s;                
    
            when ALU_OR | ALU_OR_SE     
                            => alubus_s <= abus_s OR bbus_s;
            when ALU_AND | ALU_AND_SE | ALU_TEST0 | ALU_TEST1 | ALU_TEST2   
                            => alubus_s <= abus_s AND bbus_s;
            when ALU_XOR | ALU_XOR_SE   
                            => alubus_s <= abus_s XOR bbus_s;

            when ALU_LAHF   => alubus_s <= psrreg_s(15 downto 2)&'1'&psrreg_s(0);-- flags onto ALUBUS, note reserved bit1=1
                        
            when ALU_MUL | ALU_IMUL 
                            => alubus_s <= product_s(15 downto 0);  -- AX of Multiplier
            when ALU_MUL2| ALU_IMUL2
                            => alubus_s <= product_s(31 downto 16); -- DX of Multiplier
                        
            when ALU_DIV | ALU_IDIV                                 
                            => alubus_s <= divresult_s(15 downto 0);-- AX of Divider (quotient)   
            when ALU_DIV2| ALU_IDIV2
                            => alubus_s <= divresult_s(31 downto 16);-- DX of Divider (remainder) 
                                                                                
            when ALU_SEXT   => alubus_s <= sign16a_s;               -- Used for CBW Instruction
            when ALU_SEXTW  => alubus_s <= sign32a_s;               -- Used for CWD Instruction

            when ALU_AAS    => alubus_s <= aasbus_s;                -- Used for AAS Instruction
            when ALU_AAA    => alubus_s <= aaabus_s;                -- Used for AAA Instruction
            when ALU_DAA    => alubus_s <= abus_s(15 downto 8) & daabus_s;-- Used for DAA Instruction
            when ALU_DAS    => alubus_s <= abus_s(15 downto 8) & dasbus_s;-- Used for DAS Instruction
            when ALU_AAD    => alubus_s <= aadbus_s;                -- Used for AAD Instruction
            when ALU_AAM    => alubus_s <= quotient_s(7 downto 0) & remainder_s(7 downto 0); -- Used for AAM Instruction

            when ALU_ROL | ALU_ROL1 | ALU_ROR | ALU_ROR1 | ALU_RCL | ALU_RCL1 | ALU_RCR | ALU_RCR1 |    
                 ALU_SHL | ALU_SHL1 | ALU_SHR | ALU_SHR1 | ALU_SAR | ALU_SAR1 | ALU_REGL   
                            => alubus_s <= alureg_s(15 downto 0);   -- alu_inbusb to output

            when ALU_REGH  => alubus_s <= alureg_s(31 downto 16);   -- alu_inbusa to output

            when ALU_PASSA  => alubus_s <= abus_s;
            --when ALU_PASSB  => alubus_s <= bbus_s;

            when ALU_TEMP   => alubus_s <= alu_temp_s;              

            when others     => alubus_s <= DONTCARE(15 downto 0);           
        end case;
end process;
alubus <= alubus_s;                 -- Connect to entity

                  
----------------------------------------------------------------------------
-- Processor Status Register  (Flags)
-- bit   Flag
-- 15    Reserved
-- 14    Reserved
-- 13    Reserved               Set to 1?
-- 12    Reserved               Set to 1?
-- 11    Overflow Flag OF
-- 10    Direction Flag DF
-- 9     Interrupt Flag IF
-- 8     Trace Flag TF
-- 7     Sign Flag SF
-- 6     Zero Flag ZF
-- 5     Reserved
-- 4     Auxiliary Carry AF
-- 3     Reserved
-- 2     Parity Flag PF
-- 1     Reserved               Set to 1 ????
-- 0     Carry Flag
----------------------------------------------------------------------------
process (clk, reset)
    begin 
        if reset='1' then
            psrreg_s <= "1111000000000010";
        elsif rising_edge(clk) then
            if (wrcc='1') then  
                case aluopr is
                    when ALU_ADD | ALU_ADD_SE | ALU_ADC | ALU_ADC_SE | ALU_INC  =>
                            OFLAG <= overflow_s; 
                            SFLAG <= signflag_s; 
                            ZFLAG <= zeroflag_s;
                            AFLAG <= bit4_s;
                            PFLAG <= parityflag_s;
                            CFLAG <= cout_s;    
                    when ALU_DEC => -- Same as for ALU_SUB exclusing the CFLAG :-(
                            OFLAG <= overflow_s; 
                            SFLAG <= signflag_s; 
                            ZFLAG <= zeroflag_s;
                            AFLAG <= not bit4_s;
                            PFLAG <= parityflag_s;
                    when ALU_SUB | ALU_SUB_SE | ALU_SBB | ALU_SBB_SE | ALU_CMP | 
                         ALU_CMP_SE | ALU_CMPS | ALU_SCAS | ALU_NEG =>
                            OFLAG <= overflow_s; 
                            SFLAG <= signflag_s; 
                            ZFLAG <= zeroflag_s;
                            AFLAG <= not bit4_s;
                            PFLAG <= parityflag_s;
                            CFLAG <= not cout_s;                                                                
                    when ALU_OR | ALU_OR_SE |  ALU_AND | ALU_AND_SE | ALU_XOR | ALU_XOR_SE | ALU_TEST0 | ALU_TEST1 | ALU_TEST2 =>
                            OFLAG <= '0'; 
                            SFLAG <= signflag_s;        
                            ZFLAG <= zeroflag_s;
                            AFLAG <= '0';           -- None defined, set to 0 to be compatible with debug
                            PFLAG <= parityflag_s;
                            CFLAG <= '0';
                    when ALU_SHL  | ALU_SHR  | ALU_SAR |
                         ALU_SHR1 | ALU_SAR1 | ALU_SHL1 => 
                            OFLAG <= overflow_s;
                            PFLAG <= parityflag_s;
                            SFLAG <= signflag_s;
                            ZFLAG <= zeroflag_s;
                            CFLAG <= alucout_s;                                                         
                                                                                    
                    when ALU_CLC =>
                            CFLAG <= '0';
                    when ALU_CMC =>
                            CFLAG <= not CFLAG;
                    when ALU_STC =>
                            CFLAG <= '1';
                    when ALU_CLD =>
                            DFLAG <= '0';
                    when ALU_STD =>
                            DFLAG <= '1';
                    when ALU_CLI =>
                            IFLAG <= '0';
                    when ALU_STI =>
                            IFLAG <= '1';
                    when ALU_POP =>                     -- Note only POPF executes a WRCC command, thus save for other pops
                            psrreg_s <= "1111" & alu_inbusa(11 downto 0); 
                    when ALU_SAHF =>                    -- Write all AH bits (not compatible!)
                            psrreg_s(7 downto 0) <= alu_inbusa(7 downto 6) & '0' & alu_inbusa(4) & '0' &
                                                    alu_inbusa(2) & '0' & alu_inbusa(0);-- SAHF only writes bits 7,6,4,2,0

                    when ALU_AAS  =>
                            AFLAG <= setaas_s;          -- set or clear CF/AF flag
                            CFLAG <= setaas_s;
                            SFLAG <= '0';                       
                    when ALU_AAA  =>
                            AFLAG <= setaaa_s;          -- set or clear CF/AF flag
                            CFLAG <= setaaa_s;
                    when ALU_DAA  =>
                            AFLAG <= setdaa_s(0);       -- set or clear CF/AF flag
                            CFLAG <= setdaa_s(1);
                            PFLAG <= parityflag_s;
                            SFLAG <= signflag_s; 
                            ZFLAG <= zeroflag_s;

                    when ALU_AAD  =>
                            SFLAG <= alubus_s(7);       --signflag_s; 
                            PFLAG <= parityflag_s;
                            ZFLAG <= zeroflag_s;

                    when ALU_AAM  =>
                            SFLAG <= signflag_s;
                            PFLAG <= parityflag_s;
                            ZFLAG <= not(zflaglow_s);   -- signflag on AL only

                    when ALU_DAS  =>
                            AFLAG <= setdas_s(0);       -- set or clear CF/AF flag
                            CFLAG <= setdas_s(1);
                            PFLAG <= parityflag_s;
                            SFLAG <= signflag_s; 
                            ZFLAG <= zeroflag_s;
                                                        -- Shift Rotate Instructions
                    when ALU_ROL  | ALU_ROR  | ALU_RCL  | ALU_RCR | 
                         ALU_ROL1 | ALU_RCL1 | ALU_ROR1 | ALU_RCR1 =>
                            CFLAG <= alucout_s;
                            OFLAG <= overflow_s; 

                    when ALU_MUL | ALU_MUL2 | ALU_IMUL | ALU_IMUL2 =>  -- Multiply affects CF&OF only
                            CFLAG <= overflow_s;
                            OFLAG <= overflow_s; 

                    when ALU_CLRTIF  =>                 -- Clear TF and IF flag
                            IFLAG <= '0';              
                            TFLAG <= '0'; 

                    when others =>
                            psrreg_s <= psrreg_s;
                end case;
            end if; 
        end if; 
end process;  

ccbus <= psrreg_s;                                      -- Connect to entity

-- Latch Divide by 0 error flag & latched divresult.
-- Requires a MCP from all registers to these endpoint registers!
process (clk, reset)
    begin 
        if reset='1' then
            div_err  <= '0';
            divresult_s <= (others => '0');
        elsif rising_edge(clk) then
            if done_s='1' then                          -- Latched pulse generated by serial divider  
                div_err  <= div_err_s;                  -- Divide Overflow
                -- pragma synthesis_off
                assert div_err_s='0' report "**** Divide Overflow ***" severity note;
                -- pragma synthesis_on

                if wl_s='1' then                        -- Latched version required?
                    divresult_s <= remainder_s & quotient_s; 
                else 
                    divresult_s <= remainder_s & remainder_s(7 downto 0) & quotient_s(7 downto 0);
                end if;
            else
                div_err <= '0';
            end if;
        end if; 
end process;  

end rtl;
