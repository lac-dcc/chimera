----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: centre_positions_memory_top - Behavioral
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

entity centre_positions_memory_top is
    port (
        clk : in std_logic;
        wea : in std_logic_vector(0 to PARALLEL_UNITS-1);
        addra : in par_centre_index_type;
        dina : in par_data_type;
        addrb : in par_centre_index_type;
        doutb : out par_data_type    
    );
end centre_positions_memory_top;

architecture Behavioral of centre_positions_memory_top is

    type p_addr_type is array(0 to PARALLEL_UNITS-1) of std_logic_vector(INDEX_BITWIDTH-1 downto 0);
    type p_data_type is array(0 to PARALLEL_UNITS-1) of std_logic_vector(D*COORD_BITWIDTH-1 downto 0);

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
    
    signal p_addra : p_addr_type;
    signal p_addrb : p_addr_type;
    signal p_dina  : p_data_type;
    signal p_doutb : p_data_type;

begin

    -- fixme: this memory parallelism could also be achieved by memory segmentation which would be muhch better... to be done

    G_PAR_0: for I in 0 to PARALLEL_UNITS-1 generate
    
        p_addra(I) <= std_logic_vector(addra(I));
        p_addrb(I) <= std_logic_vector(addrb(I));
        p_dina(I) <= datapoint_2_stdlogic(dina(I));
    
        centre_positions_memory_inst : centre_positions_memory
            port map(
                clka => clk,
                wea(0) => wea(I),
                addra => p_addra(I),
                dina => p_dina(I),
                clkb => clk,
                addrb => p_addrb(I),
                doutb => p_doutb(I)
            );
            
         doutb(I) <= stdlogic_2_datapoint(p_doutb(I));
            
    end generate G_PAR_0;


end Behavioral;
