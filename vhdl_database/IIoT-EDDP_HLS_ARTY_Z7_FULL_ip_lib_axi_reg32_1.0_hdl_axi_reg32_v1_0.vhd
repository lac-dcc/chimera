-- The 3-Clause BSD License
-- 
-- SPDX short identifier: BSD-3-Clause
-- 
-- Copyright 2016-2017 Trenz Electronic GmbH
-- 
-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
-- 
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
-- 
-- 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
-- 
-- 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

library axi_lib;
    use axi_lib.all;    
    

entity axi_reg32_v1_0 is
	generic (
		-- Users to add parameters here
		C_NUM_RO_REG : integer range 0 to 16 := 16;
		C_NUM_WR_REG : integer range 0 to 16 := 16;
        
        C_WR_READABLE: boolean := true;		

        C_RR0_ALIAS : string := "RR0";
        C_RR1_ALIAS : string := "RR1";
        C_RR2_ALIAS : string := "RR2";
        C_RR3_ALIAS : string := "RR3";
        
        C_RR4_ALIAS : string := "RR4";
        C_RR5_ALIAS : string := "RR5";
        C_RR6_ALIAS : string := "RR6";
        C_RR7_ALIAS : string := "RR7";
        
        C_RR8_ALIAS : string := "RR8";
        C_RR9_ALIAS : string := "RR9";
        C_RR10_ALIAS : string := "RR10";
        C_RR11_ALIAS : string := "RR11";

        C_RR12_ALIAS : string := "RR12";
        C_RR13_ALIAS : string := "RR13";
        C_RR14_ALIAS : string := "RR14";
        C_RR15_ALIAS : string := "RR15";

        --        
        C_WR0_ALIAS : string := "WR0";
        C_WR1_ALIAS : string := "WR1";
        C_WR2_ALIAS : string := "WR2";
        C_WR3_ALIAS : string := "WR3";
        
        C_WR4_ALIAS : string := "WR4";
        C_WR5_ALIAS : string := "WR5";
        C_WR6_ALIAS : string := "WR6";
        C_WR7_ALIAS : string := "WR7";
        
        C_WR8_ALIAS : string := "WR8";
        C_WR9_ALIAS : string := "WR9";
        C_WR10_ALIAS : string := "WR10";
        C_WR11_ALIAS : string := "WR11";

        C_WR12_ALIAS : string := "WR12";
        C_WR13_ALIAS : string := "WR13";
        C_WR14_ALIAS : string := "WR14";
        C_WR15_ALIAS : string := "WR15";
        
        C_WR0_DEFAULT : integer := 0;
        C_WR1_DEFAULT : integer := 0;
        C_WR2_DEFAULT : integer := 0;
        C_WR3_DEFAULT : integer := 0;
        C_WR4_DEFAULT : integer := 0;
        C_WR5_DEFAULT : integer := 0;
        C_WR6_DEFAULT : integer := 0;
        C_WR7_DEFAULT : integer := 0;
        C_WR8_DEFAULT : integer := 0;
        C_WR9_DEFAULT : integer := 0;
        C_WR10_DEFAULT : integer := 0;
        C_WR11_DEFAULT : integer := 0;
        C_WR12_DEFAULT : integer := 0;
        C_WR13_DEFAULT : integer := 0;
        C_WR14_DEFAULT : integer := 0;
        C_WR15_DEFAULT : integer := 0;

		
        C_REG_WIDTH : integer range 8 to 32 := 32;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_AXI
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 7
	);
	port (
		-- Users to add ports here
        
        RR0 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR1 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR2 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR3 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        
        RR4 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR5 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR6 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR7 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        
        RR8 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR9 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR10 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR11 : in std_logic_vector(C_REG_WIDTH-1 downto 0);

        RR12 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR13 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR14 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        RR15 : in std_logic_vector(C_REG_WIDTH-1 downto 0);
        
        WR0 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR1 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR2 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR3 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        
        WR4 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR5 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR6 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR7 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        
        WR8 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR9 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR10 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR11 : out std_logic_vector(C_REG_WIDTH-1 downto 0);

        WR12 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR13 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR14 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        WR15 : out std_logic_vector(C_REG_WIDTH-1 downto 0);
        

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S_AXI
		s_axi_aclk	: in std_logic;
		s_axi_aresetn	: in std_logic;
		s_axi_awaddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		s_axi_awprot	: in std_logic_vector(2 downto 0);
		s_axi_awvalid	: in std_logic;
		s_axi_awready	: out std_logic;
		s_axi_wdata	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		s_axi_wstrb	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		s_axi_wvalid	: in std_logic;
		s_axi_wready	: out std_logic;
		s_axi_bresp	: out std_logic_vector(1 downto 0);
		s_axi_bvalid	: out std_logic;
		s_axi_bready	: in std_logic;
		s_axi_araddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		s_axi_arprot	: in std_logic_vector(2 downto 0);
		s_axi_arvalid	: in std_logic;
		s_axi_arready	: out std_logic;
		s_axi_rdata	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		s_axi_rresp	: out std_logic_vector(1 downto 0);
		s_axi_rvalid	: out std_logic;
		s_axi_rready	: in std_logic
	);
