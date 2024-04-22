-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity edge_canny_detector_mul_17s_15ns_32_2_1_Multiplier_0 is
port (
    clk: in std_logic;
    ce: in std_logic;
    a: in std_logic_vector(17 - 1 downto 0);
    b: in std_logic_vector(15 - 1 downto 0);
    p: out std_logic_vector(32 - 1 downto 0));
end entity;

architecture behav of edge_canny_detector_mul_17s_15ns_32_2_1_Multiplier_0 is
    signal tmp_product : std_logic_vector(32 - 1 downto 0);
    signal a_i : std_logic_vector(17 - 1 downto 0);
    signal b_i : std_logic_vector(15 - 1 downto 0);
    signal p_tmp : std_logic_vector(32 - 1 downto 0);

begin
    a_i <= a;
    b_i <= b;
    p <= p_tmp;

    tmp_product <= std_logic_vector(resize(unsigned(std_logic_vector(signed(a_i) * signed('0' & b_i))), 32));

    process(clk)
    begin
        if (clk'event and clk = '1') then
            if (ce = '1') then
                p_tmp <= tmp_product;
            end if;
        end if;
    end process;
end architecture;
Library IEEE;
use IEEE.std_logic_1164.all;

entity edge_canny_detector_mul_17s_15ns_32_2_1 is
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER);
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR(din0_WIDTH - 1 DOWNTO 0);
        din1 : IN STD_LOGIC_VECTOR(din1_WIDTH - 1 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0));
end entity;

architecture arch of edge_canny_detector_mul_17s_15ns_32_2_1 is
    component edge_canny_detector_mul_17s_15ns_32_2_1_Multiplier_0 is
        port (
            clk : IN STD_LOGIC;
            ce : IN STD_LOGIC;
            a : IN STD_LOGIC_VECTOR;
            b : IN STD_LOGIC_VECTOR;
            p : OUT STD_LOGIC_VECTOR);
    end component;



begin
    edge_canny_detector_mul_17s_15ns_32_2_1_Multiplier_0_U :  component edge_canny_detector_mul_17s_15ns_32_2_1_Multiplier_0
    port map (
        clk => clk,
        ce => ce,
        a => din0,
        b => din1,
        p => dout);

end architecture;


