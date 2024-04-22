----------------------------------------------------------------------------------------------------
--
--  SPI to AXI4-Lite Bridge Testbench
--
--  Description:  
--    OSVVM testbench for the SPI to AXI4-Lite Bridge component. Use SPI master verification 
--    component (VC) to issue SPI transactions to the unit under test, and AXI4Lite subordinate 
--    VC to emulate an AXI4 lite register bank.
--
--  Author(s):
--    Guy Eschemann, guy@airhdl.com
--
----------------------------------------------------------------------------------------------------
--
-- Copyright (c) 2022 Guy Eschemann
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library OSVVM;
context OSVVM.OsvvmContext;

library osvvm_spi;
context osvvm_spi.SpiContext;

library osvvm_axi4;
context osvvm_axi4.Axi4LiteContext;

entity tb_spi2axi is
    generic(
        SPI_CPOL : natural range 0 to 1 := 0; -- SPI clock polarity
        SPI_CPHA : natural range 0 to 1 := 0 -- SPI clock phase
    );
end entity tb_spi2axi;

architecture TestHarness of tb_spi2axi is

    -------------------------------------------------------------------------------
    -- Components
    -------------------------------------------------------------------------------

    component tb_spi2axi_testctrl is
        generic(
            SPI_CPOL : natural range 0 to 1; -- SPI clock polarity
            SPI_CPHA : natural range 0 to 1 -- SPI clock phase
        );
        port(
            -- Record Interfaces
            SpiRec     : inout SpiRecType;
            Axi4MemRec : inout AddressBusRecType;
            -- Global Signal Interface
            Clk        : in    std_logic;
            nReset     : in    std_logic
        );
    end component;

    ------------------------------------------------------------------------------------------------
    -- Constants
    ------------------------------------------------------------------------------------------------

    constant AXI_ADDR_WIDTH : integer := 32; -- AXI address bus width, in bits
    constant AXI_DATA_WIDTH : integer := 32;
    constant AXI_STRB_WIDTH : integer := AXI_DATA_WIDTH / 8;
    constant AXI_CLK_PERIOD : time    := 10 ns;
    constant TPD            : time    := 2 ns;

    ------------------------------------------------------------------------------------------------
    -- Signals
    ------------------------------------------------------------------------------------------------

    signal Axi4LiteBus        : Axi4LiteRecType(
        WriteAddress(Addr(AXI_ADDR_WIDTH - 1 downto 0)),
        WriteData(Data(AXI_DATA_WIDTH - 1 downto 0), Strb(AXI_STRB_WIDTH - 1 downto 0)),
        ReadAddress(Addr(AXI_ADDR_WIDTH - 1 downto 0)),
        ReadData(Data(AXI_DATA_WIDTH - 1 downto 0))
    );
    signal Axi4MemRec         : AddressBusRecType(
        Address(AXI_ADDR_WIDTH - 1 downto 0),
        DataToModel(AXI_DATA_WIDTH - 1 downto 0),
        DataFromModel(AXI_DATA_WIDTH - 1 downto 0)
    );
    signal SpiRec             : SpiRecType;
    signal spi_sck            : std_logic; -- SPI clock
    signal spi_ss_n           : std_logic; -- SPI slave select (low active)
    signal spi_mosi           : std_logic; -- SPI master-out-slave-in
    signal spi_miso           : std_logic; -- SPI master-in-slave-out
    signal axi_aclk           : std_logic;
    signal axi_aresetn        : std_logic;
    signal s_axi_awvalid      : std_logic;
    signal s_axi_awvalid_mask : std_logic := '1'; -- @suppress "signal s_axi_awvalid_mask is never written"
    signal s_axi_arvalid      : std_logic;
    signal s_axi_arvalid_mask : std_logic := '1'; -- @suppress "signal s_axi_arvalid_mask is never written"

