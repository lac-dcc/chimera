----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:24:06 05/01/2013 
-- Design Name: 
-- Module Name:    steering_control - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity steering_control is
  port (clk       : in  std_logic;
        rst       : in  std_logic;
        btnu      : in  std_logic;
        btndown   : in  std_logic;
        btnup     : in  std_logic;
        servo_out : out std_logic_vector (0 to 7));
end steering_control;

architecture Behavioral of steering_control is


-- State machine 
  type   state_type is (idle, center, turn_l, turn_r, turn_rl, turn_lr);
  signal state, next_state : state_type;

  signal servo_pos  : std_logic_vector(0 to 7)      := x"7F";  -- Direction Output for Servo
  signal servo_out1 : std_logic_vector(0 to 7)      := x"7F";  -- Direction Output for Servo
  signal cnt        : std_logic_vector(25 downto 0) := (others => '0');

  signal btnu_i, btnup_i, btndown_i : std_logic                     := '1';
  signal btnu_ii, btnup_ii          : std_logic                     := '1';
  signal counter                    : std_logic_vector(25 downto 0) := (others => '0');


  signal servo_control        : std_logic_vector(7 downto 0) := (others => '0');
  signal servo                : std_logic_vector(7 downto 0) := x"7F";
  signal turn_l_en, turn_r_en : std_logic                    := '1';
begin

  

  btnu_i    <= btnu;
  btndown_i <= btndown;
  btnup_i   <= btnup;



  next_state_decode : process(state, btnu_i, btnup_i, btndown_i, clk)
  begin
    if(clk'event and clk = '1') then
      if (rst = '0') then
        next_state <= idle;
      else
        next_state <= state;
        case(next_state) is
          when idle =>
        cnt <= (others => '0');
        if(btnu_i = '0') then
          next_state <= turn_l;
          cnt        <= (others => '0');
        elsif(btnup_i = '0') then
          next_state <= turn_r;
          cnt        <= (others => '0');
        elsif(btndown_i = '0') then
          next_state <= center;
          cnt        <= (others => '0');
        else
          next_state <= idle;
        end if;

        when turn_l =>
        cnt <= cnt +1;

        if(cnt(25) = '1') then
          next_state <= turn_lr;
          cnt        <= (others => '0');
        else
          next_state <= turn_l;
        end if;

        when turn_lr =>
        cnt <= cnt + 1;
        if (cnt(25) = '1') then
          next_state <= idle;
          cnt        <= (others => '0');
        else
          next_state <= turn_lr;
        end if;

        when turn_r =>
        cnt <= cnt + 1;
        if (cnt(25) = '1') then
          next_state <= turn_rl;
          cnt        <= (others => '0');
        else
          next_state <= turn_r;
        end if;

        when turn_rl =>
        cnt <= cnt+1;
        if(cnt(25) = '1') then
          next_state <= idle;
          cnt        <= (others => '0');
        else
          next_state <= turn_rl;
        end if;


        when center =>
        cnt <= cnt+1;
        if (cnt(25) = '1') then
          next_state <= idle;
        else
          next_state <= center;
        end if;
      end case;
    end if;
    case (next_state) is

      when turn_l =>
        servo_out <= x"FF";

      when turn_lr =>
        servo_out <= x"00";
      when turn_r =>
        servo_out <= x"00";
      when turn_rl =>
        servo_out <= x"FF";
      when center =>
        servo_out <= x"7F";
      when idle =>
        servo_out <= x"7F";
        cnt       <= (others => '0');

    end case;
  end if;
end process;




end behavioral;
