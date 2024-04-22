----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: centre_buffer_mgmt - Behavioral
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

entity centre_buffer_mgmt is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        init : in std_logic;
        addr_in_init : in centre_index_type;        
        nd : in std_logic;
        request_rdo : in std_logic;
        addr_in : in centre_index_type;
        wgtCent_in : in data_type_ext;
        sum_sq_in : in coord_type_ext;
        count_in : in coord_type; 
        valid : out std_logic;
        wgtCent_out : out data_type_ext;
        sum_sq_out : out coord_type_ext;
        count_out : out coord_type 
    );
end centre_buffer_mgmt;

architecture Behavioral of centre_buffer_mgmt is

    constant DIM : integer := D;
    constant LAT : integer := 2;
    
    type state_type is (read, write);
    
    component centre_buffer_dist
        port (
            a : IN STD_LOGIC_VECTOR(integer(ceil(log2(real(K_MAX))))-1 DOWNTO 0);
            dpra : IN STD_LOGIC_VECTOR(integer(ceil(log2(real(K_MAX))))-1 DOWNTO 0);
            d : IN STD_LOGIC_VECTOR(COORD_BITWIDTH+COORD_BITWIDTH_EXT+DIM*COORD_BITWIDTH_EXT-1 DOWNTO 0);
            clk : IN STD_LOGIC;
            we : IN STD_LOGIC;
            qdpo_srst : IN STD_LOGIC;
            qdpo : OUT STD_LOGIC_VECTOR(COORD_BITWIDTH+COORD_BITWIDTH_EXT+DIM*COORD_BITWIDTH_EXT-1 DOWNTO 0)
        );
    end component;
    
    signal state : state_type;
    
    signal tmp_we : std_logic;
    signal we_reg : std_logic;
    signal rdo_delay : std_logic_vector(0 to LAT-1);
    
    signal wr_addr_in_reg : centre_index_type;
    signal rd_addr_in_reg : centre_index_type;
    signal wgtCent_reg : data_type_ext;
    signal sum_sq_reg : coord_type_ext;
    signal count_reg : coord_type; 
    
    signal tmp_dina : std_logic_vector(COORD_BITWIDTH+COORD_BITWIDTH_EXT+DIM*COORD_BITWIDTH_EXT-1 downto 0);
    signal tmp_doutb : std_logic_vector(COORD_BITWIDTH+COORD_BITWIDTH_EXT+DIM*COORD_BITWIDTH_EXT-1 downto 0);
     
    signal tmp_wgtCent_int : data_type_ext;
    signal tmp_sum_sq_int : coord_type_ext;
    signal tmp_count_int : coord_type;
    
    signal tmp_wgtCent_int_sum : data_type_ext;
    signal tmp_sum_sq_int_sum : coord_type_ext;
    signal tmp_count_int_sum : coord_type;    

begin      

    fsm_proc : process(clk)
    begin
        if rising_edge(clk) then
            if sclr = '1' then
                state <= read;
            elsif state = read AND nd = '1' then
                state <= write;
            elsif state = write then
                state <= read;            
            end if;
        end if;
    end process fsm_proc;
    
    tmp_we <= '1' WHEN state = write ELSE '0';
    
    reg_proc : process(clk)
    begin
        if rising_edge(clk) then 
            if init = '1' then  
                wr_addr_in_reg <= addr_in_init; 
                rd_addr_in_reg <= addr_in; 
                for I in 0 to D-1 loop 
                    wgtCent_reg(I) <= (others => '0');
                end loop;
                sum_sq_reg <= (others => '0'); 
                count_reg <= (others => '0');            
            elsif nd = '1' OR request_rdo='1' then
                wr_addr_in_reg <= addr_in;
                rd_addr_in_reg <= addr_in;
                --addr_in_reg <= addr_in;                
                wgtCent_reg <= wgtCent_in;
                sum_sq_reg <= sum_sq_in; 
                count_reg <= count_in;
            end if;                                   
        end if;
    end process reg_proc;
    
    reg_proc2 : process(clk)
    begin
        if rising_edge(clk) then
            
            if sclr = '1' then
                we_reg <= '0';
                rdo_delay <= (others => '0');
            else
                we_reg <= tmp_we OR init;
                rdo_delay(0) <= request_rdo; 
                rdo_delay(1 to LAT-1) <= rdo_delay(0 to LAT-2);        
            end if;
            
        end if;
    end process reg_proc2;
    
    centre_buffer_dist_inst : centre_buffer_dist
        port map (
            a => std_logic_vector(wr_addr_in_reg(integer(ceil(log2(real(K_MAX))))-1 downto 0)),
            dpra => std_logic_vector(rd_addr_in_reg(integer(ceil(log2(real(K_MAX))))-1 downto 0)),
            d => tmp_dina,
            clk => clk,
            we => we_reg,
            qdpo_srst => init,
            qdpo => tmp_doutb
        );
       
    G1: for I in 0 to D-1 generate
        tmp_wgtCent_int(I) <= tmp_doutb((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT);
    end generate G1; 
    tmp_sum_sq_int <= tmp_doutb(1*COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT-1 downto 0*COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT);
    tmp_count_int  <= tmp_doutb(COORD_BITWIDTH+COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT-1 downto 0+COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT);
    
    G2: for I in 0 to D-1 generate
        tmp_wgtCent_int_sum(I) <= std_logic_vector(signed(tmp_wgtCent_int(I)) + signed(wgtCent_reg(I)));
        tmp_dina((I+1)*COORD_BITWIDTH_EXT-1 downto I*COORD_BITWIDTH_EXT) <= (tmp_wgtCent_int_sum(I));
    end generate G2; 
    tmp_sum_sq_int_sum <= std_logic_vector(signed(tmp_sum_sq_int) + signed(sum_sq_reg));
    tmp_dina(1*COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT-1 downto 0*COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT) <= tmp_sum_sq_int_sum;
    tmp_count_int_sum <= std_logic_vector(signed(tmp_count_int) + signed(count_reg));
    tmp_dina(COORD_BITWIDTH+COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT-1 downto 0+COORD_BITWIDTH_EXT+D*COORD_BITWIDTH_EXT) <= tmp_count_int_sum;
    
    valid <= rdo_delay(LAT-1);
    wgtCent_out <= tmp_wgtCent_int;
    sum_sq_out <= tmp_sum_sq_int;
    count_out <= tmp_count_int;

end Behavioral;
