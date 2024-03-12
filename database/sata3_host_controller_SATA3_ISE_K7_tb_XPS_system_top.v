//-----------------------------------------------------------------------------
// system_top.v
//-----------------------------------------------------------------------------

module system_top
  (
    sm_fan_pwm_net_vcc,
    RS232_Uart_1_sout,
    RS232_Uart_1_sin,
    RESET,
    CLK_P,
    CLK_N,
    sata_test_logic_0_IP2mb_Data_pin,
    sata_test_logic_0_IP2MB_RdAck_pin,
    sata_test_logic_0_IP2MB_WrAck_pin,
    sata_test_logic_0_MB2IP_BE_pin,
    sata_test_logic_0_MB2IP_RNW_pin,
    sata_test_logic_0_MB2IP_Addr_pin,
    sata_test_logic_0_MB2IP_Data_pin,
    sata_test_logic_0_MB2IP_CS_pin,
    sata_test_logic_0_IP2MB_Error_pin,
    sata_test_logic_0_MB2IP_Clk_pin,
    sata_test_logic_0_MB2IP_Reset_pin
  );
  output sm_fan_pwm_net_vcc;
  output RS232_Uart_1_sout;
  input RS232_Uart_1_sin;
  input RESET;
  input CLK_P;
  input CLK_N;
  input [0:31] sata_test_logic_0_IP2mb_Data_pin;
  input sata_test_logic_0_IP2MB_RdAck_pin;
  input sata_test_logic_0_IP2MB_WrAck_pin;
  output [0:3] sata_test_logic_0_MB2IP_BE_pin;
  output sata_test_logic_0_MB2IP_RNW_pin;
  output [0:31] sata_test_logic_0_MB2IP_Addr_pin;
  output [0:31] sata_test_logic_0_MB2IP_Data_pin;
  output [0:0] sata_test_logic_0_MB2IP_CS_pin;
  input sata_test_logic_0_IP2MB_Error_pin;
  output sata_test_logic_0_MB2IP_Clk_pin;
  output sata_test_logic_0_MB2IP_Reset_pin;

  (* BOX_TYPE = "user_black_box" *)
  system
    system_i (
      .sm_fan_pwm_net_vcc ( sm_fan_pwm_net_vcc ),
      .RS232_Uart_1_sout ( RS232_Uart_1_sout ),
      .RS232_Uart_1_sin ( RS232_Uart_1_sin ),
      .RESET ( RESET ),
      .CLK_P ( CLK_P ),
      .CLK_N ( CLK_N ),
      .sata_test_logic_0_IP2mb_Data_pin ( sata_test_logic_0_IP2mb_Data_pin ),
      .sata_test_logic_0_IP2MB_RdAck_pin ( sata_test_logic_0_IP2MB_RdAck_pin ),
      .sata_test_logic_0_IP2MB_WrAck_pin ( sata_test_logic_0_IP2MB_WrAck_pin ),
      .sata_test_logic_0_MB2IP_BE_pin ( sata_test_logic_0_MB2IP_BE_pin ),
      .sata_test_logic_0_MB2IP_RNW_pin ( sata_test_logic_0_MB2IP_RNW_pin ),
      .sata_test_logic_0_MB2IP_Addr_pin ( sata_test_logic_0_MB2IP_Addr_pin ),
      .sata_test_logic_0_MB2IP_Data_pin ( sata_test_logic_0_MB2IP_Data_pin ),
      .sata_test_logic_0_MB2IP_CS_pin ( sata_test_logic_0_MB2IP_CS_pin[0:0] ),
      .sata_test_logic_0_IP2MB_Error_pin ( sata_test_logic_0_IP2MB_Error_pin ),
      .sata_test_logic_0_MB2IP_Clk_pin ( sata_test_logic_0_MB2IP_Clk_pin ),
      .sata_test_logic_0_MB2IP_Reset_pin ( sata_test_logic_0_MB2IP_Reset_pin )
    );

endmodule

