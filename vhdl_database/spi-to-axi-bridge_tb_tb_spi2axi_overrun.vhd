-------------------------------------------------------------------------------
--
--  SPI to AXI4-Lite Bridge, test controller entity declaration 
--
--  Description:  
--    SPI overrun testcase
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

architecture overrun of tb_spi2axi_testctrl is

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

        variable addr     : unsigned(31 downto 0);
        variable wdata    : std_logic_vector(31 downto 0);
        variable mem_reg  : std_logic_vector(31 downto 0);
        variable status   : std_logic_vector(7 downto 0);
        variable tx_bytes : integer_vector(0 to SPI_PACKET_LENGTH_BYTES);
        variable rx_bytes : integer_vector(0 to SPI_PACKET_LENGTH_BYTES); -- @suppress "variable rx_bytes is never read"

    begin
        -- Initialization of test
        SetAlertLogName("tb_spi2axi_overrun");
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

        Log("Testing 12-byte SPI write");
        tx_bytes := (others => 0);
        spi_process(tx_bytes, rx_bytes);

        Log("Testing normal SPI write");
        addr  := x"76543210";
        wdata := x"12345678";
        spi_write(addr, wdata, status);
        AlertIf(status(2) /= '0', "unexpected timeout");
        AlertIf(status(1 downto 0) /= "00", "unexpected write response");

        Read(Axi4MemRec, std_logic_vector(addr), mem_reg);
        AffirmIfEqual(mem_reg, wdata, "Memory data word: ");

        wait for 1 us;

        EndOfTestReports;
        std.env.stop;
        wait;
    end process ControlProc;

end architecture overrun;

configuration tb_spi2axi_overrun of tb_spi2axi is
    for TestHarness
        for testctrl_inst : tb_spi2axi_testctrl
            use entity work.tb_spi2axi_testctrl(overrun);
        end for;
    end for;
end tb_spi2axi_overrun;
