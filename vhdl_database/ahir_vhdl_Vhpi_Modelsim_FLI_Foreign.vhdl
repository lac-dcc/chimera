-- author: Madhav P. Desai
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Utility_Package.all;
package Modelsim_FLI_Foreign is

  -----------------------------------------------------------------------------
  -- foreign Modelsim FLI functions
  -----------------------------------------------------------------------------
  procedure  Modelsim_FLI_Initialize;
  attribute foreign of Modelsim_FLI_Initialize : procedure is "Modelsim_FLI_Initialize libModelsimFLI.so";

  procedure Modelsim_FLI_Close; -- close .
  attribute foreign of Modelsim_FLI_Close : procedure is "Modelsim_FLI_Close libModelsimFLI.so";

  procedure Modelsim_FLI_Listen;
  attribute foreign of Modelsim_FLI_Listen : procedure is "Modelsim_FLI_Listen libModelsimFLI.so";

  procedure Modelsim_FLI_Send; 
  attribute foreign of Modelsim_FLI_Send : procedure is "Modelsim_FLI_Send libModelsimFLI.so";

  procedure Modelsim_FLI_Set_Port_Value(port_name: in VhpiString; port_value: in VhpiString; port_width: in integer);
  attribute foreign of Modelsim_FLI_Set_Port_Value: procedure is "Modelsim_FLI_Set_Port_Value libModelsimFLI.so";
  
  procedure Modelsim_FLI_Get_Port_Value(port_name: in VhpiString; port_value : out VhpiString; port_width: in integer);
  attribute foreign of Modelsim_FLI_Get_Port_Value : procedure is "Modelsim_FLI_Get_Port_Value libModelsimFLI.so";

  procedure Modelsim_FLI_Log(message_string: in VhpiString);
  attribute foreign of Modelsim_FLI_Log : procedure is "Modelsim_FLI_Log libModelsimFLI.so";
  
end Modelsim_FLI_Foreign;

package body Modelsim_FLI_Foreign is
  
  procedure Modelsim_FLI_Initialize is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Close is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
    
  procedure Modelsim_FLI_Listen is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;    

  procedure Modelsim_FLI_Send is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Set_Port_Value(port_name: in VhpiString; port_value: in VhpiString; port_width: in integer) is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Get_Port_Value(port_name: in VhpiString; port_value : out VhpiString; port_width : in integer) is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;
  
  procedure Modelsim_FLI_Log(message_string: in VhpiString) is
  begin
    assert false  report "fatal: this should never be called" severity failure;    
  end procedure;

end Modelsim_FLI_Foreign;
  
