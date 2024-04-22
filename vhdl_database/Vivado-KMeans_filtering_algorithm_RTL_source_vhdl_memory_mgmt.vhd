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
use work.filtering_algorithm_pkg.all;

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
        rd_centre_list_address : in centre_list_address_type;
        rd_k : in centre_index_type;        
        wr_cent_nd : in std_logic;
        wr_cent : in std_logic;
        wr_centre_list_address : in centre_list_address_type;
        wr_centre_list_data : in centre_index_type;
        wr_init_cent : in std_logic;
        wr_centre_list_address_init : in centre_list_address_type;
        wr_centre_list_data_init : in centre_index_type;
        wr_init_node : in std_logic;
        wr_node_address_init : in node_address_type;
        wr_node_data_init : in node_data_type;
        wr_init_pos : in std_logic;
        wr_centre_list_pos_address_init : in centre_index_type;
        wr_centre_list_pos_data_init : in data_type;
        valid : out std_logic;
        rd_node_data : out node_data_type;
        rd_centre_list_data : out centre_index_type;
        rd_centre_list_pos_data : out data_type;
        last_centre : out std_logic;
        item_read_twice : out std_logic;
        rd_centre_list_address_out : out centre_list_address_type
    );
end memory_mgmt;

architecture Behavioral of memory_mgmt is

    constant CENTRE_LIST_ADDR_BITWIDTH  : integer := CNTR_POINTER_BITWIDTH+INDEX_BITWIDTH;
    constant MEM_LAT : integer := 3;
    constant MEM_POS_LAT : integer := 2;

    type rd_state_type is (idle, reading_centre_list);
    type wr_state_type is (idle, writing_centre_list);
    type centre_index_delay_type is array(0 to MEM_POS_LAT-1) of centre_index_type;
    type node_data_delay_type is array(0 to MEM_POS_LAT-1) of node_data_type;
    type centre_list_address_delay_type is array(0 to MEM_POS_LAT-1) of centre_list_address_type;


    component node_memory_top
        port (
            clka : in std_logic;
            wea : in std_logic_vector(0 downto 0);
            addra : in std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
            dina : in std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
            clkb : in std_logic;
            addrb : in std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
            doutb : out std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0)    
        );
    end component;


    component centre_index_memory_top
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
    end component;
    
    component centre_positions_memory
        port (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(D*COORD_BITWIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(D*COORD_BITWIDTH-1 DOWNTO 0)
        );
    end component;
    
    signal rd_state : rd_state_type;         
    signal rd_counter_done : std_logic;
    signal rd_counter : centre_index_type;
    
    signal wr_state : wr_state_type;
    signal wr_counter : centre_index_type;   
    
    signal reading_centres : std_logic;    
    signal delay_line : std_logic_vector(0 to MEM_LAT+MEM_POS_LAT+1-1);
    
    signal rd_centre_list_address_reg : centre_list_address_type;
    signal tmp_rd_centre_list_address : std_logic_vector(CENTRE_LIST_ADDR_BITWIDTH-1 downto 0);
    
    signal rd_k_reg : centre_index_type;
    
    signal rd_node_address_reg : node_address_type;
        
    signal wr_centre_list_wea : std_logic;
    signal virtual_write_address_reg : std_logic;
    signal wr_centre_list_address_mux : centre_list_address_type;
    signal wr_centre_list_address_reg : centre_list_address_type;
    signal tmp_wr_centre_list_address : std_logic_vector(CENTRE_LIST_ADDR_BITWIDTH-1 downto 0);
    signal wr_cent_reg : std_logic;
    signal wr_centre_list_data_mux : centre_index_type;
    signal wr_centre_list_data_reg : centre_index_type;
    signal tmp_item_read_twice : std_logic;
    signal tmp_item_address : centre_list_address_type;
    
    signal wr_node_reg : std_logic;
    signal wr_node_address_reg : node_address_type;
    signal wr_node_data_reg : node_data_type;
    signal tmp_wr_node_address : std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
    signal tmp_wr_node_data_in : std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    signal tmp_rd_node_data_out : std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    
    signal tmp_rd_node_address : std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
    signal node_data_delay : node_data_delay_type;
    
    signal tmp_centre_in : std_logic_vector(INDEX_BITWIDTH-1 downto 0);
    signal tmp_centre_out : std_logic_vector(INDEX_BITWIDTH-1 downto 0);
    signal centre_out_delay_line : centre_index_delay_type;
    signal item_read_twice_delay_line : std_logic_vector(0 to MEM_POS_LAT-1);
    signal centre_list_address_delay : centre_list_address_delay_type;
    
    signal tmp_wr_centre_list_pos_data_init : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    signal tmp_centre_pos_out : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);

