----------------------------------------------------------------------------------
-- map different joystick variants to PIO for the Z1013 mist project
-- 
-- Copyright (c) 2018 by Bert Lange
-- https://github.com/boert/Z1013-mist
-- 
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity joystick_emu is
    port
    (
        mode            : in  std_logic_vector( 1 downto 0);
        --
        joystick_0      : in  std_logic_vector( 7 downto 0);
        joystick_1      : in  std_logic_vector( 7 downto 0);
        --
        userport_out    : in  std_logic_vector( 7 downto 0); -- from PIO
        userport_in     : out std_logic_vector( 7 downto 0); -- to   PIO
        --
        sound           : out std_logic
    );
end entity joystick_emu;


architecture rtl of joystick_emu is

    -- named joystick directions
    constant joy_right      : natural := 0;
    constant joy_left       : natural := 1;
    constant joy_down       : natural := 2;
    constant joy_up         : natural := 3;
    constant joy_fire_a     : natural := 4;
    constant joy_fire_b     : natural := 5;


begin
        
    process( mode, joystick_0, joystick_1, userport_out)
    begin

        -- default
        sound   <= '0';

        case mode is 

            when "00" =>
                -- practic 1/88
                -- two sticks, multiplexed
                -- with sound output
                -- most common
                userport_in( 0) <= '1';
                userport_in( 1) <= '1';
                userport_in( 2) <= '1';
                userport_in( 3) <= '1';
                userport_in( 4) <= '1';
                -- joystick 0 (left jack)
                if userport_out( 5) = '0' then
                    userport_in( 0) <= not joystick_0( joy_left);
                    userport_in( 1) <= not joystick_0( joy_right);
                    userport_in( 2) <= not joystick_0( joy_down);
                    userport_in( 3) <= not joystick_0( joy_up);
                    userport_in( 4) <= not ( joystick_0( joy_fire_a) or joystick_0( joy_fire_b));
                end if;
                -- joystick 1 (right jack)
                if userport_out( 6) = '0' then
                    userport_in( 0) <= not joystick_1( joy_left);
                    userport_in( 1) <= not joystick_1( joy_right);
                    userport_in( 2) <= not joystick_1( joy_down);
                    userport_in( 3) <= not joystick_1( joy_up);
                    userport_in( 4) <= not ( joystick_1( joy_fire_a) or joystick_1( joy_fire_b));
                end if;
                userport_in( 5) <= userport_out( 5);
                userport_in( 6) <= userport_out( 6);
                userport_in( 7) <= userport_out( 7);
                --
                sound   <= userport_out( 7);

            when "01" =>
                -- ju+te 6/87 (left or right jack)
                -- one stick
                userport_in( 0) <= '1';
                userport_in( 1) <= '0';
                userport_in( 2) <= '0';
                userport_in( 3) <= '0';
                userport_in( 4) <= not( joystick_0( joy_down)  or joystick_1( joy_down));
                userport_in( 5) <= not( joystick_0( joy_left)  or joystick_1( joy_left));
                userport_in( 6) <= not( joystick_0( joy_right) or joystick_1( joy_right));
                userport_in( 7) <= not( joystick_0( joy_up)    or joystick_1( joy_up));
                -- 'press' all directions same time on fire
                if joystick_0( joy_fire_a) or joystick_0( joy_fire_b) or
                   joystick_1( joy_fire_a) or joystick_1( joy_fire_b) then
                    userport_in( 7 downto 4) <= "0000";
                end if;
                --
                sound   <= userport_out( 0);

            when "10" =>
                -- practic 4/87
                -- two joysticks parallel
                -- fire will 'press' all directions
                -- no extra sound

                -- joystick 0 (left jack)
                userport_in( 7) <= not joystick_0( joy_right);
                userport_in( 6) <= not joystick_0( joy_down);
                userport_in( 5) <= not joystick_0( joy_left);
                userport_in( 4) <= not joystick_0( joy_up);
                if joystick_0( joy_fire_a) or joystick_0( joy_fire_b) then
                    userport_in( 7 downto 4) <= "0000";
                end if;
                -- joystick 1 (right jack)
                userport_in( 3) <= not joystick_1( joy_right);
                userport_in( 2) <= not joystick_1( joy_down);
                userport_in( 1) <= not joystick_1( joy_left);
                userport_in( 0) <= not joystick_1( joy_up);
                if joystick_1( joy_fire_a) or joystick_1( joy_fire_b) then
                    userport_in( 3 downto 0) <= "0000";
                end if;

            when "11" =>
                -- like practic 1/88, but up, down & left are scrambled
                -- used by unpatched "IG ERF-soft" programs
                userport_in( 0) <= '1';
                userport_in( 1) <= '1';
                userport_in( 2) <= '1';
                userport_in( 3) <= '1';
                userport_in( 4) <= '1';
                -- joystick 0 (left jack)
                if userport_out( 5) = '0' then
                    userport_in( 1) <= not joystick_0( joy_right);
                    userport_in( 3) <= not joystick_0( joy_left);
                    userport_in( 2) <= not joystick_0( joy_up);
                    userport_in( 0) <= not joystick_0( joy_down);
                    userport_in( 4) <= not ( joystick_0( joy_fire_a) or joystick_0( joy_fire_b));
                end if;
                -- joystick 1 (right jack)
                if userport_out( 6) = '0' then
                    userport_in( 1) <= not joystick_1( joy_right);
                    userport_in( 3) <= not joystick_1( joy_left);
                    userport_in( 2) <= not joystick_1( joy_up);
                    userport_in( 0) <= not joystick_1( joy_down);
                    userport_in( 4) <= not ( joystick_1( joy_fire_a) or joystick_1( joy_fire_b));
                end if;
                userport_in( 5) <= userport_out( 5);
                userport_in( 6) <= userport_out( 6);
                userport_in( 7) <= userport_out( 7);
                --
                sound   <= userport_out( 7);

            when others =>
                NULL;
            
        end case;
    end process;

end architecture rtl;

