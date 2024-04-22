----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: compute_squared_sums - Behavioral
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

entity compute_squared_sums is
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        u_sum_sq : in coord_type_ext;
        u_count : in coord_type_ext;
        op1 : in coord_type_ext;
        op2 : in coord_type_ext;
        rdy : out std_logic;
        squared_sums : out coord_type_ext
    );
end compute_squared_sums;

architecture Behavioral of compute_squared_sums is

    constant MUL_LAT : integer := MUL_CORE_LATENCY+1; -- +1 because of addition!!
    type op_delay_type is array(0 to MUL_LAT-1) of coord_type_ext;

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
    
    signal tmp_mul_res : std_logic_vector(2*MUL_BITWIDTH+1-1 downto 0);
    signal tmp_mul_rdy : std_logic;
    signal tmp_op1_ext : std_logic_vector(COORD_BITWIDTH_EXT+1-1 downto 0);
    signal tmp_sub_rdy : std_logic;
    signal tmp_sub_res : std_logic_vector(2*MUL_BITWIDTH+2-1 downto 0);
    signal tmp_final_res : coord_type_ext;
    
    signal op_delay : op_delay_type;

begin

    op_delay_proc : process(clk)
    begin
        if rising_edge(clk) then        
            op_delay(0) <= op1;
            op_delay(1 to MUL_LAT-1) <= op_delay(0 to MUL_LAT-2);             
        end if;
                
    end process op_delay_proc;

    madd_inst : madd
        generic map(
            MUL_LATENCY => MUL_CORE_LATENCY,
            A_BITWIDTH => MUL_BITWIDTH,
            B_BITWIDTH => MUL_BITWIDTH,
            INCLUDE_ADD => true,
            C_BITWIDTH => COORD_BITWIDTH_EXT,
            RES_BITWIDTH => 2*MUL_BITWIDTH+1
        )
        port map (
            clk => clk,
            sclr => sclr,
            nd => nd,
            a => saturate(u_count),
            b => saturate(op2),
            c => u_sum_sq,
            res => tmp_mul_res,
            rdy => tmp_mul_rdy
        );
        
    tmp_op1_ext <= op_delay(MUL_LAT-1) & '0';
        
    addorsub_inst : addorsub
        generic map (
            USE_DSP => USE_DSP_FOR_ADD,
            A_BITWIDTH => 2*MUL_BITWIDTH+1,
            B_BITWIDTH => COORD_BITWIDTH_EXT+1,    
            RES_BITWIDTH => 2*MUL_BITWIDTH+2
        )
        port map (
            clk => clk,
            sclr => sclr,
            nd => tmp_mul_rdy,
            sub => '1',
            a => tmp_mul_res,
            b => tmp_op1_ext,
            res => tmp_sub_res,
            rdy => tmp_sub_rdy
        );


    G3: if COORD_BITWIDTH_EXT <= 2*MUL_BITWIDTH+2 generate 
        tmp_final_res <= tmp_sub_res(COORD_BITWIDTH_EXT-1 downto 0);
    end generate G3;
    
    G4: if COORD_BITWIDTH_EXT > 2*MUL_BITWIDTH+2 generate 
        tmp_final_res(2*MUL_BITWIDTH+2-1 downto 0) <= tmp_sub_res(2*MUL_BITWIDTH+2-1 downto 0);
        tmp_final_res(COORD_BITWIDTH_EXT-1 downto 2*MUL_BITWIDTH+2) <= (others => tmp_sub_res(2*MUL_BITWIDTH+2-1));
    end generate G4;

    rdy <= tmp_sub_rdy;
    squared_sums <= tmp_final_res;
        

end Behavioral;
