-------------------------------------------------------------------------------
--
-- Title       : fp23_addsub_dbl
-- Design      : FFT
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : floating point adder and subtractor into one entity
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
use work.reduce_pack.or_reduce;
use work.fp_m1_pkg.fp23_data;

library unisim;
use unisim.vcomponents.DSP48E1;
use unisim.vcomponents.DSP48E2;

entity fp23_addsub_dbl is
    generic (
        USE_MLT : boolean:=FALSE;   --! Use DSP48E1/2 blocks or not
        XSERIES : string:="7SERIES" --! Xilinx series: ULTRA / 7SERIES
    );  
    port (
        aa      : in  fp23_data;    --! Summand/Minuend A   
        bb      : in  fp23_data;    --! Summand/Substrahend B
        cc_add  : out fp23_data;    --! Sum C
        cc_sub  : out fp23_data;    --! Dif C
        reset   : in  std_logic;    --! '0' - Reset
        enable  : in  std_logic;    --! Input data enable
        valid   : out std_logic;    --! Output data valid
        clk     : in  std_logic     --! Clock
    );
end fp23_addsub_dbl;

architecture fp23_addsub_dbl of fp23_addsub_dbl is 

type std_logic_array_5xn is array (4 downto 0) of std_logic_vector(5 downto 0);

signal aa_z             : fp23_data;
signal b1_z             : fp23_data;
signal b2_z             : fp23_data;
signal comp             : std_logic_vector(22 downto 0); 

signal muxa_man         : std_logic_vector(15 downto 0);
signal muxb_man         : std_logic_vector(15 downto 0);
signal muxa_exp         : std_logic_vector(5 downto 0);
signal muxb_exp         : std_logic_vector(5 downto 0);
signal mux1_sig         : std_logic;
signal mux2_sig         : std_logic;

signal exp_dif          : std_logic_vector(5 downto 0);

signal impl_a           : std_logic;
signal impl_b           : std_logic; 

signal man_az           : std_logic_vector(16 downto 0);
signal subtract         : std_logic_vector(1 downto 0);
signal sub_dsp          : std_logic;

signal msb_num1         : std_logic_vector(4 downto 0);
signal msb_num2         : std_logic_vector(4 downto 0);

signal msb_dec1         : std_logic_vector(15 downto 0);
signal msb_dec2         : std_logic_vector(15 downto 0);

signal expc1            : std_logic_vector(5 downto 0);
signal expc2            : std_logic_vector(5 downto 0);
signal frac1            : std_logic_vector(15 downto 0);
signal frac2            : std_logic_vector(15 downto 0);

signal set_zero1        : std_logic;
signal set_zero2        : std_logic;

signal new_man1         : std_logic_vector(15 downto 0);
signal new_man2         : std_logic_vector(15 downto 0);

signal expaz            : std_logic_array_5xn;
signal sign_1           : std_logic_vector(5 downto 0);
signal sign_2           : std_logic_vector(5 downto 0);

signal dout_val_v       : std_logic_vector(7 downto 0);

signal exp_a0           : std_logic;
signal exp_b0           : std_logic;
signal exp_ab           : std_logic;
signal exp_zz           : std_logic_vector(5 downto 0);

begin   

---- add or sub operation ----
aa_z <= aa when rising_edge(clk);
pr_addsub: process(clk) is
begin
    if rising_edge(clk) then
        b1_z <= bb;
        b2_z <= (bb.exp, not bb.sig, bb.man);
    end if;
end process;

exp_a0 <= or_reduce(aa.exp) when rising_edge(clk);
exp_b0 <= or_reduce(bb.exp) when rising_edge(clk);

