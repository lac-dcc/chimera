----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: dot_product - Behavioral
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

entity dot_product is
    generic (
        SCALE_MUL_RESULT : integer := 0
    );
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        point_1 : in data_type_ext;
        point_2 : in data_type_ext;
        result : out coord_type_ext;
        rdy : out std_logic
    );
end dot_product;

architecture Behavioral of dot_product is

    constant LAYERS_TREE_ADDER : integer := integer(ceil(log2(real(D))));
    
    type mul_res_array_type is array(0 to D-1) of std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1-1 downto 0);
    
    --type tree_adder_res_array_type is array(0 to LAYERS_TREE_ADDER-1, 0 to D/2-1) of std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0);
    
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
            USE_DSP_FOR_ADD : boolean := true;
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
        
    signal tmp_mul_res : mul_res_array_type;
    signal tmp_tree_adder_input_string : std_logic_vector(D*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)-1 downto 0);
    
    --signal tmp_tree_adder_res : tree_adder_res_array_type;
    signal tmp_tree_adder_res : std_logic_vector(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0);
    
    signal const_0 : std_logic_vector(MUL_BITWIDTH-1 downto 0);
    
    signal tmp_mul_rdy : std_logic;
    
    signal delay_line_tree_adder : std_logic_vector(0 to 2*LAYERS_TREE_ADDER-1);
    signal tmp_final_res : coord_type_ext;

begin

    const_0 <= (others => '0');
    
    G1: for I in 0 to D-1 generate
    
        G_FIRST: if I = 0 generate
                
            madd_inst : madd
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
                    nd => nd,
                    a => saturate(point_1(I)),
                    b => saturate(point_2(I)),
                    c => const_0,
                    res => tmp_mul_res(I),
                    rdy => tmp_mul_rdy
                );
        end generate G_FIRST;
        
        G_OTHER: if I > 0 generate           
                
            madd_inst : madd
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
                    nd => nd,
                    a => saturate(point_1(I)),
                    b => saturate(point_2(I)),
                    c => const_0,
                    res => tmp_mul_res(I),
                    rdy => open
                );
        end generate G_OTHER;
    
    end generate G1; 
    
--    -- FIXME: this will not work if D is not power of 2
--    G2: for I in 0 to LAYERS_TREE_ADDER-1 generate
--        
--        G_TOP_LAYER: if I = 0 generate 
--            G2_2: for J in 0 to (D/(2**(I+1)))-1 generate
--                             
--                addorsub_inst_2 : addorsub
--                    generic map (
--                        A_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1,
--                        B_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1,        
--                        RES_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER
--                    )
--                    port map (
--                        clk => clk,
--                        sclr => sclr,
--                        nd => '1',
--                        sub => '0',
--                        a => tmp_mul_res(2*J),
--                        b => tmp_mul_res(2*J+1),
--                        res => tmp_tree_adder_res(I,J),
--                        rdy => open
--                    );
--            end generate G2_2;
--            
--        end generate G_TOP_LAYER;
--        
--        G_OTHER_LAYER: if I > 0 generate 
--            G2_2: for J in 0 to (D/(2**(I+1)))-1 generate                        
--                addorsub_inst_2 : addorsub
--                    generic map (
--                        A_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER,
--                        B_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER,        
--                        RES_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER
--                    )
--                    port map (
--                        clk => clk,
--                        sclr => sclr,
--                        nd => '1',
--                        sub => '0',
--                        a => tmp_tree_adder_res(I-1,2*J),
--                        b => tmp_tree_adder_res(I-1,2*J+1),
--                        res => tmp_tree_adder_res(I,J),
--                        rdy => open
--                    );
--            end generate G2_2;
--        end generate G_OTHER_LAYER;
--        
--    end generate G2;
--      
--    -- compensate for latency
--    delay_line_proc : process(clk)
--    begin
--    if rising_edge(clk) then
--        if sclr = '1' then
--            delay_line_tree_adder <= (others => '0');
--        else
--            delay_line_tree_adder(0) <= tmp_mul_rdy;
--            delay_line_tree_adder(1 to 2*LAYERS_TREE_ADDER-1) <= delay_line_tree_adder(0 to 2*LAYERS_TREE_ADDER-2);
--        end if;
--    end if;
--    end process delay_line_proc;
--    

    G2 : for I in 0 to D-1 generate
        tmp_tree_adder_input_string((I+1)*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)-1 downto I*(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1)) <= tmp_mul_res(I);
    end generate G2;
    
    adder_tree_inst : adder_tree 
        generic map (
            USE_DSP_FOR_ADD => USE_DSP_FOR_ADD,
            NUMBER_OF_INPUTS => D,
            INPUT_BITWIDTH => 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1
        )
        port map (
            clk => clk,
            sclr => sclr, 
            nd => tmp_mul_rdy,
            sub => '0',
            input_string => tmp_tree_adder_input_string,
            rdy => rdy,
            output => tmp_tree_adder_res    
        );    
    
    G3: if COORD_BITWIDTH_EXT <= 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER generate 
        --tmp_final_res <= tmp_tree_adder_res(LAYERS_TREE_ADDER-1,0)(COORD_BITWIDTH_EXT-1 downto 0);
        tmp_final_res <= tmp_tree_adder_res(COORD_BITWIDTH_EXT-1 downto 0);
    end generate G3;
    
    G4: if COORD_BITWIDTH_EXT > 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER generate 
        --tmp_final_res(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0) <= tmp_tree_adder_res(LAYERS_TREE_ADDER-1,0)(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0);
        --tmp_final_res(COORD_BITWIDTH_EXT-1 downto 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER) <= (others => tmp_tree_adder_res(LAYERS_TREE_ADDER-1,0)(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1));
        tmp_final_res(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0) <= tmp_tree_adder_res(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1 downto 0);
        tmp_final_res(COORD_BITWIDTH_EXT-1 downto 2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER) <= (others => tmp_tree_adder_res(2*MUL_BITWIDTH-SCALE_MUL_RESULT+1+LAYERS_TREE_ADDER-1));
    end generate G4;
    
    
    --rdy <= delay_line_tree_adder(2*LAYERS_TREE_ADDER-1);                
    result <= tmp_final_res;    


end Behavioral;
