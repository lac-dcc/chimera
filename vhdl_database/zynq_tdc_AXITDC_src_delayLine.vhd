----------------------------------------------------------------------------------
-- TDC Delay Line
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 9.4.2019
-- Modified: 29.5.2019 (added hit & valid logic)
-- 6.6.2019 -> ASYNC_REG attributes
-- 27.6.2019 -> valid logic updated, added enable
--
-- Tapped delay line out of CARRY4 primitives; Hit signal = 0->1 transition
-- Uses double synchronizers to avoid metastability.
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use work.MyPkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity delayLine is
   generic (
      NTaps : integer := 48  -- No. of taps; multiple of 12!
   );
   Port ( 
      clk : in std_logic; -- TDL clock
      hit : in std_logic;
      enable : in std_logic;
      thermo: out std_logic_vector(NTaps-1 downto 0); -- synchronized TDL output (thermometer code)
      valid: out std_logic -- TDC valid
   );
end delayLine;

architecture RTL of delayLine is
   signal hitQ : std_logic;  -- propagating hit signal
   signal carryOut : std_logic_vector(thermo'range); -- delay line status
   signal metaThermo : std_logic_vector(thermo'range); -- registered TDL status
   signal thermo_s : std_logic_vector(thermo'range);  -- thermo code (signal version)
   signal valid_s : std_logic;   -- original valid (before edge detection)
   
   --signal metaValid : std_logic; -- registered valid signal
   signal clear : std_logic;  -- hit logic clear
   
   -- ASYNC_REG attribute has to be set on all metastable registers
   --attribute ASYNC_REG : string;
   --attribute ASYNC_REG of metaValid: signal is "TRUE";
   --attribute ASYNC_REG of valid: signal is "TRUE";
   --attribute ASYNC_REG of metaThermo: signal is "TRUE";
   --attribute ASYNC_REG of thermo: signal is "TRUE";
   
begin
   -- hit logic
   process(hit, clear, enable)
   begin
      if enable = '1' then
         if clear = '1' then
            hitQ <= '0';
         elsif rising_edge(hit) then
            hitQ <= '1';
         end if;
      else
         hitQ <= '0';
      end if;
   end process;
   --FDCE_inst: FDCE
   --generic map (
      --INIT => '0'
   --)
   --port map (
      --Q => hitQ,  -- Q out
      --C => hit,   -- clock
      --CE => enable,  -- enable
      --CLR => clear,  -- clear
      --D => '1'
   --);
   
   clear <= carryOut(carryOut'high);   -- end of TDL
   
   -- TDL out of CARRY4 primitives
   firstCarry: CARRY4 -- taps 0-3
   port map (
      CO => carryOut(3 downto 0),
      O => open,
      CI => '0',
      CYINIT => hitQ,
      DI => "0000",
      S => "1111"
   );
   GEN_CarryChain:
   for i in 1 to NTaps/4-1 generate
      CARRY4_inst : CARRY4
      port map (
         CO => carryOut(4*i+3 downto 4*i),
         O => open,
         CI => carryOut(4*i-1), -- COUT of previous CARRY4
         CYINIT => '0',
         DI => "0000",
         S => "1111"
      );       
   end generate;
   ----------------------------------------------------------------
   ff: process(clk) -- registers
   begin
      if rising_edge(clk) then
         metaThermo <= carryOut;  -- STOP signal; capture TDL status
         thermo_s <= metaThermo;   -- synchronization
         
         --metaValid <= hitQ;   -- beginning of the line
         --valid <= metaValid;
      end if;
   end process;
   ------------------------------------------------------------------
   thermo <= thermo_s;  -- output
   valid_s <= thermo_s(0);   -- valid signal = first bin
   
   RED:  -- valid edge detection
   entity work.risingEdgeDetector(rtl)
   port map (
      clk => clk,
      sig_i => valid_s,
      sig_o => valid
   );
   
end RTL;
