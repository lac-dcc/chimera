----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: filtering_algorithm_top - Behavioral
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

entity filtering_alogrithm_top is
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
end filtering_alogrithm_top;

architecture Behavioral of filtering_alogrithm_top is

    type state_type is (phase_1_init, processing, readout, phase_2_init, gap_state1, reset_core, gap_state2, phase_2_start, done);    
        
    constant DIVIDER_II : integer := 2; --5;

    component filtering_alogrithm_single
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
    
    component divider_top
        generic (
            ROUND : boolean := false
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            dividend : in data_type_ext;
            divisor : in coord_type;
            rdy : out std_logic;
            quotient : out data_type;
            divide_by_zero : out std_logic
        );
    end component;   
    
    -- control
    signal state : state_type; 
    signal single_sclr : std_logic;   
    signal single_start : std_logic;
    signal readout_counter : centre_index_type;    
    signal readout_counter_done : std_logic;
    signal readout_centre_buffers : std_logic;
    signal init_counter : centre_index_type;
    signal init_counter_done : std_logic;
    signal divider_ii_counter : unsigned(integer(ceil(log2(real(DIVIDER_II))))-1 downto 0);
    signal divider_ii_counter_done : std_logic;
    signal iterations_counter : unsigned(integer(ceil(log2(real(L_MAX))))-1 downto 0);
    signal iterations_counter_done : std_logic;
    
    -- core input signals
    signal mux_wr_init_cent : std_logic;
    signal mux_wr_centre_list_address_init : centre_list_address_type;
    signal mux_wr_centre_list_data_init : centre_index_type;
    signal mux_wr_init_pos : std_logic;
    signal mux_wr_centre_list_pos_address_init : centre_index_type;
    signal mux_wr_centre_list_pos_data_init : data_type;    
    
    -- core output signals
    signal tmp_valid : std_logic_vector(0 to PARALLEL_UNITS-1);
    signal tmp_wgtCent_out : par_data_type_ext;
    signal tmp_sum_sq_out : par_coord_type_ext;
    signal tmp_count_out : par_coord_type;           
    signal tmp_rdy : std_logic_vector(0 to PARALLEL_UNITS-1);  
    signal reg_rdy : std_logic_vector(0 to PARALLEL_UNITS-1);  
    
    -- adder tree
    signal at_input_string_count : std_logic_vector(PARALLEL_UNITS*COORD_BITWIDTH-1 downto 0);
    signal at_count_rdy : std_logic;
    signal at_count_out : std_logic_vector(COORD_BITWIDTH+integer(ceil(log2(real(PARALLEL_UNITS))))-1 downto 0);
    signal at_input_string_wgtCent : par_element_type_ext;    
    signal at_wgtCent_rdy : std_logic;
    signal at_wgtCent_out : par_element_type_ext_sum;  
    signal tmp_wgtCent_out2 : data_type_ext;  
    signal at_input_string_sum_sq : std_logic_vector(PARALLEL_UNITS*COORD_BITWIDTH_EXT-1 downto 0);
    signal at_sum_sq_rdy : std_logic;
    signal at_sum_sq_out : std_logic_vector(COORD_BITWIDTH_EXT+integer(ceil(log2(real(PARALLEL_UNITS))))-1 downto 0);    
    
    -- signals after tree reduction
    signal divider_nd : std_logic;
    signal divider_wgtCent_in : data_type_ext;
    signal divider_count_in : coord_type;       
    signal comb_rdy : std_logic;    
    signal comb_valid : std_logic;    
    signal comb_sum_sq_out : coord_type_ext;         
    signal comb_new_position : data_type;
    signal divide_by_zero : std_logic; 

   
--    type coord_type_array is array(0 to 4) of coord_type;
--    constant test_input_dim0 : coord_type_array := (std_logic_vector(to_signed(-579,COORD_BITWIDTH)), std_logic_vector(to_signed(-878,COORD_BITWIDTH)), std_logic_vector(to_signed(290,COORD_BITWIDTH)), std_logic_vector(to_signed(358,COORD_BITWIDTH)), std_logic_vector(to_signed(0,COORD_BITWIDTH)));
--    constant test_input_dim1 : coord_type_array := (std_logic_vector(to_signed(-258,COORD_BITWIDTH)), std_logic_vector(to_signed(-396,COORD_BITWIDTH)), std_logic_vector(to_signed(-115,COORD_BITWIDTH)), std_logic_vector(to_signed(-723,COORD_BITWIDTH)), std_logic_vector(to_signed(0,COORD_BITWIDTH)));   
--    signal test_input :  data_type;

