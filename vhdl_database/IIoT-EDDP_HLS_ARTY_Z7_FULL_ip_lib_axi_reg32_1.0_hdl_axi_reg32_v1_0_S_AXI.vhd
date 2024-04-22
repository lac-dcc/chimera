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

entity axi_reg32_v1_0_S_AXI is
	generic (
		-- Users to add parameters here
		C_NUM_RO_REG : integer range 0 to 16 := 2;
        C_NUM_WR_REG : integer range 0 to 16 := 2;
        C_WR_READABLE: boolean := true;

        
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

		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
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

		-- Global Clock Signal
		S_AXI_ACLK	: in std_logic;
		-- Global Reset Signal. This Signal is Active LOW
		S_AXI_ARESETN	: in std_logic;
		-- Write address (issued by master, acceped by Slave)
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Write channel Protection type. This signal indicates the
    		-- privilege and security level of the transaction, and whether
    		-- the transaction is a data access or an instruction access.
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		-- Write address valid. This signal indicates that the master signaling
    		-- valid write address and control information.
		S_AXI_AWVALID	: in std_logic;
		-- Write address ready. This signal indicates that the slave is ready
    		-- to accept an address and associated control signals.
		S_AXI_AWREADY	: out std_logic;
		-- Write data (issued by master, acceped by Slave) 
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Write strobes. This signal indicates which byte lanes hold
    		-- valid data. There is one write strobe bit for each eight
    		-- bits of the write data bus.    
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		-- Write valid. This signal indicates that valid write
    		-- data and strobes are available.
		S_AXI_WVALID	: in std_logic;
		-- Write ready. This signal indicates that the slave
    		-- can accept the write data.
		S_AXI_WREADY	: out std_logic;
		-- Write response. This signal indicates the status
    		-- of the write transaction.
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		-- Write response valid. This signal indicates that the channel
    		-- is signaling a valid write response.
		S_AXI_BVALID	: out std_logic;
		-- Response ready. This signal indicates that the master
    		-- can accept a write response.
		S_AXI_BREADY	: in std_logic;
		-- Read address (issued by master, acceped by Slave)
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Protection type. This signal indicates the privilege
    		-- and security level of the transaction, and whether the
    		-- transaction is a data access or an instruction access.
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		-- Read address valid. This signal indicates that the channel
    		-- is signaling valid read address and control information.
		S_AXI_ARVALID	: in std_logic;
		-- Read address ready. This signal indicates that the slave is
    		-- ready to accept an address and associated control signals.
		S_AXI_ARREADY	: out std_logic;
		-- Read data (issued by slave)
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Read response. This signal indicates the status of the
    		-- read transfer.
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		-- Read valid. This signal indicates that the channel is
    		-- signaling the required read data.
		S_AXI_RVALID	: out std_logic;
		-- Read ready. This signal indicates that the master can
    		-- accept the read data and response information.
		S_AXI_RREADY	: in std_logic
	);
end axi_reg32_v1_0_S_AXI;

architecture arch_imp of axi_reg32_v1_0_S_AXI is

	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

	-- Example-specific design signals
	-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	-- ADDR_LSB is used for addressing 32/64 bit registers/memories
	-- ADDR_LSB = 2 for 32 bits (n downto 2)
	-- ADDR_LSB = 3 for 64 bits (n downto 3)
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS : integer := 4;
	------------------------------------------------
	---- Signals for user logic register space example
	--------------------------------------------------
	---- Number of Slave Registers 32
	signal slv_reg0	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg1	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg2	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg3	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg4	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg5	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg6	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg7	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg8	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg9	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg10	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg11	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg12	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg13	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg14	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg15	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg16	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg17	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg18	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg19	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg20	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg21	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg22	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg23	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg24	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg25	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg26	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg27	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg28	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg29	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg30	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg31	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);

	signal slv_reg16r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg17r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg18r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg19r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg20r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg21r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg22r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg23r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg24r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg25r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg26r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg27r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg28r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg29r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg30r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');
	signal slv_reg31r	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others=>'0');

	signal slv_reg_rden	: std_logic;
	signal slv_reg_wren	: std_logic;
	signal reg_data_out	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal byte_index	: integer;

