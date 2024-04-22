----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: resync_search_results - Behavioral
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

entity resync_search_results is
    generic (
        RESYNC_NODE_DATA : boolean := true;
        RESYNC_CNTR_IDX : boolean := true
    );
    port (
        clk : in std_logic;
        sclr : in std_logic;
        point_list_nd : in std_logic;
        point_list_d : in data_type;
        point_list_idx : in centre_index_type;
        closest_n_first_nd : in std_logic;
        max_idx : in centre_index_type;
        min_point : in data_type;
        min_index : in centre_index_type;        
        u_in : in node_data_type;
        min_point_out : out data_type;
        min_index_out : out centre_index_type;        
        point_list_d_out : out data_type; 
        point_list_idx_out : out centre_index_type;
        u_out : out node_data_type;        
        rdy : out std_logic;
        rdy_last_cycle : out std_logic
    );
end resync_search_results;

architecture Behavioral of resync_search_results is

    type state_type is (idle, readout);

    component centre_positions_fifo
        port (
            clk : IN STD_LOGIC;
            srst : IN STD_LOGIC;
            din : IN STD_LOGIC_VECTOR(D*COORD_BITWIDTH-1 DOWNTO 0);
            wr_en : IN STD_LOGIC;
            rd_en : IN STD_LOGIC;
            dout : OUT STD_LOGIC_VECTOR(D*COORD_BITWIDTH-1 DOWNTO 0);
            full : OUT STD_LOGIC;
            empty : OUT STD_LOGIC;
            valid : OUT STD_LOGIC
        );
    end component;
    
    component centre_index_fifo
        port (
            clk : IN STD_LOGIC;
            srst : IN STD_LOGIC;
            din : IN STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0);
            wr_en : IN STD_LOGIC;
            rd_en : IN STD_LOGIC;
            dout : OUT STD_LOGIC_VECTOR(INDEX_BITWIDTH-1 DOWNTO 0);
            full : OUT STD_LOGIC;
            empty : OUT STD_LOGIC;
            valid : OUT STD_LOGIC
        );
    end component; 
    
    component ctrl_fifo
        port (
            clk : IN STD_LOGIC;
            srst : IN STD_LOGIC;
            din : IN STD_LOGIC_VECTOR(2*INDEX_BITWIDTH+D*COORD_BITWIDTH-1 DOWNTO 0);
            wr_en : IN STD_LOGIC;
            rd_en : IN STD_LOGIC;
            dout : OUT STD_LOGIC_VECTOR(2*INDEX_BITWIDTH+D*COORD_BITWIDTH-1 DOWNTO 0);
            full : OUT STD_LOGIC;
            empty : OUT STD_LOGIC;
            valid : OUT STD_LOGIC
        );
    end component;
    
    component ctrl_fifo_u
        port (
            clk : IN STD_LOGIC;
            srst : IN STD_LOGIC;
            din : IN STD_LOGIC_VECTOR(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 DOWNTO 0);
            wr_en : IN STD_LOGIC;
            rd_en : IN STD_LOGIC;
            dout : OUT STD_LOGIC_VECTOR(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 DOWNTO 0);
            full : OUT STD_LOGIC;
            empty : OUT STD_LOGIC;
            valid : OUT STD_LOGIC
        );
    end component;
    
    signal state : state_type;
    
    signal counter : centre_index_type;   
    signal counter_done : std_logic;  
    
    signal tmp_fifo1_din : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    signal tmp_fifo1_dout : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    signal tmp_fifo1_dout_conv : data_type;
    signal tmp_fifo1_rd_en : std_logic;
    signal tmp_fifo1_emp : std_logic;
    signal tmp_fifo1_valid : std_logic;
    
    signal tmp_fifo1_idx_din : std_logic_vector(INDEX_BITWIDTH-1 downto 0);
    signal tmp_fifo1_idx_dout : std_logic_vector(INDEX_BITWIDTH-1 downto 0);
    
    signal tmp_fifo2_din : std_logic_vector(2*INDEX_BITWIDTH+D*COORD_BITWIDTH-1 downto 0);
    signal tmp_fifo2_dout : std_logic_vector(2*INDEX_BITWIDTH+D*COORD_BITWIDTH-1 downto 0);
    signal tmp_fifo2_rd_en : std_logic;
    signal tmp_fifo2_emp : std_logic;
    signal tmp_fifo2_valid : std_logic;
    signal tmp_fifo2_minpoint_conv : data_type;    
    
    signal tmp_fifo2_u_din : std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    signal tmp_fifo2_u_dout : std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    signal tmp_fifo2_u_dout_conv : node_data_type;
    
    signal reg_point_list_d_out : data_type;    
    
    signal min_point_reg : data_type;
    signal min_index_reg : centre_index_type;     
    signal u_reg : node_data_type;    
    
    --signal fifo1_valid_reg : std_logic;
    signal last_cycle_reg : std_logic;

