------------------------------------------------------------------------------
-- Copyright (c) 2014, Pascal Trotta - Testgroup (Politecnico di Torino)
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without modification, 
-- are permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this 
--    list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright notice, this
--    list of conditions and the following disclaimer in the documentation and/or other 
--    materials provided with the distribution.
--
-- THIS SOURCE CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
-- MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
-- COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
-- GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
-- OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
-----------------------------------------------------------------------------
-- Entity:      fir
-- File:        fir_v2.vhd
-- Author:      Pascal Trotta (TestGroup research group - Politecnico di Torino)
-- Contacts:    pascal.trotta@polito.it www.testgroup.polito.it
-- Description: FIR filter core (version 2) -- for dprc demo
------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity fir is
  port (
    clk : in std_ulogic;
    rst : in std_ulogic;
    start : in std_ulogic;
    in_data : in std_logic_vector(31 downto 0);
    in_data_read : out std_ulogic;
    out_data : out std_logic_vector (31 downto 0);
    out_data_write : out std_ulogic);
end fir;

architecture fir_rtl of fir is

  type fsm_state is (idle, fill_sh, running, step);

  type sh_type is array (0 to 9) of unsigned(7 downto 0);

  type regs is record
    state : fsm_state;
    sh : sh_type;
    cdata : unsigned(8 downto 0);
    acc : unsigned(31 downto 0);
    citer : unsigned(4 downto 0);
    start : std_logic;
  end record;

  signal reg, reg_in : regs;

  type coeffT is array (0 to 9) of unsigned(7 downto 0); 
  constant coeff : coeffT := (to_unsigned(21,8),to_unsigned(23,8),to_unsigned(21,8),to_unsigned(19,8),to_unsigned(13,8),to_unsigned(9,8),to_unsigned(13,8),to_unsigned(15,8),to_unsigned(21,8),to_unsigned(17,8));

begin

  out_data <= std_logic_vector(reg.acc);

  comb_proc: process(reg, start, in_data)
   variable vreg : regs;
  begin
 
    vreg := reg;

    in_data_read <= '0';
    out_data_write <= '0';


    case vreg.state is
      when idle =>
        if vreg.start='1' then
          vreg.state := fill_sh;
          in_data_read <= '1';     
        end if;
        vreg.cdata := (others=>'0');
        vreg.acc := (others=>'0');
        vreg.citer := (others=>'0');
      
      when fill_sh =>
        if vreg.citer=9 then
          vreg.state := running;
          vreg.citer := (others=>'0');
        else
          in_data_read <= '1'; 
          vreg.citer := vreg.citer + 1;
        end if;
        for i in 9 downto 1 loop  --shift
            vreg.sh(i) := vreg.sh(i-1);
        end loop;
        vreg.sh(0) := unsigned(in_data(7 downto 0));

      when running =>
        if vreg.citer=9 then
          vreg.state := step;
          in_data_read <= '1';   
        end if;
        vreg.acc := vreg.acc + (vreg.sh(to_integer(vreg.citer))*coeff(to_integer(vreg.citer)));
        vreg.citer := vreg.citer + 1;
  
        
      when step =>
        if vreg.cdata=90 then
          vreg.state := idle;
        else
          vreg.state := running;
          vreg.cdata := vreg.cdata + 1;
          vreg.citer := (others=>'0');
          vreg.acc := (others=>'0');
          for i in 9 downto 1 loop  --shift
            vreg.sh(i) := vreg.sh(i-1);
          end loop;
          vreg.sh(0) := unsigned(in_data(7 downto 0));
        end if;
        out_data_write <= '1';
 
    end case;

    vreg.start := start;
    reg_in <= vreg;

  end process;
  
  reg_proc: process(clk,rst)
  begin
    if (rst='1') then
      reg.state <= idle;
      for i in 0 to 9 loop
        reg.sh(i) <= (others=>'0');
      end loop;
      reg.cdata <= (others=>'0');
      reg.acc <= (others=>'0');
      reg.citer <= (others=>'0');
      reg.start <= '0';
    elsif rising_edge(clk) then
      reg <= reg_in;
    end if;
  end process;

end fir_rtl;
