-------------------------------------------------------------------------------
--
--  SPI to AXI4-Lite Bridge
--
--  Description:  
--    An SPI to AXI4-Lite Bridge to allow accessing AXI4-Lite register banks 
--    over SPI. See https://airhdl.com for a popular, web-based AXI4 register 
--    generator.
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity spi2axi is
    generic(
        SPI_CPOL       : natural range 0 to 1 := 0; -- SPI clock polarity
        SPI_CPHA       : natural range 0 to 1 := 0; -- SPI clock phase
        AXI_ADDR_WIDTH : integer              := 32 -- AXI address bus width, in bits
    );
    port(
        -- SPI interface
        spi_sck       : in  std_logic;  -- SPI clock
        spi_ss_n      : in  std_logic;  -- SPI slave select (low active)
        spi_mosi      : in  std_logic;  -- SPI master-out-slave-in
        spi_miso      : out std_logic;  -- SPI master-in-slave-out
        -- Clock and Reset
        axi_aclk      : in  std_logic;
        axi_aresetn   : in  std_logic;
        -- AXI Write Address Channel
        s_axi_awaddr  : out std_logic_vector(AXI_ADDR_WIDTH - 1 downto 0);
        s_axi_awprot  : out std_logic_vector(2 downto 0); -- sigasi @suppress "Unused port"
        s_axi_awvalid : out std_logic;
        s_axi_awready : in  std_logic;
        -- AXI Write Data Channel
        s_axi_wdata   : out std_logic_vector(31 downto 0);
        s_axi_wstrb   : out std_logic_vector(3 downto 0);
        s_axi_wvalid  : out std_logic;
        s_axi_wready  : in  std_logic;
        -- AXI Read Address Channel
        s_axi_araddr  : out std_logic_vector(AXI_ADDR_WIDTH - 1 downto 0);
        s_axi_arprot  : out std_logic_vector(2 downto 0); -- sigasi @suppress "Unused port"
        s_axi_arvalid : out std_logic;
        s_axi_arready : in  std_logic;
        -- AXI Read Data Channel
        s_axi_rdata   : in  std_logic_vector(31 downto 0);
        s_axi_rresp   : in  std_logic_vector(1 downto 0);
        s_axi_rvalid  : in  std_logic;
        s_axi_rready  : out std_logic;
        -- AXI Write Response Channel
        s_axi_bresp   : in  std_logic_vector(1 downto 0);
        s_axi_bvalid  : in  std_logic;
        s_axi_bready  : out std_logic
    );
end entity;

architecture rtl of spi2axi is

    ------------------------------------------------------------------------------------------------
    -- Components
    ------------------------------------------------------------------------------------------------

    component synchronizer is
        generic(
            G_INIT_VALUE    : std_logic := '0'; -- initial value of all flip-flops in the module
            G_NUM_GUARD_FFS : positive  := 1); -- number of guard flip-flops after the synchronizing flip-flop
        port(
            i_reset : in  std_logic;    -- asynchronous, high-active
            i_clk   : in  std_logic;    -- destination clock
            i_data  : in  std_logic;
            o_data  : out std_logic);
    end component;

    ------------------------------------------------------------------------------------------------
    -- Subprograms
    ------------------------------------------------------------------------------------------------

    function to_std_logic(value : natural) return std_logic is
    begin
        if value = 0 then
            return '0';
        else
            return '1';
        end if;
    end function;

    ------------------------------------------------------------------------------------------------
    -- Constants
    ------------------------------------------------------------------------------------------------

    constant CMD_WRITE              : std_logic_vector(7 downto 0) := x"00";
    constant CMD_READ               : std_logic_vector(7 downto 0) := x"01";
    constant SPI_FRAME_LENGTH_BYTES : natural                      := 11;

    ------------------------------------------------------------------------------------------------
    -- Types
    ------------------------------------------------------------------------------------------------

    type spi_state_t is (SPI_RECEIVE, SPI_PROCESS_RX_BYTE, SPI_LOAD_TX_BYTE);
    type axi_state_t is (AXI_IDLE, AXI_WRITE_ACK, AXI_WRITE_BRESP, AXI_READ_ADDR_ACK, AXI_READ_DATA);

    ------------------------------------------------------------------------------------------------
    -- Signals
    ------------------------------------------------------------------------------------------------

    -- Registered signals with initial values
    signal spi_state         : spi_state_t                   := SPI_RECEIVE;
    signal axi_state         : axi_state_t                   := AXI_IDLE;
    signal spi_sck_sync_old  : std_logic                     := to_std_logic(SPI_CPOL);
    signal spi_rx_shreg      : std_logic_vector(7 downto 0)  := (others => '0');
    signal spi_tx_shreg      : std_logic_vector(7 downto 0)  := (others => '0');
    signal axi_bresp_valid   : std_logic                     := '0';
    signal axi_bresp         : std_logic_vector(1 downto 0)  := (others => '0');
    signal axi_rresp         : std_logic_vector(1 downto 0)  := (others => '0');
    signal axi_rdata_valid   : std_logic                     := '0';
    signal axi_rdata         : std_logic_vector(31 downto 0) := (others => '0');
    signal spi_rx_cmd        : std_logic_vector(7 downto 0)  := (others => '0');
    signal spi_rx_addr       : std_logic_vector(31 downto 0) := (others => '0');
    signal spi_rx_wdata      : std_logic_vector(31 downto 0) := (others => '0');
    signal spi_rx_valid      : std_logic                     := '0';
    signal s_axi_awvalid_int : std_logic                     := '0';
    signal s_axi_wvalid_int  : std_logic                     := '0';
    signal axi_fsm_reset     : std_logic                     := '1';

    -- Unregistered signals
    signal spi_sck_sync  : std_logic;
    signal spi_ss_n_sync : std_logic;
    signal axi_areset    : std_logic;