begin

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                state <= idle;
            elsif state = idle AND tmp_fifo2_rd_en='1' then
                state <= readout;
            elsif state = readout AND counter = 0 then
                state <= idle;           
            end if;
            
        end if;
    end process fsm_proc;        
    
    
    counter_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                counter <= (others => '1');
            else
                if state = idle then
                    counter <= unsigned(tmp_fifo2_dout(INDEX_BITWIDTH-1 downto 0));
                elsif state = readout then 
                    counter <= counter-1;
                end if;
            end if;
        end if;
    end process counter_proc;
    
    counter_done <= '1' WHEN state = readout AND counter = 0 ELSE '0';
    

    -- buffer the centres in a fifo until minsearch is done
    G1: for I in 0 to D-1 generate
        tmp_fifo1_din((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH) <= point_list_d(I);
    end generate G1;
        
    tmp_fifo1_rd_en <= '1' WHEN state = readout ELSE '0';  
        
    fifo1_inst : centre_positions_fifo
        port map (
            clk => clk,
            srst => sclr,
            din => tmp_fifo1_din,
            wr_en => point_list_nd,
            rd_en => tmp_fifo1_rd_en,
            dout => tmp_fifo1_dout,
            full => open,
            empty => tmp_fifo1_emp,
            valid => tmp_fifo1_valid
        );                
    
    G2: for I in 0 to D-1 generate
        tmp_fifo1_dout_conv(I) <= tmp_fifo1_dout((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH);
    end generate G2;
    
    
    G_RSNC_CNTR_IDX : if RESYNC_CNTR_IDX = true generate
        tmp_fifo1_idx_din <= std_logic_vector(point_list_idx);    
        fifo1_idx_inst : centre_index_fifo
            port map (
                clk => clk,
                srst => sclr,
                din => tmp_fifo1_idx_din,
                wr_en => point_list_nd,
                rd_en => tmp_fifo1_rd_en,
                dout => tmp_fifo1_idx_dout,
                full => open,
                empty => open,
                valid => open
            );
    end generate G_RSNC_CNTR_IDX;
    
    G_NRSNC_CNTR_IDX : if RESYNC_CNTR_IDX = false generate
        tmp_fifo1_idx_dout <= (others => '0');
    end generate G_NRSNC_CNTR_IDX;
                      
    tmp_fifo2_din(INDEX_BITWIDTH-1 downto 0) <= std_logic_vector(max_idx);
    tmp_fifo2_din(2*INDEX_BITWIDTH-1 downto 1*INDEX_BITWIDTH) <= std_logic_vector(min_index);    
    G3: for I in 0 to D-1 generate
        tmp_fifo2_din((I+1)*COORD_BITWIDTH+2*INDEX_BITWIDTH-1 downto I*COORD_BITWIDTH+2*INDEX_BITWIDTH) <= min_point(I);        
    end generate G3;
        
    tmp_fifo2_rd_en <= '1' WHEN state = idle AND tmp_fifo2_emp = '0' ELSE '0';    
    
    fifo2_inst : ctrl_fifo
        port map (
            clk => clk,
            srst => sclr,
            din => tmp_fifo2_din,
            wr_en => closest_n_first_nd,
            rd_en => tmp_fifo2_rd_en,
            dout => tmp_fifo2_dout,
            full => open,
            empty => tmp_fifo2_emp,
            valid => tmp_fifo2_valid
        );          

    G5: for I in 0 to D-1 generate
        tmp_fifo2_minpoint_conv(I) <= tmp_fifo2_dout((I+1)*COORD_BITWIDTH+2*INDEX_BITWIDTH-1 downto I*COORD_BITWIDTH+2*INDEX_BITWIDTH);        
    end generate G5;
    
    G_RSNC_U : if RESYNC_NODE_DATA = true generate 
        tmp_fifo2_u_din <= nodedata_2_stdlogic(u_in);    
        fifo2_u_inst : ctrl_fifo_u
            port map (
                clk => clk,
                srst => sclr,
                din => tmp_fifo2_u_din,
                wr_en => closest_n_first_nd,
                rd_en => tmp_fifo2_rd_en,
                dout => tmp_fifo2_u_dout,
                full => open,
                empty => open,
                valid => open
            );       
        tmp_fifo2_u_dout_conv <= stdlogic_2_nodedata(tmp_fifo2_u_dout);
    end generate G_RSNC_U; 
    
    G_NRSNC_U : if RESYNC_NODE_DATA = false generate 
        tmp_fifo2_u_dout <= (others => '0');
        tmp_fifo2_u_dout_conv <= stdlogic_2_nodedata(tmp_fifo2_u_dout);
    end generate G_NRSNC_U;       
    
    output_reg_proc : process(clk)
    begin
        if rising_edge(clk) then
            if state = idle then
                min_point_reg <= tmp_fifo2_minpoint_conv;
                min_index_reg <= unsigned(tmp_fifo2_dout(2*INDEX_BITWIDTH-1 downto 1*INDEX_BITWIDTH));                
                u_reg <= tmp_fifo2_u_dout_conv;
            end if;
            
            if sclr = '1' then
                last_cycle_reg <= '0';
            else
                last_cycle_reg <= counter_done;
            end if;
            
        end if;
    end process output_reg_proc;
    
    rdy_last_cycle <= last_cycle_reg; -- be careful if changing latency of fifo1 
    rdy <= tmp_fifo1_valid;
    
    point_list_d_out <= tmp_fifo1_dout_conv;--reg_point_list_d_out;   
    point_list_idx_out <= unsigned(tmp_fifo1_idx_dout);
    min_point_out <= min_point_reg;
    min_index_out <= min_index_reg;     
    u_out <= u_reg;


end Behavioral;
