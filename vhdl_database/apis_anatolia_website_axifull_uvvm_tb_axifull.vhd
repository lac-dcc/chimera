library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;
use std.env.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

use uvvm_util.axilite_bfm_pkg.all;
use uvvm_util.axi_bfm_pkg.all;
use uvvm_util.uart_bfm_pkg.all;

use std.textio.all;
use std.env.finish;

entity tb_axifull is
end tb_axifull;

architecture sim of tb_axifull is

-----------------------------------------------------------------------------
-- CONSTANTS
-----------------------------------------------------------------------------
-- Clock Constants
constant c_clkperiod                : time := 10 ns;
constant c_clkfreq                  : integer := 100_000_000;
constant c_clock_high_percentage    : integer := 50;
-- AXI4-Lite Constants
constant c_axi_addr_width           : integer := 4;
constant c_axi_data_width           : integer := 32;
constant c_reg0_addr                : unsigned (c_axi_addr_width-1 downto 0) := x"0";
constant c_reg1_addr                : unsigned (c_axi_addr_width-1 downto 0) := x"4";
-- AXI4-Full Constants
constant c_axifull_addr_width       : integer := 10;
constant c_axifull_data_width       : integer := 32;
constant c_axifull_id_width         : integer := 1;
constant c_axifull_user_width       : integer := 1;
constant c_axifull_base_addr        : integer := 0;
-- UART constants
constant c_baudrate                 : integer := 115_200;

-----------------------------------------------------------------------------
-- GLBOAL I/O Signals
signal clk			                : std_logic := '0';
signal resetn			            : std_logic := '0';
signal tx_o                         : std_logic;

-----------------------------------------------------------------------------
-- AXILITE_BFM Signals
signal axilite_if           : t_axilite_if(
    write_address_channel(
        awaddr(c_axi_addr_width-1 downto 0)
        ),
    write_data_channel(
        wdata(c_axi_data_width-1 downto 0),
        wstrb(c_axi_data_width/8-1 downto 0)
        ),
    read_address_channel(
        araddr(c_axi_addr_width-1 downto 0)
    ),
    read_data_channel(
        rdata(c_axi_data_width-1 downto 0)
    )
);
signal axilite_bfm_config   : t_axilite_bfm_config := C_AXILITE_BFM_CONFIG_DEFAULT;
signal alert_level          : t_alert_level := error;

-----------------------------------------------------------------------------
-- AXI_BFM Signals
signal axi_if   : t_axi_if(
    write_address_channel(
        awid(c_axifull_id_width-1 downto 0),
        awaddr(c_axifull_addr_width-1 downto 0),
        awuser(c_axifull_user_width-1 downto 0)
    ),
    write_data_channel(
        wdata(c_axifull_data_width-1 downto 0),
        wstrb(c_axifull_data_width/8-1 downto 0),
        wuser(c_axifull_user_width-1 downto 0)
    ),
    write_response_channel(
        bid(c_axifull_id_width-1 downto 0),
        buser(c_axifull_user_width-1 downto 0)
    ),
    read_address_channel(
        arid(c_axifull_id_width-1 downto 0), 
        araddr(c_axifull_addr_width-1 downto 0),
        aruser(c_axifull_user_width-1 downto 0)
    ),
    read_data_channel(
        rid(c_axifull_id_width-1 downto 0),  
        rdata(c_axifull_data_width-1 downto 0),
        ruser(c_axifull_user_width-1 downto 0)    
    )
);
signal axi_bfm_config   : t_axi_bfm_config := C_AXI_BFM_CONFIG_DEFAULT;

-----------------------------------------------------------------------------
-- UART Signals
signal uart_bfm_config  : t_uart_bfm_config := C_UART_BFM_CONFIG_DEFAULT;
signal terminate_loop   : std_logic := '0';

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
begin

