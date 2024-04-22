----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: madd - Behavioral
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
use ieee.math_real.all;
use work.filtering_algorithm_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pruning_test is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        cand : in data_type;
        closest_cand : in data_type;
        bnd_lo : in data_type;
        bnd_hi : in data_type;
        result : out std_logic;
        rdy : out std_logic        
    );
end pruning_test;

architecture Behavioral of pruning_test is

    constant SUB_LATENCY : integer := 2;
    constant LAYERS_TREE_ADDER : integer := integer(ceil(log2(real(D))));
    constant SCALE_MUL_RESULT : integer := MUL_FRACTIONAL_BITS;
    
    -- latency of the entire unit    
    constant LATENCY : integer := 2*SUB_LATENCY+MUL_CORE_LATENCY+SUB_LATENCY*LAYERS_TREE_ADDER;         

    type sub_res_array_type is array(0 to D-1) of std_logic_vector(COORD_BITWIDTH+1-1 downto 0);
    
    type sub_res_array_delay_type is array(0 to SUB_LATENCY-1) of sub_res_array_type;
    
    type mul_res_array_type is array(0 to D-1) of std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1-1 downto 0);
    --type tree_adder_res_array_type is array(0 to LAYERS_TREE_ADDER-1, 0 to D/2-1) of std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0);
    
    type data_delay_type is array(0 to SUB_LATENCY-1) of data_type;
    
    component addorsub
        generic (
            USE_DSP : boolean := true;
            A_BITWIDTH : integer := 16;
            B_BITWIDTH : integer := 16;        
            RES_BITWIDTH : integer := 16
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            sub : in std_logic;
            a : in std_logic_vector(A_BITWIDTH-1 downto 0);
            b : in std_logic_vector(B_BITWIDTH-1 downto 0);
            res : out std_logic_vector(RES_BITWIDTH-1 downto 0);
            rdy : out std_logic
        );
    end component; 
    
    component madd
        generic (
            MUL_LATENCY : integer := 3;
            A_BITWIDTH : integer := 16;
            B_BITWIDTH : integer := 16;
            INCLUDE_ADD : boolean := false;
            C_BITWIDTH : integer := 16;
            RES_BITWIDTH : integer := 16
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            a : in std_logic_vector(A_BITWIDTH-1 downto 0);
            b : in std_logic_vector(B_BITWIDTH-1 downto 0);
            c : in std_logic_vector(C_BITWIDTH-1 downto 0);
            res : out std_logic_vector(RES_BITWIDTH-1 downto 0);
            rdy : out std_logic
        );
    end component;
    
    component adder_tree 
        generic (
            NUMBER_OF_INPUTS : integer := 4;
            INPUT_BITWIDTH : integer := 16
        );
        port (
            clk : in std_logic;
            sclr : in std_logic;
            nd : in std_logic;
            sub :  in std_logic;
            input_string : in std_logic_vector(NUMBER_OF_INPUTS*INPUT_BITWIDTH-1 downto 0);
            rdy : out std_logic;
            output : out std_logic_vector(INPUT_BITWIDTH+integer(ceil(log2(real(NUMBER_OF_INPUTS))))-1 downto 0)    
        );
    end component;    
    
    signal tmp_diff_1 : sub_res_array_type;
    signal tmp_diff_1_rdy : std_logic;
            
    signal tmp_input_2 : data_type;
    signal tmp_diff_2 : sub_res_array_type;
    signal tmp_diff_2_rdy : std_logic;
    
    signal diff_1_delay_line : sub_res_array_delay_type;
    signal tmp_diff_1_1 : sub_res_array_type;
    
    signal tmp_mul_1 : mul_res_array_type;
    signal tmp_mul_1_rdy : std_logic;
    signal tmp_mul_2 : mul_res_array_type;
    signal tmp_mul_2_rdy : std_logic; 
    
    
    signal const_0 : std_logic_vector(MUL_BITWIDTH-1 downto 0);
    
    --signal tmp_tree_adder_res_1 : tree_adder_res_array_type;
    signal tmp_tree_adder_1_input_string : std_logic_vector(D*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)-1 downto 0);
    signal tmp_tree_adder_res_1_clean : std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0);
    signal tmp_tree_adder_res_1_ext : std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER+1-1 downto 0);
    signal tmp_tree_adder_1_rdy : std_logic;
    
    --signal tmp_tree_adder_res_2 : tree_adder_res_array_type;
    signal tmp_tree_adder_2_input_string : std_logic_vector(D*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)-1 downto 0);
    signal tmp_tree_adder_res_2_clean : std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0);
    signal tmp_tree_adder_res_2_ext : std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER+1-1 downto 0);
    
    --signal delay_line_tree_adder : std_logic_vector(0 to SUB_LATENCY*LAYERS_TREE_ADDER-1);
    signal bndbox_delay_lo : data_delay_type;
    signal bndbox_delay_hi : data_delay_type;
    signal closest_cand_delay : data_delay_type;
    
    signal tmp_final_result : std_logic;

