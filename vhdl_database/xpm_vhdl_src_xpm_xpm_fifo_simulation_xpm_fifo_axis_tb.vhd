--! Copyright [2020] [Frans Schreuder]
--!
--!   Licensed under the Apache License, Version 2.0 (the "License");
--!   you may not use this file except in compliance with the License.
--!   You may obtain a copy of the License at
--!
--!       http://www.apache.org/licenses/LICENSE-2.0
--!
--!   Unless required by applicable law or agreed to in writing, software
--!   distributed under the License is distributed on an "AS IS" BASIS,
--!   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--!   See the License for the specific language governing permissions and
--!   limitations under the License.
library vunit_lib;
context vunit_lib.vunit_context;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.all;
library std;
use std.env.all;
library xpm;
use xpm.vcomponents.all;
--
entity xpm_fifo_axis_tb is
  generic(runner_cfg : string := runner_cfg_default);
end xpm_fifo_axis_tb;

architecture tb of xpm_fifo_axis_tb is

  
    -- Common module constants
    constant CLOCK_DOMAIN        : string := "INDEPENDENT"; -- CLOCK_DOMAIN must be "COMMON" for synchronous fifo, "INDEPENDENT" for asynchronous fifo
    constant RELATED_CLOCKS      : integer := 0;
    constant FIFO_MEMORY_TYPE    : string := "BRAM";
    constant ECC_MODE            : string := "NO_ECC";
    constant FIFO_DEPTH          : integer := 512;
    constant TDATA_WIDTH         : integer := 32;
    constant TID_WIDTH           : integer := 1;
    constant TDEST_WIDTH         : integer := 1;
    constant TUSER_WIDTH         : integer := 4;
    constant PROG_FULL_THRESH    : integer := 450;
    constant READ_DATA_WIDTH     : integer := 288;
    constant DATA_COUNT_WIDTH    : integer := 10;
    constant PROG_EMPTY_THRESH   : integer := 5; 
    constant DOUT_RESET_VALUE    : string := "0";
    constant CDC_SYNC_STAGES     : integer := 2;
  
    constant m_aclk_period       : time := 40 ns;
    constant s_aclk_period       : time := 20 ns;
                                 
    signal m_aclk, s_aclk        : std_logic;
    signal aresetn               : std_logic;
    signal simulation_success    : std_logic := '1';
    signal sim_done              : std_logic := '0';
 
    signal s_axis_tvalid         : std_logic;
    signal s_axis_tready         : std_logic;
    signal s_axis_tdata          : std_logic_vector(TDATA_WIDTH-1 downto 0);
    signal s_axis_tstrb          : std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    signal s_axis_tkeep          : std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    signal s_axis_tlast          : std_logic;
    signal s_axis_tid            : std_logic_vector(TID_WIDTH-1 downto 0);
    signal s_axis_tdest          : std_logic_vector(TDEST_WIDTH-1 downto 0);
    signal s_axis_tuser          : std_logic_vector(TUSER_WIDTH-1 downto 0);
    signal m_axis_tvalid         : std_logic;
    signal m_axis_tready         : std_logic;
    signal m_axis_tdata          : std_logic_vector(TDATA_WIDTH-1 downto 0);
    signal m_axis_tstrb          : std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    signal m_axis_tkeep          : std_logic_vector(TDATA_WIDTH/8-1 downto 0);
    signal m_axis_tlast          : std_logic;
    signal m_axis_tid            : std_logic_vector(TID_WIDTH-1 downto 0);
    signal m_axis_tdest          : std_logic_vector(TDEST_WIDTH-1 downto 0);
    signal m_axis_tuser          : std_logic_vector(TUSER_WIDTH-1 downto 0);
    signal tdata_value           : std_logic_vector(31 downto 0) := x"AAAA0000";

