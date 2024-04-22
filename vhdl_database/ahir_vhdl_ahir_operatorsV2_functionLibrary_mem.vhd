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
use ahir.mem_component_pack.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
entity ram_1024x32_Operator is -- 
  port ( -- 
    sample_req: in boolean;
    sample_ack: out boolean;
    update_req: in boolean;
    update_ack: out boolean;
    enable : in  std_logic_vector(0 downto 0);
    read_write_bar : in  std_logic_vector(0 downto 0);
    addr : in  std_logic_vector(9 downto 0);
    din : in  std_logic_vector(31 downto 0);
    dout : out  std_logic_vector(31 downto 0);
    clk, reset: in std_logic
    -- 
  );
  -- 
end entity ram_1024x32_Operator;
architecture ram_1024x32_Operator_arch of ram_1024x32_Operator is -- 
	signal datain, dataout: std_logic_vector(31 downto 0);
	signal writebar: std_logic;
	signal addrin: std_logic_vector(9 downto 0);
	signal enable_base, enable_bb: std_logic;
	signal start_req, start_ack: std_logic;
	signal ureg_write_req, ureg_write_ack: std_logic;
begin --  
   p2l: Sample_Pulse_To_Level_Translate_Entity
                generic map(name => "ram_1024x32_Operator-p2l")
                port map (rL => sample_req, rR => start_req,
                                aL => sample_ack, aR => start_ack,
                                        clk => clk, reset => reset);

  -- 0 is write-port
  datain <= din;
  addrin <= addr;
  enable_bb <= enable_base and enable(0);
  writebar <= read_write_bar(0);

  bbsp: base_bank
		generic map ("ram_1024x32_base_bank",
					g_addr_width => 10, g_data_width => 32)
		port map (
			clk => clk, reset => reset,
			datain => datain,
			dataout => dataout,
         		addrin => addrin,
         		enable => enable_bb,
         		writebar  => writebar 
		);


   sfsm: SingleCycleStartFinFsm 
			port map (clk => clk, reset => reset,
					-- input
					start_req => start_req, 
					-- output
					start_ack => start_ack,
					-- input
					fin_req => ureg_write_ack, 
					-- output
					fin_ack => ureg_write_req,
					-- same as start-ack
					enable => enable_base);

   ureg: UnloadRegister 
		generic map (name => "ram1024x32:ureg",
				data_width => 32,
				  bypass_flag => true, nonblocking_read_flag => false)
		port map (write_data => dataout,
				write_req => ureg_write_req,
					write_ack => ureg_write_ack,
					    read_data => dout,
						unload_req => update_req,
						   unload_ack => update_ack,
							clk => clk,
							  reset => reset);


end ram_1024x32_Operator_arch;
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
use ahir.mem_component_pack.all;

entity dpram_1w_1r_1024x32_Operator is -- 
  port ( -- 
    sample_req: in boolean;
    sample_ack: out boolean;
    update_req: in boolean;
    update_ack: out boolean;
    read_enable : in  std_logic_vector(0 downto 0);
    write_enable : in  std_logic_vector(0 downto 0);
    read_addr : in  std_logic_vector(9 downto 0);
    write_addr : in  std_logic_vector(9 downto 0);
    write_data : in  std_logic_vector(31 downto 0);
    read_data : out  std_logic_vector(31 downto 0);
    clk, reset: in std_logic
    -- 
  );
  -- 
end entity dpram_1w_1r_1024x32_Operator;
architecture dpram_1w_1r_1024x32_Operator_arch of dpram_1w_1r_1024x32_Operator is -- 
	signal datain_0, datain_1, dataout_0, dataout_1, dataout_1_reg, data_to_ulreg: std_logic_vector(31 downto 0);
	signal enable_0, enable_1, enable_1_reg, writebar_0, writebar_1: std_logic;
	signal addrin_0, addrin_1: std_logic_vector(9 downto 0);
	signal enable_base: std_logic;
	signal start_req, start_ack: std_logic;
	signal ureg_write_req, ureg_write_ack: std_logic;
begin 

   p2l: Sample_Pulse_To_Level_Translate_Entity
                generic map(name => "dpram_1w_1r_1024x32_Operator-p2l")
                port map (rL => sample_req, rR => start_req,
                                aL => sample_ack, aR => start_ack,
                                        clk => clk, reset => reset);

  -- 0 is write-port
  datain_0 <= write_data;
  addrin_0 <= write_addr;
  enable_0 <= enable_base and write_enable(0);
  writebar_0 <= '0';

  datain_1 <= (others => '0');
  addrin_1  <= read_addr;
  enable_1 <= enable_base and read_enable(0);
  writebar_1 <= '1';

  -- stabilize the outputs of the dpram.
  process(clk, reset)
  begin
	if(clk'event and clk = '1') then 
		if(reset = '1') then
			enable_1_reg <= '0';
		else
			enable_1_reg <= enable_1;
			if(enable_1_reg = '1') then
				dataout_1_reg <= dataout_1;
			end if;	
		end if;
	end if;
  end process;
  data_to_ulreg <= dataout_1 when (enable_1_reg = '1') else dataout_1_reg;

  bbdp: base_bank_dual_port 
		generic map ("dpram_1w_1r_1024x32_base_bank_dual_port",
					g_addr_width => 10, g_data_width => 32)
		port map (
			clk => clk, reset => reset,
			datain_0 => datain_0,
			dataout_0 => dataout_0,
         		addrin_0 => addrin_0,
         		enable_0 => enable_0,
         		writebar_0  => writebar_0 ,
	 		datain_1  => datain_1 ,
         		dataout_1 => dataout_1,
         		addrin_1 => addrin_1,
         		enable_1 => enable_1,
         		writebar_1  => writebar_1 
		);


   sfsm: SingleCycleStartFinFsm 
			port map (clk => clk, reset => reset,
					start_req => start_req, start_ack => start_ack,
						fin_req => ureg_write_ack, fin_ack => ureg_write_req,
							enable => enable_base);

   ureg: UnloadRegister 
		generic map (name => "dpram_1w_1r_1024x32_base_bank_dual_port:ureg",
				data_width => 32,
				  bypass_flag => true, nonblocking_read_flag => false)
		port map (write_data => data_to_ulreg,
				write_req => ureg_write_req,
					write_ack => ureg_write_ack,
					    read_data => read_data,
						unload_req => update_req,
						   unload_ack => update_ack,
							clk => clk,
							  reset => reset);

end dpram_1w_1r_1024x32_Operator_arch;