begin

    axi_areset <= not axi_aresetn;

    ------------------------------------------------------------------------------------------------
    -- SPI SCK synchronizer
    ------------------------------------------------------------------------------------------------

    spi_sck_sync_inst : synchronizer
        generic map(
            G_INIT_VALUE    => to_std_logic(SPI_CPOL),
            G_NUM_GUARD_FFS => 1
        )
        port map(
            i_reset => axi_areset,
            i_clk   => axi_aclk,
            i_data  => spi_sck,
            o_data  => spi_sck_sync
        );

    spi_ss_sync_inst : synchronizer
        generic map(
            G_INIT_VALUE    => to_std_logic(SPI_CPOL),
            G_NUM_GUARD_FFS => 1
        )
        port map(
            i_reset => axi_areset,
            i_clk   => axi_aclk,
            i_data  => spi_ss_n,
            o_data  => spi_ss_n_sync
        );

    ------------------------------------------------------------------------------------------------
    -- SPI receive/transmit state machine
    ------------------------------------------------------------------------------------------------

    spi_fsm : process(axi_aclk) is
        variable spi_rx_bit_idx  : natural range 0 to 7                      := 0;
        variable spi_rx_byte_idx : natural range 0 to SPI_FRAME_LENGTH_BYTES := 0;
        variable spi_tx_bit_idx  : natural range 0 to 7                      := 0;
        variable spi_tx_byte_idx : natural range 0 to SPI_FRAME_LENGTH_BYTES := 0;
        variable spi_sck_re      : boolean;
        variable spi_sck_fe      : boolean;
        variable spi_tx_byte     : std_logic_vector(7 downto 0);
    begin
        if rising_edge(axi_aclk) then
            if axi_aresetn = '0' then
                spi_rx_bit_idx   := 0;
                spi_rx_byte_idx  := 0;
                spi_tx_bit_idx   := 0;
                spi_tx_byte_idx  := 0;
                spi_tx_byte      := (others => '0');
                spi_sck_sync_old <= to_std_logic(SPI_CPOL);
                spi_rx_valid     <= '0';
                spi_rx_cmd       <= (others => '0');
                spi_rx_addr      <= (others => '0');
                spi_rx_wdata     <= (others => '0');
                spi_rx_shreg     <= (others => '0');
                spi_tx_shreg     <= (others => '0');
                axi_fsm_reset    <= '1';
                spi_state        <= SPI_RECEIVE;
            else
                -- defaults:
                spi_rx_valid     <= '0';
                spi_sck_sync_old <= spi_sck_sync;

                case spi_state is

                    ------------------------------------------------------------------------------------
                    -- Receive the 11-byte SPI frame
                    --  * SPI bytes are received MSB-first
                    ------------------------------------------------------------------------------------
                    when SPI_RECEIVE =>
                        if spi_ss_n_sync = '0' then
                            axi_fsm_reset <= '0';

                            spi_sck_re := spi_sck_sync = '1' and spi_sck_sync_old = '0';
                            spi_sck_fe := spi_sck_sync = '0' and spi_sck_sync_old = '1';

                            -- SPI clock sample edge
                            if (SPI_CPOL = 0 and SPI_CPHA = 0 and spi_sck_re) or
                                (SPI_CPOL = 0 and SPI_CPHA = 1 and spi_sck_fe) or
                                (SPI_CPOL = 1 and SPI_CPHA = 0 and spi_sck_fe) or
                                (SPI_CPOL = 1 and SPI_CPHA = 1 and spi_sck_re) then
                                spi_rx_shreg <= spi_rx_shreg(spi_rx_shreg'high - 1 downto 0) & spi_mosi; -- assuming `spi_mosi` is steady and does not need a synchronizer
                                --
                                if spi_rx_bit_idx = 7 then
                                    spi_rx_bit_idx := 0;
                                    --
                                    if spi_rx_byte_idx < SPI_FRAME_LENGTH_BYTES then -- in case of SPI overrun, stop processing receive bytes
                                        spi_state <= SPI_PROCESS_RX_BYTE;
                                    end if;
                                else
                                    spi_rx_bit_idx := spi_rx_bit_idx + 1;
                                end if;

                            -- SPI clock drive edge
                            elsif (SPI_CPOL = 0 and SPI_CPHA = 0 and spi_sck_fe) or
                            (SPI_CPOL = 0 and SPI_CPHA = 1 and spi_sck_re) or
                            (SPI_CPOL = 1 and SPI_CPHA = 0 and spi_sck_re) or 
                            (SPI_CPOL = 1 and SPI_CPHA = 1 and spi_sck_fe) then
                                if SPI_CPHA = 1 and spi_tx_bit_idx = 0 then
                                    spi_tx_shreg   <= spi_tx_byte;
                                    spi_tx_bit_idx := spi_tx_bit_idx + 1;
                                else
                                    spi_tx_shreg <= spi_tx_shreg(spi_tx_shreg'high - 1 downto 0) & '0';
                                    --
                                    if spi_tx_bit_idx = 7 then
                                        spi_tx_bit_idx := 0;
                                        --
                                        if spi_tx_byte_idx < SPI_FRAME_LENGTH_BYTES - 1 then -- in case of SPI overrun, stop loading transmit bytes
                                            spi_tx_byte_idx := spi_tx_byte_idx + 1;
                                            spi_state       <= SPI_LOAD_TX_BYTE;
                                        end if;
                                    else
                                        spi_tx_bit_idx := spi_tx_bit_idx + 1;
                                    end if;
                                end if;
                            end if;
                        else
                            spi_rx_bit_idx  := 0;
                            spi_rx_byte_idx := 0;
                            spi_tx_bit_idx  := 0;
                            spi_tx_byte_idx := 0;
                            spi_tx_byte     := (others => '0');
                            axi_fsm_reset   <= '1';
                        end if;

                    ------------------------------------------------------------------------------------
                    -- Process the last received SPI byte
                    ------------------------------------------------------------------------------------
                    when SPI_PROCESS_RX_BYTE =>
                        if spi_rx_byte_idx = 0 then
                            spi_rx_cmd <= spi_rx_shreg;
                        else
                            if spi_rx_cmd = CMD_WRITE then
                                if spi_rx_byte_idx <= 4 then
                                    spi_rx_addr <= spi_rx_addr(23 downto 0) & spi_rx_shreg;
                                elsif spi_rx_byte_idx <= 8 then
                                    spi_rx_wdata <= spi_rx_wdata(23 downto 0) & spi_rx_shreg;
                                    --
                                    if spi_rx_byte_idx = 8 then
                                        -- Write data complete -> trigger the AXI write access 
                                        spi_rx_valid <= '1';
                                    end if;
                                else
                                    null; -- don't care
                                end if;
                            else        -- CMD_READ
                                assert spi_rx_cmd = CMD_READ report "unsupported command" severity failure;
                                if spi_rx_byte_idx <= 4 then
                                    spi_rx_addr <= spi_rx_addr(23 downto 0) & spi_rx_shreg;
                                    --
                                    if spi_rx_byte_idx = 4 then
                                        -- Read address complete -> trigger the AXI read access 
                                        spi_rx_valid <= '1';
                                    end if;
                                else
                                    null; -- don't care
                                end if;
                            end if;
                        end if;
                        --
                        spi_rx_byte_idx := spi_rx_byte_idx + 1;
                        spi_state       <= SPI_RECEIVE;

                    ------------------------------------------------------------------------------------
                    -- Load the next SPI transmit byte
                    ------------------------------------------------------------------------------------
                    when SPI_LOAD_TX_BYTE =>
                        spi_tx_byte := (others => '0'); -- default
                        --
                        if spi_rx_cmd = CMD_WRITE then
                            if spi_tx_byte_idx = 10 then
                                -- Write status byte:
                                -- [7:3] reserved
                                -- [2]   timeout
                                -- [1:0] BRESP                                
                                spi_tx_byte                  := (others => '0');
                                spi_tx_byte(2)               := not axi_bresp_valid;
                                spi_tx_byte(axi_bresp'range) := axi_bresp;
                            end if;
                        else            -- CMD_READ
                            if spi_tx_byte_idx <= 5 then
                                null;
                            elsif spi_tx_byte_idx = 6 then
                                spi_tx_byte := axi_rdata(31 downto 24);
                            elsif spi_tx_byte_idx = 7 then
                                spi_tx_byte := axi_rdata(23 downto 16);
                            elsif spi_tx_byte_idx = 8 then
                                spi_tx_byte := axi_rdata(15 downto 8);
                            elsif spi_tx_byte_idx = 9 then
                                spi_tx_byte := axi_rdata(7 downto 0);
                            else
                                -- Read status byte:
                                -- [7:3] reserved
                                -- [2]   timeout
                                -- [1:0] RRESP
                                spi_tx_byte             := (others => '0');
                                spi_tx_byte(2)          := not axi_rdata_valid;
                                spi_tx_byte(1 downto 0) := axi_rresp;
                            end if;
                        end if;
                        --
                        if SPI_CPHA = 0 then
                            spi_tx_shreg <= spi_tx_byte;
                        end if;
                        --
                        spi_state <= SPI_RECEIVE;

                end case;
            end if;
        end if;
    end process spi_fsm;

    spi_miso <= spi_tx_shreg(spi_tx_shreg'high);

    ------------------------------------------------------------------------------------------------
    -- AXI4 receive/transmit state machine
    ------------------------------------------------------------------------------------------------

    axi_fsm : process(axi_aclk) is
    begin
        if rising_edge(axi_aclk) then
            if axi_aresetn = '0' or axi_fsm_reset = '1' then
                s_axi_awvalid_int <= '0';
                s_axi_awprot      <= (others => '0');
                s_axi_awaddr      <= (others => '0');
                s_axi_arvalid     <= '0';
                s_axi_arprot      <= (others => '0');
                s_axi_araddr      <= (others => '0');
                s_axi_wvalid_int  <= '0';
                s_axi_wstrb       <= (others => '0');
                s_axi_wdata       <= (others => '0');
                s_axi_bready      <= '0';
                s_axi_rready      <= '0';
                axi_bresp_valid   <= '0';
                axi_bresp         <= (others => '0');
                axi_rresp         <= (others => '0');
                axi_rdata_valid   <= '0';
                axi_rdata         <= (others => '0');
                axi_state         <= AXI_IDLE;
            else
                case axi_state is
                    --------------------------------------------------------------------------------
                    -- Idle
                    --------------------------------------------------------------------------------
                    when AXI_IDLE =>
                        if spi_rx_valid = '1' then
                            axi_bresp_valid <= '0';
                            axi_rdata_valid <= '0';
                            --
                            if spi_rx_cmd = CMD_WRITE then
                                s_axi_awvalid_int         <= '1';
                                s_axi_awaddr              <= (others => '0');
                                s_axi_awaddr(31 downto 0) <= spi_rx_addr;
                                s_axi_awprot              <= (others => '0'); -- unpriviledged, secure data access
                                s_axi_wvalid_int          <= '1';
                                s_axi_wdata               <= spi_rx_wdata;
                                s_axi_wstrb               <= (others => '1');
                                axi_state                 <= AXI_WRITE_ACK;
                            else
                                s_axi_arvalid             <= '1';
                                s_axi_araddr              <= (others => '0');
                                s_axi_araddr(31 downto 0) <= spi_rx_addr;
                                s_axi_arprot              <= (others => '0'); -- unpriviledged, secure data access
                                axi_state                 <= AXI_READ_ADDR_ACK;
                            end if;
                        end if;

                    --------------------------------------------------------------------------------
                    -- AXI write: wait for write address and data acknowledge
                    --------------------------------------------------------------------------------
                    when AXI_WRITE_ACK =>
                        if s_axi_awready = '1' then
                            s_axi_awvalid_int <= '0';
                            --
                            if s_axi_wvalid_int = '0' then
                                s_axi_bready <= '1';
                                axi_state    <= AXI_WRITE_BRESP; -- move on when both write address and data have been acknowledged
                            end if;
                        end if;
                        --
                        if s_axi_wready = '1' then
                            s_axi_wvalid_int <= '0';
                            s_axi_wstrb      <= (others => '0');
                            --
                            if s_axi_awvalid_int = '0' then
                                s_axi_bready <= '1';
                                axi_state    <= AXI_WRITE_BRESP; -- move on when both write address and data have been acknowledged
                            end if;
                        end if;

                    --------------------------------------------------------------------------------
                    -- AXI write: wait for write response
                    --------------------------------------------------------------------------------
                    when AXI_WRITE_BRESP =>
                        if s_axi_bvalid = '1' then
                            s_axi_bready    <= '0';
                            axi_bresp_valid <= '1';
                            axi_bresp       <= s_axi_bresp;
                            axi_state       <= AXI_IDLE;
                        end if;

                    --------------------------------------------------------------------------------
                    -- AXI read: wait for read address acknowledge
                    --------------------------------------------------------------------------------
                    when AXI_READ_ADDR_ACK =>
                        if s_axi_arready = '1' then
                            s_axi_arvalid <= '0';
                            s_axi_rready  <= '1';
                            axi_state     <= AXI_READ_DATA;
                        end if;

                    --------------------------------------------------------------------------------
                    -- AXI read: wait for read data
                    --------------------------------------------------------------------------------
                    when AXI_READ_DATA =>
                        if s_axi_rvalid = '1' then
                            s_axi_rready    <= '0';
                            axi_rdata_valid <= '1';
                            axi_rdata       <= s_axi_rdata;
                            axi_rresp       <= s_axi_rresp;
                            axi_state       <= AXI_IDLE;
                        end if;

                end case;
            end if;
        end if;
    end process axi_fsm;

    s_axi_awvalid <= s_axi_awvalid_int;
    s_axi_wvalid  <= s_axi_wvalid_int;

end architecture;

-------------------------------------------------------------------------------
--  Synchronizer for clock-domain crossings.
--
--  This file is part of the noasic library.
--
--  Description:  
--    Synchronizes a single-bit signal from a source clock domain
--    to a destination clock domain using a chain of flip-flops (synchronizer
--    FF followed by one or more guard FFs).
--
--  Author(s):
--    Guy Eschemann, Guy.Eschemann@gmail.com
-------------------------------------------------------------------------------
-- Copyright (c) 2012-2022 Guy Eschemann
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
-------------------------------------------------------------------------------

library ieee;

use ieee.std_logic_1164.all;

entity synchronizer is
    generic(
        G_INIT_VALUE    : std_logic := '0'; -- initial value of all flip-flops in the module
        G_NUM_GUARD_FFS : positive  := 1); -- number of guard flip-flops after the synchronizing flip-flop
    port(
        i_reset : in  std_logic;        -- asynchronous, high-active
        i_clk   : in  std_logic;        -- destination clock
        i_data  : in  std_logic;
        o_data  : out std_logic);
end synchronizer;

architecture RTL of synchronizer is

    -------------------------------------------------------------------------------
    -- Registered signals (with initial values):
    --
    signal s_data_sync_r  : std_logic                                      := G_INIT_VALUE;
    signal s_data_guard_r : std_logic_vector(G_NUM_GUARD_FFS - 1 downto 0) := (others => G_INIT_VALUE);

    -------------------------------------------------------------------------------
    -- Attributes
    --

    -- Synplify Pro: disable shift-register LUT (SRL) extraction
    attribute syn_srlstyle : string;
    attribute syn_srlstyle of s_data_sync_r : signal is "registers";
    attribute syn_srlstyle of s_data_guard_r : signal is "registers";

    -- Xilinx XST: disable shift-register LUT (SRL) extraction
    attribute shreg_extract : string;
    attribute shreg_extract of s_data_sync_r : signal is "no";
    attribute shreg_extract of s_data_guard_r : signal is "no";

    -- Disable X propagation during timing simulation. In the event of 
    -- a timing violation, the previous value is retained on the output instead 
    -- of going unknown (see Xilinx UG625)
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of s_data_sync_r : signal is "TRUE";

begin

    -------------------------------------------------------------------------------
    -- Synchronizer process
    --
    p_synchronizer : process(i_clk, i_reset)
    begin
        if i_reset = '1' then
            s_data_sync_r  <= G_INIT_VALUE;
            s_data_guard_r <= (others => G_INIT_VALUE);

        elsif rising_edge(i_clk) then
            sync_ff : s_data_sync_r <= i_data;
            guard_ffs : if s_data_guard_r'length = 1 then
                s_data_guard_r(0) <= s_data_sync_r; -- avoid "Range is empty (null range)" warnings:
            else
                s_data_guard_r <= s_data_guard_r(s_data_guard_r'high - 1 downto 0) & s_data_sync_r;
            end if;
        end if;
    end process;

    -------------------------------------------------------------------------------
    -- Outputs
    --
    o_data <= s_data_guard_r(s_data_guard_r'high);

end RTL;

