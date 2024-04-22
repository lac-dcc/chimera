library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library shift_reg_lib;
use shift_reg_lib.shift_reg_1_global_package.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
entity shift_reg_1_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of shift_reg_1_Test_Bench is -- 
  signal clk: std_logic := '0';
  signal reset: std_logic := '1';
  signal shift_reg_1_daemon_tag_in: std_logic_vector(1 downto 0);
  signal shift_reg_1_daemon_tag_out: std_logic_vector(1 downto 0);
  signal shift_reg_1_daemon_start_req : std_logic := '0';
  signal shift_reg_1_daemon_start_ack : std_logic := '0';
  signal shift_reg_1_daemon_fin_req   : std_logic := '0';
  signal shift_reg_1_daemon_fin_ack   : std_logic := '0';
  -- write to pipe in_data
  signal in_data_pipe_write_data: std_logic_vector(31 downto 0);
  signal in_data_pipe_write_req : std_logic_vector(0 downto 0) := (others => '0');
  signal in_data_pipe_write_ack : std_logic_vector(0 downto 0);
  -- read from pipe out_data
  signal out_data_pipe_read_data: std_logic_vector(31 downto 0);
  signal out_data_pipe_read_req : std_logic_vector(0 downto 0) := (others => '0');
  signal out_data_pipe_read_ack : std_logic_vector(0 downto 0);
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  -- assert reset for four clocks.
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    reset <= '0';
    while true loop --
      wait until clk = '0';
      Vhpi_Listen;
      Vhpi_Send;
      --
    end loop;
    wait;
    --
  end process;
  -- connect all the top-level modules to Vhpi
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("in_data req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      in_data_pipe_write_req <= Unpack_String(req_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("in_data 0");
      Vhpi_Get_Port_Value(obj_ref,port_val_string,32);
      in_data_pipe_write_data <= Unpack_String(port_val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("in_data ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(in_data_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable port_val_string, req_val_string, ack_val_string,  obj_ref: VhpiString;
  begin --
    wait until reset = '0';
    -- let the DUT come out of reset.... give it 4 cycles.
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    while true loop -- 
      wait until clk = '0';
      wait for 1 ns; 
      obj_ref := Pack_String_To_Vhpi_String("out_data req");
      Vhpi_Get_Port_Value(obj_ref,req_val_string,1);
      out_data_pipe_read_req <= Unpack_String(req_val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("out_data ack");
      ack_val_string := Pack_SLV_To_Vhpi_String(out_data_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,ack_val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("out_data 0");
      port_val_string := Pack_SLV_To_Vhpi_String(out_data_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,port_val_string,32);
      -- 
    end loop;
    --
  end process;
  shift_reg_1_instance: shift_reg_1 -- 
    port map ( -- 
      clk => clk,
      reset => reset,
      in_data_pipe_write_data  => in_data_pipe_write_data, 
      in_data_pipe_write_req  => in_data_pipe_write_req, 
      in_data_pipe_write_ack  => in_data_pipe_write_ack,
      out_data_pipe_read_data  => out_data_pipe_read_data, 
      out_data_pipe_read_req  => out_data_pipe_read_req, 
      out_data_pipe_read_ack  => out_data_pipe_read_ack ); -- 
  -- 
end VhpiLink;
