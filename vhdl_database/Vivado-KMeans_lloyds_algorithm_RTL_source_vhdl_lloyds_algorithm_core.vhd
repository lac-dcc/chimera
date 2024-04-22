----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: lloyds_algorithm_core - Behavioral
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use work.lloyds_algorithm_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lloyds_algorithm_core is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        start : in std_logic; 
        -- initial parameters    
        n : in node_index_type;            
        k : in centre_index_type;
        -- init node and centre memory 
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
end lloyds_algorithm_core;

architecture Behavioral of lloyds_algorithm_core is

    type state_type is (idle, init, processing_phase, done);
    type schedule_state_type is (free, busy, wait_cycle);
    
    type par_element_type_ext is array(0 to D-1) of std_logic_vector(PARALLEL_UNITS*COORD_BITWIDTH_EXT-1 downto 0);
    type par_element_type_ext_sum is array(0 to D-1) of std_logic_vector(COORD_BITWIDTH_EXT+integer(ceil(log2(real(PARALLEL_UNITS))))-1 downto 0);

    component memory_mgmt
        port (
            clk : in std_logic;
            sclr : in std_logic;
            rd : in std_logic;
            rd_node_addr : in node_address_type;        
            k : in centre_index_type;
            wr_init_node : in std_logic;
            wr_node_address_init : in node_address_type;
            wr_node_data_init : in node_data_type;
            wr_init_pos : in std_logic;
            wr_centre_list_pos_address_init : in centre_index_type;
            wr_centre_list_pos_data_init : in data_type;
            valid : out std_logic_vector(0 to PARALLEL_UNITS-1);
            rd_node_data : out par_node_data_type;
            rd_centre_list_pos_data : out par_data_type
        );
    end component;
    
    component process_node is
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            u_in : in node_data_type;
            centre_positions_in : in data_type;
            rdy : out std_logic;
            final_index_out : out centre_index_type;        
            sum_sq_out : out coord_type_ext;
            u_out : out node_data_type
        );
    end component;
    
    component centre_buffer_mgmt
        port (
            clk : in std_logic;
            sclr : in std_logic;
            init : in std_logic;
            addr_in_init : in centre_index_type;
            nd : in std_logic;
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
    
    component adder_tree 
        generic (
            USE_DSP_FOR_ADD : boolean := true;
            NUMBER_OF_INPUTS : integer := 4;
            INPUT_BITWIDTH : integer := 16
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            sub :  in std_logic;
            input_string : in std_logic_vector(NUMBER_OF_INPUTS*INPUT_BITWIDTH-1 downto 0);
            rdy : out std_logic;
            output : out std_logic_vector(INPUT_BITWIDTH+integer(ceil(log2(real(NUMBER_OF_INPUTS))))-1 downto 0)    
        );
    end component;     
    
    -- fsm
    signal state : state_type;
    signal start_processing : std_logic;
    signal first_output : std_logic;
    signal processing_done_counter : node_index_type;
    signal processing_done : std_logic;
    signal processing_done_reg : std_logic;  
    
    -- scheduler
    signal schedule_state : schedule_state_type;
    signal schedule_counter : centre_index_type;
    signal schedule_node_counter : node_index_type;
    signal schedule_node_counter_reg : node_index_type;
    signal schedule_counter_done : std_logic;
    signal schedule_first : std_logic;
    signal schedule_next : std_logic;  
    signal schedule_par_not_yet_matched : std_logic;
    
    -- memory mgmt
    signal memory_mgmt_rd : std_logic;        
    signal memory_data_valid : std_logic_vector(0 to PARALLEL_UNITS-1);    
    signal rd_node_addr : node_address_type;                
    signal rd_k : centre_index_type;        
    signal rd_node_data : par_node_data_type;
    signal rd_centre_positions : par_data_type;    
        
    -- process_node    
    signal pn_final_index_out : par_centre_index_type;        
    signal pn_sum_sq_out : par_coord_type_ext;        
    signal pn_rdy : std_logic_vector(0 to PARALLEL_UNITS-1);    
    signal pn_u_out : par_node_data_type;   
    
    -- centre buffer mgmt
    signal tmp_addr : par_centre_index_type;
    signal centre_buffer_valid : std_logic_vector(0 to PARALLEL_UNITS-1);
    signal centre_buffer_wgtCent : par_data_type_ext;
    signal centre_buffer_sum_sq : par_coord_type_ext;
    signal centre_buffer_count : par_coord_type; 
    
    -- adder tree
    signal at_input_string_count : std_logic_vector(PARALLEL_UNITS*COORD_BITWIDTH-1 downto 0);
    signal at_count_rdy : std_logic;
    signal at_count_out : std_logic_vector(COORD_BITWIDTH+integer(ceil(log2(real(PARALLEL_UNITS))))-1 downto 0);
    signal at_input_string_wgtCent : par_element_type_ext;    
    signal at_wgtCent_rdy : std_logic;
    signal at_wgtCent_out : par_element_type_ext_sum;    
    signal at_input_string_sum_sq : std_logic_vector(PARALLEL_UNITS*COORD_BITWIDTH_EXT-1 downto 0);
    signal at_sum_sq_rdy : std_logic;
    signal at_sum_sq_out : std_logic_vector(COORD_BITWIDTH_EXT+integer(ceil(log2(real(PARALLEL_UNITS))))-1 downto 0);    

    -- output
    signal tmp_valid : std_logic;
    signal tmp_count_out : coord_type;
    signal tmp_wgtCent_out : data_type_ext;
    signal tmp_sum_sq_out : coord_type_ext;

    -- stats not synthesised
    signal cycle_count_enable : std_logic;
    signal first_start : std_logic := '0';
    signal cycle_count : unsigned(31 downto 0);

begin
    
    G0_SYNTH : if SYNTHESIS = false generate 
        -- some statistics
        stats_proc : process(clk)
        begin
            if rising_edge(clk) then
            
                if sclr = '1' then
                    cycle_count_enable <= '0';
                elsif state = processing_phase AND processing_done_counter /= n then
                    cycle_count_enable <= '1';
                elsif processing_done_counter = n then
                    cycle_count_enable <= '0';
                end if;
                
                if start = '1' then
                    first_start <= '1'; -- latch the first start assertion
                end if;                
            
                if first_start = '0' then
                    cycle_count <= (others => '0');
                else -- count cycles for all iterations
                    cycle_count <= cycle_count+1;
                end if;
                
            end if;
        end process stats_proc;
    end generate G0_SYNTH;

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
--                state <= idle;
--            elsif state = idle AND wr_init_node = '1' then
                state <= init;
            elsif state = init AND start = '1' then
                state <= processing_phase;    
            elsif state = processing_phase AND processing_done_reg = '1' AND schedule_next = '1' then
                state <= done;
            elsif state = done then
                state <= init;                                   
            end if;
        end if;
    end process fsm_proc;    
    
    start_processing <= '1' WHEN state = init AND start = '1' ELSE '0';


    -- scheduler (get next node from node memory)
    scheduler_proc : process(clk)
    begin
        if rising_edge(clk) then                           
            
            if sclr = '1' then
                schedule_state <= free;
            elsif schedule_state = free AND schedule_first = '1' then               
                schedule_state <= busy;                                   
            elsif schedule_state = busy AND schedule_counter_done = '1' then
                schedule_state <= free;               
            end if;
            
            if sclr = '1' OR schedule_state = free then
                schedule_counter <= to_unsigned(0,INDEX_BITWIDTH);
            elsif schedule_state = busy then
                schedule_counter <= schedule_counter+1;
            end if;
            
            if sclr = '1' then 
                schedule_node_counter <= (others => '0');
                processing_done_reg <= '0';
            else
                if schedule_next = '1' then 
                    schedule_node_counter <= schedule_node_counter+1;
                end if;    
                
                if processing_done = '1' then
                    processing_done_reg <= '1';
                end if;           
            end if;                                    
            
        end if;  
    end process scheduler_proc;
    
    schedule_first <= '1' WHEN schedule_state = free AND state = processing_phase  ELSE '0';
    schedule_next <= '1' WHEN schedule_state = busy AND schedule_par_not_yet_matched = '1' ELSE '0';
    
    schedule_counter_done <= '1' WHEN schedule_counter = k ELSE '0';  
                 
    schedule_par_not_yet_matched <= '1' WHEN schedule_counter < to_unsigned(PARALLEL_UNITS,INDEX_BITWIDTH) ELSE '0';
    processing_done <= '1' WHEN schedule_node_counter = n AND state = processing_phase ELSE '0';        

    memory_mgmt_rd <= schedule_next;
    rd_node_addr <= std_logic_vector(schedule_node_counter);
    rd_k <= k;

    memory_mgmt_inst : memory_mgmt
        port map (
            clk => clk,
            sclr => sclr,
            rd => memory_mgmt_rd,
            rd_node_addr => rd_node_addr,
            k => rd_k,            
            wr_init_node => wr_init_node,
            wr_node_address_init => wr_node_address_init,
            wr_node_data_init => wr_node_data_init,
            wr_init_pos => wr_init_pos,
            wr_centre_list_pos_address_init => wr_centre_list_pos_address_init,
            wr_centre_list_pos_data_init => wr_centre_list_pos_data_init,       
            valid => memory_data_valid,
            rd_node_data => rd_node_data,
            rd_centre_list_pos_data => rd_centre_positions
        );

    G_PAR_1 : for I in 0 to PARALLEL_UNITS-1 generate 
    
        process_node_inst : process_node
            port map(
                clk => clk,
                sclr => sclr,
                nd => memory_data_valid(I),
                u_in => rd_node_data(I),
                centre_positions_in => rd_centre_positions(I),
                rdy => pn_rdy(I),
                final_index_out => pn_final_index_out(I),        
                sum_sq_out => pn_sum_sq_out(I),
                u_out => pn_u_out(I)
            );                        
    
    end generate G_PAR_1;


    G_PAR_2 : for I in 0 to PARALLEL_UNITS-1 generate    
  
        tmp_addr(I) <= pn_final_index_out(I) WHEN rdo_centre_buffer = '0' ELSE centre_buffer_addr;           
                
        centre_buffer_mgmt_inst : centre_buffer_mgmt
            port map (
                clk => clk,
                sclr => sclr,
                nd => pn_rdy(I),
                init => wr_init_pos,
                addr_in_init => wr_centre_list_pos_address_init,
                request_rdo => rdo_centre_buffer,
                addr_in => tmp_addr(I),            
                wgtCent_in => conv_normal_2_ext(pn_u_out(I).position),
                sum_sq_in => pn_sum_sq_out(I),
                count_in => std_logic_vector(to_unsigned(1,COORD_BITWIDTH)),
                valid => centre_buffer_valid(I),
                wgtCent_out => centre_buffer_wgtCent(I),
                sum_sq_out => centre_buffer_sum_sq(I),
                count_out => centre_buffer_count(I)
            );
            
        at_input_string_count((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH) <= centre_buffer_count(I);
        at_input_string_sum_sq((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT) <= centre_buffer_sum_sq(I);         
        
        G_PAR_2_1 : for J in 0 to D-1 generate
            at_input_string_wgtCent(J)((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT) <= centre_buffer_wgtCent(I)(J);
        end generate G_PAR_2_1;        
        
    end generate G_PAR_2;
    
    
    
    G_PAR_3 : if PARALLEL_UNITS > 1 generate
    
        adder_tree_inst_count : adder_tree 
            generic map (
                USE_DSP_FOR_ADD => USE_DSP_FOR_ADD,
                NUMBER_OF_INPUTS => PARALLEL_UNITS,
                INPUT_BITWIDTH => COORD_BITWIDTH
            )
            port map(
                clk => clk,
                sclr => sclr,
                nd => centre_buffer_valid(0),
                sub => '0',
                input_string => at_input_string_count,
                rdy => at_count_rdy,
                output => at_count_out    
            );   
            
        G_PAR_3_1 : for J in 0 to D-1 generate
            adder_tree_inst_wgtCent : adder_tree 
                generic map (
                    USE_DSP_FOR_ADD => USE_DSP_FOR_ADD,
                    NUMBER_OF_INPUTS => PARALLEL_UNITS,
                    INPUT_BITWIDTH => COORD_BITWIDTH_EXT
                )
                port map(
                    clk => clk,
                    sclr => sclr,
                    nd => centre_buffer_valid(0),
                    sub => '0',
                    input_string => at_input_string_wgtCent(J),
                    rdy => at_wgtCent_rdy,
                    output => at_wgtCent_out(J)    
                );  
            tmp_wgtCent_out(J) <= at_wgtCent_out(J)(COORD_BITWIDTH_EXT-1 downto 0);
         end generate G_PAR_3_1;
            
        adder_tree_inst_sum_sq : adder_tree 
                generic map (
                    USE_DSP_FOR_ADD => USE_DSP_FOR_ADD,
                    NUMBER_OF_INPUTS => PARALLEL_UNITS,
                    INPUT_BITWIDTH => COORD_BITWIDTH_EXT
                )
                port map(
                    clk => clk,
                    sclr => sclr,
                    nd => centre_buffer_valid(0),
                    sub => '0',
                    input_string => at_input_string_sum_sq,
                    rdy => at_sum_sq_rdy,
                    output => at_sum_sq_out    
                );  
                
        tmp_valid <= at_count_rdy;
        tmp_count_out <= at_count_out(COORD_BITWIDTH-1 downto 0);        
        tmp_sum_sq_out <= at_sum_sq_out(COORD_BITWIDTH_EXT-1 downto 0);                 
                     
    end generate G_PAR_3;            
    
    G_PAR_4 : if PARALLEL_UNITS = 1 generate        
        
        tmp_valid <= centre_buffer_valid(0);
        tmp_count_out <= centre_buffer_count(0);
        tmp_wgtCent_out <= centre_buffer_wgtCent(0);
        tmp_sum_sq_out <= centre_buffer_sum_sq(0);        

    end generate G_PAR_4;
        
    
    processing_done_counter_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                first_output <= '0';            
                processing_done_counter <= to_unsigned(PARALLEL_UNITS-1,NODE_POINTER_BITWIDTH);
            elsif pn_rdy(PARALLEL_UNITS-1) = '1' then
                first_output <= '1';
                if first_output = '1' then
                    processing_done_counter <= processing_done_counter+to_unsigned(PARALLEL_UNITS,NODE_POINTER_BITWIDTH);
                end if;
            end if;
        end if;
    end process processing_done_counter_proc;


    valid           <= tmp_valid;
    wgtCent_out     <= tmp_wgtCent_out;
    sum_sq_out      <= tmp_sum_sq_out;
    count_out       <= tmp_count_out;
        
    rdy             <= '1' WHEN processing_done_counter >= n ELSE '0';


end Behavioral;
