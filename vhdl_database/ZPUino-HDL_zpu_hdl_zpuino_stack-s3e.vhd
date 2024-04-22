library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;

library UNISIM;
use UNISIM.vcomponents.all;


entity zpuino_stack is
  port (
    stack_clk: in std_logic;
    stack_a_read: out std_logic_vector(wordSize-1 downto 0);
    stack_b_read: out std_logic_vector(wordSize-1 downto 0);
    stack_a_write: in std_logic_vector(wordSize-1 downto 0);
    stack_b_write: in std_logic_vector(wordSize-1 downto 0);
    stack_a_writeenable: in std_logic;
    stack_b_writeenable: in std_logic;
    stack_a_enable: in std_logic;
    stack_b_enable: in std_logic;
    stack_a_addr: in std_logic_vector(stackSize_bits-1 downto 0);
    stack_b_addr: in std_logic_vector(stackSize_bits-1 downto 0)
  );
end entity zpuino_stack;

architecture behave of zpuino_stack is

  signal dipa,dipb: std_logic_vector(3 downto 0) := (others => '0');

begin

  stack: RAMB16_S36_S36
  generic map (
    WRITE_MODE_A => "WRITE_FIRST",
    WRITE_MODE_B => "WRITE_FIRST",
    SIM_COLLISION_CHECK => "GENERATE_X_ONLY"
    )
  port map (
    DOA  => stack_a_read,
    DOB  => stack_b_read,
    DOPA => open,
    DOPB => open,

    ADDRA => stack_a_addr,
    ADDRB => stack_b_addr,
    CLKA  => stack_clk,
    CLKB  => stack_clk,
    DIA   => stack_a_write,
    DIB   => stack_b_write,
    DIPA  => dipa,
    DIPB  => dipb,
    ENA   => stack_a_enable,
    ENB   => stack_b_enable,
    SSRA  => '0',
    SSRB  => '0',
    WEA   => stack_a_writeenable,
    WEB   => stack_b_writeenable
    );
end behave;
