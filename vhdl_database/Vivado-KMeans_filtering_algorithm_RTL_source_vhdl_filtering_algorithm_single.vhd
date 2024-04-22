----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: filtering_alogrithm_single - Behavioral
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

entity filtering_alogrithm_single is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        start : in std_logic; 
        -- initial parameters                
        k : in centre_index_type;
        root_address : in node_address_type;
        -- init node and centre memory         
        wr_init_cent : in std_logic;
        wr_centre_list_address_init : in centre_list_address_type;
        wr_centre_list_data_init : in centre_index_type;
        wr_init_node : in std_logic;
        wr_node_address_init : in node_address_type;
        wr_node_data_init : in node_data_type;
        wr_init_pos : in std_logic;
        wr_centre_list_pos_address_init : in centre_index_type;
        wr_centre_list_pos_data_init : in data_type;
        -- access centre buffer              
        rdo_centre_buffer : in std_logic;
        centre_buffer_addr : in centre_index_type;
        valid : out std_logic;
        wgtCent_out : out data_type_ext;
        sum_sq_out : out coord_type_ext;
        count_out : out coord_type;        
        -- processing done       
        rdy : out std_logic        
    );
end filtering_alogrithm_single;

architecture Behavioral of filtering_alogrithm_single is

    constant STACK_LAT : integer := 3;

    type state_type is (idle, init, processing_phase1, processing_phase2, done);
    type schedule_state_type is (free, busy, wait_cycle);
     
    type node_addr_delay_type is array(0 to STACK_LAT-1) of node_address_type;
    type centre_list_addr_delay_type is array(0 to STACK_LAT-1) of centre_list_address_type;
    type k_delay_type is array(0 to STACK_LAT-1) of centre_index_type;   
    
    component memory_mgmt
        port (
            clk : in std_logic;
            sclr : in std_logic;
            rd : in std_logic;
            rd_node_addr : in node_address_type;
            rd_centre_list_address : in centre_list_address_type;
            rd_k : in centre_index_type;        
            wr_cent_nd : in std_logic;
            wr_cent : in std_logic;
            wr_centre_list_address : in centre_list_address_type;
            wr_centre_list_data : in centre_index_type;
            wr_init_cent : in std_logic;
            wr_centre_list_address_init : in centre_list_address_type;
            wr_centre_list_data_init : in centre_index_type;
            wr_init_node : in std_logic;
            wr_node_address_init : in node_address_type;
            wr_node_data_init : in node_data_type;
            wr_init_pos : in std_logic;
            wr_centre_list_pos_address_init : in centre_index_type;
            wr_centre_list_pos_data_init : in data_type;
            valid : out std_logic;
            rd_node_data : out node_data_type;
            rd_centre_list_data : out centre_index_type;
            rd_centre_list_pos_data : out data_type;
            last_centre : out std_logic;
            item_read_twice : out std_logic;
            rd_centre_list_address_out : out centre_list_address_type            
        );
    end component;
    
    component process_tree_node
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
    end component;

    component centre_buffer_mgmt
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            init : in std_logic;
            addr_in_init : in centre_index_type;
            request_rdo : in std_logic;
            addr_in : in centre_index_type;
            wgtCent_in : in data_type_ext;
            sum_sq_in : in coord_type_ext;
            count_in : in coord_type;
            valid : out std_logic;
            wgtCent_out : out data_type_ext;
            sum_sq_out : out coord_type_ext;
            count_out : out coord_type
        );
    end component;
        
    component stack_top
        port (
            clk : in STD_LOGIC;
            sclr : in STD_LOGIC;
            push : in std_logic;
            pop : in std_logic;
            node_addr_in_1 : in node_address_type;
            node_addr_in_2 : in node_address_type;
            cntr_addr_in_1 : in centre_list_address_type;
            cntr_addr_in_2 : in centre_list_address_type;
            k_in_1 : in centre_index_type;
            k_in_2 : in centre_index_type;
            node_addr_out : out node_address_type;
            cntr_addr_out : out centre_list_address_type;
            k_out : out centre_index_type;
            empty : out std_logic;
            valid : out std_logic
        );
    end component;
    
    component allocator
        generic (
            MEMORY_SIZE : integer := 1024
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            alloc : in std_logic;
            free : in std_logic;
            address_in : in std_logic_vector(integer(ceil(log2(real(MEMORY_SIZE))))-1 downto 0);
            rdy : out std_logic;
            address_out : out std_logic_vector(integer(ceil(log2(real(MEMORY_SIZE))))-1 downto 0);
            heap_full : out std_logic
        );
    end component;    
        
    -- fsm
    signal state : state_type;
    signal start_processing : std_logic;
    signal processing_done : std_logic; 
    signal processing_counter_enable : std_logic;
    signal processing_done_value   : unsigned(INDEX_BITWIDTH+1-1 downto 0);
    signal processing_done_counter : unsigned(INDEX_BITWIDTH+1-1 downto 0);   
    
    -- memory mgmt
    signal memory_mgmt_rd : std_logic;        
    signal memory_data_valid : std_logic;
    signal memory_mgmt_last_centre : std_logic;
    signal memory_mgmt_item_read_twice : std_logic;
    --signal memory_data_valid_reg : std_logic;
    signal rd_node_addr : node_address_type;        
    signal rd_centre_list_address : centre_list_address_type;        
    signal rd_k : centre_index_type;        
    signal rd_node_data : node_data_type;
    signal rd_centre_indices : centre_index_type;
    signal rd_centre_positions : data_type;
    signal rd_centre_list_address_out : centre_list_address_type;
    signal rd_centre_list_address_out_reg : centre_list_address_type;


    -- process_tree_node
    signal ptn_update_centre_buffer : std_logic;
    signal ptn_final_index_out : centre_index_type;        
    signal ptn_sum_sq_out : coord_type_ext;        
    signal ptn_rdy : std_logic;
    signal ptn_dead_end : std_logic;
    signal ptn_u_out : node_data_type;
    signal ptn_k_out : centre_index_type;
    signal ptn_centre_index_rdy : std_logic;
    signal ptn_centre_index_rdy_reg : std_logic;
    signal ptn_centre_index_wr : std_logic;
    signal ptn_centre_indices_out : centre_index_type;       
    
    -- centre buffer mgmt
    signal tmp_addr : centre_index_type;
    
    
    -- stack
    signal stack_push : std_logic;
    signal stack_push_reg : std_logic;
    signal stack_pop : std_logic;   
    signal node_stack_addr_in_1 : node_address_type;
    signal node_stack_addr_in_2 : node_address_type;
    signal cntr_stack_addr_in : centre_list_address_type;
    signal cntr_stack_addr_in_reg : centre_list_address_type;   
    signal cntr_stack_k_in : centre_index_type;  
    signal stack_valid : std_logic;
    signal stack_empty : std_logic;
    signal node_stack_addr_out : node_address_type;
    signal cntr_stack_addr_out : centre_list_address_type;
    signal cntr_stack_k_out : centre_index_type;    
       
    -- scheduler
    signal schedule_state : schedule_state_type;
    signal schedule_counter : centre_index_type;
    signal schedule_counter_done : std_logic;
    signal schedule_k_reg : centre_index_type;
    signal schedule_next : std_logic;   
    
    -- allocator
    signal allocator_free : std_logic;
    signal allocator_free_1 : std_logic;
    signal allocator_free_2 : std_logic;
    signal allocator_free_reg : std_logic;
    signal allocator_free_address : centre_list_address_type;    
    signal allocator_alloc : std_logic;
    signal allocator_rdy : std_logic;
    signal allocator_address_out : centre_list_address_type;
    signal allocator_address_out_reg : centre_list_address_type;       
    signal allocator_heap_full : std_logic;    
    
       
    -- debug and stats (not synthesised)
    signal debug_u_left : node_address_type;
    signal debug_u_right : node_address_type;
    signal first_start : std_logic := '0';    
    signal visited_nodes : unsigned(31 downto 0);
    signal cycle_count : unsigned(31 downto 0);
    signal debug_stack_counter : unsigned(31 downto 0);
    signal debug_max_stack_counter : unsigned(31 downto 0);       
    

