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
-- Version       : 1.0a  02/08/2009   Fixed CALL [REG] Instruction           --
-- Version       : 1.0b  09/07/2014   Fixed dual INTA pulse generation       --
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

USE work.cpu86pack.ALL;
USE work.cpu86instr.ALL;

ENTITY proc IS
   PORT( 
      clk          : IN     std_logic;
      flush_ack    : IN     std_logic;
      instr        : IN     instruction_type;
      inta1        : IN     std_logic;
      irq_req      : IN     std_logic;
      latcho       : IN     std_logic;
      reset        : IN     std_logic;
      rw_ack       : IN     std_logic;
      status       : IN     status_out_type;
      clrop        : OUT    std_logic;
      decode_state : OUT    std_logic;
      flush_coming : OUT    std_logic;
      flush_req    : OUT    std_logic;
      intack       : OUT    std_logic;
      iomem        : OUT    std_logic;
      irq_blocked  : OUT    std_logic;
      opc_req      : OUT    std_logic;
      path         : OUT    path_in_type;
      proc_error   : OUT    std_logic;
      read_req     : OUT    std_logic;
      word         : OUT    std_logic;
      write_req    : OUT    std_logic;
      wrpath       : OUT    write_in_type
   );
END proc ;

architecture rtl of proc is

    type state_type is (
        Sopcode,Sdecode,
        Sreadmem,Swritemem,
        Sexecute,Sflush,Shalt);

   -- Declare current and next state signals
    signal current_state: state_type ;
    signal next_state   : state_type ;
    signal second_pass  : std_logic;        -- if 1 go round the loop again
    signal second_pass_s: std_logic;        -- Comb version

    signal rep_set_s    : std_logic;        -- Start of REP Instruction, check CX when set
    signal rep_clear_s  : std_logic;        -- Signal end of REP Instruction
    signal rep_flag     : std_logic;        -- REPEAT Flag
    signal rep_z_s      : std_logic;        -- Z value of REP instruction
    signal rep_zl_s     : std_logic;        -- Latched Z value of REP

    signal flush_coming_s : std_logic;      -- Signal that a flush is imminent (don't bother filling the queue)
    signal irq_blocked_s: std_logic;        -- Indicate that IRQ will be blocked during the next instruction
                                            -- This is required for pop segment etc instructions.

    signal intack_s     : std_logic;        -- Signal asserted during 8 bits vector read, this occurs during 
                                            -- the second INTA cycle

    signal passcnt_s    : std_logic_vector(7 downto 0); -- Copy of CL register
    signal passcnt      : std_logic_vector(7 downto 0); 

    signal wrpath_s     : write_in_type;    -- combinatorial
    signal wrpathl_s    : write_in_type;    -- Latched version of wrpath_s
    signal path_s       : path_in_type;     -- combinatorial 
    signal proc_error_s : std_logic;        -- Processor decode error
    signal proc_err_s   : std_logic;        -- Processor decode error latch signal
    signal iomem_s      : std_logic;        -- IO/~M cycle

--  alias  ZFLAG        : std_logic is status.flag(6);  -- doesn't work, why not??
    signal flush_req_s  : std_logic;        -- Flush Prefetch queue request
    signal flush_reql_s : std_logic;        -- Latched version of Flush request

begin

   proc_error <= proc_err_s;                -- connect to outside world
   flush_req  <= flush_req_s;   
    
   ----------------------------------------------------------------------------
   clocked : process(clk,reset)
   ----------------------------------------------------------------------------
   begin
      if (reset = '1') then
            current_state <= Sopcode;
            path        <= ((others =>'0'),(others =>'0'),(others =>'0'),(others =>'0'),
                            (others =>'0')); 
            wrpathl_s   <= ('0','0','0','0','0','0','0'); 
            word        <= '0';                                         -- default to 8 bits
            proc_err_s  <= '0';                                         -- Processor decode error
            iomem       <= '0';                                         -- default to memory access 
            second_pass <= '0';                                         -- default 1 pass
            flush_reql_s<= '0';                                         -- flush prefetch queue
            passcnt     <= X"01";                                       -- Copy of CL register used in rot/shft
            rep_flag    <= '0';                                         -- REP instruction running flag
            rep_zl_s    <= '0';                                         -- REP latched z bit
            flush_coming<= '0';                                         -- flush approaching 
            irq_blocked <= '1';                                         -- IRQ blocking for next instruction
            intack      <= '0';                                         -- Second INTA cycle signal

      elsif rising_edge(clk) then
            current_state<= next_state;     
            proc_err_s   <= proc_error_s or proc_err_s;                 -- Latch Processor error, cleared by reset only  
            flush_reql_s <= flush_req_s;                                -- Latch Flush_request signal
                
            if current_state=Sdecode then                               -- Latch write pulse and path settings
                second_pass <= second_pass_s;                           -- latch pass signal 
                word        <= path_s.datareg_input(3);                 -- word <= w bit
                path        <= path_s;
                wrpathl_s   <= wrpath_s;
                passcnt     <= passcnt_s;   
                irq_blocked <=irq_blocked_s;                            -- Signal to block IRQ during next instruction
                intack      <= intack_s;                                -- Second INTA cycle signal
            end if;

            if ((current_state=Sdecode) or (current_state=Sexecute)) then--Latch IOMEM signal
                iomem    <= iomem_s;                                    -- Latch IOM signal
                flush_coming<=flush_coming_s;                           -- flush approaching
            end if;

            if rep_set_s='1' then                                       -- Set/Reset REP flag 
                rep_flag <= '1';
            elsif rep_clear_s='1' then
                rep_flag <= '0';
            end if;

            if rep_set_s='1' then
                rep_zl_s <= rep_z_s;                                    -- Latch Z value of REP instruction
            end if;

      end if;

   end process clocked;

   ----------------------------------------------------------------------------
   nextstate : process (current_state, latcho, rw_ack, flush_ack, instr, status,wrpathl_s, second_pass,irq_req,  
                        passcnt, flush_reql_s, rep_flag, rep_zl_s, inta1)
   ----------------------------------------------------------------------------
   begin
        -- Default Assignment
        opc_req     <= '0';
        read_req    <= '0';
        write_req   <= '0';
                
        wrpath_s    <= ('0','0','0','0','0','0','0');                   -- Default all writes disabled
        wrpath      <= ('0','0','0','0','0','0','0');                   -- Combinatorial
        path_s      <= ((others =>'0'),(others =>'0'),(others =>'0'),(others =>'0'),
                       (others =>'0'));                      
        proc_error_s<= '0';
        iomem_s     <= '0';                                             -- IO/~M default to memory access
        flush_req_s <= '0';                                             -- Flush Prefetch queue request
        passcnt_s   <= X"01";                                           -- init to 1 
        rep_set_s   <= '0';                                             -- default no repeat
        rep_clear_s <= '0';                                             -- default no clear
        rep_z_s     <= '0';                                             -- REP instruction Z bit
        flush_coming_s<='0';                                            -- don't fill the instruction queue
        irq_blocked_s<='0';                                             -- default, no block IRQ 
        clrop       <= '0';                                             -- Clear Segment override flag 
        second_pass_s<='0';                                             -- HT0912, 
        intack_s    <= '0';                                             -- Signal asserted during INT second INTA cycle
        decode_state<= '0';                                             -- Decode stage for signal spy only

      case current_state is
          
        ----------------------------------------------------------------------------
        -- Get Opcode from BIU
        ----------------------------------------------------------------------------
        when Sopcode =>   

            second_pass_s<='0';
            opc_req <= '1'; 

            if (latcho = '0')   then 
                next_state <= Sopcode;                  -- Wait
            else
                next_state <= Sdecode;                  -- Decode instruction               
            end if;

        ----------------------------------------------------------------------------
        -- Opcode received, decode instruction
        -- Set Path (next state)
        -- Set wrpath_s, lacthed as this stage, enabled only at Sexecute
        ----------------------------------------------------------------------------
        when Sdecode =>    
                    
             if second_pass='1' then
                wrpath <= wrpathl_s;                                    -- Assert write strobe(s) during first & second pass                                                        
             else 
                decode_state <= '1';                                    -- Asserted during first decode stage
             end if;

             case instr.ireg is

                ---------------------------------------------------------------------------------
                -- IN Port Instruction           0xE4..E5, 0xEC..ED
                -- Use fake xmod and rm setting for fixed port number
                ---------------------------------------------------------------------------------
                when INFIXED0 | INFIXED1 | INDX0 | INDX1 =>
                    second_pass_s <= '0';
                    iomem_s       <= '1';                               -- Select IO cycle

                    path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & "000";    -- dimux & w & seldreg  AX/AL=000
                
                    if instr.ireg(3)='0' then                           -- 0=Fixed, 1=DX
                        path_s.ea_output    <= PORT_00_EA & DONTCARE(2 downto 0);-- dispmux & eamux(4) & segop  11=00:EA
                    else                                                -- 1=DX
                        path_s.ea_output    <= PORT_00_DX & DONTCARE(2 downto 0);-- dispmux & eamux(4) & segop  10=00:DX
                    end if;

                    wrpath_s.wrd        <= '1';                         -- Write to Data Register
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register                 
                    
                    next_state  <= Sreadmem;                            -- start read cycle     

                ---------------------------------------------------------------------------------
                -- XLAT Instruction          
                -- AL<= SEG:[BX+AL]
                ---------------------------------------------------------------------------------
                when XLAT =>
                    second_pass_s <= '0';

                    path_s.datareg_input<= MDBUS_IN & '0' & REG_AX(2 downto 0); -- dimux & w & seldreg  AX/AL=000
                
                    path_s.ea_output<= "0001111011";                    -- EA=BX+AL, dispmux(2) & eamux(4) & [flag]&segop(2)

                    wrpath_s.wrd    <= '1';                             -- Write to Data Register
                    wrpath_s.wrip   <= '1';                             -- Update IP+nbreq register                 
                    
                    next_state      <= Sreadmem;                        -- start read cycle     

                ---------------------------------------------------------------------------------
                -- OUT Port Instruction          0xE6..E7, 0xEE..EF
                -- Use fake xmod and rm setting for fixed port number
                ---------------------------------------------------------------------------------
                when OUTFIXED0 | OUTFIXED1 | OUTDX0 | OUTDX1 =>
                    second_pass_s <= '0';
                    iomem_s       <= '1';                               -- Select IO cycle
                    
                    path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  Only need to set W

                    path_s.alu_operation<= "0000" & DONTCARE(3 downto 0) & ALU_PASSA;  -- selalua & selalub & aluopr  selalua=AX/AL
                    path_s.dbus_output  <= ALUBUS_OUT;                  --{eabus(0)&} domux setting  
                    
                    if instr.ireg(3)='0' then                           -- 0=Fixed, 1=DX
                        path_s.ea_output    <= PORT_00_EA & DONTCARE(2 downto 0);-- dispmux & eamux(4) & segop  11=00:EA
                    else                                                -- 1=DX
                        path_s.ea_output    <= PORT_00_DX & DONTCARE(2 downto 0);-- dispmux & eamux(4) & segop  10=00:DX
                    end if;

                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register                 
                    
                    next_state  <= Swritemem;                           -- start write cycle        

                ---------------------------------------------------------------------------------
                -- Increment/Decrement Register, word only!
                ---------------------------------------------------------------------------------
                when INCREG0 |INCREG1 |INCREG2 |INCREG3 | INCREG4 |INCREG5 |INCREG6 |INCREG7 |
                     DECREG0 |DECREG1 |DECREG2 |DECREG3 | DECREG4 |DECREG5 |DECREG6 |DECREG7 => 
                    second_pass_s <= '0';

                    path_s.datareg_input<= ALUBUS_IN & '1' & instr.reg; -- dimux & w & seldreg
                        
                    -- instr.ireg(5..3) contains the required operation,  ALU_INBUSB=X"0001"
                    -- Note ALU_INC is generic for INC/DEC
                    path_s.alu_operation<= '0'&instr.reg & REG_CONST1 & ALU_INC(6 downto 3)&instr.ireg(5 downto 3); -- selalua & selalub & aluopr

                    path_s.ea_output    <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP

                    wrpath_s.wrd        <= '1';                         -- Update register 
                    wrpath_s.wrcc       <= '1';                         -- Update Flag register
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register
                    
                    next_state  <= Sexecute;

                -----------------------------------------------------------------------------
                -- Shift/Rotate Instructions   
                -- Operation define in MODRM REG bits
                -- Use MODRM reg bits   
                -- bit 0=b/w, bit1=0 then count=1 else count=cl
                -- if cl=00 then don't write to CC register
                -----------------------------------------------------------------------------
                when SHFTROT0 | SHFTROT1 | SHFTROT2 | SHFTROT3 =>   
                    
                    if instr.reg="110" then                             -- Not supported/defined
                        proc_error_s<='1';                              -- Assert Bus Error Signal
                        -- pragma synthesis_off
                        assert not (now > 0 ns) report "**** Illegal SHIFT/ROTATE instruction (proc)  ***" severity warning;
                        -- pragma synthesis_on
                    end if;

                    if instr.xmod="11" then                             -- Immediate to Register  r/m=reg field
                        
                        path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm; -- dimux & w & seldreg Note RM=Destination!!

                        path_s.ea_output    <= NB_CS_IP;                -- IPREG+NB ADDR=CS:IP
                        
                        if (second_pass='0') then                       -- first pass, load reg into alureg
                            
                            if (instr.ireg(1)='1' and status.cl=X"00") then
                                second_pass_s <= '0';                   -- No second pass if cl=0
                                wrpath_s.wrip <= '1';                   -- Update IP+nbreq register 
                                next_state    <= Sexecute;              -- terminate    
                            else
                                second_pass_s <= '1';                   -- need another pass
                                next_state    <= Sdecode;               -- round the loop again
                            end if;

                            -- Load instr.rm register into ALUREG                       
                            path_s.alu_operation<= DONTCARE(3 downto 0) & '0'&instr.rm & ALU_REGL; -- selalua(4) & selalub(4) & aluopr(7)
                            wrpath_s.wralu      <= '1'; 
                                
                            if (instr.ireg(1)='1') then                             
                                passcnt_s   <= status.cl;               -- Load CL loop counter
                            end if;                                     -- else passcnt_s=1;
                                
                        
                        else                                            -- second pass, terminate or go around the loop again
                            
                            -- selalua & selalu are dontcare, instruction is V+001+instr.reg    
                            -- ALU_ROL(6 downto 4) is generic for all shift/rotate 
                            -- Instruction=Constant & V_Bit & modrm.reg(5 downto 3)                 
                            path_s.alu_operation<= DONTCARE(3 downto 0) & '0'&instr.rm & ALU_ROL(6 downto 4)& instr.ireg(1) & instr.reg; -- selalua(4) & selalub(4) & aluopr(7)

                            if (passcnt=X"00") then                   -- Check if end of shift/rotate
                                second_pass_s   <= '0';                 -- clear
                                wrpath_s.wrcc   <= '1';                 -- Update Status Register after last shift/rot  
                                wrpath_s.wrd    <= '1';                 -- Write shift/rotate results to Data Register
                                wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register 
                                next_state      <= Sexecute;            -- terminate                    
                            else
                                second_pass_s   <= '1';                 -- need another pass
                                wrpath_s.wralu  <= '1';
                                wrpath_s.wrcc   <= '1';
                                passcnt_s       <= passcnt - '1';
                                next_state      <= Sdecode;             -- round the loop again                             
                            end if; 
                                                           
                        end if; 

                    else                                                -- Destination and source is memory, use ALUREG 
                        
                        path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & DONTCARE(2 downto 0); --  ver 0.69, path& w! seldreg=don'tcare                                                            
                        
                        path_s.dbus_output  <= ALUBUS_OUT;              -- {eabus(0)&} domux setting    
                        path_s.ea_output    <= NB_DS_EA;                -- dispmux & eamux & segop  

                        if (second_pass='0') then                       -- first pass, load memory operand into alureg
                            
                            if (instr.ireg(1)='1' and status.cl=X"00") then
                                second_pass_s <= '0';                   -- No second pass if cl=0
                                wrpath_s.wrip <= '1';                   -- Update IP+nbreq register 
                                next_state    <= Sexecute;              -- terminate    
                            else
                                second_pass_s <= '1';                   -- need another pass
                                next_state    <= Sreadmem;              -- start read cycle
                            end if;
                                                        
                            -- Load memory into ALUREG                          
                            path_s.alu_operation<= DONTCARE(3 downto 0) & REG_MDBUS &  ALU_REGL; -- selalua(4) & selalub(4) & aluopr(7)                            
                            wrpath_s.wralu  <= '1';                     -- ver 0.69,  write MDBUS to ALUREG
    
                            if (instr.ireg(1)='1') then                             
                                passcnt_s   <= status.cl;               -- Load CL loop counter
                            end if;                                     -- else passcnt_s=1;

                        else                                            -- second pass, MDBUS contains memory byte
                            
                            -- selalua & selalu are dontcare
                            -- ALU_ROL(6 downto 4) is generic for all shift/rotate                                                                      
                            path_s.alu_operation<= DONTCARE(3 downto 0) & '0'&instr.rm & ALU_ROL(6 downto 4)& instr.ireg(1) & instr.reg; -- selalua(4) & selalub(4) & aluopr(7)

                            wrpath_s.wrcc   <= '1';                     -- Update Status Register after each shift/rot
                                                     
                            --if (passcnt=X"01") then                 -- Check if end of shift/rotate
                            if (passcnt=X"00") then                   -- ver 0.69, Check if end of shift/rotate
                                second_pass_s <= '0';                   -- clear    
                                wrpath_s.wrip <= '1';                   -- Update IP+nbreq register 
                                next_state <= Swritemem;                -- write result to memory & terminate                   
                            else
                                passcnt_s <= passcnt - '1';
                                second_pass_s <= '1';   
                                wrpath_s.wralu<= '1';                   -- Update ALUREG                    
                                next_state <= Sdecode;                  -- round the loop again                             
                            end if; 
                                                           
                        end if; 

                    end if;

                ---------------------------------------------------------------------------------
                -- Immediate to Register
                ---------------------------------------------------------------------------------
                when MOVI2R0 | MOVI2R1 |MOVI2R2 |MOVI2R3 |MOVI2R4 | MOVI2R5 | MOVI2R6 | MOVI2R7 | 
                     MOVI2R8 | MOVI2R9 |MOVI2R10|MOVI2R11|MOVI2R12| MOVI2R13| MOVI2R14| MOVI2R15  =>

                    second_pass_s <= '0';                    
                    path_s.datareg_input<= DATAIN_IN & instr.ireg(3) & instr.reg; -- dimux & w & seldreg
                    path_s.ea_output    <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP

                    wrpath_s.wrd        <= '1';                         -- Write to Data Register
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register
                    
                    next_state  <= Sexecute;

                ---------------------------------------------------------------------------------
                -- Immediate to Register/Memory      0xC6, 0xC7
                -- Data is routed from drmux->dibus->dbusdp_out
                ---------------------------------------------------------------------------------
                when MOVI2RM0 | MOVI2RM1  =>

                    second_pass_s <= '0';
                    path_s.datareg_input<= DATAIN_IN & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg (only dimux, the rest is don't care)    
                                                                        -- change to instr.ireg(0) & instr.reg ???                  
                    path_s.dbus_output  <= DIBUS_OUT;                   --{eabus(0)&} domux setting                     
                    path_s.ea_output    <= NB_DS_EA;                    -- dispmux & eamux & segop  (unless Segment OP flag is set)
                    
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register
                    
                    next_state  <= Swritemem;                           -- start write cycle        

                ---------------------------------------------------------------------------------
                -- Memory to Accu and Accu to Memory AL, AX, not AH!             0xA0..0xA3
                -- Use fake xmod and rm setting
                -- Use instruction but (4..3)=000 as register selector
                ---------------------------------------------------------------------------------
                when MOVM2A0 | MOVM2A1 | MOVA2M0 | MOVA2M1  =>

                    second_pass_s <= '0';
                    path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & instr.reg;    -- dimux & w & seldreg  (don't care for write cycle)
                    
                    path_s.alu_operation<= '0'&instr.reg & DONTCARE(3 downto 0) & ALU_PASSA;  -- selalua & selalub & aluopr  (don't care for read cycle)
                    path_s.dbus_output  <= ALUBUS_OUT;                  --{eabus(0)&} domux setting  (don't care for read cycle)
                    
                    path_s.ea_output    <= NB_DS_EA;                    -- dispmux & eamux & segop  (unless Segment OP flag is set)

                    if instr.ireg(1)='0' then                           -- 0= memory to Accu, Read Cycle                        
                        wrpath_s.wrd        <= '1';                     -- Write Memory to Data Register
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                    
                        next_state  <= Sreadmem;                        -- start read cycle     
                    else                                                -- 1=Accu to Memory, Write cycle
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                    
                        next_state  <= Swritemem;                       -- start write cycle        
                    end if;

                ---------------------------------------------------------------------------------
                -- Move Register/Memory to/from Register   0x88..0x8B   
                ---------------------------------------------------------------------------------
                when MOVRM2R0 | MOVRM2R1 | MOVRM2R2 | MOVRM2R3 =>

                    second_pass_s <= '0';
                    if instr.xmod="11" then                             -- Register to Register  rm=reg field
                        if instr.ireg(1)='0' then                       -- Check 'd' bit, 0-> SRC=Reg, DEST=rm
                            path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm;    -- dimux & w & seldreg
                            path_s.alu_operation<= '0'&instr.reg & DONTCARE(3 downto 0) & ALU_PASSA;  -- selalua & selalub & aluopr                          
                        else                                            -- 'd'=1 SRC=rm, DEST=Reg 
                            path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.reg;   -- dimux & w & seldreg
                            path_s.alu_operation<= '0'&instr.rm & DONTCARE(3 downto 0) & ALU_PASSA;  -- selalua & selalub & aluopr
                        end if;
                        path_s.ea_output    <= NB_CS_IP;                -- IPREG+NB ADDR=CS:IP
                                                                                            
                        wrpath_s.wrd        <= '1';                     -- Write Data Register to Data Register
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                    
                        next_state <= Sexecute;

                    else                                                -- Source is memory
                        if instr.ireg(1)='0' then                       -- Check 'd' bit, 0-> SRC=Reg, DEST=rm, Write Cycle
                            path_s.alu_operation<= '0'&instr.reg & DONTCARE(3 downto 0) & ALU_PASSA;  -- selalua & selalub & aluopr
                            path_s.dbus_output  <= ALUBUS_OUT;          --{eabus(0)&} domux setting 
                            path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg 
                                                                                                                -- (only need w, the reset don't care)
                            path_s.ea_output    <= NB_DS_EA;            -- dispmux & eamux & segop  (unless Segment OP flag is set)

                            wrpath_s.wrip       <= '1';                 -- Update IP+nbreq register
                    
                            next_state  <= Swritemem;                   -- start write cycle            
                                                    
                        else                                            -- 'd'=1 SRC=rm, DEST=Reg, Read Cycle 
                            path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & instr.reg;    -- dimux & w & seldreg
                            path_s.alu_operation<= '0'&instr.rm & DONTCARE(3 downto 0) & ALU_PASSA;  -- selalua & selalub & aluopr

                            path_s.ea_output    <= NB_DS_EA;            -- dispmux & eamux & segop  (unless Segment OP flag is set)

                            wrpath_s.wrd        <= '1';                 -- Write Memory to Data Register
                            wrpath_s.wrip       <= '1';                 -- Update IP+nbreq register
                    
                            next_state  <= Sreadmem;                    -- start read cycle             
                        end if;                     


                    end if;
                   
                ---------------------------------------------------------------------------------
                -- Move Segment register to data register or memory 
                ---------------------------------------------------------------------------------
                when MOVS2RM => 
                                                                    
                    second_pass_s <= '0';
                    if instr.xmod="11" then                             -- Segment Register to Data Register , rm=reg field

                        path_s.datareg_input<= '1'& instr.reg(1 downto 0) & '1' & instr.rm;     -- dimux & w & seldreg                          
                        path_s.ea_output    <= NB_CS_IP;                -- IPREG+NB ADDR=CS:IP

                        wrpath_s.wrd        <= '1';                     -- Write Seg to Data Register
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                    
                        next_state <= Sexecute;
                    else                                                -- Segment Register to memory indexed by rm
                        
                        path_s.datareg_input<= '1'& instr.reg(1 downto 0) & '1' & DONTCARE(2 downto 0);     -- dimux only -- [dimux(3) & w & seldreg(3)]
                        path_s.dbus_output  <= DIBUS_OUT;               --(Odd/Even) domux setting
                        path_s.ea_output    <= NB_DS_EA;                -- dispmux & eamux & segop  (unless Segment OP flag is set)

                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                    
                        next_state  <= Swritemem;                       -- start write cycle                          
                    end if; 

                ---------------------------------------------------------------------------------
                -- Register or Memory to Segment Register
                -- In case of memory, stalls until operand is read from memory
                ---------------------------------------------------------------------------------
                when MOVRM2S => 

                    irq_blocked_s <= '1';                               -- Block IRQ if asserted during next instr.

                    second_pass_s <= '0';
                    if instr.reg(1 downto 0)="01" then
                        proc_error_s<='1';                              -- if segment register = CS report error
                        -- pragma synthesis_off
                        report "MOVRM2S : MOV CS,REG/Memory not valid" severity warning;
                        -- pragma synthesis_on
                    end if;

                    path_s.datareg_input<= DONTCARE(2 downto 0)& '1' & DONTCARE(2 downto 0);  -- dimux & w=1 & seldreg  
                                        
                    if instr.xmod="11" then                             -- Register to Segment Register , rm=reg field

                        path_s.alu_operation<= '0'&instr.rm & DONTCARE(3 downto 0) & ALU_PASSA; --selalua & selalub & aluopr
                        path_s.segreg_input <= SALUBUS_IN & instr.reg(1 downto 0); -- simux & selsreg
                    
                        path_s.ea_output    <= NB_CS_IP;                -- IPREG+NB ADDR=CS:IP                      

                        wrpath_s.wrs        <= '1';                     -- Write Data Register to Segment Register
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                    
                        next_state <= Sexecute;

                    else                                                -- Memory to Segment Register

                        path_s.segreg_input <= SMDBUS_IN & instr.reg(1 downto 0); -- simux & selsreg

                        path_s.ea_output    <= NB_DS_EA;                -- dispmux & eamux & segop  (unless Segment OP flag is set)

                        wrpath_s.wrs        <= '1';                     -- Write Memory to Segment Register
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                    
                        next_state  <= Sreadmem;                        -- start read cycle                       
                    end if; 

                ---------------------------------------------------------------------------------
                -- Load Effective Address in Data Register
                -- mod=11 result in proc_error
                ---------------------------------------------------------------------------------
                when LEA =>
                    second_pass_s <= '0';

                    if instr.xmod="11" then                             -- Register to Register  rm=reg field
                        proc_error_s<='1';                              -- Assert Bus Error Signal
                        -- pragma synthesis_off
                        assert not (now > 0 ns) report "**** Illegal LEA operand (mod=11) (proc)  ***" severity warning;
                        -- pragma synthesis_on
                    end if;                                             -- Transfer Effective addresss (EABUS) to data register
                    
                    path_s.datareg_input<= EABUS_IN & '1' & instr.reg;  -- dimux & w & seldreg                      
                    path_s.ea_output    <= NB_DS_EA;                    -- dispmux & eamux & segop  

                    wrpath_s.wrd        <= '1';                         -- Write EABUS to Data Register
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register                 
                    
                    next_state  <= Sexecute;        

                    ---------------------------------------------------------------------------------
                    -- Load Effective Address in ES/DS:DEST_REGISTER
                    -- mod=11 result in proc_error
                    -- TEMP <=  readmem(ea) ; PASS1   (required for cases like LES SI,[SI] )
                    -- REG  <=  TEMP        ; PASS2
                    -- ES/DS<=  readmem(ea+2)
                    ---------------------------------------------------------------------------------
                    when LES | LDS =>
    
                        if instr.xmod="11" then                             -- Register to Register  rm=reg field
                            proc_error_s<='1';                              -- Assert Bus Error Signal
                            -- pragma synthesis_off
                            assert not (now > 0 ns) report "**** Illegal LES/LDS operand (mod=11) (proc)  ***" severity warning;
                            -- pragma synthesis_on
                        end if;                                             
        
                        path_s.alu_operation<= DONTCARE(3 downto 0) & REG_MDBUS & ALU_TEMP;-- selalua(4) & selalub(4) & aluopr                        
    
                        if (second_pass='0') then                           -- first pass reg<=mem(ea)
                            second_pass_s <= '1';                           -- need another pass
                            
                            path_s.datareg_input<= MDBUS_IN & '1' & instr.reg;-- dimux & w & seldreg
    
                            path_s.ea_output<="0000001001";                 -- dispmux(3) & eamux(4)=EA & dis_opflag & segop[1:0]
                            wrpath_s.wrtemp  <= '1'; -- Write reg value to alu_temp first                
                            next_state  <= Sreadmem;                        -- start read to read temp<=EA  
                        else
                            second_pass_s <= '0';                           -- clear
                        
                            path_s.datareg_input<= ALUBUS_IN & '1' & instr.reg;-- dimux & w & seldreg
                            path_s.ea_output<="0000011001";                 -- dispmux(3) & eamux(4)=EA+2 & dis_opflag & segop[1:0]
                                                                            -- Second Pass ES/DS<=mem(ea+2)
                            if instr.ireg(0)='0' then                       -- C4=LES
                                path_s.segreg_input <= SMDBUS_IN & ES_IN(1 downto 0); -- simux & selsreg=ES
                            else                                            -- C5=LDS
                                path_s.segreg_input <= SMDBUS_IN & DS_IN(1 downto 0); -- simux & selsreg=DS
                            end if;
                            wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                            wrpath_s.wrd  <= '1';                           -- Update Reg<=temp
                            wrpath_s.wrs  <= '1';                           -- Update ES/DS Register                                                
                            next_state  <= Sreadmem;
                        end if;             

                ---------------------------------------------------------------------------------
                -- Convert AL to AX, AX -> DX:AX
                -- Flags are not affected
                ---------------------------------------------------------------------------------
                when CBW | CWD =>
                    second_pass_s <= '0';

                    -- Note ALU_SEXT(6 downto 4) is generic for CBW and CWD
                    path_s.alu_operation<= REG_AX & DONTCARE(3 downto 0) & ALU_SEXT(6 downto 4) & instr.ireg(3 downto 0) ;-- selalua & selalub & aluopr

                    if (instr.ireg(0)='0') then                         -- if 0 then CBW else CWD
                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_AX(2 downto 0);-- dimux & w & seldreg  Note RM=Destination!!
                    else
                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_DX(2 downto 0);-- dimux & w & seldreg  Note RM=Destination!!
                    end if;

                    path_s.ea_output    <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP
                                                                                        
                    wrpath_s.wrd        <= '1';                         -- Write Data Register to Data Register
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register

                    next_state <= Sexecute;
                
                ---------------------------------------------------------------------------------
                -- Convert AL 
                -- Use bit 4 of instruction to drive W bit
                ---------------------------------------------------------------------------------
                when AAS | DAS | AAA | DAA | AAM | AAD =>
                    
                    passcnt_s <= passcnt - '1';

                    path_s.ea_output <= NB_CS_IP;                       -- IPREG+NB ADDR=CS:IP
                    path_s.datareg_input<= ALUBUS_IN & instr.ireg(4) & REG_AX(2 downto 0);-- dimux & w & seldreg    Note RM=Destination!!
                    path_s.alu_operation<= REG_AX & DONTCARE(3 downto 0) & ALU_DAA(6 downto 4)&instr.ireg(0)&instr.ireg(5 downto 3);-- selalua & selalub & aluopr

                    if (second_pass='0') then                           -- first pass
                                               
                        if (instr.ireg=AAM) then                        -- AAM instruction only
                            second_pass_s   <= '1';                     -- need another pass
                            wrpath_s.wralu  <= '1';                     -- Write Data to ALUREG, only used for AAM (uses divider)
                            passcnt_s       <= "000"&DIV_MCD_C;           -- Serial delay
                            next_state      <= Sdecode;                 -- round the loop again
                        else                    
                            second_pass_s   <= '0';                      
                            wrpath_s.wrcc   <= '1';                     -- Update Status Register                                                                       
                            wrpath_s.wrd    <= '1';                     -- Write Data Register to Data Register                        
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register 
                            next_state      <= Sexecute;                -- terminate    
                        end if;
                    
                    else
                        second_pass_s       <= '1';
                        if (passcnt=X"00") then                         -- Divider Done?
                            second_pass_s   <= '0';                      
                            wrpath_s.wrcc   <= '1';                     -- Update Status Register                                                                       
                            wrpath_s.wrd    <= '1';                     -- Write Data Register to Data Register                                                 
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register 
                            next_state      <= Sexecute;                -- terminate    
                        else
                            next_state      <= Sdecode;                 -- Version 0.78                        
                        end if;
                    end if;


                ---------------------------------------------------------------------------------
                -- Segment Override Prefix  
                ---------------------------------------------------------------------------------
                when SEGOPES | SEGOPCS | SEGOPSS | SEGOPDS => 

                    irq_blocked_s <= '1';                               -- Block IRQ if asserted during next instr.
                    second_pass_s <= '0';
                    path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg 
                                                                                               
                    path_s.ea_output    <= "000"&DONTCARE(3 downto 0) & '0' & instr.ireg(4 downto 3);  -- dispmux & eamux(4) & [flag]&segop[1:0] 
                                                                                            
                    wrpath_s.wrop       <= '1';                         -- Write to Override Prefix Register
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register
                    
                    next_state  <= Sexecute;
            
                ---------------------------------------------------------------------------------
                -- Halt Instruction, wait for NMI, INTR, Reset  
                ---------------------------------------------------------------------------------
                when HLT => 

                    second_pass_s   <= '0';
                    path_s.ea_output<= NB_CS_IP;                     
                    wrpath_s.wrip   <= '1';                             -- Update IP+nbreq register                     
                    next_state      <= Sexecute;
                                                                                               
                ---------------------------------------------------------------------------------
                -- ADD/ADC/SUB/SBB/CMP/AND/OR/XOR Register/Memory <- Register/Memory
                -- TEST same as AND without returning any result (wrpath_s.wrd is not asserted) 
                ---------------------------------------------------------------------------------
                when ADDRM2R0 |  ADDRM2R1 | ADDRM2R2 |  ADDRM2R3 | ADCRM2R0 |  ADCRM2R1 | ADCRM2R2 |  ADCRM2R3 |    
                     SUBRM2R0 |  SUBRM2R1 | SUBRM2R2 |  SUBRM2R3 | SBBRM2R0 |  SBBRM2R1 | SBBRM2R2 |  SBBRM2R3 |    
                     CMPRM2R0 |  CMPRM2R1 | CMPRM2R2 |  CMPRM2R3 | ANDRM2R0 |  ANDRM2R1 | ANDRM2R2 |  ANDRM2R3 |    
                     ORRM2R0  |  ORRM2R1  | ORRM2R2  |  ORRM2R3  | XORRM2R0 |  XORRM2R1 | XORRM2R2 |  XORRM2R3 |
                     TESTRMR0 |  TESTRMR1  =>   

                    if instr.xmod="11" then                             -- Register to Register  rm=reg field
                        second_pass_s <= '0';

                        if (instr.ireg(1)='1') then                     -- Check 'd' bit, if 1 dest=reg else r/m
                            path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.reg; -- dimux & w & seldreg    Note REG=Destination!
                            -- Note aluopr = bit 5 to 3 of opcode
                            -- Note ALU_ADD(6 downto 4) is generic for all sub types
                            -- Note the selalua and selalub values are important for the SUB and CMP instructions!  
                            -- It would have been nice if the position was fixed in the opcode!                     
                            path_s.alu_operation<= '0'&instr.reg & '0'&instr.rm & ALU_ADD(6 downto 4)&instr.ireg(7)&instr.ireg(5 downto 3);-- selalua & selalub & aluopr
                        else
                            path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm; -- dimux & w & seldreg Note RM=Destination!
                            path_s.alu_operation<= '0'&instr.rm & '0'&instr.reg & ALU_ADD(6 downto 4)&instr.ireg(7)&instr.ireg(5 downto 3);-- selalua & selalub & aluopr
                        end if;

                        path_s.ea_output    <= NB_CS_IP;                -- IPREG+NB ADDR=CS:IP
                        
                        if ((instr.ireg(5 downto 3)/="111") and (instr.ireg(7)='0')) then       -- Check if not CMP or TEST Instruction
                            wrpath_s.wrd    <= '1';                     -- Write Data Register to Data Register
                        end if; 
                        wrpath_s.wrcc       <= '1';                     -- Update Status Register                                                                   
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                        
                        next_state <= Sexecute;

                    else                                                -- Source/dest is memory       
                        if instr.ireg(1)='0' then                       -- Check 'd' bit ->0  SRC=Reg, DEST=rm, Read & Write Cycle  (mem<- mem,  reg, AND) 
                            
                            path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg (only w)
                                                                        
                            path_s.alu_operation<= REG_MDBUS & '0'&instr.reg & ALU_ADD(6 downto 4)&instr.ireg(7)&instr.ireg(5 downto 3);    -- selalua & selalub & aluopr   Path for ALU
                                
                            path_s.dbus_output  <= ALUBUS_OUT;          --{eabus(0)&} domux setting 
                            path_s.ea_output    <= NB_DS_EA;            -- dispmux & eamux & segop  (unless Segment OP flag is set)

                            if (second_pass='0') then                   -- first pass read operand
                                second_pass_s <= '1';                   -- need another pass
                                next_state  <= Sreadmem;                -- start read cycle 
                            else
                                second_pass_s <= '0';                   -- clear                                
                                wrpath_s.wrcc <= '1';                   -- Update Status Register
                                wrpath_s.wrip <= '1';                   -- Update IP+nbreq register 

                                if ((instr.ireg(5 downto 3)/="111") and (instr.ireg(7)='0')) then-- Check if not CMP or TEST Instruction
                                    next_state <= Swritemem;            -- start write cycle
                                else
                                    next_state <= Sexecute;
                                end if;
                            end if;             
                                                    
                        else                                            -- 'd'=1  SRC=rm, DEST=Reg, Read Cycle  (reg<- reg, mem, AND)
                            second_pass_s <= '0';
                            -- Select Data for result path
                            path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.reg;       -- dimux & w & seldreg
                            -- Select Path for ALU                          
                            path_s.alu_operation<= '0'&instr.reg & REG_MDBUS & ALU_ADD(6 downto 4)&instr.ireg(7)&instr.ireg(5 downto 3);-- selalua & selalub & aluopr
                
                            path_s.ea_output    <= NB_DS_EA;            -- dispmux & eamux & segop  (unless Segment OP flag is set)

                            if ((instr.ireg(5 downto 3)/="111") and (instr.ireg(7)='0')) then-- Check if not CMP or TEST Instruction
                                wrpath_s.wrd    <= '1';                 -- Write Data Register to Data Register
                            end if; 
                            wrpath_s.wrcc       <= '1';                 -- Update Status Register                           
                            wrpath_s.wrip       <= '1';                 -- Update IP+nbreq register
                    
                            next_state  <= Sreadmem;                    -- start read cycle             
                        end if;                                                                     

                    end if;


                ---------------------------------------------------------------------------------
                -- OPCODE 80,81,82,83, ADD/ADC/SUB/SBB/CMP/AND/OR/XOR Immediate to Reg/Mem  
                -- ALU operation is defined in reg field (3 bits) and not in bit 5-3 of opcode
                -- Data is routed from drmux->dibus->dbusdp_out
                -- If instr(1)=1 then signextend the data byte (SW=11)
                ---------------------------------------------------------------------------------
                when O80I2RM | O81I2RM | O83I2RM  =>

                    if instr.xmod="11" then                             -- Immediate to Register  r/m=reg field
                        second_pass_s <= '0';
                        
                        path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm;    -- dimux & w & seldreg  Note RM=Destination!!
                        
                        -- instr.reg contains the required operation  (Reg AND Constant)
                        -- If s-bit=0 then 000+REG else 110+REG, s-bit is bit 1 of instr.reg
                        path_s.alu_operation<= '0'&instr.rm & REG_DATAIN &instr.ireg(1)&instr.ireg(1)&"00"&instr.reg; -- selalua & selalub & aluopr
                        path_s.ea_output    <= NB_CS_IP;                -- IPREG+NB ADDR=CS:IP
                        
                        if (instr.reg/="111") then                      -- Check if not CMP Instruction
                            wrpath_s.wrd    <= '1';                     -- Write Data Register to Data Register
                        end if; 
                        wrpath_s.wrcc       <= '1';                     -- Update Status Register                                                               
                        wrpath_s.wrip       <= '1';                     -- Update IP+nbreq register
                        
                        next_state <= Sexecute;

                    else                                                -- Destination and source is memory (no wrpath_s.wrd)
                                                                        -- This is nearly the same as AND with d=0, see above
                        -- only need W bit
                        path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg (only dimux, the rest is don't care) 
                        -- Memory AND Constant, need to read memory first
                        path_s.alu_operation<= REG_MDBUS & REG_DATAIN&instr.ireg(1)&instr.ireg(1)&"00"&instr.reg; -- selalua & selalub & aluopr
                                                                                    
                        path_s.dbus_output  <= ALUBUS_OUT;              --{eabus(0)&} domux setting 
                        path_s.ea_output    <= NB_DS_EA;                -- dispmux & eamux & segop  (unless Segment OP flag is set)

                        if (second_pass='0') then                       -- first pass read operand
                            second_pass_s <= '1';                       -- need another pass
                            next_state  <= Sreadmem;                    -- start read cycle 
                        else
                            second_pass_s <= '0';                       -- clear                                
                            wrpath_s.wrip <= '1';                       -- Update IP+nbreq register 
                            wrpath_s.wrcc <= '1';                       -- Update Status Register 
                            if (instr.reg/="111") then                  -- Check if not CMP Instruction
                                next_state <= Swritemem;                -- start write cycle
                            else
                                next_state <= Sexecute;                 -- CMP, do not write results
                            end if;                            
                        end if;             

                    end if;

                -----------------------------------------------------------------------------
                -- NOT/TEST F6/F7 Shared Instructions 
                -- TEST regfield=000  
                -- NOT  regfield=010
                -- NEG  regfield=011    
                -- MUL  regfield=100
                -- IMUL regfield=101
                -- DIV  regfield=110
                -- IDIV regfield=111
                -- ALU operation is defined in bits 5-3 of modrm.reg
                -- Same sequence as OPC80..83 instruction?
                -- Note for NOT instruction DATAIN must be zero!!
                -----------------------------------------------------------------------------
                when F6INSTR | F7INSTR  =>
                    
                   --   case instr.reg(2 downto 0) is   
                    case instr.reg is   
                                                
                        when "000"  =>                                  -- TEST instruction, Combine with NEG/NOT Instruction ?????????????
                            if instr.xmod="11" then                     -- Immediate to Register  r/m=reg field
                                second_pass_s <= '0';
                                
                                path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm;    -- dimux & w & seldreg  
                                -- instr.reg contains the required operation  
                                -- Note ALU_TEST2 is generic for all sub types
                                path_s.alu_operation<= '0'&instr.rm & REG_DATAIN & ALU_TEST2(6 downto 3)&instr.reg; -- selalua & selalub & aluopr

                                path_s.ea_output    <= NB_CS_IP;        -- IPREG+NB ADDR=CS:IP
                                
                                wrpath_s.wrcc       <= '1';             -- Update Status Register                                                               
                                wrpath_s.wrip       <= '1';             -- Update IP+nbreq register
                                
                                next_state <= Sexecute;

                            else                                        -- Destination and source is memory (no wrpath_s.wrd)
                                                                        -- This is nearly the same as AND with d=0, see above
                                -- only need W bit
                                path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg (only dimux, the rest is don't care) 
                                -- Memory AND Constant, need to read memory first
                                path_s.alu_operation<= REG_MDBUS & REG_DATAIN & ALU_TEST2(6 downto 3)&instr.reg; -- selalua & selalub & aluopr
                                                                                            
                                path_s.dbus_output  <= ALUBUS_OUT;      --{eabus(0)&} domux setting 
                                path_s.ea_output    <= NB_DS_EA;        -- dispmux & eamux & segop  (unless Segment OP flag is set)

                                if (second_pass='0') then               -- first pass read operand
                                    second_pass_s <= '1';               -- need another pass
                                    next_state  <= Sreadmem;            -- start read cycle 
                                else
                                    second_pass_s <= '0';               -- clear                                
                                    wrpath_s.wrip <= '1';               -- Update IP+nbreq register 
                                    wrpath_s.wrcc <= '1';               -- Update Status Register 
                                    next_state <= Sexecute;             -- TEST, do not write results
                                end if;             

                            end if;

                        when "010" | "011"  =>                          -- Invert NOT and 2s complement NEG
                                                                        -- Check with others to see if can be combined!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                            if instr.xmod="11" then                     -- Negate Register  r/m=reg field
                                second_pass_s <= '0';
                                
                                path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm;    -- dimux & w & seldreg  
                                -- Note ALU_TEST2 is generic for all sub types
                                if (instr.reg(0)='1') then              -- NEG instruction
                                    path_s.alu_operation<= '0'&instr.rm & REG_CONST1 & ALU_TEST2(6 downto 3)&instr.reg; -- selalua & selalub & aluopr
                                else                                    -- NOT instruction, note DATAIN must be zero!
                                    path_s.alu_operation<= '0'&instr.rm & REG_DATAIN & ALU_TEST2(6 downto 3)&instr.reg; -- selalua & selalub & aluopr
                                end if;
                                path_s.ea_output    <= NB_CS_IP;        -- IPREG+NB ADDR=CS:IP
                                
                                if (instr.reg(0)='1') then              -- NEG instruction
                                    wrpath_s.wrcc       <= '1';         -- Update Status Register                                                               
                                end if;
                                
                                wrpath_s.wrd        <= '1';             -- Write Data Register to Data Register
                                wrpath_s.wrip       <= '1';             -- Update IP+nbreq register
                                
                                next_state <= Sexecute;

                            else                                        -- Destination and source is memory 
                                -- only need W bit
                                path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg (only dimux, the rest is don't care) 
                                -- need to read memory first
                                if (instr.reg(0)='1') then              -- NEG instruction
                                    path_s.alu_operation<= REG_MDBUS & REG_CONST1 & ALU_TEST2(6 downto 3)&instr.reg; -- selalua & selalub & aluopr
                                else                                    -- NOT instruction, note DATAIN must be zero!
                                    path_s.alu_operation<= REG_MDBUS & REG_DATAIN & ALU_TEST2(6 downto 3)&instr.reg; -- selalua & selalub & aluopr
                                end if;
                                                                                            
                                path_s.dbus_output  <= ALUBUS_OUT;      --{eabus(0)&} domux setting 
                                path_s.ea_output    <= NB_DS_EA;        -- dispmux & eamux & segop  (unless Segment OP flag is set)

                                if (second_pass='0') then               -- first pass read operand
                                    second_pass_s <= '1';               -- need another pass
                                    next_state  <= Sreadmem;            -- start read cycle 
                                else
                                    second_pass_s <= '0';               -- clear                                                                   
                                    if (instr.reg(0)='1') then          -- NEG instruction
                                        wrpath_s.wrcc <= '1';           -- Update Status Register                                                               
                                    end if;
                                    wrpath_s.wrip <= '1';               -- Update IP+nbreq register 
                                    next_state <= Swritemem;            -- write results
                                end if;             

                            end if;


                        when "100" | "101" | "110" | "111" =>           -- DIV/IDIV/MUL/IMUL instruction

                            if (second_pass='0') then                   -- Set up multiply parameters
                                second_pass_s   <= '1';
                                

                                if (instr.reg(1)='1') then              -- Only assert for DIV and IDIV, not for MUL/IMUL
                                    passcnt_s       <= "000"&DIV_MCD_C; -- Serial delay
                                else
                                    passcnt_s       <= "000"&MUL_MCD_C; -- Multiplier MCP
                                end if;

                                -- only need W bit
                                path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  
                                -- Note ALU_TEST is generic for all sub types
                                if instr.xmod="11" then                 -- Immediate to Register, result to AX or DX:AX
                                    path_s.ea_output    <= NB_CS_IP;    -- IPREG+NB ADDR=CS:IP
                                    path_s.alu_operation<= REG_AX & '0'&instr.rm & ALU_TEST2(6 downto 4)&'0'&instr.reg; -- selalua & selalub & aluopr
                                    next_state  <= Sdecode;             -- Next write remaining AX
                                else                                    -- get byte/word from memory
                                    path_s.ea_output    <= NB_DS_EA;
                                    path_s.alu_operation<= REG_AX & REG_MDBUS & ALU_TEST2(6 downto 4)&'0'&instr.reg; -- selalua & selalub & aluopr
                                    next_state  <= Sreadmem;            -- Next write remaining AX
                                end if;
                                wrpath_s.wralu  <= '1';                 -- latch AX/AL and Byte/Word
                                
                            else
                                passcnt_s           <= passcnt - '1';
                                path_s.ea_output    <= NB_CS_IP;        -- IPREG+NB ADDR=CS:IP (required???????????)

                                if (passcnt=X"01") then               -- 
                                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_AX(2 downto 0); -- dimux & w & seldreg 
                                    path_s.alu_operation<= REG_AX & '0'&instr.rm & ALU_TEST2(6 downto 4)&'0'&instr.reg; -- selalua & selalub & aluopr
                                    wrpath_s.wrd    <= '1';             -- Write AX
                                    if (instr.ireg(0)='1') then
                                        second_pass_s   <= '1';         -- HT0912
                                        next_state      <= Sdecode;     -- Continue, next cycle to write DX
                                    else
                                        second_pass_s   <= '0';
                                        wrpath_s.wrcc   <= '1';         -- Update Status Register           
                                        wrpath_s.wrip   <= '1';         -- Update IP+nbreq register 
                                        next_state      <= Sexecute;    -- terminate    
                                    end if;     
                                elsif (passcnt=X"00") then
                                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_DX(2 downto 0); -- dimux & w & seldreg 
                                    path_s.alu_operation<= REG_AX & '0'&instr.rm & ALU_TEST2(6 downto 4)&'1'&instr.reg; -- selalua & selalub & aluopr
                                    second_pass_s   <= '0';
                                    wrpath_s.wrd    <= '1';             -- Write DX
                                    wrpath_s.wrcc   <= '1';             -- Update Status Register           
                                    wrpath_s.wrip   <= '1';             -- Update IP+nbreq register 
                                    next_state      <= Sexecute;        -- terminate                    
                                else
                                    second_pass_s   <= '1';             -- HT0912
                                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_DX(2 downto 0); -- dimux & w & seldreg 
                                    path_s.alu_operation<= REG_AX & '0'&instr.rm & ALU_TEST2(6 downto 4)&'1'&instr.reg; -- selalua & selalub & aluopr
                                    next_state      <= Sdecode;         -- round the loop again                             
                                end if; 
                            end if; 
                                                                

                        when others =>
                            second_pass_s   <= '0';                     -- To avoid latch HT0912
                            proc_error_s    <='1';                      -- Assert Bus Error Signal
                            -- pragma synthesis_off
                            assert not (now > 0 ns) report "**** Illegal F7/F6 modrm field  (proc)  ***" severity warning;
                            -- pragma synthesis_on
                            next_state <= Sdecode;                      -- Reset State????

                    end case;

                ---------------------------------------------------------------------------------
                -- ADD/ADC/SUB/SBB/CMP/AND/OR/XOR Immediate to ACCU 
                -- ALU operation is defined in bits 5-3 of opcode
                ---------------------------------------------------------------------------------
                when ADDI2AX0 | ADDI2AX1 | ADCI2AX0 | ADCI2AX1 | SUBI2AX0 | SUBI2AX1 | SBBI2AX0 | SBBI2AX1 | 
                     CMPI2AX0 | CMPI2AX1 | ANDI2AX0 | ANDI2AX1 | ORI2AX0  | ORI2AX1  | XORI2AX0 | XORI2AX1 |
                     TESTI2AX0| TESTI2AX1  =>

                     second_pass_s <= '0';
                     -- Note Destination reg is fixed to AX/AL/AH
                     path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & REG_AX(2 downto 0); -- dimux & w & seldreg(3)
                     -- note aluopr = bit 5 to 3 of opcode
                     path_s.alu_operation<= REG_AX & REG_DATAIN & ALU_ADD(6 downto 4)&instr.ireg(7)&instr.ireg(5 downto 3);-- selalua & selalub & aluopr

                     path_s.ea_output   <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP
                    
                     if ((instr.ireg(5 downto 3)/="111") and (instr.ireg(7)='0')) then-- Check if not CMP or TEST Instruction
                        wrpath_s.wrd    <= '1';                         -- Write Data Register to Data Register
                     end if;                                                                                            
                     wrpath_s.wrip      <= '1';                         -- Update IP+nbreq register
                     wrpath_s.wrcc      <= '1';                         -- Update Status Register
                     
                     next_state <= Sexecute;

                ---------------------------------------------------------------------------------
                -- Exchange Register with Accu
                ---------------------------------------------------------------------------------
                when XCHGAX | XCHGCX | XCHGDX | XCHGBX | XCHGSP | XCHGBP | XCHGSI | XCHGDI =>
                    
                     path_s.ea_output    <= NB_CS_IP;                   -- IPREG+NB ADDR=CS:IP

                     if (second_pass='0') then                          -- first pass read operand
                        second_pass_s <= '1';                           -- need another pass
                        -- First pass copy AX to reg and reg to ALUREG
                        path_s.datareg_input<= ALUBUS_IN & '1' & instr.ireg(2 downto 0); -- dimux & w & seldreg
                        path_s.alu_operation<= REG_AX & '0' & instr.ireg(2 downto 0) & ALU_PASSA; -- selalua(4) & selalub(4) & aluopr

                        wrpath_s.wrd  <= '1';                           -- Update AX & write reg to ALUREG
                        wrpath_s.wralu<= '1';                           -- Write INBUSB to ALUREG   
                        next_state <= Sdecode;                          -- second pass
                    else
                        second_pass_s <= '0';                           -- clear
                        -- Second Pass, write ALU register to AX
                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_AX(2 downto 0); -- dimux & w & seldreg
                        -- selalua and selalub are don't care, use previous values to reduce synth
                        path_s.alu_operation<= REG_AX & '0' & instr.ireg(2 downto 0) & ALU_REGL;-- selalua(4) & selalub(4) & aluopr                                                        

                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                        wrpath_s.wrd  <= '1';                           -- Write ALUREG to AX   
                        next_state <= Sexecute;                         
                    end if;             

                ---------------------------------------------------------------------------------
                -- Exchange Register with Register/Memory
                ---------------------------------------------------------------------------------
                when XCHGW | XCHGB =>

                    if instr.xmod="11" then                             -- Register to Register  rm=reg field
                        
                        path_s.ea_output    <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP

                        if (second_pass='0') then                           -- first pass read operand
                            second_pass_s <= '1';                           -- need another pass
                            -- First pass copy rm to ireg and ireg to ALUREG
                            path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.reg; -- dimux & w & seldreg
                            path_s.alu_operation<= '0'&instr.rm & '0'&instr.reg & ALU_PASSA; -- selalua(4) & selalub(4) & aluopr

                            wrpath_s.wrd  <= '1';                           -- Update AX & write reg to ALUREG
                            wrpath_s.wralu<= '1';                           -- Write INBUSB to ALUREG (instr.reg)   
                            next_state <= Sdecode;                          -- second pass
                        else
                            second_pass_s <= '0';                           -- clear
                            -- Second Pass, write ALUREG(ireg) to rm
                            path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm; -- dimux & w & seldreg
                        
                            -- selalua and selalub are don't care
                            path_s.alu_operation<= DONTCARE(3 downto 0) & '0'&instr.reg & ALU_REGL; -- selalua(4) & selalub(4) & aluopr

                            wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                            wrpath_s.wrd  <= '1';                           -- Write ALUREG to AX   
                            next_state <= Sexecute;                         
                        end if;         

                    else 
                        path_s.ea_output    <= NB_DS_EA;                    -- dispmux & eamux & segop  (unless Segment OP flag is set)
                            
                        if (second_pass='0') then                           -- first pass read operand from memory
                            second_pass_s <= '1';                           -- need another pass
                            -- First pass copy rm to ireg and ireg to ALUREG
                            path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & instr.reg; -- dimux & w & seldreg
                            path_s.alu_operation<= '0'&instr.rm & '0'&instr.reg & ALU_PASSA; -- selalua(4) & selalub(4) & aluopr

                            wrpath_s.wrd  <= '1';                           -- Update AX & write reg to ALUREG
                            wrpath_s.wralu<= '1';                           -- Write INBUSB to ALUREG (instr.reg)   
                            next_state <= Sreadmem;                         -- get memory operand
                        else
                            second_pass_s <= '0';                           -- clear
                            path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg 
                            -- selalua and selalub are don't care, use previous values to reduce synth?????                 
                            path_s.alu_operation<= '0'&instr.rm & '0'&instr.reg & ALU_REGL; -- selalua(4) & selalub(4) & aluopr
                        
                            path_s.dbus_output  <= ALUBUS_OUT;              --{eabus(0)&} domux setting 

                            wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                            next_state <= Swritemem;                            
                        end if;     
                    end if;

                ---------------------------------------------------------------------------------
                -- Processor Control Instructions   
                -- ALU operation is defined in bits 5-0 of opcode
                ---------------------------------------------------------------------------------
                when CLC | CMC | STC | CLD | STDx | CLI | STI  =>       

                     second_pass_s <= '0';
                     path_s.datareg_input<= DONTCARE(6 downto 0) ;      -- dimux(3) & w & seldreg(3)
                     -- Note aluopr = bit 3 to 0 of opcode
                     -- Note ALU_CMC(6 downto 4) is generic for all sub types
                     path_s.alu_operation<= DONTCARE(7 downto 0) & ALU_CMC(6 downto 4)&instr.ireg(3 downto 0);-- selalua(4) & selalub(4) & aluopr(7)

                     path_s.ea_output   <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP
                                                                                        
                     wrpath_s.wrip      <= '1';                         -- Update IP+nbreq register
                     wrpath_s.wrcc      <= '1';                         -- Update Status Register
                     
                     next_state <= Sexecute;

                ---------------------------------------------------------------------------------
                -- Load AH with flags (7 downto 0) 
                -- Note orginal instruction only loads bit 7,6,4,2,0  (easy change if required) 
                -- ALU operation is defined in bits 6-0 of opcode 
                ---------------------------------------------------------------------------------
                when LAHF =>

                     second_pass_s <= '0';
                     path_s.datareg_input<= ALUBUS_IN & REG_AH;         -- dimux & w & seldreg(3)
                     -- note aluopr = bit 6 to 0 of opcode
                     path_s.alu_operation<= DONTCARE(7 downto 0) & ALU_LAHF(6 downto 4)&instr.ireg(3 downto 0);-- selalua & selalub & aluopr

                     path_s.ea_output   <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP
                                                                                        
                     wrpath_s.wrd       <= '1';                         -- Write Result to AH
                     wrpath_s.wrip      <= '1';                         -- Update IP+nbreq register
                     
                     next_state <= Sexecute;

                ---------------------------------------------------------------------------------
                -- Store AH into flags (7 downto 0)
                -- Note orginal instruction only stores bit 7,6,4,2,0   
                -- ALU operation is defined in bits 6-0 of opcode 
                ---------------------------------------------------------------------------------
                when SAHF =>

                     second_pass_s <= '0';
                     path_s.datareg_input<= DONTCARE(2 downto 0)&'0'& DONTCARE(2 downto 0); -- dimux(3) & w & seldreg(3)
                     -- note aluopr = bit 6 to 0 of opcode
                     path_s.alu_operation<= REG_AH & DONTCARE(3 downto 0) & ALU_SAHF(6 downto 4)&instr.ireg(3 downto 0);-- selalua & selalub & aluopr

                     path_s.ea_output   <= NB_CS_IP;                    -- IPREG+NB ADDR=CS:IP
                                                                                        
                     wrpath_s.wrip      <= '1';                         -- Update IP+nbreq register
                     wrpath_s.wrcc      <= '1';                         -- Update Status Register with contents AH
                     
                     next_state     <= Sexecute;


                 ---------------------------------------------------------------------------------
                 -- PUSH Data Register
                 ---------------------------------------------------------------------------------
                 when PUSHAX | PUSHCX | PUSHDX | PUSHBX | PUSHSP | PUSHBP | PUSHSI | PUSHDI => 
                            
                     path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                     path_s.dbus_output <= ALUBUS_OUT;                  --{eabus(0)&} domux setting
                     path_s.ea_output   <= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
    
                     if (second_pass='0') then                          -- first pass SP-2
                        second_pass_s <= '1';                           -- need another pass
    
                        path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                     
                        wrpath_s.wrd    <= '1';                         -- Update SP
                        wrpath_s.wralu  <= '1';                         -- Save reg in alureg (required for PUSH SP)
                        next_state <= Sdecode;                          -- second pass
                     else
                        second_pass_s <= '0';                           -- clear    
                        
                        path_s.alu_operation<= '0'&instr.reg & REG_CONST2 & ALU_PASSA;-- selalua(4) & selalub(4) & aluopr
                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register                         
                        next_state <= Swritemem;                        -- start write cycle
                    end if;                            


                ---------------------------------------------------------------------------------
                -- PUSH Flag Register 
                ---------------------------------------------------------------------------------
                when PUSHF =>                                           -- Push flag register
                
                    path_s.dbus_output  <= CCBUS_OUT;                   --{eabus(0)&} domux setting
                    path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr   

                    if (second_pass='0') then                           -- first pass SP-2
                        second_pass_s <= '1';                           -- need another pass

                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                    
                        path_s.ea_output  <= NB_DS_EA;                  -- dispmux & eamux & segop  (unless Segment OP flag is set)
                        wrpath_s.wrd    <= '1';                         -- Update SP
                        --next_state    <= Sreadmem;                        -- start read cycle 
                        next_state <= Sdecode;                          -- second pass
                    else
                        second_pass_s <= '0';                           -- clear                                
                        
                        -- Second Pass, write memory operand to stack
                        path_s.datareg_input<= MDBUS_IN & '1' & DONTCARE(2 downto 0); -- dimux & w & seldreg
                            
                        path_s.ea_output    <= NB_SS_SP & DONTCARE(2 downto 0); -- dispmux(2) & eamux(4) & [flag]&segop(2)
                                            
                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register                         
                        next_state <= Swritemem;                        -- start write cycle
                    end if;                            
    
                ---------------------------------------------------------------------------------
                -- POP Flag Register 
                ---------------------------------------------------------------------------------
                when POPF =>                                            -- POP Flags 
                                                                        -- Setup datapath for SP<=SP-2, ea=SS:SP
                     -- Note datareg_input is don't care during second pass
                     path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                     path_s.ea_output   <= NB_SS_SP &DONTCARE(2 downto 0); -- SS:SP+2 
    
                     if (second_pass='0') then                          -- first pass read operand
                        second_pass_s <= '1';                           -- need another pass
                        -- First pass, start read and update SP
                        path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr

                        wrpath_s.wrd  <= '1';                           -- Update SP    
                        next_state  <= Sreadmem;                        -- start read cycle to get [SS:SP]  
                     else
                        second_pass_s <= '0';                           -- clear
                        -- Second Pass, write memory operand to CC register
                        path_s.alu_operation<= REG_MDBUS & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr                                                     

                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                        wrpath_s.wrcc <= '1';                           -- Update Status Register                                               
                        next_state <= Sexecute;
                     end if;                

                ---------------------------------------------------------------------------------
                -- POP Data Register
                ---------------------------------------------------------------------------------
                when POPAX | POPCX | POPDX | POPBX | POPSP | POPBP | POPSI | POPDI => 
                        
                     path_s.ea_output   <= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP 
                     path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr
    
                     if (second_pass='0') then                          -- first pass read operand
                        second_pass_s <= '1';                           -- need another pass
                        -- First pass, start read and update SP
                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg

                        wrpath_s.wrd  <= '1';                           -- Update SP    
                        next_state  <= Sreadmem;                        -- start read cycle to get [SS:SP]  
                     else
                        second_pass_s <= '0';                           -- clear
                        -- Second Pass, write memory operand to data register
                        path_s.datareg_input<= MDBUS_IN & '1' & instr.ireg(2 downto 0); -- dimux & w & seldreg

                        wrpath_s.wrd  <= '1';                           -- Update DataReg   
                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                        next_state <= Sexecute;
                     end if;
                 
                 ---------------------------------------------------------------------------------
                 -- POP TOS to Memory or Register
                 -- 
                 ---------------------------------------------------------------------------------
                 when POPRM => 
    
                    if (second_pass='0') then                           -- first pass read operand
                        second_pass_s <= '1';                           -- need another pass
                        
                        path_s.ea_output    <= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP 
                        path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr
        
                                                                        -- First pass, start read and update SP
                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                    
                        wrpath_s.wrd  <= '1';                           -- Update SP    
                        next_state  <= Sreadmem;                        -- start read cycle to get [SS:SP]  

                    else                                                -- second pass, write to memory or register
                        second_pass_s <= '0';                           -- no more passes
                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                        
                        -- Next are only used when xmod/=11, for xmod=11 they are don't care
                        path_s.dbus_output  <= DIBUS_OUT;               --{eabus(0)&} domux setting 
                        path_s.ea_output    <= NB_DS_EA;                -- dispmux=000,eamux=0001, dis_opflag=0, segop=11 
                        
                        -- For xmod/=11 the last 3 bits are DONTCARE
                        path_s.datareg_input<= MDBUS_IN & '1' & instr.rm; -- dimux & w & seldreg ireg-> r=4, rm->r=1
                        
                        if instr.xmod="11" then                         -- POP Register  r/m=reg field
                                                                        -- This is the same as POPAX, POPCX etc
                            wrpath_s.wrd  <= '1';                       -- Update DataReg   
                            next_state <= Sexecute;
                        else                                         
                            next_state <= Swritemem;                    -- Update memory location pointed to by EA
                        end if;
                    end if;
                                    
                 ---------------------------------------------------------------------------------
                 -- POP Segment Register
                 -- Note POP CS is illegal, result unknown instruction, assert bus error 
                 -- Interrupts are disabled until the next instruction
                 ---------------------------------------------------------------------------------
                 when POPES | POPSS | POPDS => 
                    
                    irq_blocked_s <= '1';                               -- Block IRQ if asserted during next instr.

                    second_pass_s <= '0';
                    irq_blocked_s <= '1';                               -- Block IRQ if asserted during next instr.

                    path_s.ea_output    <= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
        
                    -- Path to update SP
                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                    path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr
                     
                    -- Path to write operand to segment register
                    path_s.segreg_input <= SMDBUS_IN & instr.ireg(4 downto 3);  -- simux(2) & selsreg(2)

                    wrpath_s.wrd  <= '1';                               -- Update SP    
                    wrpath_s.wrs  <= '1';                               -- Update Segment Register  
                    wrpath_s.wrip <= '1';                               -- Update IP+nbreq register
                     
                    next_state  <= Sreadmem;                            -- start read cycle to get [SS:SP]  

                 ---------------------------------------------------------------------------------
                 -- PUSH Segment Register
                 -- PUSH CS is legal
                 ---------------------------------------------------------------------------------
                 when PUSHES | PUSHCS | PUSHSS | PUSHDS => 
                                        
                    path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                    path_s.dbus_output  <= DIBUS_OUT;                   --{eabus(0)&} domux setting
                    path_s.ea_output    <= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 

                    if (second_pass='0') then                           -- first pass SP-2
                        second_pass_s <= '1';                           -- need another pass

                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                        
                        wrpath_s.wrd    <= '1';                         -- Update SP
                        next_state <= Sdecode;                          -- second pass
                    else
                        second_pass_s <= '0';                           -- clear    
                        path_s.datareg_input<= '1' & instr.ireg(4 downto 3) & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                                                                                
                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register                         
                        next_state <= Swritemem;                        -- start write cycle
                    end if;                            

                ---------------------------------------------------------------------------------
                -- Unconditional Jump
                -- Short Jump within segment, SignExt DISPL
                -- Long  Jump within segment, No SignExt DISPL
                -- Direct within segment (JMPDIS, new CS,IP on data_in and disp)
                ---------------------------------------------------------------------------------
                when JMPS| JMP | JMPDIS=>

                    second_pass_s   <= '0';
                    flush_req_s     <= '1';                             -- Flush Prefetch queue, asserted during execute cycle
                    path_s.segreg_input <= SDATAIN_IN & CS_IN(1 downto 0);-- simux & selsreg, only for JMPDIS

                    if (instr.ireg(1 downto 0)="10") then               -- JMPDIS Instruction
                        path_s.ea_output <= LD_CS_IP;                   -- dispmux & eamux & segop Load new CS:IP from memory
                        wrpath_s.wrs    <= '1';                         -- Update CS register                               
                    else
                        path_s.ea_output <= DISP_CS_IP;                 -- CS:IPREG+DISPL
                    end if;

                    wrpath_s.wrip   <= '1';                             -- Update IP+nbreq register
                    next_state  <= Sexecute;            

                ---------------------------------------------------------------------------------
                -- LOOP Instruction
                -- No flags are affected
                -- Note: JCXZ can be speeded up by 1 clk cycle since the first pass is not
                -- required!!
                ---------------------------------------------------------------------------------
                when LOOPCX | LOOPZ | LOOPNZ | JCXZ =>
                    
                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_CX(2 downto 0); -- dimux & w & seldreg
                    path_s.alu_operation<= REG_CX & REG_CONST1 & ALU_DEC;-- selalua(4) & selalub(4) & aluopr


                     if (second_pass='0') then                          -- first pass CX <= CX-1
                        second_pass_s <= '1';                           -- need another pass

                        if (instr.ireg(1 downto 0)/="11") then
                            wrpath_s.wrd  <= '1';                       -- Update CX unless instr=JCXZ  
                        end if;
                        next_state  <= Sdecode;                         -- Next check CX value

                     else                                               -- Next check CX and flag value
                        second_pass_s <= '0';                           
                        -- path ALU is don't care
                                                                 -- ver 0.70 fixed loop!! status.cx_zero ro cx_one      
                        if (((instr.ireg(1 downto 0)="00") and (status.flag(6)='0') and (status.cx_one='0')) or -- loopnz, jump if cx/=0 && zf=0
                            ((instr.ireg(1 downto 0)="01") and (status.flag(6)='1') and (status.cx_one='0')) or-- loopz, jump if cx/=0 && zf=1
                            ((instr.ireg(1 downto 0)="10") and (status.cx_one='0')) or      -- loop, jump if cx/=0
                            ((instr.ireg(1 downto 0)="11") and (status.cx_zero='1'))) then  -- jcxz jump if cx=0 

                            flush_req_s <= '1'; 
                            path_s.ea_output <= DISP_CS_IP;             -- jump
                        else
                            path_s.ea_output <= NB_CS_IP;               -- Do not jump
                        end if;
                     
                        wrpath_s.wrip <= '1';                           -- Update IP+nbreq register
                        next_state <= Sexecute;
                     
                    end if; 

                -----------------------------------------------------------------------------
                -- FF/FE Instructions. Use regfield to decode operation   
                -- INC  reg=000  (FF/FE)
                -- DEC  reg=001  (FF/FE)
                -- CALL reg=010  (FF) Indirect within segment
                -- CALL reg=011  (FF) Indirect Intersegment
                -- JMP  reg=100  (FF) Indirect within segment
                -- JMP  reg=101  (FF) Indirect Intersegment
                -- PUSH reg=110  (FF)
                -----------------------------------------------------------------------------
                when FEINSTR | FFINSTR =>
                    
                    case instr.reg is                               

                        when "000" | "001" =>                           -- INC or DEC instruction
                            if instr.xmod="11" then                     -- Immediate to Register  r/m=reg field
                                second_pass_s <= '0';
                                
                                path_s.datareg_input<= ALUBUS_IN & instr.ireg(0) & instr.rm; -- dimux & w & seldreg Note RM=Destination
                                -- instr.reg(5..3) contains the required operation,  ALU_INBUSB=X"0001"
                                -- note ALU_INC(6 downto 3) is generic for both INC and DEC
                                path_s.alu_operation<= '0'&instr.rm & REG_CONST1 & ALU_INC(6 downto 3)&instr.reg; -- selalua & selalub & aluopr

                                path_s.ea_output    <= NB_CS_IP;        -- IPREG+NB ADDR=CS:IP
                                
                                wrpath_s.wrd    <= '1';                 -- Write Data Register to Data Register
                                wrpath_s.wrcc   <= '1';                 -- Update Status Register                                                               
                                wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register
                                
                                next_state <= Sexecute;

                            else                                        -- Destination and source is memory (no wrpath_s.wrd)
                                                                        -- This is nearly the same as AND with d=0, see above
                                -- only need W bit
                                path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg (only dimux, the rest is don't care) 
                                -- INC/DEC Memory, need to read memory first
                                path_s.alu_operation<= REG_MDBUS & REG_CONST1 & ALU_INC(6 downto 3)&instr.reg; -- selalua & selalub & aluopr
                                                                                            
                                path_s.dbus_output  <= ALUBUS_OUT;      --{eabus(0)&} domux setting 
                                path_s.ea_output    <= NB_DS_EA;        -- dispmux & eamux & segop  (unless Segment OP flag is set)

                                if (second_pass='0') then               -- first pass read operand
                                    second_pass_s <= '1';               -- need another pass
                                    next_state  <= Sreadmem;            -- start read cycle 
                                else
                                    second_pass_s <= '0';               -- clear                                
                                    wrpath_s.wrip <= '1';               -- Update IP+nbreq register 
                                    wrpath_s.wrcc <= '1';               -- Update Status Register 
                                    next_state <= Swritemem;            -- start write cycle
                                end if;             

                            end if;

                            
                        ---------------------------------------------------------------------------------
                        -- CALL Indirect within Segment
                        -- SP<=SP-2
                        -- Mem(SP)<=IP
                        -- IP<=EA
                        ---------------------------------------------------------------------------------
                        when "010" =>
            
                            flush_coming_s<= '1';                       -- signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.

                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                            path_s.dbus_output  <= IPBUS_OUT;                   --{eabus(0)&} domux setting
                            
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
        
                            if (second_pass='0') then                   -- first pass SP-2
                                second_pass_s   <= '1';                         
                                path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
                                passcnt_s       <= X"02";                     
                                wrpath_s.wrd    <= '1';                 -- Update SP
                                next_state      <= Sdecode;             -- second pass
                            else                                        -- Second pass Mem
                                passcnt_s   <= passcnt - '1';
                                if (passcnt=X"00") then               
                                    second_pass_s   <= '0';             -- clear
                                    flush_req_s     <= '1';             -- Flush Prefetch queue, asserted during execute cycle
                                    path_s.ea_output<=NB_CS_IP;         -- select CS:IP before Flush;                              
                                    next_state <= Sexecute;

                                elsif (passcnt=X"01") then              -- Third pass
                                    wrpath_s.wrip   <= '1';             -- Update IP+nbreq register                                                                 
                                    if instr.xmod="11" then
                                        second_pass_s   <= '0';         -- clear
                                        flush_req_s     <= '1';         -- Flush Prefetch queue, asserted during execute cycle
                                        path_s.ea_output<= "1001001001";-- fix version 1.0a 02/08/09 EA_CS_IP;
                                        next_state      <= Sexecute;
                                    else
                                        second_pass_s   <= '1';         -- need another pass
                                        -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                                        path_s.ea_output<= "0100001011";    -- Get indirect value   
                                        next_state      <= Sreadmem;
                                    end if;
                                else                                    -- Second pass write MEM(SS:SP)<=IP
                                    second_pass_s   <= '1'; 
                                    path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                                    next_state      <= Swritemem;       -- start write cycle, MEM(SP)<=IP
                                end if; 
                                                                                    
                            end if; 

                        ---------------------------------------------------------------------------------
                        -- CALL IntraSegment Indirect
                        -- SP<=SP-2
                        -- Mem(SP)<=CS
                        -- SP<=SP-2
                        -- Mem(SP)<=IP
                        -- CS<=DS:EA
                        -- IP<=DS:EA+2
                        -- Flush
                        ---------------------------------------------------------------------------------
                        when "011" =>

                            flush_coming_s<= '1';                       -- signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.

                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                            
                            if (second_pass='0') then                   -- first pass SP<=SP-2
                                second_pass_s   <= '1'; 
                                path_s.dbus_output<=DONTCARE(1 downto 0);
                                path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg                                             
                                path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2  (DONTCARE)
                                passcnt_s       <= X"05";
                                wrpath_s.wrd    <= '1';                 -- Update SP
                                next_state      <= Sdecode;                     
                            else                                                 
                                passcnt_s   <= passcnt - '1';
        
                                if (passcnt=X"05") then               -- Second pass write CS to ss:sp
                                    second_pass_s   <= '1'; 
                                    path_s.segreg_input <= DONTCARE(1 downto 0) & CS_IN(1 downto 0); -- simux & selsreg
                                    path_s.datareg_input<= CS_IN & '1' & DONTCARE(2 downto 0); -- dimux & w & seldreg
                                    path_s.dbus_output  <= DIBUS_OUT;   --{eabus(0)&} domux setting CS out
                                    path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                                    next_state      <= Swritemem;       -- start write cycle, MEM(SP)<=CS

                                elsif (passcnt=X"04") then            -- Third pass SP<=SP-2
                                    second_pass_s   <= '1'; 
                                    path_s.dbus_output<=DONTCARE(1 downto 0);
                                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg                                             
                                    path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
                                    wrpath_s.wrd    <= '1';             -- Update SP
                                    next_state      <= Sdecode; 

                                elsif (passcnt=X"03") then            -- fourth pass, write IP 
                                    second_pass_s   <= '1'; 
                                    path_s.segreg_input <= DONTCARE(3 downto 0); -- simux & selsreg
                                    path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg
                                    path_s.dbus_output  <= IPBUS_OUT;           --{eabus(0)&} domux setting CS out
                                    path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                                    next_state      <= Swritemem;       -- start write cycle, MEM(SP)<=CS

                                elsif (passcnt=X"02") then            -- fifth pass, CS<=Mem(EA+2) 
                                    second_pass_s   <= '1';             -- need another pass
                                    path_s.segreg_input <= SMDBUS_IN & CS_IN(1 downto 0); -- simux & selsreg
                                    path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg                                                          
                                    wrpath_s.wrs    <= '1';             -- update cs
                                    -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                                    path_s.ea_output<= MD_EA2_DS; --"010110011"; -- Get indirect value EA+2 
                                    next_state      <= Sreadmem;        -- Get CS value from memory

                                elsif (passcnt=X"01") then            -- sixth pass, IP<=Mem(EA) 
                                    second_pass_s   <= '1';             -- need another pass
                                    path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg
                                    wrpath_s.wrip   <= '1';             -- update ip
                                    -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                                    path_s.ea_output<= "0100001011";    -- Get indirect value EA    
                                    next_state      <= Sreadmem;        -- Get CS value from memory

                                else                                    -- Final pass, update IP & CS
                                    second_pass_s   <= '0';             -- clear
                                    path_s.dbus_output  <= IPBUS_OUT;   --{eabus(0)&} domux setting
                                    path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg
                                    flush_req_s     <= '1';             -- Flush Prefetch queue, asserted during execute cycle
                                    path_s.ea_output<=NB_CS_IP;         -- dispmux & eamux & segop 
                                    next_state      <= Sexecute;
                                end if; 
                                                                                    
                            end if;     

                        ---------------------------------------------------------------------------------
                        -- JMP Indirect within Segment
                        -- IP<=EA
                        ---------------------------------------------------------------------------------
                        when "100" =>
                            path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg 

                            if instr.xmod="11" then                     -- Immediate to Register  r/m=reg field
                                second_pass_s   <= '0'; 
                                flush_req_s     <= '1';                 -- Flush Prefetch queue, asserted during execute cycle
                                path_s.ea_output<= "1001001001";        -- Select eabus with eamux(0)=0  (dispmux(3) & eamux(4) & segop(2)
                                wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register
                                next_state      <= Sexecute;
                            else                                        -- source is memory 
                                    
                                if (second_pass='0') then               -- first pass read operand
                                    second_pass_s   <= '1';             -- need another pass
                                    path_s.ea_output<= "0100001011";    -- Get indirect value
                                    wrpath_s.wrip   <= '1';             -- Update IP register   
                                    next_state      <= Sreadmem;        -- start read cycle 
                                else
                                    second_pass_s   <= '0';             -- clear
                                    flush_req_s     <= '1';             -- Flush Prefetch queue, asserted during execute cycle                                                                  
                                    path_s.ea_output<= "0100000011";    -- select CS:IPreg before Flush
                                    next_state      <= Sexecute;                
                                end if;             

                            end if;

                        ---------------------------------------------------------------------------------
                        -- JMP Indirect Inter Segment
                        -- IP<=EA
                        -- CS<=EA+2
                        ---------------------------------------------------------------------------------
                        when "101" =>
                            path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg 
                            path_s.segreg_input <= SMDBUS_IN & CS_IN(1 downto 0); -- simux & selsreg
                                
                            if (second_pass='0') then                   -- first pass read IP
                                second_pass_s   <= '1';                 -- need another pass
                                passcnt_s       <= X"01";               -- need extra pass
                                path_s.ea_output<= "0100001011";        -- Get indirect value
                                wrpath_s.wrip   <= '1';                 -- Update IP register   
                                next_state      <= Sreadmem;            -- start read cycle 
                            else
                                passcnt_s   <= passcnt - '1';

                                if (passcnt=X"01") then
                                    second_pass_s   <= '1';             -- need another pass (HT0912)
                                 -- path_s.segreg_input <= SMDBUS_IN & CS_IN(1 downto 0); -- simux & selsreg
                                 -- path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg                                                          
                                    -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                                    path_s.ea_output<= MD_EA2_DS;       -- Get indirect value EA+2
                                    wrpath_s.wrs    <= '1';             -- update cs                                        
                                    next_state      <= Sreadmem;        -- Get CS value from memory
                                else
                                    second_pass_s   <= '0';             -- clear
                                    flush_req_s     <= '1';             -- Flush Prefetch queue, asserted during execute cycle                                                                  
                                    path_s.ea_output<= "0100000011";    -- select CS:IPreg before Flush
                                    next_state      <= Sexecute;                
                                end if;
                            end if;             


                        ---------------------------------------------------------------------------------
                        -- PUSH reg/memory
                        ---------------------------------------------------------------------------------
                        when "110" =>                                   -- PUSH MEM Instuction

                            path_s.dbus_output  <= DIBUS_OUT;           --{eabus(0)&} domux setting
                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr   
                                                                               -- change ALU_Push???

                            if (second_pass='0') then                   -- first pass read operand and execute SP-2
                                second_pass_s <= '1';                   -- need another pass
                                path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                                path_s.ea_output  <= NB_DS_EA;          -- dispmux & eamux & segop  (unless Segment OP flag is set)
                                wrpath_s.wrd    <= '1';                 -- Update SP
                                next_state  <= Sreadmem;                -- start read cycle 
                            else
                                second_pass_s <= '0';                   -- clear                                
                                                                        -- Second Pass, write memory operand to stack
                                path_s.datareg_input<= MDBUS_IN & '1' & DONTCARE(2 downto 0); -- dimux & w & seldreg
                                path_s.ea_output    <= NB_SS_SP & DONTCARE(2 downto 0); -- dispmux(2) & eamux(4) & [flag]&segop(2)
                                wrpath_s.wrip <= '1';                   -- Update IP+nbreq register                         
                                next_state <= Swritemem;                -- start write cycle
                            end if;             


                        when others =>
                            next_state      <= Sdecode;                 -- To avoid latches
                            -- pragma synthesis_off
                            assert not (now > 0 ns) report "**** FF/FE REGField=111 Illegal Instuction ***" severity warning;
                            -- pragma synthesis_on
                             
                    end case;


                ---------------------------------------------------------------------------------
                -- CALL Direct within Segment
                -- SP<=SP-2
                -- Mem(SP)<=IP
                -- IP<=IP+/-Disp
                ---------------------------------------------------------------------------------
                when CALL =>

                    flush_coming_s<= '1';                               -- signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.
                    path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                    path_s.dbus_output  <= IPBUS_OUT;                   --{eabus(0)&} domux setting
                    
                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg

                    if (second_pass='0') then                           -- first pass SP-2
                        second_pass_s   <= '1';                         
                        path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
                        passcnt_s       <= X"01";
                        wrpath_s.wrd    <= '1';                         -- Update SP
                        next_state  <= Sdecode;                         -- second pass
                    else                                                -- Second pass Mem
                        passcnt_s   <= passcnt - '1';

                        if (passcnt=X"00") then               
                            second_pass_s   <= '0';                     -- clear
                            flush_req_s     <= '1';                     -- Flush Prefetch queue, asserted during execute cycle
                            path_s.ea_output<= DISP_CS_IP;              -- CS: IPREG+DISPL
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register                             
                            next_state      <= Sexecute;
                        else
                            second_pass_s   <= '1'; 
                            path_s.ea_output <= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            next_state <= Swritemem;                    -- start write cycle, MEM(SP)<=IP
                        end if; 
                                                                            
                    end if; 
                        
                ---------------------------------------------------------------------------------
                -- CALL Direct InterSegment
                -- SP<=SP-2, 
                -- Mem(SP)<=CS, CS<=SEGMh/l
                -- SP<=SP-2
                -- Mem(SP)<=IP, IP<=OFFSETh/l & Flush
                ---------------------------------------------------------------------------------
                when CALLDIS =>

                    flush_coming_s<= '1';                               -- signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.
                    path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                    
                    if (second_pass='0') then                           -- first pass SP<=SP-2
                        second_pass_s   <= '1'; 
                        path_s.dbus_output<=DONTCARE(1 downto 0);
                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg                                             
                        path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2  (DONTCARE)
                        passcnt_s       <= X"03";
                        wrpath_s.wrd    <= '1';                         -- Update SP
                        next_state      <= Sdecode;                     
                    else                                                 
                        passcnt_s   <= passcnt - '1';

                        if (passcnt=X"03") then                       -- Second pass write CS to ss:sp
                            second_pass_s   <= '1'; 
                            path_s.segreg_input <= DONTCARE(1 downto 0) & CS_IN(1 downto 0); -- simux & selsreg
                            path_s.datareg_input<= CS_IN & '1' & DONTCARE(2 downto 0); -- dimux & w & seldreg
                            path_s.dbus_output  <= DIBUS_OUT;           --{eabus(0)&} domux setting CS out
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            next_state      <= Swritemem;               -- start write cycle, MEM(SP)<=CS
                        elsif (passcnt=X"02") then                    -- Third pass SP<=SP-2
                            second_pass_s   <= '1'; 
                            path_s.dbus_output<=DONTCARE(1 downto 0);
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg                                             
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
                            wrpath_s.wrd    <= '1';                     -- Update SP
                            next_state      <= Sdecode; 
                        elsif (passcnt=X"01") then                    -- fourth pass, write IP 
                            second_pass_s   <= '1'; 
                            path_s.segreg_input <= DONTCARE(3 downto 0); -- simux & selsreg
                            path_s.datareg_input<= DONTCARE(6 downto 0); -- dimux & w & seldreg
                            path_s.dbus_output  <= IPBUS_OUT;           --{eabus(0)&} domux setting CS out
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            next_state      <= Swritemem;               -- start write cycle, MEM(SP)<=CS
                        else -- Final pass, update IP & CS
                            second_pass_s   <= '0';                     -- clear
                            path_s.dbus_output<=DONTCARE(1 downto 0);
                            flush_req_s     <= '1';                     -- Flush Prefetch queue, asserted during execute cycle
                            path_s.segreg_input <= SDATAIN_IN & CS_IN(1 downto 0); -- simux & selsreg
                            path_s.ea_output<=LD_CS_IP;                 -- dispmux & eamux & segop Load new IP from memory
                            wrpath_s.wrs    <= '1';                     -- Update CS register                               
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register                             
                            next_state      <= Sexecute;
                        end if; 
                                                                            
                    end if;     
                        
                ---------------------------------------------------------------------------------
                -- RET Instructions
                -- IP<=Mem(SS:SP), 
                -- SP<=SP+2      (RET)
                -- CS<=Mem(SS:SP),
                -- SP<=SP+2      (RETDIS)
                ---------------------------------------------------------------------------------
                when RET | RETDIS | RETO | RETDISO =>

                    flush_coming_s<= '1';                               -- signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.
                    if (second_pass='1' and passcnt=X"00") then       -- last stage, add data_in to SP
                        path_s.alu_operation<= REG_SP & REG_DATAIN & ALU_ADD;-- selalua(4) & selalub(4) & aluopr
                    else     
                        path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr
                    end if;

                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                    path_s.dbus_output  <= IPBUS_OUT;                   --{eabus(0)&} domux setting
                                                                        -- required to write to abusreg!!

                    if (second_pass='0') then                           -- first pass  IP<=MEM(SS:SP)
                        second_pass_s   <= '1';                         
                        path_s.ea_output<=LD_SS_SP&DONTCARE(2 downto 0);-- dispmux & eamux & segop, POP IP, SS:SP                              
                        passcnt_s       <= X"03";                     -- 4 cycles
                        wrpath_s.wrip   <= '1';                         -- Update IP+nbreq register
                        next_state      <= Sreadmem;                    -- Read Stack
                    else                                                
                        
                        if (passcnt=X"03") then                       -- Second pass Mem SP=SP+2

                            wrpath_s.wrd  <= '1';                       -- Update SP    
                            if (instr.ireg(3 downto 0)="0011") then     -- RET Instruction?
                                passcnt_s       <= X"00";             -- Dontcare
                                second_pass_s   <= '0';                 -- clear                                
                                flush_req_s     <= '1';                 -- Flush Prefetch queue 
                                path_s.ea_output<=NB_CS_IP;             -- select CS:IP before Flush;                              
                                next_state <= Sexecute;
                            elsif (instr.ireg(3 downto 0)="0010") then  -- RETO Instruction?
                                passcnt_s       <= X"00";             -- Jump to last stage
                                second_pass_s   <= '1';                     
                                path_s.ea_output<= DONTCARE(9 downto 0);-- dispmux & eamux & segop, ADDR=SS:SP
                                next_state      <= Sdecode;
                            else                                        -- else RETDIS, RETDISO, update CS
                                passcnt_s       <= passcnt - '1';       -- Jump to 010
                                second_pass_s   <= '1';                     
                                path_s.ea_output<= DONTCARE(9 downto 0);-- dispmux & eamux & segop, ADDR=SS:SP
                                next_state      <= Sdecode;
                            end if;

                        elsif (passcnt=X"02") then                    -- Third pass, get CS from SS:SP 
                            
                            passcnt_s       <= passcnt - '1';           -- Jump to 01
                            second_pass_s   <= '1'; 
                            path_s.segreg_input <= SMDBUS_IN & CS_IN(1 downto 0); -- simux & selsreg                        
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            wrpath_s.wrs    <= '1';                     -- update cs
                            next_state      <= Sreadmem;                -- start write cycle, MEM(SP)<=CS

                        elsif (passcnt=X"01") then                    -- SP=SP+2

                            wrpath_s.wrd    <= '1';                     -- Update SPReg
                            passcnt_s   <= passcnt - '1';

                            if (instr.ireg(3 downto 0)="1010") then     -- RETDISO Instruction?
                                second_pass_s   <= '1'; 
                                path_s.ea_output<= IPB_CS_IP;           -- need ipbus
                                next_state      <= Sdecode;
                            else
                                second_pass_s   <= '0';                 -- clear
                                flush_req_s     <= '1';                 -- Flush Prefetch queue, asserted during execute cycle
                                path_s.ea_output<= IPB_CS_IP;           -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                                next_state      <= Sexecute;
                            end if;

                        else                                            -- Final pass, Add offset to SP
                            second_pass_s   <= '0';                     -- clear
                            flush_req_s     <= '1';                     -- Flush Prefetch queue, asserted during execute cycle
                            path_s.ea_output<=NB_CS_IP;                 -- select CS:IP for Flush;"100000000";              -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd    <= '1';                     -- Update SPReg
                            next_state      <= Sexecute;
                        end if; 

                    end if; 

                ---------------------------------------------------------------------------------
                -- Software/Hardware Interrupts
                -- SP<=SP-2
                -- MEM(SS:SP)<=FLAGS
                -- SP<=SP-2
                -- MEM(SS:SP)<=CS
                -- SP<=SP-2
                -- MEM(SS:SP)<=IP
                -- CS<=MEM(type*4)  IF=TF=0
                -- IP<=MEM(type*4)+2                
                -- Note save 1 cycle by adding type*4+2 to dispmux, IP and CS can be updated at
                -- the same time
                ---------------------------------------------------------------------------------
                when INT | INT3 | INTO =>

                    irq_blocked_s <= '1';                               -- Block IRQ if asserted during next instr.
                    
                    if (second_pass='0') then                           -- first pass SP<=SP-2
                        
                        if (instr.ireg(1 downto 0)="10" and status.flag(11)='0') then -- if int0 & no Overflow then do nothing
                            second_pass_s   <='0';
                            path_s.ea_output<= NB_CS_IP;                     
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register
                            next_state      <= Sexecute;                -- no nothing
                        else
                            second_pass_s   <= '1'; 
                            flush_coming_s  <= '1';                     -- Signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
                            wrpath_s.wrd    <= '1';                     -- Update SP
                            next_state      <= Sdecode;
                        end if;
                        path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                        path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg                                             
                        passcnt_s       <= X"07";
                                                
                    else                                                 
                        passcnt_s   <= passcnt - '1';
                        flush_coming_s<= '1';                           -- Signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.
                        if (passcnt=X"07") then                      -- Second pass write Flags to SS:SP
                            second_pass_s   <= '1'; 
                            path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg                                                          
                            path_s.dbus_output  <= CCBUS_OUT;           --{eabus(0)&} domux setting
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            next_state      <= Swritemem;               -- start write cycle, MEM(SP)<=CS

                        elsif (passcnt=X"06") then                    -- Third pass SP<=SP-2
                            second_pass_s   <= '1'; 
                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg                                             
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
                            wrpath_s.wrd    <= '1';                     -- Update SP
                            next_state      <= Sdecode; 

                        elsif (passcnt=X"05") then                    -- Fourth pass write CS to SS:SP
                            second_pass_s   <= '1'; 
                            path_s.segreg_input <= DONTCARE(1 downto 0) & CS_IN(1 downto 0); -- simux & selsreg
                            path_s.alu_operation<= DONTCARE(7 downto 0) & ALU_CLRTIF;-- selalua(4) & selalub(4) & aluopr
                            path_s.datareg_input<= CS_IN & '1' & DONTCARE(2 downto 0); -- dimux & w & seldreg
                            path_s.dbus_output  <= DIBUS_OUT;           --{eabus(0)&} domux setting CS out
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            wrpath_s.wrcc   <= '1';                     -- Clear IF and TF flag
                            next_state      <= Swritemem;               -- start write cycle, MEM(SP)<=CS

                        elsif (passcnt=X"04") then                    -- Fifth pass SP<=SP-2
                            second_pass_s   <= '1'; 
                            path_s.dbus_output<=DONTCARE(1 downto 0);   -- make same as previous??????????
                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_PUSH;-- selalua(4) & selalub(4) & aluopr
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg                                             
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0); -- SS:SP+2 
                            wrpath_s.wrd    <= '1';                     -- Update SP
                            next_state      <= Sdecode; 

                        elsif (passcnt=X"03") then                    -- Sixth pass, write IP 
                            second_pass_s   <= '1'; 
                            path_s.segreg_input <= DONTCARE(3 downto 0); -- simux & selsreg
                            path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg
                            path_s.dbus_output  <= IPBUS_OUT;           --{eabus(0)&} domux setting CS out
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            next_state      <= Swritemem;               -- start write cycle, MEM(SP)<=CS
                        
                        elsif (passcnt=X"02") then                    -- Seventh pass, CS<=Mem(EA*4+2) 
                            second_pass_s   <= '1';                     -- need another pass
                            path_s.segreg_input <= SMDBUS_IN & CS_IN(1 downto 0); -- simux & selsreg read mem
                            path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg                                                          
                            wrpath_s.wrs    <= '1';                     -- Update CS, NOTE THIS CHANGES SEGBUS THUS AFFECTING
                                                                        -- THE NEXT READ ADDRESS, TO PREVEND THIS SEGBUS
                                                                        -- IS FORCED TO ZERO.
                            path_s.ea_output<= "1100111001";            -- Get indirect value EA*4+2, ip<-mdbus_in  

                            next_state      <= Sreadmem;                -- get CS value from MEM(type*4) 

                        elsif (passcnt=X"01") then                    -- Eigth pass, IP<=MEM(EA*4+2) 
                            second_pass_s   <= '1';                     -- need another pass
                            path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg                      
                            path_s.dbus_output  <= IPBUS_OUT;           --{eabus(0)&} domux setting
                            wrpath_s.wrip   <= '1';                     -- update ip
                            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            path_s.ea_output<= "0100110001";            -- Get indirect value mem(EA*4)
                            next_state      <= Sreadmem;                

                        else                                            -- Ninth pass, update IP & CS
                            second_pass_s   <= '0';                     -- clear
                            path_s.dbus_output  <= IPBUS_OUT;           --{eabus(0)&} domux setting
                            path_s.datareg_input<= DONTCARE(2 downto 0)& '1' &DONTCARE(2 downto 0); -- dimux & w & seldreg
                            flush_req_s     <= '1';                     -- Flush Prefetch queue, asserted during execute cycle
                            path_s.ea_output<=NB_CS_IP;                 -- dispmux & eamux & segop 
                            next_state      <= Sexecute;
                        end if; 
                                                                            
                    end if;     

                ---------------------------------------------------------------------------------
                -- IRET, Interrupt Return
                -- IP <=MEM(SS:SP)
                -- SP<=SP+2
                -- CS<=MEM(SS:SP)
                -- SP<=SP+2
                -- FLAGS<=MEM(SS:SP)
                -- SP<=SP+2
                -- Flush
                ---------------------------------------------------------------------------------
                when IRET =>

                    flush_coming_s<= '1';                               -- signal to the BIU that a flush is coming, 
                                                                        -- this will stop the BIU from filling the queue.
                    path_s.datareg_input<= ALUBUS_IN & '1' & REG_SP(2 downto 0); -- dimux & w & seldreg
                    path_s.dbus_output  <= IPBUS_OUT;                   --{eabus(0)&} domux setting
                                                                        -- required to write to abusreg!!

                    if (second_pass='0') then                           -- first pass  IP<=MEM(SS:SP)
                        second_pass_s   <= '1';                         
                        path_s.ea_output<=LD_SS_SP&DONTCARE(2 downto 0);-- dispmux & eamux & segop, POP IP, SS:SP                              
                        passcnt_s       <= X"04";                     -- 4 cycles
                        wrpath_s.wrip   <= '1';                         -- Update IP+nbreq register
                        next_state      <= Sreadmem;                    -- Read Stack
                    else                                                
                        passcnt_s       <= passcnt - '1';               

                        if (passcnt=X"04") then                       -- Second pass Mem SP=SP+2
                            second_pass_s   <= '1';
                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr                                                                            
                            path_s.ea_output<= DONTCARE(9 downto 0);    -- dispmux & eamux & segop, ADDR=SS:SP
                            wrpath_s.wrd    <= '1';                     -- Update SP                                
                            next_state      <= Sdecode;

                        elsif (passcnt=X"03") then                    -- Third pass, get CS from SS:SP 
                            second_pass_s   <= '1'; 
                            path_s.segreg_input <= SMDBUS_IN & CS_IN(1 downto 0); -- simux & selsreg                        
                            path_s.ea_output<= NB_SS_SP & DONTCARE(2 downto 0);-- ADDR=SS:SP
                            wrpath_s.wrs    <= '1';                     -- update cs
                            next_state      <= Sreadmem;                -- start write cycle, MEM(SP)<=CS

                        elsif (passcnt=X"02") then                    -- SP=SP+2
                            second_pass_s   <= '1';                     
                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr
                            wrpath_s.wrd    <= '1';                     -- Update SP
                            path_s.ea_output<= IPB_CS_IP;               -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            next_state      <= Sdecode;

                        elsif (passcnt=X"01") then                    -- get FLAGS from memory
                            second_pass_s   <= '1';                                                 
                            path_s.alu_operation<= REG_MDBUS & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr                                                                                
                            path_s.ea_output    <= NB_SS_SP &DONTCARE(2 downto 0); -- SS:SP+2                       
                            wrpath_s.wrcc   <= '1';                     -- Update FLAGS register
                            next_state      <= Sreadmem;

                        else                                            -- Final pass, SP<=SP+2
                            second_pass_s   <= '0';                     -- clear
                            path_s.alu_operation<= REG_SP & REG_CONST2 & ALU_POP;-- selalua(4) & selalub(4) & aluopr
                            wrpath_s.wrd    <= '1';                     -- Update SP
                            flush_req_s     <= '1';                     -- Flush Prefetch queue, asserted during execute cycle
                            path_s.ea_output<=NB_CS_IP;                 -- select CS:IP for Flush;"100000000";-- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd    <= '1';                     -- Update SPReg
                            next_state      <= Sexecute;
                        end if; 

                    end if; 

                ---------------------------------------------------------------------------------
                -- Load String
                -- AL/AX<=DS:[SI] SI++/--
                -- if REP flag is set, then CX-1, check ZF,
                -- for REP  if zf=1 then exit
                -- for REPZ if zf=0 then exit
                -- NOTE: Debug does not seem to be able to handle this instruction on REPZ
                -- To be compatable Z flag checking is removed, thus only depended on CX
                ---------------------------------------------------------------------------------
                when LODSB | LODSW =>    

                    if (second_pass='0') then                           -- First pass, load AL/AX<=DS:[SI]
                        passcnt_s       <= X"01";                     -- jump to extra pass 1 (skip 10 first round)

                        path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & REG_AX(2 downto 0); -- dimux & w & seldreg
                        path_s.alu_operation<= DONTCARE(14 downto 0);   -- selalua(4) & selalub(4) & aluopr(7)                                                      
                                                                        -- DS:[SI]
                        if (rep_flag='1' and status.cx_zero='1') then   -- if CX=0 then skip instruction
                            second_pass_s   <= '0';
                            rep_clear_s     <= '1';                     -- Clear Repeat flag
                            path_s.ea_output<=NB_CS_IP;
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register
                            next_state      <= Sexecute;
                        else    
                            second_pass_s   <= '1';                     -- Need another pass
                            path_s.ea_output<="0001011001";             -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd    <= '1';                     -- Update AX
                            next_state      <= Sreadmem;                -- start read cycle 
                        end if;
                     else                                               
                                        
                        if (passcnt=X"02") then                       -- load al/ax<= DS:[SI]
                            second_pass_s   <= '1';                     -- Need another pass
                            passcnt_s       <= passcnt - '1';
                            path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & REG_AX(2 downto 0); -- dimux & w & seldreg
                            path_s.alu_operation<= DONTCARE(14 downto 0);-- selalua(4) & selalub(4) & aluopr(7)                                                     
                                                                        -- DS:[SI]
                            path_s.ea_output<="0001011001";             -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            
                            wrpath_s.wrd    <= '1';                     -- Update AX
                            next_state      <= Sreadmem;                -- start read cycle 

                        elsif (passcnt=X"01") then                    -- Second PASS update SI    
                            second_pass_s   <= '1';
                            passcnt_s       <= passcnt - '1';                       
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_SI(2 downto 0);-- dimux & w & seldreg

                            path_s.alu_operation<= REG_SI &     -- selalua(4) & selalub(4) & aluopr
                                REG_CONST1(3 downto 2)&instr.ireg(0)&(not instr.ireg(0))&   -- w selects 1 or 2
                                ALU_INC(6 downto 1)&status.flag(10);    -- df flag select inc/dec                                                       
                            
                            path_s.ea_output<=NB_CS_IP;                 -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                        
                            wrpath_s.wrd    <= '1';                     -- Update SI
                            if rep_flag='1' then                        -- If repeat set, check CX-1
                                second_pass_s   <= '1';
                                next_state      <= Sdecode;
                            else                                        -- no repeat end cycle
                                second_pass_s   <= '0';
                                wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register
                                next_state      <= Sexecute;
                            end if;
                         else                                           -- third pass (only when rep_flag=1) CX-1 
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_CX(2 downto 0);-- dimux & w & seldreg
                            path_s.alu_operation<= REG_CX & REG_CONST1 & ALU_DEC;   -- selalua(4) & selalub(4) & aluopr
                            path_s.ea_output    <= NB_CS_IP;            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd        <= '1';                 -- Update CX
                            --if (status.cx_one='1' or rep_zl_s/=status.flag(6)) then   -- quit on CX=1 or ZF=z_repeat_intr
                            if (status.cx_one='1') then        -- quit on CX=1 IGNORE ZFLAG!!!!
                                second_pass_s   <= '0';
                                rep_clear_s     <= '1';                 -- Clear Repeat flag
                                passcnt_s       <= passcnt - '1';       -- not required, change to DONTCARE???????????????????????????????
                                wrpath_s.wrip   <= '1';
                                next_state      <= Sexecute;
                            else
                                second_pass_s   <= '1';
                                passcnt_s       <= X"02";             -- Next another read mem pass
                                next_state      <= Sdecode;
                            end if;
                         end if;
                     end if;    


                 ---------------------------------------------------------------------------------
                 -- Store String
                 -- ES:[DI] <=AL/AX DI++/--
                 -- if REP/REPZ then repeat on CX value only!
                 ---------------------------------------------------------------------------------
                 when STOSB | STOSW =>   

                    if (second_pass='0') then                           -- First pass, load ES:[DI]<=AL/AX
                        passcnt_s       <= X"01";                     -- jump to extra pass 1 (skip 10 first round)
                        
                        path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0);-- dimux & w & seldreg
                        path_s.alu_operation<= REG_AX&DONTCARE(3 downto 0)&ALU_PASSA;-- selalua(4) & selalub(4) & aluopr(7)                                                      
                        path_s.dbus_output  <= ALUBUS_OUT;              --{eabus(0)&} domux setting   
                        
                        if (rep_flag='1' and status.cx_zero='1') then   -- if CX=0 then skip instruction
                            second_pass_s   <= '0';
                            rep_clear_s     <= '1';                     -- Clear Repeat flag
                            path_s.ea_output<=NB_CS_IP;
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register
                            next_state      <= Sexecute;
                        else    
                            second_pass_s   <= '1';                     -- Need another pass
                            path_s.ea_output<="0001000001";             -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            next_state      <= Swritemem;               -- start write cycle
                        end if;
                            
                    else                                                
                      
                        if (passcnt=X"02") then                       -- load ES:[DI]<=AL/AX
                            second_pass_s   <= '1';                     -- Need another pass
                            passcnt_s       <= passcnt - '1';

                            path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0);-- dimux & w & seldreg
                            path_s.alu_operation<= REG_AX&DONTCARE(3 downto 0)&ALU_PASSA;-- selalua(4) & selalub(4) & aluopr(7)                                                      
                            path_s.dbus_output  <= ALUBUS_OUT;              --{eabus(0)&} domux setting   

                            path_s.ea_output<="0001000001";             -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            next_state      <= Swritemem;               -- start write cycle

                        elsif (passcnt=X"01") then                    -- Second PASS update DI    
                            second_pass_s   <= '1';
                            passcnt_s       <= passcnt - '1';                       
                                          
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_DI(2 downto 0);-- dimux & w & seldreg

                            path_s.alu_operation<= REG_DI &             -- selalua(4) & selalub(4) & aluopr
                                REG_CONST1(3 downto 2)&instr.ireg(0)&(not instr.ireg(0))&   -- w selects 1 or 2
                                ALU_INC(6 downto 1)&status.flag(10);    -- df flag select inc/dec                                                       
                            
                            path_s.ea_output<=NB_CS_IP;                 -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd  <= '1';                       -- Update DI

                            if rep_flag='1' then                        -- If repeat set, check CX-1
                                second_pass_s   <= '1';
                                next_state      <= Sdecode;
                            else                                        -- no repeat end cycle
                                second_pass_s   <= '0';
                                wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register
                                next_state      <= Sexecute;
                            end if;
                        else                                            -- third pass (only when rep_flag=1) CX-1 
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_CX(2 downto 0);-- dimux & w & seldreg
                            path_s.alu_operation<= REG_CX & REG_CONST1 & ALU_DEC;   -- selalua(4) & selalub(4) & aluopr
                            path_s.ea_output    <= NB_CS_IP;            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd        <= '1';                 -- Update CX
                         
                            --if (status.cx_one='1' or rep_zl_s/=status.flag(6)) then   -- quit on CX=1 or ZF=z_repeat_intr
                            if (status.cx_one='1') then        -- quit on CX=1 IGNORE ZFLAG!!!!
                                second_pass_s   <= '0';
                                rep_clear_s     <= '1';                 -- Clear Repeat flag
                                passcnt_s       <= passcnt - '1';       -- not required, change to DONTCARE???????????????????????????????
                                wrpath_s.wrip   <= '1';
                                next_state      <= Sexecute;
                            else
                                second_pass_s   <= '1';
                                passcnt_s       <= X"02";             -- Next another read mem pass
                                next_state      <= Sdecode;
                            end if;
                        end if;
                    end if;
                        
                ---------------------------------------------------------------------------------
                -- MOV String
                -- ES:[DI] <=SEG:[SI], SEG default to DS
                -- DI++/-- ,SI++/--
                ---------------------------------------------------------------------------------
                when MOVSB | MOVSW =>    

                    if (second_pass='0') then                           -- First pass, load ALUREG<=SEG:[SI]
                        passcnt_s       <= X"03";                     -- Jump to state 3

                        path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  
                        -- Load memory into ALUREG                          
                        path_s.alu_operation<= DONTCARE(3 downto 0) & REG_MDBUS &  ALU_REGL; -- selalua(4) & selalub(4) & aluopr(7)                            
                        wrpath_s.wralu      <= '1';                     -- Don't care if instruction is not executed

                        if (rep_flag='1' and status.cx_zero='1') then   -- if CX=0 then skip instruction
                            second_pass_s   <= '0';
                            rep_clear_s     <= '1';                     -- Clear Repeat flag
                            path_s.ea_output<=NB_CS_IP;
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register
                            next_state      <= Sexecute;
                        else    
                            second_pass_s   <= '1';                     -- Need another pass
                            path_s.ea_output<="0001011001";             -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            next_state  <= Sreadmem;                    -- start read cycle 
                        end if;

                     else                                               
                                            
                        if (passcnt=X"04") then                       -- Same operation as second_pass=0, load ALUREG<=SEG:[SI]   
                            second_pass_s   <= '1';                     -- Need another pass
                            passcnt_s       <= passcnt - '1';   
                            
                            path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  
                            -- Load memory into ALUREG                          
                            path_s.alu_operation<= DONTCARE(3 downto 0) & REG_MDBUS &  ALU_REGL; -- selalua(4) & selalub(4) & aluopr(7)                            
                            wrpath_s.wralu      <= '1';                     -- Don't care if instruction is not executed

                            path_s.ea_output<="0001011001";             -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            next_state  <= Sreadmem;                    -- start read cycle 

                        elsif (passcnt=X"03") then                    -- second pass write ALUREG to ES:DI
                            second_pass_s   <= '1';     
                            passcnt_s       <= passcnt - '1';   
                            
                            path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0);-- dimux & w & seldreg

                            path_s.alu_operation<= DONTCARE(7 downto 0)&ALU_REGL;-- selalua(4) & selalub(4) & aluopr(7) ALUREG=>output                                                     
                            path_s.dbus_output  <= ALUBUS_OUT;          --{eabus(0)&} domux setting   
                                                                        -- ES:[DI]
                            path_s.ea_output<="0001000101";             -- dispmux(3) & eamux(4) & dis_opflag=1 & segop[1:0]
                                                        
                            next_state      <= Swritemem;               -- start write cycle    
                                                
                        elsif (passcnt=X"02") then                    -- Next update DI
                            second_pass_s   <= '1';                                                 
                            passcnt_s       <= passcnt - '1';   
                            
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_DI(2 downto 0);-- dimux & w & seldreg
    
                            path_s.alu_operation<= REG_DI &             -- selalua(4) & selalub(4) & aluopr
                                REG_CONST1(3 downto 2)&instr.ireg(0)&(not instr.ireg(0))&   -- w selects 1 or 2
                                ALU_INC(6 downto 1)&status.flag(10);    -- df flag select inc/dec                                                       
                            
                            path_s.ea_output<=DONTCARE(9 downto 0);     -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            
                            wrpath_s.wrd    <= '1';                     -- Update DI
                            next_state      <= Sdecode;

                        elsif (passcnt=X"01") then                    -- Final pass if no repeat update SI
                            second_pass_s   <= '0';                     -- clear
                            passcnt_s       <= passcnt - '1';   
                            
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_SI(2 downto 0);-- dimux & w & seldreg
    
                            path_s.alu_operation<= REG_SI &     -- selalua(4) & selalub(4) & aluopr
                                REG_CONST1(3 downto 2)&instr.ireg(0)&(not instr.ireg(0))&   -- w selects 1 or 2
                                ALU_INC(6 downto 1)&status.flag(10);    -- df flag select inc/dec                                                       
                            
                            path_s.ea_output<=NB_CS_IP;                 -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                        
                            wrpath_s.wrd  <= '1';                       -- Update SI

                            if rep_flag='1' then                        -- If repeat set, check CX-1
                                second_pass_s   <= '1';
                                next_state      <= Sdecode;
                            else                                        -- no repeat end cycle
                                second_pass_s   <= '0';
                                wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register
                                next_state      <= Sexecute;
                            end if;

                        else                                            -- third pass (only when rep_flag=1) CX-1 
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_CX(2 downto 0);-- dimux & w & seldreg
                            path_s.alu_operation<= REG_CX & REG_CONST1 & ALU_DEC;   -- selalua(4) & selalub(4) & aluopr
                            path_s.ea_output    <= NB_CS_IP;            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd        <= '1';                 -- Update CX
                         
                            if (status.cx_one='1') then        -- quit on CX=1 IGNORE ZFLAG!!!!
                                second_pass_s   <= '0';
                                rep_clear_s     <= '1';                 -- Clear Repeat flag
                                passcnt_s       <= passcnt - '1';       -- not required, change to DONTCARE???????????????????????????????
                                wrpath_s.wrip   <= '1';
                                next_state      <= Sexecute;
                            else
                                second_pass_s   <= '1';
                                passcnt_s       <= X"04";             -- Next another R/W mem pass
                                next_state      <= Sdecode;
                            end if;

                        end if; 

                     end if;    

                 ---------------------------------------------------------------------------------
                 -- CMPS Destination, source
                 --    note source    - destination
                 --         SEGM:[SI] - ES:[DI]
                 --
                 -- SEGM defaults to DS, can be overwritten
                 -- Destination is ALWAYS ES:[DI] (dis_opflag is asserted during the read cycle)
                 -- DI++/--, SI++/-- 
                 -- Note no signextend on operands (compared to the CMP instruction)
                 ---------------------------------------------------------------------------------
                 when CMPSB | CMPSW =>    
 
                     if (second_pass='0') then                           -- First pass, load ALUREG<=ES:[DI] (fixed!)
                         passcnt_s <= X"03";                           -- Jump to state 3
 
                         path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  
                         -- Load memory into ALUREG                          
                         path_s.alu_operation<= DONTCARE(3 downto 0) & REG_MDBUS &  ALU_REGL; -- selalua(4) & selalub(4) & aluopr(7)                            
                         wrpath_s.wralu      <= '1';                     -- Don't care if instruction is not executed
 
                         if (rep_flag='1' and status.cx_zero='1') then   -- if CX=0 then skip instruction
                             second_pass_s   <= '0';
                             rep_clear_s     <= '1';                     -- Clear Repeat flag
                             path_s.ea_output<=NB_CS_IP;
                             wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register
                             next_state      <= Sexecute;
                         else    
                             second_pass_s   <= '1';                     -- Need another pass, note dis_opflag=1
                             path_s.ea_output<="0001000101";             -- dispmux(3) & eamux(4) & dis_opflag=1 & segop[1:0]
                             next_state  <= Sreadmem;                    -- start read cycle 
                         end if;
 
                      else                                               
                                             
                         if (passcnt=X"04") then                      -- Same operation as second_pass=0, load ALUREG<=SEG:[SI]   
                             second_pass_s   <= '1';                     -- Need another pass
                             passcnt_s       <= passcnt - '1';   
                             
                             path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  
                                 -- for CMPS load memory into ALUREG                         
                             path_s.alu_operation<= DONTCARE(3 downto 0) & REG_MDBUS &  ALU_REGL; -- selalua(4) & selalub(4) & aluopr(7)                            
                             path_s.ea_output<="0001000101";            -- dispmux(3) & eamux(4) & dis_opflag=1 & segop[1:0]
                             wrpath_s.wralu      <= '1';                 
 
                             next_state      <= Sreadmem;               -- start read cycle 
 
                         elsif (passcnt="0011") then                    -- second pass read SEG:[SI], ALUREG-SEG:[SI]
                             second_pass_s   <= '1';     
                             passcnt_s       <= passcnt - '1';   
                             
                             path_s.datareg_input<= DONTCARE(2 downto 0) & instr.ireg(0) & DONTCARE(2 downto 0);-- dimux & w & seldreg
 
                             path_s.alu_operation<= REG_MDBUS & DONTCARE(3 downto 0)&ALU_CMPS;-- selalua(4) & selalub(4) & aluopr(7) ALUREG=>output
                                                                         -- ES:[DI]
                             path_s.ea_output<="0001011001";             -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]                          
                             wrpath_s.wrcc   <= '1';                     -- update flag register
                             next_state      <= Sreadmem;
                                                 
                         elsif (passcnt=X"02") then                   -- Next update DI
                             second_pass_s   <= '1';                                                 
                             passcnt_s       <= passcnt - '1';   
                             
                             path_s.datareg_input<= ALUBUS_IN & '1' & REG_DI(2 downto 0);-- dimux & w & seldreg
     
                             path_s.alu_operation<= REG_DI &             -- selalua(4) & selalub(4) & aluopr
                                 REG_CONST1(3 downto 2)&instr.ireg(0)&(not instr.ireg(0))&   -- w selects 1 or 2
                                 ALU_INC(6 downto 1)&status.flag(10);    -- df flag select inc/dec                                                       
                             
                             path_s.ea_output<=DONTCARE(9 downto 0);     -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                             
                             wrpath_s.wrd    <= '1';                     -- Update DI
                             next_state      <= Sdecode;
 
                         elsif (passcnt=X"01") then                   -- Final pass if no repeat update SI
                             passcnt_s       <= passcnt - '1';   
                             
                             path_s.datareg_input<= ALUBUS_IN & '1' & REG_SI(2 downto 0);-- dimux & w & seldreg
     
                             path_s.alu_operation<= REG_SI &     -- selalua(4) & selalub(4) & aluopr
                                 REG_CONST1(3 downto 2)&instr.ireg(0)&(not instr.ireg(0))&   -- w selects 1 or 2
                                 ALU_INC(6 downto 1)&status.flag(10);    -- df flag select inc/dec                                                       
                             
                             path_s.ea_output<=NB_CS_IP;                 -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                             wrpath_s.wrd  <= '1';                       -- yes, then update SI
 
                             if rep_flag='1' then                        -- If repeat set, check CX-1
                                 second_pass_s   <= '1';
                                 next_state      <= Sdecode;
                             else                                        -- no repeat end cycle
                                 second_pass_s   <= '0';
                                 wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register
                                 next_state      <= Sexecute;
                             end if;
 
                         else                                            -- third pass (only when rep_flag=1) CX-1 
                             path_s.datareg_input<= ALUBUS_IN & '1' & REG_CX(2 downto 0);-- dimux & w & seldreg
                             path_s.alu_operation<= REG_CX & REG_CONST1 & ALU_DEC;   -- selalua(4) & selalub(4) & aluopr
                             path_s.ea_output    <= NB_CS_IP;            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                             wrpath_s.wrd        <= '1';                 -- Update CX
                          
                             if (status.cx_one='1' or rep_zl_s/=status.flag(6)) then -- quit on CX=1 or ZF=z_repeat_intr
                                 second_pass_s   <= '0';
                                 rep_clear_s     <= '1';                 -- Clear Repeat flag
                                 passcnt_s       <= passcnt - '1';       -- not required, change to DONTCARE?
                                 wrpath_s.wrip   <= '1';
                                 next_state      <= Sexecute;
                             else
                                 second_pass_s   <= '1';
                                 passcnt_s       <= X"04";             -- Next another R/W mem pass
                                 next_state      <= Sdecode;
                             end if;
 
                         end if; 
 
                      end if;    

                ---------------------------------------------------------------------------------
                -- SCAS
                -- SCAS -> AX/AL-ES[DI]
                -- DI++/-- 
                -- Note no signextend on operands (compared to the CMP instruction)
                ---------------------------------------------------------------------------------
                when SCASB | SCASW =>   
                    
                    if (second_pass='0') then                           -- First pass, AX-ES:[DI]
                        passcnt_s       <= X"01";                     -- Jump to state 1
    
                        path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  
                        path_s.alu_operation<= REG_AX & REG_MDBUS &  ALU_SCAS; -- selalua(4) & selalub(4) & aluopr(7)                           
    
                        if (rep_flag='1' and status.cx_zero='1') then   -- if CX=0 then skip instruction
                            second_pass_s   <= '0';
                            rep_clear_s     <= '1';                     -- Clear Repeat flag
                            path_s.ea_output<= NB_CS_IP;
                            wrpath_s.wrip   <= '1';                     -- Update IP+nbreq register
                            next_state      <= Sexecute;
                        else    
                            second_pass_s   <= '1';                     -- Need another pass
                            path_s.ea_output<= "0001000001";            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrcc   <= '1';                     -- update flag register
                            next_state      <= Sreadmem;                -- start read cycle 
                        end if;
    
                     else                                               
                                            
                        if (passcnt=X"02") then                       -- Same operation as second_pass=0, AX/AL-SEG:[SI]  
                            second_pass_s   <= '1';                     -- Need another pass
                            passcnt_s       <= passcnt - '1';   
                            
                            path_s.datareg_input<= MDBUS_IN & instr.ireg(0) & DONTCARE(2 downto 0); -- dimux & w & seldreg  
                            path_s.alu_operation<= REG_AX & REG_MDBUS &  ALU_SCAS; -- selalua(4) & selalub(4) & aluopr(7)                           
        
                            path_s.ea_output<= "0001000001";            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrcc   <= '1';                     -- update flag register
                            next_state      <= Sreadmem;                -- start read cycle
                                                                                    
                        elsif (passcnt=X"01") then                    -- Final pass if no repeat update DI
                            second_pass_s   <= '0';                     -- clear
                            passcnt_s       <= passcnt - '1';   
                            
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_DI(2 downto 0);-- dimux & w & seldreg
        
                            path_s.alu_operation<= REG_DI &             -- selalua(4) & selalub(4) & aluopr
                                REG_CONST1(3 downto 2)&instr.ireg(0)&(not instr.ireg(0))&   -- w selects 1 or 2
                                ALU_INC(6 downto 1)&status.flag(10);    -- df flag select inc/dec                                                       
                            
                            path_s.ea_output<=NB_CS_IP;                 -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                        
                            wrpath_s.wrd  <= '1';                   -- yes, then update DI
    
                            if rep_flag='1' then                        -- If repeat set, check CX-1
                                second_pass_s   <= '1';
                                next_state      <= Sdecode;
                            else                                        -- no repeat end cycle
                                second_pass_s   <= '0';
                                wrpath_s.wrip   <= '1';                 -- Update IP+nbreq register
                                next_state      <= Sexecute;
                            end if;
    
                        else                                            -- third pass (only when rep_flag=1) CX-1 
                            path_s.datareg_input<= ALUBUS_IN & '1' & REG_CX(2 downto 0);-- dimux & w & seldreg
                            path_s.alu_operation<= REG_CX & REG_CONST1 & ALU_DEC;   -- selalua(4) & selalub(4) & aluopr
                            path_s.ea_output    <= NB_CS_IP;            -- dispmux(3) & eamux(4) & dis_opflag & segop[1:0]
                            wrpath_s.wrd        <= '1';                 -- Update CX
                         
                            if (status.cx_one='1' or rep_zl_s/=status.flag(6)) then -- quit on CX=1 or ZF=z_repeat_intr
                                second_pass_s   <= '0';
                                rep_clear_s     <= '1';                 -- Clear Repeat flag
                                passcnt_s       <= passcnt - '1';       -- not required, change to DONTCARE???????????????????????????????
                                wrpath_s.wrip   <= '1';
                                next_state      <= Sexecute;
                            else
                                second_pass_s   <= '1';
                                passcnt_s       <= X"02";             -- Next another Read mem pass
                                next_state      <= Sdecode;
                            end if;
    
                        end if; 
    
                     end if;    

                
                ---------------------------------------------------------------------------------
                -- REP/REPz Instruction
                -- Set REPEAT Flag
                ---------------------------------------------------------------------------------
                when REPNE | REPE =>     
                    
                    irq_blocked_s   <= '1';                             -- Block IRQ if asserted during next instr.
                    second_pass_s   <= '0'; 
                    rep_set_s       <= '1'; 
                    rep_z_s         <= instr.ireg(0);                   -- REPNE or REPE     
                    path_s.ea_output<= NB_CS_IP;                     
                    wrpath_s.wrip   <= '1';                             -- Update IP+nbreq register
                    next_state      <= Sexecute;

                ---------------------------------------------------------------------------------
                -- Conditional Jump
                ---------------------------------------------------------------------------------
                when JZ | JL | JLE | JB | JBE| JP | JO | JS | JNE | JNL | JNLE | JNB| JNBE | JNP | JNO | JNS =>
                                
                    second_pass_s <= '0';
                     
                    if (((instr.ireg(3 downto 0)="0000") and (status.flag(11)='1')) or      -- Jump on Overflow (OF=1)
                        ((instr.ireg(3 downto 0)="0001") and (status.flag(11)='0')) or      -- Jump on not overflow (OF=0) 
                        ((instr.ireg(3 downto 0)="0010") and (status.flag(0)='1'))  or      -- Jump on Below (CF=1)
                        ((instr.ireg(3 downto 0)="0011") and (status.flag(0)='0'))  or      -- Jump on not below (CF=0) 
                        ((instr.ireg(3 downto 0)="0100") and (status.flag(6)='1'))  or      -- Jump on Zero ZF=1; 
                        ((instr.ireg(3 downto 0)="0101") and (status.flag(6)='0'))  or      -- Jump on not zero ZF=0
                        ((instr.ireg(3 downto 0)="0110") and (status.flag(0)='1' or status.flag(6)='1')) or -- JBE, Jump on below or equal CF or ZF=1
                        ((instr.ireg(3 downto 0)="0111") and (status.flag(0)='0' and status.flag(6)='0')) or -- JNBE, Jump on not below or equal CF&ZF=0 
                        ((instr.ireg(3 downto 0)="1000") and (status.flag(7)='1'))  or      -- JS, Jump on ZF=1
                        ((instr.ireg(3 downto 0)="1001") and (status.flag(7)='0'))  or      -- JNS, Jump on ZF=0
                        ((instr.ireg(3 downto 0)="1010") and (status.flag(2)='1'))  or      -- JP, Jump on Parity PF=1
                        ((instr.ireg(3 downto 0)="1011") and (status.flag(2)='0'))  or      -- JNP, Jump on not parity PF=0
                        ((instr.ireg(3 downto 0)="1100") and (status.flag(7)/=status.flag(11)))  or  -- JL, Jump on less or equal SF!=OF 
                        ((instr.ireg(3 downto 0)="1101") and (status.flag(7)=status.flag(11)))  or    -- JNL, Jump on not less, SF=OF 
                        ((instr.ireg(3 downto 0)="1110") and ((status.flag(7)/=status.flag(11)) or status.flag(6)='1')) or -- JLE, Jump on less or equal 
                        ((instr.ireg(3 downto 0)="1111") and ((status.flag(7)=status.flag(11)) and status.flag(6)='0'))) -- JNLE, Jump on not less or equal SF=OF & zf=0
                        then                                    
                        flush_req_s <= '1';                             -- Flush Prefetch queue, asserted during execute cycle
                        path_s.ea_output <= DISP_CS_IP;                 -- CS: IPREG+DISPL
                    else    
                        path_s.ea_output <= NB_CS_IP;                   -- IPREG+NB ADDR=CS:IP
                    end if;     
                                                                                                    
                    wrpath_s.wrip       <= '1';                         -- Update IP+nbreq register
                    next_state <= Sexecute;

                when others => 
                    proc_error_s<='1';                                  -- Assert Bus Error Signal

                    wrpath_s.wrip   <= '1';                             -- Update IP+nbreq register
                    path_s.ea_output<= NB_CS_IP;                        -- Go to next opcode
                    next_state      <= Sexecute;                        -- Ignore opcode, fetch next one

                    -- pragma synthesis_off
                    assert not (now > 0 ns) report "**** Unknown Instruction to decode (proc)  ***" severity warning;
                    -- pragma synthesis_on

            end case;

        ----------------------------------------------------------------------------
        -- Get Operand/Data from Memory
        -- if second_pass=0 then execute else go for second pass
        ----------------------------------------------------------------------------
        when Sreadmem =>       
            read_req <= '1';                                            -- Request Read Cycle

            if  rw_ack='1' then                                         -- read cycle completed?
                if second_pass='0' then
                    next_state <= Sexecute;                             -- execute instruction
                else 
                    next_state <= Sdecode;                              -- second pass  
                end if;
            else
                next_state <= Sreadmem;                                 -- Wait ack from BIU
            end if;
             
        ----------------------------------------------------------------------------
        -- Write Data to Memory
        -- if second_pass=0 then execute else go for second pass
        ----------------------------------------------------------------------------
        when Swritemem =>         
            write_req <= '1';                                           -- Request Write Cycle
            
            if  rw_ack='1' then                                         -- read cycle completed?
                if second_pass='0' then
                    next_state <= Sexecute;                             -- execute instruction
                else 
                    next_state <= Sdecode;                              -- second pass 
                end if;
            else
                next_state <= Swritemem;                                -- Wait ack from BIU
            end if;
       
        ----------------------------------------------------------------------------
        -- Execute 
        -- wrpath get wrpathl_s signal
        ----------------------------------------------------------------------------
        when Sexecute => 

            wrpath  <= wrpathl_s;                                       -- Assert write strobe(s)
            iomem_s <= '0';                                             -- Clear IOMEM cycle

            -- Do not clear if REP or LOCK is used as a prefix
            if ((instr.ireg/=SEGOPES) and (instr.ireg/=SEGOPCS) and (instr.ireg/=SEGOPSS) and 
                (instr.ireg/=SEGOPDS) and (instr.ireg/=REPNE) and 
                (instr.ireg/=REPE)) then
                clrop   <= '1';                                         -- clear Segment Override Flag  
            end if;

            if instr.ireg=HLT then                                      -- If instr=HLT then wait for interrupt
                next_state <= Shalt;
            elsif (flush_reql_s='1' AND flush_ack='1') then             -- Flush Request & ACK 
                next_state <= Sopcode;
            elsif (flush_reql_s='1' AND flush_ack='0') then             -- Flush request and no ack yet
                flush_req_s <= '1';
                next_state <= Sflush;                                   -- wait for ack flush
            else
                next_state <= Sopcode;
            end if;


        ----------------------------------------------------------------------------
        -- Flush State, wait until flush_ack is asserted
        ----------------------------------------------------------------------------
        when Sflush =>

            if flush_ack='0' then
                flush_req_s <= '1';                                     -- Continue asserting flush req
                next_state <= Sflush;                                   -- Wait until req is removed
            else
                next_state <= Sopcode;                                  -- Next Opcode
            end if;

        when Shalt =>
            if irq_req='1' then
                next_state <= Sopcode;                                  -- Next Opcode
            else
                next_state <= Shalt;                                    -- wait for interrupt
            end if;

        when others => 
            next_state <= Sopcode;

      end case;
   end process nextstate;

end rtl;
