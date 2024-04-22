-- ==============================================================
-- File generated on Mon Oct 21 09:46:07 +0800 2019
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
-- SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
-- IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
Library ieee;
use ieee.std_logic_1164.all;

entity equalizeHist_fpexibs is
    generic (
        ID         : integer := 41;
        NUM_STAGE  : integer := 1;
        din0_WIDTH : integer := 32;
        dout_WIDTH : integer := 64
    );
    port (
        din0 : in  std_logic_vector(din0_WIDTH-1 downto 0);
        dout : out std_logic_vector(dout_WIDTH-1 downto 0)
    );
end entity;

architecture arch of equalizeHist_fpexibs is
    --------------------- Component ---------------------
    component equalizeHist_ap_fpext_0_no_dsp_32 is
        port (
            s_axis_a_tvalid      : in  std_logic;
            s_axis_a_tdata       : in  std_logic_vector(31 downto 0);
            m_axis_result_tvalid : out std_logic;
            m_axis_result_tdata  : out std_logic_vector(63 downto 0)
        );
    end component;
    --------------------- Local signal ------------------
    signal a_tvalid : std_logic;
    signal a_tdata  : std_logic_vector(31 downto 0);
    signal r_tvalid : std_logic;
    signal r_tdata  : std_logic_vector(63 downto 0);
begin
    --------------------- Instantiation -----------------
    equalizeHist_ap_fpext_0_no_dsp_32_u : component equalizeHist_ap_fpext_0_no_dsp_32
    port map (
        s_axis_a_tvalid      => a_tvalid,
        s_axis_a_tdata       => a_tdata,
        m_axis_result_tvalid => r_tvalid,
        m_axis_result_tdata  => r_tdata
    );

    --------------------- Assignment --------------------
    a_tvalid <= '1';
    a_tdata  <= din0;
    dout     <= r_tdata;

end architecture;
