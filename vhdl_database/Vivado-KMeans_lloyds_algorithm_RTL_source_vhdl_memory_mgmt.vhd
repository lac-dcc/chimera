----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: memory_mgmt - Behavioral
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

entity memory_mgmt is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        rd : in std_logic;
        rd_node_addr : in node_address_type;        
        k : in centre_index_type;
        wr_init_node : in std_logic;
        wr_node_address_init : in node_address_type;
        wr_node_data_init : in node_data_type;
        wr_init_pos : in std_logic;
        wr_centre_list_pos_address_init : in centre_index_type;
        wr_centre_list_pos_data_init : in data_type;
        valid : out std_logic_vector(0 to PARALLEL_UNITS-1);
        rd_node_data : out par_node_data_type;
        rd_centre_list_pos_data : out par_data_type
    );
end memory_mgmt;

architecture Behavioral of memory_mgmt is

    constant MEM_LAT : integer := 2;

    type rd_state_type is (idle, reading_centre_list);
    
    type pos_addr_delay_type is array(1 to PARALLEL_UNITS-1) of centre_index_type;

    component node_memory
        port (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(NODE_POINTER_BITWIDTH-1 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(D*COORD_BITWIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(NODE_POINTER_BITWIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(D*COORD_BITWIDTH-1 DOWNTO 0)
        );
    end component;
    
    component centre_positions_memory_top
        port (
            clk : in std_logic;
            wea : in std_logic_vector(0 to PARALLEL_UNITS-1);
            addra : in par_centre_index_type;
            dina : in par_data_type;
            addrb : in par_centre_index_type;
            doutb : out par_data_type    
        );
    end component;
    
    signal rd_state : rd_state_type;         
    signal rd_counter_done : std_logic;
    signal rd_counter : centre_index_type;          
    
    signal reading_centres : std_logic;
    signal delay_line : std_logic_vector(0 to MEM_LAT+PARALLEL_UNITS-1-1);
        
    signal rd_k_reg : centre_index_type;    
    signal rd_node_address_reg : node_address_type;        
    
    signal wr_node_reg : std_logic;
    signal wr_node_address_reg : node_address_type;
    signal wr_node_data_reg : node_data_type;
    signal tmp_wr_node_address : std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
    signal tmp_wr_node_data_in : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    signal tmp_rd_node_data_out : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    
    signal tmp_rd_node_address : std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);    
    
    signal wr_pos_reg : std_logic;
    signal wr_pos_address_reg : centre_index_type;
    signal wr_pos_data_reg : data_type;    
    signal tmp_wr_centre_list_pos_data_init : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    signal tmp_centre_pos_out : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);

    signal pos_wea : std_logic_vector(0 to PARALLEL_UNITS-1);
    signal pos_wr_address : par_centre_index_type;
    signal pos_wr_data : par_data_type;
    signal pos_rd_address : par_centre_index_type;
    signal pos_rd_data : par_data_type;
    signal pos_addr_delay : pos_addr_delay_type;

begin

    --writing to memories
    
    -- delay buffer wr input by one cycle due to state machine
    wr_input_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then                
                wr_node_reg <= '0';
                wr_pos_reg <= '0';
            else                
                wr_node_reg <= wr_init_node;
                wr_pos_reg <= wr_init_pos;
            end if;            
            
            wr_node_address_reg <= wr_node_address_init; 
            wr_node_data_reg <= wr_node_data_init;
            
            wr_pos_address_reg <= wr_centre_list_pos_address_init;
            wr_pos_data_reg <= wr_centre_list_pos_data_init;             

        end if;
    end process wr_input_reg_proc;            
        
    tmp_wr_node_address <= std_logic_vector(wr_node_address_reg);
    tmp_wr_node_data_in <= nodedata_2_stdlogic(wr_node_data_reg);     

    tmp_wr_centre_list_pos_data_init <= datapoint_2_stdlogic(wr_pos_data_reg);



    -- reading memories 

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
        
            if sclr = '1' then
                rd_state <= idle;
            elsif rd_state = idle AND rd = '1' then
                rd_state <= reading_centre_list;
            elsif rd_state = reading_centre_list AND rd_counter_done = '1' then
                rd_state <= idle;
            end if;            
            
        end if;
    end process fsm_proc;
    
    counter_proc : process(clk)
    begin
        if rising_edge(clk) then
        
            if sclr = '1' then
                rd_counter <= (others => '0');
            else
                if rd_state <= idle then
                    rd_counter <= (others => '0');
                else
                    rd_counter <= rd_counter+1;               
                end if;                
            end if;            
            
        end if;
    end process counter_proc;
    
    rd_counter_done <= '1' WHEN rd_counter = rd_k_reg AND rd_state = reading_centre_list ELSE '0'; 
    
    addr_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            if rd = '1' then 
                rd_node_address_reg <= rd_node_addr;                
                rd_k_reg <= k;
            end if;                 
        end if;    
    end process addr_reg_proc; 
    
    
    tmp_rd_node_address <= std_logic_vector(rd_node_address_reg);

    
    node_memory_inst : node_memory
        port  map(
            clka => clk,
            wea(0) => wr_node_reg,
            addra => tmp_wr_node_address,
            dina => tmp_wr_node_data_in,
            clkb => clk,
            addrb => tmp_rd_node_address,
            doutb => tmp_rd_node_data_out
        );                
 
    G_PAR_0 : for I in 0 to PARALLEL_UNITS-1 generate
        rd_node_data(I) <= stdlogic_2_nodedata(tmp_rd_node_data_out);
    end generate G_PAR_0;
           
    
    G_PAR_1 : for I in 0 to PARALLEL_UNITS-1 generate
        pos_wea(I) <= wr_pos_reg;
        pos_wr_address(I) <= wr_pos_address_reg;
        pos_wr_data(I) <= wr_pos_data_reg;
    end generate G_PAR_1;     
    
    G_PAR_1_1 : if PARALLEL_UNITS > 1 generate
        pos_addr_delay_proc : process(clk)
        begin
            if rising_edge(clk) then
                pos_addr_delay(1) <= rd_counter; 
                pos_addr_delay(2 to PARALLEL_UNITS-1) <= pos_addr_delay(1 to PARALLEL_UNITS-2);             
            end if;     
        end process pos_addr_delay_proc;
    end generate G_PAR_1_1;
    
    pos_rd_address(0) <= rd_counter;
    G_PAR_2 : for I in 1 to PARALLEL_UNITS-1 generate
        pos_rd_address(I) <= pos_addr_delay(I);
    end generate G_PAR_2;    
    
    centre_positions_memory_top_inst : centre_positions_memory_top
        port map (
            clk => clk,
            wea => pos_wea,
            addra => pos_wr_address,
            dina => pos_wr_data,
            addrb => pos_rd_address,
            doutb => pos_rd_data    
        );
               
        
    reading_centres <= '1' WHEN rd_state = reading_centre_list ELSE '0';   
        
    dely_line_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                delay_line <= (others => '0');
            else  
                delay_line(0) <= reading_centres;
                delay_line(1 to MEM_LAT+PARALLEL_UNITS-1-1) <= delay_line(0 to MEM_LAT+PARALLEL_UNITS-1-2);                
            end if;
        end if;
    end process dely_line_proc;        
            
    G_PAR_3 : for I in 0 to PARALLEL_UNITS-1 generate 
        valid(I) <= delay_line(MEM_LAT+I-1); 
        rd_centre_list_pos_data(I) <= pos_rd_data(I);   
    end generate G_PAR_3;               

end Behavioral;
