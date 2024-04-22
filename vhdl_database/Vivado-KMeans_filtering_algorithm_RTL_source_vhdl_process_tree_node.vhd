----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: process_tree_node - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity process_tree_node is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        u_in : in node_data_type;
        centre_positions_in : in data_type;
        centre_indices_in : in centre_index_type;
        update_centre_buffer : out std_logic;
        final_index_out : out centre_index_type;        
        sum_sq_out : out coord_type_ext;        
        rdy : out std_logic;
        dead_end : out std_logic;
        u_out : out node_data_type;
        k_out : out centre_index_type;
        centre_index_rdy : out std_logic;
        centre_index_wr : out std_logic;
        centre_indices_out : out centre_index_type
    );
end process_tree_node;

architecture Behavioral of process_tree_node is

    constant LAT_DOT_PRODUCT : integer := MUL_CORE_LATENCY+2*integer(ceil(log2(real(D))));
    constant LAT_SQ_SUM : integer := MUL_CORE_LATENCY+2+1;
    constant LAT_PRUNING_TEST : integer := 2*2+MUL_CORE_LATENCY+2*integer(ceil(log2(real(D))));
    constant ADD_LAT_PRUNING : integer := 2;
    constant SUB_LAT : integer := 2;
    
    constant LAT_DIFF : integer := LAT_PRUNING_TEST+ADD_LAT_PRUNING-LAT_DOT_PRODUCT-LAT_SQ_SUM;
    
    type sub_res_type is array(0 to D-1) of std_logic_vector(COORD_BITWIDTH+1-1 downto 0);
    type node_data_delay_type2 is array(0 to SUB_LAT-1) of node_data_type;
    type node_data_delay_type is array(0 to LAT_PRUNING_TEST+ADD_LAT_PRUNING-1) of node_data_type;
    type centre_index_delay_type is array(0 to LAT_PRUNING_TEST+ADD_LAT_PRUNING-1) of centre_index_type;
    type coord_ext_delay_type is array(0 to LAT_DIFF-1) of coord_type_ext;

    component addorsub
        generic (
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

    component closest_to_point_top
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            u_in : in node_data_type;
            point : in data_type_ext;  -- assume always ext!!      
            point_list_d : in data_type; -- assume FIFO interface !!!  
            point_list_idx : in centre_index_type;   
            max_idx : out centre_index_type;
            min_point : out data_type;
            min_index : out centre_index_type;
            point_list_d_out : out data_type; -- feed input to output
            point_list_idx_out : out centre_index_type; -- feed input to output
            u_out : out node_data_type; 
            closest_n_first_rdy : out std_logic;
            point_list_rdy : out std_logic
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
            point_1 : in data_type_ext;
            point_2 : in data_type_ext;
            result : out coord_type_ext;
            rdy : out std_logic
        );
    end component;
    
    component compute_squared_sums
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            u_sum_sq : in coord_type_ext;
            u_count : in coord_type_ext;
            op1 : in coord_type_ext;
            op2 : in coord_type_ext;
            rdy : out std_logic;
            squared_sums : out coord_type_ext
        );
    end component;
    
    component resync_search_results
        generic (
            RESYNC_NODE_DATA : boolean := true;
            RESYNC_CNTR_IDX : boolean := true
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            point_list_nd : in std_logic;
            point_list_d : in data_type;
            point_list_idx : in centre_index_type;
            closest_n_first_nd : in std_logic;
            max_idx : in centre_index_type;
            min_point : in data_type;
            min_index : in centre_index_type;            
            u_in : in node_data_type;
            min_point_out : out data_type;
            min_index_out : out centre_index_type;
            point_list_d_out : out data_type; 
            point_list_idx_out : out centre_index_type;
            u_out : out node_data_type;            
            rdy : out std_logic;
            rdy_last_cycle : out std_logic
        );
    end component;        
    
    component prune_centres
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            point : in data_type;    
            point_list_idx : in centre_index_type;    
            point_list_d : in data_type; -- assume FIFO interface !!! 
            bnd_lo : in data_type;
            bnd_hi : in data_type; 
            valid : out std_logic;              
            point_list_idx_out : out centre_index_type;
            result : out std_logic;
            rdy : out std_logic;
            min_num_centres: out centre_index_type
        );
    end component;     

    -- midPoint
    signal tmp_u_midPoint : sub_res_type;
    signal u_midPoint : data_type;
    signal midPoint_rdy : std_logic;
    signal node_data_delay_input : node_data_delay_type2;
        
    -- closest centre (zstar)   
    signal comp_point : data_type_ext;
    signal centre_positions_downstream : data_type;
    signal centre_indices_downstream : centre_index_type;
    signal centre_positions_downstream_rdy : std_logic;
    signal tmp_u_downstream : node_data_type;
    
    signal max_idx : centre_index_type;
    signal closest_centre : data_type;    
    signal closest_index : centre_index_type;    
    signal closest_centre_rdy : std_logic; 
    
    -- dot products
    signal tmp_wgtCent_scale       : data_type_ext;
    signal tmp_op2_scale           : coord_type_ext;
    signal tmp_sum_sq_scale        : coord_type_ext;
    signal tmp_dot_product_1_2     : coord_type_ext;
    signal tmp_dot_product_2_2     : coord_type_ext;
    signal tmp_dot_product_1_2_rdy : std_logic;
    signal tmp_dot_product_2_2_rdy : std_logic; 
    
    -- resync     
    signal centre_positions_downstream_resync : data_type;  
    signal centre_indices_downstream_resync : centre_index_type;  
    signal closest_centre_resync : data_type;
    signal closest_index_resync : centre_index_type;
    signal tmp_u_downstream_resync : node_data_type;
    signal resync_rdy : std_logic;
    signal resync_rdy_last_cycle : std_logic;    
    
    -- prune test
    signal new_k : centre_index_type;
    signal prune_test_rdy : std_logic;
    signal prune_test_valid : std_logic;
    signal prune_test_result : std_logic;
    signal prune_test_index_out : centre_index_type;
    
    -- delay node data once again
    signal node_data_delay : node_data_delay_type;    
    signal min_index_delay : centre_index_delay_type;
    
    -- compute squared sums    
    signal tmp_op1 : coord_type_ext;
    signal tmp_op2 : coord_type_ext;  
    signal tmp_u_count_ext : coord_type_ext;  
    signal tmp_sum_sq_rdy : std_logic;
    signal tmp_sum_sq : coord_type_ext;    
    signal sum_sq_delay : coord_ext_delay_type;
    signal sum_sq_rdy_delay : std_logic_vector(0 to LAT_DIFF-1);
    
    -- write back
    signal tmp_leaf_node : std_logic;    
    signal tmp_dead_end : std_logic;
    signal tmp_u_left : node_address_type;
    signal tmp_u_right : node_address_type;
    signal tmp_final_index : centre_index_type;

