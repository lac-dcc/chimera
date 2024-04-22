-------------------------------------------------------------------------------
--
-- Title       : fp23_float2fix
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : Float fp23 to signed fix converter
--
-------------------------------------------------------------------------------
--
--  Version 1.0  15.08.2013
--               Description:
--                  Bus width for:
--                  din = 23
--                  dout = 16   
--                  exp = 6
--                  sign = 1
--                  mant = 15 + 1
--               Math expression: 
--                  A = (-1)^sign(A) * 2^(exp(A)-31) * mant(A)
--               NB: 
--               Converting from float to fixed takes only 7 clock cycles
--
--              Another algorithm: double precision with 2 DSP48E1.
--   
--  Version 1.1  22.08.2014
--               Description: Data width has been changed from 27 to 24.
--                  16 bits - fraction,
--                  1 bit   - sign,
--                  7 bits  - exponent
--
--                  > 2 DSP48E1 blocks used (MEGA_DSP);
--              
--  Version 1.2  14.05.2015
--                  > SLICEL logic has been simplified;
--
--  Version 1.3  01.11.2015
--                  > remove 1 block DSP48E1;
--
--  Version 1.4  01.11.2015
--                  > Clear all unrouted signals and components;
-- 
--  Version 1.5  01.02.2016
--                  > Add Barrel shifter instead of DSP48E1;
--
--  Version 1.6  04.04.2016
--                  > Careful: check all conditions of input fp data 
--                      Example: exp = 0x1F, sig = 0, man = 0x0;
-- 
--  Version 1.7  05.04.2016
--                  > Data out width is only 16 bits. 
--  
--  Version 1.8  07.04.2016
--                  > Add constant for negative data converter. 
--
--  Version 1.9  22.01.2018
--                  > Change exp shift logic. 
--
--  Version 1.10 23.01.2018
--                  > Overflow and underflow logic has been improved. 
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
--library unisim;
--use unisim.vcomponents.LUT6;

library work;
use work.fp_m1_pkg.fp23_data;

entity fp23_float2fix is
    generic (
        DW          : integer:=16 --! Output data width
    );
    port (
        din         : in  fp23_data;                       --! Float input data
        ena         : in  std_logic;                       --! Data enable
        scale       : in  std_logic_vector(05 downto 0);   --! Scale factor
        dout        : out std_logic_vector(DW-1 downto 0); --! Fixed output data
        vld         : out std_logic;                       --! Data out valid
        clk         : in  std_logic;                       --! Clock
        reset       : in  std_logic;                       --! Negative reset
        overflow    : out std_logic                        --! Flag overflow
    );
end fp23_float2fix;

architecture fp23_float2fix of fp23_float2fix is 

signal exp_dif          : std_logic_vector(4 downto 0);
signal exp_dift         : std_logic_vector(5 downto 0);
signal mant             : std_logic_vector(DW downto 0);

signal implied          : std_logic;
signal frac             : std_logic_vector(DW-1 downto 0);
signal sign_z           : std_logic_vector(2 downto 0); 
signal valid            : std_logic_vector(3 downto 0); 
signal shift            : std_logic_vector(5 downto 0);

--signal man_shift      : std_logic_vector(31 downto 0);
signal norm_man         : std_logic_vector(DW-1 downto 0);

signal overflow_i       : std_logic;
signal exp_null         : std_logic; 
signal exp_nullz        : std_logic; 
signal exp_nullt        : std_logic; 

signal exp_cmp          : std_logic;
signal exp_ovr          : std_logic;

begin   

shift <= scale when rising_edge(clk);

---- exp difference ----
pr_exp: process(clk) is
begin
    if rising_edge(clk) then
        exp_dift <= din.exp - shift;
    end if;
end process; 

pr_cmp: process(clk) is
begin
    if rising_edge(clk) then
        if (din.exp < shift) then
            exp_cmp <= '1';
        else
            exp_cmp <= '0';
        end if;
    end if;
end process;

exp_null <= exp_cmp when rising_edge(clk); 
exp_nullz <= exp_null when rising_edge(clk); 

pr_ovf: process(clk) is
begin
    if rising_edge(clk) then
        if ("001110" < exp_dift) then
            exp_ovr <= '1';
        else
            exp_ovr <= '0';
        end if;
    end if;
end process;

exp_nullt <= exp_ovr when rising_edge(clk);


-- implied for mantissa and find sign
pr_impl: process(clk) is
begin 
    if rising_edge(clk) then
        if (din.exp = x"00") then
            implied <='0';
        else 
            implied <='1';
        end if;
    end if;
end process; 

-- find fraction --
frac <= din.man when rising_edge(clk);
pr_man: process(clk) is
begin 
    if rising_edge(clk) then
        mant <= implied & frac;
    end if;
end process;
sign_z <= sign_z(sign_z'left-1 downto 0) & din.sig when rising_edge(clk);

-- barrel shifter --    
exp_dif <= not exp_dift(4 downto 0) when rising_edge(clk);
norm_man <= STD_LOGIC_VECTOR(SHR(UNSIGNED(mant(DW downto 1)), UNSIGNED(exp_dif(3 downto 0)))) when rising_edge(clk);

-- data valid and data out --
pr_out: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then 
            dout <= (others => '0');
        else            
            if (exp_nullz = '1') then
                dout <= (others => '0');
            else
                if (exp_nullt = '1') then
                    dout(DW-1) <= sign_z(2);
                    for ii in 0 to DW-2 loop
                        dout(ii) <= not sign_z(2);
                    end loop;  
                else
                    if (sign_z(2) = '1') then
                        dout <= (not norm_man) + 1;
                    else
                        dout <= norm_man;
                    end if;
                end if;
            end if;
        end if;
    end if; 
end process;

valid <= valid(valid'left-1 downto 0) & ena when rising_edge(clk);
vld <= valid(valid'left-1) when rising_edge(clk);

pr_ovr: process(clk) is
begin 
    if rising_edge(clk) then
        overflow_i <= exp_nullt and not exp_nullz;--(exp_hi or exp_lo);
    end if;
end process;
overflow <= overflow_i when rising_edge(clk); 

end fp23_float2fix;