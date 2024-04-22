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
-- spi interface
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity spi is
    port (
        clk   : in std_logic;
        
        cs_n     : in std_logic; -- negative 
        wr_n     : in std_logic; -- negative
        
        addr     : in std_logic_vector(1 downto 0); 
        
        dIn      : in std_logic_vector(7 downto 0); 
        dOut     : out std_logic_vector(7 downto 0);
        
        spi_cs   : out std_logic;
        spi_clk  : out std_logic;
        spi_miso : in std_logic;
        spi_mosi : out std_logic
    );
end;

architecture rtl of spi is
    signal shift_reg : std_logic_vector(8 downto 0);
    signal divider   : integer range 0 to 255 := 0;
    signal divider_reg : integer range 0 to 255;
    signal cs_reg    : std_logic;
    signal bit_count : integer range 0 to 8 := 0;
    
    signal spi_clk_int : std_logic := '0';
begin
    
    spi_cs   <= cs_reg;
    spi_clk  <= spi_clk_int;
   
    -- read data-in or number of bits left
    dOut <= shift_reg(8 downto 1) when addr(0)='0' else std_logic_vector(to_unsigned(bit_count,dOut'length));
    
    process 
    begin
        wait until rising_edge(clk);
        
        if (bit_count > 0) then -- transmit data
            spi_mosi <= shift_reg(8);
            if (divider=0) then -- prescaler 0? then shift bit out
                divider <= divider_reg;
                
                if (spi_clk_int='1') then -- H --> L
                    shift_reg <= shift_reg(7 downto 0) & '0';
                    bit_count <= bit_count - 1;
                else -- L --> H
                    shift_reg(0) <= spi_miso;
                end if;
            
                spi_clk_int <= not spi_clk_int;
            else
                divider <= divider-1;
            end if;
        else 
            divider <= divider_reg;
        end if;
        
        if (cs_n='0' and wr_n='0') then
            case addr is
                when "00" => -- data-reg
                    if (bit_count=0) then
                        shift_reg <= dIn & '0';
                        bit_count <= 8; -- start transmitting
                    end if;
                when "10" => -- cs
                    cs_reg <= dIn(0);
                when "11" => -- divider
                    divider_reg <=  to_integer(unsigned(dIn));
                when others => null; -- "01" -> busy-flag (read only)
            end case;
        end if;
    end process;
end;
        
