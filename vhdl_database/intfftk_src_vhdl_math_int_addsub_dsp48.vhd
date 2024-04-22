-------------------------------------------------------------------------------
--
-- Title       : int_addsub_dsp48
-- Design      : FFTK
-- Author      : Kapitanov
-- Company     :
--
-- Description : Integer adder/subtractor on DSP48 block
--
-------------------------------------------------------------------------------
--
--    Version 1.0: 12.02.2018
--
--  Description: Simple complex adder/subtractor by DSP48 unit
--
--  Math:
--
--  Out:    In:
--  OX_RE = IA_RE + IB_RE;
--  OX_IM = IA_IM + IB_IM; 
--  OY_RE = IA_RE - IB_RE; 
--  OY_IM = IA_IM - IB_IM; 
--
--    Input variables:
--    1. DSPW - DSP48 input width (from 8 to 48): data width + FFT stage
--    2. XSER - Xilinx series: 
--        "NEW" - DSP48E2 (Ultrascale), 
--        "OLD" - DSP48E1 (6/7-series).
--
--  DSP48 data signals:
--    A port - In B data (MSB part),
--    B port - In B data (LSB part),
--    C port - In A data,
--    P port - Output data: P = C +/- A:B 
--
--  IF (DSPW < 25) 
--    use DSP48 SIMD mode (dual 24-bit) add/subtract
--  ELSE 
--    don't use DSP48 SIMD mode (one 48-bit) add/subtract
--
--  DSP48E1 options:
--  [A:B] and [C] port: - OPMODE: "0110011" (Z = 011, Y = 00, X = 11)
--  Add op: ALUMODE - "0000" Z + Y + X,
--  Sub op: ALUMODE - "0011" Z + Y + X;
--
--  DSP48E2 options:
--  [A:B] and [C] port: - OPMODE: "000110011" (W = 00, Z = 011, Y = 00, X = 11)
--  Add op: ALUMODE - "0000" P = Z + Y + X,
--  Sub op: ALUMODE - "0011" P = Z - Y - X;
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
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.DSP48E1;
use unisim.vcomponents.DSP48E2;

entity int_addsub_dsp48 is
    generic (
        DSPW      : natural:=24;   --! Input data width for DSP48
        XSER      : string :="NEW" --! Xilinx series: NEW - DSP48E2, OLD - DSP48E1
    );
    port (
        IA_RE     : in  std_logic_vector(DSPW-1 downto 0); --! Real input data A (even)
        IA_IM     : in  std_logic_vector(DSPW-1 downto 0); --! Imag input data A (even)
        IB_RE     : in  std_logic_vector(DSPW-1 downto 0); --! Real input data B (odd)
        IB_IM     : in  std_logic_vector(DSPW-1 downto 0); --! Imag input data B (odd)

        OX_RE     : out std_logic_vector(DSPW downto 0); --! Real output data X (even)
        OX_IM     : out std_logic_vector(DSPW downto 0); --! Imag output data X (even)
        OY_RE     : out std_logic_vector(DSPW downto 0); --! Real output data Y (odd)
        OY_IM     : out std_logic_vector(DSPW downto 0); --! Imag output data Y (odd)

        RST      : in  std_logic; --! Global reset
        CLK      : in  std_logic  --! Math clock    
    );
end int_addsub_dsp48;

architecture int_addsub_dsp48 of int_addsub_dsp48 is

begin

xGEN_HIGH: if (DSPW > 23) and (DSPW < 48) generate
    signal dspA_RE   : std_logic_vector(29 downto 0);
    signal dspB_RE   : std_logic_vector(17 downto 0);
    signal dspC_RE   : std_logic_vector(47 downto 0);

    signal dspA_IM   : std_logic_vector(29 downto 0);
    signal dspB_IM   : std_logic_vector(17 downto 0);
    signal dspC_IM   : std_logic_vector(47 downto 0);
    
    signal dspX_RE   : std_logic_vector(47 downto 0);
    signal dspX_IM   : std_logic_vector(47 downto 0);
    signal dspY_RE   : std_logic_vector(47 downto 0);
    signal dspY_IM   : std_logic_vector(47 downto 0);