begin

    ------------------------------------------------------------------------------------------------
    -- Clock generator
    ------------------------------------------------------------------------------------------------

    Osvvm.TbUtilPkg.CreateClock(
        Clk    => axi_aclk,
        Period => AXI_CLK_PERIOD
    );

    ------------------------------------------------------------------------------------------------
    -- Reset generator
    ------------------------------------------------------------------------------------------------

    Osvvm.TbUtilPkg.CreateReset(
        Reset       => axi_aresetn,
        ResetActive => '0',
        Clk         => axi_aclk,
        Period      => 7 * AXI_CLK_PERIOD,
        tpd         => TPD
    );

    ------------------------------------------------------------------------------------------------
    -- Test controller
    ------------------------------------------------------------------------------------------------

    testctrl_inst : tb_spi2axi_testctrl
        generic map(
            SPI_CPOL => SPI_CPOL,
            SPI_CPHA => SPI_CPHA
        )
        port map(
            SpiRec     => SpiRec,
            Axi4MemRec => Axi4MemRec,
            Clk        => axi_aclk,
            nReset     => axi_aresetn
        );

    ------------------------------------------------------------------------------------------------
    -- SPI master verification component
    ------------------------------------------------------------------------------------------------

    spi_master_inst : entity osvvm_spi.Spi
        generic map(
            MODEL_ID_NAME       => "Spi",
            DEFAULT_SCLK_PERIOD => SPI_SCLK_PERIOD_1M
        )
        port map(
            TransRec => SpiRec,
            SCLK     => spi_sck,
            SS       => spi_ss_n,
            MOSI     => spi_mosi,
            MISO     => spi_miso
        );

    ------------------------------------------------------------------------------------------------
    -- Unit under test
    ------------------------------------------------------------------------------------------------

    uut : entity work.spi2axi
        generic map(
            SPI_CPOL       => SPI_CPOL,
            SPI_CPHA       => SPI_CPHA,
            AXI_ADDR_WIDTH => AXI_ADDR_WIDTH
        )
        port map(
            spi_sck       => spi_sck,
            spi_ss_n      => spi_ss_n,
            spi_mosi      => spi_mosi,
            spi_miso      => spi_miso,
            axi_aclk      => axi_aclk,
            axi_aresetn   => axi_aresetn,
            s_axi_awaddr  => Axi4LiteBus.WriteAddress.Addr,
            s_axi_awprot  => Axi4LiteBus.WriteAddress.Prot,
            s_axi_awvalid => s_axi_awvalid, -- Axi4LiteBus.WriteAddress.Valid,
            s_axi_awready => Axi4LiteBus.WriteAddress.Ready,
            s_axi_wdata   => Axi4LiteBus.WriteData.Data,
            s_axi_wstrb   => Axi4LiteBus.WriteData.Strb,
            s_axi_wvalid  => Axi4LiteBus.WriteData.Valid,
            s_axi_wready  => Axi4LiteBus.WriteData.Ready,
            s_axi_araddr  => Axi4LiteBus.ReadAddress.Addr,
            s_axi_arprot  => Axi4LiteBus.ReadAddress.Prot,
            s_axi_arvalid => s_axi_arvalid,
            s_axi_arready => Axi4LiteBus.ReadAddress.Ready,
            s_axi_rdata   => Axi4LiteBus.ReadData.Data,
            s_axi_rresp   => Axi4LiteBus.ReadData.Resp,
            s_axi_rvalid  => Axi4LiteBus.ReadData.Valid,
            s_axi_rready  => Axi4LiteBus.ReadData.Ready,
            s_axi_bresp   => Axi4LiteBus.WriteResponse.Resp,
            s_axi_bvalid  => Axi4LiteBus.WriteResponse.Valid,
            s_axi_bready  => Axi4LiteBus.WriteResponse.Ready
        );

    Axi4LiteBus.WriteAddress.Valid <= s_axi_awvalid and s_axi_awvalid_mask;
    Axi4LiteBus.ReadAddress.Valid  <= s_axi_arvalid and s_axi_arvalid_mask;

    ------------------------------------------------------------------------------------------------
    -- AXI4 lite memory verification component
    ------------------------------------------------------------------------------------------------

    axi4lite_memory_inst : entity osvvm_axi4.Axi4LiteMemory
        generic map(
            MODEL_ID_NAME => "Axi4LiteMemory",
            MEMORY_NAME   => "Axi4LiteMemory",
            tperiod_Clk   => AXI_CLK_PERIOD
        )
        port map(
            -- Globals
            Clk      => axi_aclk,
            nReset   => axi_aresetn,
            -- AXI Manager Functional Interface
            AxiBus   => Axi4LiteBus,
            -- Testbench Transaction Interface
            TransRec => Axi4MemRec
        );

end architecture TestHarness;
