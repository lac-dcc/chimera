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
library SYS_LIB;
--<<<<<
entity sys_Test_Bench is -- 
  -- 
end entity;
architecture VhpiLink of sys_Test_Bench is -- 
  signal DATA_IN_pipe_write_data : std_logic_vector(7 downto 0);
  signal DATA_IN_pipe_write_req  : std_logic_vector(0  downto 0);
  signal DATA_IN_pipe_write_ack  : std_logic_vector(0  downto 0);
  signal DATA_OUT_pipe_read_data : std_logic_vector(7 downto 0);
  signal DATA_OUT_pipe_read_req  : std_logic_vector(0  downto 0);
  signal DATA_OUT_pipe_read_ack  : std_logic_vector(0  downto 0);
  signal clk : std_logic := '0'; 
  signal reset: std_logic := '1'; 
  component sys is -- 
    port( -- 
      DATA_IN_pipe_write_data : in std_logic_vector(7 downto 0);
      DATA_IN_pipe_write_req  : in std_logic_vector(0  downto 0);
      DATA_IN_pipe_write_ack  : out std_logic_vector(0  downto 0);
      DATA_OUT_pipe_read_data : out std_logic_vector(7 downto 0);
      DATA_OUT_pipe_read_req  : in std_logic_vector(0  downto 0);
      DATA_OUT_pipe_read_ack  : out std_logic_vector(0  downto 0);
      clk, reset: in std_logic 
      -- 
    );
    --
  end component;
  -->>>>>
  for dut :  sys -- 
    use entity SYS_LIB.sys; -- 
  --<<<<<
  -- 
begin --
  -- clock/reset generation 
  clk <= not clk after 5 ns;
  process
  begin --
    Vhpi_Initialize;
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
      obj_ref := Pack_String_To_Vhpi_String("DATA_IN req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      DATA_IN_pipe_write_req <= Unpack_String(val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("DATA_IN 0");
      Vhpi_Get_Port_Value(obj_ref,val_string,8);
      DATA_IN_pipe_write_data <= Unpack_String(val_string,8);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("DATA_IN ack");
      val_string := Pack_SLV_To_Vhpi_String(DATA_IN_pipe_write_ack);
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
      obj_ref := Pack_String_To_Vhpi_String("DATA_OUT req");
      Vhpi_Get_Port_Value(obj_ref,val_string,1);
      DATA_OUT_pipe_read_req <= Unpack_String(val_string,1);
      wait until clk = '1';
      obj_ref := Pack_String_To_Vhpi_String("DATA_OUT ack");
      val_string := Pack_SLV_To_Vhpi_String(DATA_OUT_pipe_read_ack);
      Vhpi_Set_Port_Value(obj_ref,val_string,1);
      obj_ref := Pack_String_To_Vhpi_String("DATA_OUT 0");
      val_string := Pack_SLV_To_Vhpi_String(DATA_OUT_pipe_read_data);
      Vhpi_Set_Port_Value(obj_ref,val_string,8);
      -- 
    end loop;
    --
  end process;
  dut: sys
  port map ( --
    DATA_IN_pipe_write_data => DATA_IN_pipe_write_data,
    DATA_IN_pipe_write_req => DATA_IN_pipe_write_req,
    DATA_IN_pipe_write_ack => DATA_IN_pipe_write_ack,
    DATA_OUT_pipe_read_data => DATA_OUT_pipe_read_data,
    DATA_OUT_pipe_read_req => DATA_OUT_pipe_read_req,
    DATA_OUT_pipe_read_ack => DATA_OUT_pipe_read_ack,
    clk => clk, reset => reset 
    ); -- 
  -- 
end VhpiLink;