begin

    ---- Create A:B 48-bit data ----
    dspB_RE <= IB_RE(17 downto 00);
    dspB_IM <= IB_IM(17 downto 00);
    
    ---- A port 48-bit data ----
    xFOR_A: for ii in 0 to 29 generate
        xL: if (ii < (DSPW-18)) generate
            dspA_RE(ii) <= IB_RE(ii+18);
            dspA_IM(ii) <= IB_IM(ii+18);
        end generate;
        xH: if (ii > (DSPW-1-18)) generate
            dspA_RE(ii) <= IB_RE(DSPW-1);
            dspA_IM(ii) <= IB_IM(DSPW-1);
        end generate;
    end generate;
    
    ---- C port 48-bit data ----
    xFOR_C: for ii in 0 to 47 generate
        xL: if (ii < DSPW) generate
            dspC_RE(ii) <= IA_RE(ii);
            dspC_IM(ii) <= IA_IM(ii);
        end generate;
        xH: if (ii > (DSPW-1)) generate
            dspC_RE(ii) <= IA_RE(DSPW-1);
            dspC_IM(ii) <= IA_IM(DSPW-1);
        end generate;        
    end generate;

        OX_RE <= dspX_RE(DSPW downto 0);
        OX_IM <= dspX_IM(DSPW downto 0);
        OY_RE <= dspY_RE(DSPW downto 0);
        OY_IM <= dspY_IM(DSPW downto 0);

    
    xDSP48E2: if (XSER = "NEW") generate
        xDSP_REX: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_RE, -- 30-bit input: A data input
                B                => dspB_RE, -- 18-bit input: B data input
                C                => dspC_RE, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_RE,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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
            
        xDSP_IMX: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_IM, -- 30-bit input: A data input
                B                => dspB_IM, -- 18-bit input: B data input
                C                => dspC_IM, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_IM,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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
            
        xDSP_REY: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_RE, -- 30-bit input: A data input
                B                => dspB_RE, -- 18-bit input: B data input
                C                => dspC_RE, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_RE,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
            
        xDSP_IMY: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_IM, -- 30-bit input: A data input
                B                => dspB_IM, -- 18-bit input: B data input
                C                => dspC_IM, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_IM,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
    
    xDSP48E1: if (XSER = "OLD") generate

        xDSP_REX: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_RE, -- 30-bit input: A data input
                B                => dspB_RE, -- 18-bit input: B data input
                C                => dspC_RE, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_RE,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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

        xDSP_IMX: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_IM, -- 30-bit input: A data input
                B                => dspB_IM, -- 18-bit input: B data input
                C                => dspC_IM, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_IM,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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

        xDSP_REY: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_RE, -- 30-bit input: A data input
                B                => dspB_RE, -- 18-bit input: B data input
                C                => dspC_RE, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_RE,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
            
        xDSP_IMY: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "ONE48", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_IM, -- 30-bit input: A data input
                B                => dspB_IM, -- 18-bit input: B data input
                C                => dspC_IM, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_IM,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
end generate;


xGEN_LOW: if (DSPW < 24) generate
    signal dspA_XY   : std_logic_vector(29 downto 0);
    signal dspB_XY   : std_logic_vector(17 downto 0);
    signal dspC_XY   : std_logic_vector(47 downto 0);

    signal dspP_XX   : std_logic_vector(47 downto 0);
    signal dspP_YY   : std_logic_vector(47 downto 0);

    signal dspAB     : std_logic_vector(47 downto 0);
