----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework 
--
-- Debouncer for the joystick ports that includes a port switcher and the
-- ability to turn the joysticks on/off.
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer is
generic (
   CLK_FREQ           : in integer
);
port (
   clk                : in std_logic;  
   reset_n            : in std_logic;
   
   flip_joys_i        : in std_logic;
   joy_1_on           : in std_logic;
   joy_2_on           : in std_logic;
 
   joy_1_up_n         : in std_logic;
   joy_1_down_n       : in std_logic;
   joy_1_left_n       : in std_logic;
   joy_1_right_n      : in std_logic;
   joy_1_fire_n       : in std_logic;
   
   dbnce_joy1_up_n    : out std_logic;
   dbnce_joy1_down_n  : out std_logic;
   dbnce_joy1_left_n  : out std_logic;
   dbnce_joy1_right_n : out std_logic;
   dbnce_joy1_fire_n  : out std_logic;
   
   joy_2_up_n         : in std_logic;
   joy_2_down_n       : in std_logic;
   joy_2_left_n       : in std_logic;
   joy_2_right_n      : in std_logic;
   joy_2_fire_n       : in std_logic;
   
   dbnce_joy2_up_n    : out std_logic;
   dbnce_joy2_down_n  : out std_logic;
   dbnce_joy2_left_n  : out std_logic;
   dbnce_joy2_right_n : out std_logic;
   dbnce_joy2_fire_n  : out std_logic     
);
end debouncer;

architecture beh of debouncer is

signal j1_u, j1_d, j1_l, j1_r, j1_f : std_logic;
signal j2_u, j2_d, j2_l, j2_r, j2_f : std_logic;


begin

   -- assign output signals and support the flip joystick ports feature and the on/off switches
   handle_outputs: process(all)
   begin
      dbnce_joy1_up_n      <= '1';
      dbnce_joy1_down_n    <= '1';
      dbnce_joy1_left_n    <= '1';
      dbnce_joy1_right_n   <= '1';
      dbnce_joy1_fire_n    <= '1';
      
      dbnce_joy2_up_n      <= '1';
      dbnce_joy2_down_n    <= '1';
      dbnce_joy2_left_n    <= '1';
      dbnce_joy2_right_n   <= '1';
      dbnce_joy2_fire_n    <= '1';
      
      if joy_1_on then
         dbnce_joy1_up_n      <= j1_u when flip_joys_i = '0' else j2_u;
         dbnce_joy1_down_n    <= j1_d when flip_joys_i = '0' else j2_d;
         dbnce_joy1_left_n    <= j1_l when flip_joys_i = '0' else j2_l;
         dbnce_joy1_right_n   <= j1_r when flip_joys_i = '0' else j2_r;
         dbnce_joy1_fire_n    <= j1_f when flip_joys_i = '0' else j2_f;
      end if;
 
      if joy_2_on then
         dbnce_joy2_up_n      <= j2_u when flip_joys_i = '0' else j1_u;
         dbnce_joy2_down_n    <= j2_d when flip_joys_i = '0' else j1_d;
         dbnce_joy2_left_n    <= j2_l when flip_joys_i = '0' else j1_l;
         dbnce_joy2_right_n   <= j2_r when flip_joys_i = '0' else j1_r;
         dbnce_joy2_fire_n    <= j2_f when flip_joys_i = '0' else j1_f;
      end if;
   end process;
   
   -- debouncer settings for the joysticks:
   -- 5ms for any joystick direction
   -- 1ms for the fire button
        
   do_dbnce_joy1_up : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_1_up_n, result => j1_u);

   do_dbnce_joy1_down : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_1_down_n, result => j1_d);

   do_dbnce_joy1_left : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_1_left_n, result => j1_l);

   do_dbnce_joy1_right : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_1_right_n, result => j1_r);

   do_dbnce_joy1_fire : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_1_fire_n, result => j1_f);
      
   do_dbnce_joy2_up : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_2_up_n, result => j2_u);

   do_dbnce_joy2_down : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_2_down_n, result => j2_d);

   do_dbnce_joy2_left : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_2_left_n, result => j2_l);

   do_dbnce_joy2_right : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_2_right_n, result => j2_r);

   do_dbnce_joy2_fire : entity work.debounce
      generic map(initial => '1', clk_freq => CLK_FREQ, stable_time => 1)
      port map (clk => clk, reset_n => reset_n, button => joy_2_fire_n, result => j2_f);      
end beh;
