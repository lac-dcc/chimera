----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: axi_slave_wishbone_classic_master - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity axi_slave_wishbone_classic_master is
	generic (
		-- AXI PARAMETERS
		C_S_AXI_ID_WIDTH	     : integer	:= 1;
		C_S_AXI_DATA_WIDTH	   : integer	:= 32;
		C_S_AXI_ADDR_WIDTH	   : integer	:= 20;
		C_S_AXI_AWUSER_WIDTH	 : integer	:= 0;
		C_S_AXI_ARUSER_WIDTH	 : integer	:= 0;
		C_S_AXI_WUSER_WIDTH	  : integer	:= 0;
		C_S_AXI_RUSER_WIDTH	  : integer	:= 0;
		C_S_AXI_BUSER_WIDTH	  : integer	:= 0);
	port (
		-- WISHBONE CLASSIC SIGNALS
		RST_O : out std_logic;
		DAT_O : out std_logic_vector(31 downto 0);
		DAT_I : in std_logic_vector(31 downto 0);
		ACK_I : in std_logic;
		ADR_O : out std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		CYC_O : out std_logic;
		SEL_O : out std_logic_vector(3 downto 0);
		STB_O : out std_logic;
		WE_O  : out std_logic;
	
		-- FOLLOWING WISHBONE SIGNALS OPTIONAL AND ARE NOT SUPPORTED
		-- TGD_I()
		-- TGD_O()
		-- STALL_I
		-- ERR_I
		-- LOCK_I
		-- RTY_I
		-- TGA_O()
		-- TGC_O()
	
		-- AXI SLAVE INTERFACE
		S_AXI_ACLK	       : in std_logic;
		S_AXI_ARESETN	    : in std_logic;
		S_AXI_AWID	       : in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_AWADDR	     : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWLEN	      : in std_logic_vector(7 downto 0);
		S_AXI_AWSIZE	     : in std_logic_vector(2 downto 0);
		S_AXI_AWBURST	    : in std_logic_vector(1 downto 0);
		S_AXI_AWLOCK	     : in std_logic;
		S_AXI_AWCACHE	    : in std_logic_vector(3 downto 0);
		S_AXI_AWPROT	     : in std_logic_vector(2 downto 0);
		S_AXI_AWQOS	      : in std_logic_vector(3 downto 0);
		S_AXI_AWREGION	   : in std_logic_vector(3 downto 0);
		S_AXI_AWUSER	     : in std_logic_vector(C_S_AXI_AWUSER_WIDTH-1 downto 0);
		S_AXI_AWVALID	    : in std_logic;
		S_AXI_AWREADY	    : out std_logic;
		S_AXI_WDATA	      : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	      : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WLAST	      : in std_logic;
		S_AXI_WUSER	      : in std_logic_vector(C_S_AXI_WUSER_WIDTH-1 downto 0);
		S_AXI_WVALID	     : in std_logic;
		S_AXI_WREADY	     : out std_logic;
		S_AXI_BID	        : out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_BRESP	      : out std_logic_vector(1 downto 0);
		S_AXI_BUSER	      : out std_logic_vector(C_S_AXI_BUSER_WIDTH-1 downto 0);
		S_AXI_BVALID      : out std_logic;
		S_AXI_BREADY	     : in std_logic;
		S_AXI_ARID	       : in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_ARADDR	     : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARLEN	      : in std_logic_vector(7 downto 0);
		S_AXI_ARSIZE	     : in std_logic_vector(2 downto 0);
		S_AXI_ARBURST	    : in std_logic_vector(1 downto 0);
		S_AXI_ARLOCK	     : in std_logic;
		S_AXI_ARCACHE	    : in std_logic_vector(3 downto 0);
		S_AXI_ARPROT	     : in std_logic_vector(2 downto 0);
		S_AXI_ARQOS	      : in std_logic_vector(3 downto 0);
		S_AXI_ARREGION	   : in std_logic_vector(3 downto 0);
		S_AXI_ARUSER	     : in std_logic_vector(C_S_AXI_ARUSER_WIDTH-1 downto 0);
		S_AXI_ARVALID	    : in std_logic;
		S_AXI_ARREADY	    : out std_logic;
		S_AXI_RID	        : out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_RDATA	      : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	      : out std_logic_vector(1 downto 0);
		S_AXI_RLAST	      : out std_logic;
		S_AXI_RUSER	      : out std_logic_vector(C_S_AXI_RUSER_WIDTH-1 downto 0);
		S_AXI_RVALID	     : out std_logic;
		S_AXI_RREADY	     : in std_logic);
end axi_slave_wishbone_classic_master;

