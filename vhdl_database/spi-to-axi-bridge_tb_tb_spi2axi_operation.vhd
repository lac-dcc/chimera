-------------------------------------------------------------------------------
--
--  SPI to AXI4-Lite Bridge, test controller entity declaration 
--
--  Description:  
--    Normal operation testcase
--
--  Author(s):
--    Guy Eschemann, guy@airhdl.com
--
-------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library OSVVM;
context OSVVM.OsvvmContext;
use osvvm.ScoreboardPkg_slv.all;

library osvvm_axi4;
use osvvm_axi4.Axi4OptionsPkg.all;

architecture operation of tb_spi2axi_testctrl is

    -------------------------------------------------------------------------------
    -- Constants
    -------------------------------------------------------------------------------

    constant SPI_PACKET_LENGTH_BYTES : natural := 11;

    -------------------------------------------------------------------------------
    -- Aliases
    -------------------------------------------------------------------------------

    alias TxBurstFifo : ScoreboardIdType is SpiRec.BurstFifo;
    alias RxBurstFifo : ScoreboardIdType is SpiRec.BurstFifo;

begin

    ------------------------------------------------------------
    -- ControlProc
    --   Set up AlertLog and wait for end of test
    ------------------------------------------------------------
    ControlProc : process
        procedure spi_process(tx_bytes : integer_vector; rx_bytes : out integer_vector) is
            variable num_bytes     : integer;
            variable valid         : boolean;
            variable rx_byte       : std_logic_vector(7 downto 0);
            variable bytes_to_send : integer;
        begin
            -- Push TX bytes to SPI VC
            PushBurst(TxBurstFifo, tx_bytes, 8);
            SendBurst(SpiRec, tx_bytes'length);

            -- Fetch RX bytes from SPI VC
            GetBurst(SpiRec, num_bytes);
            AlertIfNot(num_bytes = tx_bytes'length, "unexpected number of received bytes");
            for i in 0 to num_bytes - 1 loop
                PopWord(RxBurstFifo, valid, rx_byte, bytes_to_send);
                AlertIfNot(valid, "invalid receive data");
                Log("RX byte: " & to_string(rx_byte), DEBUG);
                rx_bytes(i) := to_integer(unsigned(rx_byte));
            end loop;
        end procedure;

        -- Write an AXI4 register over SPI
        procedure spi_write(addr : unsigned(31 downto 0); data : std_logic_vector(31 downto 0); status : out std_logic_vector(7 downto 0)) is
            variable tx_bytes    : integer_vector(0 to SPI_PACKET_LENGTH_BYTES - 1);
            variable rx_bytes    : integer_vector(0 to SPI_PACKET_LENGTH_BYTES - 1);
            variable tx_byte_idx : natural;
        begin
            Log("SPI Write: addr = 0x" & to_hxstring(addr) & ", data = 0x" & to_hxstring(data), DEBUG);
            tx_byte_idx           := 0;
            tx_bytes(tx_byte_idx) := 0; -- write
            tx_byte_idx           := tx_byte_idx + 1;
            for i in 3 downto 0 loop
                tx_bytes(tx_byte_idx) := to_integer(addr(i * 8 + 7 downto i * 8));
                tx_byte_idx           := tx_byte_idx + 1;
            end loop;
            for i in 3 downto 0 loop
                tx_bytes(tx_byte_idx) := to_integer(unsigned(data(i * 8 + 7 downto i * 8)));
                tx_byte_idx           := tx_byte_idx + 1;
            end loop;
            tx_bytes(tx_byte_idx) := 0; -- a dummy byte to allow writing the data word
            tx_byte_idx           := tx_byte_idx + 1;
            tx_bytes(tx_byte_idx) := 0; -- AXI4 write response
            tx_byte_idx           := tx_byte_idx + 1;
            assert tx_byte_idx = tx_bytes'length severity failure;
            --
            spi_process(tx_bytes, rx_bytes);
            status                := std_logic_vector(to_unsigned(rx_bytes(10), 8));
        end procedure;

        -- Read an AXI4 register over SPI
        procedure spi_read(addr : unsigned(31 downto 0); data : out std_logic_vector(31 downto 0); status : out std_logic_vector(7 downto 0)) is
            variable tx_bytes    : integer_vector(0 to SPI_PACKET_LENGTH_BYTES - 1);
            variable rx_bytes    : integer_vector(0 to SPI_PACKET_LENGTH_BYTES - 1);
            variable tx_byte_idx : natural;
        begin
            Log("SPI Write: addr = 0x" & to_hxstring(addr) & ", data = 0x" & to_hxstring(data), DEBUG);
            tx_byte_idx           := 0;
            tx_bytes(tx_byte_idx) := 1; -- read
            tx_byte_idx           := tx_byte_idx + 1;
            for i in 3 downto 0 loop
                tx_bytes(tx_byte_idx) := to_integer(addr(i * 8 + 7 downto i * 8));
                tx_byte_idx           := tx_byte_idx + 1;
            end loop;
            for i in 0 to 5 loop
                tx_bytes(tx_byte_idx) := 0; -- don't care
                tx_byte_idx           := tx_byte_idx + 1;
            end loop;
            assert tx_byte_idx = tx_bytes'length severity failure;
            --
            spi_process(tx_bytes, rx_bytes);
            data(31 downto 24) := std_logic_vector(to_unsigned(rx_bytes(6), 8));
            data(23 downto 16) := std_logic_vector(to_unsigned(rx_bytes(7), 8));
            data(15 downto 8)  := std_logic_vector(to_unsigned(rx_bytes(8), 8));
            data(7 downto 0)   := std_logic_vector(to_unsigned(rx_bytes(9), 8));
            status             := std_logic_vector(to_unsigned(rx_bytes(10), 8));
        end procedure;

        variable addr    : unsigned(31 downto 0);
        variable wdata   : std_logic_vector(31 downto 0);
        variable rdata   : std_logic_vector(31 downto 0);
        variable mem_reg : std_logic_vector(31 downto 0);
        variable status  : std_logic_vector(7 downto 0);

        alias s_axi_awvalid_mask is << signal .tb_spi2axi.s_axi_awvalid_mask : std_logic >>;
        alias s_axi_arvalid_mask is << signal .tb_spi2axi.s_axi_arvalid_mask : std_logic >>;

    begin
        -- Initialization of test
        SetAlertLogName("tb_spi2axi_operation");
        SetLogEnable(INFO, TRUE);
        SetLogEnable(DEBUG, FALSE);
        SetLogEnable(PASSED, FALSE);
        SetLogEnable(FindAlertLogID("Axi4LiteMemory"), INFO, FALSE, TRUE);

        -- Wait for testbench initialization 
        wait for 0 ns;

        -- Wait for Design Reset
        wait until nReset = '1';
        ClearAlerts;

        SetCPHA(SpiRec, SPI_CPHA);
        SetCPOL(SpiRec, SPI_CPOL);

        wait for 1 us;

        Log("Testing normal SPI write");
        addr  := x"76543210";
        wdata := x"12345678";
        spi_write(addr, wdata, status);
        AffirmIfEqual(status(2), '0', "timeout");
        AffirmIfEqual(status(1 downto 0), "00", "write response");

        Read(Axi4MemRec, std_logic_vector(addr), mem_reg);
        AffirmIfEqual(mem_reg, wdata, "memory data word");

        Log("Testing SPI write with SLVERR response");
        addr  := x"76543210";
        wdata := x"12345678";
        SetAxi4Options(Axi4MemRec, BRESP, 2); -- SLVERR
        spi_write(addr, wdata, status);
        AffirmIfEqual(status(2), '0', "Timeout");
        AffirmIfEqual(status(1 downto 0), "10", "Write response");
        SetAxi4Options(Axi4MemRec, BRESP, 0);

        Log("Testing SPI write timeout");
        s_axi_awvalid_mask <= force '0';
        addr               := x"76543210";
        wdata              := x"12345678";
        spi_write(addr, wdata, status);
        AffirmIfEqual('1', status(2), "timeout");
        s_axi_awvalid_mask <= release;

        Log("Testing normal SPI read");
        addr  := x"12345678";
        wdata := x"12345678";
        Write(Axi4MemRec, std_logic_vector(addr), wdata);
        spi_read(addr, rdata, status);
        AffirmIfEqual(rdata, wdata, "read data");
        AffirmIfEqual('0', status(2), "timeout");
        AffirmIfEqual("00", status(1 downto 0), "read response");

        Log("Testing SPI read with DECERR response");
        addr  := x"12345678";
        wdata := x"12345678";
        SetAxi4Options(Axi4MemRec, RRESP, 3); -- DECERR
        spi_read(addr, rdata, status);
        AffirmIfEqual(rdata, wdata, "read data");
        AffirmIfEqual('0', status(2), "timeout");
        AffirmIfEqual("11", status(1 downto 0), "read response");
        SetAxi4Options(Axi4MemRec, RRESP, 0);

        Log("Testing SPI read timeout");
        s_axi_arvalid_mask <= force '0';
        spi_read(addr, rdata, status);
        AffirmIfEqual('1', status(2), "timeout");
        s_axi_arvalid_mask <= release;

        wait for 1 us;

        EndOfTestReports;
        std.env.stop;
        wait;
    end process ControlProc;

end architecture operation;

configuration tb_spi2axi_operation of tb_spi2axi is
    for TestHarness
        for testctrl_inst : tb_spi2axi_testctrl
            use entity work.tb_spi2axi_testctrl(operation);
        end for;
    end for;
end tb_spi2axi_operation;
