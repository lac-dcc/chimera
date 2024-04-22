library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;

entity zpuino_debug is
  port (
    --clk:            in std_logic;
    --rst:            in std_logic;
    dbg_pc:         in std_logic_vector(maxAddrBit downto 0);
    dbg_opcode:  in std_logic_vector(7 downto 0);
    --dbg_opcode_out: out std_logic_vector(7 downto 0);
    dbg_sp:         in std_logic_vector(10 downto 2);
    dbg_brk:        in std_logic;
    dbg_stacka:     in std_logic_vector(wordSize-1 downto 0);
    dbg_stackb:     in std_logic_vector(wordSize-1 downto 0);
    dbg_freeze:     out std_logic;
    dbg_step:       out std_logic;
    dbg_inject:     out std_logic;
    dbg_reset:       out std_logic;
    dbg_flush:       out std_logic
  );
end entity;

architecture behave of zpuino_debug is
  signal enter_ss: std_logic :='0';
  signal step: std_logic := '0';
  
  constant do_single_step: boolean := true;

begin
  
    dbg_freeze <= '0';
    dbg_reset <= '0';
    dbg_inject <= '0';
    dbg_step <= '0';
    dbg_flush <= '0';

end behave;