architecture arch_axi_slave_wishbone_classic_master of axi_slave_wishbone_classic_master is

    -- STATE MACHINE HANDLES ARBITRATION BETWEEN READS AND WRITES AND 
    -- DIFFERENT AXI STATES
    type T_AXI_BRIDGE_STATE is (
    T_IDLE,
    T_LATCH_WRITE_ADDRESS,
    T_WRITE_AXI_VALID,
    T_WRITE_WB_ACK,
    T_WRITE_AXI_READY,
    T_WRITE_RESP,
    T_LATCH_READ_ADDRESS,
    T_READ_WB_ACK,
    T_READ_AXI_READY);
    
    --Timeout in AXI clock cycles
    --Default: 2048 => 20us seconds at 100 MHz axi clock
    constant C_S_AXI_TIME_OUT_CLK_CYC  : std_logic_vector(31 downto 0) := x"00000800";
    
    signal current_axi_bridge_state : T_AXI_BRIDGE_STATE;
    signal current_address : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal inc_current_address : std_logic;
    signal burst_length : std_logic_vector(7 downto 0);
    signal burst_count : std_logic_vector(7 downto 0);
    signal inc_burst_count : std_logic;
    signal axi_timeout_count : std_logic_vector(31 downto 0);

begin


--------------------------------------------------------------------------
-- AXI SIGNALS NOT SUPPORTED
--------------------------------------------------------------------------

	-- S_AXI_AWSIZE will always be 0b010 for 4 bytes (32 bits)
	-- S_AXI_AWBURST will always be 0b01 for INCR
	-- S_AXI_AWLOCK not supported by Xilinx
	-- S_AXI_AWCACHE will always be 0b0011 for NORMAL, NON-CACHEABLE, BUFFERABLE MEMORY
	-- S_AXI_AWPROT will always be 0b000
	-- S_AXI_AWQOS not supported by Xilinx
	-- S_AXI_AWREGION not supported by Xilinx AXI masters
	-- S_AXI_AWUSER not supported by Xilinx
	-- S_AXI_WUSER not supported by Xilinx
	-- S_AXI_ARSIZE will always be 0b010 for 4 bytes (32 bits)
	-- S_AXI_ARBURST will always be 0b01 for INCR
	-- S_AXI_ARLOCK not supported by Xilinx
	-- S_AXI_ARCACHE will always be 0b0011 for NORMAL, NON-CACHEABLE, BUFFERABLE MEMORY
	-- S_AXI_ARPROT will always be 0b000
	-- S_AXI_ARQOS not supported by Xilinx
	-- S_AXI_ARREGION not supported by Xilinx AXI masters
	-- S_AXI_ARUSER not supported by Xilinx
	-- S_AXI_WLAST not used, burst length used instead

--------------------------------------------------------------------------
-- AXI BASIC CONNECTIONS
--------------------------------------------------------------------------

	gen_rst_o : process(S_AXI_ACLK)
	begin
		if (rising_edge(S_AXI_ACLK))then
			RST_O <= not S_AXI_ARESETN;
		end if;
	end process;

    --S_AXI_BRESP <= "00"; -- ALWAYS 'OK'
    
    --S_AXI_BUSER <= "0"; -- NOT USED
    
    --S_AXI_RRESP <= "00"; -- ALWAYS OK
    
    --S_AXI_RUSER <= "0"; -- NOT USED
    