-----------------------------------------------------------------------------
-- INSTANTIATIONS
-----------------------------------------------------------------------------
DUT : entity work.uart_axifull_v1_0
generic map(
    -- Users to add parameters here
    -- MBA START
    c_clkfreq   => 100_000_000,
    c_baudrate  => 115_200,
    c_stopbit   => 2,
    -- MBA END
    -- User parameters ends
    -- Do not modify the parameters beyond this line


    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	=> c_axi_data_width,
    C_S00_AXI_ADDR_WIDTH	=> c_axi_addr_width,

    -- Parameters of Axi Slave Bus Interface S01_AXI
    C_S01_AXI_ID_WIDTH	    => 1    ,
    C_S01_AXI_DATA_WIDTH	=> c_axifull_data_width   ,
    C_S01_AXI_ADDR_WIDTH	=> c_axifull_addr_width   ,
    C_S01_AXI_AWUSER_WIDTH	=> 1    ,
    C_S01_AXI_ARUSER_WIDTH	=> 1    ,
    C_S01_AXI_WUSER_WIDTH	=> 1    ,
    C_S01_AXI_RUSER_WIDTH	=> 1    ,
    C_S01_AXI_BUSER_WIDTH	=> 1
)
port map(
-- Users to add ports here
tx_o			=> tx_o,
-- User ports ends    
-- Ports of Axi Slave Bus Interface S00_AXI
s00_axi_aclk	=> clk,
s00_axi_aresetn	=> resetn,
-- AXI4 write address channel
s00_axi_awaddr	=> axilite_if.write_address_channel.awaddr,
s00_axi_awprot	=> axilite_if.write_address_channel.awprot,
s00_axi_awvalid	=> axilite_if.write_address_channel.awvalid,
s00_axi_awready	=> axilite_if.write_address_channel.awready,
-- AXI4 write data channel
s00_axi_wdata	=> axilite_if.write_data_channel.wdata,
s00_axi_wstrb	=> axilite_if.write_data_channel.wstrb,
s00_axi_wvalid	=> axilite_if.write_data_channel.wvalid,
s00_axi_wready	=> axilite_if.write_data_channel.wready,
-- AXI4 write response channel
s00_axi_bresp	=> axilite_if.write_response_channel.bresp,
s00_axi_bvalid	=> axilite_if.write_response_channel.bvalid,
s00_axi_bready	=> axilite_if.write_response_channel.bready,
-- AXI4 read address channel
s00_axi_araddr	=> axilite_if.read_address_channel.araddr,
s00_axi_arprot	=> axilite_if.read_address_channel.arprot,
s00_axi_arvalid	=> axilite_if.read_address_channel.arvalid,
s00_axi_arready	=> axilite_if.read_address_channel.arready,
-- AXI4 read data channel
s00_axi_rdata	=> axilite_if.read_data_channel.rdata,
s00_axi_rresp	=> axilite_if.read_data_channel.rresp,
s00_axi_rvalid	=> axilite_if.read_data_channel.rvalid,
s00_axi_rready	=> axilite_if.read_data_channel.rready,

-- Ports of Axi Slave Bus Interface S01_AXI
s01_axi_aclk	=> clk,
s01_axi_aresetn	=> resetn,
-- AXI4-Full write address channel
s01_axi_awid	    => axi_if.write_address_channel.awid    ,
s01_axi_awaddr	    => axi_if.write_address_channel.awaddr	,
s01_axi_awlen	    => axi_if.write_address_channel.awlen	,
s01_axi_awsize	    => axi_if.write_address_channel.awsize	,
s01_axi_awburst	    => axi_if.write_address_channel.awburst	,
s01_axi_awlock	    => axi_if.write_address_channel.awlock	,
s01_axi_awcache	    => axi_if.write_address_channel.awcache	,
s01_axi_awprot	    => axi_if.write_address_channel.awprot	,
s01_axi_awqos	    => axi_if.write_address_channel.awqos	,
s01_axi_awregion    => axi_if.write_address_channel.awregion,
s01_axi_awuser	    => axi_if.write_address_channel.awuser	,
s01_axi_awvalid	    => axi_if.write_address_channel.awvalid	,
s01_axi_awready	    => axi_if.write_address_channel.awready	,
-- AXI4-Full write data channel
s01_axi_wdata	    => axi_if.write_data_channel.wdata      ,
s01_axi_wstrb	    => axi_if.write_data_channel.wstrb,
s01_axi_wlast	    => axi_if.write_data_channel.wlast,
s01_axi_wuser	    => axi_if.write_data_channel.wuser,
s01_axi_wvalid	    => axi_if.write_data_channel.wvalid,
s01_axi_wready	    => axi_if.write_data_channel.wready,
-- AXI4-Full write response channel
s01_axi_bid	        => axi_if.write_response_channel.bid	 , 
s01_axi_bresp	    => axi_if.write_response_channel.bresp,
s01_axi_buser	    => axi_if.write_response_channel.buser,
s01_axi_bvalid	    => axi_if.write_response_channel.bvalid,
s01_axi_bready	    => axi_if.write_response_channel.bready,
-- AXI4-Full read address channel
s01_axi_arid	    => axi_if.read_address_channel.arid     ,
s01_axi_araddr	    => axi_if.read_address_channel.araddr	,
s01_axi_arlen	    => axi_if.read_address_channel.arlen	,
s01_axi_arsize	    => axi_if.read_address_channel.arsize	,
s01_axi_arburst	    => axi_if.read_address_channel.arburst	,
s01_axi_arlock	    => axi_if.read_address_channel.arlock	,
s01_axi_arcache	    => axi_if.read_address_channel.arcache	,
s01_axi_arprot	    => axi_if.read_address_channel.arprot	,
s01_axi_arqos	    => axi_if.read_address_channel.arqos	,
s01_axi_arregion    => axi_if.read_address_channel.arregion,
s01_axi_aruser	    => axi_if.read_address_channel.aruser	,
s01_axi_arvalid	    => axi_if.read_address_channel.arvalid	,
s01_axi_arready	    => axi_if.read_address_channel.arready	,
-- AXI4-Full read data channel
s01_axi_rid	        => axi_if.read_data_channel.rid	    ,
s01_axi_rdata	    => axi_if.read_data_channel.rdata,
s01_axi_rresp	    => axi_if.read_data_channel.rresp,
s01_axi_rlast	    => axi_if.read_data_channel.rlast,
s01_axi_ruser	    => axi_if.read_data_channel.ruser,
s01_axi_rvalid	    => axi_if.read_data_channel.rvalid,
s01_axi_rready	    => axi_if.read_data_channel.rready
);

