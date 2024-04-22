library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;
use std.env.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

use uvvm_util.axilite_bfm_pkg.all;

use std.textio.all;
use std.env.finish;

entity tb_axilite is
end tb_axilite;

architecture sim of tb_axilite is

-- CONSTANTS
constant c_clkperiod                : time := 10 ns;
constant c_clkfreq                  : integer := 100_000_000;
constant c_clock_high_percentage    : integer := 50;
constant c_axi_addr_width           : integer := 4;
constant c_axi_data_width           : integer := 32;
constant c_reg0_addr                : unsigned (c_axi_addr_width-1 downto 0) := x"0";
constant c_reg1_addr                : unsigned (c_axi_addr_width-1 downto 0) := x"4";

signal clk			        : std_logic := '0';
signal resetn			    : std_logic := '0';
signal sw_i                 : std_logic_vector (7 downto 0) := (others => '0');
signal led_o                : std_logic_vector (7 downto 0);

-- axilite_bfm signals
signal axilite_if           : t_axilite_if(
    write_address_channel(
        awaddr(c_axi_addr_width-1 downto 0)
        ),
    write_data_channel(
        wdata(c_axi_data_width-1 downto 0),
        wstrb(4-1 downto 0)
        ),
    read_address_channel(
        araddr(c_axi_addr_width-1 downto 0)
    ),
    read_data_channel(
        rdata(c_axi_data_width-1 downto 0)
    )
);
signal axilite_bfm_config   : t_axilite_bfm_config := C_AXILITE_BFM_CONFIG_DEFAULT;
signal alert_level : t_alert_level := error;

begin

DUT : entity work.mba_ledsw_v1_0 
generic map(
-- Parameters of Axi Slave Bus Interface S00_AXI
C_S00_AXI_DATA_WIDTH	=> c_axi_data_width,
C_S00_AXI_ADDR_WIDTH	=> c_axi_addr_width
)
port map(
-- Users to add ports here
sw_i 	=> sw_i,
led_o 	=> led_o,
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
s00_axi_rready	=> axilite_if.read_data_channel.rready
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

begin

    -- axi lite initializations
    axilite_bfm_config.clock_period     <= c_clkperiod;
    wait for 1 ps;


    -- Print the configuration to the log
    -- report_global_ctrl(VOID);
    -- report_msg_id_panel(VOID);

    --enable_log_msg(ALL_MESSAGES);
    disable_log_msg(ALL_MESSAGES);
    --enable_log_msg(ID_LOG_HDR);

    log(ID_LOG_HDR, "Start Simulation of TB for custom axi lite IP", C_SCOPE);

    -- release active-low resetn signal 
    resetn  <= '0';
    wait for c_clkperiod*10;
    resetn  <= '1';
    wait for c_clkperiod*10;

    -- initialize axi lite signals
    axilite_if <= init_axilite_if_signals(c_axi_addr_width,c_axi_data_width);
    wait for c_clkperiod;

    -- assign a value to switches    
    sw_i    <= x"3C";
    wait for c_clkperiod*10;

    -- read the switch value and check, which is the reg0 of axi lite registers
    v_addr  := c_reg0_addr;
    v_data  :=  x"0000003C";
    axilite_check(v_addr, v_data, "0x3C expected");
    wait for c_clkperiod*10;

    -- write switch value to leds register, which is reg1 of axi lite registers
    v_addr  := c_reg1_addr;
    v_data  :=  x"0000003C";
    axilite_write(v_addr, v_data, "0x3C is written");    
    wait for c_clkperiod*10;

    -- check led value, which must be 0x3C
    check_value(led_o, x"3C", ERROR, "");
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