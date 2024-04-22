----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- lloyds_algorithm_wrapper - Behavioral
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity lloyds_algorithm_wrapper is
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        data_value_V_dout : IN STD_LOGIC_VECTOR (47 downto 0);
        data_value_V_empty_n : IN STD_LOGIC;
        data_value_V_read : OUT STD_LOGIC;
        cntr_pos_init_value_V_dout : IN STD_LOGIC_VECTOR (47 downto 0);
        cntr_pos_init_value_V_empty_n : IN STD_LOGIC;
        cntr_pos_init_value_V_read : OUT STD_LOGIC;
        n_V : IN STD_LOGIC_VECTOR (14 downto 0);
        k_V : IN STD_LOGIC_VECTOR (7 downto 0);
        distortion_out_V_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        distortion_out_V_full_n : IN STD_LOGIC;
        distortion_out_V_write : OUT STD_LOGIC;
        clusters_out_value_V_din : OUT STD_LOGIC_VECTOR (47 downto 0);
        clusters_out_value_V_full_n : IN STD_LOGIC;
        clusters_out_value_V_write : OUT STD_LOGIC    
    );
end lloyds_algorithm_wrapper;

architecture Behavioral of lloyds_algorithm_wrapper is

    component lloyds_algorithm_top is
        port (
            ap_clk : IN STD_LOGIC;
            ap_rst : IN STD_LOGIC;
            ap_start : IN STD_LOGIC;
            ap_done : OUT STD_LOGIC;
            ap_idle : OUT STD_LOGIC;
            data_value_V_dout : IN STD_LOGIC_VECTOR (47 downto 0);
            data_value_V_empty_n : IN STD_LOGIC;
            data_value_V_read : OUT STD_LOGIC;
            cntr_pos_init_value_V_dout : IN STD_LOGIC_VECTOR (47 downto 0);
            cntr_pos_init_value_V_empty_n : IN STD_LOGIC;
            cntr_pos_init_value_V_read : OUT STD_LOGIC;
            n_V : IN STD_LOGIC_VECTOR (14 downto 0);
            k_V : IN STD_LOGIC_VECTOR (7 downto 0);
            distortion_out_V_din : OUT STD_LOGIC_VECTOR (31 downto 0);
            distortion_out_V_full_n : IN STD_LOGIC;
            distortion_out_V_write : OUT STD_LOGIC;
            clusters_out_value_V_din : OUT STD_LOGIC_VECTOR (47 downto 0);
            clusters_out_value_V_full_n : IN STD_LOGIC;
            clusters_out_value_V_write : OUT STD_LOGIC   
        );
    end component;       
    
    signal tmp_clk : std_logic;
    signal ap_rst_reg : std_logic;
    signal ap_start_reg : std_logic;
    signal ap_done_tmp : std_logic;
    signal ap_done_reg : std_logic;
    signal ap_idle_tmp : std_logic;
    signal ap_idle_reg : std_logic;
    signal data_value_V_dout_reg : std_logic_vector (47 downto 0);
    signal data_value_V_empty_n_reg : std_logic;
    signal data_value_V_read_tmp : std_logic;
    signal data_value_V_read_reg : std_logic;     
    signal cntr_pos_init_value_V_dout_reg : std_logic_vector (47 downto 0);
    signal cntr_pos_init_value_V_empty_n_reg : std_logic;
    signal cntr_pos_init_value_V_read_tmp : std_logic;
    signal cntr_pos_init_value_V_read_reg : std_logic;
    signal n_V_reg : std_logic_vector (14 downto 0);
    signal k_V_reg : std_logic_vector (7 downto 0);
    signal root_V_reg : std_logic_vector (14 downto 0);
    signal distortion_out_V_din_tmp : std_logic_vector (31 downto 0);
    signal distortion_out_V_din_reg : std_logic_vector (31 downto 0);
    signal distortion_out_V_full_n_reg : std_logic;
    signal distortion_out_V_write_tmp : std_logic;
    signal distortion_out_V_write_reg : std_logic;
    signal clusters_out_value_V_din_tmp : std_logic_vector (47 downto 0);
    signal clusters_out_value_V_din_reg : std_logic_vector (47 downto 0);
    signal clusters_out_value_V_full_n_reg : std_logic;
    signal clusters_out_value_V_write_tmp : std_logic;
    signal clusters_out_value_V_write_reg : std_logic;
      
    
