--
--  JTAG (bitbanged) functions for JTAG/GHDL/OpenOCD integration
-- 
--  Copyright 2012 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use work.openocd_rbb.all;

entity jtag_openocd_rbb is
  port (
    TDI:  out std_logic;
    TMS:  out std_logic;
    TCK:  out std_logic;
    TDO:  in std_logic
  );
end entity jtag_openocd_rbb;

architecture behave of jtag_openocd_rbb is

begin

  process
    variable c: integer;
    variable data: std_logic_vector(7 downto 0);
    variable tx: integer;
  begin

    c := rbb_initialize;

    loop
      wait for 1 ns;
      if rbb_available > 0 then
        c := rbb_receive;
        if (c>=0) then
          data := conv_std_logic_vector(c,8);
          wait for 5 ns;
          -- Act upon
          case data is
          	when x"52" => -- Read request
              if TDO='1' then
                c := rbb_transmit(49);
              else
                c := rbb_transmit(48);
              end if;

	          when x"51" => -- Quit request
              c := rbb_close;

	          when x"30" => -- 0 - Write 0 0 0
              TCK <= '0'; TMS <= '0'; TDI <= '0';
            when x"31" => -- 1 - Write 0 0 1
              TCK <='0'; TMS <= '0';  TDI <= '1';
            when x"32" => -- 2 - Write 0 1 0
              TCK <= '0'; TMS <= '1'; TDI <= '0';
            when x"33" => -- 3 - Write 0 1 1
              TCK <= '0'; TMS <= '1'; TDI <= '1';
            when x"34" => -- 4 - Write 1 0 0
              TCK <= '1'; TMS <= '0'; TDI <= '0';
            when x"35" => -- 5 - Write 1 0 1
              TCK <= '1'; TMS <= '0'; TDI <= '1';
            when x"36" => -- 6 - Write 1 1 0
              TCK <= '1'; TMS <= '1'; TDI <= '0';
            when x"37" => -- 7 - Write 1 1 1
              TCK <= '1'; TMS <= '1'; TDI <= '1';
            when x"72" => -- r - Reset 0 0
              
            when x"73" => -- s - Reset 0 1
              
            when x"74" => -- t - Reset 1 0
              
            when x"75" => -- u - Reset 1 1

            when x"42" =>
            when x"62" =>

            when others =>
          end case;

        end if;
      end if;
    end loop;
  end process;

end behave;
