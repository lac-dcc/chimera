----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: filtering_algorithm_pkg - Package
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;
use ieee.math_real.all;



-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


     
package filtering_algorithm_pkg is

    constant N_MAX : integer := 32768;
    constant D : integer := 3;
    constant L_MAX  : integer := 6;
    constant K_MAX : integer := 256;
    constant N_MAX_TREE_NODES : integer := 2*N_MAX;
    constant STACK_SIZE : integer := 32768;
    constant HEAP_SIZE : integer := 256;
     
    constant COORD_BITWIDTH : integer := 16;
    constant COORD_BITWIDTH_EXT : integer := 32;
    constant INDEX_BITWIDTH : integer := integer(ceil(log2(real(K_MAX))));  
    constant NODE_POINTER_BITWIDTH : integer := integer(ceil(log2(real(N_MAX_TREE_NODES))));
    constant CNTR_POINTER_BITWIDTH : integer := integer(ceil(log2(real(HEAP_SIZE))));
    
    constant MUL_FRACTIONAL_BITS : integer := 6;
    constant MUL_INTEGER_BITS : integer := 12;
    constant MUL_BITWIDTH : integer := MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS;
    constant MUL_CORE_LATENCY : integer := 3; 
    
    constant DYN_ALLOC : boolean := true;
    constant SYNTHESIS : boolean := false;
    constant VIRTEX7 : boolean := true;
    
    constant USE_DSP_FOR_ADD : boolean := false; 
    
    constant PARALLEL_UNITS : integer := 1;
    
    subtype coord_type is std_logic_vector(COORD_BITWIDTH-1 downto 0);
    subtype centre_index_type is unsigned(INDEX_BITWIDTH-1 downto 0);
    subtype node_address_type is std_logic_vector(NODE_POINTER_BITWIDTH-1 downto 0);
    subtype centre_list_address_type is std_logic_vector(CNTR_POINTER_BITWIDTH-1 downto 0);
    
    
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
    -- size of node_data_type : 3*D*COORD_BITWIDTH+D*COORD_BITWIDTH_EXT+COORD_BITWIDTH+COORD_BITWIDTH_EXT+2*NODE_POINTER_BITWIDTH
    
    
    -- array types for parallelism
    type par_centre_index_type is array(0 to PARALLEL_UNITS-1) of centre_index_type;
    type par_centre_list_address_type is array(0 to PARALLEL_UNITS-1) of centre_list_address_type;    
    type par_coord_type is array(0 to PARALLEL_UNITS-1) of coord_type;
    type par_coord_type_ext is array(0 to PARALLEL_UNITS-1) of coord_type_ext;
    type par_data_type is array(0 to PARALLEL_UNITS-1) of data_type;
    type par_data_type_ext is array(0 to PARALLEL_UNITS-1) of data_type_ext;
    type par_node_address_type is array(0 to PARALLEL_UNITS-1) of node_address_type;
    type par_node_data_type is array(0 to PARALLEL_UNITS-1) of node_data_type; 
    type par_element_type_ext is array(0 to D-1) of std_logic_vector(PARALLEL_UNITS*COORD_BITWIDTH_EXT-1 downto 0);
    type par_element_type_ext_sum is array(0 to D-1) of std_logic_vector(COORD_BITWIDTH_EXT+integer(ceil(log2(real(PARALLEL_UNITS))))-1 downto 0);
    
    
    -- helper functions
    function stdlogic_2_datapoint(c : std_logic_vector) return data_type;
    function stdlogic_2_datapoint_ext(c : std_logic_vector) return data_type_ext;    
    function datapoint_2_stdlogic(c : data_type) return std_logic_vector;
    function datapoint_ext_2_stdlogic(c : data_type_ext) return std_logic_vector;
    function nodedata_2_stdlogic(n : node_data_type) return std_logic_vector;
    function stdlogic_2_nodedata(n : std_logic_vector) return node_data_type;
    function saturate(val : std_logic_vector) return std_logic_vector;
    function sext(val : std_logic_vector; length : integer) return std_logic_vector;
    function zext(val : std_logic_vector; length : integer) return std_logic_vector;
    function conv_ext_2_normal(val : data_type_ext) return data_type;
    function conv_normal_2_ext(val : data_type) return data_type_ext;
   