begin

    dspC_XY(DSPW-1+00 downto 00) <= IA_RE;
    dspC_XY(DSPW-1+24 downto 24) <= IA_IM;
    dspC_XY(23 downto DSPW+00) <= (others => IA_RE(DSPW-1));
    dspC_XY(47 downto DSPW+24) <= (others => IA_IM(DSPW-1));

    dspAB(DSPW-1+00 downto 00) <= IB_RE;
    dspAB(DSPW-1+24 downto 24) <= IB_IM;
    dspAB(23 downto DSPW+00) <= (others => IB_RE(DSPW-1));
    dspAB(47 downto DSPW+24) <= (others => IB_IM(DSPW-1));

    dspA_XY <= dspAB(47 downto 18);
    dspB_XY <= dspAB(17 downto 00);

    OX_RE <= dspP_XX(DSPW+00 downto 00);
    OX_IM <= dspP_XX(DSPW+24 downto 24);
    OY_RE <= dspP_YY(DSPW+00 downto 00);
    OY_IM <= dspP_YY(DSPW+24 downto 24);


    xDSP48E2: if (XSER = "NEW") generate
        xDSP_X: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "TWO24", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_XY, -- 30-bit input: A data input
                B                => dspB_XY, -- 18-bit input: B data input
                C                => dspC_XY, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspP_XX,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
                INMODE           => (others=>'0'),
                OPMODE           => "000110011",
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

        xDSP_Y: DSP48E2
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "TWO24", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_XY, -- 30-bit input: A data input
                B                => dspB_XY, -- 18-bit input: B data input
                C                => dspC_XY, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspP_YY,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
                INMODE           => (others=>'0'),
                OPMODE           => "000110011",
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

    xDSP48E1: if (XSER = "OLD") generate
        xDSP_X: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT        => "NONE",
                USE_SIMD        => "TWO24", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                MREG            => 0,
                OPMODEREG       => 1,
                PREG            => 1 
            )
            port map (
                -- Data: input / output data ports
                A               => dspA_XY, -- 30-bit input: A data input
                B               => dspB_XY, -- 18-bit input: B data input
                C               => dspC_XY, -- 48-bit input: C data input
                D               => (others=>'0'),
                P               => dspP_XX,
                -- Control: Inputs/Status Bits
                ALUMODE         => "0000",
                INMODE          => (others=>'0'),
                OPMODE          => "0110011",
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

        xDSP_Y: DSP48E1
            generic map (
                -- Feature Control Attributes: Data Path Selection
                USE_MULT         => "NONE",
                USE_SIMD         => "TWO24", -- SIMD ("ONE48", "TWO24", "FOUR12")
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
                A                => dspA_XY, -- 30-bit input: A data input
                B                => dspB_XY, -- 18-bit input: B data input
                C                => dspC_XY, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspP_YY,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
end generate;


xGEN_DBL: if (DSPW > 47) generate
    signal dspA_RE1        : std_logic_vector(29 downto 0);
    signal dspB_RE1        : std_logic_vector(17 downto 0);
    signal dspC_RE1        : std_logic_vector(47 downto 0);

    signal dspA_RE2        : std_logic_vector(29 downto 0);
    signal dspB_RE2        : std_logic_vector(17 downto 0);
    signal dspC_RE2        : std_logic_vector(47 downto 0);

    signal dspA_IM1        : std_logic_vector(29 downto 0);
    signal dspB_IM1        : std_logic_vector(17 downto 0);
    signal dspC_IM1        : std_logic_vector(47 downto 0);

    signal dspA_IM2        : std_logic_vector(29 downto 0);
    signal dspB_IM2        : std_logic_vector(17 downto 0);
    signal dspC_IM2        : std_logic_vector(47 downto 0);

    signal dspX_RE1        : std_logic_vector(47 downto 0);
    signal dspX_IM1        : std_logic_vector(47 downto 0);
    signal dspY_RE1        : std_logic_vector(47 downto 0);
    signal dspY_IM1        : std_logic_vector(47 downto 0);

    signal dspX_RE2        : std_logic_vector(47 downto 0);
    signal dspX_IM2        : std_logic_vector(47 downto 0);
    signal dspY_RE2        : std_logic_vector(47 downto 0);
    signal dspY_IM2        : std_logic_vector(47 downto 0);

    signal dspA_RE        : std_logic_vector(95 downto 0);
    signal dspA_IM        : std_logic_vector(95 downto 0);
    signal dspB_RE        : std_logic_vector(95 downto 0);
    signal dspB_IM        : std_logic_vector(95 downto 0);

    signal dspC_XR        : std_logic;
    signal dspC_XI        : std_logic;
    signal dspC_YR        : std_logic;
    signal dspC_YI        : std_logic;

begin
    ---- generate 96-bit vectors ----
    xFOR: for ii in 0 to 95 generate
        xL: if (ii < DSPW) generate
            dspA_RE(ii) <= IA_RE(ii);
            dspA_IM(ii) <= IA_IM(ii);
            dspB_RE(ii) <= IB_RE(ii);
            dspB_IM(ii) <= IB_IM(ii);
        end generate;
        xH: if (ii > (DSPW-1)) generate
            dspA_RE(ii) <= IA_RE(DSPW-1);
            dspA_IM(ii) <= IA_IM(DSPW-1);
            dspB_RE(ii) <= IB_RE(DSPW-1);
            dspB_IM(ii) <= IB_IM(DSPW-1);
        end generate;        
    end generate;

    ---- Create A:B 48-bit data ----
    dspB_RE1 <= dspB_RE(17 downto 00);
    dspB_IM1 <= dspB_IM(17 downto 00);
    dspA_RE1 <= dspB_RE(47 downto 18);
    dspA_IM1 <= dspB_IM(47 downto 18);

    dspB_RE2 <= dspB_RE(65 downto 48);
    dspB_IM2 <= dspB_IM(65 downto 48);
    dspA_RE2 <= dspB_RE(95 downto 66);
    dspA_IM2 <= dspB_IM(95 downto 66);    
    
    ---- Create A:B 48-bit data ----
    dspC_RE1 <= dspA_RE(47 downto 00); 
    dspC_IM1 <= dspA_IM(47 downto 00); 
    dspC_RE2 <= dspA_RE(95 downto 48) when rising_edge(clk);
    dspC_IM2 <= dspA_IM(95 downto 48) when rising_edge(clk);
    
    ---- P port: output data ----
    OX_RE(47 downto 0) <= dspX_RE1(47 downto 0) after 0.1 ns when rising_edge(clk);
    OX_IM(47 downto 0) <= dspX_IM1(47 downto 0) after 0.1 ns when rising_edge(clk);
    OY_RE(47 downto 0) <= dspY_RE1(47 downto 0) after 0.1 ns when rising_edge(clk);
    OY_IM(47 downto 0) <= dspY_IM1(47 downto 0) after 0.1 ns when rising_edge(clk);
    
    OX_RE(DSPW downto 48) <= dspX_RE2(DSPW-48 downto 0);
    OX_IM(DSPW downto 48) <= dspX_IM2(DSPW-48 downto 0);
    OY_RE(DSPW downto 48) <= dspY_RE2(DSPW-48 downto 0);
    OY_IM(DSPW downto 48) <= dspY_IM2(DSPW-48 downto 0);

    xDSP48E2: if (XSER = "NEW") generate

        xDSP_REX2: DSP48E2
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
                A                => dspA_RE2, -- 30-bit input: A data input
                B                => dspB_RE2, -- 18-bit input: B data input
                C                => dspC_RE2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_RE2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
                INMODE           => (others=>'0'),
                OPMODE           => "000110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_XR,
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

        xDSP_REX1: DSP48E2
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
                A                => dspA_RE1, -- 30-bit input: A data input
                B                => dspB_RE1, -- 18-bit input: B data input
                C                => dspC_RE1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_RE1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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
                CARRYCASCOUT     => dspC_XR,
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

        xDSP_IMX2: DSP48E2
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
                A                => dspA_IM2, -- 30-bit input: A data input
                B                => dspB_IM2, -- 18-bit input: B data input
                C                => dspC_IM2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_IM2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
                INMODE           => (others=>'0'),
                OPMODE           => "000110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_XI,
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

        xDSP_IMX1: DSP48E2
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
                A                => dspA_IM1, -- 30-bit input: A data input
                B                => dspB_IM1, -- 18-bit input: B data input
                C                => dspC_IM1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_IM1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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
                CARRYCASCOUT     => dspC_XI,
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

        xDSP_REY2: DSP48E2
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
                A                => dspA_RE2, -- 30-bit input: A data input
                B                => dspB_RE2, -- 18-bit input: B data input
                C                => dspC_RE2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_RE2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
                INMODE           => (others=>'0'),
                OPMODE           => "000110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_YR,
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

        xDSP_REY1: DSP48E2
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
                A                => dspA_RE1, -- 30-bit input: A data input
                B                => dspB_RE1, -- 18-bit input: B data input
                C                => dspC_RE1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_RE1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
                CARRYCASCOUT     => dspC_YR,
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

        xDSP_IMY2: DSP48E2
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
                A                => dspA_IM2, -- 30-bit input: A data input
                B                => dspB_IM2, -- 18-bit input: B data input
                C                => dspC_IM2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_IM2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
                INMODE           => (others=>'0'),
                OPMODE           => "000110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_YI,
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

        xDSP_IMY1: DSP48E2
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
                A                => dspA_IM1, -- 30-bit input: A data input
                B                => dspB_IM1, -- 18-bit input: B data input
                C                => dspC_IM1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_IM1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
                CARRYCASCOUT     => dspC_YI,
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

    
    xDSP48E1: if (XSER = "OLD") generate
    
        xDSP_REX2: DSP48E1
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
                A                => dspA_RE2, -- 30-bit input: A data input
                B                => dspB_RE2, -- 18-bit input: B data input
                C                => dspC_RE2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_RE2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
                INMODE           => (others=>'0'),
                OPMODE           => "0110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_XR,
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

        xDSP_REX1: DSP48E1
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
                A                => dspA_RE1, -- 30-bit input: A data input
                B                => dspB_RE1, -- 18-bit input: B data input
                C                => dspC_RE1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_RE1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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
                CARRYCASCOUT     => dspC_XR, 
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

        xDSP_IMX2: DSP48E1
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
                A                => dspA_IM2, -- 30-bit input: A data input
                B                => dspB_IM2, -- 18-bit input: B data input
                C                => dspC_IM2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_IM2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
                INMODE           => (others=>'0'),
                OPMODE           => "0110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_XI,
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

        xDSP_IMX1: DSP48E1
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
                A                => dspA_IM1, -- 30-bit input: A data input
                B                => dspB_IM1, -- 18-bit input: B data input
                C                => dspC_IM1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspX_IM1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0000",
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
                CARRYCASCOUT     => dspC_XI, 
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

        xDSP_REY2: DSP48E1
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
                A                => dspA_RE2, -- 30-bit input: A data input
                B                => dspB_RE2, -- 18-bit input: B data input
                C                => dspC_RE2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_RE2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
                INMODE           => (others=>'0'),
                OPMODE           => "0110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_YR,
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

        xDSP_REY1: DSP48E1
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
                A                => dspA_RE1, -- 30-bit input: A data input
                B                => dspB_RE1, -- 18-bit input: B data input
                C                => dspC_RE1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_RE1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
                CARRYCASCOUT     => dspC_YR, 
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

        xDSP_IMY2: DSP48E1
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
                A                => dspA_IM2, -- 30-bit input: A data input
                B                => dspB_IM2, -- 18-bit input: B data input
                C                => dspC_IM2, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_IM2,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
                INMODE           => (others=>'0'),
                OPMODE           => "0110011",
                -- Carry input data
                ACIN             => (others=>'0'),
                BCIN             => (others=>'0'),
                PCIN             => (others=>'0'),
                CARRYINSEL       => "010",
                CARRYCASCIN      => dspC_YI,
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

        xDSP_IMY1: DSP48E1
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
                A                => dspA_IM1, -- 30-bit input: A data input
                B                => dspB_IM1, -- 18-bit input: B data input
                C                => dspC_IM1, -- 48-bit input: C data input
                D                => (others=>'0'),
                P                => dspY_IM1,
                -- Control: Inputs/Status Bits
                ALUMODE          => "0011",
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
                CARRYCASCOUT     => dspC_YI, 
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

end int_addsub_dsp48;