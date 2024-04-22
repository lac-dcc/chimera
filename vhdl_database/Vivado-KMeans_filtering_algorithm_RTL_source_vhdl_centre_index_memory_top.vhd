----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: centre_index_memory_top - Behavioral
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

entity centre_index_memory_top is
    port (
        clk : in std_logic;
        sclr : in std_logic; 
        rd : in std_logic;       
        wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        addra : IN STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0);
        addrb : IN STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0);
        item_read_twice : out std_logic;
        item_address : out std_logic_vector(CNTR_POINTER_BITWIDTH-1 downto 0)
    );
end centre_index_memory_top;

architecture Behavioral of centre_index_memory_top is

    constant CENTRE_INDEX_MEM_LAT : integer := 3;
    constant CENTRE_LIST_BASE_ADDR_BITWIDTH : integer := CNTR_POINTER_BITWIDTH;
    
    type state_type is (idle, write_write, write_read);

    component centre_index_memory
        port (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0)
        );
    end component;
    
    COMPONENT centre_index_trace_memory
        PORT (
            a : IN STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH-1 DOWNTO 0);
            d : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            dpra : IN STD_LOGIC_VECTOR(CNTR_POINTER_BITWIDTH-1 DOWNTO 0);
            clk : IN STD_LOGIC;
            we : IN STD_LOGIC;            
            qdpo : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
    
    signal state : state_type;
    
    signal tmp_rd : std_logic;
    
    signal rd_reg : std_logic;
    signal wr_reg : std_logic;
    signal rd_first_cl : std_logic;
    signal rd_first_cl_reg : std_logic;
    signal wr_first_cl : std_logic;
    
    signal rd_addr_reg : std_logic_vector(CNTR_POINTER_BITWIDTH-1 downto 0);
    signal rd_addr_reg_out : std_logic_vector(CNTR_POINTER_BITWIDTH-1 downto 0);
        
    signal trace_mem_we : std_logic;
    signal trace_mem_wr_addr : std_logic_vector(CNTR_POINTER_BITWIDTH-1 downto 0);
    signal trace_mem_d : std_logic_vector(0 downto 0);
    
    signal trace_mem_dout : std_logic_vector(0 downto 0); 
    signal trace_mem_dout_reg : std_logic;
    signal trace_mem_dout_reg_out : std_logic;
    
begin
    -- read address 0 corresponds is virtual
    tmp_rd <= rd;--'0' WHEN addrb(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 DOWNTO INDEX_BITWIDTH) = std_logic_vector(to_unsigned(0,CNTR_POINTER_BITWIDTH)) ELSE rd;

    fsm_proc : process(clk) 
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                state <= write_write;
            elsif state = write_write AND rd_first_cl = '1' AND wr_first_cl = '1' then
                state <= write_read;
            elsif state = write_read then
                state <= write_write;                
            end if;
            
        end if;
    end process fsm_proc;

    input_latch_proc : process(clk) 
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                rd_reg <= '0';
                wr_reg <= '0';
                rd_first_cl_reg <= '0';
            else
                rd_reg <= tmp_rd;
                wr_reg <= wea(0);
                rd_first_cl_reg <= rd_first_cl;
            end if;
            
            if rd_first_cl = '1' then
                rd_addr_reg <= addrb(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto INDEX_BITWIDTH);
            end if;            
        end if;
    end process input_latch_proc;
    
    rd_first_cl <= tmp_rd AND NOT(rd_reg);
    wr_first_cl <= wea(0) AND NOT(wr_reg);
    
    trace_mem_we <= '1' WHEN rd_first_cl = '1' OR wr_first_cl = '1' OR state = write_read ELSE '0';
    trace_mem_wr_addr <= addra(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto INDEX_BITWIDTH) WHEN wr_first_cl = '1' ELSE                         
                         addrb(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto INDEX_BITWIDTH) WHEN wr_first_cl = '0' AND rd_first_cl = '1' ELSE
                         rd_addr_reg;
    trace_mem_d(0) <= NOT(wr_first_cl);                   

    centre_index_trace_memory_inst : centre_index_trace_memory
        port map (
            a => trace_mem_wr_addr,
            d => trace_mem_d,
            dpra => addrb(CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH-1 downto INDEX_BITWIDTH),
            clk => clk,
            we => trace_mem_we,
            qdpo => trace_mem_dout
        );

    centre_index_memory_inst : centre_index_memory
        port map (
            clka => clk,
            wea => wea,
            addra => addra,
            dina => dina,
            clkb => clk,
            addrb => addrb,
            doutb => doutb
        );
         
    -- sample trace memory output in the right moment (2nd cycle)
    sample_output_proc : process(clk) 
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                trace_mem_dout_reg <= '0';
            else
                if rd_first_cl_reg = '1' then
                    trace_mem_dout_reg <= trace_mem_dout(0);
                end if;                
            end if;       
            
            rd_addr_reg_out <= rd_addr_reg;
            trace_mem_dout_reg_out <= trace_mem_dout_reg;     
        end if;
    end process sample_output_proc;            
            
    item_read_twice <= trace_mem_dout_reg_out;
    item_address <= rd_addr_reg_out;

end Behavioral;