-----------------------------------------------------------------------------
-- Clock Generator
-----------------------------------------------------------------------------
clock_generator(clk, c_clkperiod, c_clock_high_percentage);

------------------------------------------------
-- PROCESS: p_main
------------------------------------------------
p_main: process
    constant C_SCOPE        : string    := C_TB_SCOPE_DEFAULT;
    variable v_time_stamp   : time      := 0 ns;
    variable v_data         : std_logic_vector(c_axi_data_width-1 downto 0);
    variable v_addr         : unsigned(c_axi_addr_width- 1 downto 0);

    variable v_data_axifull : t_slv_array(0 to 0)(c_axifull_data_width-1 downto 0);
    variable v_addr_axifull : unsigned(c_axifull_addr_width- 1 downto 0);    
    variable v_wstrb_value  : t_slv_array(0 to 0)(3 downto 0);
    variable v_wuser_value  : t_slv_array(0 to 0)(0 downto 0);

    variable v_buser_value : std_logic_vector(c_axifull_user_width-1 downto 0);
    variable v_bresp_value : uvvm_util.axi_bfm_pkg.t_xresp;
    variable v_awlen_value : unsigned(7 downto 0);

    variable v_data_exp    : std_logic_vector(7 downto 0);    

    -----------------------------------------------------------------------------
    -- AXI4-Lite Internal Procedures
    procedure axilite_write (
      constant addr_value : in unsigned;
      constant data_value : in std_logic_vector;
      constant msg        : in string) is
    begin

    axilite_write(
        addr_value,             -- keep as is
        data_value,             -- keep as is
        msg,                    -- keep as is
        clk,                    -- Clock signal
        axilite_if,             -- Signal must be visible in local process scope
        C_SCOPE,                -- Just use the default
        shared_msg_id_panel,    -- Use global, shared msg_id_panel
        axilite_bfm_config      -- Use locally defined configuration or C_AXILITE_BFM_CONFIG_DEFAULT
    );              

    end;    

    -----------------------------------------------------------------------------
    procedure axilite_check (
      constant addr_value : in unsigned;
      constant data_exp   : in std_logic_vector;
      constant msg        : in string) is
    begin

        axilite_check(
            addr_value,             -- keep as is
            data_exp,               -- keep as is
            msg,                    -- keep as is
            clk,                    -- Clock signal
            axilite_if,             -- Signal must be visible in local process scope
            alert_level,            -- alert level
            C_SCOPE,                -- Just use the default
            shared_msg_id_panel,    -- Use global, shared msg_id_panel
            axilite_bfm_config      -- Use locally defined configuration or C_AXILITE_BFM_CONFIG_DEFAULT
        );                          
    end;

    -----------------------------------------------------------------------------
    -- AXI4-Full Internal Procedures
    procedure axi_write (
      constant addr_value : in unsigned;
      constant data_value : in t_slv_array;
      constant msg        : in string) is
    begin       
    
    v_wstrb_value(0)    := "1111";
    v_wuser_value(0)    := (others => '0');
    v_awlen_value       := (others => '0');
    v_buser_value       := "0";

    axi_write(
        awid_value      => "0",       -- Setting a default value
        awaddr_value    => addr_value,  -- keep as is
        awlen_value     => v_awlen_value,       -- Set to length=1
        awsize_value    => 4,           -- Setting a default value
        awburst_value   => INCR,        -- Setting a default value
        awlock_value    => NORMAL,      -- Setting a default value
        awcache_value   => "0000",      -- Setting a default value
        awprot_value    => UNPRIVILEGED_NONSECURE_DATA, -- Setting a default value
        awqos_value     => "0000",      -- Setting a default value
        awregion_value  => "0000",      -- Setting a default value
        awuser_value    => "0",       -- Setting a default value
        wdata_value     => data_value,  -- keep as is
        wstrb_value     => v_wstrb_value,         -- Setting a default value        
        wuser_value     => v_wuser_value,       -- Setting a default value        
        buser_value     => v_buser_value, -- Assigning to a local variable
        bresp_value     => v_bresp_value, -- Assigning to a local variable
        msg             => msg,         -- keep as is
        clk             => clk,         -- Clock signal
        axi_if          => axi_if,      -- Signal must be visible in local process scope
        scope           => C_SCOPE,     -- Setting a default value
        msg_id_panel    => shared_msg_id_panel,     -- Use global, shared msg_id_panel
        config          => C_AXI_BFM_CONFIG_DEFAULT   -- Use locally defined configuration or C_AXI_BFM_CONFIG_DEFAULT
    );              

    end;     

    -----------------------------------------------------------------------------
    -- UART Internal Procedures   
    procedure uart_expect (
        constant data_exp           : in std_logic_vector;
        constant msg                : in string) is 
    begin
        uart_expect (
            data_exp        => data_exp,
            msg             => msg,
            rx              => tx_o,
            terminate_loop  => terminate_loop,
            max_receptions  => 1,
            timeout         => -1 ns,
            alert_level     => ERROR,
            config          => uart_bfm_config,
            scope           => C_SCOPE,
            msg_id_panel    => shared_msg_id_panel
        );
    end; 

    -----------------------------------------------------------------------------
    -- BEGIN STIMULI
    -----------------------------------------------------------------------------
