---------------------------------------------------------------------------------------
--
-- Author: John Kent
-- Date  : April 2, 2004
-- Interface to John Clayton's PS2 keyboard
--
---------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity keyboard is
  port(
    clk             : in    std_logic;
    rst             : in    std_logic;
    cs              : in    std_logic;
    rw              : in    std_logic;
    addr            : in    std_logic;
    data_in         : in    std_logic_vector(7 downto 0);
    data_out        : out   std_logic_vector(7 downto 0);
    irq             : out   std_logic;
    kbd_clk         : inout std_logic;
    kbd_data        : inout std_logic
    );
end keyboard;

architecture my_keyboard of keyboard is

  signal kbd_stat       : std_logic_vector(7 downto 0);
  signal kbd_ctrl       : std_logic_vector(7 downto 6);
  signal kbd_ascii_code : std_logic_vector(7 downto 0);
  signal kbd_tx_data    : std_logic_vector(7 downto 0);
  signal kbd_read       : std_logic;
  signal kbd_write      : std_logic;
  signal kbd_write_ack  : std_logic;

  component ps2_keyboard_interface
    port(
      clk             : in    std_logic;
      reset           : in    std_logic;
      ps2_clk         : inout std_logic;
      ps2_data        : inout std_logic;
      rx_extended     : out   std_logic;
      rx_released     : out   std_logic;
      rx_shift_key_on : out   std_logic;
--  rx_scan_code    : out   std_logic_vector(7 downto 0);
      rx_ascii        : out   std_logic_vector(7 downto 0);
      rx_data_ready   : out   std_logic;       -- rx_read_o
      rx_read         : in    std_logic;       -- rx_read_ack_i
      tx_data         : in    std_logic_vector(7 downto 0);
      tx_write        : in    std_logic;
      tx_write_ack    : out   std_logic;
      tx_error_no_keyboard_ack	: out  std_logic
      );
  end component;

begin

  my_ps2_keyboard_interface : ps2_keyboard_interface
    port map(
      clk             => clk,
      reset           => rst,
      ps2_clk         => kbd_clk,
      ps2_data        => kbd_data,
      rx_extended     => kbd_stat(2),
      rx_released     => kbd_stat(3),
      rx_shift_key_on => kbd_stat(4),
      rx_ascii        => kbd_ascii_code,
      rx_data_ready   => kbd_stat(0),
      rx_read         => kbd_read,
      tx_data         => kbd_tx_data,
      tx_write        => kbd_write,
      tx_write_ack    => kbd_write_ack,
      tx_error_no_keyboard_ack	=> kbd_stat(5)
      );

  keyboard_strobe : process( clk, rst, cs, rw, kbd_stat  )
  begin
    if( rst = '1' ) then
      kbd_read <= '0';
    elsif( clk'event and clk='0' ) then
      if( cs='1' and rw='1' and addr='1' ) then
        kbd_read <= '1';
      elsif( kbd_stat(0)='1' ) then
        kbd_read <= '0';
      else
        kbd_read <= kbd_read;
      end if;
    end if;
  end process;

--
-- read keyboard registers
--
  keyboard_read : process( addr, kbd_ascii_code, kbd_stat )
  begin
    if( addr = '1' ) then
      data_out <= kbd_ascii_code;
    else
      data_out <= kbd_stat;
    end if; 
  end process;

--
-- Write to keyboard register
--
  keyboard_write : process( clk, rst, cs, rw, addr, data_in, kbd_tx_data,
                            kbd_write, kbd_write_ack )
  begin
    if(rst = '1' ) then
      kbd_ctrl   <= "00";
      kbd_tx_data <= "00000000";
      kbd_write  <= '0';
    elsif( clk'event and clk='0' ) then
      if( cs='1' and rw='0' ) then
        if( addr='1' ) then
          kbd_tx_data  <= data_in;
          kbd_ctrl    <= kbd_ctrl;
          kbd_write   <= '1';
        else
          kbd_tx_data  <= kbd_tx_data;
          kbd_ctrl    <= data_in(7 downto 6);
          kbd_write   <= kbd_write;
        end if;
      elsif( kbd_write_ack='1' ) then
        kbd_write <= '0';
      else
        kbd_write <= kbd_write;
      end if;
      kbd_stat(1) <= not kbd_write;
    end if;
  end process;

  keyboard_interrupt : process( kbd_ctrl, kbd_stat )
  begin
    kbd_stat(6)	<= kbd_ctrl(6);
    kbd_stat(7) <= kbd_ctrl(7) and kbd_stat(0);
    irq         <= kbd_stat(7);
  end process;
end my_keyboard;

