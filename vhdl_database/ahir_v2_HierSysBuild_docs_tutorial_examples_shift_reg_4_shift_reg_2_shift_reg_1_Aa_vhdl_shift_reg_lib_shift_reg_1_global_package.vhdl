-- VHDL global package produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
package shift_reg_1_global_package is -- 
  component shift_reg_1 is -- 
    port (-- 
      clk : in std_logic;
      reset : in std_logic;
      in_data_pipe_write_data: in std_logic_vector(31 downto 0);
      in_data_pipe_write_req : in std_logic_vector(0 downto 0);
      in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
      out_data_pipe_read_data: out std_logic_vector(31 downto 0);
      out_data_pipe_read_req : in std_logic_vector(0 downto 0);
      out_data_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
    -- 
  end component;
  -- 
end package shift_reg_1_global_package;
