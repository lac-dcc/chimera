----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: divider_top - Behavioral
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

entity divider_top is
    generic (
        ROUND : boolean := false
    );
    port (
        clk : in std_logic;
        sclr : in std_logic;
        nd : in std_logic;
        dividend : in data_type_ext;
        divisor : in coord_type;
        rdy : out std_logic;
        quotient : out data_type;
        divide_by_zero : out std_logic
    );
end divider_top;

architecture Behavioral of divider_top is

    constant QUOTIENT_BITWIDTH : integer := COORD_BITWIDTH_EXT;
    constant FRACTIONAL_BITWIDTH : integer := COORD_BITWIDTH_EXT-COORD_BITWIDTH;
    
    type divider_result_type is array(0 to D-1) of std_logic_vector(QUOTIENT_BITWIDTH+FRACTIONAL_BITWIDTH-1 downto 0);
    type quotient_type is array(0 to D-1) of std_logic_vector(QUOTIENT_BITWIDTH-1 downto 0);

    
    component divider
        port (
            aclk : IN std_logic;
            s_axis_divisor_tvalid : IN std_logic;
            --s_axis_divisor_tready : OUT std_logic;
            s_axis_divisor_tdata : IN std_logic_vector(COORD_BITWIDTH-1 DOWNTO 0);
            s_axis_dividend_tvalid : IN std_logic;
            --s_axis_dividend_tready : OUT std_logic;
            s_axis_dividend_tdata : IN std_logic_vector(COORD_BITWIDTH_EXT-1 DOWNTO 0);
            m_axis_dout_tvalid : OUT std_logic;
            m_axis_dout_tdata : OUT std_logic_vector(QUOTIENT_BITWIDTH+FRACTIONAL_BITWIDTH-1 DOWNTO 0)
            --m_axis_dout_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    end component;    
   
    component divider_v3_0
        port (
            clk : IN std_logic;
            sclr : IN std_logic;
            s_axis_divisor_tvalid : IN std_logic;
            divisor : IN std_logic_vector(COORD_BITWIDTH-1 DOWNTO 0);
            dividend : IN std_logic_vector(COORD_BITWIDTH_EXT-1 DOWNTO 0);
            quotient: OUT std_logic_vector(QUOTIENT_BITWIDTH-1 DOWNTO 0);
            fractional : OUT std_logic_vector(FRACTIONAL_BITWIDTH-1 downto 0)                
        );
    end component;      
    
    component dsp_round
        generic (
            BITWIDTH_IN : integer := 32;
            BITWIDTH_OUT : integer := 32
        );
        port (
            sclr             : in std_logic;
            nd               : in std_logic;
            AB_IN            : in std_logic_vector (BITWIDTH_IN-1 downto 0); 
            CARRYIN_IN       : in std_logic; 
            CLK_IN           : in std_logic; 
            C_IN             : in std_logic_vector (BITWIDTH_IN-1 downto 0); 
            P_OUT            : out std_logic_vector (BITWIDTH_OUT-1 downto 0);
            rdy              : out std_logic
        );
    end component;
    
    signal tmp_divisor : coord_type;
    signal divider_result : divider_result_type;
    signal tmp_quotient : quotient_type;        
    signal divider_valid : std_logic_vector(0 to D-1);
    signal tmp_divide_by_zero : std_logic_vector(0 to D-1);
     
    signal round_valid : std_logic_vector(0 to D-1);            
    signal c_in_const : std_logic_vector(COORD_BITWIDTH_EXT-1 downto 0);

begin

    c_in_const(QUOTIENT_BITWIDTH-1 downto QUOTIENT_BITWIDTH-FRACTIONAL_BITWIDTH-1) <= (others => '0');
    c_in_const(QUOTIENT_BITWIDTH-FRACTIONAL_BITWIDTH-2 downto 0) <= (others => '1');
    
    tmp_divisor <= std_logic_vector(to_unsigned(1,COORD_BITWIDTH)) WHEN divisor = std_logic_vector(to_unsigned(0,COORD_BITWIDTH)) ELSE divisor;
    
    G_DIV : for I in 0 to D-1 generate
        divider_inst : divider
            port map (
                aclk => clk,
                s_axis_divisor_tvalid => nd,
                --s_axis_divisor_tready => open,
                s_axis_divisor_tdata => tmp_divisor,
                s_axis_dividend_tvalid => nd,
                --s_axis_dividend_tready => open,
                s_axis_dividend_tdata => dividend(I),
                m_axis_dout_tvalid => divider_valid(I),
                m_axis_dout_tdata => divider_result(I)
                --m_axis_dout_tuser(0) => tmp_divide_by_zero(I)
            );
            
        tmp_quotient(I) <= divider_result(I)(QUOTIENT_BITWIDTH+FRACTIONAL_BITWIDTH-1 downto FRACTIONAL_BITWIDTH);
            
        G_ROUND : if ROUND = true generate    
            dsp_round_inst : dsp_round
                generic map (
                    BITWIDTH_IN => COORD_BITWIDTH_EXT,
                    BITWIDTH_OUT => COORD_BITWIDTH
                )
                port map (
                    sclr => sclr,
                    nd => divider_valid(I),
                    AB_IN => divider_result(I)(COORD_BITWIDTH_EXT-1 downto 0), 
                    CARRYIN_IN => divider_result(I)(COORD_BITWIDTH_EXT-1), -- round towards zero
                    CLK_IN => clk,
                    C_IN => c_in_const,
                    P_OUT => quotient(I),
                    rdy => round_valid(I)
                ); 
        end generate G_ROUND;
                       
        G_NO_ROUND : if ROUND = false generate
            quotient(I) <= divider_result(I)(QUOTIENT_BITWIDTH-1 downto FRACTIONAL_BITWIDTH);
        end generate G_NO_ROUND;
         
    end generate G_DIV;
    
    G_NO_ROUND_1 : if ROUND = false generate
        rdy <= divider_valid(0);
    end generate G_NO_ROUND_1;
    
    G_ROUND_1 : if ROUND = true generate
        rdy <= round_valid(0);
    end generate G_ROUND_1;    
    
    divide_by_zero <= '0';--tmp_divide_by_zero(0);

    
end Behavioral;
