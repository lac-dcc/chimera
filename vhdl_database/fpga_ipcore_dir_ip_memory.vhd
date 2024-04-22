--------------------------------------------------------------------------------
--     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.            --
--                                                                            --
--     This file contains confidential and proprietary information            --
--     of Xilinx, Inc. and is protected under U.S. and                        --
--     international copyright and other intellectual property                --
--     laws.                                                                  --
--                                                                            --
--     DISCLAIMER                                                             --
--     This disclaimer is not a license and does not grant any                --
--     rights to the materials distributed herewith. Except as                --
--     otherwise provided in a valid license issued to you by                 --
--     Xilinx, and to the maximum extent permitted by applicable              --
--     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                --
--     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES            --
--     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING              --
--     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                 --
--     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and               --
--     (2) Xilinx shall not be liable (whether in contract or tort,           --
--     including negligence, or under any other theory of                     --
--     liability) for any loss or damage of any kind or nature                --
--     related to, arising under or in connection with these                  --
--     materials, including for any direct, or any indirect,                  --
--     special, incidental, or consequential loss or damage                   --
--     (including loss of data, profits, goodwill, or any type of             --
--     loss or damage suffered as a result of any action brought              --
--     by a third party) even if such damage or loss was                      --
--     reasonably foreseeable or Xilinx had been advised of the               --
--     possibility of the same.                                               --
--                                                                            --
--     CRITICAL APPLICATIONS                                                  --
--     Xilinx products are not designed or intended to be fail-               --
--     safe, or for use in any application requiring fail-safe                --
--     performance, such as life-support or safety devices or                 --
--     systems, Class III medical devices, nuclear facilities,                --
--     applications related to the deployment of airbags, or any              --
--     other applications that could lead to death, personal                  --
--     injury, or severe property or environmental damage                     --
--     (individually and collectively, "Critical                              --
--     Applications"). Customer assumes the sole risk and                     --
--     liability of any use of Xilinx products in Critical                    --
--     Applications, subject only to applicable laws and                      --
--     regulations governing limitations on product liability.                --
--                                                                            --
--     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS               --
--     PART OF THIS FILE AT ALL TIMES.                                        --
--------------------------------------------------------------------------------
-- You must compile the wrapper file ip_memory.vhd when simulating
-- the core, ip_memory. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY ip_memory IS
	port (
	clka: in std_logic;
	rsta: in std_logic;
	ena: in std_logic;
	wea: in std_logic_vector(0 downto 0);
	addra: in std_logic_vector(9 downto 0);
	dina: in std_logic_vector(15 downto 0);
	douta: out std_logic_vector(15 downto 0));
END ip_memory;

ARCHITECTURE ip_memory_a OF ip_memory IS
-- synthesis translate_off
component wrapped_ip_memory
	port (
	clka: in std_logic;
	rsta: in std_logic;
	ena: in std_logic;
	wea: in std_logic_vector(0 downto 0);
	addra: in std_logic_vector(9 downto 0);
	dina: in std_logic_vector(15 downto 0);
	douta: out std_logic_vector(15 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_ip_memory use entity XilinxCoreLib.blk_mem_gen_v4_3(behavioral)
		generic map(
			c_has_regceb => 0,
			c_has_regcea => 0,
			c_mem_type => 0,
			c_rstram_b => 0,
			c_rstram_a => 0,
			c_has_injecterr => 0,
			c_rst_type => "SYNC",
			c_prim_type => 1,
			c_read_width_b => 16,
			c_initb_val => "0",
			c_family => "spartan6",
			c_read_width_a => 16,
			c_disable_warn_bhv_coll => 0,
			c_use_softecc => 0,
			c_write_mode_b => "WRITE_FIRST",
			c_init_file_name => "no_coe_file_loaded",
			c_write_mode_a => "NO_CHANGE",
			c_mux_pipeline_stages => 0,
			c_has_softecc_output_regs_b => 0,
			c_has_mem_output_regs_b => 0,
			c_has_mem_output_regs_a => 0,
			c_load_init_file => 0,
			c_xdevicefamily => "spartan6",
			c_write_depth_b => 1024,
			c_write_depth_a => 1024,
			c_has_rstb => 0,
			c_has_rsta => 1,
			c_has_mux_output_regs_b => 0,
			c_inita_val => "0",
			c_has_mux_output_regs_a => 0,
			c_addra_width => 10,
			c_has_softecc_input_regs_a => 0,
			c_addrb_width => 10,
			c_default_data => "0",
			c_use_ecc => 0,
			c_algorithm => 2,
			c_disable_warn_bhv_range => 0,
			c_write_width_b => 16,
			c_write_width_a => 16,
			c_read_depth_b => 1024,
			c_read_depth_a => 1024,
			c_byte_size => 9,
			c_sim_collision_check => "ALL",
			c_common_clk => 0,
			c_wea_width => 1,
			c_has_enb => 0,
			c_web_width => 1,
			c_has_ena => 1,
			c_use_byte_web => 0,
			c_use_byte_wea => 0,
			c_rst_priority_b => "CE",
			c_rst_priority_a => "CE",
			c_use_default_data => 0);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_ip_memory
		port map (
			clka => clka,
			rsta => rsta,
			ena => ena,
			wea => wea,
			addra => addra,
			dina => dina,
			douta => douta);
-- synthesis translate_on

END ip_memory_a;