--------------------------------------------------------------------------
-- STATE MACHINE TO HANDLE ARBITRATION BETWEEN READ AND WRITE
--------------------------------------------------------------------------

    gen_current_axi_bridge_state : process(S_AXI_ARESETN, S_AXI_ACLK)
    begin
        if (S_AXI_ARESETN = '0')then
            CYC_O <= '0'; -- MUST BE REGISTERED OUTPUT
            STB_O <= '0'; -- MUST BE REGISTERED OUTPUT
            current_axi_bridge_state <= T_IDLE;
            axi_timeout_count <= (others => '0');
            S_AXI_BRESP <= "00";
            S_AXI_RRESP <= "00";
        elsif (rising_edge(S_AXI_ACLK))then
            case current_axi_bridge_state is
                when T_IDLE =>
                axi_timeout_count <= (others => '0');
                S_AXI_BRESP <= "00";
                S_AXI_RRESP <= "00";
                current_axi_bridge_state <= T_IDLE;
                
                if (S_AXI_AWVALID = '1')and(S_AXI_WVALID = '1')then
                    current_axi_bridge_state <= T_LATCH_WRITE_ADDRESS;
                elsif (S_AXI_ARVALID = '1')then 
                    current_axi_bridge_state <= T_LATCH_READ_ADDRESS;
                end if;
                
                when T_LATCH_WRITE_ADDRESS =>
                CYC_O <= '1';
                S_AXI_BRESP <= "00";
                S_AXI_RRESP <= "00";
                current_axi_bridge_state <= T_WRITE_AXI_VALID;
                axi_timeout_count <= (others => '0');
                
                
                when T_WRITE_AXI_VALID =>
                current_axi_bridge_state <= T_WRITE_AXI_VALID;
                axi_timeout_count <= (others => '0');
                S_AXI_RRESP <= "00";
                
                if (S_AXI_WVALID = '1')then
                    STB_O <= '1';
                    current_axi_bridge_state <= T_WRITE_WB_ACK;
                end if;
                
                
                when T_WRITE_WB_ACK =>
                current_axi_bridge_state <= T_WRITE_WB_ACK;
                axi_timeout_count <= axi_timeout_count + '1';
                S_AXI_RRESP <= "00";
                --stay in this state unless wishbone ack or AXI timeout occurs
                if (ACK_I = '1')then
                    STB_O <= '0';
                    S_AXI_BRESP <= "00";
                    axi_timeout_count <= (others => '0');
                    current_axi_bridge_state <= T_WRITE_AXI_READY;  
                elsif (axi_timeout_count = C_S_AXI_TIME_OUT_CLK_CYC) then
                    STB_O <= '0';
                    S_AXI_BRESP <= "11";
                    axi_timeout_count <= (others => '0');
                    current_axi_bridge_state <= T_WRITE_AXI_READY; 
                end if;
                
                when T_WRITE_AXI_READY =>
                axi_timeout_count <= (others => '0');
                S_AXI_RRESP <= "00";
                
                if (burst_length = burst_count)then
                    CYC_O <= '0';
                    current_axi_bridge_state <= T_WRITE_RESP;                
                else
                    current_axi_bridge_state <= T_WRITE_AXI_VALID;                
                end if;
                
                when T_WRITE_RESP =>
                axi_timeout_count <= (others => '0');
                S_AXI_RRESP <= "00";
                current_axi_bridge_state <= T_WRITE_RESP;
                
                if (S_AXI_BREADY = '1')then
                    current_axi_bridge_state <= T_IDLE;
                end if;
                
                when T_LATCH_READ_ADDRESS =>
                axi_timeout_count <= (others => '0');
                S_AXI_RRESP <= "00";
                S_AXI_BRESP <= "00";
                STB_O <= '1';
                CYC_O <= '1';
                current_axi_bridge_state <= T_READ_WB_ACK;
                
                when T_READ_WB_ACK =>
                current_axi_bridge_state <= T_READ_WB_ACK;
                axi_timeout_count <= axi_timeout_count + '1';
                S_AXI_BRESP <= "00";
                --stay in this state unless wishbone ack or AXI timeout has occurred
                if (ACK_I = '1')then
                    STB_O <= '0';
                    S_AXI_RRESP <= "00";
                    axi_timeout_count <= (others => '0');
                    current_axi_bridge_state <= T_READ_AXI_READY;
                elsif (axi_timeout_count = C_S_AXI_TIME_OUT_CLK_CYC) then
                    STB_O <= '0';
                    S_AXI_RRESP <= "11";
                    axi_timeout_count <= (others => '0');
                    current_axi_bridge_state <= T_READ_AXI_READY;                
                end if;
                
                when T_READ_AXI_READY =>
                current_axi_bridge_state <= T_READ_AXI_READY;
                axi_timeout_count <= (others => '0');
                S_AXI_BRESP <= "00";
                if (S_AXI_RREADY = '1')then
                    if (burst_length = burst_count)then
                        current_axi_bridge_state <= T_IDLE;
                        CYC_O <= '0';
                    else
                        current_axi_bridge_state <= T_READ_WB_ACK;
                        STB_O <= '1';
                    end if;
                end if;
            end case;
        end if;
    end process;

--------------------------------------------------------------------------
-- AXI DECODE STATE MACHINE STATES
--------------------------------------------------------------------------

    S_AXI_AWREADY <= '1' when (current_axi_bridge_state = T_LATCH_WRITE_ADDRESS) else '0';
    S_AXI_ARREADY <= '1' when (current_axi_bridge_state = T_LATCH_READ_ADDRESS) else '0';

    gen_S_AXI_BID : process(S_AXI_ACLK)
    begin
        if (rising_edge(S_AXI_ACLK))then
            if (current_axi_bridge_state = T_LATCH_WRITE_ADDRESS)then
                S_AXI_BID <= S_AXI_AWID;
            end if;
        end if;
    end process; 

    gen_S_AXI_RID : process(S_AXI_ACLK)
    begin
        if (rising_edge(S_AXI_ACLK))then
            if (current_axi_bridge_state = T_LATCH_READ_ADDRESS)then
                S_AXI_RID <= S_AXI_ARID; 
            end if;
        end if;
    end process;

    S_AXI_BVALID <= '1' when (current_axi_bridge_state = T_WRITE_RESP) else '0';

    S_AXI_WREADY <= '1' when (current_axi_bridge_state = T_WRITE_AXI_READY) else '0';

    gen_S_AXI_RDATA : process(S_AXI_ACLK)
    begin
        if (rising_edge(S_AXI_ACLK))then
            if ((current_axi_bridge_state = T_READ_WB_ACK)and(ACK_I = '1'))then
                S_AXI_RDATA <= DAT_I;
            end if;
        end if;
    end process;

    S_AXI_RVALID <= '1' when (current_axi_bridge_state = T_READ_AXI_READY) else '0';