begin

--    G0 : for I in 0 to D-1 generate
--        G_FIRST : if I = 0 generate
--            addorsub_inst : addorsub
--                generic map(
--                    A_BITWIDTH => COORD_BITWIDTH,
--                    B_BITWIDTH => COORD_BITWIDTH,        
--                    RES_BITWIDTH => COORD_BITWIDTH+1 
--                )
--                port map(
--                    clk => clk,
--                    sclr => sclr,
--                    nd => nd,
--                    sub => '0',
--                    a => u_in.bnd_hi(I),
--                    b => u_in.bnd_lo(I),
--                    res => tmp_u_midPoint(I),
--                    rdy => midPoint_rdy
--                );
--        end generate G_FIRST;
--        G_OTHER : if I > 0 generate
--            addorsub_inst : addorsub
--                generic map(
--                    A_BITWIDTH => COORD_BITWIDTH,
--                    B_BITWIDTH => COORD_BITWIDTH,        
--                    RES_BITWIDTH => COORD_BITWIDTH+1 
--                )
--                port map(
--                    clk => clk,
--                    sclr => sclr,
--                    nd => nd,
--                    sub => '0',
--                    a => u_in.bnd_hi(I),
--                    b => u_in.bnd_lo(I),
--                    res => tmp_u_midPoint(I),
--                    rdy => open
--                );
--        end generate G_OTHER;        
--        u_midPoint(I) <= tmp_u_midPoint(I)(COORD_BITWIDTH+1-1 downto 1);
--    end generate G0;
--    
--    data_delay_input_proc : process(clk)
--    begin
--        if rising_edge(clk) then        
--            node_data_delay_input(0) <= u_in;
--            node_data_delay_input(1 to SUB_LAT-1) <= node_data_delay_input(0 to SUB_LAT-2);
--        end if;
--    end process data_delay_input_proc;
--
--
--    -- input muxing
--    comp_point <= node_data_delay_input(SUB_LAT-1).wgtCent WHEN node_data_delay_input(SUB_LAT-1).left = std_logic_vector(to_unsigned(0,NODE_POINTER_BITWIDTH)) AND node_data_delay_input(SUB_LAT-1).right = std_logic_vector(to_unsigned(0,NODE_POINTER_BITWIDTH)) ELSE conv_normal_2_ext(u_midPoint);
--  
    comp_point <= u_in.wgtCent WHEN u_in.left = std_logic_vector(to_unsigned(0,NODE_POINTER_BITWIDTH)) AND u_in.right = std_logic_vector(to_unsigned(0,NODE_POINTER_BITWIDTH)) ELSE conv_normal_2_ext(u_in.midPoint);

    closest_to_point_inst : closest_to_point_top
        port map (
            clk => clk,
            sclr => sclr,
            nd => nd,
            u_in => u_in,
            point => comp_point,        
            point_list_d => centre_positions_in,
            point_list_idx => centre_indices_in,
            max_idx => max_idx,
            min_point => closest_centre, 
            min_index => closest_index,            
            point_list_d_out => centre_positions_downstream,
            point_list_idx_out => centre_indices_downstream,
            u_out => tmp_u_downstream,
            closest_n_first_rdy => closest_centre_rdy,
            point_list_rdy => centre_positions_downstream_rdy
        );                    
        
    resync_search_results_inst : resync_search_results
        generic map (
            RESYNC_NODE_DATA => true,
            RESYNC_CNTR_IDX => true
        ) 
        port map(
            clk => clk,
            sclr => sclr,
            closest_n_first_nd => closest_centre_rdy,
            max_idx => max_idx,
            point_list_nd => centre_positions_downstream_rdy,
            min_point => closest_centre,
            min_index => closest_index,            
            u_in => tmp_u_downstream,
            point_list_d => centre_positions_downstream,
            point_list_idx => centre_indices_downstream,
            min_point_out => closest_centre_resync,
            min_index_out => closest_index_resync,            
            u_out => tmp_u_downstream_resync,
            point_list_d_out => centre_positions_downstream_resync, 
            point_list_idx_out => centre_indices_downstream_resync,
            rdy => resync_rdy,
            rdy_last_cycle => resync_rdy_last_cycle
        );        
        
        
    G_SCALE : for I in 0 to D-1 generate    
        tmp_wgtCent_scale(I)(COORD_BITWIDTH_EXT-MUL_FRACTIONAL_BITS-1 downto 0) <= tmp_u_downstream_resync.wgtCent(I)(COORD_BITWIDTH_EXT-1 downto MUL_FRACTIONAL_BITS);
        tmp_wgtCent_scale(I)(COORD_BITWIDTH_EXT-1 downto COORD_BITWIDTH_EXT-MUL_FRACTIONAL_BITS) <= (others => tmp_u_downstream_resync.wgtCent(I)(COORD_BITWIDTH_EXT-1));
    end generate G_SCALE;  
        
    dot_product_inst_1_2 : dot_product
        generic map (
            SCALE_MUL_RESULT => 0
        )
        port map (
            clk => clk,
            sclr => sclr,
            nd => resync_rdy_last_cycle,
            point_1 => conv_normal_2_ext(closest_centre_resync),
            point_2 => tmp_wgtCent_scale,
            result => tmp_dot_product_1_2,
            rdy => tmp_dot_product_1_2_rdy
        );   
        
    dot_product_inst_2_2 : dot_product
        generic map (
            SCALE_MUL_RESULT => 0
        )
        port map (
            clk => clk,
            sclr => sclr,
            nd => resync_rdy_last_cycle,
            point_1 => conv_normal_2_ext(closest_centre_resync),
            point_2 => conv_normal_2_ext(closest_centre_resync),
            result => tmp_dot_product_2_2,
            rdy => tmp_dot_product_2_2_rdy
        );

        
    -- feed delay various data/control signals
    data_delay_proc : process(clk)
    begin
        if rising_edge(clk) then
        
            node_data_delay(0) <= tmp_u_downstream_resync;
            node_data_delay(1 to LAT_PRUNING_TEST+ADD_LAT_PRUNING-1) <= node_data_delay(0 to LAT_PRUNING_TEST+ADD_LAT_PRUNING-2);
                        
            min_index_delay(0) <= closest_index_resync;
            min_index_delay(1 to LAT_PRUNING_TEST+ADD_LAT_PRUNING-1) <= min_index_delay(0 to LAT_PRUNING_TEST+ADD_LAT_PRUNING-2);
            