exp_ab <= not (exp_a0 or exp_b0) when rising_edge(clk);
exp_zz <= exp_zz(exp_zz'left-1 downto 0) & exp_ab when rising_edge(clk);

---- check difference (least/most attribute) ----
pr_ex: process(clk) is
begin
    if rising_edge(clk) then
        comp <= ('0' & aa.exp & aa.man) - ('0' & bb.exp & bb.man);
    end if;
end process; 

---- data switch multiplexer ----
pr_mux: process(clk) is
begin
    if rising_edge(clk) then
        if (comp(22) = '1') then
            muxa_man <= b1_z.man;
            muxa_exp <= b1_z.exp;
            muxb_man <= aa_z.man;
            muxb_exp <= aa_z.exp;
            
            mux1_sig <= b1_z.sig;
            mux2_sig <= b2_z.sig;   
        else
            muxa_man <= aa_z.man;
            muxa_exp <= aa_z.exp;
            muxb_man <= b1_z.man;
            muxb_exp <= b1_z.exp;
            
            mux1_sig <= aa_z.sig;
            mux2_sig <= aa_z.sig;           
        end if;
    end if;
end process;

---- implied '1' for fraction ----
pr_imp: process(clk) is
begin
    if rising_edge(clk) then
        if (comp(22) = '1') then
            impl_a <= exp_b0;
            impl_b <= exp_a0; 
        else
            impl_a <= exp_a0;
            impl_b <= exp_b0;
        end if;
    end if;
end process;

---- Find exponent ----
exp_dif <= muxa_exp - muxb_exp when rising_edge(clk);

pr_manz: process(clk) is
begin
    if rising_edge(clk) then 
        subtract <= subtract(subtract'left-1 downto 0) & (aa.sig xor bb.sig);
        sub_dsp <= subtract(1);
    end if;
end process;

man_az <= impl_a & muxa_man when rising_edge(clk);

xUSE_DSP48: if (USE_MLT = TRUE) generate

    constant CONST_ONE      : std_logic_vector(15 downto 0):=x"8000";
    
    signal dsp_aa           : std_logic_vector(29 downto 0);
    signal dsp_bb           : std_logic_vector(17 downto 0);
    signal dsp_cc           : std_logic_vector(47 downto 0);
    signal sum_man1         : std_logic_vector(47 downto 0);
    signal sum_man2         : std_logic_vector(47 downto 0);
    
    signal shift_man        : std_logic_vector(15 downto 0);
    signal alu_add          : std_logic_vector(3 downto 0):=x"0";   
    signal alu_sub          : std_logic_vector(3 downto 0):=x"0";   

    signal dsp_mlt          : std_logic;
    signal dsp_res          : std_logic;
begin
    ---- Reset DSP nodes ----
    pr_mlt: process(clk) is
    begin
        if rising_edge(clk) then
            if (exp_dif(5 downto 4) = "00") then
                dsp_res <= '0';
            else
                dsp_res <= '1';
            end if;
        end if;
    end process;

    ---- Shift vector for fraction ----
    shift_man <= STD_LOGIC_VECTOR(SHR(UNSIGNED(CONST_ONE), UNSIGNED(exp_dif(4 downto 0)))) when rising_edge(clk);   

    pr_manz: process(clk) is
    begin
        if rising_edge(clk) then 
            alu_add <= "00" & sub_dsp & sub_dsp;
            alu_sub <= "00" & not(sub_dsp) & not(sub_dsp);  
        end if;
    end process;

    ---- Find fraction by using DSP48 ----
    dsp_aa(16 downto 00) <= impl_b & muxb_man;
    dsp_aa(29 downto 17) <= (others=>'0');
    dsp_bb <= "00" & shift_man;

    dsp_cc(14 downto 00) <= (others =>'0');
    dsp_cc(31 downto 15) <= man_az when rising_edge(clk);
    dsp_cc(47 downto 32) <= (others =>'0');

    xDSP48E1: if (XSERIES = "7SERIES") generate
        
        align_add: DSP48E1
            generic map (
                ALUMODEREG      => 1,
                ADREG           => 0,
                AREG            => 2,
                BCASCREG        => 0,
                BREG            => 0,
                CREG            => 1,
                DREG            => 0,
                MREG            => 1,
                PREG            => 1
            )       
            port map (     
                P               => sum_man1, 
                A               => dsp_aa,
                ACIN            => (others=>'0'),
                ALUMODE         => alu_add,
                B               => dsp_bb, 
                BCIN            => (others=>'0'), 
                C               => dsp_cc,
                CARRYCASCIN     => '0',
                CARRYIN         => '0', 
                CARRYINSEL      => (others=>'0'),
                CEA1            => '1',
                CEA2            => '1',
                CEAD            => '1',
                CEALUMODE       => '1',
                CEB1            => '1',
                CEB2            => '1',
                CEC             => '1',
                CECARRYIN       => '1',
                CECTRL          => '1',
                CED             => '1',
                CEINMODE        => '1',
                CEM             => '1',
                CEP             => '1',
                CLK             => clk,
                D               => (others=>'0'),
                INMODE          => "00000",
                MULTSIGNIN      => '0',
                OPMODE          => "0110101",
                PCIN            => (others=>'0'),
                RSTA            => reset,
                RSTALLCARRYIN   => reset,
                RSTALUMODE      => reset,
                RSTB            => reset,
                RSTC            => reset,
                RSTCTRL         => reset,
                RSTD            => reset,
                RSTINMODE       => reset,
                RSTM            => dsp_res,
                RSTP            => reset 
            );
            
        align_sub: DSP48E1
            generic map (
                ALUMODEREG      => 1,
                ADREG           => 0,
                AREG            => 2,
                BCASCREG        => 0,
                BREG            => 0,
                CREG            => 1,
                DREG            => 0,
                MREG            => 1,
                PREG            => 1
            )       
            port map (     
                P               => sum_man2, 
                A               => dsp_aa,
                ACIN            => (others=>'0'),
                ALUMODE         => alu_sub,
                B               => dsp_bb, 
                BCIN            => (others=>'0'), 
                C               => dsp_cc,
                CARRYCASCIN     => '0',
                CARRYIN         => '0', 
                CARRYINSEL      => (others=>'0'),
                CEA1            => '1',
                CEA2            => '1',
                CEAD            => '1',
                CEALUMODE       => '1',
                CEB1            => '1',
                CEB2            => '1',
                CEC             => '1',
                CECARRYIN       => '1',
                CECTRL          => '1',
                CED             => '1',
                CEINMODE        => '1',
                CEM             => '1',
                CEP             => '1',
                CLK             => clk,
                D               => (others=>'0'),
                INMODE          => "00000",
                MULTSIGNIN      => '0',
                OPMODE          => "0110101",
                PCIN            => (others=>'0'),
                RSTA            => reset,
                RSTALLCARRYIN   => reset,
                RSTALUMODE      => reset,
                RSTB            => reset,
                RSTC            => reset,
                RSTCTRL         => reset,
                RSTD            => reset,
                RSTINMODE       => reset,
                RSTM            => dsp_res,
                RSTP            => reset 
            );      
    end generate;

    xDSP48E2: if (XSERIES = "ULTRA") generate
        align_add: DSP48E2
            generic map (
                ALUMODEREG      => 1,
                ADREG           => 0,
                AREG            => 2,
                BCASCREG        => 0,
                BREG            => 0,
                CREG            => 1,
                DREG            => 0,
                MREG            => 1,
                PREG            => 1
            )       
            port map (     
                P               => sum_man1, 
                A               => dsp_aa,
                ACIN            => (others=>'0'),
                ALUMODE         => alu_add,
                B               => dsp_bb, 
                BCIN            => (others=>'0'), 
                C               => dsp_cc,
                CARRYCASCIN     => '0',
                CARRYIN         => '0', 
                CARRYINSEL      => (others=>'0'),
                CEA1            => '1',
                CEA2            => '1',
                CEAD            => '1',
                CEALUMODE       => '1',
                CEB1            => '1',
                CEB2            => '1',
                CEC             => '1',
                CECARRYIN       => '1',
                CECTRL          => '1',
                CED             => '1',
                CEINMODE        => '1',
                CEM             => '1',
                CEP             => '1',
                CLK             => clk,
                D               => (others=>'0'),
                INMODE          => "00000",
                MULTSIGNIN      => '0',
                OPMODE          => "000110101",
                PCIN            => (others=>'0'),
                RSTA            => reset,
                RSTALLCARRYIN   => reset,
                RSTALUMODE      => reset,
                RSTB            => reset,
                RSTC            => reset,
                RSTCTRL         => reset,
                RSTD            => reset,
                RSTINMODE       => reset,
                RSTM            => dsp_res,
                RSTP            => reset 
            );
            
        align_sub: DSP48E2
            generic map (
                ALUMODEREG      => 1,
                ADREG           => 0,
                AREG            => 2,
                BCASCREG        => 0,
                BREG            => 0,
                CREG            => 1,
                DREG            => 0,
                MREG            => 1,
                PREG            => 1
            )       
            port map (     
                P               => sum_man2, 
                A               => dsp_aa,
                ACIN            => (others=>'0'),
                ALUMODE         => alu_sub,
                B               => dsp_bb, 
                BCIN            => (others=>'0'), 
                C               => dsp_cc,
                CARRYCASCIN     => '0',
                CARRYIN         => '0', 
                CARRYINSEL      => (others=>'0'),
                CEA1            => '1',
                CEA2            => '1',
                CEAD            => '1',
                CEALUMODE       => '1',
                CEB1            => '1',
                CEB2            => '1',
                CEC             => '1',
                CECARRYIN       => '1',
                CECTRL          => '1',
                CED             => '1',
                CEINMODE        => '1',
                CEM             => '1',
                CEP             => '1',
                CLK             => clk,
                D               => (others=>'0'),
                INMODE          => "00000",
                MULTSIGNIN      => '0',
                OPMODE          => "000110101",
                PCIN            => (others=>'0'),
                RSTA            => reset,
                RSTALLCARRYIN   => reset,
                RSTALUMODE      => reset,
                RSTB            => reset,
                RSTC            => reset,
                RSTCTRL         => reset,
                RSTD            => reset,
                RSTINMODE       => reset,
                RSTM            => dsp_res,
                RSTP            => reset 
            );      
    end generate;

    msb_dec1 <= sum_man1(32 downto 17);
    msb_dec2 <= sum_man2(32 downto 17);
    
    pr_del: process(clk) is
    begin
        if rising_edge(clk) then
            new_man1 <= sum_man1(31 downto 16);
            new_man2 <= sum_man2(31 downto 16);
            new_man1 <= sum_man1(31 downto 16);
            new_man2 <= sum_man2(31 downto 16);
        end if;
    end process;
    
end generate;

xUSE_LOGIC: if (USE_MLT = FALSE) generate

    signal norm_man         : std_logic_vector(16 downto 0);
    signal diff_man         : std_logic_vector(16 downto 0);
    signal diff_exp         : std_logic_vector(1 downto 0);
    signal addsub           : std_logic;
    signal sumdif           : std_logic;

    signal sum_mt1          : std_logic_vector(17 downto 0);
    signal sum_mt2          : std_logic_vector(17 downto 0);
    signal man_shift        : std_logic_vector(16 downto 0);
    
    signal man_az1          : std_logic_vector(16 downto 0);
    signal man_az2          : std_logic_vector(16 downto 0);

begin

    man_shift <= impl_b & muxb_man when rising_edge(clk);
    norm_man <= STD_LOGIC_VECTOR(SHR(UNSIGNED(man_shift), UNSIGNED(exp_dif(3 downto 0)))) when rising_edge(clk);    

    diff_exp <= exp_dif(5 downto 4) when rising_edge(clk);

    pr_norm_man: process(clk) is
    begin
        if rising_edge(clk) then
            if (diff_exp = "00") then
                diff_man <= norm_man;
            else
                diff_man <= (others => '0');
            end if;
        end if;
    end process;

    addsub <= not sub_dsp when rising_edge(clk); 
    sumdif <= addsub when rising_edge(clk); 

    -- sum of fractions --
    pr_man: process(clk) is
    begin
        if rising_edge(clk) then
            man_az1 <= man_az;
            man_az2 <= man_az1;
            if (sumdif = '1') then
                sum_mt1 <= ('0' & man_az2) + ('0' & diff_man);
            else
                sum_mt1 <= ('0' & man_az2) - ('0' & diff_man);
            end if;
            if (sumdif = '1') then
                sum_mt2 <= ('0' & man_az2) - ('0' & diff_man);
            else
                sum_mt2 <= ('0' & man_az2) + ('0' & diff_man);
            end if;
        end if;
    end process;    
    
    msb_dec1 <= sum_mt1(17 downto 2);
    msb_dec2 <= sum_mt2(17 downto 2);
    new_man1 <= sum_mt1(16 downto 1) when rising_edge(clk);
    new_man2 <= sum_mt2(16 downto 1) when rising_edge(clk);
end generate;   

---- find MSB (highest '1' position) ----
pr_align: process(clk) is 
begin
    if rising_edge(clk) then
        ---- Add ----
        if    (msb_dec1(15-00)='1') then msb_num1 <= "00000";
        elsif (msb_dec1(15-01)='1') then msb_num1 <= "00001";
        elsif (msb_dec1(15-02)='1') then msb_num1 <= "00010";
        elsif (msb_dec1(15-03)='1') then msb_num1 <= "00011";
        elsif (msb_dec1(15-04)='1') then msb_num1 <= "00100";
        elsif (msb_dec1(15-05)='1') then msb_num1 <= "00101";
        elsif (msb_dec1(15-06)='1') then msb_num1 <= "00110";
        elsif (msb_dec1(15-07)='1') then msb_num1 <= "00111";
        elsif (msb_dec1(15-08)='1') then msb_num1 <= "01000";
        elsif (msb_dec1(15-09)='1') then msb_num1 <= "01001";
        elsif (msb_dec1(15-10)='1') then msb_num1 <= "01010";
        elsif (msb_dec1(15-11)='1') then msb_num1 <= "01011";
        elsif (msb_dec1(15-12)='1') then msb_num1 <= "01100";
        elsif (msb_dec1(15-13)='1') then msb_num1 <= "01101";
        elsif (msb_dec1(15-14)='1') then msb_num1 <= "01110";
        elsif (msb_dec1(15-15)='1') then msb_num1 <= "01111";
        else msb_num1 <= "11111";
        end if;
        ---- Sub ----
        if    (msb_dec2(15-00)='1') then msb_num2 <= "00000";
        elsif (msb_dec2(15-01)='1') then msb_num2 <= "00001";
        elsif (msb_dec2(15-02)='1') then msb_num2 <= "00010";
        elsif (msb_dec2(15-03)='1') then msb_num2 <= "00011";
        elsif (msb_dec2(15-04)='1') then msb_num2 <= "00100";
        elsif (msb_dec2(15-05)='1') then msb_num2 <= "00101";
        elsif (msb_dec2(15-06)='1') then msb_num2 <= "00110";
        elsif (msb_dec2(15-07)='1') then msb_num2 <= "00111";
        elsif (msb_dec2(15-08)='1') then msb_num2 <= "01000";
        elsif (msb_dec2(15-09)='1') then msb_num2 <= "01001";
        elsif (msb_dec2(15-10)='1') then msb_num2 <= "01010";
        elsif (msb_dec2(15-11)='1') then msb_num2 <= "01011";
        elsif (msb_dec2(15-12)='1') then msb_num2 <= "01100";
        elsif (msb_dec2(15-13)='1') then msb_num2 <= "01101";
        elsif (msb_dec2(15-14)='1') then msb_num2 <= "01110";
        elsif (msb_dec2(15-15)='1') then msb_num2 <= "01111";
        else msb_num2 <= "11111";
        end if;
    end if;
end process;


frac1 <= STD_LOGIC_VECTOR(SHL(UNSIGNED(new_man1), UNSIGNED(msb_num1(3 downto 0)))) when rising_edge(clk);   
frac2 <= STD_LOGIC_VECTOR(SHL(UNSIGNED(new_man2), UNSIGNED(msb_num2(3 downto 0)))) when rising_edge(clk);   

set_zero1 <= msb_num1(4);
set_zero2 <= msb_num2(4);

---- exponent increment ----    
pr_expx: process(clk) is
begin
    if rising_edge(clk) then 
        ---- Set ones (error of rounding fp data) ----
        if (set_zero1 = '0') then
            if (expaz(4) < ('0' & msb_num1)) then
                expc1 <= "000000";
            else
                expc1 <= expaz(4) - msb_num1 + '1';
            end if;
        else
            expc1 <= "000000";
        end if; 

        if (set_zero2 = '0') then
            if (expaz(4) < ('0' & msb_num2)) then
                expc2 <= "000000";
            else
                expc2 <= expaz(4) - msb_num2 + '1';
            end if;
        else
            expc2 <= "000000";
        end if; 
    end if;
end process;

---- exp & sign delay ----
pr_expz: process(clk) is
begin
    if rising_edge(clk) then
        expaz <= expaz(expaz'left-1 downto 0) & muxa_exp;
        sign_1 <= sign_1(sign_1'left-1 downto 0) & mux1_sig;
        sign_2 <= sign_2(sign_2'left-1 downto 0) & mux2_sig;
    end if;
end process;

---- output product ----
pr_dout: process(clk) is
begin       
    if rising_edge(clk) then
        if (exp_zz(exp_zz'left) = '1') then
            cc_add <= ("000000", '0', x"0000");
            cc_sub <= ("000000", '0', x"0000");
        else
            cc_add <= (expc1, sign_1(sign_1'left), frac1);
            cc_sub <= (expc2, sign_2(sign_2'left), frac2);
        end if;
    end if;
end process;

dout_val_v <= dout_val_v(dout_val_v'left-1 downto 0) & enable when rising_edge(clk);
valid <= dout_val_v(dout_val_v'left) when rising_edge(clk);

end fp23_addsub_dbl;