--------------------------------------------------------------------------
-- ADDRESS HANDLING
--------------------------------------------------------------------------

    inc_current_address <= '1' when
    ((current_axi_bridge_state = T_WRITE_AXI_READY)or
    ((current_axi_bridge_state = T_READ_AXI_READY)and(S_AXI_RREADY = '1'))) else '0';
    
    gen_current_address : process(S_AXI_ARESETN, S_AXI_ACLK)
    begin
        if (S_AXI_ARESETN = '0')then
            current_address <= (others => '0');
        elsif (rising_edge(S_AXI_ACLK))then
            if (current_axi_bridge_state = T_LATCH_WRITE_ADDRESS)then
                current_address <= S_AXI_AWADDR;
            elsif (current_axi_bridge_state = T_LATCH_READ_ADDRESS)then
                current_address <= S_AXI_ARADDR;
            else
                if (inc_current_address = '1')then
                    -- BUS IS 4 BYTES WIDE SO INCREASE BY 4 EACH TRANSFER
                    current_address <= current_address + std_logic_vector(to_unsigned(4, C_S_AXI_ADDR_WIDTH));
                end if;
            end if;
        end if;
    end process;

--------------------------------------------------------------------------
-- BURST HANDLING
--------------------------------------------------------------------------

    inc_burst_count <= '1' when 
    ((current_axi_bridge_state = T_WRITE_AXI_READY)or
    ((current_axi_bridge_state = T_READ_AXI_READY)and(S_AXI_RREADY = '1'))) else '0';

    gen_burst_length : process(S_AXI_ARESETN, S_AXI_ACLK)
    begin
        if (S_AXI_ARESETN = '0')then
            burst_length <= (others => '0');
        elsif (rising_edge(S_AXI_ACLK))then
            if (current_axi_bridge_state = T_LATCH_WRITE_ADDRESS)then
                burst_length <= S_AXI_AWLEN;    
            elsif (current_axi_bridge_state = T_LATCH_READ_ADDRESS)then
                burst_length <= S_AXI_ARLEN;    
            end if;
        end if;
    end process;

    gen_burst_count : process(S_AXI_ARESETN, S_AXI_ACLK)
    begin
        if (S_AXI_ARESETN = '0')then
            burst_count <= (others => '0');
        elsif (rising_edge(S_AXI_ACLK))then
            if ((current_axi_bridge_state = T_LATCH_WRITE_ADDRESS)or
            (current_axi_bridge_state = T_LATCH_READ_ADDRESS))then
                burst_count <= (others => '0');
            else
                if (inc_burst_count = '1')then
                    burst_count <= burst_count + X"01";
                end if;
            end if;
        end if;
    end process;

    S_AXI_RLAST <= '1' when (((current_axi_bridge_state = T_READ_WB_ACK)or(current_axi_bridge_state = T_READ_AXI_READY))and(burst_count = burst_length)) else '0';

--------------------------------------------------------------------------
-- WISHBONE DECODE STATE MACHINE STATES
--------------------------------------------------------------------------

    gen_SEL_O : process(S_AXI_ACLK)
    begin
        if (rising_edge(S_AXI_ACLK))then
            if ((current_axi_bridge_state = T_WRITE_AXI_VALID)or
            (current_axi_bridge_state = T_WRITE_WB_ACK)or
            (current_axi_bridge_state = T_WRITE_AXI_READY))then
                SEL_O <= S_AXI_WSTRB;
            else
                SEL_O <= (others => '1');
            end if;    
        end if;
    end process;
    
    gen_DAT_O : process(S_AXI_ACLK)
    begin
        if (rising_edge(S_AXI_ACLK))then
            DAT_O <= S_AXI_WDATA;
        end if;
    end process;
    
    gen_WE_O : process(S_AXI_ACLK)
    begin
        if (rising_edge(S_AXI_ACLK))then
            if ((current_axi_bridge_state = T_WRITE_AXI_VALID)or
            (current_axi_bridge_state = T_WRITE_WB_ACK)or
            (current_axi_bridge_state = T_WRITE_AXI_READY))then
                WE_O <= '1';
            else
                WE_O <= '0';
            end if;    
        end if;
    end process;
    
    ADR_O <= current_address;

end arch_axi_slave_wishbone_classic_master;