begin
  
    -- Generation of clock
    process
    begin
        s_aclk <= '1';
        wait for s_aclk_period/2;
        s_aclk <= '0';
        wait for s_aclk_period/2;
    end process;

    process
    begin
        m_aclk <= '1';
        wait for m_aclk_period/2;
        m_aclk <= '0';
        wait for m_aclk_period/2;
    end process;
 
    process
    begin
        aresetn <= '0';
        wait for 4000 ns;
        aresetn <= '1';
        wait;
    end process;


    process
    begin
        test_runner_setup(runner, runner_cfg);
        wait until(sim_done = '1');
        assert simulation_success= '1' report("xpm_fifo_axis_tb: Simulation failed");
        if simulation_success = '1' then
            report("xpm_fifo_axis_tb: Test Completed Successfully") severity note;
        end if;
        test_runner_cleanup(runner);
        wait;
    end process;

    process
    begin
    wait for 900 ms;
    report("Test bench timed out") severity warning;
    test_runner_cleanup(runner);
    wait;
    end process;

    xpm_fifo_axis_inst: xpm_fifo_axis
    generic map(
        CLOCKING_MODE            => CLOCK_DOMAIN,
        FIFO_MEMORY_TYPE         => FIFO_MEMORY_TYPE,
        CASCADE_HEIGHT           => 0,
        PACKET_FIFO              => "false",
        FIFO_DEPTH               => FIFO_DEPTH,
        TDATA_WIDTH              => TDATA_WIDTH,
        TID_WIDTH                => TID_WIDTH,
        TDEST_WIDTH              => TDEST_WIDTH,
        TUSER_WIDTH              => TUSER_WIDTH,
        ECC_MODE                 => ECC_MODE,
        RELATED_CLOCKS           => 0,
        USE_ADV_FEATURES         => "1000",
        WR_DATA_COUNT_WIDTH      => DATA_COUNT_WIDTH,
        RD_DATA_COUNT_WIDTH      => DATA_COUNT_WIDTH,
        PROG_FULL_THRESH         => PROG_FULL_THRESH,
        PROG_EMPTY_THRESH        => PROG_EMPTY_THRESH,
        SIM_ASSERT_CHK           => 0,
        CDC_SYNC_STAGES          => 2
    )
    port map(
        s_aresetn                      => aresetn,
        m_aclk                         => m_aclk,
        s_aclk                         => s_aclk,
        s_axis_tvalid                  => s_axis_tvalid,
        s_axis_tready                  => s_axis_tready,
        s_axis_tdata                   => s_axis_tdata ,
        s_axis_tstrb                   => s_axis_tstrb ,
        s_axis_tkeep                   => s_axis_tkeep ,
        s_axis_tlast                   => s_axis_tlast ,
        s_axis_tid                     => s_axis_tid   ,
        s_axis_tdest                   => s_axis_tdest ,
        s_axis_tuser                   => s_axis_tuser ,
        m_axis_tvalid                  => m_axis_tvalid,
        m_axis_tready                  => m_axis_tready,
        m_axis_tdata                   => m_axis_tdata ,
        m_axis_tstrb                   => m_axis_tstrb ,
        m_axis_tkeep                   => m_axis_tkeep ,
        m_axis_tlast                   => m_axis_tlast ,
        m_axis_tid                     => m_axis_tid   ,
        m_axis_tdest                   => m_axis_tdest ,
        m_axis_tuser                   => m_axis_tuser ,
        prog_full_axis                 => open,
        wr_data_count_axis             => open,
        almost_full_axis               => open,
        prog_empty_axis                => open,
        rd_data_count_axis             => open,
        almost_empty_axis              => open,
        injectsbiterr_axis             => '0',
        injectdbiterr_axis             => '0',
        sbiterr_axis                   => open,
        dbiterr_axis                   => open 
    );
    
    datagen: process(aresetn, s_aclk)
    begin
        if aresetn = '0' then
            s_axis_tvalid <= '0';
            s_axis_tdata  <= x"AAAA0000";
            s_axis_tstrb  <= (others => '0');
            s_axis_tkeep  <= (others => '1');
            s_axis_tlast  <= '0';
            s_axis_tid    <= (others => '0');
            s_axis_tdest  <= (others => '0');
            s_axis_tuser  <= (others => '0');
        elsif rising_edge(s_aclk) then
            s_axis_tvalid <= '1';
            if s_axis_tready = '1' then
                s_axis_tdata <= s_axis_tdata + 1;
                if(s_axis_tdata(3 downto 0) = "1110") then
                    s_axis_tlast <= '1';
                else
                    s_axis_tlast <= '0';
                end if;
            end if;
        end if;
    end process;
    
    checker: process(aresetn, m_aclk)
    begin
        if aresetn = '0' then
            tdata_value <= x"AAAA0000";
            simulation_success <= '1';
            sim_done <= '0';
        elsif rising_edge(m_aclk) then
            if(m_axis_tvalid = '1' and m_axis_tready = '1') then
                if(m_axis_tdata /= tdata_value) then
                    simulation_success <= '0';
                end if;
                if(m_axis_tdata(3 downto 0) = "1111" and m_axis_tlast = '0') then
                    simulation_success <= '0';
                end if;
                if(m_axis_tdata(3 downto 0) /= "1111" and m_axis_tlast = '1') then
                    simulation_success <= '0';
                end if;
                if m_axis_tdata = x"AAAB0000" then
                    sim_done <= '1';
                end if;
                tdata_value <= tdata_value + 1;
            end if;
        end if;
    end process;
    
    tready_proc: process(m_aclk)
        variable cnt: integer := 0;
    begin
        if rising_edge(m_aclk) then
            if cnt < 10 then
                m_axis_tready <= '1';
            else
                m_axis_tready <= '0';
            end if;
            if cnt < 19 then
                cnt := cnt + 1;
            else
                cnt := 0;
            end if;
        end if;
    end process;
    


end tb;-- xpm_fifo_tb
  