begin

    -- axi lite initializations
    axilite_bfm_config.clock_period     <= c_clkperiod;
    -- axi full initializations
    axi_bfm_config.clock_period         <= c_clkperiod;
    -- uart initializations
    uart_bfm_config.bit_time            <= 8.68 us;
    uart_bfm_config.num_data_bits       <= 8;
    uart_bfm_config.idle_state          <= '1';
    uart_bfm_config.num_stop_bits       <= STOP_BITS_TWO;
    uart_bfm_config.parity              <= PARITY_NONE;
    uart_bfm_config.timeout             <= 0 ns;
    uart_bfm_config.timeout_severity    <= error;
    wait for 1 ps;


    -- Print the configuration to the log
    -- report_global_ctrl(VOID);
    -- report_msg_id_panel(VOID);

    --enable_log_msg(ALL_MESSAGES);
    disable_log_msg(ALL_MESSAGES);
    --enable_log_msg(ID_LOG_HDR);

    log(ID_LOG_HDR, "Start Simulation of TB for custom AXI4 IP", C_SCOPE);

    -- release active-low resetn signal 
    resetn  <= '0';
    wait for c_clkperiod*10;
    resetn  <= '1';
    wait for c_clkperiod*10;

    -- initialize AXI signals with functions
    axilite_if  <= init_axilite_if_signals(c_axi_addr_width,c_axi_data_width);
    axi_if      <= init_axi_if_signals(c_axifull_addr_width,c_axifull_data_width,c_axifull_id_width,c_axifull_user_width);
    wait for c_clkperiod;
    
    -- write 256 bytes to AXI4-Full interface starting from address 0
    for i in 0 to 63 loop
        v_addr_axifull  := to_unsigned((c_axifull_base_addr+i*4), c_axifull_addr_width);
        -- crazy but modelsim gave error when I try concat unsigned parameters !!!
        v_data_axifull(0)  :=   std_logic_vector(to_unsigned(i*4+3,8)) & 
                                std_logic_vector(to_unsigned(i*4+2,8)) &
                                std_logic_vector(to_unsigned(i*4+1,8)) & 
                                std_logic_vector(to_unsigned(i*4+0,8)
                                );
        axi_write(v_addr_axifull,v_data_axifull,"");
        wait for c_clkperiod*4;
    end loop;

    -- write length of the packet
    v_addr  := c_reg0_addr;
    v_data  :=  x"00000100";
    axilite_write(v_addr, v_data, "");    
    wait for c_clkperiod*4;    

    -- trigger packet transmission
    v_addr  := c_reg1_addr;
    v_data  :=  x"000000BA";
    axilite_write(v_addr, v_data, "");
    wait for 1 ps;    

    for i in 0 to 255 loop 
        v_data_exp  := std_logic_vector(to_unsigned(i,8));
        wait for 1 ps;
        uart_expect(v_data_exp,"");
        wait for 1 ps;
    end loop;    

    -- clear trigger
    v_addr  := c_reg1_addr;
    v_data  :=  x"00000000";
    axilite_write(v_addr, v_data, "");
    wait for c_clkperiod*4;    

    -- change first 8 bytes to be transmitted
    v_addr_axifull  := to_unsigned((c_axifull_base_addr), c_axifull_addr_width);    
    v_data_axifull(0)  := x"BA0321F1";
    axi_write(v_addr_axifull,v_data_axifull,"");
    wait for c_clkperiod*4;

    v_addr_axifull  := to_unsigned((c_axifull_base_addr+4), c_axifull_addr_width);    
    v_data_axifull(0)  := x"3129A5BD";
    axi_write(v_addr_axifull,v_data_axifull,"");
    wait for c_clkperiod*4;

    wait for 100 us;

    -- write length of the packet
    v_addr  := c_reg0_addr;
    v_data  :=  x"00000008";
    axilite_write(v_addr, v_data, "");    
    wait for c_clkperiod*4;    

    -- trigger packet transmission
    v_addr  := c_reg1_addr;
    v_data  :=  x"000000BA";
    axilite_write(v_addr, v_data, "");
    wait for 1 ps;    

    -- call uart_expect function
    v_data_exp  := x"F1"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;    
    v_data_exp  := x"21"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;    
    v_data_exp  := x"03"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;    
    v_data_exp  := x"BA"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;    
    v_data_exp  := x"BD"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;    
    v_data_exp  := x"A5"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;    
    v_data_exp  := x"29"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;    
    v_data_exp  := x"31"; wait for 1 ps; uart_expect(v_data_exp,""); wait for 1 ps;        

    -- clear trigger
    v_addr  := c_reg1_addr;
    v_data  :=  x"00000000";
    axilite_write(v_addr, v_data, "");
    wait for c_clkperiod*4;   

    wait for 1 ps;

    --==================================================================================================
    -- Ending the simulation
    --------------------------------------------------------------------------------------
    wait for 1000 ns;             -- to allow some time for completion
    report_alert_counters(FINAL); -- Report final counters and print conclusion for simulation (Success/Fail)
    log(ID_LOG_HDR, "SIMULATION COMPLETED", C_SCOPE);

    -- Finish the simulation
    std.env.stop;
    wait;  -- to stop completely

end process p_main;

end architecture;