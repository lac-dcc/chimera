----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: node_memory_top - Behavioral
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

entity node_memory_top is
    port (
        clka : in std_logic;
        wea : in std_logic_vector(0 downto 0);
        addra : in std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
        dina : in std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
        clkb : in std_logic;
        addrb : in std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
        doutb : out std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0)    
    );
end node_memory_top;

architecture Behavioral of node_memory_top is

    constant MEM_LAT : integer := 2;
    constant ADDR_BITWIDTH : integer := NODE_POINTER_BITWIDTH-1;
    
    type addr_delay_type is array(0 to MEM_LAT-1) of std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);

    component leaf_node_memory
        port (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(ADDR_BITWIDTH-1 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(D*COORD_BITWIDTH_EXT+COORD_BITWIDTH_EXT-1 downto 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(ADDR_BITWIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(D*COORD_BITWIDTH_EXT+COORD_BITWIDTH_EXT-1 downto 0)
        );
    end component;
    
    component int_node_memory
        port (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(ADDR_BITWIDTH-1 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(ADDR_BITWIDTH-1 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 DOWNTO 0)
        );
    end component;    
    
    
    signal tmp_addra : std_logic_vector(ADDR_BITWIDTH-1 downto 0);
    signal tmp_addrb : std_logic_vector(ADDR_BITWIDTH-1 downto 0);
    
    signal din_leaf_mem : std_logic_vector(D*COORD_BITWIDTH_EXT+COORD_BITWIDTH_EXT-1 downto 0);
    signal dout_leaf_mem : std_logic_vector(D*COORD_BITWIDTH_EXT+COORD_BITWIDTH_EXT-1 downto 0);
    signal dout_leaf_mem_ext : std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    signal din_int_mem : std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    signal dout_int_mem : std_logic_vector(3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH-1 downto 0);
    
    signal wea_leaf_mem : std_logic;
    signal wea_int_mem : std_logic;
    
    signal addr_delay_line : addr_delay_type;

begin

    wea_leaf_mem <= wea(0) AND addra(NODE_POINTER_BITWIDTH-1);
    wea_int_mem  <= wea(0) AND NOT(addra(NODE_POINTER_BITWIDTH-1));
    
    tmp_addra <= addra(ADDR_BITWIDTH-1 downto 0);
    tmp_addrb <= addrb(ADDR_BITWIDTH-1 downto 0);
    
    
    -- this must be in sync with function nodedata_2_stdlogic!!
    G0 : for I in 0 to D-1 generate
        din_leaf_mem((I+1)*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH_EXT) <= dina((I+1)*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto I*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
    end generate G0;
    din_leaf_mem(D*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH_EXT-1 downto D*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH_EXT) <= dina(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH);
    
    din_int_mem <= dina;
    
    
    leaf_node_memory_inst : leaf_node_memory
        port map(
            clka => clka,
            wea(0) => wea_leaf_mem,
            addra => tmp_addra,
            dina => din_leaf_mem,
            clkb => clkb,
            addrb => tmp_addrb,
            doutb => dout_leaf_mem
        );
     
        
        
    int_node_memory_inst : int_node_memory
        port map(
            clka => clka,
            wea(0) => wea_int_mem,
            addra => tmp_addra,
            dina => din_int_mem,
            clkb => clkb,
            addrb => tmp_addrb,
            doutb => dout_int_mem
        );
        
    
    addr_delay_line_proc : process(clkb) 
    begin
        if rising_edge(clkb) then
            addr_delay_line(0) <= addrb;
            addr_delay_line(1 to MEM_LAT-1) <= addr_delay_line(0 to MEM_LAT-2);
        end if;
    end process addr_delay_line_proc;
    
    
    -- this must be in sync with function nodedata_2_stdlogic!!
    G1 : for I in 0 to D-1 generate
        dout_leaf_mem_ext((I+1)*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto I*COORD_BITWIDTH_EXT+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) <= dout_leaf_mem((I+1)*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH_EXT);
        dout_leaf_mem_ext(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+0*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) <= (others => '0');
        dout_leaf_mem_ext(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+1*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+1*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) <= (others => '0');
        dout_leaf_mem_ext(1*D*COORD_BITWIDTH_EXT+(I+1)*COORD_BITWIDTH+2*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+I*COORD_BITWIDTH+2*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) <= (others => '0');
    end generate G1;    
    dout_leaf_mem_ext(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+0*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) <= dout_leaf_mem(D*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH_EXT-1 downto D*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH_EXT);
    dout_leaf_mem_ext(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+0*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) <= std_logic_vector(to_unsigned(1,COORD_BITWIDTH));
    dout_leaf_mem_ext(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+1*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+0*NODE_POINTER_BITWIDTH) <= (others => '0');
    dout_leaf_mem_ext(1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+2*NODE_POINTER_BITWIDTH-1 downto 1*D*COORD_BITWIDTH_EXT+3*D*COORD_BITWIDTH+1*COORD_BITWIDTH_EXT+1*COORD_BITWIDTH+1*NODE_POINTER_BITWIDTH) <= (others => '0');
    
        
    -- output mux    
    doutb <= dout_leaf_mem_ext WHEN addr_delay_line(MEM_LAT-1)(NODE_POINTER_BITWIDTH-1) = '1' ELSE dout_int_mem;

end Behavioral;
