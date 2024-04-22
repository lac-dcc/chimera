---------------------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Reset Manager:
-- Distinguish between the reset of the core (only) and the reset of the whole system:
-- a) Core only: Immediately after the debounced reset signal arrives
-- b) Whole system: Duration defined by M2M_RST_TRIGGER (see below)
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_manager is
   generic (
      BOARD_CLK_SPEED : natural
   );
   port (
      CLK            : in  std_logic;                  -- 100 MHz clock
      RESET_N        : in  std_logic;                  -- CPU reset button, active low

      reset_m2m_n_o  : out std_logic;
      reset_core_n_o : out std_logic
   );
end entity reset_manager;

architecture synthesis of reset_manager is

---------------------------------------------------------------------------------------------
-- Reset Control
---------------------------------------------------------------------------------------------

signal dbnce_reset_n          : std_logic;

-- Press the MEGA65's reset button long to activate the M2M reset, press it short for a core-only reset
constant M2M_RST_TRIGGER      : natural := 1500;   -- milliseconds => 1.5 sec
constant RST_DURATION         : natural := 50;     -- milliseconds
signal reset_pressed          : std_logic := '0';
signal button_duration        : natural;
signal reset_duration         : natural;

begin

   -- 20 ms for the reset button
   i_dbnce_reset : entity work.debounce
      generic map (
         clk_freq    => BOARD_CLK_SPEED,
         stable_time => 20
      )
      port map (
         clk     => CLK,
         reset_n => '1',
         button  => RESET_N,
         result  => dbnce_reset_n
      ); -- i_dbnce_reset


   p_reset_manager : process (CLK)
   begin
      if rising_edge(CLK) then

         -- button pressed
         if dbnce_reset_n = '0' then
            reset_pressed        <= '1';
            reset_core_n_o       <= '0';  -- the core resets immediately on pressing the button
            reset_duration       <= (BOARD_CLK_SPEED / 1000) * RST_DURATION;
            if button_duration = 0 then
               reset_m2m_n_o     <= '0';  -- the framework only resets if the trigger time is reached
            else
               button_duration   <= button_duration - 1;
            end if;

         -- button released
         else
            if reset_pressed then
               if reset_duration = 0 then
                  reset_pressed  <= '0';
               else
                  reset_duration <= reset_duration - 1;
               end if;
            else
               reset_m2m_n_o     <= '1';
               reset_core_n_o    <= '1';
               button_duration   <= (BOARD_CLK_SPEED / 1000) * M2M_RST_TRIGGER;
            end if;
         end if;
      end if;
   end process p_reset_manager;

end architecture synthesis;