end filtering_algorithm_pkg;

package body filtering_algorithm_pkg is



    function datapoint_2_stdlogic(c : data_type) return std_logic_vector is
        variable result : std_logic_vector(D*COORD_BITWIDTH-1 downto 0);
    begin    
        for I in 0 to D-1 loop        
            result((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH) := std_logic_vector(c(I));
        end loop;        
        return result;
    end datapoint_2_stdlogic;
        
    function datapoint_ext_2_stdlogic(c : data_type_ext) return std_logic_vector is
        variable result : std_logic_vector(D*COORD_BITWIDTH_EXT-1 downto 0);
    begin    
        for I in 0 to D-1 loop        
            result((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT) := std_logic_vector(c(I));
        end loop;        
        return result;
    end datapoint_ext_2_stdlogic;    
    
    
   
    function stdlogic_2_datapoint(c : std_logic_vector) return data_type is
        variable result : data_type;
    begin    
        for I in 0 to D-1 loop        
            result(I) := c((I+1)*COORD_BITWIDTH-1 downto I*COORD_BITWIDTH);
        end loop;        
        return result;
    end stdlogic_2_datapoint;
    
    function stdlogic_2_datapoint_ext(c : std_logic_vector) return data_type_ext is
        variable result : data_type_ext;
    begin    
        for I in 0 to D-1 loop        
            result(I) := c((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT);
        end loop;        
        return result;
    end stdlogic_2_datapoint_ext;
    
    
    

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
    
    
    
    
    function saturate(val : std_logic_vector) return std_logic_vector is
        variable val_msb : std_logic;
        variable comp : std_logic_vector((val'length-MUL_INTEGER_BITS-MUL_FRACTIONAL_BITS)-1 downto 0);
        variable result : std_logic_vector(MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS-1 downto 0);
    begin
    
        if MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS < val'length then
    
            val_msb := val(val'length-1);
            
            for I in (val'length-MUL_INTEGER_BITS-MUL_FRACTIONAL_BITS)-1 downto 0 loop
                comp(I) := val_msb;
            end loop;       
            
            if val(val'length-2 downto MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS-1) = comp then        	
                result := val(MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS-1 downto 0);
            else
                result(MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS-1) := val_msb;
                result(MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS-2 downto 0) := (others => NOT(val_msb));
            end if;	 
            
        else
        
            result := sext(val,MUL_INTEGER_BITS+MUL_FRACTIONAL_BITS);            
        
        end if;
        
        return result;
    
    end saturate; 
    
    
    
    function sext(val : std_logic_vector; length : integer) return std_logic_vector is
        variable val_msb : std_logic;
        variable result : std_logic_vector(length-1 downto 0);
    begin
        val_msb := val(val'length-1);
        result(val'length-1 downto 0) := val;
        result(length-1 downto val'length) := (others => val_msb);               
        return result;    
    end sext; 
    
    
    function zext(val : std_logic_vector; length : integer) return std_logic_vector is
        variable result : std_logic_vector(length-1 downto 0);
    begin
        result(val'length-1 downto 0) := val;
        result(length-1 downto val'length) := (others => '0');               
        return result;    
    end zext; 
            
            
    function conv_ext_2_normal(val : data_type_ext) return data_type is
        variable result : data_type;
    begin
        for I in 0 to D-1 loop
            result(I) := val(I)(COORD_BITWIDTH-1 downto 0);
        end loop;               
        return result;    
    end conv_ext_2_normal;
    
    
    function conv_normal_2_ext(val : data_type) return data_type_ext is
        variable result : data_type_ext;
    begin
        for I in 0 to D-1 loop
            result(I) := sext(val(I),COORD_BITWIDTH_EXT);
        end loop;               
        return result;    
    end conv_normal_2_ext; 

end package body;