begin   

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                state <= phase_1_init;
            elsif state = phase_1_init AND start = '1' then
                state <= processing;
            elsif state = processing AND comb_rdy = '1' then
                state <= readout;
            elsif state = readout AND readout_counter_done = '1' then
                state <= phase_2_init;       
            elsif state = phase_2_init AND init_counter_done = '1' then
                state <= gap_state1; -- 1 cycle
            elsif state = gap_state1 then             
                state <= reset_core; -- we hope that the initialised blockram will not be flushed by this!!!
            elsif state = reset_core then 
                state <= gap_state2; -- 1 cycle
            elsif state = gap_state2 then 
                state <= phase_2_start; -- 1 cycle                
            elsif state = phase_2_start then 
                state <= processing; -- 1 cycle
            end if;
        end if;
    end process fsm_proc;
    
    single_sclr <= '1' WHEN sclr = '1' OR state = reset_core ELSE '0'; 
    single_start <= '1' WHEN start = '1' OR state = phase_2_start ELSE '0';   
    readout_centre_buffers <= '1' WHEN state = readout AND divider_ii_counter = 0 ELSE '0';
    
    counter_proc : process(clk)
    begin
        if rising_edge(clk) then   
        
            if state = processing OR divider_ii_counter_done = '1' then
                divider_ii_counter <= (others => '0');
            elsif state = readout then
                divider_ii_counter <= divider_ii_counter + 1;
            end if;     
        
            if state = processing then
                readout_counter <= (others => '0');
            elsif state = readout AND divider_ii_counter_done = '1' then
                readout_counter <= readout_counter+1;
            end if;
            
            if state = processing then
                init_counter <= (others => '0');
            elsif comb_valid = '1' then
                init_counter <= init_counter+1;
            end if;
            
            if sclr = '1' then
                iterations_counter <= (others => '0');
            elsif init_counter_done = '1' AND comb_valid = '1' then
                iterations_counter <= iterations_counter+1;
            end if;
            
        end if;
    end process counter_proc;
                
    readout_counter_done <= '1' WHEN readout_counter = k ELSE '0';
    init_counter_done    <= '1' WHEN init_counter = k ELSE '0';
    divider_ii_counter_done <= '1' WHEN divider_ii_counter = to_unsigned(DIVIDER_II-1,integer(ceil(log2(real(DIVIDER_II))))) ELSE '0';
    iterations_counter_done <= '1' WHEN iterations_counter = to_unsigned(L_MAX-1,integer(ceil(log2(real(L_MAX))))) ELSE '0';
     
    
