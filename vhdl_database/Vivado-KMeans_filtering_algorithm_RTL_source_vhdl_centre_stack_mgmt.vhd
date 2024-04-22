----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: centre_stack_mgmt - Behavioral
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

entity centre_stack_mgmt is
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
end centre_stack_mgmt;

architecture Behavioral of centre_stack_mgmt is

    constant MEM_LAT : integer := 2;
    constant STACK_POINTER_BITWIDTH : integer := integer(ceil(log2(real(STACK_SIZE))));

    
    type stack_pointer_delay_line_type is array(0 to MEM_LAT-1) of unsigned(STACK_POINTER_BITWIDTH-1 downto 0);
    
    component centre_stack_memory
        port (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(STACK_POINTER_BITWIDTH-1 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(STACK_POINTER_BITWIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 DOWNTO 0)
        );  
    end component;  
    
    signal stack_pointer : unsigned(STACK_POINTER_BITWIDTH-1 downto 0);
    signal pop_reg : std_logic;
    
    signal push_reg : std_logic;
    
    signal tmp_stack_addr_rd : unsigned(STACK_POINTER_BITWIDTH-1 downto 0);    
    signal stack_addr_rd_reg : unsigned(STACK_POINTER_BITWIDTH-1 downto 0);

    signal tmp_addr_item : std_logic_vector(CNTR_POINTER_BITWIDTH-1 downto 0);
    signal rec_stack_pointer : std_logic_vector(CNTR_POINTER_BITWIDTH-1 downto 0);
    signal tmp_cntr_stack_din : std_logic_vector(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto 0);   
    
    signal tmp_empty : std_logic;
    signal tmp_cntr_stack_dout : std_logic_vector(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto 0);    
        
    signal rdy_delay_line : std_logic_vector(0 to MEM_LAT-1);
    signal emp_delay_line : std_logic_vector(0 to MEM_LAT-1);
    signal stack_pointer_delay_line : stack_pointer_delay_line_type;

begin

    update_stack_ptr_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                stack_pointer <= to_unsigned(0,STACK_POINTER_BITWIDTH);--(others => '0');                
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
             --push_reg <= '0';
         else
             pop_reg <= pop; 
             stack_addr_rd_reg <= tmp_stack_addr_rd; 
             
             --push_reg <= push; 
             --rec_stack_pointer <= std_logic_vector(stack_pointer);                                   
         end if;       
     end if;
    end process input_reg_proc;        
        
    --tmp_addr_item <= rec_stack_pointer(CNTR_POINTER_BITWIDTH-1 downto 1) & '0' WHEN push='1' AND push_reg='1' ELSE std_logic_vector(stack_pointer(CNTR_POINTER_BITWIDTH-1 downto 1)) & '0';
    
    tmp_cntr_stack_din(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto INDEX_BITWIDTH) <= std_logic_vector(cntr_addr_in);
    tmp_cntr_stack_din(INDEX_BITWIDTH-1 downto 0) <= std_logic_vector(k_in);     
        
    centre_stack_memory_inst_1 : centre_stack_memory
        port map (
            clka => clk,
            wea(0) => push,
            addra => std_logic_vector(stack_pointer),
            dina => tmp_cntr_stack_din,
            clkb => clk,
            addrb => std_logic_vector(tmp_stack_addr_rd),--std_logic_vector(stack_addr_rd_reg),
            doutb => tmp_cntr_stack_dout
        );
            
    delay_line_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                rdy_delay_line <= (others => '0');
                emp_delay_line <= (others => '0');
            else
                rdy_delay_line(0) <= pop;--pop_reg;
                rdy_delay_line(1 to MEM_LAT-1) <= rdy_delay_line(0 to MEM_LAT-2);
                
                stack_pointer_delay_line(0) <= tmp_stack_addr_rd;--stack_pointer;
                stack_pointer_delay_line(1 to MEM_LAT-1) <= stack_pointer_delay_line(0 to MEM_LAT-2);
                
                
            end if;
        end if;
    end process delay_line_proc;        
    
    cntr_addr_out <= tmp_cntr_stack_dout(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto INDEX_BITWIDTH);
    k_out <= unsigned(tmp_cntr_stack_dout(INDEX_BITWIDTH-1 downto 0)); 
    
    valid <= rdy_delay_line(MEM_LAT-1); -- AND NOT(emp_delay_line(MEM_LAT-1));
    empty <= tmp_empty;--emp_delay_line(MEM_LAT-1);



end Behavioral;
