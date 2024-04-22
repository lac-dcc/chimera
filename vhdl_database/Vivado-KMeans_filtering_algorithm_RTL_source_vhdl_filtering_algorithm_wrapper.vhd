----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: filtering_algorithm_wrapper - Behavioral
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use work.filtering_algorithm_pkg.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity filtering_algorithm_wrapper is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        start : in std_logic; 
        select_input : in std_logic_vector(1 downto 0);
        select_par : in std_logic_vector(integer(ceil(log2(real(PARALLEL_UNITS))))-1 downto 0);
        -- initial parameters                
        k : in unsigned(INDEX_BITWIDTH-1 downto 0);
        root_address : in std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
        -- init node and centre memory  
        wr_init_nd : in std_logic;
        wr_data_init : in std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
        wr_address_init : in std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
        -- outputs
        valid : out std_logic;
        clusters_out : out data_type;
        distortion_out : out coord_type_ext;        
        -- processing done       
        rdy : out std_logic     
    );
end filtering_algorithm_wrapper;

architecture Behavioral of filtering_algorithm_wrapper is

    component filtering_alogrithm_top is
        port (
            clk : in std_logic;
            sclr : in std_logic;
            start : in std_logic; 
            -- initial parameters                
            k : in centre_index_type;
            root_address : in par_node_address_type;
            -- init node and centre memory         
            wr_init_cent : in std_logic;
            wr_centre_list_address_init : in centre_list_address_type;
            wr_centre_list_data_init : in centre_index_type;
            wr_init_node : in std_logic_vector(0 to PARALLEL_UNITS-1);
            wr_node_address_init : in par_node_address_type;
            wr_node_data_init : in par_node_data_type;
            wr_init_pos : in std_logic;
            wr_centre_list_pos_address_init : in centre_index_type;
            wr_centre_list_pos_data_init : in data_type;
            -- outputs
            valid : out std_logic;
            clusters_out : out data_type;
            distortion_out : out coord_type_ext;               
            -- processing done       
            rdy : out std_logic         
        );
    end component;       
    
    signal tmp_clk : std_logic;
    signal reg_sclr : std_logic;
    signal reg_start : std_logic; 
    -- initial parameters                
    signal reg_k : centre_index_type;
    signal reg_root_address : node_address_type;
    signal tmp_root_address : par_node_address_type;
    -- init node and centre memory         
    signal reg_wr_init_cent : std_logic;
    signal reg_wr_centre_list_address_init : centre_list_address_type;   
    signal reg_wr_centre_list_data_init : centre_index_type;    
    signal reg_wr_init_node : std_logic_vector(0 to PARALLEL_UNITS-1);
    signal reg_wr_node_address_init : node_address_type;
    signal tmp_wr_node_address_init : par_node_address_type;
    signal reg_wr_node_data_init : node_data_type;
    signal tmp_wr_node_data_init : par_node_data_type;
    signal reg_wr_init_pos : std_logic;
    signal reg_wr_centre_list_pos_address_init : centre_index_type;
    signal reg_wr_centre_list_pos_data_init : data_type;
    -- outputs
    signal tmp_valid : std_logic;
    signal reg_valid : std_logic;
    signal tmp_clusters_out : data_type;
    signal reg_clusters_out : data_type;
    signal tmp_distortion_out : coord_type_ext;
    signal reg_distortion_out : coord_type_ext;        
    -- processing done     
    signal tmp_rdy : std_logic;  
    signal reg_rdy : std_logic;      
    
begin

    ClkBuffer: IBUFG 
     port map ( 
        I  => clk, 
        O  => tmp_clk
    );

    input_reg : process(tmp_clk)
    begin
        if rising_edge(tmp_clk) then
            if select_input = "00" then
                reg_wr_init_cent <= wr_init_nd;
                reg_wr_init_pos <= '0';
            elsif select_input = "01" then
                reg_wr_init_cent <= '0';
                reg_wr_init_pos <= '0'; 
            else
                reg_wr_init_cent <= '0';
                reg_wr_init_pos <= wr_init_nd;
            end if;        
            for I in 0 to PARALLEL_UNITS-1 loop
                if select_par = std_logic_vector(to_unsigned(I,integer(ceil(log2(real(PARALLEL_UNITS)))))) then
                    if select_input = "00" then
                        reg_wr_init_node(I) <= '0';
                    elsif select_input = "01" then
                        reg_wr_init_node(I) <= wr_init_nd;
                    else
                        reg_wr_init_node(I) <= '0';
                    end if;
                else
                    reg_wr_init_node(I) <= '0';               
                end if;
            end loop;
                                                
            reg_wr_centre_list_address_init <= wr_address_init(CNTR_POINTER_BITWIDTH-1 downto 0);
            reg_wr_centre_list_data_init <= unsigned(wr_data_init(INDEX_BITWIDTH-1 downto 0));            
            
            reg_wr_node_address_init <= wr_address_init(NODE_POINTER_BITWIDTH-1 downto 0);
            reg_wr_node_data_init <= stdlogic_2_nodedata(wr_data_init);            
                        
            reg_wr_centre_list_pos_address_init <= unsigned(wr_address_init(INDEX_BITWIDTH-1 downto 0));
            reg_wr_centre_list_pos_data_init <= stdlogic_2_datapoint(wr_data_init(D*COORD_BITWIDTH-1 downto 0));     
                
            reg_sclr <= sclr;
            reg_start <= start;
            reg_k <= k;
            reg_root_address <= root_address;            
            
        end if;
    end process input_reg;
    
    -- parallel units will be initialiased one after the other (a controlled by reg_wr_init_node)
    G0_PAR : for I in 0 to PARALLEL_UNITS-1 generate
        tmp_wr_node_address_init(I) <= reg_wr_node_address_init;
        tmp_wr_node_data_init(I) <= reg_wr_node_data_init;
        tmp_root_address(I) <= reg_root_address; 
    end generate G0_PAR;
    

    filtering_alogrithm_top_inst : filtering_alogrithm_top
        port map(
            clk => tmp_clk,
            sclr => reg_sclr, 
            start => reg_start, 
            -- initial parameters                
            k => reg_k,
            root_address => tmp_root_address,
            -- init node and centre memory         
            wr_init_cent => reg_wr_init_cent,
            wr_centre_list_address_init => reg_wr_centre_list_address_init,
            wr_centre_list_data_init => reg_wr_centre_list_data_init,
            wr_init_node => reg_wr_init_node,
            wr_node_address_init => tmp_wr_node_address_init,
            wr_node_data_init => tmp_wr_node_data_init,
            wr_init_pos => reg_wr_init_pos,
            wr_centre_list_pos_address_init => reg_wr_centre_list_pos_address_init,
            wr_centre_list_pos_data_init => reg_wr_centre_list_pos_data_init,
            -- outputs
            valid => tmp_valid,
            clusters_out => tmp_clusters_out,
            distortion_out => tmp_distortion_out,                
            -- processing done       
            rdy => tmp_rdy      
        );       
                       
    output_reg : process(tmp_clk)
    begin
        if rising_edge(tmp_clk) then
            reg_valid <= tmp_valid;
            reg_clusters_out <= tmp_clusters_out;
            reg_distortion_out <= tmp_distortion_out;            
            reg_rdy <= tmp_rdy;
        end if;
    end process output_reg;             
        
    
    valid <= reg_valid;
    clusters_out <= reg_clusters_out;   
    distortion_out <= reg_distortion_out;    
    rdy <= reg_rdy;

end Behavioral;
