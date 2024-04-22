----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: lloyds_algorithm_top - Behavioral
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

entity lloyds_algorithm_top is
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
        -- outputs
        valid : out std_logic;
        clusters_out : out data_type;
        distortion_out : out coord_type_ext;       
        -- processing done       
        rdy : out std_logic    
    );
end lloyds_algorithm_top;

architecture Behavioral of lloyds_algorithm_top is

    type state_type is (phase_1_init, processing, readout, phase_2_init, gap_state1, reset_core, gap_state2, phase_2_start, done);    
        
    constant DIVIDER_II : integer := 2;

    component lloyds_algorithm_core
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
    signal mux_wr_init_pos : std_logic;
    signal mux_wr_centre_list_pos_address_init : centre_index_type;
    signal mux_wr_centre_list_pos_data_init : data_type;    
    
    -- core output signals
    signal tmp_valid : std_logic;
    signal tmp_wgtCent_out : data_type_ext;
    signal tmp_sum_sq_out : coord_type_ext;
    signal tmp_count_out : coord_type;           
    signal tmp_rdy : std_logic;      
    
    -- divider and final output signals
    signal divider_nd : std_logic;
    signal divider_wgtCent_in : data_type_ext;
    signal divider_count_in : coord_type;       
    signal comb_rdy : std_logic;    
    signal comb_valid : std_logic;    
    signal comb_sum_sq_out : coord_type_ext;     
    signal comb_new_position : data_type;    
    signal divide_by_zero : std_logic;             

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
         
    mux_wr_init_pos <= wr_init_pos WHEN state = phase_1_init ELSE comb_valid AND NOT(divide_by_zero);
    mux_wr_centre_list_pos_address_init <= wr_centre_list_pos_address_init WHEN state = phase_1_init ELSE init_counter;
    mux_wr_centre_list_pos_data_init <= wr_centre_list_pos_data_init WHEN state = phase_1_init ELSE comb_new_position;
      
    lloyds_algorithm_core_inst : lloyds_algorithm_core 
        port map (
            clk => clk,
            sclr => single_sclr,
            start => single_start,
            -- initial parameters    
            n => n,           
            k => k,
            -- init node and centre memory 
            wr_init_node => wr_init_node,
            wr_node_address_init => wr_node_address_init,
            wr_node_data_init => wr_node_data_init,
            wr_init_pos => mux_wr_init_pos,
            wr_centre_list_pos_address_init => mux_wr_centre_list_pos_address_init,
            wr_centre_list_pos_data_init => mux_wr_centre_list_pos_data_init,
            -- access centre buffer              
            rdo_centre_buffer => readout_centre_buffers,
            centre_buffer_addr => readout_counter,
            valid => tmp_valid,
            wgtCent_out => tmp_wgtCent_out,
            sum_sq_out => tmp_sum_sq_out,
            count_out => tmp_count_out,       
            -- processing done       
            rdy => tmp_rdy   
        );
        
    comb_rdy <= tmp_rdy;

    divider_nd <= tmp_valid;
    divider_wgtCent_in <= tmp_wgtCent_out; 
    divider_count_in <= tmp_count_out;        
    comb_sum_sq_out <= tmp_sum_sq_out; 
    
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
