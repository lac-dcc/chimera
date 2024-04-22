----------------------------------------------------------------------------------
-- Felix Winterstein, Imperial College London
-- 
-- Module Name: dsp_round - Behavioral
-- 
-- Revision 1.01
-- Additional Comments: distributed under a BSD license, see LICENSE.txt
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity dsp_round is
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
end dsp_round;

architecture BEHAVIORAL of dsp_round is
   constant LAT : integer := 2;
   signal GND_ALUMODE      : std_logic;
   signal GND_BUS_3        : std_logic_vector (2 downto 0);
   signal GND_BUS_18       : std_logic_vector (17 downto 0);
   signal GND_BUS_30       : std_logic_vector (29 downto 0);
   signal GND_BUS_48       : std_logic_vector (47 downto 0);
   signal GND_OPMODE       : std_logic;
   signal VCC_OPMODE       : std_logic;
   
   signal ab_in_ext        : std_logic_vector(47 downto 0);
   signal c_in_ext         : std_logic_vector(47 downto 0);
   signal p_out_ext        : std_logic_vector(47 downto 0);
   
   signal delay_line       : std_logic_vector(0 to LAT-1);
   
begin
   GND_ALUMODE <= '0';
   GND_BUS_3(2 downto 0) <= "000";
   GND_BUS_18(17 downto 0) <= "000000000000000000";
   GND_BUS_30(29 downto 0) <= "000000000000000000000000000000";
   GND_BUS_48(47 downto 0) <= 
         "000000000000000000000000000000000000000000000000";
   GND_OPMODE <= '0';
   VCC_OPMODE <= '1';
   
   ab_in_ext(47 downto BITWIDTH_IN)  <= (others => AB_IN(BITWIDTH_IN-1));
   ab_in_ext(BITWIDTH_IN-1 downto 0) <= AB_IN;
   c_in_ext(47 downto BITWIDTH_IN)  <= (others => C_IN(BITWIDTH_IN-1));
   c_in_ext(BITWIDTH_IN-1 downto 0) <= C_IN;   
   
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
            PATTERN => x"000000000000",
            PREG => 1,
            SEL_MASK => "MASK",
            SEL_PATTERN => "PATTERN",
            SEL_ROUNDING_MASK => "SEL_MASK",
            USE_MULT => "NONE",
            USE_PATTERN_DETECT => "NO_PATDET",
            USE_SIMD => "ONE48")
   port map (A(29 downto 0)=>ab_in_ext(47 downto 18),
            ACIN(29 downto 0)=>GND_BUS_30(29 downto 0),
            ALUMODE(3)=>GND_ALUMODE,
            ALUMODE(2)=>GND_ALUMODE,
            ALUMODE(1)=>GND_ALUMODE,
            ALUMODE(0)=>GND_ALUMODE,
            B(17 downto 0)=>ab_in_ext(17 downto 0),
            BCIN(17 downto 0)=>GND_BUS_18(17 downto 0),
            C(47 downto 0)=>c_in_ext(47 downto 0),
            CARRYCASCIN=>GND_ALUMODE,
            CARRYIN=>CARRYIN_IN,
            CARRYINSEL(2 downto 0)=>GND_BUS_3(2 downto 0),
            CEALUMODE=>VCC_OPMODE,
            CEA1=>VCC_OPMODE,
            CEA2=>VCC_OPMODE,
            CEB1=>VCC_OPMODE,
            CEB2=>VCC_OPMODE,
            CEC=>VCC_OPMODE,
            CECARRYIN=>VCC_OPMODE,
            CECTRL=>VCC_OPMODE,
            CEM=>VCC_OPMODE,
            CEMULTCARRYIN=>VCC_OPMODE,
            CEP=>VCC_OPMODE,
            CLK=>CLK_IN,
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
            P(47 downto 0)=>p_out_ext(47 downto 0),
            PATTERNBDETECT=>open,
            PATTERNDETECT=>open,
            PCOUT=>open,
            UNDERFLOW=>open);
                
    P_OUT <= p_out_ext(BITWIDTH_IN-1 downto BITWIDTH_IN-BITWIDTH_OUT);
    
    delay_line_proc : process(CLK_IN)
    begin
        if rising_edge(CLK_IN) then
            if sclr = '1' then
                delay_line <= (others => '0');
            else
                delay_line(0) <= nd;
                delay_line(1 to LAT-1) <= delay_line(0 to LAT-2);
            end if;            
        end if;
    end process delay_line_proc;
    
    rdy <= delay_line(LAT-1);
   
end BEHAVIORAL;

