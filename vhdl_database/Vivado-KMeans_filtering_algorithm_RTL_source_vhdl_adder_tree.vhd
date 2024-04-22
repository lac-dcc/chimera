----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: adder_tree - Behavioral
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_tree is
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
end adder_tree;

architecture Behavioral of adder_tree is

    constant LAYERS_TREE_ADDER : integer := integer(ceil(log2(real(NUMBER_OF_INPUTS))));
    constant INT_BITWIDTH : integer := INPUT_BITWIDTH+LAYERS_TREE_ADDER;
    
    constant SINGLE_ADDER_LAT : integer := 2;
    constant TREE_ADDER_LAT : integer := SINGLE_ADDER_LAT*LAYERS_TREE_ADDER;

    type input_array_type is array(0 to NUMBER_OF_INPUTS-1) of std_logic_vector(INPUT_BITWIDTH-1 downto 0);
    type tree_adder_res_array_type is array(0 to LAYERS_TREE_ADDER-1, 0 to integer(ceil(real(NUMBER_OF_INPUTS)/real(2)))-1) of std_logic_vector(INT_BITWIDTH-1 downto 0);
        
    type data_delay_type is array(0 to SINGLE_ADDER_LAT-1) of std_logic_vector(INT_BITWIDTH-1 downto 0);
    type data_delay_array_type is array(0 to LAYERS_TREE_ADDER-1-1) of data_delay_type;


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
    
    signal input_array : input_array_type;
    signal data_delay_array : data_delay_array_type;
    signal ctrl_delay_line : std_logic_vector(0 to TREE_ADDER_LAT-1);
    
    signal tmp_tree_adder_res : tree_adder_res_array_type;

begin

    G0: for I in 0 to NUMBER_OF_INPUTS-1 generate 
        input_array(I) <= input_string((I+1)*INPUT_BITWIDTH-1 downto I*INPUT_BITWIDTH);
    end generate G0;
    
    G2: for I in 0 to LAYERS_TREE_ADDER-1 generate
        
        G_TOP_LAYER: if I = 0 generate 
            G2_2: for J in 0 to (NUMBER_OF_INPUTS/(2**(I+1)))-1 generate                             
                addorsub_inst_2 : addorsub
                    generic map (
                        USE_DSP => USE_DSP_FOR_ADD,
                        A_BITWIDTH => INPUT_BITWIDTH,
                        B_BITWIDTH => INPUT_BITWIDTH,        
                        RES_BITWIDTH => INT_BITWIDTH
                    )
                    port map (
                        clk => clk,
                        sclr => sclr,
                        nd => '1',
                        sub => sub,
                        a => input_array(2*J),
                        b => input_array(2*J+1),
                        res => tmp_tree_adder_res(I,J),
                        rdy => open
                    );
            end generate G2_2;    
            
            G2_3: if NUMBER_OF_INPUTS/(2**(I+1)) < integer(ceil(real(NUMBER_OF_INPUTS)/real(2**(I+1)))) generate                             
                data_delay_array_proc : process(clk)
                begin
                    if rising_edge(clk) then
                        data_delay_array(I)(0)(INPUT_BITWIDTH-1 downto 0) <= input_array(NUMBER_OF_INPUTS/(2**(I+1))*2);
                        data_delay_array(I)(0)(INT_BITWIDTH-1 downto INPUT_BITWIDTH) <= (others => input_array(NUMBER_OF_INPUTS/(2**(I+1))*2)(INPUT_BITWIDTH-1));
                        data_delay_array(I)(1 to SINGLE_ADDER_LAT-1) <= data_delay_array(I)(0 to SINGLE_ADDER_LAT-2); 
                    end if;
                end process data_delay_array_proc; 
                tmp_tree_adder_res(I,NUMBER_OF_INPUTS/(2**(I+1))) <= data_delay_array(I)(SINGLE_ADDER_LAT-1);               
            end generate G2_3;                    
        end generate G_TOP_LAYER;
        
        G_OTHER_LAYER: if I > 0 AND I < LAYERS_TREE_ADDER-1 generate 
            G2_2: for J in 0 to ((NUMBER_OF_INPUTS+NUMBER_OF_INPUTS-(NUMBER_OF_INPUTS/(2**I))*(2**I))/(2**(I+1)))-1 generate                        
                addorsub_inst_2 : addorsub
                    generic map (
                        USE_DSP => USE_DSP_FOR_ADD,
                        A_BITWIDTH => INT_BITWIDTH,
                        B_BITWIDTH => INT_BITWIDTH,        
                        RES_BITWIDTH => INT_BITWIDTH
                    )
                    port map (
                        clk => clk,
                        sclr => sclr,
                        nd => '1',
                        sub => sub,
                        a => tmp_tree_adder_res(I-1,2*J),
                        b => tmp_tree_adder_res(I-1,2*J+1),
                        res => tmp_tree_adder_res(I,J),
                        rdy => open
                    );
            end generate G2_2;
            
            G2_3: if ((NUMBER_OF_INPUTS+NUMBER_OF_INPUTS-(NUMBER_OF_INPUTS/(2**I))*(2**I))/(2**(I+1))) < integer(ceil(real(NUMBER_OF_INPUTS)/real(2**(I+1)))) generate                             
                  data_delay_array_proc : process(clk)
                  begin
                      if rising_edge(clk) then
                          data_delay_array(I)(0) <= tmp_tree_adder_res(I-1,NUMBER_OF_INPUTS/(2**(I+1))*2);                          
                          data_delay_array(I)(1 to SINGLE_ADDER_LAT-1) <= data_delay_array(I)(0 to SINGLE_ADDER_LAT-2); 
                      end if;
                  end process data_delay_array_proc; 
                  tmp_tree_adder_res(I,NUMBER_OF_INPUTS/(2**(I+1))) <= data_delay_array(I)(SINGLE_ADDER_LAT-1);               
            end generate G2_3;            
        end generate G_OTHER_LAYER;
        
        G_BOTTOM_LAYER: if I = LAYERS_TREE_ADDER-1 AND LAYERS_TREE_ADDER > 1 generate 
            G2_2: for J in 0 to 0 generate                        
                addorsub_inst_2 : addorsub
                    generic map (
                        USE_DSP => USE_DSP_FOR_ADD,
                        A_BITWIDTH => INT_BITWIDTH,
                        B_BITWIDTH => INT_BITWIDTH,        
                        RES_BITWIDTH => INT_BITWIDTH
                    )
                    port map (
                        clk => clk,
                        sclr => sclr,
                        nd => '1',
                        sub => sub,
                        a => tmp_tree_adder_res(I-1,2*J),
                        b => tmp_tree_adder_res(I-1,2*J+1),
                        res => tmp_tree_adder_res(I,J),
                        rdy => open
                    );
            end generate G2_2;                        
        end generate G_BOTTOM_LAYER;        
        
    end generate G2;


    ctrl_delay_line_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                ctrl_delay_line <= (others => '0');
            else
                ctrl_delay_line(0) <= nd;
                ctrl_delay_line(1 to TREE_ADDER_LAT-1) <= ctrl_delay_line(0 to TREE_ADDER_LAT-2);
            end if;
        end if;
    end process ctrl_delay_line_proc;
    
    rdy <= ctrl_delay_line(TREE_ADDER_LAT-1);    
    output <= tmp_tree_adder_res(LAYERS_TREE_ADDER-1,0);

end Behavioral;
