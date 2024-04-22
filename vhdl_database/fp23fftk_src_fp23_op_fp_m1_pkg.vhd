-------------------------------------------------------------------------------
--
-- Title       : fp_m1_pkg
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-- Description : FP useful package
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
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;

package fp_m1_pkg is

    ---- SIN / COS CALCULATING ----
    constant xNFFT : integer:=11;
    type std_logic_array_Kx16 is array (0 to 2**(xNFFT-1)-1) of std_logic_vector(15 downto 0);
    type std_logic_array_Kx32 is array (0 to 2**(xNFFT-1)-1) of std_logic_vector(31 downto 0);
    
    function find_sin(xx : integer) return std_logic_array_Kx16;
    function find_cos(xx : integer) return std_logic_array_Kx16; 

    type int16_complex is record
        re : std_logic_vector(15 downto 00);
        im : std_logic_vector(15 downto 00);
    end record; 
    
    type fp23_data is record
        exp     : std_logic_vector(5 downto 0); 
        sig     : std_logic;
        man     : std_logic_vector(15 downto 0);
    end record; 

    type fp23_complex is record
        re : fp23_data;
        im : fp23_data;
    end record;

    procedure find_fp(
        data_i  : in std_logic_vector(15 downto 0);
        data_o  : out std_logic_vector(22 downto 0)
    );
    
    procedure find_float(
        data_i  : in std_logic_vector(15 downto 0);
        data_o  : out fp23_data
    );

end fp_m1_pkg;

package body fp_m1_pkg is

    function find_sin(xx : integer) return std_logic_array_Kx16 is
        variable pi_new : real:=0.0;
        variable si_new : std_logic_array_Kx16;
    begin
        for ii in 0 to 2**(xx-1)-1 loop
            pi_new := (real(ii) * MATH_PI)/(2.0**xx);
            si_new(ii) := STD_LOGIC_VECTOR(CONV_SIGNED(INTEGER(32767.0*SIN(-pi_new)),16));
        end loop;
        return si_new;
    end find_sin;

    function find_cos(xx : integer) return std_logic_array_Kx16 is
        variable pi_new : real:=0.0;
        variable co_new : std_logic_array_Kx16;
    begin
        for ii in 0 to 2**(xx-1)-1 loop
            pi_new := (real(ii) * MATH_PI)/(2.0**xx);
            co_new(ii) := STD_LOGIC_VECTOR(CONV_SIGNED(INTEGER(32767.0*COS(pi_new)),16));
        end loop;
        return co_new;
    end find_cos;

    procedure find_float(
        data_i  : in std_logic_vector(15 downto 0);
        data_o  : out fp23_data
    ) 
    is
        variable msb    : std_logic_vector(05 downto 00):="000001";
        variable man    : std_logic_vector(15 downto 00):=(others=>'0');
    begin
        if (data_i(15) = '1') then
            man := data_i xor x"FFFF";
        else
            man := data_i;
        end if;

        xl: for jj in 0 to 15 loop
            if (man = x"0000") then
                msb := "100000";
                exit;
            else
                if (man(15) = '1') then
                    man := man(14 downto 00) & '0'; 
                    exit;
                else    
                    msb := msb + '1';
                    man := man(14 downto 00) & '0';
                end if;
            end if;
        end loop;
        msb := "100000" - msb;
        
        data_o.sig := data_i(15);
        data_o.man := man;
        data_o.exp := msb;
    end find_float; 
    
    procedure find_fp(
        data_i  : in  std_logic_vector(15 downto 0);
        data_o  : out std_logic_vector(22 downto 0)
    ) 
    is
        variable msb : std_logic_vector(05 downto 00):="000001";
        variable man : std_logic_vector(15 downto 00):=(others=>'0');
    begin
        if (data_i(15) = '1') then
            man := data_i xor x"FFFF";
        else
            man := data_i;
        end if;
    
        xl: for jj in 0 to 15 loop
            if (man = x"0000") then
                msb := "100000";
                exit;
            else
                if (man(15) = '1') then
                    man := man(14 downto 00) & '0'; 
                    exit;
                else    
                    msb := msb + '1';
                    man := man(14 downto 00) & '0';
                end if;
            end if;
        end loop;
        msb := "100000" - msb;
        
        data_o(16) := data_i(15);
        data_o(15 downto 00) := man;
        data_o(22 downto 17) := msb;
    end find_fp;


end package body fp_m1_pkg;