begin

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
            
            if sclr = '1' then
                wr_state <= idle;
            elsif wr_state = idle AND (wr_cent_nd = '1' OR wr_init_cent = '1') then
                wr_state <= writing_centre_list;
            elsif wr_state = writing_centre_list AND (wr_cent_nd = '0' AND wr_init_cent = '0') then
                wr_state <= idle;
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
            
            if sclr = '1' then
                wr_counter <= (others => '0');
            else
                if wr_state <= idle then
                    wr_counter <= (others => '0');
                elsif wr_cent_reg = '1' then --(wr_cent_nd ='1' AND wr_cent='1') OR wr_init_cent='1' then
                     wr_counter <= wr_counter+1;               
                end if;                
            end if;
            
        end if;
    end process counter_proc;
    
    rd_counter_done <= '1' WHEN rd_counter = rd_k_reg AND rd_state = reading_centre_list ELSE '0'; 
    
    addr_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            if rd_state = idle AND rd = '1' then
                rd_centre_list_address_reg <= rd_centre_list_address; 
                rd_node_address_reg <= rd_node_addr;
                
                rd_k_reg <= rd_k;
            end if;                 
        end if;    
    end process addr_reg_proc; 
    
           
    -- mux between init and normal wr
    wr_centre_list_address_mux <= wr_centre_list_address WHEN wr_init_cent = '0' ELSE wr_centre_list_address_init; 
    wr_centre_list_data_mux <= wr_centre_list_data WHEN wr_init_cent = '0' ELSE wr_centre_list_data_init;    
    
    -- delay buffer wr input by one cycle due to state machine
    wr_input_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                wr_cent_reg <= '0';
                wr_node_reg <= '0';
            else
                wr_cent_reg <= (wr_cent_nd AND wr_cent) OR wr_init_cent;
                wr_node_reg <= wr_init_node;
            end if;
            
            if ((wr_state = idle AND wr_cent_nd = '1') OR wr_init_cent = '1') then
                wr_centre_list_address_reg <= wr_centre_list_address_mux;                
            end if; 
            
            if sclr = '1' then
                virtual_write_address_reg <= '0';
            elsif (wr_state = idle AND wr_cent_nd = '1') then
                if wr_centre_list_address = std_logic_vector(to_unsigned(0,CNTR_POINTER_BITWIDTH)) then
                    virtual_write_address_reg <= '1';
                else
                    virtual_write_address_reg <= '0';
                end if;
            end if;
            
            wr_centre_list_data_reg <= wr_centre_list_data_mux;
            
            wr_node_address_reg <= wr_node_address_init; 
            wr_node_data_reg <= wr_node_data_init;

        end if;
    end process wr_input_reg_proc;
    
    tmp_rd_centre_list_address(CENTRE_LIST_ADDR_BITWIDTH-1 downto INDEX_BITWIDTH) <= std_logic_vector(rd_centre_list_address_reg);
    tmp_rd_centre_list_address(INDEX_BITWIDTH-1 downto 0) <= std_logic_vector(rd_counter);
    
    tmp_wr_centre_list_address(CENTRE_LIST_ADDR_BITWIDTH-1 downto INDEX_BITWIDTH) <= std_logic_vector(wr_centre_list_address_reg);
    tmp_wr_centre_list_address(INDEX_BITWIDTH-1 downto 0) <= std_logic_vector(wr_counter);
    
    tmp_centre_in <= std_logic_vector(wr_centre_list_data_reg);
    wr_centre_list_wea <= wr_cent_reg AND NOT(virtual_write_address_reg);

    centre_index_memory_top_inst : centre_index_memory_top
        port map (
            clk => clk,
            sclr => sclr,
            rd  => reading_centres,
            wea(0) => wr_centre_list_wea,
            addra => tmp_wr_centre_list_address,
            dina => tmp_centre_in,            
            addrb => tmp_rd_centre_list_address,
            doutb => tmp_centre_out,
            item_read_twice => tmp_item_read_twice,
            item_address => tmp_item_address
        );
        
    tmp_rd_node_address <= std_logic_vector(rd_node_address_reg);
        
    tmp_wr_node_address <= std_logic_vector(wr_node_address_reg);
    tmp_wr_node_data_in <= nodedata_2_stdlogic(wr_node_data_reg); 
    
    node_memory_top_inst : node_memory_top
        port  map(
            clka => clk,
            wea(0) => wr_node_reg,
            addra => tmp_wr_node_address,
            dina => tmp_wr_node_data_in,
            clkb => clk,
            addrb => tmp_rd_node_address,
            doutb => tmp_rd_node_data_out
        );                
        
    reading_centres <= '1' WHEN rd_state = reading_centre_list ELSE '0';   
        
    dely_line_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                delay_line <= (others => '0');
            else  
                delay_line(0) <= reading_centres;
                delay_line(1 to MEM_LAT+MEM_POS_LAT+1-1) <= delay_line(0 to MEM_LAT+MEM_POS_LAT+1-2);
                
                centre_out_delay_line(0) <= unsigned(tmp_centre_out);
                centre_out_delay_line(1 to MEM_POS_LAT-1) <= centre_out_delay_line(0 to MEM_POS_LAT-2);
                
                node_data_delay(0) <=  stdlogic_2_nodedata(tmp_rd_node_data_out);
                node_data_delay(1 to MEM_POS_LAT-1) <= node_data_delay(0 to MEM_POS_LAT-2);
                
                item_read_twice_delay_line(0) <= tmp_item_read_twice;
                item_read_twice_delay_line(1 to MEM_POS_LAT-1) <= item_read_twice_delay_line(0 to MEM_POS_LAT-2);
                
                centre_list_address_delay(0) <= tmp_item_address;
                centre_list_address_delay(1 to MEM_POS_LAT-1) <= centre_list_address_delay(0 to MEM_POS_LAT-2);
            end if;
        end if;
    end process dely_line_proc;

    tmp_wr_centre_list_pos_data_init <= datapoint_2_stdlogic(wr_centre_list_pos_data_init);

    centre_positions_memory_inst : centre_positions_memory
        port map (
            clka => clk,
            wea(0) => wr_init_pos,
            addra => std_logic_vector(wr_centre_list_pos_address_init),
            dina => tmp_wr_centre_list_pos_data_init,
            clkb => clk,
            addrb => tmp_centre_out,
            doutb => tmp_centre_pos_out
        );
            
   
    valid <= delay_line(MEM_LAT+MEM_POS_LAT-1);
    rd_centre_list_data <= centre_out_delay_line(MEM_POS_LAT-1);
    rd_node_data <= node_data_delay(MEM_POS_LAT-1);
    
    rd_centre_list_pos_data <= stdlogic_2_datapoint(tmp_centre_pos_out); 
        
    last_centre <= delay_line(MEM_LAT+MEM_POS_LAT-1) AND NOT(delay_line(MEM_LAT+MEM_POS_LAT-2));      
    item_read_twice <= item_read_twice_delay_line(MEM_POS_LAT-1);
    rd_centre_list_address_out <= centre_list_address_delay(MEM_POS_LAT-1);
    
end Behavioral;
