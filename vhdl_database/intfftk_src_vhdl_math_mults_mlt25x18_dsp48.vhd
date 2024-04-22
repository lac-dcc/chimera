-------------------------------------------------------------------------------
--
-- Title       : mlt25x18_dsp48
-- Design      : FFTK
-- Author      : Kapitanov
-- Company     :
--
-- Description : Multiplier 25x18 for DSP48E1, 27x18 for DSP48E2
--
-------------------------------------------------------------------------------
--
--  Version 1.0: 13.02.2018
--
--  Description: Single multiplier by DSP48 unit
--
--  Math: MLT_P = MLT_A * MLT_B
--
--  DSP48 data signals:
--    A port - data width up to 25 (27)* bits
--    B port - data width up to 18 bits
--  * - 25 bits for DSP48E1, 27 bits for DSP48E2.
--
--  Total delay         : 3 clock cycles,
--  Total resources     : 1 DSP48 units
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
use ieee.std_logic_arith.all;

library unisim;
use unisim.vcomponents.DSP48E1; 
use unisim.vcomponents.DSP48E2; 

entity mlt25x18_dsp48 is
    generic (
        A_WIDTH : integer:=25; --! Port A width < 25(27)
        B_WIDTH : integer:=18; --! Port A width < 18
        XSERIES : string:="OLD" --! Xilinx series: NEW - DSP48E2, OLD - DSP48E1
    );
    port (
        MLT_A   : in  std_logic_vector(A_WIDTH-1 downto 0); --! A port: up to 27 bits
        MLT_B   : in  std_logic_vector(B_WIDTH-1 downto 0); --! B port: up to 18 bits
        MLT_P   : out std_logic_vector(47 downto 0); --! P port: double multiplier
        RST     : in  std_logic; --! Global reset
        CLK     : in  std_logic  --! Math clock 
    );
end mlt25x18_dsp48;

architecture mlt25x18_dsp48 of mlt25x18_dsp48 is

    signal dspA     : std_logic_vector(29 downto 0);
    signal dspB     : std_logic_vector(17 downto 0);

begin
    
    ---- Wrap input data ----
    dspB <= SXT(MLT_B, 18);
    dspA <= SXT(MLT_A, 30);

xOLD: if (XSERIES = "OLD") generate
    ---- Wrap DSP48E1 units ----
    xDSP48: DSP48E1
        generic map (
            -- Feature Control Attributes: Data Path Selection
            USE_MULT        => "MULTIPLY",
            -- Register Control Attributes: Pipeline Register Configuration
            ACASCREG        => 1,
            ADREG           => 1,
            ALUMODEREG      => 1,
            AREG            => 1,
            BCASCREG        => 1,
            BREG            => 1,
            CARRYINREG      => 1,
            CARRYINSELREG   => 1,
            CREG            => 1,
            DREG            => 1,
            INMODEREG       => 1,
            MREG            => 1,
            OPMODEREG       => 1,
            PREG            => 1 
        )       
        port map (         
            -- Data: input / output data ports
            A               => dspA, -- 30-bit input: A data input
            B               => dspB, -- 18-bit input: B data input
            C               => (others=>'0'),
            D               => (others=>'0'),
            P               => MLT_P,
            PCOUT           => open,
            -- Control: Inputs/Status Bits
            ALUMODE         => (others=>'0'),
            INMODE          => (others=>'0'),
            OPMODE          => "0000101",
            -- Carry input data
            ACIN            => (others=>'0'),
            BCIN            => (others=>'0'),
            PCIN            => (others=>'0'),
            CARRYINSEL      => (others=>'0'),
            CARRYCASCIN     => '0',
            CARRYIN         => '0',
            MULTSIGNIN      => '0',
            -- Clock enables
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
            CLK             => CLK,
            -- Reset/Clock Enable --
            RSTA            => RST,
            RSTALLCARRYIN   => RST,
            RSTALUMODE      => RST,
            RSTB            => RST,
            RSTC            => RST,
            RSTCTRL         => RST,
            RSTD            => RST,
            RSTINMODE       => RST,
            RSTM            => RST,
            RSTP            => RST 
        );
end generate;

xNEW: if (XSERIES = "NEW") generate
    ---- Wrap DSP48E1 units ----
    xDSP48: DSP48E2
        generic map (
            -- Feature Control Attributes: Data Path Selection
            USE_MULT        => "MULTIPLY",
            -- Register Control Attributes: Pipeline Register Configuration
            ACASCREG        => 1,
            ADREG           => 1,
            ALUMODEREG      => 1,
            AREG            => 1,
            BCASCREG        => 1,
            BREG            => 1,
            CARRYINREG      => 1,
            CARRYINSELREG   => 1,
            CREG            => 1,
            DREG            => 1,
            INMODEREG       => 1,
            MREG            => 1,
            OPMODEREG       => 1,
            PREG            => 1 
        )       
        port map (         
            -- Data: input / output data ports
            A               => dspA, -- 30-bit input: A data input
            B               => dspB, -- 18-bit input: B data input
            C               => (others=>'0'),
            D               => (others=>'0'),
            P               => MLT_P,
            PCOUT           => open,
            -- Control: Inputs/Status Bits
            ALUMODE         => (others=>'0'),
            INMODE          => (others=>'0'),
            OPMODE          => "000000101",
            -- Carry input data
            ACIN            => (others=>'0'),    
            BCIN            => (others=>'0'),
            PCIN            => (others=>'0'),
            CARRYINSEL      => (others=>'0'),
            CARRYCASCIN     => '0',
            CARRYIN         => '0',
            MULTSIGNIN      => '0',
            -- Clock enables
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
            CLK             => CLK,
            -- Reset/Clock Enable --
            RSTA            => RST,
            RSTALLCARRYIN   => RST,
            RSTALUMODE      => RST,
            RSTB            => RST,
            RSTC            => RST,
            RSTCTRL         => RST,
            RSTD            => RST,
            RSTINMODE       => RST,
            RSTM            => RST,
            RSTP            => RST 
        );
end generate;

end mlt25x18_dsp48;