begin   

    G_NOSYNTH_0 : if SYNTHESIS = false generate
        -- some statistics
        vn_counter_proc : process(clk)
        begin
            if rising_edge(clk) then
                if sclr = '1' then
                    visited_nodes <= (others=> '0');
                elsif ptn_rdy = '1' then
                    visited_nodes <= visited_nodes+1;
                end if;
                
                if start = '1' then
                    first_start <= '1'; -- latch the first start assertion
                end if;
                
                if first_start = '0' then
                    cycle_count <= (others=> '0');
                else -- count cycles for all iterations
                    cycle_count <= cycle_count+1;
                end if;
                
                if sclr = '1' then
                    debug_stack_counter <= (others=>'0');
                    debug_max_stack_counter <= (others=>'0');
                else
                    if debug_max_stack_counter < debug_stack_counter then
                        debug_max_stack_counter <= debug_stack_counter;
                    end if;
                    if stack_push = '1' AND stack_pop = '0' then
                        debug_stack_counter <= debug_stack_counter+2;                    
                    elsif stack_push = '0' AND stack_pop = '1' then
                        debug_stack_counter <= debug_stack_counter-1;
                    end if;  
                end if;                                          
                
            end if;    
        end process vn_counter_proc;
    end generate G_NOSYNTH_0;


    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
            --    state <= idle;
            --elsif state = idle AND wr_init_pos = '1' then
                state <= init;
            elsif state = init AND start = '1' then
                state <= processing_phase1;   
            elsif state = processing_phase1 AND ptn_rdy = '1' then
                state <= processing_phase2; 
            elsif state = processing_phase2 AND processing_done = '1' then
                state <= done;
            elsif state = done then
                state <= init;                                          
            end if;
        end if;
    end process fsm_proc;    
    
    start_processing <= '1' WHEN state = init AND start = '1' ELSE '0';
    
    
    -- scheduler (decides when the next item is popped from stack)
    scheduler_proc : process(clk)
        --variable var_schedule_next : std_logic;
        --variable var_counter_done : std_logic; 
    begin
        if rising_edge(clk) then            
        
            --var_schedule_next := '0';                        
        
            if schedule_state = busy AND stack_valid = '1' then
                schedule_k_reg <= cntr_stack_k_out;
            elsif schedule_state = free then
                schedule_k_reg <= (others => '1');
            end if;
            
            
            if sclr = '1' then
                schedule_state <= free;
            elsif schedule_state = free AND schedule_next =  '1' then               
                schedule_state <= busy;                                   
            elsif schedule_state = busy AND schedule_counter_done = '1' then
                schedule_state <= free;               
            end if;
            
            if sclr  = '1' OR schedule_state = free then
                schedule_counter <= to_unsigned(0,INDEX_BITWIDTH);
            elsif schedule_state = busy AND schedule_counter_done = '0' then
                schedule_counter <= schedule_counter+1;
            end if;
            
        end if;  
    end process scheduler_proc;
    
    schedule_next <= '1' WHEN schedule_state = free AND stack_empty = '0' AND stack_push = '0' AND stack_push_reg = '0' ELSE '0';
    schedule_counter_done <= '1' WHEN (stack_valid = '1' AND schedule_counter >= cntr_stack_k_out) OR (stack_valid = '0' AND schedule_counter >= schedule_k_reg) ELSE '0';             
             
             

    memory_mgmt_rd <= stack_valid  WHEN state = processing_phase2 ELSE start_processing;
    
    rd_node_addr <= root_address WHEN start_processing = '1' ELSE
                    node_stack_addr_out;
                                     
    rd_centre_list_address <= std_logic_vector(to_unsigned(0,CNTR_POINTER_BITWIDTH)) WHEN start_processing = '1' ELSE
                              cntr_stack_addr_out; 
    
    rd_k <= k WHEN start_processing = '1' ELSE
            cntr_stack_k_out;                  
    
    
    memory_mgmt_inst : memory_mgmt
        port map (
            clk => clk,
            sclr => sclr,
            rd => memory_mgmt_rd,
            rd_node_addr => rd_node_addr,
            rd_centre_list_address => rd_centre_list_address,
            rd_k => rd_k,
            wr_cent_nd => ptn_centre_index_rdy,
            wr_cent => ptn_centre_index_wr,            
            wr_centre_list_address => allocator_address_out,
            wr_centre_list_data => ptn_centre_indices_out,  
            wr_init_cent => wr_init_cent,
            wr_centre_list_address_init => wr_centre_list_address_init,
            wr_centre_list_data_init => wr_centre_list_data_init,
            wr_init_node => wr_init_node,
            wr_node_address_init => wr_node_address_init,
            wr_node_data_init => wr_node_data_init,
            wr_init_pos => wr_init_pos,
            wr_centre_list_pos_address_init => wr_centre_list_pos_address_init,
            wr_centre_list_pos_data_init => wr_centre_list_pos_data_init,       
            valid => memory_data_valid,
            rd_node_data => rd_node_data,
            rd_centre_list_data => rd_centre_indices,
            rd_centre_list_pos_data => rd_centre_positions,
            last_centre => memory_mgmt_last_centre,
            item_read_twice => memory_mgmt_item_read_twice,
            rd_centre_list_address_out => rd_centre_list_address_out
        );



    process_tree_node_inst : process_tree_node
        port map (
            clk => clk,
            sclr => sclr,
            nd => memory_data_valid,
            u_in => rd_node_data,
            centre_positions_in => rd_centre_positions,
            centre_indices_in => rd_centre_indices,
            update_centre_buffer => ptn_update_centre_buffer,
            final_index_out => ptn_final_index_out,       
            sum_sq_out => ptn_sum_sq_out,        
            rdy => ptn_rdy,
            dead_end => ptn_dead_end,
            u_out => ptn_u_out,
            k_out => ptn_k_out,
            centre_index_rdy => ptn_centre_index_rdy,
            centre_index_wr => ptn_centre_index_wr,
            centre_indices_out => ptn_centre_indices_out
        );                          
    
    debug_u_left <= ptn_u_out.left;
    debug_u_right <= ptn_u_out.right;
     
     
    tmp_addr <= ptn_final_index_out WHEN rdo_centre_buffer = '0' ELSE centre_buffer_addr;                   
            
    centre_buffer_mgmt_inst : centre_buffer_mgmt
        port map (
            clk => clk,
            sclr => sclr,
            init => wr_init_pos,
            addr_in_init => wr_centre_list_pos_address_init,
            nd => ptn_update_centre_buffer,
            request_rdo => rdo_centre_buffer,
            addr_in => tmp_addr,            
            wgtCent_in => ptn_u_out.wgtCent,
            sum_sq_in => ptn_sum_sq_out,
            count_in => ptn_u_out.count,
            valid => valid,
            wgtCent_out => wgtCent_out,
            sum_sq_out => sum_sq_out,
            count_out => count_out
        );
        
        

    -- used to prevent pops right after a push
    stack_push_reg_proc : process(clk)        
    begin                
        if rising_edge(clk) then                
            if sclr = '1' then                 
                stack_push_reg <= '0';               
            else
                stack_push_reg <= stack_push;                                   
            end if;
        end if;  
    end process stack_push_reg_proc;
           
    stack_pop  <= schedule_next;
    stack_push <= ptn_rdy AND NOT(ptn_dead_end);              
    node_stack_addr_in_1 <= ptn_u_out.right;       
    node_stack_addr_in_2 <= ptn_u_out.left;  
        
    stack_top_inst : stack_top
        port map(
            clk => clk,
            sclr => sclr,
            push => stack_push,
            pop => stack_pop,
            node_addr_in_1 => node_stack_addr_in_1,
            node_addr_in_2 => node_stack_addr_in_2,
            cntr_addr_in_1 => cntr_stack_addr_in,
            cntr_addr_in_2 => cntr_stack_addr_in,
            k_in_1 => cntr_stack_k_in, 
            k_in_2 => cntr_stack_k_in,
            node_addr_out => node_stack_addr_out,
            cntr_addr_out => cntr_stack_addr_out,
            k_out => cntr_stack_k_out, 
            empty => stack_empty,
            valid => stack_valid
        );
    
    G_NO_DYN_ALLOC : if DYN_ALLOC = false generate    
        -- generate a unique address for each centre list written to memory
        inc_centre_list_addr_proc : process(clk)
            variable new_cntr_stack_addr_in : unsigned(CNTR_POINTER_BITWIDTH-1 downto 0);
        begin                
            if rising_edge(clk) then                
                if sclr = '1' then
                    cntr_stack_addr_in <= std_logic_vector(to_unsigned(1,CNTR_POINTER_BITWIDTH));                
                else
                    if ptn_rdy = '1' AND ptn_dead_end = '0' then                 
                        new_cntr_stack_addr_in := unsigned(cntr_stack_addr_in)+1;
                        cntr_stack_addr_in <= std_logic_vector(new_cntr_stack_addr_in);
                    end if;                     
                end if;
            end if;  
        end process inc_centre_list_addr_proc;
        
        cntr_stack_k_in <= ptn_k_out;
        allocator_address_out <= cntr_stack_addr_in;
    end generate G_NO_DYN_ALLOC;
    
    
    G_DYN_ALLOC : if DYN_ALLOC = true generate
    
        allocator_ctrl_proc : process(clk)
        begin                
            if rising_edge(clk) then
                if sclr = '1' then
                    ptn_centre_index_rdy_reg <= '0';
                    allocator_free_reg <= '0';
                else
                    ptn_centre_index_rdy_reg <= ptn_centre_index_rdy;
                    if allocator_free_1 = '1' AND allocator_free_2 = '1' then --two free requests at the same time?
                        allocator_free_reg <= '1';                                               
                    else
                        allocator_free_reg <= '0';
                    end if;                                        
                end if;
                
                if allocator_rdy = '1' then
                    allocator_address_out_reg <= allocator_address_out;
                end if ;
                
                rd_centre_list_address_out_reg <= rd_centre_list_address_out;
                                
            end if;
        end process allocator_ctrl_proc;
        
        allocator_free_1 <= ptn_rdy AND ptn_dead_end;
        allocator_free_2 <= memory_mgmt_last_centre AND memory_mgmt_item_read_twice;
        
        allocator_free_address <= allocator_address_out_reg  WHEN (allocator_free_1 = '1' AND allocator_free_2 = '0') OR (allocator_free_1 = '1' AND allocator_free_2 = '1') ELSE
                                  rd_centre_list_address_out WHEN allocator_free_1 = '0' AND allocator_free_2 = '1' ELSE
                                  rd_centre_list_address_out_reg;                          
        
        allocator_free <= allocator_free_1 OR allocator_free_2 OR allocator_free_reg;
        allocator_alloc <= ptn_centre_index_rdy AND NOT(ptn_centre_index_rdy_reg); -- first cycle only  --ptn_rdy AND NOT(ptn_dead_end); 
        
        allocator_inst : allocator
            generic map (
                MEMORY_SIZE => HEAP_SIZE
            )
            port map (
                clk => clk,
                sclr => wr_init_node,--sclr,
                alloc => allocator_alloc,
                free => allocator_free,
                address_in => allocator_free_address,
                rdy => allocator_rdy,
                address_out => allocator_address_out,
                heap_full => allocator_heap_full
            );
        
        cntr_stack_addr_in <= allocator_address_out_reg;
        cntr_stack_k_in <= k WHEN allocator_address_out_reg = std_logic_vector(to_unsigned(0,CNTR_POINTER_BITWIDTH)) ELSE ptn_k_out;        
        
    end generate G_DYN_ALLOC;  
      
     
    processing_done_counter_proc : process(clk)        
    begin                
        if rising_edge(clk) then  
        
            if start_processing = '1' then
                processing_done_value <= k+to_unsigned(38+100,INDEX_BITWIDTH+1);
            end if;
            
            if sclr = '1' OR state = processing_phase1 OR state = done then                
                processing_counter_enable <= '0';
            else                
                if state = processing_phase2 AND ptn_rdy = '1' then
                    processing_counter_enable <= '1';
                end if;
            end if;
                     
            if sclr = '1' OR state = processing_phase1 then            
                processing_done_counter <= (others => '0');
            elsif processing_counter_enable = '1' AND ptn_rdy = '0' then
                processing_done_counter <= processing_done_counter+1;
            elsif processing_counter_enable = '1' AND ptn_rdy = '1' then
                processing_done_counter <= (others => '0');
            end if;                 
            
        end if;  
    end process processing_done_counter_proc;
              
    -- output    
    processing_done <= '1' WHEN processing_done_counter = processing_done_value  ELSE '0';    
    rdy <= processing_done;      
                
end Behavioral;