--            if sclr = '1' then                
--                sum_sq_rdy_delay <= (others => '0');
--            else
--                sum_sq_rdy_delay(0) <= tmp_sum_sq_rdy;
--                sum_sq_rdy_delay(1 to LAT_DIFF-1) <= sum_sq_rdy_delay(0 to LAT_DIFF-2);                
--                sum_sq_delay(0) <= tmp_sum_sq;
--                sum_sq_delay(1 to LAT_DIFF-1) <= sum_sq_delay(0 to LAT_DIFF-2);
--            end if;
             
        end if;
                
    end process data_delay_proc;
    
    
     
    tmp_op1 <= tmp_dot_product_1_2;
    tmp_op2 <= tmp_dot_product_2_2; 
        
    -- scaling        
    tmp_op2_scale(COORD_BITWIDTH_EXT-MUL_FRACTIONAL_BITS-1 downto 0) <= tmp_op2(COORD_BITWIDTH_EXT-1 downto MUL_FRACTIONAL_BITS);
    tmp_op2_scale(COORD_BITWIDTH_EXT-1 downto COORD_BITWIDTH_EXT-MUL_FRACTIONAL_BITS) <= (others => tmp_op2(COORD_BITWIDTH_EXT-1));

    -- input data already scaled
    tmp_sum_sq_scale <= node_data_delay(LAT_DOT_PRODUCT-1).sum_sq;
    tmp_u_count_ext <= zext(node_data_delay(LAT_DOT_PRODUCT-1).count,COORD_BITWIDTH_EXT);         
        
    compute_squared_sums_inst : compute_squared_sums
        port map (
            clk => clk,
            sclr => sclr,
            nd => tmp_dot_product_1_2_rdy,
            u_sum_sq => tmp_sum_sq_scale, -- node_data_delay(LAT_DOT_PRODUCT-1).sum_sq
            u_count => tmp_u_count_ext,
            op1 => tmp_op1,
            op2 => tmp_op2_scale,
            rdy => tmp_sum_sq_rdy,
            squared_sums => tmp_sum_sq
        );      
    
        
    prune_centres_inst : prune_centres
        port map (
            clk => clk,
            sclr => sclr,
            nd => resync_rdy,
            point => closest_centre_resync,         
            point_list_d => centre_positions_downstream_resync,
            point_list_idx => centre_indices_downstream_resync,
            bnd_lo => tmp_u_downstream_resync.bnd_lo,
            bnd_hi => tmp_u_downstream_resync.bnd_hi,            
            valid => prune_test_valid,
            point_list_idx_out => prune_test_index_out,
            result => prune_test_result,
            rdy => prune_test_rdy,
            min_num_centres => new_k
        );
       
    tmp_u_left <= node_data_delay(LAT_PRUNING_TEST+ADD_LAT_PRUNING-1).left;
    tmp_u_right <= node_data_delay(LAT_PRUNING_TEST+ADD_LAT_PRUNING-1).right;
        
    -- this could be determined much more simply...
    tmp_leaf_node <= '1' WHEN tmp_u_left = std_logic_vector(to_unsigned(0,NODE_POINTER_BITWIDTH)) AND tmp_u_right = std_logic_vector(to_unsigned(0,NODE_POINTER_BITWIDTH)) ELSE '0';     
        
    tmp_dead_end <= '1' WHEN tmp_leaf_node = '1' OR new_k = to_unsigned(0,INDEX_BITWIDTH) ELSE '0';
    
    tmp_final_index <= min_index_delay(LAT_PRUNING_TEST+ADD_LAT_PRUNING-1);

    -- outputs
    update_centre_buffer <= tmp_dead_end AND prune_test_rdy; -- same as sum_sq_rdy_delay(LAT_DIFF-1) 
    final_index_out <= tmp_final_index;
    
    G_LD : if LAT_DIFF > 0 generate
        sum_sq_out <= sum_sq_delay(LAT_DIFF-1);
    end generate G_LD;
    
    G_NLD : if LAT_DIFF = 0 generate
        sum_sq_out <= tmp_sum_sq;
    end generate G_NLD;    
    
    u_out <= node_data_delay(LAT_PRUNING_TEST+ADD_LAT_PRUNING-1);    
    rdy <=  prune_test_rdy;
    dead_end <= tmp_dead_end;
    k_out <= new_k;
    
    centre_index_rdy <= prune_test_valid;
    centre_index_wr <= prune_test_result;
    centre_indices_out <= prune_test_index_out;

end Behavioral;