begin
	-- I/O Connections assignments

	S_AXI_AWREADY	<= axi_awready;
	S_AXI_WREADY	<= axi_wready;
	S_AXI_BRESP	<= axi_bresp;
	S_AXI_BVALID	<= axi_bvalid;
	S_AXI_ARREADY	<= axi_arready;
	S_AXI_RDATA	<= axi_rdata;
	S_AXI_RRESP	<= axi_rresp;
	S_AXI_RVALID	<= axi_rvalid;
	-- Implement axi_awready generation
	-- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	-- de-asserted when reset is low.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awready <= '0';
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	        axi_awready <= '1';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both 
	-- S_AXI_AWVALID and S_AXI_WVALID are valid. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') then
	        -- Write Address latching
	        axi_awaddr <= S_AXI_AWADDR;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_wready generation
	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1') then
	          -- slave is ready to accept write data when 
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design 
	          -- expects no outstanding transactions.           
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process; 

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

	process (S_AXI_ACLK)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      slv_reg16 <= STD_LOGIC_VECTOR(to_unsigned(C_WR0_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg17 <= STD_LOGIC_VECTOR(to_unsigned(C_WR1_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg18 <= STD_LOGIC_VECTOR(to_unsigned(C_WR2_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg19 <= STD_LOGIC_VECTOR(to_unsigned(C_WR3_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg20 <= STD_LOGIC_VECTOR(to_unsigned(C_WR4_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg21 <= STD_LOGIC_VECTOR(to_unsigned(C_WR5_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg22 <= STD_LOGIC_VECTOR(to_unsigned(C_WR6_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg23 <= STD_LOGIC_VECTOR(to_unsigned(C_WR7_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg24 <= STD_LOGIC_VECTOR(to_unsigned(C_WR8_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg25 <= STD_LOGIC_VECTOR(to_unsigned(C_WR9_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg26 <= STD_LOGIC_VECTOR(to_unsigned(C_WR10_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg27 <= STD_LOGIC_VECTOR(to_unsigned(C_WR11_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg28 <= STD_LOGIC_VECTOR(to_unsigned(C_WR12_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg29 <= STD_LOGIC_VECTOR(to_unsigned(C_WR13_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg30 <= STD_LOGIC_VECTOR(to_unsigned(C_WR14_DEFAULT,C_S_AXI_DATA_WIDTH));
	      slv_reg31 <= STD_LOGIC_VECTOR(to_unsigned(C_WR15_DEFAULT,C_S_AXI_DATA_WIDTH));
	    else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	      if (slv_reg_wren = '1') then
	        case loc_addr is
	          when b"10000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 16
	                slv_reg16(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 17
	                slv_reg17(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 18
	                slv_reg18(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 19
	                slv_reg19(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 20
	                slv_reg20(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 21
	                slv_reg21(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 22
	                slv_reg22(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"10111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 23
	                slv_reg23(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 24
	                slv_reg24(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 25
	                slv_reg25(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 26
	                slv_reg26(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 27
	                slv_reg27(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 28
	                slv_reg28(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 29
	                slv_reg29(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 30
	                slv_reg30(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"11111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 31
	                slv_reg31(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when others =>
	            slv_reg16 <= slv_reg16;
	            slv_reg17 <= slv_reg17;
	            slv_reg18 <= slv_reg18;
	            slv_reg19 <= slv_reg19;
	            slv_reg20 <= slv_reg20;
	            slv_reg21 <= slv_reg21;
	            slv_reg22 <= slv_reg22;
	            slv_reg23 <= slv_reg23;
	            slv_reg24 <= slv_reg24;
	            slv_reg25 <= slv_reg25;
	            slv_reg26 <= slv_reg26;
	            slv_reg27 <= slv_reg27;
	            slv_reg28 <= slv_reg28;
	            slv_reg29 <= slv_reg29;
	            slv_reg30 <= slv_reg30;
	            slv_reg31 <= slv_reg31;
	        end case;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arready generation
	-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when S_AXI_ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching 
	        axi_araddr  <= S_AXI_ARADDR;           
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  
	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then
	    if S_AXI_ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;

	process (slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9, slv_reg10, slv_reg11, slv_reg12, slv_reg13, slv_reg14, slv_reg15, slv_reg16r, slv_reg17r, slv_reg18r, slv_reg19r, slv_reg20r, slv_reg21r, slv_reg22r, slv_reg23r, slv_reg24r, slv_reg25r, slv_reg26r, slv_reg27r, slv_reg28r, slv_reg29r, slv_reg30r, slv_reg31r, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    case loc_addr is
	      when b"00000" =>
	        reg_data_out <= slv_reg0;
	      when b"00001" =>
	        reg_data_out <= slv_reg1;
	      when b"00010" =>
	        reg_data_out <= slv_reg2;
	      when b"00011" =>
	        reg_data_out <= slv_reg3;
	      when b"00100" =>
	        reg_data_out <= slv_reg4;
	      when b"00101" =>
	        reg_data_out <= slv_reg5;
	      when b"00110" =>
	        reg_data_out <= slv_reg6;
	      when b"00111" =>
	        reg_data_out <= slv_reg7;
	      when b"01000" =>
	        reg_data_out <= slv_reg8;
	      when b"01001" =>
	        reg_data_out <= slv_reg9;
	      when b"01010" =>
	        reg_data_out <= slv_reg10;
	      when b"01011" =>
	        reg_data_out <= slv_reg11;
	      when b"01100" =>
	        reg_data_out <= slv_reg12;
	      when b"01101" =>
	        reg_data_out <= slv_reg13;
	      when b"01110" =>
	        reg_data_out <= slv_reg14;
	      when b"01111" =>
	        reg_data_out <= slv_reg15;

	      when b"10000" =>
	        reg_data_out <= slv_reg16r;
	      when b"10001" =>
	        reg_data_out <= slv_reg17r;
	      when b"10010" =>
	        reg_data_out <= slv_reg18r;
	      when b"10011" =>
	        reg_data_out <= slv_reg19r;
	      when b"10100" =>
	        reg_data_out <= slv_reg20r;
	      when b"10101" =>
	        reg_data_out <= slv_reg21r;
	      when b"10110" =>
	        reg_data_out <= slv_reg22r;
	      when b"10111" =>
	        reg_data_out <= slv_reg23r;
	      when b"11000" =>
	        reg_data_out <= slv_reg24r;
	      when b"11001" =>
	        reg_data_out <= slv_reg25r;
	      when b"11010" =>
	        reg_data_out <= slv_reg26r;
	      when b"11011" =>
	        reg_data_out <= slv_reg27r;
	      when b"11100" =>
	        reg_data_out <= slv_reg28r;
	      when b"11101" =>
	        reg_data_out <= slv_reg29r;
	      when b"11110" =>
	        reg_data_out <= slv_reg30r;
	      when b"11111" =>
	        reg_data_out <= slv_reg31r;
	      when others =>
	        reg_data_out  <= (others => '0');
	    end case;
	end process; 

	-- Output register or memory read data
	process( S_AXI_ACLK ) is
	begin
	  if (rising_edge (S_AXI_ACLK)) then
	    if ( S_AXI_ARESETN = '0' ) then
	      axi_rdata  <= (others => '0');
	    else
	      if (slv_reg_rden = '1') then
	        -- When there is a valid read address (S_AXI_ARVALID) with 
	        -- acceptance of read address by the slave (axi_arready), 
	        -- output the read dada 
	        -- Read address mux
	          axi_rdata <= reg_data_out;     -- register read data
	      end if;   
	    end if;
	  end if;
	end process;


    slv_reg0  <= RR0;
    slv_reg1  <= RR1;
    slv_reg2  <= RR2;
    slv_reg3  <= RR3;
    slv_reg4  <= RR4;
    slv_reg5  <= RR5;
    slv_reg6  <= RR6;
    slv_reg7  <= RR7;
    slv_reg8  <= RR8;
    slv_reg9  <= RR9;
    slv_reg10 <= RR10;
    slv_reg11 <= RR11;
    slv_reg12 <= RR12;
    slv_reg13 <= RR13;
    slv_reg14 <= RR14;
    slv_reg15 <= RR15;

    WR0  <= slv_reg16;
    WR1  <= slv_reg17;
    WR2  <= slv_reg18;
    WR3  <= slv_reg19;
    WR4  <= slv_reg20;
    WR5  <= slv_reg21;
    WR6  <= slv_reg22;
    WR7  <= slv_reg23;
    WR8  <= slv_reg24;
    WR9  <= slv_reg25;
    WR10 <= slv_reg26;
    WR11 <= slv_reg27;
    WR12 <= slv_reg28;
    WR13 <= slv_reg29;
    WR14 <= slv_reg30;
    WR15 <= slv_reg31;


WR_readable_Gen: if C_WR_READABLE = true generate
    slv_reg16r  <= slv_reg16;
WR17_Gen: if C_NUM_WR_REG > 1 generate    
    slv_reg17r  <= slv_reg17;
end generate;
WR18_Gen: if C_NUM_WR_REG > 2 generate    
    slv_reg18r  <= slv_reg18;
end generate;
WR19_Gen: if C_NUM_WR_REG > 3 generate    
    slv_reg19r  <= slv_reg19;
end generate;
WR20_Gen: if C_NUM_WR_REG > 4 generate    
    slv_reg20r  <= slv_reg20;
end generate;
WR21_Gen: if C_NUM_WR_REG > 5 generate    
    slv_reg21r  <= slv_reg21;
end generate;
WR22_Gen: if C_NUM_WR_REG > 6 generate    
    slv_reg22r  <= slv_reg22;
end generate;
WR23_Gen: if C_NUM_WR_REG > 7 generate    
    slv_reg23r  <= slv_reg23;
end generate;
WR24_Gen: if C_NUM_WR_REG > 8 generate    
    slv_reg24r  <= slv_reg24;
end generate;
WR25_Gen: if C_NUM_WR_REG > 9 generate    
    slv_reg25r  <= slv_reg25;
end generate;
WR26_Gen: if C_NUM_WR_REG > 10 generate    
    slv_reg26r  <= slv_reg26;
end generate;
WR27_Gen: if C_NUM_WR_REG > 11 generate    
    slv_reg27r  <= slv_reg27;
end generate;
WR28_Gen: if C_NUM_WR_REG > 12 generate    
    slv_reg28r  <= slv_reg28;
end generate;
WR29_Gen: if C_NUM_WR_REG > 13 generate    
    slv_reg29r  <= slv_reg29;
end generate;
WR30_Gen: if C_NUM_WR_REG > 14 generate    
    slv_reg30r  <= slv_reg30;
end generate;
WR31_Gen: if C_NUM_WR_REG > 15 generate    
    slv_reg31r  <= slv_reg31;
end generate;
  
end generate WR_readable_Gen;

end arch_imp;
