-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
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
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity InputPortRevisedCheck is
     port (
          	sample_req : in std_logic_vector(1 downto 0);
          	sample_ack : out std_logic_vector(1 downto 0);
          	update_req : in std_logic_vector(1 downto 0);
          	update_ack : out std_logic_vector(1 downto 0);
          	data : out std_logic_vector(63 downto 0); 
          	oreq : out std_logic;
          	oack  : in std_logic;
          	odata  : in std_logic_vector(31 downto 0);
          	clk, reset : in std_logic
          );
end entity InputPortRevisedCheck;

architecture Struct of InputPortRevisedCheck is
     signal sr, sa, ur, ua: BooleanArray(1 downto 0);
     constant output_buffering : IntegerArray(1 downto 0) := ( 0 => 0, 1 => 1);
begin
      sr <= To_BooleanArray(sample_req);
      sample_ack <= To_SLV(sa);

      ur <= To_BooleanArray(update_req);
      update_ack <= To_SLV(ua);

      in_data_read_0: InputPortRevised -- 
        generic map ( name => "in_data_read_0", data_width => 32,  num_reqs => 2,  output_buffering => output_buffering,   no_arbitration => false)
        port map (-- 
          sample_req => sr , 
          sample_ack => sa, 
          update_req => ur, 
          update_ack => ua, 
          data => data, 
          oreq => oreq,
          oack => oack,
          odata => odata,
          clk => clk, reset => reset -- 
        ); -- 
end architecture Struct;
