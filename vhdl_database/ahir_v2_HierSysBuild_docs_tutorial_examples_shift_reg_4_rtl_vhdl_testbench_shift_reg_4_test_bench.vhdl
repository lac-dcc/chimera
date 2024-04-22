library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
library GhdlLink;
use GhdlLink.Utility_Package.all;
use GhdlLink.Vhpi_Foreign.all;
-->>>>>
library shift_reg_lib;
--<<<<<
entity shift_reg_4_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of shift_reg_4_Test_Bench is -- 
  signal in_data_pipe_write_data : std_logic_vector(31 downto 0);
  signal in_data_pipe_write_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal in_data_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal out_data_pipe_read_data : std_logic_vector(31 downto 0);
  signal out_data_pipe_read_req  : std_logic_vector(0  downto 0) := (others => '0');
  signal out_data_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
  component shift_reg_4 is -- 
    port( -- 
      in_data_pipe_write_data : in std_logic_vector(31 downto 0);
      in_data_pipe_write_req  : in std_logic_vector(0  downto 0);
      in_data_pipe_write_ack  : out std_logic_vector(0  downto 0);
      out_data_pipe_read_data : out std_logic_vector(31 downto 0);
      out_data_pipe_read_req  : in std_logic_vector(0  downto 0);
      out_data_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for dut :  shift_reg_4 -- 
    use entity shift_reg_lib.shift_reg_4; -- 
  --<<<<<
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    Vhpi_Initialize;
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait until clk = '1';
    wait for 5 ns;
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
  process
  variable val_string, obj_ref: VhpiString;
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
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      in_data_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("in_data 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,32);
      in_data_pipe_write_data <= Unpack_String(val_string,32);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("in_data ack");
      val_string := Pack_SLV_To_Vhpi_String(in_data_pipe_write_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      -- 
    end loop;
    --
  end process;
  process
  variable val_string, obj_ref: VhpiString;
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
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      out_data_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("out_data ack");
      val_string := Pack_SLV_To_Vhpi_String(out_data_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("out_data 0");
      val_string := Pack_SLV_To_Vhpi_String(out_data_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,32);
      -- 
    end loop;
    --
  end process;
  dut: shift_reg_4
  port map ( --
    in_data_pipe_write_data => in_data_pipe_write_data,
    in_data_pipe_write_req => in_data_pipe_write_req,
    in_data_pipe_write_ack => in_data_pipe_write_ack,
    out_data_pipe_read_data => out_data_pipe_read_data,
    out_data_pipe_read_req => out_data_pipe_read_req,
    out_data_pipe_read_ack => out_data_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;
