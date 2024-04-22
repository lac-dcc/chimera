----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: closest_to_point_top - Behavioral
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


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity closest_to_point_top is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        u_in : in node_data_type;
        point : in data_type;        
        point_list_d : in data_type; -- assume FIFO interface !!!
        min_point : out data_type;
        min_index : out centre_index_type;
        min_distance : out coord_type_ext;
        u_out : out node_data_type; 
        rdy : out std_logic
    );
end closest_to_point_top;

architecture Behavioral of closest_to_point_top is

    type state_type is (idle, processing);
        
    constant LAT_DOT_PRODUCT : integer := 3+2*integer(ceil(log2(real(D))));
    constant LAT_SUB : integer := 2;
    constant LATENCY : integer := LAT_DOT_PRODUCT+LAT_SUB;    
    
    type node_data_delay_type is array(0 to LATENCY-1) of node_data_type;            

    component compute_distance_top
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
    end component;
    
    component min_search is
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            metric_in : in coord_type_ext;
            u_in : in node_data_type;
            point_in : in data_type;    
            min_point : out data_type;
            min_index : out centre_index_type;
            min_metric : out coord_type_ext;
            u_out : out node_data_type;
            rdy : out std_logic
        );
    end component;
    
    signal reg_u_in : node_data_type;
    signal reg_point : data_type;
    signal reg_point_list_d : data_type;
    
    signal state : state_type;
    signal compute_distance_nd : std_logic;
    signal compute_distance_rdy : std_logic;                
    signal distance : coord_type_ext; 
    signal point_list_d_delayed : data_type; 
    signal point_list_idx_delayed : centre_index_type;   
    
    signal tmp_min_index : centre_index_type;
    signal tmp_min_point : data_type;
    signal tmp_min_distance : coord_type_ext;
    signal tmp_min_search_rdy : std_logic;   
    
    signal node_data_delay : node_data_delay_type;

begin

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                state <= idle;
            elsif state = idle AND nd='1' then
                state <= processing;
            elsif state = processing AND nd='0' then
                state <= idle;           
            end if;
        end if;
    end process fsm_proc;        
    
    -- need to delay by one cycle due to state machine
    reg_point_list_d_proc : process(clk)
    begin
        if rising_edge(clk) then
            if state = idle AND nd= '1' then
                reg_u_in <= u_in;
                reg_point <= point;
            end if;
            reg_point_list_d <= point_list_d;
        end if;
    end process reg_point_list_d_proc;

    compute_distance_nd <= '1' WHEN state = processing ELSE '0';

    compute_distance_top_inst : compute_distance_top
        port map (
            clk => clk,
            sclr => sclr,
            nd => compute_distance_nd,
            point_1 => reg_point,
            point_2 => reg_point_list_d,
            distance => distance,
            point_1_out => open,
            point_2_out => point_list_d_delayed,
            rdy => compute_distance_rdy
        );
        
    -- feed u_in from input of dot-product to output of dot-product
    data_delay_proc : process(clk)
    begin
        if rising_edge(clk) then
            node_data_delay(0) <= reg_u_in;
            node_data_delay(1 to LATENCY-1) <= node_data_delay(0 to LATENCY-2);
                
        end if;
    end process data_delay_proc;
    
    -- search min    
    min_search_inst : min_search
        port map (
            clk => clk,
            sclr => sclr,
            nd => compute_distance_rdy,
            metric_in => distance,
            u_in => node_data_delay(LATENCY-1),
            point_in => point_list_d_delayed, 
            min_point => tmp_min_point,
            min_index => tmp_min_index,
            min_metric => tmp_min_distance,
            u_out => u_out,   
            rdy => tmp_min_search_rdy
        );
    
    min_point <= tmp_min_point;
    min_index <= tmp_min_index; 
    min_distance <= tmp_min_distance; 
    rdy <= tmp_min_search_rdy;                

end Behavioral;
