----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: compute_distance_top - Behavioral
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
use ieee.math_real.all;
use work.lloyds_algorithm_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compute_distance_top is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        point_1 : in data_type;
        point_2 : in data_type;
        distance : out coord_type_ext;
        point_1_out : out data_type;
        point_2_out : out data_type;
        rdy : out std_logic
    );
end compute_distance_top;

architecture Behavioral of compute_distance_top is

    constant LAT_DOT_PRODUCT : integer := MUL_CORE_LATENCY+2*integer(ceil(log2(real(D))));
    constant LAT_SUB : integer := 2;
    constant LATENCY : integer := LAT_DOT_PRODUCT+LAT_SUB; 
    
    type data_delay_type is array(0 to LATENCY-1) of data_type;

    component addorsub
        generic (
            USE_DSP : boolean := true;
            A_BITWIDTH : integer := 16;
            B_BITWIDTH : integer := 16;        
            RES_BITWIDTH : integer := 16
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            sub : in std_logic;
            a : in std_logic_vector(A_BITWIDTH-1 downto 0);
            b : in std_logic_vector(B_BITWIDTH-1 downto 0);
            res : out std_logic_vector(RES_BITWIDTH-1 downto 0);
            rdy : out std_logic
        );
    end component;
    
    component dot_product
        generic (
            SCALE_MUL_RESULT : integer := 0
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            point_1 : in data_type;
            point_2 : in data_type;
            result : out coord_type_ext;
            rdy : out std_logic
        );
    end component;
    
    signal tmp_diff : data_type;
    
    signal tmp_sub_rdy : std_logic;
    signal tmp_dot_product_rdy : std_logic;
    signal tmp_dot_product_result : coord_type_ext;
    
    signal data_delay_1 : data_delay_type;
    signal data_delay_2 : data_delay_type;

begin

    G1: for I in 0 to D-1 generate
    
        G_FIRST: if I = 0 generate
            addorsub_inst : addorsub
                generic map (
                    USE_DSP => USE_DSP_FOR_ADD,
                    A_BITWIDTH => COORD_BITWIDTH,
                    B_BITWIDTH => COORD_BITWIDTH,        
                    RES_BITWIDTH => COORD_BITWIDTH
                )
                port map (
                    clk => clk,
                    sclr => sclr,
                    nd => nd,
                    sub => '1',
                    a => point_1(I),
                    b => point_2(I),
                    res => tmp_diff(I),
                    rdy => tmp_sub_rdy
                );
                
            
        end generate G_FIRST;
        
        G_OTHER: if I > 0 generate
            addorsub_inst : addorsub
                generic map (
                    USE_DSP => USE_DSP_FOR_ADD,
                    A_BITWIDTH => COORD_BITWIDTH,
                    B_BITWIDTH => COORD_BITWIDTH,        
                    RES_BITWIDTH => COORD_BITWIDTH
                )
                port map (
                    clk => clk,
                    sclr => sclr,
                    nd => nd,
                    sub => '1',
                    a => point_1(I),
                    b => point_2(I),
                    res => tmp_diff(I),
                    rdy => open
                );
                            
        end generate G_OTHER;
    
    end generate G1;   
    
    dot_product_inst : dot_product
        generic map (
            SCALE_MUL_RESULT => MUL_FRACTIONAL_BITS
        )
        port map (
            clk => clk, 
            sclr => sclr,
            nd => tmp_sub_rdy,
            point_1 => tmp_diff,
            point_2 => tmp_diff,
            result => tmp_dot_product_result,
            rdy => tmp_dot_product_rdy
        );
        
    -- feed point_2 from input of this unit to output
    data_delay_proc : process(clk)
    begin
        if rising_edge(clk) then
            data_delay_1(0) <= point_1;
            data_delay_1(1 to LATENCY-1) <= data_delay_1(0 to LATENCY-2);
            
            data_delay_2(0) <= point_2;
            data_delay_2(1 to LATENCY-1) <= data_delay_2(0 to LATENCY-2);
            
        end if;
    end process data_delay_proc;
        

    rdy <= tmp_dot_product_rdy;
    distance <= tmp_dot_product_result;
    point_1_out <= data_delay_1(LATENCY-1);
    point_2_out <= data_delay_2(LATENCY-1); 

end Behavioral;
