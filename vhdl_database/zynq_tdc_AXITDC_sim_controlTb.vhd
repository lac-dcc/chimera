---------------------------------------------------------------------------------------------------
-- FSM simple Test bench
-- Version: 1.0
--
-- Author: Michel Adamic
-- Created: 3.6.2019
-- Modified: 27.9.2019 -> we(7 downto 0), 64-bit data
--
-- Checks the operation of the control FSM.
---------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlTb is
end controlTb;

architecture Behavioral of controlTb is

   constant ADDR_WIDTH : integer := 6;    -- BRAM size = 64
   
   --Inputs
   signal clk : std_logic := '0';
   signal timestamp : std_logic_vector(31 downto 0);
   signal valid : std_logic;
   signal run, clr : std_logic;
   
   signal trigger_in : std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');
   
   --Outputs
   signal addr : std_logic_vector(ADDR_WIDTH-1 downto 0);
   signal data : std_logic_vector(63 downto 0);
   signal we : std_logic_vector(7 downto 0);
   signal rdy, full : std_logic;
   
   signal trigger_out : std_logic_vector(addr'range);

   -- Clock period definitions 
   constant T_C : time := 10.0 ns; -- Clock period constant
   
   -- TB signals
   signal step : unsigned(3 downto 0) := x"0";
   signal count : unsigned(7 downto 0) := (others => '0');
   
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: entity work.control
      Generic map (
         ADDR_WIDTH => ADDR_WIDTH
      )
      PORT MAP (
         clk => clk,
         timestamp => timestamp,
         valid => valid,
         
         addr => addr,
         data => data,
         we => we,
         
         trigger_out => trigger_out,
         trigger_in => trigger_in,
         
         run => run,
         clr => clr,
         rdy => rdy,
         full => full
      );
      
   -- Clock generation
   p_SyncClkGen : process
   begin
      clk <= '0';
      wait for T_C/2;
      clk <= '1';
      wait for T_C/2;
   end process;

   -- Simulation
   p_Sim: process(clk)
   begin
      if rising_edge(clk) then
         case step is
         
            when x"0" =>   -- initialize
               count <= count + 1;
               timestamp <= (others => '0');
               valid <= '0';
               run <= '0';
               clr <= '0';
               trigger_in <= (others => '0');
               
               if count >= 5 then
                  if rdy = '1' then
                     step <= x"1";
                     count <= (others => '0');
                  end if;
               end if;
               
            when x"1" =>   -- timestamp write tests
               count <= count + 1;
               timestamp <= (others => '0');
               valid <= '0';
               run <= '0';
               
               if (count > 5) and (count < 40) then
                  run <= '1';
               end if;
               if count = 8 then
                  timestamp <= x"AAAAAAAA";
                  valid <= '1';
               end if;
               if count = 9 then
                  trigger_in <= "111111";
               end if;
               if (count > 12) and (count < 15) then
                  timestamp <= x"BBBBBB" & std_logic_vector(count);
                  valid <= '1';
               end if;
               if (count > 25) and (count < 35) then
                  timestamp <= x"CCCCCC" & std_logic_vector(count);
                  valid <= '1';
               end if;
               
               if count >= 50 then
                  step <= x"2";
                  count <= (others => '0');
               end if;
               
            when x"2" =>   -- write until full
               count <= count + 1;
               run <= '1';
               timestamp <= x"FFFFFF" & std_logic_vector(count);
               valid <= '1';
               
               if count < 10 then
                  valid <= '0';
               end if;
               
               if full = '1' then
                  step <= x"3";
                  count <= (others => '0');
               end if;
               
            when x"3" =>   -- clear buffer
               count <= count + 1;
               clr <= '0';
               
               if count = 5 then
                  run <= '0'; -- reset bit
               end if;
               if (rdy = '1') and (count < 10) then
                  clr <= '1'; -- start clearing
               end if;
               
               if full = '0' then
                  step <= x"4";
                  count <= (others => '0');
               end if;
               
            when others =>   -- end
               count <= count + 1;
               if count = 10 then
                  -- Stop simulation
                  assert false report "SIMULATION COMPLETED" severity failure;
               end if;
         
         end case;
      end if;
   end process;
end Behavioral;