begin
        
     G1: for I in 0 to D-1 generate     
         G_FIRST: if I = 0 generate         
             addorsub_inst : addorsub
                 generic map (
                     USE_DSP => USE_DSP_FOR_ADD,
                     A_BITWIDTH => COORD_BITWIDTH,
                     B_BITWIDTH => COORD_BITWIDTH,        
                     RES_BITWIDTH => COORD_BITWIDTH+1
                 )
                 port map (
                     clk => clk,
                     sclr => sclr,
                     nd => nd,
                     sub => '1',
                     a => cand(I),
                     b => closest_cand(I),
                     res => tmp_diff_1(I), -- ccComp
                     rdy => tmp_diff_1_rdy
                 );                              
         end generate G_FIRST;
         
         G_OTHER: if I > 0 generate
             addorsub_inst : addorsub
                 generic map (
                     USE_DSP => USE_DSP_FOR_ADD,
                     A_BITWIDTH => COORD_BITWIDTH,
                     B_BITWIDTH => COORD_BITWIDTH,        
                     RES_BITWIDTH => COORD_BITWIDTH+1
                 )
                 port map (
                     clk => clk,
                     sclr => sclr,
                     nd => nd,
                     sub => '1',
                     a => cand(I),
                     b => closest_cand(I),
                     res => tmp_diff_1(I), --ccComp
                     rdy => open
                 );                             
         end generate G_OTHER;     
     end generate G1;  
        
     
     -- delay bndbox
     bndbox_delay_proc : process(clk)
     begin
        if rising_edge(clk) then
            bndbox_delay_lo(0) <= bnd_lo;
            bndbox_delay_lo(1 to SUB_LATENCY-1) <= bndbox_delay_lo(0 to SUB_LATENCY-2);
            bndbox_delay_hi(0) <= bnd_hi;
            bndbox_delay_hi(1 to SUB_LATENCY-1) <= bndbox_delay_hi(0 to SUB_LATENCY-2);
            closest_cand_delay(0) <= closest_cand;
            closest_cand_delay(1 to SUB_LATENCY-1) <= closest_cand_delay(0 to SUB_LATENCY-2);            
        end if;
     end process bndbox_delay_proc;    

     G2: for I in 0 to D-1 generate          
     
          tmp_input_2(I) <= bndbox_delay_hi(SUB_LATENCY-1)(I) WHEN signed(tmp_diff_1(I)) > 0 ELSE bndbox_delay_lo(SUB_LATENCY-1)(I);
          
          G_FIRST: if I = 0 generate         
              addorsub_inst : addorsub
                  generic map (
                      USE_DSP => USE_DSP_FOR_ADD,
                      A_BITWIDTH => COORD_BITWIDTH,
                      B_BITWIDTH => COORD_BITWIDTH,        
                      RES_BITWIDTH => COORD_BITWIDTH+1
                  )
                  port map (
                      clk => clk,
                      sclr => sclr,
                      nd => tmp_diff_1_rdy,
                      sub => '1',
                      a => tmp_input_2(I),
                      b => closest_cand_delay(SUB_LATENCY-1)(I),
                      res => tmp_diff_2(I),
                      rdy => tmp_diff_2_rdy
                  );                              
          end generate G_FIRST;
          
          G_OTHER: if I > 0 generate
              addorsub_inst : addorsub
                  generic map (
                      USE_DSP => USE_DSP_FOR_ADD,
                      A_BITWIDTH => COORD_BITWIDTH,
                      B_BITWIDTH => COORD_BITWIDTH,        
                      RES_BITWIDTH => COORD_BITWIDTH+1
                  )
                  port map (
                      clk => clk,
                      sclr => sclr,
                      nd => tmp_diff_1_rdy,
                      sub => '1',
                      a => tmp_input_2(I),
                      b => closest_cand_delay(SUB_LATENCY-1)(I),
                      res => tmp_diff_2(I),
                      rdy => open
                  );                             
          end generate G_OTHER;     
      end generate G2; 
      
      -- delay tmp_diff_1
     diff_1_delay_line_proc : process(clk)
     begin
        if rising_edge(clk) then
            diff_1_delay_line(0) <= tmp_diff_1;
            diff_1_delay_line(1 to SUB_LATENCY-1) <= diff_1_delay_line(0 to SUB_LATENCY-2);
        end if;
     end process diff_1_delay_line_proc;
      
      tmp_diff_1_1 <= diff_1_delay_line(SUB_LATENCY-1);
      
      const_0 <= (others => '0');
      
      G3: for I in 0 to D-1 generate      
          G_FIRST: if I = 0 generate                  
              madd_inst_1 : madd
                  generic map(
                      MUL_LATENCY => MUL_CORE_LATENCY,
                      A_BITWIDTH => MUL_BITWIDTH,
                      B_BITWIDTH => MUL_BITWIDTH,  
                      INCLUDE_ADD => false,                    
                      C_BITWIDTH => MUL_BITWIDTH,
                      RES_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1
                  )
                  port map (
                      clk => clk,
                      sclr => sclr,
                      nd => tmp_diff_2_rdy,
                      a => saturate(tmp_diff_1_1(I)),
                      b => saturate(tmp_diff_1_1(I)),
                      c => const_0,
                      res => tmp_mul_1(I),
                      rdy => tmp_mul_1_rdy
                  );
              madd_inst_2 : madd
                  generic map(
                      MUL_LATENCY => MUL_CORE_LATENCY,
                      A_BITWIDTH => MUL_BITWIDTH,
                      B_BITWIDTH => MUL_BITWIDTH,
                      INCLUDE_ADD => false,
                      C_BITWIDTH => MUL_BITWIDTH,
                      RES_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1
                  )
                  port map (
                      clk => clk,
                      sclr => sclr,
                      nd => tmp_diff_2_rdy,
                      a => saturate(tmp_diff_2(I)),
                      b => saturate(tmp_diff_1_1(I)),
                      c => const_0,
                      res => tmp_mul_2(I),
                      rdy => tmp_mul_2_rdy
                  );
                  
          end generate G_FIRST;
          
          G_OTHER: if I > 0 generate                             
              madd_inst_1 : madd
                  generic map(
                      MUL_LATENCY => MUL_CORE_LATENCY,
                      A_BITWIDTH => MUL_BITWIDTH,
                      B_BITWIDTH => MUL_BITWIDTH,
                      INCLUDE_ADD => false,
                      C_BITWIDTH => MUL_BITWIDTH,
                      RES_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1
                  )
                  port map (
                      clk => clk,
                      sclr => sclr,
                      nd => tmp_diff_2_rdy,
                      a => saturate(tmp_diff_1_1(I)),
                      b => saturate(tmp_diff_1_1(I)),
                      c => const_0,
                      res => tmp_mul_1(I),
                      rdy => open
                  );
              madd_inst_2 : madd
                  generic map(
                      MUL_LATENCY => MUL_CORE_LATENCY,
                      A_BITWIDTH => MUL_BITWIDTH,
                      B_BITWIDTH => MUL_BITWIDTH,
                      INCLUDE_ADD => false,
                      C_BITWIDTH => MUL_BITWIDTH,
                      RES_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1
                  )
                  port map (
                      clk => clk,
                      sclr => sclr,
                      nd => tmp_diff_2_rdy,
                      a => saturate(tmp_diff_2(I)),
                      b => saturate(tmp_diff_1_1(I)),
                      c => const_0,
                      res => tmp_mul_2(I),
                      rdy => open
                  );
          end generate G_OTHER;      
      end generate G3; 
      
      -- adder trees
      G4 : for I in 0 to D-1 generate
          tmp_tree_adder_1_input_string((I+1)*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)-1 downto I*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)) <= tmp_mul_1(I);
          tmp_tree_adder_2_input_string((I+1)*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)-1 downto I*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)) <= tmp_mul_2(I);
      end generate G4;      
      
      adder_tree_inst_1 : adder_tree 
          generic map (
              NUMBER_OF_INPUTS => D,
              INPUT_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1
          )
          port map(
              clk => clk,
              sclr => sclr,
              nd => tmp_mul_1_rdy,
              sub => '0',
              input_string => tmp_tree_adder_1_input_string,
              rdy => tmp_tree_adder_1_rdy,
              output => tmp_tree_adder_res_1_clean    
          );  
          
      adder_tree_inst_2 : adder_tree 
          generic map (
              NUMBER_OF_INPUTS => D,
              INPUT_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1
          )
          port map(
              clk => clk,
              sclr => sclr,
              nd => tmp_mul_1_rdy,
              sub => '0',
              input_string => tmp_tree_adder_2_input_string,
              rdy => open,
              output => tmp_tree_adder_res_2_clean    
          );               
      
      
      -- 1*tmp_tree_adder_res_1_clean (always positive)
      tmp_tree_adder_res_1_ext <= '0' & tmp_tree_adder_res_1_clean;
      
      -- 2*tmp_tree_adder_res_2_clean
      tmp_tree_adder_res_2_ext <= tmp_tree_adder_res_2_clean & '0';
      
      --tmp_final_result <= '1';-- WHEN signed(tmp_tree_adder_res_1_ext) > signed(tmp_tree_adder_res_2_ext) ELSE '0'; 
            
      --rdy <= delay_line_tree_adder(SUB_LATENCY*LAYERS_TREE_ADDER-1);
      rdy <= tmp_tree_adder_1_rdy;                  
      result <= '1' WHEN signed(tmp_tree_adder_res_1_ext) > signed(tmp_tree_adder_res_2_ext) ELSE '0';

end Behavioral;
