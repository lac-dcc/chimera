----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: stack_top - Behavioral
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

entity stack_top is
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
end stack_top;

architecture Behavioral of stack_top is

    type state_type is (one, two);

    component node_stack_mgmt
        port (
            clk : in STD_LOGIC;
            sclr : in STD_LOGIC;
            push : in std_logic;
            pop : in std_logic;
            node_addr_in : in node_address_type;
            node_addr_out : out node_address_type;
            empty : out std_logic;
            valid : out std_logic
        );
    end component;

    component centre_stack_mgmt
        port (
            clk : in STD_LOGIC;
            sclr : in STD_LOGIC;
            push : in std_logic;
            pop : in std_logic;
            cntr_addr_in : in centre_list_address_type;
            k_in : in centre_index_type;
            cntr_addr_out : out centre_list_address_type;
            k_out : out centre_index_type;
            empty : out std_logic;
            valid : out std_logic   
        );
    end component;

    signal state : state_type;
    signal tmp_push : std_logic;
    
    signal node_addr_reg : node_address_type;
    signal cntr_addr_reg : centre_list_address_type;
    signal k_reg : centre_index_type;
    
    signal tmp_cntr_addr_in : centre_list_address_type;
    signal tmp_k_in : centre_index_type;
    signal tmp_node_addr_in : node_address_type;
 
begin

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr ='1' then
                state <= one;
            elsif state = one AND push = '1' then
                state <= two;
            elsif state = two then
                state <= one;
            end if;        
        end if;    
    end process fsm_proc;
   
    input_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            node_addr_reg <= node_addr_in_2;
            cntr_addr_reg <= cntr_addr_in_2;
            k_reg <= k_in_2;     
        end if;    
    end process input_reg_proc;    
    
    tmp_node_addr_in <= node_addr_in_1 WHEN state = one ELSE node_addr_reg;
    tmp_cntr_addr_in <= cntr_addr_in_1 WHEN state = one ELSE cntr_addr_reg;
    tmp_k_in <= k_in_1 WHEN state = one ELSE k_reg;

    tmp_push <= '1' WHEN push = '1' OR state = two ELSE '0';

    node_stack_mgmt_inst : node_stack_mgmt
        port map (
            clk => clk,
            sclr => sclr,
            push => tmp_push,
            pop => pop, 
            node_addr_in => tmp_node_addr_in,
            node_addr_out => node_addr_out,
            empty => empty,
            valid => valid
        );
        
    centre_stack_mgmt_inst : centre_stack_mgmt
        port map (
            clk => clk,
            sclr => sclr,
            push => tmp_push,
            pop => pop,
            cntr_addr_in => tmp_cntr_addr_in,
            k_in => tmp_k_in,
            cntr_addr_out => cntr_addr_out,
            k_out => k_out,
            empty => open,
            valid => open    
        );

end Behavioral;
