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
-- File:        fir_v1.vhd
-- Author:      Pascal Trotta (TestGroup research group - Politecnico di Torino)
-- Contacts:    pascal.trotta@polito.it www.testgroup.polito.it
-- Description: FIR filter core (version 1) -- for dprc demo
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

  type fsm_state is (idle, running);
  signal pstate, nstate : fsm_state;

  type sh_reg_type is array (0 to 8) of unsigned(7 downto 0);
  signal sh_reg, rsh_reg : sh_reg_type;

  type mul_type is array (0 to 9) of unsigned(15 downto 0);
  signal mul, rmul : mul_type;

  signal rout_data : std_logic_vector(21 downto 0);
  signal dcount, rdcount : std_logic_vector(8 downto 0);

  type coeffT is array (0 to 9) of unsigned(7 downto 0); 
  constant coeff : coeffT := (to_unsigned(21,8),to_unsigned(23,8),to_unsigned(21,8),to_unsigned(19,8),to_unsigned(13,8),to_unsigned(9,8),to_unsigned(13,8),to_unsigned(15,8),to_unsigned(21,8),to_unsigned(17,8));

begin

  comb: process(rsh_reg, rmul, start, pstate, rdcount, in_data)
   variable vsh_reg : sh_reg_type;
   variable vout_data : unsigned(21 downto 0);
   variable start_flag : std_ulogic;
   variable vdcount : std_logic_vector(8 downto 0);
  begin
 
    vdcount := rdcount;
    vout_data := to_unsigned(0,22);

    for i in 8 downto 1 loop
      vsh_reg(i) := rsh_reg(i-1);
    end loop;
    vsh_reg(0) := unsigned(in_data(7 downto 0));

    for i in 0 to 9 loop
      vout_data := vout_data + rmul(i);
    end loop;

    in_data_read <= '0';
    out_data_write <= '0';

    case pstate is
    
    when idle =>
     if start='1' then
       nstate <= running;
     else
       nstate <= idle;
       vdcount := (others=>'0');
     end if;
    
    when running =>
      if vdcount=std_logic_vector(to_unsigned(102,9)) then
        nstate<=idle;
        in_data_read <= '0';
      else
        nstate<=running;
        in_data_read <= '1';
      end if;
      if vdcount>=std_logic_vector(to_unsigned(12,9)) then --9+2latency
        out_data_write <= '1';
      end if;
 
    end case;

    if pstate/= idle then
      vdcount := vdcount+1;
    end if;

    sh_reg <= vsh_reg;
    rout_data(21 downto 0) <= std_logic_vector(vout_data);
    dcount <= vdcount;
  end process;
  
  reg: process(clk,rst)
  begin
    if (rst='1') then
      for i in 0 to 8 loop
        rsh_reg(i) <= (others=>'0');
      end loop;
      for i in 0 to 9 loop
        rmul(i) <= (others=>'0');
      end loop;
      out_data <= (others=>'0');
      rdcount <= (others=>'0');
      pstate <= idle;
    elsif rising_edge(clk) then
      rsh_reg <= sh_reg;
      rmul <= mul;
      out_data <= "0000000000"&rout_data;
      rdcount <= dcount;
      pstate <= nstate;
    end if;
  end process;

  mul_gen: for i in 1 to 9 generate
    mul(i) <= rsh_reg(i-1) * coeff(i);
  end generate;
  mul(0) <= unsigned(in_data(7 downto 0))*coeff(0);

end fir_rtl;