end axi_reg32_v1_0;

architecture arch_imp of axi_reg32_v1_0 is

begin

-- Instantiation of Axi Bus Interface S_AXI
axi_reg32_v1_0_S_AXI_inst : entity axi_lib.axi_reg32_v1_0_S_AXI
	generic map (
        C_NUM_RO_REG => C_NUM_RO_REG,
        C_NUM_WR_REG => C_NUM_WR_REG,
        C_WR_READABLE => C_WR_READABLE,

        C_WR0_DEFAULT	=> C_WR0_DEFAULT,
        C_WR1_DEFAULT	=> C_WR1_DEFAULT,
        C_WR2_DEFAULT	=> C_WR2_DEFAULT,
        C_WR3_DEFAULT	=> C_WR3_DEFAULT,
        C_WR4_DEFAULT	=> C_WR4_DEFAULT,
        C_WR5_DEFAULT	=> C_WR5_DEFAULT,
        C_WR6_DEFAULT	=> C_WR6_DEFAULT,
        C_WR7_DEFAULT	=> C_WR7_DEFAULT,
        C_WR8_DEFAULT	=> C_WR8_DEFAULT,
        C_WR9_DEFAULT	=> C_WR9_DEFAULT,
        C_WR10_DEFAULT	=> C_WR10_DEFAULT,
        C_WR11_DEFAULT	=> C_WR11_DEFAULT,
        C_WR12_DEFAULT	=> C_WR12_DEFAULT,
        C_WR13_DEFAULT	=> C_WR13_DEFAULT,
        C_WR14_DEFAULT	=> C_WR14_DEFAULT,
        C_WR15_DEFAULT	=> C_WR15_DEFAULT,
		
	    C_REG_WIDTH         => C_REG_WIDTH, 
		C_S_AXI_DATA_WIDTH	=> C_S_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S_AXI_ADDR_WIDTH
	)
	port map (
		RR0 => RR0,
		RR1 => RR1,
		RR2 => RR2,
		RR3 => RR3,
		RR4 => RR4,
        RR5 => RR5,
        RR6 => RR6,
        RR7 => RR7,
		RR8 => RR8,
        RR9 => RR9,
        RR10 => RR10,
        RR11 => RR11,
		RR12 => RR12,
        RR13 => RR13,
        RR14 => RR14,
        RR15 => RR15,

		WR0 => WR0,
		WR1 => WR1,
		WR2 => WR2,
		WR3 => WR3,
		WR4 => WR4,
        WR5 => WR5,
        WR6 => WR6,
        WR7 => WR7,
		WR8 => WR8,
        WR9 => WR9,
        WR10 => WR10,
        WR11 => WR11,
		WR12 => WR12,
        WR13 => WR13,
        WR14 => WR14,
        WR15 => WR15,
		
		S_AXI_ACLK	=> s_axi_aclk,
		S_AXI_ARESETN	=> s_axi_aresetn,
		S_AXI_AWADDR	=> s_axi_awaddr,
		S_AXI_AWPROT	=> s_axi_awprot,
		S_AXI_AWVALID	=> s_axi_awvalid,
		S_AXI_AWREADY	=> s_axi_awready,
		S_AXI_WDATA	=> s_axi_wdata,
		S_AXI_WSTRB	=> s_axi_wstrb,
		S_AXI_WVALID	=> s_axi_wvalid,
		S_AXI_WREADY	=> s_axi_wready,
		S_AXI_BRESP	=> s_axi_bresp,
		S_AXI_BVALID	=> s_axi_bvalid,
		S_AXI_BREADY	=> s_axi_bready,
		S_AXI_ARADDR	=> s_axi_araddr,
		S_AXI_ARPROT	=> s_axi_arprot,
		S_AXI_ARVALID	=> s_axi_arvalid,
		S_AXI_ARREADY	=> s_axi_arready,
		S_AXI_RDATA	=> s_axi_rdata,
		S_AXI_RRESP	=> s_axi_rresp,
		S_AXI_RVALID	=> s_axi_rvalid,
		S_AXI_RREADY	=> s_axi_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
