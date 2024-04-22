----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: addorsub - Behavioral
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

-- computes a+b or a-b

entity addorsub is
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
end addorsub;

architecture Behavioral of addorsub is

    function my_max(v1 : integer; v2 : integer) return integer is
        variable result : integer;
    begin    
        if v1 < v2 then
            result := v2;
        else
            result := v1;
        end if;
        return result;
    end my_max;
    
    function sext(val : std_logic_vector; length : integer) return std_logic_vector is
        variable val_msb : std_logic;
        variable result : std_logic_vector(length-1 downto 0);
    begin
        val_msb := val(val'length-1);
        result(val'length-1 downto 0) := val;
        result(length-1 downto val'length) := (others => val_msb);               
        return result;    
    end sext;     

    constant INT_BITWIDTH : integer := A_BITWIDTH+1;
    constant LATENCY : integer := 2;

    signal GND_ALUMODE      : std_logic;
    signal GND_BUS_3        : std_logic_vector (2 downto 0);
    signal GND_BUS_18       : std_logic_vector (17 downto 0);
    signal GND_BUS_30       : std_logic_vector (29 downto 0);
    signal GND_BUS_48       : std_logic_vector (47 downto 0);
    signal GND_OPMODE       : std_logic;
    signal VCC_OPMODE       : std_logic;
    
    signal AB_IN : std_logic_vector(47 downto 0);
    signal C_IN : std_logic_vector(47 downto 0);
    signal P_OUT : std_logic_vector(47 downto 0);
    
    signal delay_line       : std_logic_vector(0 to LATENCY-1);
    
    signal a_reg : std_logic_vector(A_BITWIDTH-1 downto 0);
    signal b_reg : std_logic_vector(B_BITWIDTH-1 downto 0);
    signal p_reg : std_logic_vector(47 downto 0);
    signal tmp_sum : signed(INT_BITWIDTH-1 downto 0);

begin

    G_DSP : if USE_DSP = true generate

        GND_ALUMODE <= '0';
        GND_BUS_3(2 downto 0) <= "000";
        GND_BUS_18(17 downto 0) <= "000000000000000000";
        GND_BUS_30(29 downto 0) <= "000000000000000000000000000000";
        GND_BUS_48(47 downto 0) <= 
              "000000000000000000000000000000000000000000000000";
        GND_OPMODE <= '0';
        VCC_OPMODE <= '1';
        
        C_IN(47 downto A_BITWIDTH) <= (others=> a(A_BITWIDTH-1));
        C_IN(A_BITWIDTH-1 downto 0) <= a;
         
        AB_IN(47 downto B_BITWIDTH) <= (others=> b(B_BITWIDTH-1));
        AB_IN(B_BITWIDTH-1 downto 0) <= b;
        
        
        DSP48E_INST : DSP48E
        generic map( ACASCREG => 1,
                 ALUMODEREG => 0,
                 AREG => 1,
                 AUTORESET_PATTERN_DETECT => FALSE,
                 AUTORESET_PATTERN_DETECT_OPTINV => "MATCH",
                 A_INPUT => "DIRECT",
                 BCASCREG => 1,
                 BREG => 1,
                 B_INPUT => "DIRECT",
                 CARRYINREG => 1,
                 CARRYINSELREG => 0,
                 CREG => 1,
                 MASK => x"3FFFFFFFFFFF",
                 MREG => 1,
                 MULTCARRYINREG => 1,
                 OPMODEREG => 0,
                 PATTERN => x"000000000000", -- pattern to all zeros
                 PREG => 1,
                 SEL_MASK => "MASK",
                 SEL_PATTERN => "PATTERN",
                 SEL_ROUNDING_MASK => "MODE1", -- set to MODE1 instead of SEL_MASK to overrule SEL_MASK
                 USE_MULT => "NONE",
                 USE_PATTERN_DETECT => "PATDET", -- enable pattern detect
                 USE_SIMD => "ONE48")
           port map (A(29 downto 0)=>AB_IN(47 downto 18),
                     ACIN(29 downto 0)=>GND_BUS_30(29 downto 0),
                     ALUMODE(3)=>GND_ALUMODE,
                     ALUMODE(2)=>GND_ALUMODE,
                     ALUMODE(1)=>sub,
                     ALUMODE(0)=>sub,
                     B(17 downto 0)=>AB_IN(17 downto 0),
                     BCIN(17 downto 0)=>GND_BUS_18(17 downto 0),
                     C(47 downto 0)=>C_IN(47 downto 0),
                     CARRYCASCIN=>GND_ALUMODE,
                     CARRYIN=>GND_ALUMODE,
                     CARRYINSEL(2 downto 0)=>GND_BUS_3(2 downto 0),
                     CEALUMODE=>VCC_OPMODE,
                     CEA1=>nd,
                     CEA2=>VCC_OPMODE,
                     CEB1=>nd,
                     CEB2=>VCC_OPMODE,
                     CEC=>nd,
                     CECARRYIN=>VCC_OPMODE,
                     CECTRL=>VCC_OPMODE,
                     CEM=>VCC_OPMODE,
                     CEMULTCARRYIN=>VCC_OPMODE,
                     CEP=>VCC_OPMODE,
                     CLK=>clk,
                     MULTSIGNIN=>GND_ALUMODE,
                     OPMODE(6)=>GND_OPMODE,
                     OPMODE(5)=>VCC_OPMODE,
                     OPMODE(4)=>VCC_OPMODE,
                     OPMODE(3)=>GND_OPMODE,
                     OPMODE(2)=>GND_OPMODE,
                     OPMODE(1)=>VCC_OPMODE,
                     OPMODE(0)=>VCC_OPMODE,
                     PCIN(47 downto 0)=>GND_BUS_48(47 downto 0),
                     RSTA=>GND_ALUMODE,
                     RSTALLCARRYIN=>GND_ALUMODE,
                     RSTALUMODE=>GND_ALUMODE,
                     RSTB=>GND_ALUMODE,
                     RSTC=>GND_ALUMODE,
                     RSTCTRL=>GND_ALUMODE,
                     RSTM=>GND_ALUMODE,
                     RSTP=>GND_ALUMODE,
                     ACOUT=>open,
                     BCOUT=>open,
                     CARRYCASCOUT=>open,
                     CARRYOUT=>open,
                     MULTSIGNOUT=>open,
                     OVERFLOW=>open,
                     P(47 downto 0)=>P_OUT(47 downto 0),
                     PATTERNBDETECT=>open,
                     PATTERNDETECT=>open,
                     PCOUT=>open,
                     UNDERFLOW=>open);
                     
        -- trunc LSB (safe)
        --res <= P_OUT(INT_BITWIDTH-1 downto INT_BITWIDTH-RES_BITWIDTH);
        -- trunc MSB (unsafe)
        res <= P_OUT(RES_BITWIDTH-1 downto 0);
    
    end generate G_DSP;
    
    G_NODSP : if USE_DSP = false generate
    
        reg_proc : process(clk)        
        begin 
            if rising_edge(clk) then
                a_reg <= a;
                b_reg <= b;
                p_reg <= sext(std_logic_vector(tmp_sum),48); 
            end if;
        end process reg_proc;
        
        add_sub : process(a_reg,b_reg,sub)
        begin
            if sub ='0' then
                tmp_sum <= signed(sext(a_reg,INT_BITWIDTH))+signed(sext(b_reg,INT_BITWIDTH));
            else
                tmp_sum <= signed(sext(a_reg,INT_BITWIDTH))-signed(sext(b_reg,INT_BITWIDTH));
            end if;                
        end process add_sub;
        
        res <= p_reg(RES_BITWIDTH-1 downto 0);
        
    end generate G_NODSP;
    
    
    
    -- compensate for downconverter latency
    delay_line_proc : process(clk)
    begin
    if rising_edge(clk) then
        if sclr = '1' then
            delay_line <= (others => '0');
        else
            delay_line(0) <= nd;
            delay_line(1 to LATENCY-1) <= delay_line(0 to LATENCY-2);
        end if;
    end if;
    end process delay_line_proc;
    
    rdy <= delay_line(LATENCY-1);
             
end Behavioral;
