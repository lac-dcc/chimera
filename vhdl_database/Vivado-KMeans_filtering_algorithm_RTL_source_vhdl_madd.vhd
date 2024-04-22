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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

-- calculates a*b+c

entity madd is -- latency = mul core latency + 1 if add incl
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
end madd;

architecture Behavioral of madd is


    constant INT_BITWIDTH : integer := A_BITWIDTH+B_BITWIDTH+1;    
    
    type data_delay_type is array(0 to MUL_LATENCY-1) of std_logic_vector(C_BITWIDTH-1 downto 0);

    function sext(val : std_logic_vector; length : integer) return std_logic_vector is
        variable val_msb : std_logic;
        variable result : std_logic_vector(length-1 downto 0);
    begin
        val_msb := val(val'length-1);
        result(val'length-1 downto 0) := val;
        result(length-1 downto val'length) := (others => val_msb);               
        return result;    
    end sext; 
    

    component mul
        port (
            clk : IN STD_LOGIC;
            a : IN STD_LOGIC_VECTOR(A_BITWIDTH-1 DOWNTO 0);
            b : IN STD_LOGIC_VECTOR(B_BITWIDTH DOWNTO 0);
            p : OUT STD_LOGIC_VECTOR(A_BITWIDTH+B_BITWIDTH-1 DOWNTO 0)
        );
    end component;
    
    component addorsub is
        generic (
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

    signal tmp_pout : std_logic_vector(A_BITWIDTH+B_BITWIDTH-1 downto 0);
    signal pout : std_logic_vector(INT_BITWIDTH-1 downto 0);        
    
    signal summand_1 : signed(INT_BITWIDTH-1 downto 0);
    signal summand_2 : signed(INT_BITWIDTH-1 downto 0);
    
    signal sum_reg : signed(INT_BITWIDTH-1 downto 0);
    
    signal delay_line : std_logic_vector(0 to MUL_LATENCY+1-1);
    
    signal data_delay_line : data_delay_type;

begin


    -- compensate mul latency
    delay_line_proc : process(clk)
    begin
    	if rising_edge(clk) then
    		if sclr = '1' then
    			delay_line <= (others => '0');
    		else
    			delay_line(0) <= nd;
    			delay_line(1 to MUL_LATENCY+1-1) <= delay_line(0 to MUL_LATENCY+1-2);
    		end if;
    	end if;
    end process delay_line_proc;

    G_N_ADD : if INCLUDE_ADD = false generate
        mul_inst : mul
            port map (
                clk => clk,
                a => a,
                b => b,
                p => tmp_pout
            );    
            
        pout <= sext(tmp_pout,INT_BITWIDTH); 
            
        res <= pout(INT_BITWIDTH-1 downto INT_BITWIDTH-RES_BITWIDTH);
        
        rdy <= delay_line(MUL_LATENCY-1);
    
    end generate G_N_ADD;
    

    G_ADD : if INCLUDE_ADD = true generate
    
        mul_inst : mul
            port map (
                clk => clk,
                a => a,
                b => b,
                p => tmp_pout
            );    
            
        data_delay_proc : process(clk)
        begin
            if rising_edge(clk) then
                data_delay_line(0) <= c;
                data_delay_line(1 to MUL_LATENCY-1) <= data_delay_line(0 to MUL_LATENCY-2); 
            end if;
        end process data_delay_proc;
        
        
        summand_1 <= signed(sext(data_delay_line(MUL_LATENCY-1),INT_BITWIDTH));
        summand_2 <= signed(sext(tmp_pout,INT_BITWIDTH));       
        
        sum_reg_proc : process(clk)
        begin
            if rising_edge(clk) then
                sum_reg <= summand_1 + summand_2;
            end if;
        end process sum_reg_proc;
        
        
        
--        addorsub_inst : addorsub
--            generic map(
--                A_BITWIDTH => A_BITWIDTH+B_BITWIDTH,
--                B_BITWIDTH => C_BITWIDTH,
--                RES_BITWIDTH => INT_BITWIDTH
--            )
--            port map (
--                clk => clk,
--                sclr => sclr,
--                nd => delay_line(MUL_LATENCY-1),
--                sub => '0',
--                a => tmp_pout,
--                b => data_delay_line(MUL_LATENCY-1), 
--                res => pout,
--                rdy => rdy
--            );            
--            
        res <= std_logic_vector(sum_reg(INT_BITWIDTH-1 downto INT_BITWIDTH-RES_BITWIDTH));
        
        rdy <= delay_line(MUL_LATENCY+1-1);
    
    end generate G_ADD;
  

end Behavioral;
