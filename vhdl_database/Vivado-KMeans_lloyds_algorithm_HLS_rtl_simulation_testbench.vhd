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
 
    constant MY_N : integer := 128;
    constant MY_K : integer := 4;
    constant D : integer := 3;
    
    -- bit width defs
    constant COORD_BITWIDTH : integer := 16;
    constant COORD_BITWIDTH_EXT : integer := 32;
    constant INDEX_BITWIDTH : integer := 8;    
    constant NODE_POINTER_BITWIDTH : integer := 15;
    
    -- input data
    file my_input_node : TEXT open READ_MODE is "../../../simulation/data_points_N128_K4_D3_s0.75.mat";
    file my_input_cntr : TEXT open READ_MODE is "../../../simulation/initial_centres_N128_K4_D3_s0.75_1.mat";
    --file my_input_node : TEXT open READ_MODE is "../../../simulation/data_points_N16384_K128_D3_s0.20.mat";
    --file my_input_cntr : TEXT open READ_MODE is "../../../simulation/initial_centres_N16384_K128_D3_s0.20_1.mat";     

    -- Clock period definitions
    constant CLK_PERIOD : time := 10 ns;        
    
    constant RESET_CYCLES : integer := 20;        
    constant INIT_CYCLES : integer := MY_N;    
 
    type state_type is (readfile, reset, start_processing, processing, processing_done);
    
    type file_node_data_array_type is array(0 to D-1, 0 to MY_N-1) of integer;
    type file_cntr_data_array_type is array(0 to D-1, 0 to MY_K-1) of integer;     
    
    
    subtype coord_type is std_logic_vector(COORD_BITWIDTH-1 downto 0);       
    type data_type is array(0 to D-1) of coord_type;       
    subtype coord_type_ext is std_logic_vector(COORD_BITWIDTH_EXT-1 downto 0);
    type data_type_ext is array(0 to D-1) of coord_type_ext;     
        
        
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
    
    -- Component Declaration for the Unit Under Test (UUT)    
    component lloyds_algorithm_top is
        port (
            ap_clk : IN STD_LOGIC;
            ap_rst : IN STD_LOGIC;
            ap_start : IN STD_LOGIC;
            ap_done : OUT STD_LOGIC;
            ap_idle : OUT STD_LOGIC;
            data_value_V_dout : IN STD_LOGIC_VECTOR (D*COORD_BITWIDTH-1 downto 0);
            data_value_V_empty_n : IN STD_LOGIC;
            data_value_V_read : OUT STD_LOGIC;
            cntr_pos_init_value_V_dout : IN STD_LOGIC_VECTOR (D*COORD_BITWIDTH-1 downto 0);
            cntr_pos_init_value_V_empty_n : IN STD_LOGIC;
            cntr_pos_init_value_V_read : OUT STD_LOGIC;
            n_V : IN STD_LOGIC_VECTOR (NODE_POINTER_BITWIDTH-1 downto 0);
            k_V : IN STD_LOGIC_VECTOR (INDEX_BITWIDTH-1 downto 0);
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
    signal data_value_V_dout : std_logic_vector (D*COORD_BITWIDTH-1 downto 0);
    signal node_type_data_value_V_dout : data_type;        
    signal data_value_V_empty_n : std_logic := '1';         
    signal cntr_pos_init_value_V_dout : std_logic_vector (D*COORD_BITWIDTH-1 downto 0);
    signal data_type_cntr_pos_init_value_V_dout : data_type;
    signal cntr_pos_init_value_V_empty_n : std_logic := '1';
    signal n_V : std_logic_vector (NODE_POINTER_BITWIDTH-1 downto 0);
    signal k_V : std_logic_vector (INDEX_BITWIDTH-1 downto 0);
    signal root_V : std_logic_vector (NODE_POINTER_BITWIDTH-1 downto 0);
    signal distortion_out_V_full_n : std_logic := '1';    
    signal clusters_out_value_V_full_n : std_logic := '1';  
         
   -- Outputs   
   signal ap_done : std_logic;
   signal ap_idle : std_logic;
   signal data_value_V_read : std_logic;   
   signal cntr_pos_init_value_V_read : std_logic;
   signal distortion_out_V_din : std_logic_vector (COORD_BITWIDTH_EXT-1 downto 0);
   signal distortion_out_V_write : std_logic;
   signal clusters_out_value_V_din : std_logic_vector (D*COORD_BITWIDTH-1 downto 0);
   signal data_type_clusters_out_value_V_din : data_type;
   signal clusters_out_value_V_write : std_logic;
      	      	
   -- file io
   signal file_node_data_array : file_node_data_array_type;
   signal file_cntr_data_array : file_cntr_data_array_type;
   signal read_file_done : std_logic := '0';   
    
   -- Operation
    signal state : state_type := readfile;
    signal reset_counter : integer := 0;
    signal init_node_counter : integer := 0;    
    signal init_cntr_counter : integer := 0;
    signal cycle_counter : integer := 0;
    signal reset_counter_done : std_logic := '0';
    signal init_counter_done : std_logic := '0';
    

	
 
BEGIN       
 
    -- PARALLEL_UNITS == 1 always in testbench!!!
    -- Instantiate the Unit Under Test (UUT)
    uut : lloyds_algorithm_top
        port map (
            ap_clk => ap_clk,
            ap_rst => ap_rst,
            ap_start => ap_start,
            ap_done => ap_done,
            ap_idle => ap_idle,
            data_value_V_dout => data_value_V_dout,
            data_value_V_empty_n => data_value_V_empty_n,
            data_value_V_read => data_value_V_read,               
            cntr_pos_init_value_V_dout => cntr_pos_init_value_V_dout,
            cntr_pos_init_value_V_empty_n => cntr_pos_init_value_V_empty_n,
            cntr_pos_init_value_V_read => cntr_pos_init_value_V_read,
            n_V => n_V,
            k_V => k_V,            
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
            
            if data_value_V_read = '1' then
                init_node_counter <= init_node_counter+1;
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
        
 
    n_V <= std_logic_vector(to_unsigned(MY_N-1,NODE_POINTER_BITWIDTH));
    k_V <= std_logic_vector(to_unsigned(MY_K-1,INDEX_BITWIDTH));    
 
    init_proc : process(state, init_node_counter, init_cntr_counter)

        variable centre_pos : data_type;
        variable node : data_type; 
    begin    
        
        -- tree_node_memory
        if init_node_counter < MY_N   then  
            for I in 0 to D-1 loop
                node(I) := std_logic_vector(to_signed(file_node_data_array(I,init_node_counter),COORD_BITWIDTH));                                      
            end loop;  
            data_value_V_dout <= datapoint_2_stdlogic(node);  
            node_type_data_value_V_dout <= node;         
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
    	variable tmp_line_counter_node : integer;
    	variable tmp_file_line_counter_node : integer;
    	variable tmp_line_counter_cntr : integer;
    	variable tmp_file_line_counter_cntr : integer;
    	variable tmp_d : integer;    	
    	variable tmp_file_data_node : file_node_data_array_type;
    	variable tmp_file_data_cntr : file_cntr_data_array_type;
    begin
    	write(my_line, string'("reading input files"));		
    	writeline(output, my_line);	
    	
    	tmp_line_counter_node := 0;
    	tmp_file_line_counter_node := 0;
    	tmp_d := 0;    	
    	loop
    		exit when endfile(my_input_node) OR tmp_line_counter_node = D*MY_N;
    		readline(my_input_node, my_input_line);
    		read(my_input_line,tmp_file_data_node(tmp_d,tmp_file_line_counter_node));
--    		if tmp_line_counter_node < MY_N then		    		
--    	       read(my_input_line,tmp_file_data_node(0,tmp_line_counter_node));
--    	    else
--    	       read(my_input_line,tmp_file_data_node(1,tmp_line_counter_node-MY_N));
--    	    end if;     	     			
    		tmp_line_counter_node := tmp_line_counter_node+1;
    		tmp_file_line_counter_node := tmp_file_line_counter_node+1;
    		if tmp_file_line_counter_node = MY_N then
    		  tmp_d := tmp_d +1;
    		  tmp_file_line_counter_node := 0;
    		end if;    		
    	end loop;
    	    	
    	file_node_data_array <= tmp_file_data_node;
    	
    	write(my_line, string'("Number of lines:"));
    	writeline(output, my_line);
    	write(my_line, tmp_line_counter_node);
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
