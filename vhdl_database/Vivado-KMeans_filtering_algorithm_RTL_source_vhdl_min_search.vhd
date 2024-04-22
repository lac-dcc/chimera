----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: min_search - Behavioral
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

entity min_search is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        metric_in : in coord_type_ext;
        u_in : in node_data_type;
        point_in : in data_type;
        point_idx_in : in centre_index_type;
        min_point : out data_type;
        min_index : out centre_index_type;
        max_idx : out centre_index_type;
        u_out : out node_data_type;
        rdy : out std_logic
    );
end min_search;

architecture Behavioral of min_search is

    type state_type is (idle, processing, delaying, done);
    
    signal state : state_type;
    
    signal metric_in_reg : coord_type_ext;
    signal point_in_reg : data_type; 
    signal point_idx_in_reg : centre_index_type;

    signal current_smallest : std_logic;
    signal tmp_min_metric : coord_type_ext;
    signal tmp_min_index : centre_index_type;
    signal tmp_min_point : data_type;    
    
    signal tmp_u_in : node_data_type;
    
    signal counter : centre_index_type;    
    signal counter_reg : centre_index_type;
    
    signal rdy_reg : std_logic;
    signal rdy_sig : std_logic;

begin

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                state <= idle;
            elsif state = idle AND nd='1' then
                state <= processing;                
                tmp_u_in <= u_in; -- save the u_in input (a bit dirty)                 
            elsif state = processing AND nd='0' then -- assume continuous streaming
                state <= idle;
            elsif state = done then
                state <= idle;            
            end if;
        end if;
    end process fsm_proc;

    -- need to delay by one cycle due to state machine
    input_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            metric_in_reg <= metric_in;
            point_in_reg <= point_in;
            point_idx_in_reg <= point_idx_in;
            counter_reg <= counter;
        end if;
    end process input_reg_proc;


    current_smallest <= '1' WHEN state = processing AND unsigned(metric_in_reg) < unsigned(tmp_min_metric) ELSE '0'; 

    min_distance_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' OR state = idle OR state = done then
                tmp_min_metric(COORD_BITWIDTH_EXT-1 downto 0) <= (others => '1'); --largest possible value (assume unsigned metrics)
                tmp_min_index <= (others => '0');
            else
                if current_smallest = '1' then
                    tmp_min_metric <= metric_in_reg;
                    tmp_min_index <= point_idx_in_reg;--counter;
                    tmp_min_point <= point_in_reg; 
                end if;
            end if;
        end if;
    end process min_distance_proc;
    
    counter_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' OR state = idle OR state = done then
                counter <= (others => '0');
            else
                counter <= counter+1;
            end if;
        end if;
    end process counter_proc;
    
    rdy_sig <= '1' WHEN state = processing AND nd='0' ELSE '0';
    
    rdy_proc : process(clk)
    begin 
        if rising_edge(clk) then
            if sclr ='1' then
                rdy_reg <= '0';
            else
                rdy_reg <= rdy_sig;
            end if;
        end if;
    end process rdy_proc;
          
    min_point <= tmp_min_point;
    min_index <= tmp_min_index;
    max_idx <= counter_reg;
    rdy <=  rdy_reg;  
    u_out <= tmp_u_in;

end Behavioral;