begin

    ClkBuffer: IBUFG 
     port map ( 
        I  => ap_clk, 
        O  => tmp_clk
    );

    input_reg : process(tmp_clk)
    begin
        if rising_edge(tmp_clk) then
            ap_rst_reg <= ap_rst;
            ap_start_reg <= ap_start;
            data_value_V_dout_reg <= data_value_V_dout;
            data_value_V_empty_n_reg <= data_value_V_empty_n;                              
            cntr_pos_init_value_V_dout_reg <= cntr_pos_init_value_V_dout;
            cntr_pos_init_value_V_empty_n_reg <= cntr_pos_init_value_V_empty_n;            
            n_V_reg <= n_V;
            k_V_reg <= k_V;                     
            distortion_out_V_full_n_reg <= distortion_out_V_full_n;                        
            clusters_out_value_V_full_n_reg <= clusters_out_value_V_full_n;                                      
        end if;
    end process input_reg;        

    lloyds_alogrithm_top_inst : lloyds_algorithm_top
        port map(
            ap_clk => tmp_clk,
            ap_rst => ap_rst_reg,
            ap_start => ap_start_reg,
            ap_done => ap_done_tmp,
            ap_idle => ap_idle_tmp,
            data_value_V_dout => data_value_V_dout_reg,
            data_value_V_empty_n => data_value_V_empty_n_reg,  
            data_value_V_read => data_value_V_read_tmp,            
            cntr_pos_init_value_V_dout => cntr_pos_init_value_V_dout_reg,
            cntr_pos_init_value_V_empty_n => cntr_pos_init_value_V_empty_n_reg,
            cntr_pos_init_value_V_read => cntr_pos_init_value_V_read_tmp,
            n_V => n_V_reg,
            k_V => k_V_reg,
            distortion_out_V_din => distortion_out_V_din_tmp,
            distortion_out_V_full_n => distortion_out_V_full_n_reg,
            distortion_out_V_write => distortion_out_V_write_tmp,
            clusters_out_value_V_din => clusters_out_value_V_din_tmp,
            clusters_out_value_V_full_n => clusters_out_value_V_full_n_reg,
            clusters_out_value_V_write => clusters_out_value_V_write_tmp    
        );      
                       
    output_reg : process(tmp_clk)
    begin
        if rising_edge(tmp_clk) then
            ap_done_reg <= ap_done_tmp;  
            ap_idle_reg <= ap_idle_tmp;
            data_value_V_read_reg <= data_value_V_read_tmp;                 
            cntr_pos_init_value_V_read_reg <= cntr_pos_init_value_V_read_tmp;
            distortion_out_V_din_reg <= distortion_out_V_din_tmp;
            distortion_out_V_write_reg <= distortion_out_V_write_tmp;
            clusters_out_value_V_din_reg <= clusters_out_value_V_din_tmp;
            clusters_out_value_V_write_reg <= clusters_out_value_V_write_tmp;
        end if;
    end process output_reg;             
        
    
    ap_done <= ap_done_reg;  
    ap_idle <= ap_idle_reg;
    data_value_V_read <= data_value_V_read_reg;    
    cntr_pos_init_value_V_read <= cntr_pos_init_value_V_read_reg;
    distortion_out_V_din <= distortion_out_V_din_reg;
    distortion_out_V_write <= distortion_out_V_write_reg;
    clusters_out_value_V_din <= clusters_out_value_V_din_reg;
    clusters_out_value_V_write <= clusters_out_value_V_write_reg;

end Behavioral;
