-- Copyright (c) 2015, $ME
-- All rights reserved.
--
-- Redistribution and use in source and synthezised forms, with or without modification, are permitted 
-- provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions 
--    and the following disclaimer.
--
-- 2. Redistributions in synthezised form must reproduce the above copyright notice, this list of conditions
--    and the following disclaimer in the documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
-- WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR 
-- ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
--
--
-- implementation of a z80 pio port
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity pio_port is
    port (
        clk   : in std_logic;
        res_n : in std_logic;
        en    : in std_logic;
        
        dIn   : in std_logic_vector(7 downto 0);
        dOut  : out std_logic_vector(7 downto 0);
        
        cdSel : in std_logic;
        m1_n  : in std_logic;
        iorq_n : in std_logic;
        rd_n  : in std_logic;

        int   : out std_logic;
        intAck : in std_logic;
        
        pIn   : in std_logic_vector(7 downto 0);
        pOut  : out std_logic_vector(7 downto 0);
        pRdy  : out std_logic;
        pStb  : in std_logic
    );
end pio_port;

architecture rtl of pio_port is
    type states is (default, setPortMask, setIrqMask);
    signal state    : states := default;
    signal nextState : states := default;
    
    signal mode     : std_logic_vector(1 downto 0) := "01";
    signal irqCtrl  : std_logic_vector(2 downto 0) := (others => '0');
    signal irqMask  : std_logic_vector(7 downto 0) := (others => '1');
    signal irqVect  : std_logic_vector(6 downto 0) := (others => '0');
    signal portMask : std_logic_vector(7 downto 0) := (others => '1'); -- 1=input / 0=output
    signal irqCond  : std_logic_vector(1 downto 0) := (others => '0');
    
    signal serviced : std_logic;
    
    signal pOutReg  : std_logic_vector(7 downto 0);
    
    signal stbDebounce : std_logic_vector(3 downto 0) := (others => '1');
    
begin
    -- TODO
    pRdy <= '0';
    
    -- stb debouncing
    strobe : process 
    begin
         wait until rising_edge(clk);
         
         stbDebounce <= stbDebounce(stbDebounce'left-1 downto 0) & pStb;
    end process;
    
    -- pio-dataout
    pio_dataout : process(pOutReg,mode,portMask,pIn)
    begin
        case mode is
            when "00" => pOut <= pOutReg;  -- Mode 0 (output)
            when "01" => pOut <= pOutReg;  -- Mode 1 (read) -- ToDo pullups
            when "10" => pOut <= pOutReg;  -- Mode 2 (bidir - ToDo)
            when "11" => pOut <= (pIn and portMask) or (pOutReg and not portMask); -- Mode 3 (control)
            when others => null;
        end case;
    end process;
    
    -- cpu-interface (data-out)
    cpu_dataout : process(mode, pIn, portMask, irqVect, pOutReg, intAck)
    begin
        if (intAck='1') then
            dOut <= irqVect & '0';
        else
            case mode is
                when "00" => dOut <= pOutReg; -- Mode 0 (output)
                when "01" => dOut <= pIn;     -- Mode 1 (input)
                when "10" => dOut <= pIn;     -- Mode 2 (bidir - ToDo)
                when "11" => dOut <= (pIn and portMask) or (pOutReg and not portMask); -- Mode 3 (control)
                when others => null;
            end case;
        end if;
    end process;

    -- irq handling
    irq : process
        variable nIrqMask : std_logic_vector(7 downto 0);
    begin
        wait until rising_edge(clk);
     
        nIrqMask := not(irqMask);
        
        int <= '0';
        -- reset
        if (mode="00" and irqCtrl(2)='1') then
            if (stbDebounce(stbDebounce'left downto stbDebounce'left-1)="01") then
                int <= '1';
            end if;
        elsif (mode="11" and irqCtrl(2)='1' and nIrqMask /= "00000000") then -- mode 3 + irq enabled
            -- check for int-condition
            irqCond(0) <= '0';
          
            case irqCtrl(1 downto 0) is
                when "00" =>  -- or + low
                    if ((pIn and nIrqMask) /= nIrqMask) then
                        irqCond(0) <= '1';
                    end if;
                when "01" =>  -- or + high
                    if ((pIn and nIrqMask) /= "00000000") then
                        irqCond(0) <= '1';
                    end if;
                when "10" =>  -- and + low
                    if ((pIn and nIrqMask) = "00000000") then
                        irqCond(0) <= '1';
                    end if;
                when "11" =>  -- and + high
                    if ((pIn and nIrqMask) = nIrqMask) then
                        irqCond(0) <= '1';
                    end if;
                when others => null;
            end case;
            
            irqCond(1) <= irqCond(0);

            if (irqCond="01") then
                int <= '1';
            end if;
        end if;
    end process;
    
    -- cpu-interface (data-in)
    cpu_control : process
    begin
        wait until rising_edge(clk);
        
        if (res_n='0') then
            mode <= "01";
            portMask <= (others => '1');
            nextState <= default;
        elsif (intAck='1') then
--            dOut <= irqVect & '0';
        elsif (en='1') then
            if (iorq_n='0' and m1_n='1') then
                -- Data ?
                if (cdSel='0') then
                    if (rd_n='1') then
                        -- write
                        pOutReg <= dIn;
                    else
                        -- read
--                        dOut <= input;
                    end if;
                else
                    -- Control ?
                    if (rd_n='1') then
                        -- write
                        nextState <= default;

                        case state is
                            when default =>
                                if (dIn(0)='0') then
                                    irqVect  <= dIn(7 downto 1);  -- IRQ-Vector
                                else
                                    case dIn(3 downto 0) is
                                        when "0011" => irqCtrl(2) <= dIn(7);  -- Interrupt Control Word (Flag only)
                                        when "0111" =>  -- Interrupt Control Word
                                            irqCtrl <= dIn(7 downto 5);
                                            if dIn(4)='1' then
                                                nextState <= setIrqMask; -- Mask follows
                                            end if;
                                        when "1111" => -- Operation Mode
                                            mode(1 downto 0) <= dIn(7 downto 6);
                                            if (dIn(7 downto 6)="11") then
                                                nextState <= setPortMask; -- Mode 3 (control)
                                            end if;
                                        when others => null;
                                    end case;
                                end if;    
                            when setPortMask => portMask <= dIn;
                            when setIrqMask  => irqMask <= dIn;
                        end case;
                    end if;
                end if;
            end if;
        else
            state <= nextState;
        end if;
    end process;
end; 

