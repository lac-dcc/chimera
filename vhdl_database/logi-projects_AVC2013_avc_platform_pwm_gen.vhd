----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:35 04/23/2013 
-- Design Name: 
-- Module Name:    pwm_gen - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_gen is
  port (clk            : in  std_logic;
        rst            : in  std_logic;
        btnU           : in  std_logic;
        btnUp          : in  std_logic;
        btnDown        : in  std_logic;
        servo_position : in  std_logic_vector(7 downto 0);
        led0           : out std_logic := '0';
        servo_out1     : out std_logic);
end pwm_gen;

architecture Behavioral of pwm_gen is
  constant ccw             : std_logic_vector(7 downto 0) := x"FF";
  constant cw              : std_logic_vector(7 downto 0) := x"00";
  --constant center          : std_logic_vector(7 downto 0) := x"7F";
--**********************************************************************
-- Clock constants for PWM
--**********************************************************************
  constant system_clk_freq : integer                      := 50_000_000;

  constant system_clk_period_ns : integer := (1000000000 / system_clk_freq);  -- convert frequency to period
  constant system_clk_period_ps : integer := (system_clk_period_ns * 1000);

--**********************************************************************
  constant servo_clock_period_ps : integer := 32000;
  constant servo_clock_period_ns : integer := servo_clock_period_ps /1000;
--**********************************************************************

  constant period     : integer := 1000000;
  constant dcycle_max : integer := 100000;
  constant dcycle_min : integer := 50000;
  constant duty_in    : integer := 200;

  signal pwm_reg, pwm_next           : std_logic;
  signal duty_cycle, duty_cycle_next : integer                       := 0;
  signal counter_next                : integer                       := 0;
  signal tick                        : std_logic;
  signal counter                     : std_logic_vector(25 downto 0) := (others => '0');
--  signal clk_tick                    : std_logic := '0';
  signal control_counter             : integer range 0 to 25000;
  --**********************************************************************
  -- Clock Divider Signals
  --**********************************************************************
  signal pwm_clk                     : std_logic;
  signal pwm_rst                     : std_logic;

  signal servo1_count : std_logic_vector(0 to 7);
  signal servo_count  : std_logic_vector(0 to 7);

  signal servo_counter             : std_logic_vector(0 to 7);
  signal clk_tick                  : std_logic := '0';
  signal led0_i                    : std_logic;
  --**********************************************************************
  --fsm signals
  --**********************************************************************
  type   state_type is (idle, center, right_t, left_t);
  signal current_state, next_state : state_type;
  signal fsm1                      : std_logic;
  signal fsm2                      : std_logic;
  signal fsm3                      : std_logic;
  signal fsm4                      : std_logic;

  signal cnt     : std_logic_vector(7 downto 0) := (others => '0');
  signal btnu_i  : std_logic;
  signal btnup_i : std_logic;
  component clock_divider
    generic(
      slow_clock_period   : integer;
      system_clock_period : integer
      );
    port(
      clk     : in  std_logic;
      rst     : in  std_logic;
      pwm_clk : out std_logic;
      pwm_rst : out std_logic
      );
  end component;

  component servo_controller
    port(
      clk            : in  std_logic;
      rst            : in  std_logic;
      servo_position : in  std_logic_vector(0 to 7);
      servo_out      : out std_logic
      );
  end component;

  component steering_control
    port(
      clk       : in  std_logic;
      rst       : in  std_logic;
      btnu      : in  std_logic;
      btndown   : in  std_logic;
      btnup     : in  std_logic;
      servo_out : out std_logic_vector(7 downto 0) := x"7F"
      );
  end component;
begin


  btnu_i  <= btnu;
  btnup_i <= btnup;
  Inst_clock_divider : clock_divider
    generic map (
      slow_clock_period   => servo_clock_period_PS ,
      system_clock_period => system_clk_period_ps
      )
    port map(
      clk     => clk,
      rst     => rst,
      pwm_clk => pwm_clk,
      pwm_rst => pwm_rst
      );

  Inst_servo_controller : servo_controller port map(
    clk            => pwm_clk,
    rst            => pwm_rst,
    servo_position => servo1_count,
    servo_out      => servo_out1
    );


  Inst_steering_control : steering_control port map(
    clk       => clk,
    rst       => rst,
    btnu      => btnu,
    btndown   => btndown,
    btnup     => btnup,
    servo_out => servo1_count
    );


  process(pwm_clk, rst)
  begin
    if (rst = '0') then
      counter <= (others => '0');
    elsif(pwm_clk'event and pwm_clk = '1') then
      if (counter(23) = '1') then
        clk_tick <= not clk_tick;
--        led0 <= not clk_tick;
        counter  <= (others => '0');
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;
  process(clk_tick)
  begin
    if(clk_tick = '1') then
      led0_i <= '1';
    else
      led0_i <= '0';
    end if;
  end process;

  led0 <= led0_i;

end Behavioral;

