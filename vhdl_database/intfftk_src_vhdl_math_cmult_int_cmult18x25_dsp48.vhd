-------------------------------------------------------------------------------
--
-- Title       : int_cmult18x25_dsp48
-- Design      : FFTK
-- Author      : Kapitanov
-- Company     :
--
-- Description : Integer complex multiplier on DSP48 block
--
-------------------------------------------------------------------------------
--
--    Version 1.0: 13.02.2018
--
--  Description: Simple complex multiplier by DSP48 unit
--
--  Math:
--
--  Out:    In:
--  1. MP_12 = M2_AA * M2_BB + M1_AA * M1_BB; (ALUMODE = "0000")
--  2. MP_12 = M2_AA * M2_BB - M1_AA * M1_BB; (ALUMODE = "0011")
--
--    Input variables:
--    1. MAW - Input data width for A ports
--    2. MBW - Input data width for B ports
--    3. XSER - Xilinx series: 
--        "NEW" - DSP48E2 (Ultrascale), 
--        "OLD" - DSP48E1 (6/7-series).
--    4. XALU - ALU MODE: 
--        "ADD" - adder
--        "SUB" - subtractor
--
--  DSP48 data signals:
--    A port - data width up to 25 (27) bits
--    B port - data width up to 18 bits
--
--  Total delay     : 4 clock cycles
--  Total resources : 2 DSP48 units
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
use ieee.std_logic_arith.SXT;

library unisim;
use unisim.vcomponents.DSP48E1;
use unisim.vcomponents.DSP48E2;

entity int_cmult18x25_dsp48 is
    generic (
        MAW       : natural:=24;    --! Input data width for A ports
        MBW       : natural:=17;    --! Input data width for B ports
        XALU      : string :="ADD"; --! ADD - adder / SUB - subtractor
        XSER      : string :="NEW"  --! Xilinx series: NEW - DSP48E2, OLD - DSP48E1
    );
    port (
        M1_AA     : in  std_logic_vector(MAW-1 downto 0); --! Real input data
        M1_BB     : in  std_logic_vector(MBW-1 downto 0); --! Imag input data
        M2_AA     : in  std_logic_vector(MAW-1 downto 0); --! Real twiddle factor
        M2_BB     : in  std_logic_vector(MBW-1 downto 0); --! Imag twiddle factor

        MP_12     : out std_logic_vector(47 downto 0); --! Output data
        RST       : in  std_logic; --! Global reset
        CLK       : in  std_logic  --! Math clock    
    );
end int_cmult18x25_dsp48;

architecture int_cmult18x25_dsp48 of int_cmult18x25_dsp48 is

    signal dspA_M1        : std_logic_vector(29 downto 0);
    signal dspB_M1        : std_logic_vector(17 downto 0);

    signal dspA_M2        : std_logic_vector(29 downto 0);
    signal dspB_M2        : std_logic_vector(17 downto 0);

    signal dspP_M1        : std_logic_vector(47 downto 0);
    signal dspP_M2        : std_logic_vector(47 downto 0);

    signal ALUMODE        : std_logic_vector(3 downto 0):="0000";

