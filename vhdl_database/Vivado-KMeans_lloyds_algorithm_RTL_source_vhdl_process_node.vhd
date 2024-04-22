----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: process_node - Behavioral
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

entity process_node is
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
end process_node;

architecture Behavioral of process_node is    

    component closest_to_point_top
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
    end component;

    

    -- closest centre 
    signal closest_centre : data_type;
    signal closest_index : centre_index_type;
    signal closest_distance : coord_type_ext;
    signal u_out_delayed : node_data_type;    
    signal closest_rdy : std_logic;
   
    
    -- write back
    signal tmp_final_index : centre_index_type;

begin


    closest_to_point_inst : closest_to_point_top
        port map (
            clk => clk,
            sclr => sclr,
            nd => nd,
            u_in => u_in,
            point => u_in.position,        
            point_list_d => centre_positions_in,
            min_point => closest_centre, 
            min_index => closest_index,
            min_distance => closest_distance,  
            u_out => u_out_delayed,         
            rdy => closest_rdy
        );

    rdy <= closest_rdy;
    final_index_out <= closest_index;
    sum_sq_out <= closest_distance;
    u_out <= u_out_delayed;
    

end Behavioral;
