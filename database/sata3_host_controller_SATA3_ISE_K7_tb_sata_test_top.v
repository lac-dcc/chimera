`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////
//  Project     : SATA Host controller
//  Title       : Sata test top
//  File name   : sata_test_top.v
//  Note        : This is the top module which connects SATA controller, 
//                Microblaze System and SATA test logic.
//  Dependencies   : 
/////////////////////////////////////////////////////////////////////////////// 

module sata_test_top(
    input           RS232_Uart_1_sin,
    output          RS232_Uart_1_sout,
    input           CLK_P,
    input           CLK_N,
    input           RESET,
    output          sm_fan_pwm_net_vcc,
    
    input           TILE0_REFCLK_PAD_P_IN,  // MGTCLKA,  clocks GTP_X0Y0-2 
    input           TILE0_REFCLK_PAD_N_IN,  // MGTCLKA 
    input           GTPRESET_IN,            // GTP initialization
    output          TILE0_PLLLKDET_OUT,     // GTP PLL locked

    output          TXP0_OUT,               // SATA Connector TX P pin
    output          TXN0_OUT,               // SATA Connector TX N pin
    input           RXP0_IN,                // SATA Connector RX P pin
    input           RXN0_IN,                // SATA Connector RX N pin
      
    output          DCMLOCKED_OUT,          // PHY Layer DCM locked
    output          LINKUP,                 // SATA PHY initialisation completed LINK UP
    output    [1:0] GEN,                    // 1 when a SATA2 device detected, 0 when SATA1 device detected
 // output          PHY_CLK_OUT,            // PHY layer clock out
 // output          CLK_OUT,                // LINK and Transport Layer clock out CLK_OUT = PHY_CLK_OUT / 2 
 // output          WR_EN,  
 // output          RD_EN,
 // output          MB2IP_Clk_pin,          // Microblaze clock out (for testing)
    input           OOB_reset_IN,
    input           RX_FSM_reset_IN,
    input           TX_FSM_reset_IN
 
  );

  wire [31:0]  MB2IP_Addr_pin;
  wire         MB2IP_CS_pin;
  wire         MB2IP_RNW_pin;
  wire [31:0]  MB2IP_Data_pin;
  wire [31:0]  IP2mb_Data_pin;
  wire         IP2MB_RdAck_pin;
  wire         IP2MB_WrAck_pin;
  wire         IP2MB_Error_pin;
  wire [3:0]   MB2IP_BE_pin;
  wire         MB2IP_Clk_pin;
//wire         CLK_OUT;
  
  /*wire         mb_rst_0;
  reg          mb_rst_1;
  reg          mb_rst_2;
  reg          mb_rst_3;
  wire         mb_rst_debounce;
  reg          fpga_0_rst_1_sys_rst_pin_1;
  reg          fpga_0_rst_1_sys_rst_pin_2;*/
  
  wire         int_rd_en; 
  wire         int_wr_en ; 
  wire         wr_hold_out;
  wire         rd_hold_out;
  wire [56:0]  address_in;
  wire [31:0]  data_in;
  wire [31:0]  data_out;
  wire         usr_clock;
  wire         usr_reset;
  wire         wr_done;
  wire         sata_ctrl_reset_out;
    
 /* always @(posedge fpga_0_clk_1_sys_clk_pin)
  begin
   fpga_0_rst_1_sys_rst_pin_1 <= fpga_0_rst_1_sys_rst_pin;
   fpga_0_rst_1_sys_rst_pin_2 <= fpga_0_rst_1_sys_rst_pin_1;
  end
    
  assign mb_rst_0 = fpga_0_rst_1_sys_rst_pin_2;  

  always @(posedge fpga_0_clk_1_sys_clk_pin)
  begin
   mb_rst_1 <= mb_rst_0;
   mb_rst_2 <= mb_rst_1;
   mb_rst_3 <= mb_rst_2;
  end

  assign mb_rst_debounce = (mb_rst_1 & mb_rst_2 & mb_rst_3);*/
      
    //assign data_out = trnsp_to_host_data;
  //assign data_out = dma_rqst? dma_rx_data_out : trnsp_to_host_data;
  
  
    (* BOX_TYPE = "user_black_box" *)
    system mb_system (
    .sm_fan_pwm_net_vcc                 ( sm_fan_pwm_net_vcc ),
    .RS232_Uart_1_sout                  ( RS232_Uart_1_sout ),
    .RS232_Uart_1_sin                   ( RS232_Uart_1_sin ),
    .RESET                              ( RESET ),
    .CLK_P                              ( CLK_P ),
    .CLK_N                              ( CLK_N ),
    
    .sata_test_logic_0_MB2IP_Clk_pin    (MB2IP_Clk_pin), 
    .sata_test_logic_0_MB2IP_Reset_pin  (MB2IP_Reset_pin), 
    .sata_test_logic_0_MB2IP_Addr_pin   (MB2IP_Addr_pin), 
    .sata_test_logic_0_MB2IP_CS_pin     (MB2IP_CS_pin), 
    .sata_test_logic_0_MB2IP_RNW_pin    (MB2IP_RNW_pin), 
    .sata_test_logic_0_MB2IP_Data_pin   (MB2IP_Data_pin), 
    .sata_test_logic_0_MB2IP_BE_pin     (MB2IP_BE_pin), 
    .sata_test_logic_0_IP2mb_Data_pin   (IP2mb_Data_pin), 
    .sata_test_logic_0_IP2MB_RdAck_pin  (IP2MB_RdAck_pin), 
    .sata_test_logic_0_IP2MB_WrAck_pin  (IP2MB_WrAck_pin), 
    .sata_test_logic_0_IP2MB_Error_pin  (IP2MB_Error_pin)
    );
    

  // Instantiate the module
  SATA_WRAPPER SATA_WRAPPER1(
  
    .TILE0_REFCLK_PAD_P_IN  (TILE0_REFCLK_PAD_P_IN), 
    .TILE0_REFCLK_PAD_N_IN  (TILE0_REFCLK_PAD_N_IN), 
    .GTP_RESET_IN           (sata_ctrl_reset_out),       //(GTPRESET_IN),  
    .TILE0_PLLLKDET_OUT     (TILE0_PLLLKDET_OUT), 
    .TXP0_OUT               (TXP0_OUT), 
    .TXN0_OUT               (TXN0_OUT), 
    .RXP0_IN                (RXP0_IN), 
    .RXN0_IN                (RXN0_IN), 
    .DCMLOCKED_OUT          (DCMLOCKED_OUT), 
    .LINKUP                 (LINKUP), 
    .GEN                    (GEN), 
 // .PHY_CLK_OUT            (PHY_CLK_OUT), 
 // .CLK_OUT                (CLK_OUT), 
        
    .ADDRESS_IN             (address_in),			 
    .WR_EN_IN               (int_wr_en),           
    .RD_EN_IN               (int_rd_en),          
    .DATA_IN                (data_in),         
    .DATA_OUT               (data_out),         
    .USR_CLOCK              (usr_clock),    
    .USR_RESET              (usr_reset),            
    .WR_HOLD_OUT            (wr_hold_out),  
    .RD_HOLD_OUT            (rd_hold_out),
    .WR_DONE                (wr_done),
    .OOB_reset_IN           (OOB_reset_IN),
    .RX_FSM_reset_IN        (RX_FSM_reset_IN),
		.TX_FSM_reset_IN        (TX_FSM_reset_IN)    
    
  );                                                       
    
TEST_LOGIC TEST_LOGIC1(
  .MB_ADRESS           (MB2IP_Addr_pin),
  .MB_CS               (MB2IP_CS_pin),
  .MB_RNW              (MB2IP_RNW_pin),
  .MB_DATA_IN          (MB2IP_Data_pin),
  .MB_DATA_OUT         (IP2mb_Data_pin),
  .MB_CLK              (MB2IP_Clk_pin),
  .MB_RESET            (MB2IP_Reset_pin),
  .MB_RD_ACK           (IP2MB_RdAck_pin),
  .RD_EN_IN            (int_rd_en), 
  .WR_EN_IN            (int_wr_en),
  .WR_HOLD_OUT         (wr_hold_out),
  .RD_HOLD_OUT         (rd_hold_out),
  .WR_DONE             (wr_done),
  .ADDRESS_IN          (address_in),
  .DATA_IN             (data_in),
  .DATA_OUT            (data_out),
  .USR_CLOCK           (usr_clock),
  .USR_RESET           (usr_reset),
  .SATA_CTRL_RESET_OUT (sata_ctrl_reset_out),
  .GTX_RESET_IN        (GTPRESET_IN) 
);




    assign IP2MB_WrAck_pin = MB2IP_CS_pin && !MB2IP_RNW_pin;
    assign IP2MB_Error_pin = 0;



endmodule
