----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: allocator - Behavioral
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

entity allocator is
    generic (
        MEMORY_SIZE : integer := 1024
    );
    port (
        clk : in std_logic;
        sclr : in std_logic;
        alloc : in std_logic;
        free : in std_logic;
        address_in : in std_logic_vector(integer(ceil(log2(real(MEMORY_SIZE))))-1 downto 0);
        rdy : out std_logic;
        address_out : out std_logic_vector(integer(ceil(log2(real(MEMORY_SIZE))))-1 downto 0);
        heap_full : out std_logic
    );
end allocator;

architecture Behavioral of allocator is

    constant FREE_LIST_BITWIDTH : integer := integer(ceil(log2(real(MEMORY_SIZE))));
    
    constant HEAP_BOUND : integer := MEMORY_SIZE-1;

    COMPONENT free_list_memory
      PORT (
        a : IN STD_LOGIC_VECTOR(FREE_LIST_BITWIDTH-1 DOWNTO 0);
        d : IN STD_LOGIC_VECTOR(FREE_LIST_BITWIDTH-1 DOWNTO 0);
        dpra : IN STD_LOGIC_VECTOR(FREE_LIST_BITWIDTH-1 DOWNTO 0);
        clk : IN STD_LOGIC;
        we : IN STD_LOGIC;
        dpo : OUT STD_LOGIC_VECTOR(FREE_LIST_BITWIDTH-1 DOWNTO 0)
      );
    END COMPONENT;

    signal tmp_free : std_logic;

    signal current_free_location : std_logic_vector(FREE_LIST_BITWIDTH-1 downto 0);
    
    signal free_list_mem_we : std_logic;
    signal free_list_mem_dout : std_logic_vector(FREE_LIST_BITWIDTH-1 downto 0);       
    signal free_list_mem_din : std_logic_vector(FREE_LIST_BITWIDTH-1 downto 0);
    
    signal address_in_reg : std_logic_vector(FREE_LIST_BITWIDTH-1 downto 0);
    
    signal alloc_count : unsigned(FREE_LIST_BITWIDTH-1 downto 0);
    signal tmp_heap_full : std_logic;
    
    signal debug_max_alloc_count : unsigned(FREE_LIST_BITWIDTH-1 downto 0);
    signal debug_fl_last_item_reached : std_logic;
    signal debug_invalid_location : std_logic;
    signal debug_invalid_malloc : std_logic;

begin

    tmp_free <= '0' WHEN address_in = std_logic_vector(to_unsigned(0,FREE_LIST_BITWIDTH)) ELSE free; -- do not deallocate address 0

    alloc_free_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                current_free_location <= std_logic_vector(to_unsigned(1,FREE_LIST_BITWIDTH)); --first list is always pre-allocated                
                alloc_count <= to_unsigned(1,FREE_LIST_BITWIDTH); --first list is always pre-allocated
            else
                if alloc = '1' AND tmp_free = '0' then
                    if tmp_heap_full = '0' then
                        current_free_location <= free_list_mem_dout;       
                        alloc_count <= alloc_count + 1;
                    end if;
                elsif tmp_free = '1' AND alloc = '0' then 
                    current_free_location <= address_in;
                    alloc_count <= alloc_count - 1;                 
                end if;                
            end if;
            address_in_reg <= address_in;
        end if;    
    end process alloc_free_proc;
    
    free_list_mem_we  <= tmp_free OR (tmp_free AND alloc);
    free_list_mem_din <= address_in;
    
    -- replace this memory by register file in case of timing issues
    free_list_memory_inst : free_list_memory
        port map (
            a => free_list_mem_din,
            d => current_free_location,
            dpra => current_free_location,
            clk => clk,
            we => free_list_mem_we,
            dpo => free_list_mem_dout
        );    
        
    tmp_heap_full <= '1' WHEN alloc_count = to_unsigned(HEAP_BOUND,FREE_LIST_BITWIDTH) ELSE '0'; 
            
    rdy <= alloc;
    address_out <=  address_in WHEN alloc = '1' AND tmp_free = '1' ELSE
                    (others => '0') WHEN tmp_heap_full = '1' AND alloc = '1' AND tmp_free = '0' ELSE
                    current_free_location;
    heap_full <= tmp_heap_full; 
    
    
    -- debuggin info
    G_NOSYNTH_0 : if SYNTHESIS = false generate
        stats_proc : process(clk)
        begin
            if rising_edge(clk) then
                if sclr = '1' then
                    debug_max_alloc_count <= (others => '0');
                else
                    if debug_max_alloc_count < alloc_count then
                        debug_max_alloc_count <= alloc_count;                     
                    end if;
                end if;
            end if;
        end process stats_proc;
        
        debug_fl_last_item_reached <= '1' WHEN current_free_location = std_logic_vector(to_unsigned(HEAP_BOUND,FREE_LIST_BITWIDTH)) ELSE '0';
        debug_invalid_location <= '1' WHEN current_free_location > std_logic_vector(to_unsigned(HEAP_BOUND,FREE_LIST_BITWIDTH)) ELSE '0';
        debug_invalid_malloc <= '1' WHEN alloc = '1' AND debug_invalid_location = '1' ELSE '0';
        
    end generate G_NOSYNTH_0;

end Behavioral;
