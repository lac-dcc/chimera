-------------------------------------------------------------------------------
--
-- Title       : int_cmult_trpl52_dsp48
-- Design      : FFTK
-- Author      : Kapitanov
-- Company     :
--
-- Description : Integer complex multiplier (triple mult width)
--
-------------------------------------------------------------------------------
--
--    Version 1.0: 14.02.2018
--
--  Description: Double complex multiplier by DSP48 unit.
--    "Triple52" means that the unit uses three DSP48 w/ 52-bits width on port (A)
--
--  Math:
--
--  Out:    In:
--  MP_12 = M2_AA * M2_BB + M1_AA * M1_BB; (ALUMODE = "0000")
--  MP_12 = M2_AA * M2_BB - M1_AA * M1_BB; (ALUMODE = "0011")
--
--    Input variables:
--    1. MAW - Input data width for A ports
--    2. MBW - Input data width for B ports
--    3. XALU - ALU MODE: 
--        "ADD" - adder
--        "SUB" - subtractor
--
--  DSP48 data signals:
--    A port - data width up to 52 bits
--    B port - data width up to 25 (27)* bits
--    P port - data width up to 77 (79)** bits
--  * - 25 bits for DSP48E1, 27 bits for DSP48E2.
--  ** - 77 bits for DSP48E1, 79 bits for DSP48E2.
--
--  Total delay      : 8 clock cycles
--  Total resources  : 7(8) DSP48 units
--
--  Unit dependence:
--    >. mlt52x25_dsp48e1.vhd
--    >. mlt52x27_dsp48e2.vhd
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--  GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--  Copyright (c) 2018 Kapitanov Alexander
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

library unisim;
use unisim.vcomponents.DSP48E1;    
use unisim.vcomponents.DSP48E2;    
use ieee.std_logic_arith.SXT;

entity int_cmult_trpl52_dsp48 is
    generic (
        MAW       : natural:=52;  --! Input data width for A ports
        MBW       : natural:=25;  --! Input data width for B ports
        XSER      : string :="NEW";  --! Xilinx series: NEW - DSP48E2, OLD - DSP48E1
        XALU      : string :="ADD" --! ADD - adder / SUB - subtractor
    );
    port (
        M1_AA     : in  std_logic_vector(MAW-1 downto 0); --! Real input data
        M1_BB     : in  std_logic_vector(MBW-1 downto 0); --! Imag input data
        M2_AA     : in  std_logic_vector(MAW-1 downto 0); --! Real twiddle factor
        M2_BB     : in  std_logic_vector(MBW-1 downto 0); --! Imag twiddle factor

        MP_12     : out std_logic_vector(MAW-1 downto 0); --! Output data
        RST       : in  std_logic; --! Global reset
        CLK       : in  std_logic --! Math clock
    );
end int_cmult_trpl52_dsp48;

architecture int_cmult_trpl52_dsp48 of int_cmult_trpl52_dsp48 is

    function find_widthP(var : string) return natural is
        variable ret_val : natural:=0;
    begin
        if (var = "NEW") then 
            ret_val := 79;
        elsif (var = "OLD") then 
            ret_val := 77;
        else 
            ret_val :=0;
        end if;
        return ret_val; 
    end function find_widthP;

    function find_widthB(var : string) return natural is
        variable ret_val : natural:=0;
    begin
        if (var = "NEW") then 
            ret_val := 27;
        elsif (var = "OLD") then 
            ret_val := 25;
        else 
            ret_val :=0;
        end if;
        return ret_val; 
    end function find_widthB;        

    constant BWD       : natural:=find_widthB(XSER);
    constant PWD       : natural:=find_widthP(XSER);
    
    ---- DSP48 signal declaration ----
    signal dspA_M1     : std_logic_vector(51 downto 0);
    signal dspB_M1     : std_logic_vector(BWD-1 downto 0);

    signal dspA_M2     : std_logic_vector(51 downto 0);
    signal dspB_M2     : std_logic_vector(BWD-1 downto 0);

    signal dspP_M1     : std_logic_vector(PWD-1 downto 0);
    signal dspP_M2     : std_logic_vector(PWD-1 downto 0);

    signal dsp1_48     : std_logic_vector(MAW-1 downto 0);
    signal dsp2_48     : std_logic_vector(MAW-1 downto 0);
    signal dspP_12     : std_logic_vector(MAW-1 downto 0);

    signal ALUMODE     : std_logic_vector(3 downto 0):="0000";

