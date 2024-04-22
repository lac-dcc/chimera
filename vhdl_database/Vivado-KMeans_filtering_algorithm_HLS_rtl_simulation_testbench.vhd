----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- testbench - behavior
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
use ieee.math_real.all;
use STD.textio.all;
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    constant MY_N : integer := 2*128-1; -- 2*N_POINTS-1
    constant MY_K : integer := 4;
    constant MY_P : integer := 4; -- must match filtering_algorithm_top.h
    constant D : integer := 3;
    
    -- bit width defs
    constant COORD_BITWIDTH : integer := 16;
    constant COORD_BITWIDTH_EXT : integer := 32;
    constant INDEX_BITWIDTH : integer := 8;    
    constant NODE_POINTER_BITWIDTH : integer := 16;
    
    -- input data
    file my_input_tree : TEXT open READ_MODE is "../../../simulation/tree_data_N128_K4_D3_s0.75.mat";
    file my_input_cntr : TEXT open READ_MODE is "../../../simulation/initial_centres_N128_K4_D3_s0.75_1.mat";
    --file my_input_tree : TEXT open READ_MODE is "../../../simulation/tree_data_N16384_K128_D3_s0.20.mat";
    --file my_input_cntr : TEXT open READ_MODE is "../../../simulation/initial_centres_N16384_K128_D3_s0.20_1.mat";    

    -- Clock period definitions
    constant CLK_PERIOD : time := 10 ns;        
    
    constant RESET_CYCLES : integer := 20;        
    constant INIT_CYCLES : integer := MY_N;
    constant NUM_COLS : integer := 5+4*D;
 
    type state_type is (readfile, reset, start_processing, processing, processing_done);
    
    type file_tree_data_array_type is array(0 to NUM_COLS-1, 0 to MY_N-1) of integer;
    type file_cntr_data_array_type is array(0 to D-1, 0 to MY_K-1) of integer;     
    
    
    subtype coord_type is std_logic_vector(COORD_BITWIDTH-1 downto 0);    
    subtype node_address_type is std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
    type data_type is array(0 to D-1) of coord_type;       
    subtype coord_type_ext is std_logic_vector(COORD_BITWIDTH_EXT-1 downto 0);
    type data_type_ext is array(0 to D-1) of coord_type_ext;
    
    type node_data_type is
        record
            wgtCent : data_type_ext;
            midPoint : data_type;
            bnd_lo : data_type;
            bnd_hi : data_type;
            sum_sq : coord_type_ext;
            count : coord_type;       
            left : node_address_type;
            right : node_address_type;
        end record;    
        
        
    function stdlogic_2_datapoint(c : std_logic_vector) return data_type is
        variable result : data_type;
    begin    
        for I in 0 to D-1 loop        
            result(I) := c((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH);
        end loop;        
        return result;
    end stdlogic_2_datapoint;
    
    function datapoint_2_stdlogic(c : data_type) return std_logic_vector is
        variable result : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    begin    
        for I in 0 to D-1 loop        
            result((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH) := std_logic_vector(c(I));
        end loop;        
        return result;
    end datapoint_2_stdlogic;
    
    function nodedata_2_stdlogic(n : node_data_type) return std_logic_vector is
        variable result : std_logic_vector(D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+COORD_BITWIDTH_EXT+COORD_BITWIDTH+2*NODE_POINTER_BITWIDTH-1 downto 0);
    begin
    
        for I in 0 to D-1 loop
            result((I+1)*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto I*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) := n.wgtCent(I);
            result(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) := n.midPoint(I);
            result(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+1*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+1*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) := n.bnd_lo(I);
            result(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+2*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+2*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) := n.bnd_hi(I);
        end loop;
        
        result(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) := n.sum_sq;
        result(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) := n.count;
        result(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+1*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) := std_logic_vector(n.left);
        result(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+2*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+1*NODE_POINTER_BITWIDTH) := std_logic_vector(n.right);

        return result;

    end nodedata_2_stdlogic;            
    
    function stdlogic_2_nodedata(n : std_logic_vector) return node_data_type is
        variable result : node_data_type;
    begin
    
        for I in 0 to D-1 loop        
            result.wgtCent(I)   := n((I+1)*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto I*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
            result.midPoint(I)  := n(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
            result.bnd_lo(I)    := n(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+1*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+1*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
            result.bnd_hi(I)    := n(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+2*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+2*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
        end loop;
        result.sum_sq   := n(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
        result.count    := n(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
        result.left     := n(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+1*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
        result.right    := n(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+2*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+1*NODE_POINTER_BITWIDTH);

        return result;

    end stdlogic_2_nodedata;         
    
    -- Component Declaration for the Unit Under Test (UUT)    
    component filtering_algorithm_top is
        port (
            ap_clk : IN STD_LOGIC;
            ap_rst : IN STD_LOGIC;
            ap_start : IN STD_LOGIC;
            ap_done : OUT STD_LOGIC;
            ap_idle : OUT STD_LOGIC;
            node_data_dout : IN STD_LOGIC_VECTOR (3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
            node_data_empty_n : IN STD_LOGIC;
            node_data_read : OUT STD_LOGIC;
            node_address_V_dout : IN STD_LOGIC_VECTOR (NODE_POINTER_BITWIDTH-1 downto 0);
            node_address_V_empty_n : IN STD_LOGIC;
            node_address_V_read : OUT STD_LOGIC;            
            cntr_pos_init_value_V_dout : IN STD_LOGIC_VECTOR (D*COORD_BITWIDTH-1 downto 0);
            cntr_pos_init_value_V_empty_n : IN STD_LOGIC;
            cntr_pos_init_value_V_read : OUT STD_LOGIC;
            n_V : IN STD_LOGIC_VECTOR (NODE_POINTER_BITWIDTH-1 downto 0);
            k_V : IN STD_LOGIC_VECTOR (INDEX_BITWIDTH-1 downto 0);
            root_V_dout : IN STD_LOGIC_VECTOR (NODE_POINTER_BITWIDTH-1 downto 0);
            root_V_empty_n : IN STD_LOGIC;
            root_V_read : OUT STD_LOGIC;            
            distortion_out_V_din : OUT STD_LOGIC_VECTOR (COORD_BITWIDTH_EXT-1 downto 0);
            distortion_out_V_full_n : IN STD_LOGIC;
            distortion_out_V_write : OUT STD_LOGIC;
            clusters_out_value_V_din : OUT STD_LOGIC_VECTOR (D*COORD_BITWIDTH-1 downto 0);
            clusters_out_value_V_full_n : IN STD_LOGIC;
            clusters_out_value_V_write : OUT STD_LOGIC    
        );
    end component;       

    --Inputs    
    signal ap_clk : std_logic;
    signal ap_rst : std_logic := '1';
    signal ap_start : std_logic := '0';
    signal node_data_dout : std_logic_vector (3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    signal node_type_node_data_dout : node_data_type;
    signal node_data_empty_n : std_logic := '1';    
    signal node_address_V_dout : std_logic_vector (NODE_POINTER_BITWIDTH-1 downto 0);
    signal node_address_V_empty_n : std_logic := '1';         
    signal cntr_pos_init_value_V_dout : std_logic_vector (D*COORD_BITWIDTH-1 downto 0);
    signal data_type_cntr_pos_init_value_V_dout : data_type;
    signal cntr_pos_init_value_V_empty_n : std_logic := '1';
    signal n_V : std_logic_vector (NODE_POINTER_BITWIDTH-1 downto 0);
    signal k_V : std_logic_vector (INDEX_BITWIDTH-1 downto 0);    
    signal root_V_dout : std_logic_vector (NODE_POINTER_BITWIDTH-1 downto 0);
    signal root_V_empty_n : std_logic := '1';    
    signal distortion_out_V_full_n : std_logic := '1';    
    signal clusters_out_value_V_full_n : std_logic := '1';  
         
   -- Outputs   
   signal ap_done : std_logic;
   signal ap_idle : std_logic;
   signal node_data_read : std_logic;
   signal node_address_V_read : std_logic;
   signal root_V_read : std_logic;  
   signal cntr_pos_init_value_V_read : std_logic;
   signal distortion_out_V_din : std_logic_vector (COORD_BITWIDTH_EXT-1 downto 0);
   signal distortion_out_V_write : std_logic;
   signal clusters_out_value_V_din : std_logic_vector (D*COORD_BITWIDTH-1 downto 0);
   signal data_type_clusters_out_value_V_din : data_type;
   signal clusters_out_value_V_write : std_logic;
      	      	
   -- file io
   signal file_tree_data_array : file_tree_data_array_type;
   signal file_cntr_data_array : file_cntr_data_array_type;
   signal read_file_done : std_logic := '0';   
    
   -- Operation
    signal state : state_type := readfile;
    signal reset_counter : integer := 0;
    signal init_root_counter : integer := 0;
    signal init_node_counter : integer := 0;
    signal init_node_addr_counter : integer := 0;
    signal init_cntr_counter : integer := 0;
    signal cycle_counter : integer := 0;
    signal reset_counter_done : std_logic := '0';
    signal init_counter_done : std_logic := '0';

	
 
BEGIN       
 
    -- PARALLEL_UNITS == 1 always in testbench!!!
    -- Instantiate the Unit Under Test (UUT)
    uut : filtering_algorithm_top
        port map (
            ap_clk => ap_clk,
            ap_rst => ap_rst,
            ap_start => ap_start,
            ap_done => ap_done,
            ap_idle => ap_idle,
            node_data_dout => node_data_dout,
            node_data_empty_n => node_data_empty_n,
            node_data_read => node_data_read,
            node_address_V_dout => node_address_V_dout, 
            node_address_V_empty_n => node_address_V_empty_n, 
            node_address_V_read => node_address_V_read,               
            cntr_pos_init_value_V_dout => cntr_pos_init_value_V_dout,
            cntr_pos_init_value_V_empty_n => cntr_pos_init_value_V_empty_n,
            cntr_pos_init_value_V_read => cntr_pos_init_value_V_read,
            n_V => n_V,
            k_V => k_V,            
            root_V_dout => root_V_dout,
            root_V_empty_n => root_V_empty_n,
            root_V_read => root_V_read,
            distortion_out_V_din => distortion_out_V_din,
            distortion_out_V_full_n => distortion_out_V_full_n,
            distortion_out_V_write => distortion_out_V_write,
            clusters_out_value_V_din => clusters_out_value_V_din,
            clusters_out_value_V_full_n => clusters_out_value_V_full_n,
            clusters_out_value_V_write => clusters_out_value_V_write           
        );
        
    data_type_clusters_out_value_V_din <= stdlogic_2_datapoint(clusters_out_value_V_din);   

    
    -- Clock process definitions
    clk_process : process
    begin
        ap_clk <= '1';
        wait for CLK_PERIOD/2;
        ap_clk <= '0';
        wait for CLK_PERIOD/2;
    end process;
 
    fsm_proc : process(ap_clk)
    begin
        if rising_edge(ap_clk) then
            if state = readfile AND read_file_done = '1' then
                state <= reset;
            elsif state = reset AND reset_counter_done = '1' then
                state <= start_processing;
            elsif state = start_processing then
                state <= processing;  
            elsif state = processing AND ap_done = '1' then
                state <= processing_done;                                     
            end if;                                    
        end if;
    end process fsm_proc;
            
    ap_start <= '1' WHEN state = start_processing ELSE '0';            
    
    counter_proc : process(ap_clk)
    begin
        if rising_edge(ap_clk) then
        
            if state = reset then
                reset_counter <= reset_counter+1;
            end if; 
            
            if root_V_read = '1' then 
                init_root_counter <= init_root_counter+1; 
            end if;
            
            if node_data_read = '1' then
                init_node_counter <= init_node_counter+1;
            end if;
            
            if node_address_V_read = '1' then
                init_node_addr_counter <= init_node_addr_counter+1;
            end if;            
            
            if cntr_pos_init_value_V_read = '1' then
                init_cntr_counter <= init_cntr_counter+1;
            end if;            
            
            if state = processing then
                cycle_counter <= cycle_counter+1;
            end if;

            
        end if;
    end process counter_proc;
    
    reset_counter_done <= '1' WHEN reset_counter = RESET_CYCLES-1 ELSE '0';    
   
    reset_proc : process(state)
    begin
        if state = reset then
            ap_rst <= '1';
        else
            ap_rst <= '0';
        end if;
    end process reset_proc;
        
 
    n_V <= std_logic_vector(to_unsigned(MY_N-1-(MY_P-1),NODE_POINTER_BITWIDTH));
    k_V <= std_logic_vector(to_unsigned(MY_K-1,INDEX_BITWIDTH));
    --root_V <= std_logic_vector(to_unsigned(file_tree_data_array(0,0),NODE_POINTER_BITWIDTH));
 
    init_proc : process(state, init_node_counter, init_node_addr_counter, init_cntr_counter, init_root_counter)

        variable centre_pos : data_type;
        variable node : node_data_type; 
    begin    
        
        -- tree_node_memory
        if init_node_counter < 8*MY_N   then  
            for I in 0 to D-1 loop
                node.bnd_lo(I) := std_logic_vector(to_signed(file_tree_data_array(5+0*D+I,init_node_counter/8),COORD_BITWIDTH));
                node.bnd_hi(I) := std_logic_vector(to_signed(file_tree_data_array(5+1*D+I,init_node_counter/8),COORD_BITWIDTH));
                node.midPoint(I) := std_logic_vector(to_signed(file_tree_data_array(5+2*D+I,init_node_counter/8),COORD_BITWIDTH));
                node.wgtCent(I) := std_logic_vector(to_signed(file_tree_data_array(5+3*D+I,init_node_counter/8),COORD_BITWIDTH_EXT));                                      
            end loop;                
            node.sum_sq := std_logic_vector(to_signed(file_tree_data_array(4,init_node_counter/8),COORD_BITWIDTH_EXT));
            node.count := std_logic_vector(to_signed(file_tree_data_array(3,init_node_counter/8),COORD_BITWIDTH));
            node.left := std_logic_vector(to_unsigned(file_tree_data_array(1,init_node_counter/8),NODE_POINTER_BITWIDTH));
            node.right := std_logic_vector(to_unsigned(file_tree_data_array(2,init_node_counter/8),NODE_POINTER_BITWIDTH));
            node_data_dout <= nodedata_2_stdlogic(node);
            node_type_node_data_dout <= node;            
        end if;    
        
        if init_root_counter < MY_P then
            root_V_dout <= std_logic_vector(to_unsigned(init_root_counter*(2**NODE_POINTER_BITWIDTH)/2/MY_P,NODE_POINTER_BITWIDTH));
        end if;
        
        if init_node_addr_counter < MY_N then
            node_address_V_dout <= std_logic_vector(to_unsigned(file_tree_data_array(0,init_node_addr_counter),NODE_POINTER_BITWIDTH));
        end if;
        
        if init_cntr_counter < My_K then
            for I in 0 to D-1 loop
                centre_pos(I) := std_logic_vector(to_signed(file_cntr_data_array(I,init_cntr_counter),COORD_BITWIDTH));
            end loop;
            cntr_pos_init_value_V_dout <= datapoint_2_stdlogic(centre_pos);
            data_type_cntr_pos_init_value_V_dout <= centre_pos;
        end if;
  
    end process init_proc;
        	
	
	
	-- read tree data and initial centres from file
    read_file : process
     	
    	variable my_line : LINE;
    	variable my_input_line : LINE;
    	variable tmp_line_counter_tree : integer;
    	variable tmp_line_counter_cntr : integer;
    	variable tmp_file_line_counter_cntr : integer;
    	variable tmp_d : integer;
    	variable tmp_file_data_tree : file_tree_data_array_type;
    	variable tmp_file_data_cntr : file_cntr_data_array_type;    	
    begin
    	write(my_line, string'("reading input files"));		
    	writeline(output, my_line);	
    	
    	tmp_line_counter_tree := 0;
    	
    	loop
    		exit when endfile(my_input_tree) OR tmp_line_counter_tree = MY_N;
    		readline(my_input_tree, my_input_line);			
    		for I in 0 to NUM_COLS-1 loop -- NUM_COLS columns
    			read(my_input_line,tmp_file_data_tree(I,tmp_line_counter_tree));			
    		end loop;
    		tmp_line_counter_tree := tmp_line_counter_tree+1;
    	end loop;
    	    	
    	file_tree_data_array <= tmp_file_data_tree;
    	
    	write(my_line, string'("Number of lines:"));
    	writeline(output, my_line);
    	write(my_line, tmp_line_counter_tree);
    	writeline(output, my_line);
    	
    	-- reading centres now
    	tmp_line_counter_cntr := 0;
    	tmp_file_line_counter_cntr := 0;
    	tmp_d := 0;
    	loop
    		exit when endfile(my_input_cntr) OR tmp_line_counter_cntr = D*MY_K;
    		readline(my_input_cntr, my_input_line);	
    		read(my_input_line,tmp_file_data_cntr(tmp_d,tmp_file_line_counter_cntr));
--    		if tmp_line_counter_cntr < MY_K then		    		
--    	       read(my_input_line,tmp_file_data_cntr(0,tmp_line_counter_cntr));
--    	    else
--    	       read(my_input_line,tmp_file_data_cntr(1,tmp_line_counter_cntr-MY_K));
--    	    end if;    		
    		tmp_line_counter_cntr := tmp_line_counter_cntr+1;
    		tmp_file_line_counter_cntr := tmp_file_line_counter_cntr+1;
    		if tmp_file_line_counter_cntr = MY_K then
    		  tmp_d := tmp_d +1;
    		  tmp_file_line_counter_cntr := 0;
    		end if;    		
    	end loop;
    	    	
    	file_cntr_data_array <= tmp_file_data_cntr;
    	
    	write(my_line, string'("Number of lines:"));
    	writeline(output, my_line);
    	write(my_line, tmp_line_counter_cntr);
    	writeline(output, my_line);    	
    	
    	read_file_done <= '1';
    	wait; -- one shot at time zero,
    	
    end process read_file;	
		
	
END;
