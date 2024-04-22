library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library STD;
use std.env.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

use uvvm_util.uart_bfm_pkg.all;

use std.textio.all;
use std.env.finish;

entity tb_high_speed_uart is
end tb_high_speed_uart;

architecture sim of tb_high_speed_uart is

-- CONSTANTS
constant c_clkperiod100             : time := 10 ns;
constant c_clkperiod250             : time := 4 ns;
constant c_clkfreq100               : integer := 100_000_000;
constant c_clkfreq250               : integer := 250_000_000;
constant c_baudrate                 : integer := 50_000_000;
constant c_clock_high_percentage    : integer := 50;

signal clk100	: std_logic := '0';
signal clk250	: std_logic := '0';
signal rx_i		: std_logic := '1';
signal tx_o		: std_logic;

signal uart_bfm_config      : t_uart_bfm_config := C_UART_BFM_CONFIG_DEFAULT;
signal terminate_loop       : std_logic := '0';


begin

DUT : entity work.high_speed_uart 
generic map(
c_sysclkfreq	=> c_clkfreq100,
c_uartclkfreq	=> c_clkfreq250,
c_baudrate		=> c_baudrate,
c_stopbit		=> 2
)
port map(
clk100		=> clk100	,
clk250		=> clk250	,
rx_i		=> rx_i	,
tx_o		=> tx_o	
);

-----------------------------------------------------------------------------
-- Clock Generator
-----------------------------------------------------------------------------
clock_generator(clk100, c_clkperiod100, c_clock_high_percentage);
clock_generator(clk250, c_clkperiod250, c_clock_high_percentage);

------------------------------------------------
-- PROCESS: p_main
------------------------------------------------
p_main: process
    constant C_SCOPE        : string  := C_TB_SCOPE_DEFAULT;
    variable v_time_stamp   : time := 0 ns;
    variable recv_byte      : std_logic_vector (7 downto 0) := (others => '0');
    variable xmit_byte      : std_logic_vector (7 downto 0) := (others => '0');
begin

    -- uart initializations
    uart_bfm_config.bit_time            <= 20 ns;
    uart_bfm_config.num_data_bits       <= 8;
    uart_bfm_config.idle_state          <= '1';
    uart_bfm_config.num_stop_bits       <= STOP_BITS_ONE;
    uart_bfm_config.parity              <= PARITY_NONE;
    uart_bfm_config.timeout             <= 0 ns;
    uart_bfm_config.timeout_severity    <= error;
    wait for 1 ps;


    -- Print the configuration to the log
    report_global_ctrl(VOID);
    report_msg_id_panel(VOID);

    -- enable_log_msg(ALL_MESSAGES);
    --disable_log_msg(ALL_MESSAGES);
    --enable_log_msg(ID_LOG_HDR);

    log(ID_LOG_HDR, "Start Simulation of TB for HIGH_SPEED_UART", C_SCOPE);

    for i in 0 to 255 loop
        xmit_byte       := CONV_STD_LOGIC_VECTOR(i,8);
        wait for 1 ps;
        uart_transmit(
            xmit_byte,          -- data_value
            "data transmitted", -- msg 
            rx_i,               -- tx
            uart_bfm_config,    -- config
            C_SCOPE,            -- scope
            shared_msg_id_panel -- msg_id_panel
            );

        wait for 1 ps;
        
        uart_expect(
            xmit_byte,
            "data transmitted", -- msg 
            tx_o,                   -- rx
            terminate_loop,         -- terminate_loop
            1,  -- max_receptions
            -1 ns, -- timeout
            ERROR, -- alert_level
            uart_bfm_config,        -- config
            C_SCOPE,                -- scope
            shared_msg_id_panel    -- msg_id_panel
            );            



        --uart_receive(
        --    recv_byte,              -- data_value                          
        --    "data received",        -- msg                            
        --    tx_o,                   -- rx
        --    terminate_loop,         -- terminate_loop
        --    uart_bfm_config,        -- config
        --    C_SCOPE,                -- scope
        --    shared_msg_id_panel,    -- msg_id_panel
        --    ""                      -- ext_proc_call
        --);

        -- check_value(xmit_byte, recv_byte, ERROR, "Transmit byte = " & to_string(xmit_byte,HEX) & " Received byte = " & to_string(recv_byte,HEX));
        wait for 1 ps;
    end loop;

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