begin
  
    ---- Wrap input data B ----
    dspB_M1 <= SXT(M1_BB, BWD);
    dspB_M2 <= SXT(M2_BB, BWD);

    ---- Wrap input data A ----
    dspA_M1 <= SXT(M1_AA, 52);
    dspA_M2 <= SXT(M2_AA, 52);  

    ---- Wrap add / sub ----
    xADD: if (XALU = "ADD") generate
        ALUMODE <= "0000"; -- Z + (X + Y)
    end generate;
    xSUB: if (XALU = "SUB") generate
        ALUMODE <= "0011"; -- Z - (X + Y)
    end generate;
    
    ---- Min value MBW = 6 (4)! ----
    dsp1_48 <= dspP_M1(MAW+MBW-2-1 downto MBW-1-1);
    dsp2_48 <= dspP_M2(MAW+MBW-2-1 downto MBW-1-1);

    ---- Output data ----
    MP_12 <= dspP_12;

    ---- Wrap DSP48E1 units ----
    xDSP48E1: if (XSER = "OLD") generate
        
        xMLT1: entity work.mlt52x25_dsp48e1
            port map (
                MLT_A     => dspA_M1,
                MLT_B     => dspB_M1,
                MLT_P     => dspP_M1,
                RST       => RST,
                CLK       => CLK
            );    
            
        xMLT2: entity work.mlt52x25_dsp48e1
            port map (
                MLT_A     => dspA_M2,
                MLT_B     => dspB_M2,
                MLT_P     => dspP_M2,
                RST       => RST,
                CLK       => CLK
            );            

        xDT48: if (MAW < 49) generate
            signal dspA_48   : std_logic_vector(29 downto 0);
            signal dspB_48   : std_logic_vector(17 downto 0);
            signal dspC_48   : std_logic_vector(47 downto 0);
            signal dspP_48   : std_logic_vector(47 downto 0);
            
            signal dsp1_DT   : std_logic_vector(47 downto 0);
            signal dsp2_DT   : std_logic_vector(47 downto 0);

        begin
            dspP_12 <= dspP_48(MAW-1 downto 0);
            
            xG48: for ii in 0 to 47 generate
                xLOW: if (ii < MAW) generate
                    dsp1_DT(ii) <= dsp1_48(ii);
                    dsp2_DT(ii) <= dsp2_48(ii);
                end generate;
                xHIGH: if (ii > (MAW-1)) generate
                    dsp1_DT(ii) <= dsp1_48(MAW-1);
                    dsp2_DT(ii) <= dsp2_48(MAW-1);
                end generate;
            end generate;

            ---- Map adder ----
            dspA_48 <= dsp1_DT(47 downto 18);
            dspB_48 <= dsp1_DT(17 downto 00);
            dspC_48 <= dsp2_DT when rising_edge(clk);

            xDSP_ADD: DSP48E1
                generic map (
                    -- Feature Control Attributes: Data Path Selection
                    USE_MULT         => "NONE",
                    -- Register Control Attributes: Pipeline Register Configuration
                    ACASCREG         => 1,
                    ADREG            => 1,
                    ALUMODEREG       => 1,
                    AREG             => 2,
                    BCASCREG         => 1,
                    BREG             => 2,
                    CARRYINREG       => 1,
                    CARRYINSELREG    => 1,
                    CREG             => 1,
                    DREG             => 1,
                    INMODEREG        => 1,
                    MREG             => 0,
                    OPMODEREG        => 1,
                    PREG             => 1 
                )        
                port map (         
                    -- Data: input / output data ports
                    A                => dspA_48,
                    B                => dspB_48,
                    C                => dspC_48,
                    D                => (others=>'0'),
                    P                => dspP_48,
                    PCOUT            => open,
                    -- Control: Inputs/Status Bits
                    ALUMODE          => ALUMODE,
                    INMODE           => (others=>'0'),
                    OPMODE           => "0110011",
                    -- Carry input data
                    ACIN             => (others=>'0'),    
                    BCIN             => (others=>'0'),
                    PCIN             => (others=>'0'),
                    CARRYINSEL       => (others=>'0'),
                    CARRYCASCIN      => '0',
                    CARRYIN          => '0',
                    MULTSIGNIN       => '0',
                    -- Clock enables
                    CEA1             => '1',
                    CEA2             => '1',
                    CEAD             => '1',
                    CEALUMODE        => '1',
                    CEB1             => '1',
                    CEB2             => '1',
                    CEC              => '1',
                    CECARRYIN        => '1',
                    CECTRL           => '1',
                    CED              => '1',
                    CEINMODE         => '1',
                    CEM              => '1',
                    CEP              => '1',
                    CLK              => CLK,
                    -- Reset/Clock Enable --
                    RSTA             => RST,
                    RSTALLCARRYIN    => RST,
                    RSTALUMODE       => RST,
                    RSTB             => RST,
                    RSTC             => RST,
                    RSTCTRL          => RST,
                    RSTD             => RST,
                    RSTINMODE        => RST,
                    RSTM             => RST,
                    RSTP             => RST 
                );
        end generate;

        xDT96: if (MAW > 48) generate
            signal dsp1_LO        : std_logic_vector(47 downto 0);
            signal dsp1_HI        : std_logic_vector(47 downto 0);
            signal dsp2_LO        : std_logic_vector(47 downto 0);
            signal dsp2_HI        : std_logic_vector(47 downto 0);

            signal dspA_LO        : std_logic_vector(29 downto 0);
            signal dspB_LO        : std_logic_vector(17 downto 0);
            signal dspC_LO        : std_logic_vector(47 downto 0);
            signal dspP_LO        : std_logic_vector(47 downto 0);
            
            signal dspA_HI        : std_logic_vector(29 downto 0);
            signal dspB_HI        : std_logic_vector(17 downto 0);
            signal dspC_HI        : std_logic_vector(47 downto 0);
            signal dspP_HI        : std_logic_vector(47 downto 0);
    
            signal dspP_CY        : std_logic;
    
        begin
        
            dspP_12(47 downto 0) <= dspP_LO when rising_edge(clk);
            dspP_12(MAW-1 downto 48) <= dspP_HI(MAW-1-48 downto 0);

            dsp1_LO <= dsp1_48(47 downto 0);
            dsp2_LO <= dsp2_48(47 downto 0);

            xG48: for ii in 0 to 47 generate
                xLOW: if (ii < (MAW-48)) generate
                    dsp1_HI(ii) <= dsp1_48(ii+48);
                    dsp2_HI(ii) <= dsp2_48(ii+48);
                end generate;
                xHIGH: if (ii > (MAW-48-1)) generate
                    dsp1_HI(ii) <= dsp1_48(MAW-1);
                    dsp2_HI(ii) <= dsp2_48(MAW-1);
                end generate;
            end generate;

            ---- Map adder ----
            dspA_LO <= dsp1_LO(47 downto 18);
            dspB_LO <= dsp1_LO(17 downto 00);
            dspC_LO <= dsp2_LO;        
            dspA_HI <= dsp1_HI(47 downto 18);
            dspB_HI <= dsp1_HI(17 downto 00);
            dspC_HI <= dsp2_HI when rising_edge(clk);    

            xDSP_ADD2: DSP48E1
                generic map (
                    -- Feature Control Attributes: Data Path Selection
                    USE_MULT         => "NONE",
                    -- Register Control Attributes: Pipeline Register Configuration
                    ACASCREG         => 1,
                    ADREG            => 1,
                    ALUMODEREG       => 1,
                    AREG             => 2,
                    BCASCREG         => 1,
                    BREG             => 2,
                    CARRYINREG       => 1,
                    CARRYINSELREG    => 1,
                    CREG             => 1,
                    DREG             => 1,
                    INMODEREG        => 1,
                    MREG             => 0,
                    OPMODEREG        => 1,
                    PREG             => 1 
                )        
                port map (         
                    -- Data: input / output data ports
                    A                => dspA_HI,
                    B                => dspB_HI,
                    C                => dspC_HI,
                    D                => (others=>'0'),
                    P                => dspP_HI,
                    PCOUT            => open,
                    -- Control: Inputs/Status Bits
                    ALUMODE          => ALUMODE,
                    INMODE           => (others=>'0'),
                    OPMODE           => "0110011",
                    -- Carry input data
                    ACIN             => (others=>'0'),    
                    BCIN             => (others=>'0'),
                    PCIN             => (others=>'0'),
                    CARRYINSEL       => "010",
                    CARRYCASCIN      => dspP_CY,
                    CARRYIN          => '0',
                    MULTSIGNIN       => '0',
                    -- Clock enables
                    CEA1             => '1',
                    CEA2             => '1',
                    CEAD             => '1',
                    CEALUMODE        => '1',
                    CEB1             => '1',
                    CEB2             => '1',
                    CEC              => '1',
                    CECARRYIN        => '1',
                    CECTRL           => '1',
                    CED              => '1',
                    CEINMODE         => '1',
                    CEM              => '1',
                    CEP              => '1',
                    CLK              => CLK,
                    -- Reset/Clock Enable --
                    RSTA             => RST,
                    RSTALLCARRYIN    => RST,
                    RSTALUMODE       => RST,
                    RSTB             => RST,
                    RSTC             => RST,
                    RSTCTRL          => RST,
                    RSTD             => RST,
                    RSTINMODE        => RST,
                    RSTM             => RST,
                    RSTP             => RST
                );
                
            xDSP_ADD1: DSP48E1
                generic map (
                    -- Feature Control Attributes: Data Path Selection
                    USE_MULT         => "NONE",
                    -- Register Control Attributes: Pipeline Register Configuration
                    ACASCREG         => 1,
                    ADREG            => 1,
                    ALUMODEREG       => 1,
                    AREG             => 1,
                    BCASCREG         => 1,
                    BREG             => 1,
                    CARRYINREG       => 1,
                    CARRYINSELREG    => 1,
                    CREG             => 1,
                    DREG             => 1,
                    INMODEREG        => 1,
                    MREG             => 0,
                    OPMODEREG        => 1,
                    PREG             => 1 
                )        
                port map (         
                    -- Data: input / output data ports
                    A                => dspA_LO,
                    B                => dspB_LO,
                    C                => dspC_LO,
                    D                => (others=>'0'),
                    P                => dspP_LO,
                    PCOUT            => open,
                    -- Control: Inputs/Status Bits
                    ALUMODE          => ALUMODE,
                    INMODE           => (others=>'0'),
                    OPMODE           => "0110011",
                    -- Carry input data
                    ACIN             => (others=>'0'),    
                    BCIN             => (others=>'0'),
                    PCIN             => (others=>'0'),
                    CARRYINSEL       => (others=>'0'),
                    CARRYCASCIN      => '0',
                    CARRYIN          => '0',
                    MULTSIGNIN       => '0',
                    CARRYCASCOUT     => dspP_CY,
                    -- Clock enables
                    CEA1             => '1',
                    CEA2             => '1',
                    CEAD             => '1',
                    CEALUMODE        => '1',
                    CEB1             => '1',
                    CEB2             => '1',
                    CEC              => '1',
                    CECARRYIN        => '1',
                    CECTRL           => '1',
                    CED              => '1',
                    CEINMODE         => '1',
                    CEM              => '1',
                    CEP              => '1',
                    CLK              => CLK,
                    -- Reset/Clock Enable --
                    RSTA             => RST,
                    RSTALLCARRYIN    => RST,
                    RSTALUMODE       => RST,
                    RSTB             => RST,
                    RSTC             => RST,
                    RSTCTRL          => RST,
                    RSTD             => RST,
                    RSTINMODE        => RST,
                    RSTM             => RST,
                    RSTP             => RST
                );
        end generate;
        
    end generate;
    

    ---- Wrap DSP48E1 units ----
    xDSP48E2: if (XSER = "NEW") generate
        
        xMLT1: entity work.mlt52x27_dsp48e2
            port map (
                MLT_A     => dspA_M1,
                MLT_B     => dspB_M1,
                MLT_P     => dspP_M1,
                RST       => RST,
                CLK       => CLK
            );
            
        xMLT2: entity work.mlt52x27_dsp48e2
            port map (
                MLT_A     => dspA_M2,
                MLT_B     => dspB_M2,
                MLT_P     => dspP_M2,
                RST       => RST,
                CLK       => CLK
            );

        xDT48: if (MAW < 49) generate
            signal dspA_48   : std_logic_vector(29 downto 0);
            signal dspB_48   : std_logic_vector(17 downto 0);
            signal dspC_48   : std_logic_vector(47 downto 0);
            signal dspP_48   : std_logic_vector(47 downto 0);
            
            signal dsp1_DT   : std_logic_vector(47 downto 0);
            signal dsp2_DT   : std_logic_vector(47 downto 0);

        begin
            dspP_12 <= dspP_48(MAW-1 downto 0);
            
            xG48: for ii in 0 to 47 generate
                xLOW: if (ii < MAW) generate
                    dsp1_DT(ii) <= dsp1_48(ii);
                    dsp2_DT(ii) <= dsp2_48(ii);
                end generate;
                xHIGH: if (ii > (MAW-1)) generate
                    dsp1_DT(ii) <= dsp1_48(MAW-1);
                    dsp2_DT(ii) <= dsp2_48(MAW-1);
                end generate;
            end generate;

            ---- Map adder ----
            dspA_48 <= dsp1_DT(47 downto 18);
            dspB_48 <= dsp1_DT(17 downto 00);
            dspC_48 <= dsp2_DT when rising_edge(clk);

            xDSP_ADD: DSP48E2
                generic map (
                    -- Feature Control Attributes: Data Path Selection
                    USE_MULT         => "NONE",
                    -- Register Control Attributes: Pipeline Register Configuration
                    ACASCREG         => 1,
                    ADREG            => 1,
                    ALUMODEREG       => 1,
                    AREG             => 2,
                    BCASCREG         => 1,
                    BREG             => 2,
                    CARRYINREG       => 1,
                    CARRYINSELREG    => 1,
                    CREG             => 1,
                    DREG             => 1,
                    INMODEREG        => 1,
                    MREG             => 0,
                    OPMODEREG        => 1,
                    PREG             => 1 
                )
                port map (
                    -- Data: input / output data ports
                    A                => dspA_48,
                    B                => dspB_48,
                    C                => dspC_48,
                    D                => (others=>'0'),
                    P                => dspP_48,
                    PCOUT            => open,
                    -- Control: Inputs/Status Bits
                    ALUMODE          => ALUMODE,
                    INMODE           => (others=>'0'),
                    OPMODE           => "000110011",
                    -- Carry input data
                    ACIN             => (others=>'0'),    
                    BCIN             => (others=>'0'),
                    PCIN             => (others=>'0'),
                    CARRYINSEL       => (others=>'0'),
                    CARRYCASCIN      => '0',
                    CARRYIN          => '0',
                    MULTSIGNIN       => '0',
                    -- Clock enables
                    CEA1             => '1',
                    CEA2             => '1',
                    CEAD             => '1',
                    CEALUMODE        => '1',
                    CEB1             => '1',
                    CEB2             => '1',
                    CEC              => '1',
                    CECARRYIN        => '1',
                    CECTRL           => '1',
                    CED              => '1',
                    CEINMODE         => '1',
                    CEM              => '1',
                    CEP              => '1',
                    CLK              => CLK,
                    -- Reset/Clock Enable --
                    RSTA             => RST,
                    RSTALLCARRYIN    => RST,
                    RSTALUMODE       => RST,
                    RSTB             => RST,
                    RSTC             => RST,
                    RSTCTRL          => RST,
                    RSTD             => RST,
                    RSTINMODE        => RST,
                    RSTM             => RST,
                    RSTP             => RST
                );
        end generate;

        xDT96: if (MAW > 48) generate
            signal dsp1_LO   : std_logic_vector(47 downto 0);
            signal dsp1_HI   : std_logic_vector(47 downto 0);
            signal dsp2_LO   : std_logic_vector(47 downto 0);
            signal dsp2_HI   : std_logic_vector(47 downto 0);

            signal dspA_LO   : std_logic_vector(29 downto 0);
            signal dspB_LO   : std_logic_vector(17 downto 0);
            signal dspC_LO   : std_logic_vector(47 downto 0);
            signal dspP_LO   : std_logic_vector(47 downto 0);
            
            signal dspA_HI   : std_logic_vector(29 downto 0);
            signal dspB_HI   : std_logic_vector(17 downto 0);
            signal dspC_HI   : std_logic_vector(47 downto 0);
            signal dspP_HI   : std_logic_vector(47 downto 0);
    
            signal dspP_CY   : std_logic;
    
        begin

            dspP_12(47 downto 0) <= dspP_LO when rising_edge(clk);
            dspP_12(MAW-1 downto 48) <= dspP_HI(MAW-1-48 downto 0);

            dsp1_LO <= dsp1_48(47 downto 0);
            dsp2_LO <= dsp2_48(47 downto 0);

            xG48: for ii in 0 to 47 generate
                xLOW: if (ii < (MAW-48)) generate
                    dsp1_HI(ii) <= dsp1_48(ii+48);
                    dsp2_HI(ii) <= dsp2_48(ii+48);
                end generate;
                xHIGH: if (ii > (MAW-48-1)) generate
                    dsp1_HI(ii) <= dsp1_48(MAW-1);
                    dsp2_HI(ii) <= dsp2_48(MAW-1);
                end generate;
            end generate;

            ---- Map adder ----
            dspA_LO <= dsp1_LO(47 downto 18);
            dspB_LO <= dsp1_LO(17 downto 00);
            dspC_LO <= dsp2_LO;
            dspA_HI <= dsp1_HI(47 downto 18);
            dspB_HI <= dsp1_HI(17 downto 00);
            dspC_HI <= dsp2_HI when rising_edge(clk);    

            xDSP_ADD2: DSP48E2
                generic map (
                    -- Feature Control Attributes: Data Path Selection
                    USE_MULT         => "NONE",
                    -- Register Control Attributes: Pipeline Register Configuration
                    ACASCREG         => 1,
                    ADREG            => 1,
                    ALUMODEREG       => 1,
                    AREG             => 2,
                    BCASCREG         => 1,
                    BREG             => 2,
                    CARRYINREG       => 1,
                    CARRYINSELREG    => 1,
                    CREG             => 1,
                    DREG             => 1,
                    INMODEREG        => 1,
                    MREG             => 0,
                    OPMODEREG        => 1,
                    PREG             => 1 
                )
                port map (
                    -- Data: input / output data ports
                    A                => dspA_HI,
                    B                => dspB_HI,
                    C                => dspC_HI,
                    D                => (others=>'0'),
                    P                => dspP_HI,
                    PCOUT            => open,
                    -- Control: Inputs/Status Bits
                    ALUMODE          => ALUMODE,
                    INMODE           => (others=>'0'),
                    OPMODE           => "000110011",
                    -- Carry input data
                    ACIN             => (others=>'0'),    
                    BCIN             => (others=>'0'),
                    PCIN             => (others=>'0'),
                    CARRYINSEL       => "010",
                    CARRYCASCIN      => dspP_CY,
                    CARRYIN          => '0',
                    MULTSIGNIN       => '0',
                    -- Clock enables
                    CEA1             => '1',
                    CEA2             => '1',
                    CEAD             => '1',
                    CEALUMODE        => '1',
                    CEB1             => '1',
                    CEB2             => '1',
                    CEC              => '1',
                    CECARRYIN        => '1',
                    CECTRL           => '1',
                    CED              => '1',
                    CEINMODE         => '1',
                    CEM              => '1',
                    CEP              => '1',
                    CLK              => CLK,
                    -- Reset/Clock Enable --
                    RSTA             => RST,
                    RSTALLCARRYIN    => RST,
                    RSTALUMODE       => RST,
                    RSTB             => RST,
                    RSTC             => RST,
                    RSTCTRL          => RST,
                    RSTD             => RST,
                    RSTINMODE        => RST,
                    RSTM             => RST,
                    RSTP             => RST
                );

            xDSP_ADD1: DSP48E2
                generic map (
                    -- Feature Control Attributes: Data Path Selection
                    USE_MULT         => "NONE",
                    -- Register Control Attributes: Pipeline Register Configuration
                    ACASCREG         => 1,
                    ADREG            => 1,
                    ALUMODEREG       => 1,
                    AREG             => 1,
                    BCASCREG         => 1,
                    BREG             => 1,
                    CARRYINREG       => 1,
                    CARRYINSELREG    => 1,
                    CREG             => 1,
                    DREG             => 1,
                    INMODEREG        => 1,
                    MREG             => 0,
                    OPMODEREG        => 1,
                    PREG             => 1 
                )
                port map (
                    -- Data: input / output data ports
                    A                => dspA_LO,
                    B                => dspB_LO,
                    C                => dspC_LO,
                    D                => (others=>'0'),
                    P                => dspP_LO,
                    PCOUT            => open,
                    -- Control: Inputs/Status Bits
                    ALUMODE          => ALUMODE,
                    INMODE           => (others=>'0'),
                    OPMODE           => "000110011",
                    -- Carry input data
                    ACIN             => (others=>'0'),    
                    BCIN             => (others=>'0'),
                    PCIN             => (others=>'0'),
                    CARRYINSEL       => (others=>'0'),
                    CARRYCASCIN      => '0',
                    CARRYIN          => '0',
                    MULTSIGNIN       => '0',
                    CARRYCASCOUT     => dspP_CY,
                    -- Clock enables
                    CEA1             => '1',
                    CEA2             => '1',
                    CEAD             => '1',
                    CEALUMODE        => '1',
                    CEB1             => '1',
                    CEB2             => '1',
                    CEC              => '1',
                    CECARRYIN        => '1',
                    CECTRL           => '1',
                    CED              => '1',
                    CEINMODE         => '1',
                    CEM              => '1',
                    CEP              => '1',
                    CLK              => CLK,
                    -- Reset/Clock Enable --
                    RSTA             => RST,
                    RSTALLCARRYIN    => RST,
                    RSTALUMODE       => RST,
                    RSTB             => RST,
                    RSTC             => RST,
                    RSTCTRL          => RST,
                    RSTD             => RST,
                    RSTINMODE        => RST,
                    RSTM             => RST,
                    RSTP             => RST
                );
        end generate;
    end generate;    
 
    
end int_cmult_trpl52_dsp48;