--    test_input(0) <= test_input_dim0(to_integer(init_counter));
--    test_input(1) <= test_input_dim1(to_integer(init_counter));
    
    mux_wr_init_cent <= wr_init_cent; --needs to be written only once
    mux_wr_centre_list_address_init <= std_logic_vector(to_unsigned(0,CNTR_POINTER_BITWIDTH));
    mux_wr_centre_list_data_init <= wr_centre_list_data_init; --needs to be written only once
    
    mux_wr_init_pos <= wr_init_pos WHEN state = phase_1_init ELSE comb_valid AND NOT(divide_by_zero); -- do not update centre if count was zero
    mux_wr_centre_list_pos_address_init <= wr_centre_list_pos_address_init WHEN state = phase_1_init ELSE init_counter;
    mux_wr_centre_list_pos_data_init <= wr_centre_list_pos_data_init WHEN state = phase_1_init ELSE comb_new_position;

    G_PAR_2 : for I in 0 to PARALLEL_UNITS-1 generate 
    
        filtering_alogrithm_single_inst : filtering_alogrithm_single
            port map(
                clk => clk,
                sclr => single_sclr, 
                start => single_start, 
                -- initial parameters                
                k => k,
                root_address => root_address(I),
                -- init node and centre memory         
                wr_init_cent => mux_wr_init_cent,
                wr_centre_list_address_init => mux_wr_centre_list_address_init,
                wr_centre_list_data_init => mux_wr_centre_list_data_init,
                wr_init_node => wr_init_node(I),
                wr_node_address_init => wr_node_address_init(I),
                wr_node_data_init => wr_node_data_init(I),
                wr_init_pos => mux_wr_init_pos,
                wr_centre_list_pos_address_init => mux_wr_centre_list_pos_address_init,
                wr_centre_list_pos_data_init => mux_wr_centre_list_pos_data_init,
                -- access centre buffer              
                rdo_centre_buffer => readout_centre_buffers,
                centre_buffer_addr => readout_counter,
                valid => tmp_valid(I),
                wgtCent_out => tmp_wgtCent_out(I),
                sum_sq_out => tmp_sum_sq_out(I),
                count_out => tmp_count_out(I),        
                -- processing done       
                rdy => tmp_rdy(I)        
            );
        
        at_input_string_count((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH) <= tmp_count_out(I);
        at_input_string_sum_sq((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT) <= tmp_sum_sq_out(I);         
        
        G_PAR_2_1 : for J in 0 to D-1 generate
            at_input_string_wgtCent(J)((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT) <= tmp_wgtCent_out(I)(J);
        end generate G_PAR_2_1;
          
    end generate G_PAR_2;
    
    
    -- wait till all parallel units have asserted rdy signal
    core_rdy_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            if single_sclr = '1' then
                reg_rdy <= (others => '0');
            else
                for I in 0 to PARALLEL_UNITS-1 loop
                    reg_rdy(I) <= tmp_rdy(I);
                end loop;
            end if;
        end if;
    end process core_rdy_reg_proc;         
    
    core_rdy_proc : process(reg_rdy)
        variable var_rdy : std_logic;
    begin
        var_rdy := '1';
        for I in 0 to PARALLEL_UNITS-1 loop
            var_rdy := var_rdy AND reg_rdy(I);
        end loop;   
        comb_rdy <= var_rdy;
    end process core_rdy_proc;    
         
    
    -- tree adders
    G_PAR_3 : if PARALLEL_UNITS > 1 generate
    
        adder_tree_inst_count : adder_tree 
            generic map (
                USE_DSP_FOR_ADD => USE_DSP_FOR_ADD,
                NUMBER_OF_INPUTS => PARALLEL_UNITS,
                INPUT_BITWIDTH => COORD_BITWIDTH
            )
            port map(
                clk => clk,
                sclr => single_sclr,
                nd => tmp_valid(0),
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
                    sclr => single_sclr,
                    nd => tmp_valid(0),
                    sub => '0',
                    input_string => at_input_string_wgtCent(J),
                    rdy => at_wgtCent_rdy,
                    output => at_wgtCent_out(J)    
                );  
            tmp_wgtCent_out2(J) <= at_wgtCent_out(J)(COORD_BITWIDTH_EXT-1 downto 0);
         end generate G_PAR_3_1;
            
        adder_tree_inst_sum_sq : adder_tree 
            generic map (
                USE_DSP_FOR_ADD => USE_DSP_FOR_ADD,
                NUMBER_OF_INPUTS => PARALLEL_UNITS,
                INPUT_BITWIDTH => COORD_BITWIDTH_EXT
            )
            port map(
                clk => clk,
                sclr => single_sclr,
                nd => tmp_valid(0),
                sub => '0',
                input_string => at_input_string_sum_sq,
                rdy => at_sum_sq_rdy,
                output => at_sum_sq_out    
            );
                    
        divider_nd <= at_count_rdy;
        divider_wgtCent_in <= tmp_wgtCent_out2;
        divider_count_in <= at_count_out(COORD_BITWIDTH-1 downto 0);                
        comb_sum_sq_out <= at_sum_sq_out(COORD_BITWIDTH_EXT-1 downto 0);             
                 
    end generate G_PAR_3;   
        
                           
    G_PAR_4 : if PARALLEL_UNITS = 1 generate
        divider_nd <= tmp_valid(0);
        divider_wgtCent_in <= tmp_wgtCent_out(0); 
        divider_count_in <= tmp_count_out(0);        
        comb_sum_sq_out <= tmp_sum_sq_out(0);        
    end generate G_PAR_4;

    
    divider_top_inst : divider_top
        generic map (
            ROUND => false
        )
        port map (
            clk => clk,
            sclr => sclr,
            nd => divider_nd,
            dividend => divider_wgtCent_in,
            divisor => divider_count_in,
            rdy => comb_valid,
            quotient => comb_new_position,
            divide_by_zero => divide_by_zero
        );       
    
    -- TODO: accumulate comb_sum_sq_out and use it as a dynamic convergence criterion
    
    valid <= comb_valid;
    clusters_out <= comb_new_position;
    distortion_out <= comb_sum_sq_out;      
    rdy <= iterations_counter_done AND init_counter_done AND comb_valid;          
     
                
end Behavioral;