begin
    
    ---- Wrap add / sub ----
    xADD: if (XALU = "ADD") generate
        ALUMODE <= "0000"; -- Z + (X + Y)
    end generate;
    xSUB: if (XALU = "SUB") generate
        ALUMODE <= "0011"; -- Z - (X + Y)
    end generate;

    ---- Wrap input data B ----
    dspB_M1 <= SXT(M1_BB, 18);
    dspB_M2 <= SXT(M2_BB, 18);
    ---- Wrap input data A ----
    dspA_M1 <= SXT(M1_AA, 30);
    dspA_M2 <= SXT(M2_AA, 30);

    ---- Output data ----
    MP_12 <= dspP_M1;

    ---- Wrap DSP48E1 units ----
    xDSP48E1: if (XSER = "OLD") generate
        xDSP_M1: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT          => "MULTIPLY",
                -- Register Control Attributes: Pipeline Register Configuration
                ACASCREG          => 1,
                ADREG             => 1,
                ALUMODEREG        => 1,
                AREG              => 2,
                BCASCREG          => 1,
                BREG              => 2,
                CARRYINREG        => 1,
                CARRYINSELREG     => 1,
                CREG              => 1,
                DREG              => 1,
                INMODEREG         => 1,
                MREG              => 1,
                OPMODEREG         => 1,
                PREG              => 1 
            )
            port map (         
                -- Data: input / output data ports
                A                 => dspA_M1, -- 30-bit input: A data input
                B                 => dspB_M1, -- 18-bit input: B data input
                C                 => (others=>'0'),
                D                 => (others=>'0'),
                P                 => dspP_M1,
                PCOUT             => open,
                -- Control: Inputs/Status Bits
                ALUMODE           => ALUMODE,
                INMODE            => (others=>'0'),
                OPMODE            => "0010101",
                -- Carry input data
                ACIN              => (others=>'0'),
                BCIN              => (others=>'0'),
                PCIN              => dspP_M2,
                CARRYINSEL        => (others=>'0'),
                CARRYCASCIN       => '0',
                CARRYIN           => '0',
                MULTSIGNIN        => '0',
                -- Clock enables
                CEA1              => '1',
                CEA2              => '1',
                CEAD              => '1',
                CEALUMODE         => '1',
                CEB1              => '1',
                CEB2              => '1',
                CEC               => '1',
                CECARRYIN         => '1',
                CECTRL            => '1',
                CED               => '1',
                CEINMODE          => '1',
                CEM               => '1',
                CEP               => '1',
                CLK               => CLK,
                -- Reset/Clock Enable --
                RSTA              => RST,
                RSTALLCARRYIN     => RST,
                RSTALUMODE        => RST,
                RSTB              => RST,
                RSTC              => RST,
                RSTCTRL           => RST,
                RSTD              => RST,
                RSTINMODE         => RST,
                RSTM              => RST,
                RSTP              => RST 
            );

        xDSP_M2: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT          => "MULTIPLY",
                -- Register Control Attributes: Pipeline Register Configuration
                ACASCREG          => 1,
                ADREG             => 1,
                ALUMODEREG        => 1,
                AREG              => 1,
                BCASCREG          => 1,
                BREG              => 1,
                CARRYINREG        => 1,
                CARRYINSELREG     => 1,
                CREG              => 1,
                DREG              => 1,
                INMODEREG         => 1,
                MREG              => 1,
                OPMODEREG         => 1,
                PREG              => 1 
            )
            port map (
                -- Data: input / output data ports
                A                 => dspA_M2, -- 30-bit input: A data input
                B                 => dspB_M2, -- 18-bit input: B data input
                C                 => (others=>'0'),
                D                 => (others=>'0'),
                P                 => open,
                PCOUT             => dspP_M2,
                -- Control: Inputs/Status Bits
                ALUMODE           => "0000",
                INMODE            => (others=>'0'),
                OPMODE            => "0000101",
                -- Carry input data
                ACIN              => (others=>'0'),
                BCIN              => (others=>'0'),
                PCIN              => (others=>'0'),
                CARRYINSEL        => (others=>'0'),
                CARRYCASCIN       => '0',
                CARRYIN           => '0',
                MULTSIGNIN        => '0',
                -- Clock enables
                CEA1              => '1',
                CEA2              => '1',
                CEAD              => '1',
                CEALUMODE         => '1',
                CEB1              => '1',
                CEB2              => '1',
                CEC               => '1',
                CECARRYIN         => '1',
                CECTRL            => '1',
                CED               => '1',
                CEINMODE          => '1',
                CEM               => '1',
                CEP               => '1',
                CLK               => CLK,
                -- Reset/Clock Enable --
                RSTA              => RST,
                RSTALLCARRYIN     => RST,
                RSTALUMODE        => RST,
                RSTB              => RST,
                RSTC              => RST,
                RSTCTRL           => RST,
                RSTD              => RST,
                RSTINMODE         => RST,
                RSTM              => RST,
                RSTP              => RST 
            );
    end generate;

    ---- Wrap DSP48E1 units ----
    xDSP48E2: if (XSER = "NEW") generate

        xDSP_M1: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "MULTIPLY",
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
                MREG             => 1,
                OPMODEREG        => 1,
                PREG             => 1 
            )
            port map (
                -- Data: input / output data ports
                A                => dspA_M1, -- 30-bit input: A data input
                B                => dspB_M1, -- 18-bit input: B data input
                C                => (others=>'0'),
                D                => (others=>'0'),
                P                => dspP_M1,
                PCOUT            => open,
                -- Control: Inputs/Status Bits
                ALUMODE          => ALUMODE,
                INMODE           => (others=>'0'),
                OPMODE           => "000010101",
                -- Carry input data
                ACIN             => (others=>'0'),    
                BCIN             => (others=>'0'),
                PCIN             => dspP_M2,
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

        xDSP_M2: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "MULTIPLY",
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
                MREG             => 1,
                OPMODEREG        => 1,
                PREG             => 1 
            )
            port map (
                -- Data: input / output data ports
                A                => dspA_M2, -- 30-bit input: A data input
                B                => dspB_M2, -- 18-bit input: B data input
                C                => (others=>'0'),
                D                => (others=>'0'),
                P                => open,
                PCOUT            => dspP_M2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
                INMODE           => (others=>'0'),
                OPMODE           => "000000101",
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

end int_cmult18x25_dsp48;