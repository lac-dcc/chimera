-------------------------------------------------------------------------------
--
-- Title       : fp23_fix2float
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- Description : Signed fix 16 bit to float fp23 converter
--
-------------------------------------------------------------------------------
--
--  Version 1.0  25.05.2013
--               Description:
--                  Bus width for:
--                  din = 15
--                  dout = 23   
--                  exp = 6
--                  sign = 1
--                  mant = 15 + 1
--               Math expression: 
--                  A = (-1)^sign(A) * 2^(exp(A)-31) * mant(A)
--               NB:
--               1's complement
--               Converting from fixed to float takes only 9 clock cycles
--
--  MODES:  Mode0   : normal fix2float (1's complement data)
--          Mode1   : +1 fix2float for negative data (uncomment and 
--                  change this code a little: add a component 
--                  sp_addsub_m1 and some signals): 2's complement data.
--  
--
--  Version 1.1  15.01.2015
--               Description:
--                  Based on fp27_fix2float_m3 (FP27 FORMAT)
--                  New version of FP (Reduced fraction width)
--  
--  Version 1.2  18.03.2015
--               Description:
--                  Changed CE signal
--                  This version has ena. See OR5+OR5 stages
--
--  Version 1.3  24.03.2015
--               Description:
--                  Deleted ENABLE signal
--                  This version is fully pipelined !!!
--
--  Version 1.4  04.10.2015
--               Description:
--                  DSP48E1 has been removed. Barrel shift is used now.
--                  Delay 9 clocks
--                           
--  Version 1.5  04.01.2016
--               Description:
--                  New barrel shifter with minimum resources. 
--                  New FP format: FP24 -> FP23.
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--  GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--  Copyright (c) 2019 Kapitanov Alexander
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
--  APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT 
--  HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY 
--  OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, 
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
--  PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM 
--  IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF 
--  ALL NECESSARY SERVICING, REPAIR OR CORRECTION. 
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library work;
use work.fp_m1_pkg.fp23_data;
use work.reduce_pack.nor_reduce;

entity fp23_fix2float is
    port (
        din         : in  std_logic_vector(15 downto 0); --! Fixed input data
        ena         : in  std_logic;                     --! Data enable
        dout        : out fp23_data;                     --! Float output data
        vld         : out std_logic;                     --! Data out valid
        clk         : in  std_logic;                     --! Clock
        reset       : in  std_logic                      --! Negative Reset
    );
end fp23_fix2float;

architecture fp23_fix2float of fp23_fix2float is 

constant FP32_EXP       : std_logic_vector(5 downto 0):="011111";

signal true_form        : std_logic_vector(15 downto 0):=(others => '0');
signal norm             : std_logic_vector(15 downto 0); 
signal frac             : std_logic_vector(15 downto 0); 

signal set_zero         : std_logic;

signal sum_man          : std_logic_vector(15 downto 0);
signal msb_num          : std_logic_vector(4 downto 0);
signal msb_numn         : std_logic_vector(5 downto 0);

signal msb_numt         : std_logic_vector(4 downto 0);
signal msb_numz         : std_logic_vector(5 downto 0);
signal expc             : std_logic_vector(5 downto 0); -- (E - 127) by (IEEE754)

signal sign             : std_logic_vector(2 downto 0);
signal valid            : std_logic_vector(4 downto 0);

--signal dinz           : std_logic_vector(15 downto 0);
signal dinz             : std_logic_vector(15 downto 0);
signal dinh             : std_logic;
signal dinx             : std_logic;


begin

-- x2S_COMPL: if (IS_CMPL = TRUE) generate
pr_sgn: process(clk) is
begin
    if rising_edge(clk) then
        dinz <= din - din(15);
        dinh <= din(15);
    end if;
end process;

---- make abs(data) by using XOR ----
pr_abs: process(clk) is
begin
    if rising_edge(clk) then
        true_form(15) <= dinz(15) or dinh;
        for ii in 0 to 14 loop
            true_form(ii) <= dinz(ii) xor (dinz(15) or dinh);
        end loop;
    end if;
end process; 

sum_man <= true_form(14 downto 0) & '0'  when rising_edge(clk);

---- find MSB (highest '1' position) ----
pr_lead: process(clk) is
begin 
    if rising_edge(clk) then 
        if    (true_form(14-00)='1') then msb_num <= "00001";--"00010";--"00001";
        elsif (true_form(14-01)='1') then msb_num <= "00010";--"00011";--"00010";
        elsif (true_form(14-02)='1') then msb_num <= "00011";--"00100";--"00011";
        elsif (true_form(14-03)='1') then msb_num <= "00100";--"00101";--"00100";
        elsif (true_form(14-04)='1') then msb_num <= "00101";--"00110";--"00101";
        elsif (true_form(14-05)='1') then msb_num <= "00110";--"00111";--"00110";
        elsif (true_form(14-06)='1') then msb_num <= "00111";--"01000";--"00111";
        elsif (true_form(14-07)='1') then msb_num <= "01000";--"01001";--"01000";
        elsif (true_form(14-08)='1') then msb_num <= "01001";--"01010";--"01001";
        elsif (true_form(14-09)='1') then msb_num <= "01010";--"01011";--"01010";
        elsif (true_form(14-10)='1') then msb_num <= "01011";--"01100";--"01011";
        elsif (true_form(14-11)='1') then msb_num <= "01100";--"01101";--"01100";
        elsif (true_form(14-12)='1') then msb_num <= "01101";--"01110";--"01101";
        elsif (true_form(14-13)='1') then msb_num <= "01110";--"01111";--"01110";
        elsif (true_form(14-14)='1') then msb_num <= "01111";--"10000";--"01111";
        else msb_num <= "00000";
        end if; 
    end if;
end process;

dinx <= dinz(15) xor dinh when rising_edge(clk);
msb_numz(5) <= dinx when rising_edge(clk);
msb_numz(4 downto 0) <= msb_num;
msb_numt <= msb_num when rising_edge(clk);

---- barrel shifter by 0-15 ----
norm <= STD_LOGIC_VECTOR(SHL(UNSIGNED(sum_man), UNSIGNED(msb_num))) when rising_edge(clk);
frac <= norm when rising_edge(clk);

---- Check zero value for fraction and exponent ----
set_zero <= nor_reduce(msb_numz) when rising_edge(clk);
---- find exponent (inv msb - x"2E") ---- 
pr_sub: process(clk) is 
begin
    if rising_edge(clk) then
        if (set_zero = '1') then
            expc <= (others=>'0');
        else
            expc <= FP32_EXP - msb_numt;
        end if;
    end if;
end process; 
    
---- sign delay ----
sign <= sign(sign'left-1 downto 0) & true_form(15) when rising_edge(clk);
   
---- output data ---- 
pr_out: process(clk) is 
begin
    if rising_edge(clk) then
        if (reset = '1') then
            dout <= ("000000", '0', x"0000");
        elsif (valid(valid'left) = '1') then
            dout <= (expc, sign(sign'left), frac);
        end if;
    end if;
end process; 

valid <= valid(valid'left-1 downto 0) & ena when rising_edge(clk);  
pr_vld: process(clk) is 
begin
    if rising_edge(clk) then
        if (reset = '1') then
            vld <= '0';
        else
            vld <= valid(valid'left);
        end if;
    end if;
end process;


end fp23_fix2float;