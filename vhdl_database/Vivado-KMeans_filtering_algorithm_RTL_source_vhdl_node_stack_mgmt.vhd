----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: node_stack_mgmt - Behavioral
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

entity node_stack_mgmt is
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
end node_stack_mgmt;

architecture Behavioral of node_stack_mgmt is

    constant MEM_LAT : integer := 2;
    constant STACK_POINTER_BITWIDTH : integer := integer(ceil(log2(real(STACK_SIZE))));
        
    --type stack_pointer_delay_line_type is array(0 to MEM_LAT-1) of unsigned(STACK_POINTER_BITWIDTH-1 downto 0);
    
    component node_stack_memory
        port (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(STACK_POINTER_BITWIDTH-1 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(NODE_POINTER_BITWIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(STACK_POINTER_BITWIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(NODE_POINTER_BITWIDTH-1 DOWNTO 0)
        );  
    end component;  
    
    signal stack_pointer : unsigned(STACK_POINTER_BITWIDTH-1 downto 0);
    signal pop_reg : std_logic;
    
    signal tmp_stack_addr_rd : unsigned(STACK_POINTER_BITWIDTH-1 downto 0);    
    signal stack_addr_rd_reg : unsigned(STACK_POINTER_BITWIDTH-1 downto 0);
    
    signal tmp_node_stack_dout : std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
    
    signal tmp_empty : std_logic;
    signal rdy_delay_line : std_logic_vector(0 to MEM_LAT-1);
    signal emp_delay_line : std_logic_vector(0 to MEM_LAT-1);
    --signal stack_pointer_delay_line : stack_pointer_delay_line_type;

begin

    update_stack_ptr_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                stack_pointer <= (others => '0');

            else
                if push = '1' AND pop = '0' then
                    stack_pointer <= stack_pointer+1;
                elsif push = '0' AND pop = '1' then
                    stack_pointer <= stack_pointer-1;
                elsif push = '1' AND pop = '1' then
                    stack_pointer <= stack_pointer; -- add 1, remove 1
                end if;        
                       
            end if;            
            
        end if;
    end process update_stack_ptr_proc;              
       
    tmp_stack_addr_rd <= stack_pointer-1;
    tmp_empty <= '1' WHEN stack_pointer = 0 ELSE '0';
    
    input_reg_proc : process(clk)
    begin
     if rising_edge(clk) then
         if sclr = '1' then             
             pop_reg <= '0';
         else
             pop_reg <= pop; 
             stack_addr_rd_reg <= tmp_stack_addr_rd;                       
         end if;       
     end if;
    end process input_reg_proc;        
        
    node_stack_memory_inst : node_stack_memory
        port map (
            clka => clk,
            wea(0) => push,
            addra => std_logic_vector(stack_pointer),
            dina => std_logic_vector(node_addr_in),
            clkb => clk,
            addrb => std_logic_vector(tmp_stack_addr_rd),--std_logic_vector(stack_addr_rd_reg),
            doutb => tmp_node_stack_dout
        );  
            
    delay_line_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                rdy_delay_line <= (others => '0');
                --emp_delay_line <= (others => '0');
            else
                rdy_delay_line(0) <= pop;--pop_reg;
                rdy_delay_line(1 to MEM_LAT-1) <= rdy_delay_line(0 to MEM_LAT-2);
                
                --emp_delay_line(0) <= tmp_empty;
                --emp_delay_line(1 to MEM_LAT-1) <= emp_delay_line(0 to MEM_LAT-2);
                
            end if;
        end if;
    end process delay_line_proc;        
    
    node_addr_out <= tmp_node_stack_dout; 
    
    valid <= rdy_delay_line(MEM_LAT-1); -- AND NOT(emp_delay_line(MEM_LAT-1));
    empty <= tmp_empty;--emp_delay_line(MEM_LAT-1);


end Behavioral;
