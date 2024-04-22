----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: prune_centres - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity prune_centres is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        point : in data_type;    
        point_list_idx : in centre_index_type;    
        point_list_d : in data_type; -- assume FIFO interface !!! 
        bnd_lo : in data_type;
        bnd_hi : in data_type;   
        min_num_centres: out centre_index_type;
        point_list_idx_out : out centre_index_type;
        result : out std_logic;
        valid : out std_logic;
        rdy : out std_logic 
    );
end prune_centres;

architecture Behavioral of prune_centres is

    constant LAT_PRUNING_TEST : integer := 2*2+MUL_CORE_LATENCY+2*integer(ceil(log2(real(D))));

    type state_type is (idle, processing, done);
    
    type index_delay_type is array(0 to LAT_PRUNING_TEST-1) of centre_index_type;

    component pruning_test
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            cand : in data_type;
            closest_cand : in data_type;
            bnd_lo : in data_type;
            bnd_hi : in data_type;
            result : out std_logic;
            rdy : out std_logic        
        );
    end component;
    
    signal state : state_type;
    
    signal idle_signal : std_logic;
    signal done_signal : std_logic;
       
    signal point_reg : data_type;
    signal point_idx_reg : centre_index_type;
    signal point_list_d_reg : data_type;
    signal bnd_lo_reg : data_type;
    signal bnd_hi_reg : data_type;
    
    signal pruning_test_nd : std_logic;
    signal too_far : std_logic;
    signal pruning_test_rdy : std_logic;
    
    signal counter : centre_index_type;
    signal counter_reg : centre_index_type;
    
    signal done_delay_line : std_logic_vector(0 to LAT_PRUNING_TEST-1);
    signal idle_delay_line : std_logic_vector(0 to LAT_PRUNING_TEST-1);
    
    signal index_delay_line : index_delay_type;
    
    signal rdy_reg : std_logic;
    signal valid_reg : std_logic;
    signal result_reg : std_logic;
    signal point_idx_reg_out : centre_index_type;

begin

    -- assume that point is valid from the first time nd asserts and remains valid until it deasserts !!! 

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                state <= idle;
            elsif state = idle AND nd='1' then
                state <= processing;
            elsif state = processing AND nd='0' then -- assume continuous streaming
                state <= idle;
            elsif state = done then
                state <= idle;            
            end if;
        end if;
    end process fsm_proc;
    
    idle_signal <= '1' WHEN state = idle ELSE '0';
    done_signal <= '1' WHEN state = processing AND nd='0' ELSE '0';
    
    -- need to delay by one cycle due to state machine
    input_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            point_reg <= point;
            point_idx_reg <= point_list_idx;
            point_list_d_reg <= point_list_d;
            bnd_lo_reg <= bnd_lo;
            bnd_hi_reg <= bnd_hi;
        end if;
    end process input_reg_proc;

    pruning_test_nd <= '1' WHEN state = processing ELSE '0';

    pruning_test_inst : pruning_test
        port map (
            clk => clk,
            sclr => sclr,
            nd => pruning_test_nd,
            cand => point_list_d_reg,
            closest_cand => point_reg,
            bnd_lo => bnd_lo_reg,
            bnd_hi => bnd_hi_reg,
            result => too_far,
            rdy => pruning_test_rdy        
        );
    
    -- delay the done and idle signal to the end (synchronous with pruning_test outputs) 
    delay_line_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                idle_delay_line <= (others => '0' );
                done_delay_line <= (others => '0' );
            else
                idle_delay_line(0) <= idle_signal;
                done_delay_line(0) <= done_signal;
                idle_delay_line(1 to LAT_PRUNING_TEST-1) <= idle_delay_line(0 to LAT_PRUNING_TEST-2);
                done_delay_line(1 to LAT_PRUNING_TEST-1) <= done_delay_line(0 to LAT_PRUNING_TEST-2);
                
                index_delay_line(0) <= point_idx_reg;
                index_delay_line(1 to LAT_PRUNING_TEST-1) <= index_delay_line(0 to LAT_PRUNING_TEST-2);
            end if;
        end if;
    end process delay_line_proc;

    counter_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' OR idle_delay_line(LAT_PRUNING_TEST-1)='1' then
                counter <= (others => '1'); -- controlled overflow
            else
                if pruning_test_rdy = '1' AND too_far = '0' then
                    counter <= counter+1;
                end if;
            end if;
        end if;
    end process counter_proc;
    
   
    rdy_proc : process(clk)
    begin 
        if rising_edge(clk) then
            if sclr ='1' then
                rdy_reg <= '0';   
                valid_reg <= '0';            
            else
                rdy_reg <= done_delay_line(LAT_PRUNING_TEST-1);
                valid_reg <= pruning_test_rdy;              
            end if;

            result_reg <= NOT(too_far);
            point_idx_reg_out <= index_delay_line(LAT_PRUNING_TEST-1);

        end if;
    end process rdy_proc;
    
    
    valid <= valid_reg;
    point_list_idx_out <= point_idx_reg_out;
    result <= result_reg;
        
    rdy <= rdy_reg;
    min_num_centres <= counter;    
    
end Behavioral;
