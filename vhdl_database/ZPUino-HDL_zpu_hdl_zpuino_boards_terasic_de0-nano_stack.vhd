library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;

entity zpuino_stack is
  port (
    stack_clk: in std_logic;
    stack_a_read: out std_logic_vector(wordSize-1 downto 0);
    stack_b_read: out std_logic_vector(wordSize-1 downto 0);
    stack_a_write: in std_logic_vector(wordSize-1 downto 0);
    stack_b_write: in std_logic_vector(wordSize-1 downto 0);
    stack_a_writeenable: in std_logic_vector(3 downto 0);
    stack_a_enable: in std_logic;
    stack_b_writeenable: in std_logic_vector(3 downto 0);
    stack_b_enable: in std_logic;
    stack_a_addr: in std_logic_vector(stackSize_bits-1 downto 2);
    stack_b_addr: in std_logic_vector(stackSize_bits-1 downto 2)
  );
end entity zpuino_stack;

architecture behave of zpuino_stack is

  signal wea: std_logic_vector(3 downto 0);
  signal web: std_logic_vector(3 downto 0);

begin

  

  stackram: for i in 0 to 3 generate

  wea(i) <= stack_a_enable and stack_a_writeenable(i);
  web(i) <= stack_b_enable and stack_b_writeenable(i);

  stackmem: entity work.mydpram
  PORT MAP (
		address_a	  => stack_a_addr(stackSize_bits-1 downto 2),
		address_b	  => stack_b_addr(stackSize_bits-1 downto 2),
		clock	      => stack_clk,
		data_a	    => stack_a_write( ((i+1)*8)-1  downto (i*8)),
		data_b	    => stack_b_write( ((i+1)*8)-1  downto (i*8)),
		rden_a	    => stack_a_enable,
		rden_b	    => stack_b_enable,
		wren_a	    => wea(i),
		wren_b	    => web(i),
		q_a	        => stack_a_read( ((i+1)*8)-1  downto (i*8)),
		q_b	        => stack_b_read( ((i+1)*8)-1  downto (i*8))
	);

  end generate;

end behave;
